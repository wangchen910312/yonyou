<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- <div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template" data-click="">
  </ul>
</div> -->
<div data-role="view" >
  <ul data-role="listview"  data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" id="subListView1" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:35%" class="checkImg"></span>
    <span style="width:35%">#:addrTpchg(addrTp)#</span>
    <span style="width:100%">#:trimNull(sungNm) # / #:trimNull(cityNm) # / #:trimNull(distNm)#</span>
    <span class="clboth" style="width:100%">#:trimNull(addrDetlCont)#</span>
    <span class="delete">
        <span class="btn_del" onclick="javascript:removeItem(this);" ><spring:message code='global.lbl.del' /></span>
    </span>
</div>
</script>
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;
var _rowTotal=0;
var data = [];



var listData = new kendo.data.DataSource({
      transport:{
          read:{
              url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
              ,dataType:"json"
              ,type:"POST"
              ,contentType:"application/json"
          }
          ,parameterMap:function(options, operation) {
              if (operation === "read") {

                  var params = {};

                  var refTableNm  = "";
                  var refKeyNm = "";

                  var parentUrl = parent.document.location.href;
                  if(parentUrl.indexOf("ShowRoom") > -1){
                      //전시장흐름
                      refTableNm = "CR_0214T";
                      refKeyNm = parent.$("#seq").val();
                  }else if (parentUrl.indexOf("selectStep04PrevSalesOpptShowRoomPopup.jsp") > -1 ){
                      //전시장흐름 데이터가 실패일 경우
                      refTableNm = "CR_0211T";
                      refKeyNm = parent.$("#seq").val();
                  }else{
                      refTableNm = "CR_0101T";
                      refKeyNm = parent.$("#custNo").val();
                  }

                  params["recordCountPerPage"] = options.pageSize;
                  params["pageIndex"] = options.page;
                  params["firstIndex"] = options.skip;
                  params["lastIndex"] = options.skip + options.take;
                  params["sort"] = options.sort;

                  params["sRefTableNm"] = refTableNm;
                  params["sRefKeyNm"] = refKeyNm;

                    console.log("aaaaaaaaa",params);

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
              id:"seq"
              ,fields:{
                  seq:{type:"string", editable:false}
                  ,useYn:{type:"string", editable:true}
                  ,addrTp:{type:"string", editable:true}
                  ,zipCd:{type:"string", editable:false}
                  ,sungCd:{type:"string", editable:false}
                  ,cityCd:{type:"string", editable:false}
                  ,distCd:{type:"string", editable:false}
                  ,sungNm:{type:"string", editable:false}
                  ,cityNm:{type:"string", editable:false}
                  ,distNm:{type:"string", editable:false}
                  ,addrNm:{type:"string", editable:true}
                  ,addrDetlCont:{type:"string", editable:true}
                  ,flagYn:{type:"string", editable:true}
                  ,refTableNm:{type:"string", editable:false}
                  ,refKeyNm:{type:"string", editable:true}
              }
          }
      },
      change:function(e) {
          var rTotal = 0;
          rTotal = e.items.length;
          if(_rowTotal==0)_rowTotal=rTotal;//처음 주소 갯수
          setTimeout(function(){
            if(rTotal > 0){
              parent.setSubListHeightNew("addressList",3,_rowTotal);
              $("body").contents().find(".checkImg").each(function(cnt){
                  $("body").contents().find(".checkImg:eq(0)").html("<img src='<c:url value='/resources/img/mob/ico_check.png' />' width='20px;'>");
                  parent.$("#addrNm").text(trimNull(e.items[0].sungNm)+ " / "+trimNull(e.items[0].cityNm)+ " / "+trimNull(e.items[0].distNm));
                  parent.$("#addrNmDetail").text(trimNull(e.items[0].addrDetlCont));
              });
            }else{
                parent.$("#addrNm").text("");
                parent.$("#addrNmDetail").text("");
                checklistCnt("addressList_noData", 0, noDatamsg);
            }
          }, 200);

            checklistCnt("addressList_noData",this.total(),noDatamsg);
        }
        ,error:function(e){
          parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
});


chgBuyYnMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.chgBuyYnMap[val];
    }
    return returnVal;
}
addrTpchg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.addrTpMap[val];
    }
    return returnVal;
}


//추가
function addItemSubList1(data){
    _rowTotal++;
    var subListView1 = $("#subListView1").data("kendoMobileListView");

    var refTableNm  = "";
    var refKeyNm = "";

    var parentUrl = parent.document.location.href;
    if(parentUrl.indexOf("ShowRoom") > -1){
        //전시장흐름
        refTableNm = "CR_0214T";
        refKeyNm = parent.$("#seq").val();
    }else{
        refTableNm = "CR_0101T";
        refKeyNm = parent.$("#custNo").val();
    }
    
    for(var i=0; i<subListView1.dataSource._data.length; i++){
        subListView1.dataSource._data[i].flagYn="N";
    }

    subListView1.dataSource.insert({
        "flagYn"            :"Y"
        , "addrTp"          :data.addrTp
        , "zipCd"           :data.zipCd
        , "sungNm"          :data.sungNm
        , "cityNm"          :data.cityNm
        , "distNm"          :data.distNm
        , "addrNm"          :""
        , "addrDetlCont"    :data.addrDetlCont
        , "useYn"           :"Y"
        , "sungCd"          :data.sungCd
        , "cityCd"          :data.cityCd
        , "distCd"          :data.distCd
        , "refTableNm"      :refTableNm                  //참조테이블
        , "refKeyNm"        :refKeyNm                     // 참조 키
    });
    
    subListView1.refresh();
    parent.setSubListHeightNew("addressList",3,_rowTotal);

    //저장
    //parent.saveAddressList();
}

//삭제
function removeItem(obj){
    _rowTotal--;
    var uid = $(obj).parent().parent().parent().attr("data-uid");
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        if($(item).attr("data-uid") == uid){
            return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[--idx]);
    listView.refresh();
    
    if(listData.data().length>0){
        listData.data()[0].flagYn="Y";
        listData.data()[0].dirty=true;
        $(obj).parent().parent().parent().parent().find(".checkImg").html("<img src='<c:url value='/resources/img/mob/ico_check.png' />' width='20px;'>");
        parent.$("#addrNm").text(trimNull(listData.data()[0].sungNm)+ " / "+trimNull(listData.data()[0].cityNm)+ " / "+trimNull(listData.data()[0].distNm));
        parent.$("#addrNmDetail").text(trimNull(listData.data()[0].addrDetlCont));
        parent.setSubListHeightNew("addressList",3,_rowTotal);
    }else{
        parent.$("#addrNm").text("");
        parent.$("#addrNmDetail").text("");
        checklistCnt("addressList_noData", 0, noDatamsg);
    }
    //저장
    //parent.saveAddressList();
    
}
function listViewClick(e)
{
    $("body").contents().find(".checkImg").each(function(cnt){
        $("body").contents().find(".checkImg").html("");
    });
    
    var listView = $("#subListView1").data("kendoMobileListView");
    for(var i=0; i<listView.dataSource._data.length; i++){
        if(listView.dataSource._data[i].uid==e.dataItem.uid){
            listView.dataSource._data[i].flagYn="Y";
            listView.dataSource._data[i].dirty=true;
        }else{
            listView.dataSource._data[i].flagYn="N";
            listView.dataSource._data[i].dirty=true;
        }
    }
    
    $(e.item[0]).find(".checkImg").html("<img src='<c:url value='/resources/img/mob/ico_check.png' />' width='20px;'>");
    parent.$("#addrNm").text(trimNull(e.dataItem.sungNm)+ " / "+trimNull(e.dataItem.cityNm)+ " / "+trimNull(e.dataItem.distNm));
    parent.$("#addrNmDetail").text(trimNull(e.dataItem.addrDetlCont));
}


var app = setKendoMobApp();

</script>

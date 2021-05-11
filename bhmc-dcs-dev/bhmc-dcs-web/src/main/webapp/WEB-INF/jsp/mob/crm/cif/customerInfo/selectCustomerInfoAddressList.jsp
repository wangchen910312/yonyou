<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template" data-click="">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:25%">#:chgBuyYnMap(useYn)#</span>
    <span style="width:25%">#:addrTpchg(addrTp)#</span>
    <span style="width:50%">#:zipCd #</span>
    <span class="clboth" style="width:25%">#:sungNm #</span>
    <span style="width:25%">#:cityNm #</span>
    <span style="width:25%">#:distNm#</span>
    <span style="width:25%">#:zipCd#</span>
    <span class="clboth">#:addrDetlCont#</span>
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

var data = [];
// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/mob/crm/cif/customerInfo/selectAddressInfo.do' />"
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

              params["sRefTableNm"] = "CR_0101T";
              params["sRefKeyNm"] = parent.$("#custNo").val();

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
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("addressList", rTotal,"Y");
      }else{
          parent.setSubListHeight2("addressList", 0,"Y");
      }
      }, 200);

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

    var subListView1 = $("#subListView1").data("kendoMobileListView");
    var custNo = parent.$("#custNo").val();

    subListView1.dataSource.insert({
        "flagYn"            :"N"
        , "addrTp"          :"01"
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
        , "refTableNm"      :"CR_0101T"                  //참조테이블
        , "refKeyNm"        :custNo                     // 참조 키
    });

    subListView1.refresh();

    //저장
    parent.saveAddressList();
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
    listData.remove(listData.data()[idx-1]);
    listView.refresh();

    //저장
    parent.saveAddressList();
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

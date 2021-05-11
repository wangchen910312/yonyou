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

<!--
포인트내역
발생포인트
담당자/부서
발생일
 -->

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(Type) #</span>
    <span width:55%">#:trimNull(Point) #</span>
    <span class="clboth" style=" style="width:45%">#:chgDateFormat(UpdateDate) #</span>
    <span style="width:55%">#:trimNull(Remark) #</span>
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
          url:"<c:url value='/crm/cif/customerInfo/selectBlueMembershipCalcDetails.do' />"
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

              params["identityNumber"]  = parent.$("#ssnCrnNo").val(); // 증서번호
              params["blueMembershipNo"] =  parent.$("#blueMembershipNo").val(); // 회원카드번호

              /* params["sCustNo"] = parent.$("#custNo").val(); */
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
              /* rnum:{type:"string", editable:false}
              ,dlrCd:{type:"string", validation:{required:true}, editable:false}
              ,pointHisSeq:{type:"int", validation:{required:true}, editable:false}
              ,blueMembershipNo:{type:"string", validation:{required:true}, editable:false}
              ,cardNo:{type:"string", validation:{required:false}, editable:false}
              ,pointCd:{type:"string", validation:{required:false}, editable:false}
              ,pointTp:{type:"string", validation:{required:false}, editable:false}
              ,occrPointVal:{type:"string", validation:{required:false}, editable:false}
              ,occrPointValadd:{type:"string", validation:{required:false}, editable:false}
              ,prsnDeptNm:{type:"string", validation:{required:false}, editable:false}
              ,prsnId:{type:"string", validation:{required:false}, editable:false}
              ,prsnNm:{type:"string", validation:{required:false}, editable:false}
              ,occrDt:{type:"string", validation:{required:false}, editable:false} */
              Type:{type:"string", validation:{required:true}, editable:false}
              ,Point:{type:"string", validation:{required:true}, editable:false}
              ,Remark:{type:"string", validation:{required:true}, editable:false}
              ,UpdateDate:{type:"date", validation:{required:true}, editable:false}


          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("blueMbrShipList", rTotal, "Y");
          parent.setSubListHeightNew("blueMbrShipList",2,rTotal);
      }else{
          //parent.setSubListHeight2("blueMbrShipList", 0, "Y");
          parent.setSubListHeightNew("blueMbrShipList",2,0);
      }
      }, 200);

      checklistCnt("blueMbrShipList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
      checklistCnt("blueMbrShipList_noData",this.total(),noDatamsg);
    }
});

//포인트내역
changePointCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.pointCdListMap[val];
    }
    return returnVal;
}

chgDateFormat = function(val){
    console.log(val);
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, "<dms:configValue code='dateFormat' />")
    }else{
        returnVal = '';
    }
    return returnVal;
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

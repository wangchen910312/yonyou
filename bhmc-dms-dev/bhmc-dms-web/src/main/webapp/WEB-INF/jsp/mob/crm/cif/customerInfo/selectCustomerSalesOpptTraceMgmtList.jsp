<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData"  data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">

    <span style="width:50%">#:trimNull(mngScNm) #</span>
    <span style="width:50%">#:chgDateFormat(traceDt) #</span>
    <span class="clboth" style="width:50%">#:trimNull(traceMthNm) #</span>
    <span style="width:50%">#:trimNull(traceGradeNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(traceCont) #</span>
    <span class="clboth" style="width:50%">#:chgDateFormat(nextTraceDt) #</span>
    <span style="width:50%">#:trimNull(nextTraceMthNm) #</span>
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
          url:"<c:url value='/crm/cif/customerInfo/selectSalesOpptTraceMgmt.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {

              var seq = parent.$("#seq").val();
              if (dms.string.isEmpty(seq)){
                  seq = "-999999";
              }

              var params = {};

              params["recordCountPerPage"]    = options.pageSize;
              params["pageIndex"]             = options.page;
              params["firstIndex"]            = options.skip;
              params["lastIndex"]             = options.skip + options.take;
              params["sort"]                  = options.sort;

              params["sSaleOpptSeq"]           = seq;

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
          ,rnum  :{type:"number" , editable:false}
          ,mngScNm:{type:"string", editable:true}
          ,traceMthNm:{type:"string", editable:false}
          ,traceGradeNm:{type:"string", editable:false}
          ,traceCont:{type:"string", editable:false}
          ,nextTraceMthNm:{type:"string", editable:false}
          ,traceDt:{type:"date", editable:false}
          ,nextTraceDt:{type:"date", editable:false}
          ,traceDtFormat:{type:"date", editable:false}
          ,nextTraceDtFormat:{type:"date", editable:false}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("leadList", rTotal, "Y");
          parent.setSubListHeightNew("traceList",3,rTotal);
      }else{
          //parent.setSubListHeight2("leadList", 0, "Y");
          parent.setSubListHeightNew("traceList",3,0);
      }
      }, 200);

      checklistCnt("traceList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

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

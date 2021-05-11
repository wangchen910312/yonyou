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
    <span style="width:45%">#:trimNull(fincStatNm) #</span>
    <span style="width:55%">#:trimNull(publNm) #</span>
    <span class="clboth" style="width:45%">#:trimNull(vinNo) #</span>
    <span style="width:55%">#:comma(fincReqAmt) #</span>
    <span class="clboth" style="width:45%">#:trimNull(fincCmpNm) #</span>
    <span style="width:55%">#trimNull(fincRpayPrid) #</span>
    <span class="clboth" style="width:45%">#:trimNull(fincNo) #</span>
    <span style="width:55%">#:trimNull(contractNo) #</span>
    <span class="clboth" style="width:100%">#:chgDate2Str(fincEndDt) #</span>
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
          url:"<c:url value='/sal/fim/fincInfoMng/selectFincInfoMngCRMSearch.do' />"
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
              params["sCustCd"]  = parent.$("#custNo").val();

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
              rnum:{type:"string", editable:false}
              ,dlrCd         :{type:"string", editable:false} // 딜러코드
              ,regUsrNm      :{type:"string", editable:false}                 // 등록인
              ,fincStatNm    :{type:"string", editable:false}                 // 신청상태
              ,publNm        :{type:"string", editable:false}                 // 발행명칭
              ,vinNo         :{type:"string", editable:false}                 // VIN NO
              ,fincCmpNm     :{type:"string", editable:false}                 // 금융사/은행
              ,fincReqAmt    :{type:"number", editable:false}                 // 대출금액
              ,fincRpayPrid  :{type:"number", editable:false}                 // 상환기간
              ,fincNo        :{type:"string", editable:false}                 // 대출번호
              ,contractNo    :{type:"string", editable:false}                 // 계약번호
              ,fincReqDt     :{type:"date", editable:false}                   // 신청일자
              ,updtDt        :{type:"date", editable:false}                   // 수정일자
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("blueMbrShipList", rTotal, "Y");
          parent.setSubListHeightNew("fincList",4,rTotal);
      }else{
          //parent.setSubListHeight2("blueMbrShipList", 0, "Y");
          parent.setSubListHeightNew("fincList",4,0);
      }
      }, 200);

      checklistCnt("fincList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});


//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='sal.title.fincInfo' /><!-- 금융정보 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnFincSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="deleteitem listhead">
            <span style="width:45%"><spring:message code='sal.lbl.requestStat' /><!-- 대출대행진도 --></span>
            <span style="width:55%"><spring:message code='sal.lbl.publNm' /><!-- 고객성명 --></span>
            <span class="clboth" style="width:45%"><spring:message code='sal.lbl.carVinNo' /><!-- VIN NO --></span>
            <span style="width:55%"><spring:message code='sal.lbl.fincReqAmt' /><!-- 대출금액 --></span>
            <span class="clboth" style="width:45%"><spring:message code='global.lbl.fincCmp' />/<spring:message code='sal.lbl.bank' /><!-- 금융사/은행 --></span>
            <span style="width:55%"><spring:message code='sal.lbl.fincRpayPrids' /><!-- 대출기간(월) --></span>
            <span class="clboth" style="width:45%"><spring:message code='sal.lbl.fincNo' /><!-- 대출번호 --></span>
            <span style="width:55%"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></span>
            <span class="clboth" style="width:100%"><spring:message code='sal.lbl.reqDt' /><!-- 신청일자 --></span>
        </div>
        <div>
            <div id="subListView11" style="height:200px; overflow:scroll;"></div>
        </div>

    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate11">
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

var data = [];
// datasource below is customized for demo purposes.
var subListData11 = new kendo.data.DataSource({
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
              params["sDlrCd"] = $("#dlrCd").val();
              params["sCustCd"]  = $("#custNo").val();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
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
      rTotal = $("#subListView11").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("fincList",4,rTotal);
      }else{
          setSubListHeightNew("fincList",4,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

$(document).ready(function(){
    $("#subListView11").kendoListView({
        dataSource:subListData11
        ,template:kendo.template($("#subTemplate11").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView11").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView11").css({"background-image":"none"});
            }
        }
    });
});

</script>

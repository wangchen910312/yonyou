<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.title.payInfo" /><!-- 지불정보 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList1Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.receiveStatRcv" /><!-- 수납상태 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.rcvEndDt" /><!-- 수납완료일자 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.rcvRegUsrNm" /><!-- 수납자 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.payMethod" /><!-- 지불방식--></span>
                <span style="width:50%"><spring:message code="global.lbl.calcAmt" /><!-- 실수금액 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.invoiceNo" /><!-- 영수증번호 --></span>
            </div>
            <div id="subListView" style="height:200px; overflow:scroll"></div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rcvHistStatNm) #</span>
            <span style="width:50%">#:chgDate2DateTimeStr(rcvCpltDt) #</span>
            <span style="width:50%">#:trimNull(regUsrNm) #</span>
            <span style="width:50%">#:paymMthCdGrid(paymMthCd) #</span>
            <span style="width:50%">#:dms.format.currency(rcvAmt) #</span>
            <span style="width:50%">#:trimNull(rcptNo) #</span>
    </div>
</script>


<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var subListData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveDetailsHist.do' />"
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["sRcvDocNo"] = $("#rcvDocNo").val();
              params["sRcvSubDocNo"] = $("#rcvSubDocNo").val();
              params["sPaymTp"] = $("#sPaymTp").data("kendoExtDropDownList").value();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"seq"
           ,fields:{
              rnum:{type:"number"}
          }
      }
  }
});

//지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rcptTpCdMap[val] != undefined)
        returnVal = rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template:kendo.template($("#subTemplate").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });
});

</script>
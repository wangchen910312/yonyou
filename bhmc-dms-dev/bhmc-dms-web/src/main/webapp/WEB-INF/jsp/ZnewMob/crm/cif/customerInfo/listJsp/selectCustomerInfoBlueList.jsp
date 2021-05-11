<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.blueMbrShip'/><!-- 블루 멤버십 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnBlueMbrShipSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="formarea">
            <table class="flist01">
                <caption>블루 멤버십 정보</caption>
                <colgroup>
                    <col style="width:40%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.BlueMbrShipReg' /><!-- 블루멤버십등급 --></th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" value="" id="blueGradeCd" disabled="disabled">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.savePointAble' /><!-- 적립 포인트(가용) --></th>
                        <td>
                            <div class="f_text f_disabled">
                                <!-- <input type="text" value="" id="blueUsePoint" disabled="disabled"> -->
                                <input type="text" value="" id="blueAvlbPointVal" disabled="disabled">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.joinDt' /><!-- 가입일 --></th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" value="" id="blueJoinDt" disabled="disabled">
                                <input id="blueMembershipNo" name="blueMembershipNo" type="hidden" readonly />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="listarea02">
            <div class="deleteitem listhead">
                <span style="width:45%"><spring:message code='crm.lbl.blueMemTpCd'/><!-- 타입 --></span>
                <span style="width:55%"><spring:message code='global.lbl.arPoint'/><!-- 발생포인트 --></span>
                <span class="clboth" style="width:45%"><spring:message code='global.lbl.arDt'/><!-- 발생일 --></span>
                <span style="width:55%"><spring:message code='global.lbl.cont'/><!-- 내용 --></span>
            </div>
            <div>
                <div id="subListView9" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<!--
포인트내역
발생포인트
담당자/부서
발생일
 -->

<script type="text/x-kendo-template" id="subTemplate9">
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

var data = [];
// datasource below is customized for demo purposes.
var subListData9 = new kendo.data.DataSource({
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
              params["identityNumber"]  = $("#ssnCrnNo").val(); // 증서번호
              params["blueMembershipNo"] =  $("#blueMembershipNo").val(); // 회원카드번호
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
              Type:{type:"string", validation:{required:true}, editable:false}
              ,Point:{type:"string", validation:{required:true}, editable:false}
              ,Remark:{type:"string", validation:{required:true}, editable:false}
              ,UpdateDate:{type:"date", validation:{required:true}, editable:false}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView9").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("blueMbrShipList",2,rTotal);
      }else{
          setSubListHeightNew("blueMbrShipList",2,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//포인트내역
changePointCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = pointCdListMap[val];
    }
    return returnVal;
};

chgDateFormat = function(val){
    var returnVal;
    if (val !== null ){
        returnVal =  kendo.toString(val, "<dms:configValue code='dateFormat' />");
    }else{
        returnVal = '';
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView9").kendoListView({
        dataSource:subListData9
        ,template:kendo.template($("#subTemplate9").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView9").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView9").css({"background-image":"none"});
            }
        }
    });
});

</script>

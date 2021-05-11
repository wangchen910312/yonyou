<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<style type="text/css">
    *, *:before, *:after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;}
    p {font-size: large; font-weight: bolder; color: white;text-align: left; padding-left: 20px;}
    .HolyGrail { display: flex;min-height: 700px;flex-direction: column;padding: 0px 20px;}
    .height30 { height: 130px; }
    .contant {display: flex;  overflow: hidden }
    .bigMenuBtn {width:20%;  -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box;padding-right: 10px;}
    .innerBox { width: 100%;height: 100%;padding-top: 20px;display: flex;justify-content: space-between;}
    .innerBox>img {width: 50px;height: 50px; align-self: flex-end;margin-right: 20px; margin-bottom: 25px; }
</style>
<div class="HolyGrail">
    <div class="height30"></div>
    <div class="contant">
    <%-- <img src="<c:url value='/resources/img/wa/FlatColor.png' />" alt=""> --%>
<!-- 维修预约 -->
    <div class="bigMenuBtn">
       <div class="innerBox" style="background-color: #3480cd;">
         <p><spring:message code='ser.menu.reserCreate' /></p>
         <img src="<c:url value='/resources/img/wa/bigBtn_reserCreate.png'/>">
         <input type="hidden" id="viewUrl" value="<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do'/>">
         <input id="viewId" type="hidden" value="VIEW-D-10332">
       </div>
    </div>
    <!-- 配件预约 -->
    <div class="bigMenuBtn">
       <div class="innerBox" style="background-color: #3480cd;">
        <p><spring:message code='ser.menu.partResvCreate' /></p>
        <img src="<c:url value='/resources/img/wa/bigBtn_partResvCreate.png'/>">
        <input type="hidden" id="viewUrl" value="<c:url value='/ser/rev/partReservation/selectPartReservationMain.do'/>">
        <input id="viewId" type="hidden" value="VIEW-D-10498">
      </div>
    </div>
<!-- 接车检查 -->
    <div class="bigMenuBtn" style="width:40%">
      <div class="innerBox" style=" background-color: #285c9c;">
        <p><spring:message code='ser.menu.preCheckCreate' /></p>
        <img src="<c:url value='/resources/img/wa/bigBtn_preCheck.png'/>">
        <input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/preCheck/selectPreCheckMain.do'/>">
        <input id="viewId" type="hidden" value="VIEW-D-10333">
      </div>
    </div>
<!-- 维修委托 -->
   <div class="bigMenuBtn">
      <div class="innerBox" style=" background-color: #285c9c;">
        <p><spring:message code='ser.menu.roCreate' /></p>
        <img src="<c:url value='/resources/img/wa/bigBtn_roCreate.png'/>">
        <input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do'/>">
        <input id="viewId" type="hidden" value="VIEW-D-10337">
     </div>
   </div>
   </div>
 <div style='height:20px; overflow:hidden'></div>
<!--下一行， 维修派工 -->
 <div class="contant">
        <div class="bigMenuBtn">
            <div class="innerBox" style="background-color: #285c9c;">
            <p><spring:message code='ser.menu.assignMng' /></p>
            <img src="<c:url value='/resources/img/wa/bigBtn_estCreate.png'/>">
            <input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/workAssign/selectWorkAssignMain.do'/>">
            <input id="viewId" type="hidden" value="VIEW-D-10340">
        </div>
    </div>
<!-- 维修进度 -->
     <div class="bigMenuBtn">
         <div class="innerBox" style=" background-color: #469fa9;">
         <p><spring:message code='ser.menu.wkProcMng' /></p>
         <img src="<c:url value='/resources/img/wa/bigBtn_calc.png'/>">
         <input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/workProcess/selectWorkProcessMain.do'/>">
         <input id="viewId" type="hidden" value="VIEW-D-10341">
        </div>
    </div>
<!-- 车辆检查 -->
    <div class="bigMenuBtn">
         <div class="innerBox" style=" background-color: #469fa9;">
            <p><spring:message code='ser.menu.carCheck' /></p>
            <img src="<c:url value='/resources/img/wa/bigBtn_carCheck.png'/>">
            <input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/carCheck/selectCarCheckMain.do'/>">
            <input id="viewId" type="hidden" value="VIEW-D-12957">
        </div></div>
<!-- 质量检验 -->
     <div class="bigMenuBtn">
         <div class="innerBox" style=" background-color: #469fa9;">
         <p><spring:message code='ser.menu.qtTestMng' /></p>
         <img src="<c:url value='/resources/img/wa/bigBtn_zhi.png'/>">
         <input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/qtTest/selectQtTestMain.do'/>">
         <input id="viewId" type="hidden" value="VIEW-D-10197">
        </div>
    </div>
<!-- 交车检查 #469fa9 -->
     <div class="bigMenuBtn">
         <div class="innerBox" style=" background-color: #999999;">
         <p><spring:message code='ser.menu.deliveryChk' /></p>
            <img src="<c:url value='/resources/img/wa/bigBtn_jiao.png'/>">
           <input type="hidden" id="viewUrl" value="<c:url value='/ser/deliveryCheck/selectDeliveryCheckMain.do'/>">
           <input id="viewId" type="hidden" value="VIEW-D-10190">
        </div>
    </div>
</div>
<div class="height30"></div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").css("background-color","#efefef");
        var windowHeight = $(window).innerHeight();
        $(".height30").height(windowHeight/6);
        var contantHeight=(windowHeight-windowHeight/3-20)/2;
        $(".contant").height(contantHeight);
        $(".innerBox").height(contantHeight);
        $(".innerBox").click(function (){
            parent._createOrReloadTabMenu($(this).find("p").text(), $(this).find("p").siblings("#viewUrl").val(), $(this).find("p").siblings("#viewId").val());
        });
    });
    </script>
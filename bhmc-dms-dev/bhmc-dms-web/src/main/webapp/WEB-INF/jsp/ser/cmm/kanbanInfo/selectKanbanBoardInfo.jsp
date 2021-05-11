<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device"%>
<%@ page import="org.springframework.mobile.device.DeviceUtils"%>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<section class="slide_menu">
     <c:if test="${(preFixId ne 'PRE') && (preFixId ne 'RO')}">
    <div id="slide-in-share" class="slide-in-share">
        <a id="slide-in-handle" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.resvBoard" /><!-- 예약현황보드 --></span></a>
        <div id="scheduler"></div>
    </div>
    </c:if>
    <c:if test="${(preFixId ne 'RE') && (preFixId ne 'PRE')}">
        <div id="slide-in-share1" class="slide-in-share">
            <a id="slide-in-handle1" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.preInsBoard" /><!-- 사전점검보드 --></span></a>
            <div class="slide-content"><div id="scheduler1"></div></div>
        </div>
    </c:if>
    <c:choose>
        <c:when test="${preFixId eq 'PC'}">
            <div id="slide-in-share2" class="slide-in-share" style="height:312px;">
                <a id="slide-in-handle2" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.vipDc" /><!-- 회원정보 --></span></a>
                <div class="slide-content">
                 <!-- 去掉蓝缤相关的积分查询部分，只保留自店会员部分  tjx 2020-6-24 
                    <div class="table_grid">
                        <div class="header_area">
                            <div class="btn_right">
                                <button type="button" id="bmSearch" class="btn_s btn_s_min5"><spring:message code="global.btn.search"/></button> 
                                <button type="button" id="bmSet" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.confirm"/></button> 
                                <button type="button" id="bmCancel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.cancel" /></button> 
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="bmPointGrid" style="min-height: 67px;"></div> 
                        </div>
                    </div>
                   -->
                    <div class="table_grid mt10">
                        <div class="header_area">
                            <%-- <div class="btn_right">
                                <button type="button" id="dealerSet" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                                <button type="button" id="dealerCancel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
                            </div> --%>
                        </div>
                        <div class="table_grid">
                            <div id="dlrPointGrid" style="min-height: 67px;"></div> <!-- khs 태블릿 때문에 -->
                        </div>
                    </div>
                </div>
            </div>
            <div id="slide-in-share3" class="slide-in-share" style="height:416px; width:800px; margin-right:-800px;">
                <a id="slide-in-handle3" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.otherDc" /></span></a><!-- 기타할인 -->
                <div class="slide-content">
                    <div class="table_grid">
                        <div class="header_area">
                            <div class="btn_right">
                                <button type="button" id="bmCupnVerify" class="btn_s btn_s_min5"><spring:message code="ser.btn.verify"/></button> <!-- 확인 -->
                                <%-- <button type="button" id="bmCupnSet" class="btn_s btn_s_min5"><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                                <button type="button" id="bmCupnCancel" class="btn_s btn_s_min5"><spring:message code="global.btn.cancel" /></button> <!-- 취소 --> --%>
                            </div>
                        </div>
                        <div class="table_grid">
                            <!-- 그리드1 -->
                            <div id="bmCupnGrid" class="grid"></div>
                            <!-- 그리드1 -->
                        </div>
                    </div>
                    <div class="table_grid mt10">
                        <div class="header_area">
                            <div class="btn_right">
                                <%-- <button type="button" id="dcSet" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                                <button type="button" id="dcCancel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.cancel" /></button> <!-- 취소 --> --%>
                            </div>
                        </div>
                        <div class="table_grid">
                            <!-- 그리드1 -->
                            <div id="dcGrid" class="grid"></div>
                            <!-- 그리드1 -->
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
             <c:if test="${(preFixId ne 'RE') && (preFixId ne 'PRE')}">
                <div id="slide-in-share2" class="slide-in-share">
                    <a id="slide-in-handle2" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.guideBoard" /><!-- 인도현황보드 --></span></a>
                    <div class="slide-content"><div id="scheduler2"></div></div>
                </div>
            </c:if>
            <c:if test="${preFixId eq 'RO'}">
                <div id="slide-in-share3" class="slide-in-share">
                    <a id="slide-in-handle3" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.workProBoard" /></span></a><!-- 정비진도보드 -->
                    <div class="slide-content">
                        <div id="processDiv" class="table_list3 table_list_v2 mt10">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                    <col style="width:11%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="bg_blue1" style="height:30px"><spring:message code="ser.lbl.carNo" />(<span class="totalCnt">0</span>)</th><!-- 차량번호 -->
                                        <th scope="col" class="bg_blue1"><spring:message code="ser.lbl.roWrtrNm" /></th><!-- RO발행자 -->
                                        <th scope="col" class="bg_blue1"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                                        <th scope="col" class="bg_red"><spring:message code="ser.lbl.lbrReady" />(<span class="readyCnt">0</span>)</th><!-- 정비대기 -->
                                        <th scope="col" class="bg_orange2"><spring:message code="ser.lbl.underRepair" />(<span class="prcStartCnt">0</span>)</th><!-- 정비진행 -->
                                        <th scope="col" class="bg_yellow2"><spring:message code="ser.lbl.lbrStop" />(<span class="prcStopCnt">0</span>)</th><!-- 정비중지 -->
                                        <th scope="col" class="bg_green3"><spring:message code="ser.lbl.qtTest" />(<span class="qtTestCnt">0</span>)</th><!-- 품질검사 -->
                                        <th scope="col" class="bg_blue2"><spring:message code="ser.lbl.carDlReady" />(<span class="dlReadyCnt">0</span>)</th><!-- 인도대기 -->
                                        <th scope="col" class="bg_blue3"><spring:message code="ser.lbl.deliveryChk" />(<span class="dlConfCnt">0</span>)</th><!-- 인도확인 -->
                                    </tr>
                                </thead>
                                <tbody id="workProcessTemplate"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
    <!-- 服务提示 -->
    <div id="slide-in-share4" class="slide-in-share">
        <a id="slide-in-handle4" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.serAlarm" /><!-- 서비스알람 --></span></a>
        <div class="slide-content">

            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:13%;">
                        <col style="width:10%;">
                        <col style="width:13%;">
                        <col style="width:10%;">
                        <col style="width:13%;">
                        <col style="width:10%;">
                        <col style="width:13%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.carOwnerBirthDt' /></th><!-- 차량소유자 생일 -->
                            <td>
                                <input id="kanbanCarOwnerBirthDt" name="kanbanCarOwnerBirthDt" class="form_input ac" readonly/>
                            </td>
                             <th scope="row"><spring:message code='ser.lbl.birthRemainDay' /></th><!-- 생일알람까지 -->
                            <td>
                                <input id="kanbanCarOwnerBirthRemainDay" name="kanbanCarOwnerBirthRemainDay" class="form_input ar" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.driverBirthRemainDay' /></th><!-- 운전자 생일 -->
                            <td>
                                <input id="kanbanDriverBirthDt" name="kanbanDriverBirthDt" class="form_input ac" readonly/>
                            </td>
                             <th scope="row"><spring:message code='ser.lbl.birthRemainDay' /></th><!-- 생일알람까지 -->
                            <td>
                                <input id="kanbanDriverBirthRemainDay" name="kanbanDriverBirthRemainDay" class="form_input ar" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.wartExpireDt' /></th><!-- 보증마감일자 -->
                            <td>
                                <!-- <input id="kanbanGrteStartDt" name="kanbanGrteStartDt" class="form_input ac" readonly/> -->
                                <input id="kanbanGrteEndDt" name="kanbanGrteEndDt" class="form_input ac" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.wcEndRemainDay' /></th><!-- 보증만료까지 -->
                            <td>
                                <input id="kanbanGrteEndRemainDay" name="kanbanGrteEndRemainDay" class="form_input ar" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.saleOutDt' /></th><!-- 판매출고일자 -->
                            <td>
                                <input id="kanbanCustSaleDt" name="kanbanCustSaleDt" class="form_input ac" readonly/>
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.carSaleCntDay' /></th><!-- 차량판매일수 -->
                            <td>
                                <input id="kanbanCustSaleDay" name="kanbanCustSaleDay" class="form_input ar" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.samPoEndDt' /></th><!-- 삼포만료일 -->
                            <td>
                                <input type="text" id="kanbanSanbaoEndDt" name="kanbanSanbaoEndDt" class="form_input upper ac" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.samPoEndRemainDay' /></th><!-- 삼포만료일까지 -->
                            <td>
                                <input id="kanbanSanbaoEndRemainDay" name="kanbanSanbaoEndRemainDay" class="form_input ar" readonly/>
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.carRegDt' /></th><!-- 차량등록일 -->
                            <td>
                                <input id="kanbanCarRegDt" name="kanbanCarRegDt" class="form_input ac" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carChkEndRemainDay' /></th><!-- 차량점검까지 -->
                            <td>
                                <input id="kanbanExpcChkRemainDay" name="kanbanExpcChkRemainDay" class="form_input ar" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.incEndDt' /></th><!-- 보험만료일 -->
                            <td>
                                <input id="kanbanIncEndDt" name="kanbanIncEndDt" class="form_input ac" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.incEndRemainDay' /></th><!-- 보험만료까지 -->
                            <td>
                                <input id="incEndRemainDay" name="incEndRemainDay ar" class="form_input ar" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.scheChkDist' /></th><!-- 예정주행거리 -->
                            <td>
                                <input id="kanbanExpcChkRunDistVal" name="kanbanExpcChkRunDistVal" class="form_input ar">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.scheChkRemainDay' /></th><!-- 예정보양까지 -->
                            <td>
                                <input id="kanbanExpcChkRunDistValRmKm" name="kanbanExpcChkRunDistValRmKm" class="form_input ar" readonly/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 탭메뉴 전체 영역 -->
            <div id="kanbanTabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code="ser.menu.reserCreate"/></li><!-- 예약관리 -->
                    <li><spring:message code="ser.menu.partResvCreate" /></li><!-- 부품예약 -->
                    <li><spring:message code="ser.menu.estCreate" /></li><!-- 견적등록 -->
                    <li><spring:message code="ser.title.rescMng" /></li> <!-- 구원서비스 -->
                    <li><spring:message code='ser.lbl.serviceCont' /><!-- 수리건의 --></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- 예약관리 -->
                <div class="table_grid mt0">
                    <div class="header_area">
                    </div>
                    <div class="table_grid">
                        <div id="resvKanbanGrid"></div>
                    </div>
                </div>
                <!-- //예약관리 -->

                <!-- 부품예약 -->
                <div class="table_grid mt0">
                    <div class="header_area">
                    </div>
                    <div class="table_grid">
                        <div id="partResvKanbanGrid"></div>
                    </div>
                </div>

                <!-- //부품예약 -->

                <!-- 견적등록 -->
                 <div class="table_grid mt0">
                    <div class="header_area">
                    </div>
                    <div class="table_grid">
                        <div id="estKanbanGrid"></div>
                    </div>
                </div>
                <!-- //견적등록 -->

                <!-- 구원서비스 -->
                <div class="table_grid mt0">
                    <div class="header_area">
                    </div>
                    <div class="table_grid">
                        <div id="helpSvcKanbanGrid"></div>
                    </div>
                </div>
                <!-- //구원서비스 -->
                <!-- 수리건의 -->
                <div class="table_grid mt0">
                    <div class="header_area">
                    </div>
                    <div class="table_grid">
                        <div id="lbrSuggestKanbanGrid"></div>
                    </div>
                </div>
                <!-- //수리건의 -->
            </div>

            <!-- 三包提示 -->
            <div id="sanbaoAlramKanban" style="min-height:142px;">
                <div class="table_form table_form_info mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:16%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:18%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"><spring:message code="ser.lbl.gubun" /></th>                        <!-- 구분 -->
                                <th scope="col" colspan="2"><spring:message code="ser.lbl.appyStd" /></th>          <!-- 적용기준 -->
                                <th scope="col" colspan="2"><spring:message code="ser.lbl.sanbaoRemainPrid" /></th> <!-- 삼보잔여기간 -->
                                <th scope="col"><spring:message code="ser.lbl.targYn" /></th>                       <!-- 대상여부 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoWartPrid" /></th>         <!-- 삼보보증기간 -->
                                <td class="ar" id="sanbaoWartPridKan">&nbsp;<spring:message code="ser.lbl.yy" /></td>        <!-- 삼보 보증기간 적용기준 년 -->
                                <td class="ar" id="sanbaoWartRunDistValKan">&nbsp; KM</td>                            <!-- 삼보보증기간 적용기준 주행거리-->
                                <td class="ar" id="sanbaoWartRmPridKan">&nbsp; <spring:message code="ser.lbl.monday" /></td> <!-- 삼보보증기간 잔여 월-->
                                <td class="ar" id="sanbaoWartRmRunDistValKan">&nbsp; KM</td>                                 <!-- 삼보보증기간 잔여 주행거리-->
                                <td class="ar" id="sanbaoWartkYnKan"></td> <!-- 삼보보증 대상여부 -->
                            </tr>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoNewCar" /></th>           <!-- 신차보증기간 -->
                                <td class="ar" id="newCarWartPridKan">&nbsp; <spring:message code="ser.lbl.day" /></td>      <!-- 신차보증기간 적용 일-->
                                <td class="ar" id="newCarWartRunDistValKan">&nbsp; KM</td>                                   <!-- 신차보증기간 적용 주행거리-->
                                <td class="ar" id="newCarWartRmPridKan">&nbsp; <spring:message code="ser.lbl.day" /></td>    <!-- 신차보증기간 잔여 일-->
                                <td class="ar" id="newCarWartRmRunDistValKan">&nbsp; KM</td>                                 <!-- 신차보증기간 잔여 주행거리-->
                                <td class="ar" id="newCarWartYnKan"></td>                <!-- 신차보증기간 대상여부-->
                            </tr>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoWorkrOver" /></th>               <!-- 작업일수 초과 -->
                                <td class="ar" colspan="2" id="workOverPridKan">&nbsp; <spring:message code="ser.lbl.day" /></td>   <!-- 작업일수 초과 적용 일-->
                                <td class="ar" colspan="2" id="workOverRmPridKan">&nbsp; <spring:message code="ser.lbl.day" /></td> <!-- 작업일수 초과 잔여 일-->
                                <td class="ar" id="workOverYnKan"></td> <!-- 작업일수 초과 대상여부-->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //三包提示 -->
            <!-- //탭메뉴 전체 영역 -->
       </div>
    </div>
    <!-- 服务信息 -->
<div id="slide-in-share5" class="slide-in-share" style="display: none;">
    <a id="slide-in-handle5" class="slide-in-handle" href="#">
       <span class="txt_middle"><spring:message code="ser.lbl.serviceInformation" /> </span>
     </a>
    <div class="slide-content">
        <div id="kanbanTabstrip" class="tab_area">

            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.regularMaintainPlan" /></li>
                <!-- 定期保养计划-->
                <li><spring:message code="ser.lbl.newOldComparison" />
                </li>
                <!-- 新旧图片对比 -->
            </ul>

            <!-- 定期保养计划-->
            <div class="table_grid mt0" id="regMainPlan" style="position:absolute; height:590px; overflow:auto" ></div>
            <!-- 新旧图片对比  style="position:absolute; height:590px; overflow:auto;margin-top:12px"  class="table_grid mt0" -->
           <div style="margin-top:0!important;position:relative;height:600px;" id="newOldComparison"  >
                   <input id="sCarAcptTp" class="form_comboBox"   style="width:30%;">
                   <div id="newOldCom"  class="table_grid mt0" ></div>
             </div>

    </div>
  </div>
</div>
</section>
<!-- 服务信息  jmm 2018-2-8 10:30:32-->
<script type="text/javascript">
       // console.log("执行");
        var isTablet=${isTablet}+""; //khskhs  문제시 삭제
        if(isTablet=="true"){

             var carCheckVal = parent.$("#tabMenu > ul:eq(0) > .k-state-active > .k-link").text();
             if("接车检查" == carCheckVal ){
                 $("#slide-in-share5").show();
             }
           /*  var regList =  ["Alternator_new.png", "Alternator_used.png", "BatteryConnections_new.png", "BatteryConnections_used.png",
                            "BeltDriveAccessoryPS_new.png", "BeltDriveAccessoryPS_used.png", "BrakeCalipers_new.png", "BrakeCalipers_used.png",
                            "BrakeFluid_new.png", "BrakeFluid_used.png", "BrakeLinesHosesConnections_new.png",
                            "BrakeLinesHosesConnections_used.png", "BrakePads_new.png", "BrakePads_used.png",
                            "BrakeRotorsDrums_new.png", "BrakeRotorsDrums_used.png", "CabinAirFilter_new.png",
                            "CabinAirFilter_used.png", "Coolant_new.png", "Coolant_used.png", "EngineAirFilter_new.png",
                            "EngineAirFilter_used.png", "EngineOilFilter_new.png", "EngineOilFilter_used.png",
                            "FuelFilter_new.png", "FuelFilter_used.png", "FuelInjector_new.png", "FuelInjector_used.png",
                            "GasTankAirFilter_new.png", "SparkPlugWires_new.png", "SparkPlugWires_used.png",
                            "SparkPlug_new.png", "SparkPlug_used.png", "TimingBelt_new.png", "TimingBelt_used.png", "VacuumHose_new.png",
                            "VacuumHose_used.png", "ValveClearance_new.png", "WindshieldWipers_new.png", "WindshieldWipers_used.png"]; */
            //$('#regMainPlan').innerHTML('');
                            var regList =  ["baoyang11.jpg","baoyang12.jpg"];
             $("#regMainPlan").empty();
            //getPicData(); height='200' width='200'
             for(var m=0;m<regList.length;m++){
                $("#regMainPlan").append(" <img  src='<c:url value='/resources/img/Part_Img/"+regList[m]+"'/>'> ");
            }
        }

        //暂不用
        function getPicData(){
            $.ajax({
                url:"<c:url value='/api/sales/maintainRulesController/selectPartImg.do' />"
                ,data:JSON.stringify("")
                ,type:'POST'
                //,async: true,
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                     for(var j=0;j<result.data.length;j++){
                         //console.log("数据",result.data);
                         $("#regMainPlan").append(" <img height='200' width='200' src='<c:url value='/resources/img/Part_Img/"+result.data[j]+"'/>'> ");
                     }
                }
            });
        }

        var nmCDList = [];
        //carAcptTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
        nmCDList.push(
                       {"nmCd":"Alternator.jpg", "nmName":"交流发电机"},{"nmCd":"BatteryConnections.jpg","nmName":"蓄电池&接头"}
                      ,{"nmCd":"BeltDriveAccessoryPS.jpg","nmName":"皮带:驱动、附件、动力转向"},{"nmCd":"BrakeCalipers.jpg","nmName":"制动钳"}
                      ,{"nmCd":"BrakeFluid.jpg","nmName":"制动油"},{"nmCd":"BrakeLinesHosesConnections.jpg","nmName":"制动管路、软管和连接部位"}
                      ,{"nmCd":"BrakePads.jpg","nmName":"制动块"},{"nmCd":"BrakeRotorsDrums.jpg","nmName":"制动盘&制动鼓"}
                      ,{"nmCd":"CabinAirFilter.jpg","nmName":"驾驶室空气滤芯器"},{"nmCd":"Coolant.jpg","nmName":"冷却水"}
                      ,{"nmCd":"EngineAirFilter.jpg","nmName":"发动机空气滤清器"},{"nmCd":"EngineOilFilter.jpg","nmName":"发动机机油&机油滤清器"}
                      ,{"nmCd":"FuelFilter.jpg","nmName":"燃油滤清器"},{"nmCd":"FuelInjector.jpg","nmName":"燃油喷油嘴"}
                      ,{"nmCd":"GasTankAirFilter.jpg","nmName":"储气罐空气滤清器"},{"nmCd":"SparkPlug.jpg","nmName":"火花塞"}
                      ,{"nmCd":"SparkPlugWires.jpg","nmName":"火花塞导线"},{"nmCd":"TimingBelt.jpg","nmName":"正时皮带"}
                      ,{"nmCd":"VacuumHose.jpg","nmName":"真空软管"},{"nmCd":"ValveClearance.jpg","nmName":"气门间隙"}
                      ,{"nmCd":"WindshieldWipers.jpg","nmName":"挡风玻璃雨刮器"}
                     );

        // {"nmCd":"df","nmName":"<spring:message code='ser.lbl.day' />"}  国际化方式
        $("#sCarAcptTp").kendoExtDropDownList({
            dataTextField:"nmName"  //展示内容
           ,dataValueField:"nmCd"   //
           ,dataSource:nmCDList
           ,optionLabel : " " //默认值
           ,change: function(e) {
               var value = this.value();
               //console.log("数据类型",typeof(value));
               //$("#newOldCom").empty();

               $("#newOldCom").empty();
               if(""!=value){
                   //console.log("pwa");
                   //$("#newOldCom").append(" <img  height='95%' src='<c:url value='/resources/img/Screen_Capture/"+value+"'/>'> ");
                   $("#newOldCom").append(" <img  src='<c:url value='/resources/img/Screen_Capture/"+value+"'/>'> ");
               }

           }
       });



</script>

<script id="info-confirmation" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='ser.lbl.resvInfo' var='resvInfo' /><spring:message code='global.info.callSelectItem' arguments='${resvInfo},' /></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<script id="info-init" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<!-- 스케쥴러에 나타나는  예약 정보 -->
<script id="resvInfoView" type="text/x-kendo-template">
    #if(noResvTp == '02') {#
        <div class="noresvtp">
            #=title#:<spring:message code="ser.lbl.doNotResv" />
        </div>
    #} else {#
        <div class="resvtp" id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #if(dms.string.strNvl(title) != ''){#
                #= title#
            #} else {#
                #= driverNm#
            #}#
            <br>
            #=resvDocNo#
        </div>
    #}#
</script>

<script id="resvItemTooltip" type="text/x-kendo-template">
    #var uid = target.closest("[role=gridcell]").attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#

    #if(model) {#
        <div>
            <div class="carDetail_popup" style="top:0%; left:0%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            #if(model.noResvTp != '02') {#
                            <li><spring:message code="ser.lbl.resvWrtrNm" /> : #=model.regUsrNm#</li>
                            <li><spring:message code="ser.lbl.resvCreateDt" /> : #=kendo.format('{0:<dms:configValue code='dateFormat' /> HH:mm} ', model.resvDt)#</li>
                            <li><spring:message code="ser.lbl.driver" /> : #=model.driverNm#</li>
                            <li><spring:message code="ser.lbl.resvDt" /> : #=kendo.format('{0:HH:mm}', model.start)# ~ #=kendo.format('{0:HH:mm}', model.end)#</li>
                            <li><spring:message code="ser.lbl.receptionNm" /> : #=dms.string.strNvl(model.saNm)#</li>
                            #} else {#
                            <li><spring:message code="ser.lbl.resvDt" /> : #=kendo.format('{0:HH:mm}', model.start)# ~ #=kendo.format('{0:HH:mm}', model.end)#</li>
                            #}#
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    #}#

</script>

<!-- 인도현황 보드 -->
<script id="deliveryTooltip" type="text/x-kendo-template">
    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#
    #if(model) {#
        <div>
            <div class="carDetail_popup" style="top:-80%; left:5%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            <li><spring:message code="ser.lbl.roWrtrNm" /> : #=dms.string.strNvl(model.driverNm)#</li>
                            <li><spring:message code="ser.lbl.roDt" /> : #=kendo.format('{0:<dms:configValue code='dateFormat' /> HH:mm} ', model.roDt)#</li>
                            <li><spring:message code="ser.lbl.expcDlvDt" /> : #=kendo.format('{0:<dms:configValue code='dateFormat' /> HH:mm} ', model.end)#</li>
                            <li><spring:message code="ser.lbl.roTp" /> : #=model.roTpNm#</li>
                            <li><spring:message code="ser.lbl.roStatus" /> : #=model.roStatNm#</li>
                       </ul>
                    </div>
                </div>
            </div>
        </div>
    #}#
</script>

<!-- 인도칸반에 나타나는  정보 -->
<script id="deliveryInfoView" type="text/x-kendo-template">
    <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
        #=dms.string.strNvl(carRegNo)#
        <br>
        #= title#
    </div>
</script>

<!-- 스케쥴러에 나타나는  사전점검 정보 -->
<script id="preChkInfoView" type="text/x-kendo-template">

    #if(dms.string.strNvl(useYn) == 'N') { #
        <div class="noresvtp">
            #if(dms.string.strNvl(title) != ''){#
                #= title# </span>
            #} else {#
                #= driverNm#
            #}#
                <br>
            #=diagDocNo#
        </div>
    #} else { #
         <div id="preChkItem" style="display:table-cell;text-align:center;vertical-align:middle">
            #if(dms.string.strNvl(title) != ''){#
                #= title#
            #} else {#
                #= driverNm#
            #}#
                <br>
            #=diagDocNo#
        </div>
    #}#
</script>

<script id="preChkTooltip" type="text/x-kendo-template">

    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#
    # var startTime =  kendo.toString( model.start,'HH') #
    # var tooltipHeight = ($(".slide_menu").height() -100);         #
        <div>
           # if(startTime == "08" ){ #
            <div class="carDetail_popup" style="top: 0%; left:5%; width:240px" >
           # } else if(startTime == "19"){#
            <div class="carDetail_popup" style="top: 0%; left:5%; width:240px" >
           # }else {#
            <div class="carDetail_popup" style="top: 0%; left:5%; width:240px" >
           # }#
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            <li><spring:message code="ser.lbl.vinNo" /> : #=model.vinNo#</li>
                            <li><spring:message code="ser.lbl.preChkNm" /> : #=model.regUsrNm#</li>
                            <li><spring:message code="ser.lbl.preInsDt" /> : #=kendo.format('{0:<dms:configValue code='dateFormat' /> HH:mm} ', model.start)#</li>
                            <li><spring:message code="ser.lbl.driver" /> : #=dms.string.strNvl(model.driverNm)#</li>
                            <li><spring:message code="ser.lbl.carlineNm" /> : #=model.carlineNm#</li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>

</script>

<script id="workProcessBoardTemplate" type="text/x-kendo-template">
    # var readyCnt = 0; #
    # var prcStartCnt = 0; #
    # var prcStopCnt = 0; #
    # var qtTestCnt = 0; #
    # var dlReadyCnt = 0; #
    # var dlConfCnt = 0; #
    # var totalCnt = data.length; #
    # for (var i = 0; i < data.length; i++) { #
    # var roStatCd = data[i].roStatCd; #
    # var expcDlDt = data[i].expcDlDt == null ? "" : kendo.format('{0:MM-dd HH:mm}', kendo.parseDate(data[i].expcDlDt)); #
    <tr>
        <th scope="row" style="height:30px">#= dms.string.strNvl(data[i].carRegNo) #</th>
        <td>#= dms.string.strNvl(data[i].regUsrNm) #</td>
        <td style="align:center;">#= dms.string.strNvl(expcDlDt) #</td>
        # if(data[i].roStatCd == '01') { #
        <td class="bg_red sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        # readyCnt++; #
        # } else if(data[i].roStatCd == '02') { #
        <td></td>
        <td class="bg_orange2 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        # prcStartCnt++; #
        # } else if(data[i].roStatCd == '03') { #
        <td></td>
        <td></td>
        <td class="bg_yellow2 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        <td></td>
        # prcStopCnt++; #
        # } else if(data[i].roStatCd == '04') { #
        <td></td>
        <td></td>
        <td></td>
        <td class="bg_green3 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        # qtTestCnt++; #
        # } else if(data[i].roStatCd == '05') { #
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="bg_blue2 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        # dlReadyCnt++; #
        # } else if(data[i].roStatCd == '06') { #
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="bg_blue3 sc_event">#= data[i].roDocNo #</td>
        # dlConfCnt++; #
        # } else {#
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        # } #
    </tr>
    # } #

    # for (var i = 0; i < 18 - data.length; i++) { #
    <tr>
        <th scope="row" style="height:30px"></th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    # } #
    # $(".readyCnt").html(readyCnt); #
    # $(".prcStartCnt").html(prcStartCnt); #
    # $(".prcStopCnt").html(prcStopCnt); #
    # $(".qtTestCnt").html(qtTestCnt); #
    # $(".dlReadyCnt").html(dlReadyCnt); #
    # $(".dlConfCnt").html(dlConfCnt); #
</script>

<script type="text/javascript">

var techManSearchPopupWin;

var sysDate = new Date("<c:out value='${sysDate}' />");

var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

//Confirm Modal
var confirmWindow = $("<div/>").kendoWindow({
    title:""
    ,resizable:false
    ,modal:true
    ,width:300
});

//할인유형
var dcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${dcTpList}">
dcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//할인유형 Map
var dcTpMap = dms.data.arrayToMap(dcTpList, function(obj){ return obj.cmmCd; });

//카드종류구분 Array
var cardTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${cardTpCdList}">
cardTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//카드종류구분 Map
var cardTpMap = [];
$.each(cardTpList, function(idx, obj){cardTpMap[obj.cmmCd] = obj.cmmCdNm;});

//할인구분 대상Array
var dcPermTpList = [];
<c:forEach var="obj" items="${dcPermTpList}">
dcPermTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//할인구분 대상 Map
var dcPermTpMap = dms.data.arrayToMap(dcPermTpList, function(obj){ return obj.cmmCd; });

//BM쿠폰용도 Array
var bmCupnTpList = [];
<c:forEach var="obj" items="${bmCupnTpList}">
bmCupnTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//BM쿠폰용도  Map
var bmCupnTpMap = dms.data.arrayToMap(bmCupnTpList, function(obj){ return obj.cmmCd; });

// DC 구분
dcTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(dcTpMap[val] != undefined)
        returnVal = dcTpMap[val].cmmCdNm;
    }
    return returnVal;
};

// DC 구분
dcDstinCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(dcDstinMap[val] != undefined)
        returnVal = dcDstinMap[val].cmmCdNm;
    }
    return returnVal;
};

//할인대상구분
setDcPermTpMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(dcPermTpMap[value] != undefined)
            resultVal = dcPermTpMap[value].cmmCdNm;
    }
    return resultVal;
};

//BM쿠폰용도
setBmCupnTpMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(bmCupnTpMap[value] != undefined)
            resultVal = bmCupnTpMap[value].cmmCdNm;
    }
    return resultVal;
};
//服务
$(document).ready(function() {

    var height = $(window).height();
    $("#processDiv").css("height", height - 30);

    <c:if test="${preFixId ne 'RE'}" >
    var resvStatCdList = [];
    //공통코드:예약상태
    <c:forEach var="obj" items="${resvStatCdList}">
    resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    </c:if>
    var resvStatMap = dms.data.arrayToMap(resvStatCdList, function(obj){return obj.cmmCd;});

    //공통코드:구원유형
    var rescueTpCdList = [];
    <c:forEach var="obj" items="${rescueTpCdList}">
    rescueTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var rescueTpMap = dms.data.arrayToMap(rescueTpCdList, function(obj){return obj.cmmCd;});


    // 예약상태
    setKanbanResvStatMap= function(value){
        var resultVal = "";

        if( dms.string.isNotEmpty(value)){
            if(resvStatMap[value] != undefined){
                resultVal = resvStatMap[value].cmmCdNm;
            }
        }
        return resultVal;
    };


    // 구원서비스유형
    setKanbbanRescueTpCdMap= function(value){
        var resultVal = "";

        if( dms.string.isNotEmpty(value)){
            if(rescueTpMap[value] != undefined){
                resultVal = rescueTpMap[value].cmmCdNm;
            }
        }
        return resultVal;
    };


    $("#kanbanTabstrip").kendoExtTabStrip({
        animation:false
     });

    // 초기화
    $("#resvInit").kendoButton({
        click:function(e) {
            confirmWindow.data("kendoWindow")
            .title("<spring:message code='global.btn.init'/>")
            .content($("#info-init").html())
            .center().open();

            $(".btn_yes, .btn_no").click(function(){

                if($(this).hasClass("btn_yes")){

                    initAll();
                }

                confirmWindow.data("kendoWindow").close();

            }).end();
        }
    });

    /********************** 예약현황보드 **********************/
    var resvStart;
    var resvEnd;
    var resvResource;
    var resvEventData;
    var resvToDay = new Date();

    <c:if test="${preFixId ne 'PRE'}">
    var minorTickCount = 2;
    var dataTextField = "bayNm";
    var isTablet = ${isTablet}+"";
    //var dataValueField = "bayNo"

    <c:if test="${serSetInfo.resvIvalCd ne null}">
        <c:choose>
            <c:when test="${serSetInfo.resvIvalCd eq '01'}">
                minorTickCount = 4;
            </c:when>
            <c:when test="${serSetInfo.resvIvalCd eq '02'}">
                minorTickCount = 2;
            </c:when>
            <c:when test="${serSetInfo.resvIvalCd eq '03'}">
                minorTickCount = 1;
            </c:when>
        </c:choose>
    </c:if>

    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";

    <c:if test="${serSetInfo.resvAvlbStartHm ne null}">
        startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " ${serSetInfo.resvAvlbStartHm}";
        endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " ${serSetInfo.resvAvlbEndHm}";
      //-------liuxueying update 由于kendo 时间插件 endTime为选择不到的时间，所以一直少一个间隔时间段，此处做调整 start---
        var resvIvalCdFlag = "${serSetInfo.resvIvalCd}";
        var nowDt = new Date();
        if(resvIvalCdFlag == "01"){//间隔15分钟
        	endTime = getActualEndTime(endTime,15);
        }else if(resvIvalCdFlag == "02"){//30分钟
        	endTime = getActualEndTime(endTime,30);
        }else if(resvIvalCdFlag == "03"){//60分钟
        	endTime = getActualEndTime(endTime,60);
        }    
        //--------liuxueying update end
    </c:if>
    //-------liuxueying update 由于kendo 时间插件 endTime为选择不到的时间，所以一直少一个间隔时间段，此处做调整 start---
    function getActualEndTime(endTime,minutes){
    	nowDt.setTime(new Date(endTime));
    	nowDt.setTime(nowDt.getTime() + parseInt(minutes)*60*1000);
    	var actualYear = nowDt.getFullYear(); //获取完整的年份(4位,1970-????)    
    	var actualMonth =nowDt.getMonth();      //获取当前月份(0-11,0代表1月)    
    	var actualDate = nowDt.getDate();      //获取当前日(1-31)    
    	var actualHours = nowDt.getHours();      //获取当前小时数(0-23)    
    	var actualMinutes = nowDt.getMinutes();
    	endTime = actualYear+"/"+(parseInt(actualMonth)+1)+"/"+actualDate+" " +actualHours+":"+actualMinutes;
    	return endTime;
    }
    //-----------liuxueying update end------------

    <c:if test="${serSetInfo.boardStdPrefCd ne null}">
        <c:if test="${serSetInfo.boardStdPrefCd eq '01'}">
            dataTextField = "admSaNm";
            dataValueField = "admSaId";
        </c:if>
    </c:if>

    var slide = kendo.fx($("#slide-in-share")).slideIn("right"),
    visible = true;

    $("#slide-in-handle").click(function(e) {
        slidePlay();
        $("#scheduler").data("kendoScheduler").dataSource.read();
        $("#scheduler > .k-scheduler-toolbar ul:nth-child(2)").hide();      // day button delete
        $("#scheduler > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();   // 오늘날짜 삭제

        scheduler.element.height($(".slide_menu").height()-23);

        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        e.preventDefault();
    });

   /********************** 예약계획보드 **********************/
    $("#scheduler").kendoScheduler({
        date:sysDate
       ,startTime:new Date(startTime)
       ,endTime:new Date(endTime)
       ,majorTick:60
       ,minorTickCount:minorTickCount
       //,minorTickCount:1
       ,editable:false
       ,footer:false
       ,allDaySlot:false
       ,eventTemplate:$("#resvInfoView").html()
       ,views:[{ type:"day" }]
       ,autoBind:false
       ,selectable:true
       ,navigate:function(e){
           resvToDay = new Date(e.date);
           $("#scheduler").data("kendoScheduler").dataSource.read();
       }
       ,dataSource:{
           batch:true
           ,transport:{
               read:{
                   url:"<c:url value='/ser/rev/reservationReceipt/selectKanbanReservation.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["sDlrCd"] = "${dlrCd}";
                       params["sListType"] = "02";
                       params["sResvIvalCd"] = "${serSetInfo.resvIvalCd}";
                       params["sSerResvStartFromDt"] = kendo.parseDate(kendo.toString(resvToDay, "yyyy-MM-dd"));
                       params["sSerResvStartToDt"] = kendo.parseDate(kendo.toString(resvToDay, "yyyy-MM-dd"));
                       params["sSaNm"] = $("#sKanbanSaNm").val();
                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               data:"data"
               ,total:"total"
               ,model:{
                   id:"resvDocNo"
                   ,fields:{
                       dlrCd:{type:"string"}
                       ,resvDocNo:{type:"string"}
                       ,carOwnerId:{type:"string"}
                       ,carOwnerNm:{type:"string"}
                       ,driverNm:{type:"string"}
                       ,saId:{type:"string"}
                       ,bayNo:{type:"string"}
                       ,start:{type:"date", from:"serResvStartDt"}
                       ,end:{type:"date", from:"serResvEndDt"}
                       ,title:{type:"string", from:"carRegNo"}
                       ,vinNo:{type:"string", from:"vinNo"}
                       ,noResvTp:{type:"string"}
                       ,resvDt:{type:"date"}
                   }
               }
           }
       }
       ,group:{
           resources:["BAY"]
       }
       ,resources:[
           {
               field:"bayNo"
               ,name:"BAY"
               ,title:"BAY"
               ,dataTextField:dataTextField
               ,dataValueField:"bayNo"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                           ,dataType:"json"
                           ,type:"POST"
                           ,contentType:"application/json"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               params["sDlrCd"] = "${dlrCd}";
                               params["sVrYn"] = "Y";

                               return kendo.stringify(params);

                           }else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       data:"data"
                       ,total:"total"
                       ,model:{
                           id:"bayNo"
                           ,fields:{
                               dlrCd:{type:"string"}
                               ,bayNo:{type:"string"}
                               ,bayNm:{type:"string"}
                           }
                       }
                   }
               }
           }
       ]
       ,change:function(event) {

           <c:if test="${preFixId eq 'RE'}">
           resvStart = event.start;
           resvEnd = event.end;
           resvResource = event.resources;

           resvEventData = event.sender.dataSource._data;
           </c:if>
       }
       ,dataBound:function(event) {
           resvToDay = new Date($("#scheduler").data("kendoScheduler")._model.selectedDate);
           resvEventData = event.sender.dataSource._data;
           $("#scheduler > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
       }
   });

    $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event' , function(event) {

        var scheduler = $("#scheduler").getKendoScheduler();
        var element = $(event.target).is(".k-event") ? $(event.target):$(event.target).closest(".k-event");
        var uid = scheduler.occurrenceByUid(element.data("uid"));

        if ( uid ) {

        } else {            // 신규
            if(resvResource != undefined){

                var dupCnt = 0;

                $(resvEventData).each(function (idx , obj){
                    var resvBayNo = obj.bayNo;
                    var startDt   = kendo.toString(kendo.parseDate(obj.start),"<dms:configValue code='dateFormat'/> HH:mm") ;
                    var endDt     = kendo.toString(kendo.parseDate(obj.end),"<dms:configValue code='dateFormat'/> HH:mm") ;
                    var selectdResvStart = kendo.toString(kendo.parseDate(resvStart),"<dms:configValue code='dateFormat'/> HH:mm") ;

                    if( obj.resvStartDt != null){

                        var compared = ( startDt == selectdResvStart && selectdResvStart < endDt) ? true : false;

                        if( (dupCnt == 0 ) && (resvBayNo == resvResource.bayNo) && ( compared)){
                           dupCnt++;
                           dms.notification.info("<spring:message code='ser.info.doNotSelectTime'/>");
                        }
                    }

                });

                if(dupCnt == 0 ){

                    if(resvStart < new Date()){
                        dms.notification.info("<spring:message code='ser.info.doNotSelectTime'/>");
                    } else {

                        $("#bayNo").val(resvResource.bayNo);
                        $("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value(resvStart);
                        slidePlay();
                    }
                }
            }
        }
    });

    //khskhs doubletab
    $("#scheduler").on('doubletap','.k-scheduler-table td, .k-event', function(event){
        var scheduler = $("#scheduler").getKendoScheduler();
        var element = $(event.target).is(".k-event") ? $(event.target):$(event.target).closest(".k-event");
        var uid = scheduler.occurrenceByUid(element.data("uid"));

        if ( uid ) {

        } else {            // 신규
            if(resvResource != undefined){
                if(resvStart < new Date()){
                    dms.notification.info("<spring:message code='ser.info.doNotSelectTime'/>");
                } else {
                    $("#bayNo").val(resvResource.bayNo);
                    $("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value(resvStart);
                    slidePlay();
                }
            }
        }
    });
  //khskhs doubletab

    // 예약스케줄러
    var scheduler = $("#scheduler").data("kendoScheduler");
    $("#scheduler > .k-scheduler-toolbar ul > li:nth-child(4)").after('<span class="scheduler_search_form"><spring:message code="ser.lbl.saAppoint" /><div id="resvSearch" class="form_search" style="float:right;width:120px;height:23px;margin-left:10px;"><input type="text" id="sKanbanSaNm" name="sKanbanSaNm" class="form_input" /><a href="#" onclick="userSearch(\'scheduler\',\'sKanbanSaNm\')" ></a></span>');

    // 스케줄러 툴팁
    $("#scheduler").kendoTooltip({
        filter:".resvtp",
        position:"bottom",
        width:200,
        height:60,
        content:kendo.template($('#resvItemTooltip').html())
    });

    $("#sKanbanSaNm").keypress(function(e){
        $("#scheduler > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
        $("#scheduler > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();

        if(e.keyCode === 13 && dms.string.strNvl($("#sKanbanSaNm").val()) != ""){
            e.preventDefault();
            $("#scheduler").data("kendoScheduler").dataSource.read();
        }
    });

    if(preFixId == "RE") {  // 예약접수일 때만
        // 스케줄 원클릭 이벤트
        scheduler.wrapper.on("mouseup touchend", ".k-scheduler-table td, .k-event", function(e) {

            var target = $(e.currentTarget);

            if (target.hasClass("k-event")) {

                e.preventDefault();

                var event = scheduler.occurrenceByUid(target.data("uid"));

                // 예약불가가 아닐경우에만 팝업 오픈
                if(event.noResvTp != "02"){
                    confirmWindow.data("kendoWindow")
                    .content($("#info-confirmation").html())
                    .center().open();
                }


                $(".btn_yes, .btn_no").click(function(){

                    if($(this).hasClass("btn_yes")){

                        detailSet(event, true, "RE"); // 상세 정보
                    }

                    confirmWindow.data("kendoWindow").close();

                }).end();
            }
        });
    }

    slidePlay = function(){
        if (visible) {
            slide.reverse();
            $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
            $("#scheduler > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  " + formatToday);
        } else {
            slide.play();
        }
        visible = !visible;
    };
    </c:if>

    var startTime1 = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime1 = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";


    /********************** 사전점검보드 **********************/

    var diagToDay = new Date();

    var dsList =  [
                    {dlrCd: "D0103",title:"" ,diagDocNo:"PC201610-0044" ,useYn:"Y",start:"2017/02/10 13:00",end:"2017/02/10 13:20" ,carRegNo:"23456",vinNo:"LBEADAFC7GX048979",grpNo:"1" }
                   ,{dlrCd: "D0103",title:"" ,diagDocNo:"PC201610-0045" ,useYn:"Y",start:"2017/02/10 13:30",end:"2017/02/10 13:50" ,carRegNo:"23456",vinNo:"LBEADAFC7GX048979",grpNo:"1" }
                   ,{dlrCd: "D0103",title:"" ,diagDocNo:"PC201610-0046" ,useYn:"Y",start:"2017/02/10 14:00",end:"2017/02/10 14:20" ,carRegNo:"23456",vinNo:"LBEADAFC7GX048979",grpNo:"1" }
                  // ,{dlrCd: "D0103",title:"" ,diagDocNo:"PC201610-0047" ,useYn:"Y",start:"2017/02/10 14:32",end:"2017/02/10 14:32" ,carRegNo:"23456",vinNo:"LBEADAFC7GX048979",grpNo:"1" }

   ];

    var dataList = { data : dsList , total : 2};

    <c:if test="${(preFixId ne 'RE') && (preFixId ne 'PRE')}" >

    //http://localhost:8080/bhmc-dms-web/ser/ro/preCheck/selectPreChkKanbans.do?preFixId=PC
    $("#scheduler1").kendoScheduler({
        date:sysDate
        ,startTime:new Date(startTime1)
        ,endTime:new Date(endTime1)
        ,editable:false
        ,footer:false
        ,allDaySlot:false
        ,autoBind:false
        ,eventTemplate:$("#preChkInfoView").html()
        ,views:[
            { type:"day"
             ,columnheight : 160
            }
        ]
        ,navigate:function(e){
            diagToDay = new Date(e.date);
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        }
        ,dataSource:{
            batch:true
            ,transport:{
                 read:{
                     url:"<c:url value='/ser/ro/preCheck/selectPreChkKanbans.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sFromDt"] = kendo.parseDate(kendo.toString(diagToDay, "yyyy-MM-dd"));
                        params["sRegUsrNm"] = $("#sRegUsrNm").val();
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                data:"data"
                ,total:"total"
                ,model:{
                    id:"diagDocNo"
                    ,fields:{
                         dlrCd:{type:"string"}
                        ,diagDocNo:{type:"string"}
                        ,resvDocNo:{type:"string"}
                        ,start:{type:"date" , from:"preChkDt" }
                        ,end:{type:"date" , from:"preChkEndDt" }
                        ,roGrpNo:{type:"string"}
                        ,tecId:{type:"string"}
                        ,tecNm:{type:"string" }
                        ,title:{type:"string", from:"carRegNo"}
                        ,vinNo:{type:"string", from:"vinNo"}
                        ,carOwnerNm:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,runDistVal:{type:"number"}
                        ,grpNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,remark:{type:"string"}
                    }
                }
            }
        }
        ,group:{
            resources:["PC"]
        }
        ,resources:[
            {
                field:"grpNo"
                ,name:"PC"
                ,title:"PC"
                ,dataTextField:""
                ,dataValueField:"grpNo"
                ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/ser/ro/preCheck/selectPreChkKanbanRows.do' />"
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        data:"data"
                        ,total:"total"
                        ,model:{
                            id:"grpNo"
                            ,fields:{
                                 grpNo:{type:"string"}
                            }
                        }
                    }
                }
            }
        ]
        ,dataBound:function() {
            diagToDay = new Date($("#scheduler1").data("kendoScheduler")._model.selectedDate);
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
        }
    });

    $("#scheduler1 > .k-scheduler-toolbar ul > li:nth-child(4)").after('<span class="scheduler_search_form"><spring:message code="ser.lbl.preChkNm" /><div id="preSearch" class="form_search" style="float:right;width:120px;height:23px;margin-left:10px;"><input type="text" id="sRegUsrNm" name="sRegUsrNm" class="form_input" /><a href="#" onclick="userSearch(\'scheduler1\',\'sRegUsrNm\')" ></a></span>');
    var slide1 = kendo.fx($("#slide-in-share1")).slideIn("right"),
    visible1 = true;

    $("#slide-in-handle1").click(function(e) {

        $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
        $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
        $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
        $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  "+ formatToday);

        var agt = navigator.userAgent.toLowerCase();
        var kanHeigth = 0;
        /* if(agt.indexOf("chrome") != -1) {
            //kanHeigth = 15;
            kanHeigth = 105;
            //console.log("chrome")
        }else{
            kanHeigth = 100;
            //console.log("other")
        } */
        kanHeigth = 23;
        scheduler1.element.height($(".slide_menu").height()-kanHeigth);

        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");

        slidePlay1();

        e.preventDefault();
    });

    // 입고점검 스케줄러

    var scheduler1 = $("#scheduler1").data("kendoScheduler");

    // 입고점검 스케줄러 툴팁
    $("#scheduler1").kendoTooltip({
        filter:".k-event"
       // ,position:"top"
        ,width:200
        ,height:50
        ,content:kendo.template($('#preChkTooltip').html())
    });

    // 입고점검 스케줄 원클릭 이벤트
    scheduler1.wrapper.on("mouseup touchend", ".k-scheduler-table td, .k-event", function(e) {

        var target = $(e.currentTarget);

        if (target.hasClass("k-event")) {
            e.preventDefault();

            var event = scheduler1.occurrenceByUid(target.data("uid"));

            if(event.useYn == "Y"){

                $("#messageId").html("<spring:message code='ser.lbl.preChkInfo' var='preChkInfo' />"+
                                      "<spring:message code='global.info.callSelectItem' arguments='${preChkInfo}' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        $("#runDistVal").val(event.runDistVal);
                        detailSet(event, true, "PC"); // 상세 정보
                        confirmWindow.data("kendoWindow").close();
                    }
                    conformKendoWindow.close();

                }).end();
            }else{
                dms.notification.info("<spring:message code='ser.info.noSelectPreCheck'/>");
            }


        }
    });

    slidePlay1 = function(){
        if (visible1) {
            slide1.reverse();
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        } else {
            slide1.play();
        }
        visible1 = !visible1;
    };

    </c:if>

    $("#sRegUsrNm").keypress(function(e){
        $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
        $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();

        if(e.keyCode === 13 && dms.string.strNvl($("#sRegUsrNm").val()) != ""){
            e.preventDefault();
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        }
    });

    searchPreChk = function(){

        if(dms.string.strNvl($("#sRegUsrNm").val()) != ""){
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        }
    }

    /********************** 인도현황보드 **********************/
    var deleveryToDay = new Date();
    <c:choose>
        <c:when test="${preFixId eq 'PC'}">
            var slide2 = kendo.fx($("#slide-in-share2")).slideIn("right"),
            visible2 = true;

            $("#slide-in-handle2").click(function(e) {
                $(".slide-in-share").removeClass("z-index-top");
                $(this).parent().addClass("z-index-top");
                if (visible2) {
                    slide2.reverse();
                } else {
                    slide2.play();
                }
                visible2 = !visible2;
                e.preventDefault();
            });

            var slide3 = kendo.fx($("#slide-in-share3")).slideIn("right"),
            visible3 = true;

            $("#slide-in-handle3").click(function(e) {
                $(".slide-in-share").removeClass("z-index-top");
                $(this).parent().addClass("z-index-top");
                if (visible3) {
                    slide3.reverse();
                    var dcGrid = $("#dcGrid").data("kendoExtGrid");
                    dcGrid.dataSource.data([]);

                    if(dms.string.strNvl($("#driverNm").val()) != "") {
                        dcGrid.dataSource.read();
                    }
                } else {
                    slide3.play();
                }
                visible3 = !visible3;
                e.preventDefault();
            });

            /********************** 멤버스포인트, 기타할인 **********************/
            // 블루멤버스 조회
            $("#bmSearch").kendoButton({
                click:function(e) {
                    blueMemberInfo();
                }
            });

            //딜러포인트 그리드
            $("#dlrPointGrid").kendoExtGrid({
                dataSource:[{ gradeNm:"", cardNo:"", dlrUsePurpose:"" }]
                ,pageable:false
                ,height:50
                ,selectable:"row"
                ,reorderable:false
                ,filterable:false                 // 필터링 기능 사용안함
                ,resizable:false
                ,scrollable:false
                ,sortable:false
                ,editable:false
                ,edit:function(e){
                    var fieldName = e.container.find("input").attr("name");
                    var fieldName2 = $(e.container.find("input")[1]).attr("name");

                    if(fieldName == "membershipNm" || fieldName == "membershipNo" || fieldName == "gradeNm" || fieldName == "lastPointVal" || fieldName == "dlrUseAmt") {
                        this.closeCell();
                    }

                    if(fieldName2 == "dlrUseAmt") {
                        this.closeCell();
                    }
                }
                ,columns:[
                    {field:"membershipNm", title:"<spring:message code='ser.lbl.dlrMembNm' />", width:100}     // 회원명
                    ,{field:"gradeNm", title:"<spring:message code='ser.lbl.membGrade' />", width:70}         // 회원레벨
                    ,{field:"lastPointVal", title:"<spring:message code='ser.lbl.avlbPoint' />", width:90, attributes:{"class":"ar"}}         // 이번가용포인트
                    ,{field:"lastPointVal", title:"<spring:message code='ser.lbl.savePoint' />", width:75, attributes:{"class":"ar"}}         // 누적포인트
                    ,{field:"occrPointVal", title:"<spring:message code='ser.lbl.thisUsePoint' />", width:95, attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                min:0
                                ,decimals:0
                                ,spinners:false
                                ,change:function(e){
                                    var grid = $("#dlrPointGrid").data("kendoExtGrid");
                                    var rowData = grid.dataItem("tr:eq(0)");
                                    var maxPoint = Number(rowData.membershipPointUseMaxPoint);
                                    if(rowData.occrPointVal > maxPoint){
                                        dms.notification.info("<spring:message code='global.lbl.limitPoint' var='limitPoint'/><spring:message code='ser.info.validation.amt' arguments='${limitPoint}["+maxPoint+"]' />");
                                        rowData.set("occrPointVal", maxPoint);
                                        rowData.set("dlrUseAmt", (maxPoint * Number($("#pointExchgScale").val())).toFixed(2));
                                        this.max(rowData.lastPointVal);
                                    } else {
                                        rowData.set("dlrUseAmt", (Number(rowData.occrPointVal) * Number($("#pointExchgScale").val())).toFixed(2));
                                        this.max(rowData.lastPointVal);
                                    }
                                }
                            });
                        }
                    }   // 포인트사용금액
                    ,{field:"dlrUseAmt", title:"<spring:message code='ser.lbl.thisUseAmt' />", width:90, attributes:{"class":"ar"}}      // 이번사용금액
                    ,{field:"dlrUsePurpose", title:"<spring:message code='ser.lbl.purposeOfUse' />", width:75
                        ,attributes:{"class":"ac"}
                        ,template:"#=setBmCupnTpMap(dlrUsePurpose)#"
                        ,editor:function(container, options){
                            $('<input required name="dlrUsePurpose" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:bmCupnTpList
                            });
                        }
                    }   // 사용용도
                    ,{field:"cardNo", hidden:true}
                    ,{field:"membershipNo", hidden:true}
                    ,{field:"membershipPointUseMaxPoint", hidden:true}
                ]

            });

            /** 去掉蓝缤相关的积分查询部分，只保留自店会员部分  田佳兴 2020-6-24 stat
            //블루멤버스 그리드
            $("#bmPointGrid").kendoExtGrid({
                dataSource:[{consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]
                ,height:50
                ,selectable:"row"
                ,reorderable:false
                ,filterable:false                 // 필터링 기능 사용안함
                ,resizable:false
                ,scrollable:false
                ,pageable:false
                ,editable:false
                ,edit:function(e){
                    var fieldName = e.container.find("input").attr("name");
                    var fieldName2 = $(e.container.find("input")[1]).attr("name");

                    if(fieldName == "bmMembershipNm" || fieldName == "mLevel" || fieldName == "point" || fieldName == "bmUseAmt") {
                        this.closeCell();
                    }

                    if(fieldName2 == "bmUseAmt") {
                        this.closeCell();
                    }

                }
                ,columns:[
                     {field:"bmMembershipNm", title:"<spring:message code='ser.lbl.bmMembNm' />", width:100}         // BM회원명
                    ,{field:"mLevel", title:"<spring:message code='ser.lbl.membGrade' />", width:70                  // 회원등급
                        ,attributes:{"class":"ac"}
                        ,template:"#=getBmMemberGradeCdMap(mLevel)#"
                     }
                    ,{field:"point", title:"<spring:message code='ser.lbl.bmAvlbPoint' />", width:90, attributes:{"class":"ar"}}          // BM이번가용포인트
                    ,{field:"point", title:"<spring:message code='ser.lbl.bmSavePoint' />", width:75, attributes:{"class":"ar"}}          // BM누적포인트
                    ,{field:"consumePoints", title:"<spring:message code='ser.lbl.bmThisUsePoint' />", width:95, attributes:{"class":"ar"}// BM포인트사용
                        ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                min:0
                                ,decimals:0
                                ,format:"{0:n0}"
                                ,spinners:false
                                ,change:function(e){
                                    var grid = $("#bmPointGrid").data("kendoExtGrid");
                                    var rowData = grid.dataItem("tr:eq(0)");
                                    var maxPoint = Number(rowData.maxConsumePoint);
                                    if(rowData.consumePoints > maxPoint){
                                        dms.notification.info("<spring:message code='global.lbl.limitPoint' var='limitPoint'/><spring:message code='ser.info.validation.amt' arguments='${limitPoint}["+maxPoint+"]' />");
                                        rowData.set("consumePoints", maxPoint);
                                        rowData.set("bmUseAmt", (maxPoint * Number($("#bmPointScale").val())).toFixed(2));
                                        this.max(rowData.point);
                                    }else{
                                        rowData.set("bmUseAmt", (Number(rowData.consumePoints) * Number($("#bmPointScale").val())).toFixed(2));
                                        this.max(rowData.point);
                                    }
                                }
                            });
                        }
                    }
                    ,{field:"bmUseAmt", title:"<spring:message code='ser.lbl.bmThisUseAmt' />", width:90, attributes:{"class":"ar"}}      // BM이번사용금액
                    ,{field:"bmUsePurpose", title:"<spring:message code='ser.lbl.bmPurposeOfUse' />", width:75                            // BM사용용도
                        ,attributes:{"class":"ac"}
                        ,template:"#=setBmCupnTpMap(bmUsePurpose)#"
                        ,editor:function(container, options){
                            $('<input required name="bmUsePurpose" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:bmCupnTpList
                            });
                        }
                    }
                    ,{field:"consumeType", hidden:true}                    // 소비 유형(0:사고차 수리(보통), 1:첫 정비, 2:차량 구매, 3:정기 정비, 8:판금 )
                    ,{field:"custNo", hidden:true}                         // 고객번호
                    ,{field:"vin", hidden:true}                            // VIN
                    ,{field:"totalCost", hidden:true}                      // 정산총금액
                    ,{field:"roDocNo", hidden:true}                        // RO번호
                    ,{field:"blueMembershipNo", hidden:true}               // 회원번호
                    ,{field:"maxConsumePoint",  width:75 ,hidden:true}     // MAX 사용포인트
                ]
            });

            //BM 쿠폰 그리드
            $("#bmCupnGrid").kendoExtGrid({
                dataSource:[{cardNo:"", couponBeginDate:"", couponEndDate:"" , bmCupnTp:""}]
                ,height:95
                ,width:800
                ,selectable:"row"
                ,filterable:false                 // 필터링 기능 사용안함
                ,resizable:false
                ,scrollable:false
                ,pageable:false
                ,sortable:false
                ,edit:function(e){

                    var fieldName = e.container.find("input").attr("name");

                    if(fieldName == "couponBeginDate" ||
                            fieldName == "couponEndDate" ||
                            fieldName == "reduceCost" ||
                            fieldName == "remark" ||
                            fieldName == "cupnTpNm" ) {
                        this.closeCell();
                    }

                    var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
                    var bmCupnData = bmCupnGrid.dataItem(bmCupnGrid.select());

                    if(bmCupnData.reduceCost > 0){
                        if(fieldName == "cardNo") {
                            this.closeCell();
                        }
                    }
                }
                ,columns:[
                    {field:"cardNo", title:"<spring:message code='ser.lbl.bmCupnNo' />", width:90}      // BM쿠폰번호
                    ,{field:"cupnNm", title:"<spring:message code='ser.lbl.bmCupnNm' />", width:170}    // BM쿠폰명칭
                    ,{field:"couponBeginDate", title:"<spring:message code='ser.lbl.cupnApplyStartDt' />", width:90, attributes:{"class":"ar"}
                        ,attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    }    // 쿠폰적용시작일자
                    ,{field:"couponEndDate", title:"<spring:message code='ser.lbl.cupnApplyEndDt' />", width:90, attributes:{"class":"ar"}
                        ,attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    }      // 쿠폰적용종료일자
                    ,{field:"remark", title:"<spring:message code='ser.lbl.cupnRemark' />", width:180}      // 쿠폰비고
                    ,{field:"reduceCost", title:"<spring:message code='ser.lbl.cupnApplyAmt' />", width:90, attributes:{"class":"ar"}}    // 쿠폰적용금액
                    ,{field:"bmCupnTp", title:"<spring:message code='ser.lbl.cupnUse' />", width:90        // 쿠폰용도
                        ,template:function(dataItem){
                            var returnObj = "";
                            if(dataItem.bmCupnTp != undefined){
                                returnObj =  setBmCupnTpMap(dataItem.bmCupnTp);
                            }
                            return returnObj ;
                        }
                        ,editor:function(container, options){
                            $('<input id="bmCupnTp" data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,valuePrimitive:true
                                ,dataSource:bmCupnTpList
                            });
                            $('<span class="k-invalid-msg" data-for="bmCupnTp"></span>').appendTo(container);
                         }
                    }
                    ,{field:"cupnTpNm", title:"<spring:message code='ser.lbl.cupnTp' />", width:90, hidden:true}     // 쿠폰유형(BM(蓝缤) 디폴트)
                ]
            });
                                去掉蓝缤相关的积分查询部分，只保留自店会员部分  end*/
                              //服务结算卡券信息 贾明 
                                $("#bmCupnGrid").kendoExtGrid({
                                    dataSource:[{cardNo:"", couponBeginDate:"", couponEndDate:"" , bmCupnTp:""}]
                                    ,height:95
                                    ,width:800
                                    ,selectable:"row"
                                    ,reorderable:false
                                    ,filterable:false                 // 필터링 기능 사용안함
                                    ,resizable:true
                                    ,scrollable:true
                                    ,pageable:false
                                    ,sortable:false
                                    ,edit:function(e){
                                        var eles = e.container.find("input");
                                        var selectedItem = e.model;
                                        var fieldName;
                                        if(eles.length > 1){
                                            fieldName = eles[eles.length-1].getAttribute("name");
                                        }else{
                                            fieldName = eles.attr("name");
                                        }

                                        if(fieldName == "cardNm" ||
                                           fieldName == "cardTp" ||
                                           fieldName == "cardDeno" ||
                                           fieldName == "claimAmo" ||
                                           fieldName == "cardUseNoti" ||
                                           fieldName == "expirationDate") {    //截止日期不能修改
                                            this.closeCell();
                                        }
                                        var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
                                        var bmCupnData = bmCupnGrid.dataItem(bmCupnGrid.select());
                                        if($("#bmCupnTotAmt").val() > 0){
                                            if(fieldName == "cardNo") {
                                                this.closeCell();
                                            }
                                        }
                                    }
                                    ,columns:[
                                        {field:"cardNo", title:"<spring:message code='ser.lbl.cardNumber' />", width:100
                                            ,editor:function(container, options){
                                                $('<input id="cardNo" name="cardNo" data-bind="value:' + options.field + '" style="text-transform: uppercase"  />')
                                                .appendTo(container)
                                                .kendoMaskedTextBox({
                                                    mask:"AAAAAAAAAAAAAAAAAAAA"
                                                    ,promptChar:""
                                                })
                                                .bind("keyup", function(){
                                                    var that = $(this).data("kendoMaskedTextBox");
                                                    this.value = that.raw().toUpperCase();
                                                })
                                                ;
                                            }
                                        }    // 卡券编号
                                        ,{field:"cardNm", title:"<spring:message code='ser.lbl.cardName' />", width:150}    // 卡券名称
                                        ,{field:"cardTp", title:"<spring:message code='ser.lbl.couponType' />", width:150}     // 卡券类型
//                                      ,{field:"cardDeno", title:"<spring:message code='sal.lbl.LanBinCardAmount' />", width:80, attributes:{"class":"ar"}}    // 卡券面额
                                        ,{field:"cardDeno", title:"<spring:message code='ser.lbl.cupnApplyAmt' />", width:80, attributes:{"class":"ar"}}    // 20200622 tjx"卡券面额"修改为"优惠金额"
                                        ,{field:"cardAdjust", title:"<spring:message code='ser.lbl.adjustment' />", width:80        
                                            ,template:function(dataItem){
                                                var returnObj = "";
                                                if(dataItem.cardAdjust != undefined){
                                                    returnObj =  setBmCupnTpMap(dataItem.cardAdjust);
                                                }
                                                return returnObj ;
                                            } 
                                            ,editor:function(container, options){
                                                $('<input id="cardAdjust" name="cardAdjust" data-bind="value:' + options.field + '"  />')
                                                .appendTo(container)
                                                .kendoExtDropDownList({
                                                    dataTextField:"cmmCdNm"
                                                    ,dataValueField:"cmmCd"
                                                    ,valuePrimitive:true
                                                    ,dataSource:bmCupnTpList
                                                });
                                                $('<span class="k-invalid-msg" data-for="cardAdjust"></span>').appendTo(container);
                                             }
                                         }//调整项 sal.lbl.alDcAmt
                                       ,{field:"cupnChangeAmt", title:"<spring:message code='sal.lbl.alDcAmt' />", width:80, attributes:{"class":"ar"}
                                            ,format:"{0:n2}"
                                             ,editor:function(container, options){
                                                var grid = $("#bmCupnGrid").data("kendoExtGrid");
                                                var rowData = grid.dataItem(grid.select());
                                                $('<input id="cupnChangeAmt" name="cupnChangeAmt" maxlength=7 data-bind="value:' + options.field + '"  />')
                                                .appendTo(container)
                                                .kendoExtNumericTextBox({
                                                     min:(rowData.reduceCost * -1)
                                                    ,max:10000
                                                    ,decimals:2
                                                    ,spinners:false
                                                    ,restrictDecimals: true
                                                });
                                            }
                                        }    // 调整金额
                                        ,{field:"cardUseNoti", title:"<spring:message code='sal.lbl.LanBinUseNotice' />", width:135, attributes:{"class":"ar"}}    //使用须知
                                        ,{field:"expirationDate", title:"<spring:message code='sal.lbl.LanBinCardEffeDate' />", width:100, attributes:{"class":"ar"}}    //截止日期
                                        ,{field:"claimAmo", title:"<spring:message code='par.lbl.claimantTargetAmount' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"} //索赔金额
                                    ]
                                });
            setBmCupnTpNm = function(e){

                var grid = $("#bmCupnGrid").data("kendoExtGrid");//.dataSource._data;
                var selectedVal = grid.dataItem(grid.select());
                selectedVal.set("bmCupnTp",setBmCupnTpMap(selectedVal.bmCupnTp));

            };

            //기타할인 그리드 설정 : 쿠폰할인
            $("#dcGrid").kendoExtGrid({
                dataSource:{
                    transport:{
                       read:{
                           url:"<c:url value='/ser/svi/dcMaster/selectEtcDcTarget.do' />"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};
                               var dcUseTp;

                               if(preFixId == "CA"){
                                   dcUseTp = "03";
                               } else {
                                   dcUseTp = "04";
                               }

                               params["recordCountPerPage"] = 500;  //20200806  tjx 调整其他服务优惠券列表的显示范围
                               params["pageIndex"] = options.page;
                               params["firstIndex"] = options.skip;
                               params["lastIndex"] = 500;  //20200806  tjx 调整其他服务优惠券列表的显示范围
                               params["sort"] = options.sort;

                               var loginUsrId = "";
                               if(dms.string.isEmpty(loginUsrId)){
                                   loginUsrId = "${loginUsrId}";
                               }
                               params["sSaId"] = loginUsrId;
                               params["sCustNo"] = $("#carOwnerId").val();
                               params["sVinNo"] = $("#vinNo").val();
                               params["sToday"] = new Date("${sysDate}");
                               params["sDcUseTp"] = "03"

                               return kendo.stringify(params);

                           } else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       model:{
                           id:"rnum"
                           ,fields:{
                                dlrCd:{type:"string"}
                               ,dcCd:{type:"string"}
                               ,dcTp:{type:"string"}
                               ,dcNm:{type:"string"}
                               ,lbrDcAmt:{type:"number"}
                               ,parDcAmt:{type:"number"}
                               ,subDcAmt:{type:"number"}
                               ,dcApplyStartDt:{type:"date"}
                               ,dcApplyEndDt:{type:"date"}
                               ,dcScoreVal:{type:"string"}
                               ,dcUseYn:{type:"string"}
                               ,totCnt:{type:"number"}
                               ,useCnt:{type:"number"}
                           }
                       }
                   }
                }
                ,height:95
                ,width:800
                ,selectable:"row"
                ,reorderable:false
                ,filterable:false                 // 필터링 기능 사용안함
                ,resizable:false
                ,scrollable:false
                ,pageable:false
                ,sortable:false
                ,autoBind:false
                ,columns:[
                    {field:"dcCd", title:"<spring:message code='ser.lbl.custDcCd' />", width:100}  //할인코드
                    ,{field:"dcNm", title:"<spring:message code='ser.lbl.custDcNm' />", width:189}  //할인명
                    ,{field:"dcApplyStartDt", title:"<spring:message code='ser.lbl.custDcStartDt' />", width:90, attributes:{"class":"ar"}
                        ,attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    }      // 할인시작일자
                    ,{field:"dcApplyEndDt", title:"<spring:message code='ser.lbl.custDcEndDt' />", width:90, attributes:{"class":"ar"}
                        ,attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    }   // 할인마감일자
                    ,{field:"dcTp", title:"<spring:message code='ser.lbl.custDcTp' />", width:90, attributes:{"class":"ac"} //할인적용방식
                         ,template:"#=dcTpCdGrid(dcTp)#"
                    }
                    ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.custDcLbrAmt' />", width:90
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                    }   // 공임비할인
                    ,{field:"parDcAmt", title:"<spring:message code='ser.lbl.custDcParAmt' />", width:90
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                    }   // 부품비할인
                    ,{field:"subDcAmt", title:"<spring:message code='ser.lbl.serDiscount' />", width:90
                        ,attributes:{"class":"ar"}
                        ,format:"{0:n2}"
                    }   // 수리비할인
                    ,{field:"dcDstinCd", title:"<spring:message code='ser.lbl.dcDstinTp' />", width:90, attributes:{"class":"ac"}, hidden:true}  //할인유형(딜러(特约店) 디폴트) ser.lbl.dealer
                ]
            });

            setMemberShipInfo = function() {
                var dlrPointGrid = $("#dlrPointGrid").data("kendoExtGrid");
                var dlrRowData = dlrPointGrid.dataItem("tr:eq(0)");

                if(dlrRowData != null){
                    dlrRowData.set("membershipNm", $("#carOwnerNm").val());
                    dlrRowData.set("membershipNo", $("#membershipNo").val());
                    dlrRowData.set("gradeNm",      $("#gradeNm").val());
                    dlrRowData.set("lastPointVal", $("#lastPointVal").val());
                    dlrRowData.set("cardNo",       $("#dlrPointCardNo").val());
                    dlrRowData.set("occrPointVal", 0);
                    dlrRowData.set("dlrUsePurpose", "03");
                    dlrRowData.set("dlrUseAmt", 0);
                    dlrRowData.set("membershipPointUseMaxPoint", $("#membershipPointUseMaxPoint").val());
                }
            };

            setBmMemberShipInfo = function(){
                var bmPointGrid = $("#bmPointGrid").data("kendoExtGrid");
                var rowData = bmPointGrid.dataItem("tr:eq(0)");

                if(rowData != null){
                    rowData.set("bmMembershipNm",   $("#carOwnerNm").val());
                    rowData.set("blueMembershipNo", $("#bmMembershipNo").val());
                    rowData.set("mLevel",           $("#bmGradeCd").val());
                    rowData.set("point",            $("#bmLastPointVal").val());
                    rowData.set("consumeType", "0");
                    rowData.set("consumePoints", 0);
                    rowData.set("maxConsumePoint",  $("#bmMaxConsumInte").val());
                    rowData.set("custNo",           $("#carOwnerId").val());
                    rowData.set("vin",              $("#vinNo").val());
                    rowData.set("totalCost", 0);
                    rowData.set("roDocNo",          $("#roDocNo").val());
                    rowData.set("bmUsePurpose", "03");
                    rowData.set("bmUseAmt", 0);
                }
            }

            // BM쿠폰 검증
            $("#bmCupnVerify").kendoButton({
                click:function(e) {

                    var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
                    var bmCupnData = bmCupnGrid.dataItem(bmCupnGrid.select());

                    if(bmCupnData == null){

                        dms.notification.info("<spring:message code='ser.lbl.cupnNo' var='cupnNo'/><spring:message code='global.info.required.field' arguments='${cupnNo}' />");
                        return;
                    }
                    var param = {
                        custNo :$("#carOwnerId").val()
                        ,vin   :$("#vinNo").val()
                        ,cardNo:bmCupnData.cardNo
                    };
	            /** 注释crm508
                    $.ajax({
                        url:"<c:url value='/crm/dmm/blueMembershipJoin/selectCustomCardCodeInfoByDMSInfo.do' />"
                       ,data:JSON.stringify(param)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR, status, error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,success:function(result, textStatus){
                           if(result.IsSuccess){
                               if(result.Data.useStat){
                                   bmCupnData.set("cupnTpNm",  "<spring:message code='ser.lbl.blueMembers' />" );
                                   bmCupnData.set("couponBeginDate", result.Data.CardBeginDate);
                                   bmCupnData.set("couponBeginDate", result.Data.CardBeginDate);
                                   bmCupnData.set("couponEndDate", result.Data.CardEndDate);
                                   bmCupnData.set("reduceCost", result.Data.ReduceCost);
                                   bmCupnData.set("remark", result.Data.CardRemark);
                                   bmCupnData.set("bmCupnTp", "03");
                                   //$("#bmCupnSet").data("kendoButton").enable(true);
                               } else {
                                   bmCupnData.set("couponBeginDate", "");
                                   bmCupnData.set("couponEndDate", "");
                                   bmCupnData.set("reduceCost", "");
                                   bmCupnData.set("remark", "");
                                   bmCupnData.set("bmCupnTp", "03");
                                   //$("#bmCupnSet").data("kendoButton").enable(false);
                                   dms.notification.error(result.Data.Msg);
                               }
                           } else {
                               bmCupnData.set("couponBeginDate", "");
                               bmCupnData.set("couponEndDate", "");
                               bmCupnData.set("reduceCost", "");
                               bmCupnData.set("remark", "");
                               bmCupnData.set("bmCupnTp", "");
                               //$("#bmCupnSet").data("kendoButton").enable(false);
                               dms.notification.error(result.Message);
                           }
                       }
                   });*/
                }
            });
            /********************** 기타할인 **********************/
        </c:when>
        <c:otherwise>
            <c:if test="${(preFixId ne 'RE') && (preFixId ne 'PRE')}">
                var slide2 = kendo.fx($("#slide-in-share2")).slideIn("right"),
                visible2 = true;

                $("#scheduler2").kendoScheduler({
                    date:sysDate
                    ,startTime:new Date(startTime1)
                    ,endTime:new Date(endTime1)
                    ,editable:false
                    ,footer:false
                    ,allDaySlot:false
                    ,autoBind:false
                    ,eventTemplate:$("#deliveryInfoView").html()
                    ,views:[
                        { type:"day" }
                    ]
                    ,navigate:function(e){
                        deleveryToDay = new Date(e.date);
                        $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
                        $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
                        $("#scheduler2").data("kendoScheduler").dataSource.read();
                    }
                    ,dataSource:{
                        batch:true
                        ,transport:{
                            read:{
                                url:"<c:url value='/ser/ro/repairOrder/selectDeliveryKanban.do' />"
                               ,dataType:"json"
                               ,type:"POST"
                               ,contentType:"application/json"
                           }
                           ,parameterMap:function(options, operation) {
                               if (operation === "read") {

                                   var params = {};
                                   params["sExpcDlFromDt"] = kendo.parseDate(kendo.toString(deleveryToDay, "yyyy-MM-dd"));
                                   params["sRegUsrNm"] = $("#dlNm").val();

                                   return kendo.stringify(params);

                               }else if (operation !== "read" && options.models) {
                                   return kendo.stringify(options.models);
                               }
                           }
                       }
                       ,schema:{
                           data:"data"
                           ,total:"total"
                           ,model:{
                               id:"roDocNo"
                               ,fields:{
                                    dlrCd:{type:"string"}
                                   ,roDocNo:{type:"string"}
                                   ,start:{type:"date", from:"expcDlStartDt" }
                                   ,end:{type:"date", from:"expcDlDt" }
                                   ,dlDt:{type:"date"}
                                   ,roGrpNo:{type:"string"}
                                   ,tecId:{type:"string"}
                                   ,tecNm:{type:"string" }
                                   ,title:{type:"string", from:"roDocNo"}
                                   ,vinNo:{type:"string"}
                                   ,carOwnerNm:{type:"string"}
                                   ,grpNo:{type:"string"}
                                   ,carRegNo:{type:"string"}
                                   ,roDt:{type:"date"}
                                   ,roTpNm:{type:"string"}
                                   ,roStatNm:{type:"string"}
                               }
                           }
                       }
                   }
                    ,group:{
                        resources:["DL"]
                    }
                    ,resources:[
                        {
                            field:"grpNo"
                            ,name:"DL"
                            ,title:"DL"
                            ,dataTextField:""
                            ,dataValueField:"grpNo"
                            ,dataSource:{
                                transport:{
                                    read:{
                                        url:"<c:url value='/ser/ro/repairOrder/selectDeliveryKanbanRows.do' />"
                                        ,dataType:"json"
                                        ,type:"POST"
                                        ,contentType:"application/json"
                                    }
                                    ,parameterMap:function(options, operation) {
                                        if (operation === "read") {

                                            var params = {};

                                            return kendo.stringify(params);

                                        }else if (operation !== "read" && options.models) {
                                            return kendo.stringify(options.models);
                                        }
                                    }
                                }
                                ,schema:{
                                    data:"data"
                                    ,total:"total"
                                    ,model:{
                                        id:"grpNo"
                                        ,fields:{
                                             grpNo:{type:"string"}
                                        }
                                    }
                                }
                            }
                        }
                    ]
                   ,dataBound:function() {
                       deleveryToDay = new Date($("#scheduler2").data("kendoScheduler")._model.selectedDate);
                       $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
                       $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
                   }
                });

                var scheduler2 = $("#scheduler2").data("kendoScheduler");

                $("#scheduler2 > .k-scheduler-toolbar ul > li:nth-child(4)").after('<span class="scheduler_search_form"><spring:message code="ser.lbl.roWrtrNm" /><div id="tecSearch" class="form_search" style="float:right;width:120px;height:23px;margin-left:10px;"><input type="text" id="dlNm" name="dlNm" class="form_input" /><a href="#" onclick="userSearch(\'scheduler2\',\'dlNm\')" ></a></span>');

                $("#tecNm").keypress(function(e){
                    $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
                    $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();

                    if(e.keyCode === 13 && dms.string.strNvl($("#tecNm").val()) != ""){
                        e.preventDefault();
                        $("#scheduler2").data("kendoScheduler").dataSource.read();
                    }
                });

                $("#slide-in-handle2").click(function(e) {
                     $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
                     $("#scheduler2 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
                     $("#scheduler2 > .k-scheduler-toolbar ul:nth-child(2)").hide();      // day button delete
                     scheduler2.dataSource.read();
                     $("#scheduler2 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
                     $("#scheduler2 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  "+ formatToday);
                     scheduler2.element.height($(".slide_menu").height()-23);
                     $(".slide-in-share").removeClass("z-index-top");
                     $(this).parent().addClass("z-index-top");

                     if (visible2) {
                         slide2.reverse();
                     } else {
                         slide2.play();
                     }
                     visible2 = !visible2;
                     e.preventDefault();
                 });


                 // 스케줄러 툴팁
                 $("#scheduler2").kendoTooltip({
                     filter:".k-event",
                     position:"top",
                     width:200,
                     height:60,
                     content:kendo.template($('#deliveryTooltip').html())
                 });
            </c:if>

            /********************** 정비진도보드 **********************/
            var slide3 = kendo.fx($("#slide-in-share3")).slideIn("right"),
            visible3 = true;

            $("#slide-in-handle3").click(function(e) {
                scheduler2.element.height($(".slide_menu").height()-23);
                $(".slide-in-share").removeClass("z-index-top");
                $(this).parent().addClass("z-index-top");
                if (visible3) {
                    slide3.reverse();
                    refresh();
                } else {
                    slide3.play();
                }
                visible3 = !visible3;
                e.preventDefault();
            });

            // 스케줄러 툴팁
            $("#workProcessTemplate").kendoTooltip({
                filter:".sc_event",
                position:"left",
                width:120,
                height:60,
                content:function(e){
                    var target = e.target;
                    var roDocNo = target.text();
                    return getToolTipData(roDocNo);
                }
            });

            getToolTipData = function(roDocNo) {
                var returnTooltip = "";
                $.ajax({
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderInfoByKey.do' />"
                    ,data:JSON.stringify({sRoDocNo:roDocNo})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        var wrkEndDt = result.wrkEndDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.wrkEndDt));
                        var qtTestStartDt = result.qtTestStartDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.qtTestStartDt));
                        var qtTestEndDt = result.qtTestEndDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.qtTestEndDt));

                        returnTooltip += '<div><div class="carDetail_popup" style="top:20%; left:-30%; width:200px"><div class="clfix"><div class="txt_area"><ul>';
                        returnTooltip += '<li><spring:message code="ser.lbl.roDocNo" /> : ' + result.roDocNo + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.roWrtrNm" /> : ' + result.regUsrNm + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.roDt" /> : ' + kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.roDt)) + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.expcDlvDt" /> : ' + kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.expcDlDt)) + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.roTp" /> : ' + dms.string.strNvl(result.roTpNm) + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.roStatus" /> : ' + dms.string.strNvl(result.roStatNm) + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.assignEndDt" /> : ' + wrkEndDt + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.qtTestStartDt" /> : ' + qtTestStartDt + '</li>';
                        returnTooltip += '<li><spring:message code="ser.lbl.qtTestEndDt" /> : ' + qtTestEndDt + '</li>';
                        returnTooltip += '</ul></div></div></div></div>';
                    }
                });
                return returnTooltip;
            }
            /********************** 정비진도보드 **********************/
        </c:otherwise>
    </c:choose>
    /********************** 인도현황보드 **********************/

  /********************** 服务信息 start **********************/

     var slide5 = kendo.fx($("#slide-in-share5")).slideIn("right"),
        visible5 = true;
     $("#slide-in-handle5").click(function(e) {

         $(".slide-in-share").removeClass("z-index-top");
         $(this).parent().addClass("z-index-top");
         if (visible5) {
             slide5.reverse();

         } else {
             slide5.play();
         }
         visible5 = !visible5;
         e.preventDefault();

     });


    /********************** 服务信息 end **********************/


    /********************** 서비스 알람보드 **********************/
    var slide4 = kendo.fx($("#slide-in-share4")).slideIn("right"),
    visible4 = true;

    $("#slide-in-handle4").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        slidePlay2();
        serviceAlramInfoSet();
        e.preventDefault();
    });

    slidePlay2 = function() {
        if (visible4) {
            slide4.reverse();
            if(dms.string.isNotEmpty($("#vinNo").val())){
                $("#resvKanbanGrid").data("kendoExtGrid").dataSource.read();
                $("#partResvKanbanGrid").data("kendoExtGrid").dataSource.read();
                $("#estKanbanGrid").data("kendoExtGrid").dataSource.read();
                $("#helpSvcKanbanGrid").data("kendoExtGrid").dataSource.read();
                $("#lbrSuggestKanbanGrid").data("kendoExtGrid").dataSource.read();

            }
        } else {
            slide4.play();
        }
        visible4 = !visible4;
    };

    //서비스알람 상단 정보
    serviceAlramInfoSet = function(){

        var grteStartDt = kendo.parseDate($("#grteStartDt").val()); //보증시작일
        var grteEndDt = kendo.parseDate($("#grteEndDt").val());     //보증종료일
        var custSaleDt = kendo.parseDate($("#custSaleDt").val());   //고객출고일
        var sanbaoEndDt = kendo.parseDate($("#sanbaoEndDt").val()); //고객출고일
        var carRegDt = kendo.parseDate($("#carRegDt").val());       //차량등록일
        var incEndDt = kendo.parseDate($("#incEndDt").val());       //보험완료일
        var expcChkDt = kendo.parseDate($("#expcChkDt2").val());    //예정 점검일


        $("#kanbanCarOwnerBirthDt").val(kendo.toString(kendo.parseDate($("#carOwnerBirthDt").val()), "yyyy-MM-dd"));
        $("#kanbanCarOwnerBirthRemainDay").val(serviceJs.getServiceAlramDay("Y",kendo.parseDate($("#carOwnerBirthDt").val()) , sysDate));

        $("#kanbanDriverBirthDt").val(kendo.toString(kendo.parseDate($("#driverBirthDt").val()), "yyyy-MM-dd"));
        $("#kanbanDriverBirthRemainDay").val(serviceJs.getServiceAlramDay("Y",kendo.parseDate($("#driverBirthDt").val()) , sysDate));

        //$("#kanbanGrteStartDt").val( kendo.toString( grteStartDt , "yyyy-MM-dd") );
        $("#kanbanGrteEndDt").val( kendo.toString( grteEndDt , "yyyy-MM-dd") );
        //$("#kanbanGrteEndRemainDay").val( dms.string.addThousandSeparatorCommas (serviceJs.getServiceAlramDay("N", grteEndDt,grteStartDt )) );
        $("#kanbanGrteEndRemainDay").val( dms.string.addThousandSeparatorCommas (serviceJs.getServiceAlramDay("N", grteEndDt,sysDate )) );

        $("#kanbanCustSaleDt").val( kendo.toString( custSaleDt , "yyyy-MM-dd") );
        $("#kanbanCustSaleDay").val( dms.string.addThousandSeparatorCommas (serviceJs.getServiceAlramDay("N", sysDate,custSaleDt )) );

        $("#kanbanSanbaoEndDt").val( kendo.toString( sanbaoEndDt , "yyyy-MM-dd") );
        $("#kanbanSanbaoEndRemainDay").val( dms.string.addThousandSeparatorCommas (serviceJs.getServiceAlramDay("N", sanbaoEndDt ,sysDate)) );


        $("#kanbanCarRegDt").val( kendo.toString( carRegDt , "yyyy-MM-dd") );
        $("#kanbanExpcChkRemainDay").val( dms.string.addThousandSeparatorCommas (serviceJs.getServiceAlramDay("N", expcChkDt ,sysDate)) );

        $("#kanbanIncEndDt").val( kendo.toString( incEndDt , "yyyy-MM-dd") );
        $("#incEndRemainDay").val( dms.string.addThousandSeparatorCommas (serviceJs.getServiceAlramDay("N", sysDate, incEndDt )) );

        $("#kanbanExpcChkRunDistVal").val(dms.string.addThousandSeparatorCommas($("#expcChkRunDistVal2").val()) );
        $("#kanbanExpcChkRunDistValRmKm").val(dms.string.addThousandSeparatorCommas(Number($("#expcChkRunDistVal2").val())  - Number( $("#carRunDistVal").val() )) );


    }

    //예약 그리드
    $("#resvKanbanGrid").kendoExtGrid({
        gridId:"G-SER-1011-000007"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceipts.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sListType"] = "03";
                        params["sVinNo"] = $("#vinNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum :{ type:"number" }
                       ,resvDt:{ type:"date"}
                       ,serResvStartDt:{ type:"date"}
                    }
                }
            }
          }
        ,sortable:false
        ,pageable:false
        ,editable:false
        ,height:200
        ,autoBind:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                if(preFixId == "RO"){
                    var roTpCd = $("#roTp").data("kendoExtDropDownList").value();
                    var selectedVal = this.dataItem(this.select());
                    var roRemark = $("#roRemark").val();
                    $("#resvDocNo").val(selectedVal.resvDocNo);
                    //클릭할때마다 계속 추가되어서 막음
                    //$("#roRemark").val(roRemark + ", " + selectedVal.resvRemark);
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();

                    // 고객요청사항 데이타 가져오기
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.resvDocNo, "sPreFixId":"RE"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            custRemarkSerAlramAdd(result);
                        }
                    });

                    // 공임 데이타 가져오기
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.resvDocNo, "sPreFixId":"RE", "sLtsModelCd": ltsModelCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            lbrSerAlramAdd(result,"RE");
                        }
                    });

                    // 부품 데이타 가져오기
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.resvDocNo, "sPreFixId":"RE", "sLtsModelCd": ltsModelCd })
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            partsSerAlramAdd(result,"RE");
                        }
                    });

                    // 기타사항 데이타 가져오기
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.resvDocNo, "sPreFixId":"RE"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            etcIssueSerAlramAdd(result);
                        }
                    });
                }else if(preFixId == "PC"){
                    var roTpCd = '01';
                    var selectedVal = this.dataItem(this.select());
                    //var roRemark = $("#roRemark").val();
                    $("#resvDocNo").val(selectedVal.resvDocNo);
                    //클릭할때마다 계속 추가되어서 막음
                    //$("#roRemark").val(roRemark + ", " + selectedVal.resvRemark);
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.resvDocNo, "sPreFixId":"RE"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            custRemarkSerAlramAdd(result);
                        }
                    });
                    // 공임 데이타 가져오기
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.resvDocNo, "sPreFixId":"RE", "sLtsModelCd": ltsModelCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            lbrSerAlramAdd(result,"RE");
                        }
                    });

                    // 부품 데이타 가져오기
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.resvDocNo, "sPreFixId":"RE", "sLtsModelCd": ltsModelCd })
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            partsSerAlramAdd(result,"RE");
                        }
                    });
                    
                    
                }
            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100,attributes:{"class":"al"}}//차량번호
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100, attributes:{"class":"al"}}//방문자
            ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", attributes:{"class":"al"}, width:100}//예약번호
            ,{field:"resvTpNm", title:"<spring:message code='ser.lbl.resvChannel' />", width:100, attributes:{"class":"ac"}}//예약유형
            ,{field:"resvStatCd", title:"<spring:message code='ser.lbl.resvStat' />", width:100, attributes:{"class":"ac"}
                ,template:"#=setKanbanResvStatMap(resvStatCd)#"
            }//예약상태
            ,{field:"serResvStartDt", title:"<spring:message code='ser.lbl.resvDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }//서비스예약시간
            ,{field:"resvDt", title:"<spring:message code='ser.lbl.resvCreateDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//예약일자
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.resvWrtrNm' />", attributes:{"class":"al"}, width:100}//정비예약자
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100,attributes:{"class":"al"},hidden:true}//
            ,{field:"resvRemark", title:"<spring:message code='ser.lbl.custRemark' />", attributes:{"class":"al"}, width:100,hidden:true}//비고
        ]

    });

    //부품예약 그리드
    $("#partResvKanbanGrid").kendoExtGrid({
        gridId:"G-SER-1011-000008"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rev/partReservation/selectPartReservations.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#vinNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,parResvDt:{ type:"date"}
                    }
                }
            }
          }
        ,sortable:false
        ,pageable:false
        ,editable:false
        ,height:200
        ,autoBind:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                if(preFixId == "RO"){
                    var selectedVal = this.dataItem(this.select());
                    var roTpCd = $("#roTp").data("kendoExtDropDownList").value();
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();
                    var roRemark = $("#roRemark").val();
                    //클릭할때마다 계속 추가되어서 막음
                    //$("#roRemark").val(roRemark + ", " + selectedVal.parResvRemark);

                    //선수금
                    if($("#preAmt").val() != undefined){
                        $("#preAmt").data("kendoExtNumericTextBox").value(Number(selectedVal.preAmt));
                    }

                    // 고객요청사항
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.parResvDocNo, "sPreFixId":"PRE"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            custRemarkSerAlramAdd(result);
                        }
                    });

                    // 부품정보
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.parResvDocNo, "sPreFixId":"PRE", "sLtsModelCd": ltsModelCd })
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            partsSerAlramAdd(result);
                        }
                    });

                    // 기타사항
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.parResvDocNo, "sPreFixId":"PRE"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            etcIssueSerAlramAdd(result);
                        }
                    });
                }

            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100, attributes:{"class":"al"}}//방문자
            ,{field:"parResvDocNo", title:"<spring:message code='ser.lbl.partReserveNo' />", attributes:{"class":"ac"}, width:100}//부품예약번호
            ,{field:"parResvTpNm", title:"<spring:message code='ser.lbl.partResvTp' />", attributes:{"class":"ac"}, width:100}//부품예약유형
            ,{field:"parResvStatCd", title:"<spring:message code='ser.lbl.partResvStat' />", width:100, attributes:{"class":"ac"}
                 ,template:"<spring:message code='ser.lbl.partResvComplete'/>"
            }//
            ,{field:"preAmt", title:"<spring:message code='ser.lbl.preAmt' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            }//부품선수금
            ,{field:"parResvDt", title:"<spring:message code='ser.lbl.preResvPartHm' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//부품예약시간
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.partResveNm' />", width:100,attributes:{"class":"al"}}//부품예약자
        ]

    });

    //견적 그리드
    $("#estKanbanGrid").kendoExtGrid({
        gridId:"G-SER-1011-000009"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/est/estimate/selectEstimateListMains.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        params["sVinNo"] = $("#vinNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,estDt:{ type:"date"}
                    }
                }
            }
          }
        ,sortable:false
        ,pageable:false
        ,height:200
        ,autoBind:false
        ,editable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                if(preFixId == "RO"){

                    var selectedVal = this.dataItem(this.select());
                    var parentRoTp = $("#roTp").data("kendoExtDropDownList").value();
                    var roTpCd = selectedVal.roTp;
                    var roRemark = $("#roRemark").val();
                    //클릭할때마다 계속 추가되어서 막음
                    //$("#roRemark").val(roRemark + ", " + selectedVal.estRemark);

                    if(parentRoTp != roTpCd){
                        dms.notification.info("<spring:message code='ser.lbl.roTp' var='roTp' /><spring:message code='global.info.confirmMsgParam' arguments='${roTp}' />");
                        return;
                    }
                    slidePlay2();
                    var selectedVal = this.dataItem(this.select());
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();

                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.estDocNo, "sPreFixId":"ET"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            custRemarkSerAlramAdd(result);
                        }
                    });

                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.estDocNo, "sPreFixId":"ET", "sLtsModelCd": ltsModelCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            lbrSerAlramAdd(result,"RE");
                        }
                    });


                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.estDocNo, "sPreFixId":"ET", "sLtsModelCd": ltsModelCd })
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            partsSerAlramAdd(result,"RE");
                        }
                    });

                    // 기타사항
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.estDocNo, "sPreFixId":"ET"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            etcIssueSerAlramAdd(result);
                        }
                    });

                }

            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100, attributes:{"class":"al"}}//방문자
            ,{field:"estDocNo", title:"<spring:message code='ser.lbl.estDocNo' />", attributes:{"class":"al"}, width:100}//견적번호
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100, attributes:{"class":"ac"}
                ,template:"#=roTpCdGrid(roTp)#"
                ,editor:function(container, options){
                    $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:roTpCdList
                    });
                }
            }//
            ,{field:"estStatNm", title:"<spring:message code='ser.lbl.estimateStatCd' />", width:100, attributes:{"class":"ac"}}//
            ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.estTotAmt' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            }//견적금액
            ,{field:"estDt", title:"<spring:message code='ser.lbl.estDt' />" , width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.estWrtrNm' />", width:100,attributes:{"class":"al"}}//정비견적자
        ]

    });

    //구원서비스 그리드
    $("#helpSvcKanbanGrid").kendoExtGrid({
        gridId:"G-SER-1011-000010"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/res/rescue/selectRescues.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#vinNo").val();
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,pkgItemCd:{ type:"string"}
                       ,lineNo:{ type:"string"}
                       ,lbrCd:{ type:"string",editable:false}
                    }
                }
            }
          }
        ,sortable:false
        ,pageable:false
        ,height:200
        ,autoBind:false
        ,editable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                if(preFixId == "RO"){
                    var selectedVal = this.dataItem(this.select());
                    var parentRoTp = $("#roTp").data("kendoExtDropDownList").value();
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();
                    var roRemark = $("#roRemark").val();
                    //클릭할때마다 계속 추가되어서 막음
                    //$("#roRemark").val(roRemark + ", " + selectedVal.rescRemark);

                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.rescDocNo, "sPreFixId":"RES"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            custRemarkSerAlramAdd(result);
                        }
                    });

                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.rescDocNo, "sPreFixId":"RES", "sLtsModelCd": ltsModelCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            lbrSerAlramAdd(result,"RES");
                        }
                    });


                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                        ,data:JSON.stringify({"sDocNo":selectedVal.rescDocNo, "sPreFixId":"RES", "sLtsModelCd": ltsModelCd })
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            partsSerAlramAdd(result,"RES");
                        }
                    });

                    // 기타사항
                    $.ajax({
                        url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
                        ,data:JSON.stringify({"sJobNo":selectedVal.rescDocNo, "sPreFixId":"RES"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            etcIssueSerAlramAdd(result);
                        }
                    });
                }

            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100, attributes:{"class":"al"}}//방문자
            ,{field:"rescDocNo", title:"<spring:message code='ser.lbl.rescDocNo2' />", attributes:{"class":"al"}, width:100}//외출서비스번호
            ,{field:"rescTp", title:"<spring:message code='ser.lbl.rescTp2' />", width:100, attributes:{"class":"ac"}
                ,template:"#=setKanbbanRescueTpCdMap(rescTp)#"
            }//외출서비스유형 "<spring:message code='ser.lbl.rescComplete'/>"
            ,{field:"rescStatCd", title:"<spring:message code='ser.lbl.rescStatCd' />", width:100, attributes:{"class":"ac"}
                ,template:"<spring:message code='ser.lbl.rescComplete'/>"
            }//외출서비스상태
            ,{field:"rescReqDt", title:"<spring:message code='ser.lbl.rescDt' />" , width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//외출서비스시간
            ,{field:"rescStartDt", title:"<spring:message code='ser.lbl.rescChkDt' />" , width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//외출확인시간
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.rescChkNm' />", width:100,attributes:{"class":"al"}}//정비견적자
        ]
    });

    // 수리의견 그리드
    $("#lbrSuggestKanbanGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url: "<c:url value='/ser/cmm/tabInfo/selectLbrSuggest.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"]          = options.page;
                         params["firstIndex"]         = options.skip;
                         params["lastIndex"]          = options.skip + options.take;
                         params["sort"]               = options.sort;

                         var jobNo = "";
                         var sPreFixId = preFixId;

                         params["sVinNo"]    = $("#vinNo").val();
                         params["sKanbanYn"] = "Y";

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                         dlrCd:{type:"string" , editable:false}
                        ,lbrCd:{type:"string" , editable:false}
                        ,lbrNm:{type:"string" , editable:false , validation:{required:true}}
                        ,lbrTp:{type:"string" , editable:false}
                        ,lbrHm:{type:"number"}
                        ,serCnt:{type:"number"}
                        ,dstinCd:{type:"string"}
                        ,regDt:{type:"date"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,height:200
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:false
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:true
        ,reorderable:false
        ,change : function(e){

            var grid = $("#lbrSuggestKanbanGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");
            var params = [];
            var jsonData = {};
            if(preFixId == "RO"){
                rows.each(function(index, obj) {
                    var dataItem = grid.dataSource._data;

                    if($(this).hasClass("k-state-selected")){
                        params.push({
                             "lbrCd":grid.dataItem(obj).lbrCd
                            ,"lbrNm":grid.dataItem(obj).lbrNm
                            ,"lbrTp":grid.dataItem(obj).lbrTp
                            ,"lbrHm":grid.dataItem(obj).lbrHm
                            ,"lbrOrgHm":grid.dataItem(obj).lbrHm
                            ,"serCnt":grid.dataItem(obj).serCnt
                            ,"dstinCd":grid.dataItem(obj).dstinCd
                            ,"paymTp":""
                            ,"crTp":""
                            ,"roTp":$("#roTp").val()
                            ,"lbrQty":1
                            ,"dcAmt":0.00
                            ,"dcRate":0.0
                       });
                    }
                });
                jsonData = {
                          data : params
                        ,total : params.length
                };

                var lbrCd = jsonData.data[0].lbrCd;
                var dstinCd = jsonData.data[0].dstinCd;
                var roTpVal = $("#roTp").val();

                var ttChkYn = (lbrCd.length > 3 && lbrCd.substr(lbrCd.length-2,lbrCd.length)== "TT") ? false : true;
                var dlrDstinCd = (dstinCd == "D" || dstinCd == "E") ? true : false; // 일반공임일경우
                var wtyDstinCd = (dstinCd == "G" || dstinCd == "Z") ? true : false; // 보증공임일경우

                if(roTpVal == '02'){ //보증
                    if(dlrDstinCd && ttChkYn){
                        var msg = lbrCd + "<spring:message code='ser.lbl.cmpnLbrCd' var='cmpnLbrCd' />"+
                                  "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                                  "<spring:message code='ser.info.checkLbrTp' arguments='${cmpnLbrCd} , ${lbrCd}' />";

                        dms.notification.warning(msg);
                        chkRsultYn = false;
                        return false;
                    }
                }else{
                    if(wtyDstinCd){ //은 {0}만 사용가능한 {1} 입니다
                        var msg = lbrCd + "<spring:message code='ser.lbl.wartEx' var='wartEx' />"+
                                  "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                                  "<spring:message code='ser.info.checkCmnpLbrTp' arguments='${wartEx} , ${lbrCd}' />";
                        dms.notification.warning(msg);
                        chkRsultYn = false;
                        return false;
                    }
                }


                lbrSerAlramAdd(jsonData,"");
            }
        }
        ,columns:[
              {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 공임코드
             ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200
                 ,editor:function(container, options) {
                     $('<input required type="text" name="lbrNm" data-name="<spring:message code="ser.lbl.rpirNm" />" data-bind="value:' + options.field + '"  maxLength="200" class="form_input"  />')
                     .appendTo(container);
                     $('<span class="k-invalid-msg" data-for="lbrNm"></span>')
                     .appendTo(container);
                  }
              }// 공임명
             ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                 ,attributes:{"class":"ac"}
                 ,template:"#=lbrTpCdGrid(lbrTp)#"
             } // 공임유형(정비유형)
             ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:100
                 ,attributes:{"class":"ar"}
                 ,format:"{0:n1}"
                 ,editor:function(container, options){
                     $('<input name="lbrHm" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0.0
                         ,max:100000
                         ,spinners:false
                     });
                 }
             } // 수불공임
             ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:100, attributes:{"class":"ar"}
                 ,format:"{0:n0}"
                 ,editor:function(container, options){
                     $('<input name="serCnt" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0
                         ,max:100
                         ,spinners:false
                     });
                 }

             }// 정비건수
             ,{field:"regDt", title:"<spring:message code='ser.lbl.lbrSuggestDt' />" , width:120 , hidden:false
                 ,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }//수리건의시간
             ,{field:"regUsrId", title:"<spring:message code='ser.lbl.serProposer' />", width:100, attributes:{"class":"al"}}// 수리건의자
             ,{field:"remark", title:"<spring:message code='ser.lbl.lbrSuggestRemark' />", width:130, attributes:{"class":"al"} }// 비고
             ,{field:"dstinCd", title:"dstinCd", width:100, hidden:true}
             ,{field:"vinNo", title:"vinNo", width:100, hidden:true}
         ]
    });

    techmanPopup = function(number) {
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {
                        if(jsonObj.length > 0) {
                            //$("#tecId").val(jsonObj[0].tecId);
                            $("#tecNm").val(jsonObj[0].tecNm);
                            $("#scheduler2").data("kendoScheduler").dataSource.read();
                        }
                    }
                }
            }
        });
    }

    userSearch = function(schedulerId , fieldNm){
        techManSearchPopupWin = dms.window.popup({
            windowId:"techManSearchPopupWin"
            ,height:530
            ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManSearchPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"selectable":"single"
                    ,"closeAfterSelect":true
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#"+fieldNm).val(data[0].tecNm);//ser.lbl.preChkNm
                            $("#"+schedulerId).data("kendoScheduler").dataSource.read();

                        }
                    }
                }
            }
        });
    };

    refresh = function() {
        $.ajax({
            url:"<c:url value='/ser/ro/workProcess/selectWorkProcessBoardList.do' />"
            ,data:JSON.stringify({sExpcDlDt:sysDate})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                /* if(result.data.length > 30){
                    $(".table_list3").prop("style", "height:"+(30 * result.data.length)+"px;")
                } */
                var workProcessBoardTemplate = kendo.template($("#workProcessBoardTemplate").html());
                $("#workProcessTemplate").html(workProcessBoardTemplate(result.data));
            }
        });
    }
});

//khskhs doubletab
(function($){

    $.event.special.doubletap = {
      bindType: 'touchend',
      delegateType: 'touchend',

      handle: function(event) {
        var handleObj   = event.handleObj,
            targetData  = jQuery.data(event.target),
            now         = new Date().getTime(),
            delta       = targetData.lastTouch ? now - targetData.lastTouch : 0,
            delay       = delay == null ? 300 : delay;

        if (delta < delay && delta > 30) {
          targetData.lastTouch = null;
          event.type = handleObj.origType;
          ['clientX', 'clientY', 'pageX', 'pageY'].forEach(function(property) {
            event[property] = event.originalEvent.changedTouches[0][property];
          })

          // let jQuery handle the triggering of "doubletap" event handlers
          handleObj.handler.apply(this, arguments);
        } else {
          targetData.lastTouch = now;
        }
      }
    };

  })(jQuery);
//khskhs doubletab

//jhg tabletSize
/* if(isTablet=="true"){
    $("#slide-in-share3").css("width", 900);
    $("#slide-in-share3").css("margin-right", -900);
} */


</script>
<style>
    #slide-in-share { width:940px; margin-right:-940px;}
    #slide-in-share1 { width:940px; margin-right:-940px;}
    #slide-in-share1 .slide-in-handle { top:102px;}
    #slide-in-share2 { width:940px; margin-right:-940px;}
    #slide-in-share2 .slide-in-handle { top:205px;}
    #slide-in-share3 { width:940px; margin-right:-940px;}
    #slide-in-share3 .slide-in-handle { top:308px;}
    #slide-in-share4 { width:940px; margin-right:-940px;}
    #slide-in-share4 .slide-in-handle { top:411px;}
    #slide-in-share5 { width: 940px; margin-right: -940px;}
    #slide-in-share5 .slide-in-handle { top: 514px; }
    #scheduler .k-scheduler-table td {
        height: 22px !important;
        border-bottom-style: solid;
    }
    #scheduler1 .k-scheduler-content .k-scheduler-table, #scheduler1 .k-scheduler-header {
        /* width: 1360px */
        width: 3000px
    }
    #scheduler1 > .k-scheduler-layout {
        table-layout: fixed;
    }
    #scheduler1 > .k-scheduler-layout > tbody > tr > td:first-child {
        /* width: 100px; */
        width: 150px;
    }
    #scheduler1 .k-scheduler-table td {
        height: 24px !important;
    }


    #scheduler2 .k-scheduler-content .k-scheduler-table, #scheduler1 .k-scheduler-header {
        width: 1360px
    }
    #scheduler2 > .k-scheduler-layout {
        table-layout: fixed;
    }
    #scheduler2 > .k-scheduler-layout > tbody > tr > td:first-child {
        width: 100px;
    }
    #scheduler2 .k-scheduler-table td {
        height: 23px !important;
    }
</style>

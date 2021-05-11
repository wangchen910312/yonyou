<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="slide_menu">
    <!-- <div id="slide-in-share" class="slide-in-share" style="height:210px;"> khskhs 태블릿 때문에-->
    <div id="slide-in-share" class="slide-in-share" style="height:250px;">
        <a id="slide-in-handle" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.vipDc" /></span></a><!-- 회원정보 -->
        <div class="slide-content">
           <!-- 去掉蓝缤相关的积分查询部分，只保留自店会员部分 贾明 2020-6-2 
            <div class="table_grid" id="bmpDiv">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" id="bmSearch" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.search"/></button> 
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
                    <div class="btn_right">
                        <button type="button" id="dealerSet" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                        <button type="button" id="dealerCancel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="dlrPointGrid" style="min-height: 67px;"></div> <!-- khs 태블릿 때문에 -->
                </div>
            </div>
        </div>
    </div>
    <div id="slide-in-share1" class="slide-in-share" style="height:308px;">
        <a id="slide-in-handle1" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.otherDc" /></span></a><!-- 기타할인 -->
        <div class="slide-content">
            <div class="table_grid"  id="bmCupnDiv">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" id="bmCupnVerify" class="btn_s btn_s_min5"><spring:message code="ser.btn.verify"/></button> <!-- 확인 -->
                        <button type="button" id="bmCupnSet" class="btn_s btn_s_min5"><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                        <button type="button" id="bmCupnCancel" class="btn_s btn_s_min5"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
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
                        <button type="button" id="dcSet" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                        <button type="button" id="dcCancel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
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
     <div id="slide-in-share2" class="slide-in-share" style="display:none;">
        <a id="slide-in-handle2" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.preDeposit" /></span></a><!-- 예치금 -->
        <div class="slide-content">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="cardPointSet" class="btn_s btn_s_min5" style="display:none;"><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                </div>
            </div>
            <div class="table_grid mt10">
                <!-- 그리드1 -->
                <div id="cardListGrid" class="grid"></div>
                <!-- 그리드1 -->
            </div>
        </div>
    </div>

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
</section>

<script>

var bmCupnUseYn = null;

var sysDate = new Date("<c:out value='${sysDate}' />");

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

//카드종류구분 Map
var cardTpMap = [];
$.each(cardTpList, function(idx, obj){
    cardTpMap[obj.cmmCd] = obj.cmmCdNm;
});

//공통코드:예약상태
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvStatMap = dms.data.arrayToMap(resvStatCdList, function(obj){return obj.cmmCd;});

//공통코드:구원유형
var rescueTpCdList = [];
<c:forEach var="obj" items="${rescueTpCdList}">
rescueTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var rescueTpMap = dms.data.arrayToMap(rescueTpCdList, function(obj){return obj.cmmCd;});

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

//예약상태
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

$(document).ready(function() {

    $("#kanbanTabstrip").kendoExtTabStrip({
        animation:false
     });

    // 블루멤버스 조회
    /*** 去掉蓝缤相关的积分查询部分，只保留自店会员部分 贾明 2020-6-2 
    $("#bmSearch").kendoButton({
        click:function(e) {
            blueMemberInfo();
        }
    });
    ***/
 /*** 去掉蓝缤相关的积分查询部分，只保留自店会员部分 贾明 2020-6-2 
    // 블루멤버스 적용
    $("#bmSet").kendoButton({
        click:function(e) {
            setBmPointData();
        }
    });
 ***/
  /*** 去掉蓝缤相关的积分查询部分，只保留自店会员部分 贾明 2020-6-2 
    // 블루멤버스 취소
    $("#bmCancel").kendoButton({
        click:function(e) {
            bmCancel("C");
        }
    });
 ***/
    // 딜러멤버스 적용
    $("#dealerSet").kendoButton({
        click:function(e) {
            setDlrPointData();
        }
    });

    // 딜러멤버스 취소
    $("#dealerCancel").kendoButton({
        click:function(e) {
            dealerCancel("C");
        }
    });

    // BM쿠폰 검증
    /**
    $("#bmCupnVerify").kendoButton({
        click:function(e) {

            var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
            var bmCupnData = bmCupnGrid.dataItem("tr:eq(0)");

            if(bmCupnData == null){
                dms.notification.info("<spring:message code='ser.lbl.cupnNo' var='cupnNo'/><spring:message code='global.info.required.field' arguments='${cupnNo}' />");
                return;
            }
            var param = {
                custNo :$("#carOwnerId").val()
                ,vin   :$("#vinNo").val()
                ,cardNo:bmCupnData.cardNo
            };

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
                            var bmCupnTp = "03";
                            if($("#lbrBmCupnUseAmt").val() > 0){
                                bmCupnTp = "01";
                            } else if($("#parBmCupnUseAmt").val() > 0){
                                bmCupnTp = "02";
                            }
                            bmCupnData.set("cupnTpNm",  "<spring:message code='ser.lbl.blueMembers' />" );
                            bmCupnData.set("couponBeginDate", new Date(result.Data.CardBeginDate));
                            bmCupnData.set("couponEndDate", new Date(result.Data.CardEndDate));
                            bmCupnData.set("reduceCost", result.Data.ReduceCost);
                            bmCupnData.set("remark", result.Data.CardRemark);
                            bmCupnData.set("bmCupnTp", bmCupnTp);
                            bmCupnData.set("cupnNm", result.Data.CardName);
                            bmCupnData.set("atvtTp", result.Data.ActivityType);
                            if(bmCupnData.cupnChangeAmt == null){
                                bmCupnData.set("cupnChangeAmt", 0);
                            }else{
                                bmCupnData.set("cupnChangeAmt", bmCupnData.cupnChangeAmt);
                            }
                            $("#bmCupnSet").data("kendoButton").enable(true);
                            bmCupnUseYn = "N";
                        } else {
                           
                            $("#bmCupnSet").data("kendoButton").enable(false);
                            dms.notification.error(result.Data.Msg);
                        }
                    } else {
                        bmCupnData.set("couponBeginDate", "");
                        bmCupnData.set("couponEndDate", "");
                        bmCupnData.set("reduceCost", "");
                        bmCupnData.set("remark", "");
                        bmCupnData.set("bmCupnTp", "");
                        bmCupnData.set("cupnNm", "");
                        bmCupnData.set("atvtTp", "");
                        bmCupnData.set("cupnChangeAmt", "");
                        $("#bmCupnSet").data("kendoButton").enable(false);
                        dms.notification.error(result.Message);
                    }
                }
           });
        }
    });
  **/
  //服务结算 验证卡券信息 SER128 贾明 2020-6-3 
   $("#bmCupnVerify").kendoButton({
        click:function(e) {

            var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
            var bmCupnData = bmCupnGrid.dataItem("tr:eq(0)");
            console.log("数据1",bmCupnData);
            if(bmCupnData == null){
                dms.notification.info("<spring:message code='ser.lbl.cardNumber' var='cupnNo'/><spring:message code='global.info.isNotNull' arguments='${cupnNo}' />");
                return;
            }
            if(dms.string.isEmpty(bmCupnData.cardNo)){
                dms.notification.info("<spring:message code='ser.lbl.cardNumber' var='cupnNo'/><spring:message code='global.info.isNotNull' arguments='${cupnNo}' />");
                return;
            }
            console.log("数据",bmCupnData.cardNo);
            var param = {
                sLanBinCardNo :bmCupnData.cardNo
            };
            $.ajax({
                url:"<c:url value='/ser/cal/calculate/selectCardCouponInfoSearch.do' />"	
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    console.log("返回值",jqXHR);
                    console.log("返回值1",jqXHR);
                    if(dms.string.isEmpty(jqXHR.data)){
                       dms.notification.info("<spring:message code='sal.info.systemsAbnormal'/>");//系统异常，请联系蓝缤客服咨询
                       return ;
                    }
                    if("-1" == jqXHR.data[0].code){
                        if("EOF" == jqXHR.data[0].msg ){
                           dms.notification.info("<spring:message code='par.lbl.ifErrRaiMsg'/>");//连接接口发生通信异常，是cmal不通
                           return ;
                         }
                         if("record not found" == jqXHR.data[0].msg){
                            dms.notification.info("<spring:message code='sal.info.cardCouponWrong'/>");//卡券号码有误，请检查后重新验证
                            return ;
                         }
                          dms.notification.info(jqXHR.data[0].msg); 
                         return ;
                    }
                    if("0" == jqXHR.data[0].code){
                       //卡券面额 cardDeno
                       //$("#lanBinCardAmount").data("kendoExtNumericTextBox").value(Number(jqXHR.data[0].card_denomination));
                       bmCupnData.set("cardDeno", Number(jqXHR.data[0].card_denomination));
                       //jqXHR.data[0].card_id              //卡券号
                         //卡券全名
                         //$("#lanBinCardName").val(jqXHR.data[0].card_name);
                         bmCupnData.set("cardNm", jqXHR.data[0].card_name); 
                         //卡券类型 cardTp          
                         //$("#lanBinCardType").val(jqXHR.data[0].card_type);  
                         bmCupnData.set("cardTp", jqXHR.data[0].card_type);          
                         //截至日期
                         //var expirationDate = kendo.parseDate(kendo.toString(jqXHR.data[0].expiration_date, "yyyy-MM-dd"));
                         //$("#lanBinCardEffeDt").data("kendoExtMaskedDatePicker").value(expirationDate);
                   		 bmCupnData.set("expirationDate", kendo.toString(jqXHR.data[0].expiration_date, "yyyy-MM-dd"));
                        //使用说明 cardUseNoti
                        //$("#lanBinUseNotice").val(jqXHR.data[0].instructions);         
                         bmCupnData.set("cardUseNoti", jqXHR.data[0].instructions);
                       //结算金额 索赔金额
                       //$("#lanBinCardAmount").data("kendoExtNumericTextBox").value(Number(jqXHR.data[0].settlement_amount));
                       bmCupnData.set("claimAmo", Number(jqXHR.data[0].settlement_amount));
                       //确认按钮
                       $("#bmCupnSet").data("kendoButton").enable(true);
                    }
                }
           });
        }
    });
    // BM쿠폰적용
    $("#bmCupnSet").kendoButton({
        click:function(e) {
            setBmCupnData();
        }
        ,enable:false
    });

    // BM쿠폰 취소
    $("#bmCupnCancel").kendoButton({
        click:function(e) {
            bmCupnCancel("C");
            // bmCupnGrid Clear
            $("#bmCupnGrid").data("kendoExtGrid").dataSource.data([]);
            $("#bmCupnGrid").data("kendoExtGrid").dataSource.insert(0,{consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""});
        }
    });

    // 기타할인 적용
    $("#dcSet").kendoButton({
        click:function(e) {
            setEtcDcAmt();
        }
    });

    // 기타할인 취소
    $("#dcCancel").kendoButton({
        click:function(e) {
            dcCancel();
            dcRoleCancel();
        }
    });

    // 카드포인트 적용
    $("#cardPointSet").kendoButton({
        click:function(e) {
            setCardPointSet();
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

    /** 去掉蓝缤相关的积分查询部分，只保留自店会员部分 贾明 2020-6-2
    //블루멤버스 그리드
    $("#bmPointGrid").kendoExtGrid({
        dataSource:[{consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]
        ,height:50
        ,selectable:"row"
        ,reorderable:false
        ,filterable:false                 
        ,resizable:false
        ,scrollable:false
        ,pageable:false
        ,sortable:false
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
             {field:"bmMembershipNm", title:"<spring:message code='ser.lbl.bmMembNm' />", width:100}         
            ,{field:"mLevel", title:"<spring:message code='ser.lbl.membGrade' />", width:70                  
                ,attributes:{"class":"ac"}
                ,template:"#=getBmMemberGradeCdMap(mLevel)#"
             }
            ,{field:"point", title:"<spring:message code='ser.lbl.bmAvlbPoint' />", width:90, attributes:{"class":"ar"}}          
            ,{field:"point", title:"<spring:message code='ser.lbl.bmSavePoint' />", width:75, attributes:{"class":"ar"}}          
            ,{field:"consumePoints", title:"<spring:message code='ser.lbl.bmThisUsePoint' />", width:95, attributes:{"class":"ar"}
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
                                setBmPointData();
                            }
                        }
                    });
                }
            }
            ,{field:"bmUseAmt", title:"<spring:message code='ser.lbl.bmThisUseAmt' />", width:90, attributes:{"class":"ar"}}     
            ,{field:"bmUsePurpose", title:"<spring:message code='ser.lbl.bmPurposeOfUse' />", width:75                            
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
            ,{field:"consumeType", hidden:true}                   
            ,{field:"custNo", hidden:true}                         
            ,{field:"vin", hidden:true}                            
            ,{field:"totalCost", hidden:true}                      
            ,{field:"roDocNo", hidden:true}                        
            ,{field:"blueMembershipNo", hidden:true}              
            ,{field:"maxConsumePoint",  width:75 ,hidden:true}     
        ]
    });
    **/

    //BM 쿠폰 그리드
    /**
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

            if(fieldName == "cupnNm" ||
               fieldName == "couponBeginDate" ||
               fieldName == "couponEndDate" ||
               fieldName == "reduceCost" ||
               fieldName == "remark" ||
               fieldName == "atvtTp" ||
               fieldName == "cupnTpNm" ) {
                this.closeCell();
            }

            var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");
            var bmCupnData = bmCupnGrid.dataItem(bmCupnGrid.select());

            if($("#bmCupnTotAmt").val() > 0){
                if(fieldName == "cardNo" ||
                   fieldName == "bmCupnTp") {
                    this.closeCell();
                }
            }
        }
        ,columns:[
            {field:"cardNo", title:"<spring:message code='ser.lbl.bmCupnNo' />", width:100
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
            }    // BM쿠폰번호
            ,{field:"cupnNm", title:"<spring:message code='ser.lbl.bmCupnNm' />", width:150}    // BM쿠폰명칭
            ,{field:"atvtTp", title:"<spring:message code='ser.lbl.bmAtvtTp' />", width:150}      // 캠페인명칭
            ,{field:"reduceCost", title:"<spring:message code='ser.lbl.cupnApplyAmt' />", width:80, attributes:{"class":"ar"}}    // 쿠폰적용금액
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
            }    // 쿠폰조정금액
            ,{field:"bmCupnTp", title:"<spring:message code='ser.lbl.cupnUse' />", width:80        // 쿠폰용도
                ,template:function(dataItem){
                    var returnObj = "";
                    if(dataItem.bmCupnTp != undefined){
                        returnObj =  setBmCupnTpMap(dataItem.bmCupnTp);
                    }
                    return returnObj ;
                }
                ,editor:function(container, options){
                    $('<input id="bmCupnTp" name="bmCupnTp" data-bind="value:' + options.field + '"  />')
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
            ,{field:"couponBeginDate", title:"<spring:message code='ser.lbl.cupnApplyStartDt' />", width:135, attributes:{"class":"ar"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }    // 쿠폰적용시작일자
            ,{field:"couponEndDate", title:"<spring:message code='ser.lbl.cupnApplyEndDt' />", width:135, attributes:{"class":"ar"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }      // 쿠폰적용종료일자
            ,{field:"remark", title:"<spring:message code='ser.lbl.cupnRemark' />", width:200}      // 쿠폰비고
            ,{field:"cupnTpNm", title:"<spring:message code='ser.lbl.cupnTp' />", width:90, hidden:true}     // 쿠폰유형(BM(蓝缤) 디폴트)
        ]
    });
   **/
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
//          ,{field:"cardDeno", title:"<spring:message code='sal.lbl.LanBinCardAmount' />", width:80, attributes:{"class":"ar"}}    // 卡券面额
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

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       if(dms.string.isEmpty(loginUsrId)){
                           loginUsrId = "${loginUsrId}";
                       }
                       params["sSaId"] = loginUsrId;//"${loginUsrId}";
                       params["sCustNo"] = $("#carOwnerId").val();
                       params["sVinNo"] = $("#vinNo").val();
                       params["sToday"] = new Date("${sysDate}");
                       params["sDcUseTp"] = dcUseTp;

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
        ,scrollable:true
        ,pageable:false
        ,sortable:false
        ,editable:false
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

    // 충전카드내역
    $("#cardListGrid").kendoExtGrid({
        dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/crm/dmm/membership/selectRechargeCardList.do' />"
               }
                ,parameterMap:function(options, operation) {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sMembershipNo"] = $("#membershipNo").val();

                        return kendo.stringify(params);
                }
           }
           ,schema:{
               model:{
                   id:"membershipNo"
                   ,fields:{
                       dlrCd:{type:"string"}
                       ,membershipNo:{type:"string", editable:false}
                       ,cardTpCd:{type:"string", editable:false}
                       ,cardNo:{type:"string", editable:false}
                       ,realTotAmt:{type:"int", editable:false}
                       ,usrNm:{type:"string", editable:false}
                   }
               }
           }
       }
       ,height:250
       //,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,reorderable:false
       ,filterable:false
       ,pageable:false
       ,autoBind:false
       ,columns:[
           {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", width:250,attributes:{"class":"ac"},hidden:true} //딜러코드
           ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", width:300,attributes:{"class":"ac"},hidden:true} //멤버십 일련번호
           ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo'/>", width:100, attributes:{"class":"al"}}//카드번호
           ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>" //카드종류
               ,attributes:{"class":"ac"}
               ,width:120
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardTpList
                   });
                }
               ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
           }// 카드종류
           ,{field:"regDt", title:"<spring:message code='crm.lbl.issueDate'/>", width:100, attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
           }//발급일
           ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.realTotAmt'/>", width:80, attributes:{"class":"ar"}
               ,format:"{0:n0}"
               ,decimal:0
           }//가용금액
       ]
    });

    setMemberShipInfo = function() {
        var dlrPointGrid = $("#dlrPointGrid").data("kendoExtGrid");
        var dlrRowData = dlrPointGrid.dataItem("tr:eq(0)");
        var dlrUsePurpose = "03";

        if($("#lbrPointUseAmt").val() > 0){
            dlrUsePurpose = "01";
        } else if($("#parPointUseAmt").val() > 0){
            dlrUsePurpose = "02";
        }

        if(dlrRowData != null){
            dlrRowData.set("membershipNm", $("#carOwnerNm").val());
            dlrRowData.set("membershipNo", $("#membershipNo").val());
            dlrRowData.set("gradeNm",      $("#gradeNm").val());
            dlrRowData.set("lastPointVal", $("#lastPointVal").val());
            dlrRowData.set("cardNo",       $("#dlrPointCardNo").val());
            dlrRowData.set("occrPointVal", Number($("#pointTotAmt").val()) * (1/Number($("#pointExchgScale").val())));
            dlrRowData.set("dlrUsePurpose", dlrUsePurpose);
            dlrRowData.set("dlrUseAmt", $("#pointTotAmt").val());
            dlrRowData.set("membershipPointUseMaxPoint", $("#membershipPointUseMaxPoint").val());
        }
    };

    setBmMemberShipInfo = function(){
        var bmPointGrid = $("#bmPointGrid").data("kendoExtGrid");
        var rowData = bmPointGrid.dataItem("tr:eq(0)");

        if(rowData != null){
            // 정산총금액 구하기
            var calcGrid = $("#calcGrid").data("kendoExtGrid");
            var calcRowData = calcGrid.dataItem(calcGrid.select());
            var calcAmt = 0;
            var bmUsePurpose = "03";
            var roTp = $("#roTp").val();
            var consumeType;

            if(calcRowData != null){
                calcAmt = Number(calcRowData.calcAmt);
            }

            if($("#lbrBmPointUseAmt").val() > 0){
                bmUsePurpose = "01";
            } else if($("#parBmPointUseAmt").val() > 0){
                bmUsePurpose = "02";
            }

            if(roTp == "01") {
                consumeType = "11";
            } else if(roTp == "02") {
                consumeType = "12";
            } else if(roTp == "03") {
                consumeType = "13";
            } else if(roTp == "04") {
                consumeType = "14";
            } else if(roTp == "05") {
                consumeType = "15";
            }

            rowData.set("bmMembershipNm",   $("#carOwnerNm").val());
            rowData.set("blueMembershipNo", $("#bmMembershipNo").val());
            rowData.set("mLevel",           $("#bmGradeCd").val());
            rowData.set("point",            $("#bmLastPointVal").val());
            rowData.set("consumeType",      consumeType);
            rowData.set("consumePoints",    Number($("#bmPointTotAmt").val()) * (1/Number($("#bmPointScale").val())));
            rowData.set("maxConsumePoint",  $("#bmMaxConsumInte").val());
            rowData.set("custNo",           $("#carOwnerId").val());
            rowData.set("vin",              $("#vinNo").val());
            rowData.set("totalCost",        calcAmt);
            rowData.set("roDocNo",          $("#roDocNo").val());
            rowData.set("bmUsePurpose",     bmUsePurpose);
            rowData.set("bmUseAmt",         $("#bmPointTotAmt").val());
        }
    }

    bmSaveParam = function() {
    	/** tjx 去掉bmPointGrid蓝缤相关的积分查询部分
        var bmPointGrid = $("#bmPointGrid").data("kendoExtGrid");
        var bmPointGridData = bmPointGrid.dataSource.at(0);
		*/
        var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");  //bmCupnGrid其他优惠部分
        var bmCupnGridData = bmCupnGrid.dataSource.at(0);

        /**포인트 사용하지 않았는데도 입력만으로 포인트 차감되는 현상 수정    tjx 去掉bmPointGrid蓝缤相关的积分查询部分
        var bmUsePoints = bmPointGridData.consumePoints;
        if($("#bmPointTotAmt").val() == 0){
            bmUsePoints = 0
        }*/
        var bmPointData = {
             blueMembershipNo  : $("#bmMembershipNo").val()
//          ,consumeType       : bmPointGridData.consumeType
//          ,consumePoints     : bmUsePoints
            ,consumeType       : " "
            ,consumePoints     : " "
            ,consumePointsCost : $("#bmPointTotAmt").val()
            ,custNo            : $("#carOwnerId").val()
            ,vin               : $("#vinNo").val()
            ,roDocNo           : $("#roDocNo").val()
            ,cardNo            : bmCupnGridData.cardNo //卡券编号
            ,carCategory       : $("#carlineCd").val()
            ,mileAge           : $("#giRunDistVal").val()
           //,cardCost          : bmCupnGridData.reduceCost
            ,cardCost          : bmCupnGridData.cardDeno //卡券面额
            ,cardConsumeCost   : $("#bmCupnTotAmt").val()
            //,paymentCost       : $("#lastCalcTotAmt").val()
            ,paymentCost       : totCustPaymAmt
            ,totalCost         : $("#calcTotAmt").val()
        };

        return bmPointData;
    };
    //tjx 新增其他优惠数据(卡券信息)
    fmsSaveParam = function() {
        var bmCupnGrid = $("#bmCupnGrid").data("kendoExtGrid");  //bmCupnGrid其他优惠部分
        var bmCupnGridData = bmCupnGrid.dataSource.at(0);
        var fmsPointData = {
             cardNo            : bmCupnGridData.cardNo //卡券编号
            ,cardNm       	   : bmCupnGridData.cardNm //卡券名称
            ,cardTp            : bmCupnGridData.cardTp //卡券类型
            ,cardDeno          : bmCupnGridData.cardDeno //卡券面额
            ,claimAmo          : bmCupnGridData.claimAmo //索赔金额
            ,cardAdjust        : bmCupnGridData.cardAdjust //调整项
            ,cupnChangeAmt     : bmCupnGridData.cupnChangeAmt //调整金额
            ,cardUseNoti       : bmCupnGridData.cardUseNoti //使用须知
            ,expirationDate    : kendo.parseDate(bmCupnGridData.expirationDate) //截止日期
        };
        return fmsPointData;
    };

    // 딜러멤버쉽 저장 Param
    dlrPointSaveParam = function() {
        var dlrPointGrid = $("#dlrPointGrid").data("kendoExtGrid");
        var dlrPointGridData = dlrPointGrid.dataSource.at(0);

        var cardPointUseParam = {
            membershipNo:dlrPointGridData.membershipNo
            ,cardNo:dlrPointGridData.cardNo
            ,pointCd:"06"
            ,occrPointVal:dlrPointGridData.occrPointVal
            ,occrPointCost:dlrPointGridData.dlrUseAmt
            ,useTp:"03"
            ,useNum:$("#roDocNo").val()
            ,srcSub1:$("#calcDocNo").val()
        };
        return cardPointUseParam;
    };

    var slide = kendo.fx($("#slide-in-share")).slideIn("right"),
    visible = true;

    $("#slide-in-handle").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible) {
            slide.reverse();
        } else {
            slide.play();
        }
        visible = !visible;
        e.preventDefault();
    });

    var slide1 = kendo.fx($("#slide-in-share1")).slideIn("right"),
    visible1 = true;

    $("#slide-in-handle1").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible1) {
            slide1.reverse();
            var dcGrid = $("#dcGrid").data("kendoExtGrid");
            dcGrid.dataSource.data([]);

            if(dms.string.strNvl($("#driverNm").val()) != "") {
                if($("#roTp").val() == "02"){
                    $("#dcSet").data("kendoButton").enable(false);
                    $("#dcCancel").data("kendoButton").enable(false);
                } else {
                    $("#dcSet").data("kendoButton").enable(true);
                    $("#dcCancel").data("kendoButton").enable(true);
                }
                dcGrid.dataSource.read();
            }
        } else {
            slide1.play();
        }
        visible1 = !visible1;
        e.preventDefault();
    });

    var slide2 = kendo.fx($("#slide-in-share2")).slideIn("right"),
    visible2 = true;

    $("#slide-in-handle2").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible2) {
            slide2.reverse();
            $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);
            if(dms.string.strNvl($("#membershipNo").val()) != "") {
                $("#cardListGrid").data("kendoExtGrid").dataSource.read();
            }
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
        } else {
            slide3.play();
        }
        visible3 = !visible3;
        e.preventDefault();
    });

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
        gridId:"G-SER-0420-000001"
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
                    //slidePlay2();
                    var roTpCd = $("#roTp").data("kendoExtDropDownList").value();

                    var selectedVal = this.dataItem(this.select());
                    $("#resvDocNo").val(selectedVal.resvDocNo);
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
        gridId:"G-SER-0420-000002"
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
                    //slidePlay2();
                    var selectedVal = this.dataItem(this.select());
                    var roTpCd = $("#roTp").data("kendoExtDropDownList").value();
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();


                    //선수금
                    if($("#preAmt").val() != undefined){
                        $("#preAmt").data("kendoExtNumericTextBox").value(Number(selectedVal.preAmt));
                    }

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
        gridId:"G-SER-0420-000003"
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
                    //partInfo(selectedVal.estDocNo, "ET");             // 부품(selectPartList.jsp)
                    //lbrInfo(selectedVal.estDocNo, "ET");              // 공임(selectLbrList.jsp)

                    var parentRoTp = $("#roTp").data("kendoExtDropDownList").value();
                    var roTpCd = selectedVal.roTp;

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

                }

            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100, attributes:{"class":"al"}}//방문자
            ,{field:"estDocNo", title:"<spring:message code='ser.lbl.estDocNo' />", attributes:{"class":"al"}, width:80}//견적번호
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
            ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.estTotAmt' />", width:80
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
        gridId:"G-SER-0420-000004"
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
                    //slidePlay2();
                    var selectedVal = this.dataItem(this.select());
                    //partInfo(selectedVal.rescDocNo, "RES");             // 부품(selectPartList.jsp)
                    //lbrInfo(selectedVal.rescDocNo, "RES");              // 공임(selectLbrList.jsp)


                    var parentRoTp = $("#roTp").data("kendoExtDropDownList").value();
                    var selectedVal = this.dataItem(this.select());
                    var ltsModelCd = dms.string.isEmpty($("#ltsModelCd").val()) ? "ALL" : $("#ltsModelCd").val();

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
        ,sortable:false
        ,pageable:false
        ,autoBind:false
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

});
</script>

<style>
    #slide-in-share { width:900px; margin-right:-900px;}
    #slide-in-share1 { width:900px; margin-right:-900px;}
    #slide-in-share1 .slide-in-handle { top:102px;}
    #slide-in-share2 { width:900px; margin-right:-900px;}
    #slide-in-share2 .slide-in-handle { top:205px;}
    #slide-in-share3 { width:900px; margin-right:-900px;}
    #slide-in-share3 .slide-in-handle { top:308px;}
    #slide-in-share4 { width:900px; margin-right:-900px;}
    #slide-in-share4 .slide-in-handle { top:205px;}
</style>
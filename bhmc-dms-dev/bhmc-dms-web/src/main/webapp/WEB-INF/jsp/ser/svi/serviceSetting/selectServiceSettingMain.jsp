<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 서비스설정화면 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12018" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12017" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSave" class="btn_m"><spring:message code="global.btn.confirm" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 그리드 기능 버튼 종료 -->
            <form id="saveForm" name="saveForm" method="POST">
            <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:30%;">
                            <col style="width:22%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.boardBase" /></th><!--칸반기본설정  -->
                                <td>
                                    <input id="boardStdPrefCd" name="boardStdPrefCd" class="form_comboBox" style="width:50%" data-json-obj="true" >
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.payMethodFix" /></th><!--지불방식고정  -->
                                <td>
                                    <input id="paymMthCd" name="paymMthCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.resvAvlHm" /></th><!--예약가용시간  -->
                                <td>
                                    <input id="resvAvlbStartHm" name="resvAvlbStartHm" class="form_dateTimePicker" style="width:23%" data-json-obj="true">
                                    ~ <input id="resvAvlbEndHm" name="resvAvlbEndHm" class="form_dateTimePicker" style="width:24%" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.invoiceTpFix" /></th><!--영수증유형고정  -->
                                <td>
                                    <input id="rcptTpCd" name="rcptTpCd" class="form_comboBox">
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.resvIntHm" /></th><!--예약간격시간  -->
                                <td>
                                    <input id="resvIvalCd" name="resvIvalCd" class="form_comboBox"  style="width:50%" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.interSettFix" /></th><!--정산절사설정  -->
                                <td>
                                    <input id="wonUnitCutCd" name="wonUnitCutCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.resvStatHm" /></th><!--예약상태시간  -->
                                <td></td>
                                <th scope="row"><spring:message code="ser.lbl.settClZeroFix" /></th><!--정산제로  -->
                                <td>
                                    <input id="demicalPointCutCd" name="demicalPointCutCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <spring:message code="ser.lbl.resvBaseCom" />
                                    <input id="resvKeepHmCd" name="resvKeepHmCd" class="form_comboBox" style="width:20%" data-json-obj="true" >
                                    <spring:message code="ser.lbl.resvInHm" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.custTelYn" /></th><!--프린트 시 고객전화표시 여부  -->
                                <td>
                                    <input id="custTelYnCd" name="custTelYnCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <spring:message code="ser.lbl.resvNkeepCom" />
                                    <input id="resvNkeepHmCd" name="resvNkeepHmCd" class="form_comboBox" style="width:20%" data-json-obj="true" >
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.partRcvYn" /></th><!--수리시작 후 부품수령가능 여부  -->
                                <td>
                                    <input id="partRcvYnCd" name="partRcvYnCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.nextFreeHmCd" /></th><!--면비보양시간  -->
                                <td><input id="nextFreeHmCd" name="nextFreeHmCd" class="form_comboBox"  style="width:50%" data-json-obj="true"></td>
                                <th scope="row"><spring:message code="ser.lbl.resvSerAlramSet" /></th><!--예약서비스알람설정  -->
                                <td>
                                    <input id="resvSerAlramCd" name="resvSerAlramCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.nextFreeRunDistValCd" /></th><!--면비보양 주행거리  -->
                                <td><input id="nextFreeRunDistValCd" name="nextFreeRunDistValCd" class="form_comboBox" style="width:50%" data-json-obj="true"></td>
                                <th scope="row"><spring:message code="ser.lbl.autoWorkProcessYn" /></th><!--배정완료 후 자동 수리시작 여부  -->
                                <td>
                                    <input id="autoWrkProcYnCd" name="autoWrkProcYnCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.revTelNo" /></th><!-- 예약연락처 -->
                                <td>
                                    <input id="callCenTelNo" name="callCenTelNo" class="form_input telNo" maxlength="20" style="width:50%" pattern="\d" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roLbrHmEditYn" /></th><!--정비위탁시 수리항목의 수불공임 편집가능여부  -->
                                <td>
                                    <input id="lbrHmEditYnCd" name="lbrHmEditYnCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.resTelNo" /></th><!-- 구원연락처 -->
                                <td>
                                    <input id="emgcCenTelNo" name="emgcCenTelNo" class="form_input telNo" maxlength="20" style="width:50%" pattern="\d" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.serviceTelNo" /></th><!-- 서비스연락처 -->
                                <td>
                                    <input id="serDlrTelNo" name="serDlrTelNo" class="form_input telNo" maxlength="20" pattern="\d" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.serDlrAddr" /></th><!-- 정비딜러 주소 -->
                                <td>
                                    <input type="text" id="serDlrAddr1Nm" name="serDlrAddr1Nm" class="form_input" style="width:80%" data-json-obj="true">

                                    <input type="hidden" id="serDlrDistCd" name="serDlrDistCd" />
                                    <input type="hidden" id="serDlrDistNm" name="serDlrDistNm" />

                                    <input type="hidden" id="serDlrAreaCd" name="serDlrAreaCd" />
                                    <input type="hidden" id="serDlrAreaNm" name="serDlrAreaNm" />

                                    <input type="hidden" id="serDlrSungCd" name="serDlrSungCd" />
                                    <input type="hidden" id="serDlrSungNm" name="serDlrSungNm" />
                                    <button type="button" id="btnAddAddress" class="btn_xs2 btn_add"><spring:message code="global.btn.add" /></button><!-- 주소 추가 -->
                                </td>
                                <th scope="row"><spring:message code="global.lbl.print" /><spring:message code="global.lbl.area" /><spring:message code="global.lbl.type" /></th><!-- 프린트 지역유형 -->
                                <td>
                                    <input type="text" id="printAreaTp" name="printAreaTp" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.serResvAlram" /></th><!-- 정비예약알람 -->
                                <td colspan="3">
                                    <textarea type="text" maxlength="300" rows="5" id="serResvAlarm"  name="serResvAlarm" class="form_textarea" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.ArrivalPartAram" /></th><!-- 부품예약알람 -->
                                <td colspan="3">
                                    <textarea type="text" maxlength="300" rows="5" id="partResvAlarm"  name="partResvAlarm" class="form_textarea" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preChkAlarm" /></th><!-- 사전점검알람 -->
                                <td colspan="3">
                                    <textarea type="text" maxlength="300" rows="5" id="preChkAlarm"  name="preChkAlarm" class="form_textarea" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roAlarm" /></th><!-- 정비위탁알람 -->
                                <td colspan="3">
                                    <textarea type="text" maxlength="300" rows="5" id="roAlarm"  name="roAlarm" class="form_textarea" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.estAlarm" /></th><!-- 정비견적알람 -->
                                <td colspan="3">
                                    <textarea type="text" maxlength="300" rows="5" id="estAlarm"  name="estAlarm" class="form_textarea" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcAlarm" /></th><!-- 서비스정산알람  -->
                                <td colspan="3">
                                    <textarea type="text" maxlength="300" rows="5" id="calcAlarm" name="calcAlarm" class="form_textarea" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </section>
    </div>
</div>
<script type="text/javascript">


//예약준수 Array
var keepResvTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${keepResvTpList}">
keepResvTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//예약어김 Array
var nkeepResvTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${nkeepResvTpList}">
nkeepResvTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//예약간격 Array
var resvInkTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${resvInkTpList}">
resvInkTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//보드기준 Array
var boardTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${boardTpList}">
boardTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//다음보양 시간 Array
var freeHmTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${freeHmTpList}">
freeHmTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"+" 个月", "useYn":"${obj.useYn}"});
</c:forEach>

//다음 보양 주행거리 Array
var freeKmTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${freeKmTpList}">
freeKmTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"+" KM", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Array
var paymMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//영수증유형 Array
var rcptTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//정산절사 Array
var wonUnitCutCdList = [];
<c:forEach var="obj" items="${wonUnitCutCdList}">
wonUnitCutCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//정산제로 Array
var demicalPointCutCdList = [];
<c:forEach var="obj" items="${demicalPointCutCdList}">
demicalPointCutCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//고객전화표시여부
var custTelYnCdList = [];
<c:forEach var="obj" items="${custTelYnCdList}">
custTelYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//부품수령가능여부
var partRcvYnCdList = [];
<c:forEach var="obj" items="${partRcvYnCdList}">
partRcvYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//예약서비스알람설정
var resvSerAlarmCdList = [];
<c:forEach var="obj" items="${resvSerAlarmCdList}">
resvSerAlarmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//자동수리시작여부
var autoWrkProcYnCdList = [];
<c:forEach var="obj" items="${autoWrkProcYnCdList}">
autoWrkProcYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//수불공임편집여부
var lbrHmEditYnCdList = [];
<c:forEach var="obj" items="${lbrHmEditYnCdList}">
lbrHmEditYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//프린트지역유형
var printAreaTpList = [];
<c:forEach var="obj" items="${printAreaTpList}">
printAreaTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

$(document).ready(function() {

    getSerSetData();

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    $("#resvAvlbStartHm").kendoTimePicker({
        format:"HH:mm"
    });

    $("#resvAvlbEndHm").kendoTimePicker({
        format:"HH:mm"
    });

    $("#boardStdPrefCd").kendoExtDropDownList({
        dataSource:boardTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#resvIvalCd").kendoExtDropDownList({
        dataSource:resvInkTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#resvKeepHmCd").kendoExtDropDownList({
        dataSource:keepResvTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#resvNkeepHmCd").kendoExtDropDownList({
        dataSource:nkeepResvTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#nextFreeHmCd").kendoExtDropDownList({
        dataSource: freeHmTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#nextFreeRunDistValCd").kendoExtDropDownList({
        dataSource: freeKmTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#rcptTpCd").kendoExtDropDownList({
        dataSource:rcptTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(rcptTpCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#rcptTpCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    $("#paymMthCd").kendoExtDropDownList({
        dataSource:paymMthCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(paymMthCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#paymMthCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    // 정산절사
    $("#wonUnitCutCd").kendoExtDropDownList({
        dataSource:wonUnitCutCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(wonUnitCutCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#wonUnitCutCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    // 정산제로
    $("#demicalPointCutCd").kendoExtDropDownList({
        dataSource:demicalPointCutCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(demicalPointCutCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#demicalPointCutCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    //고객전화표시여부
    $("#custTelYnCd").kendoExtDropDownList({
        dataSource:custTelYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(custTelYnCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#custTelYnCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    //부품수령가능여부
    $("#partRcvYnCd").kendoExtDropDownList({
        dataSource:partRcvYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(partRcvYnCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#partRcvYnCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    //예약서비스알람설정
    $("#resvSerAlramCd").kendoExtDropDownList({
        dataSource:resvSerAlarmCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(resvSerAlarmCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#resvSerAlramCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    //자동수리시작여부
    $("#autoWrkProcYnCd").kendoExtDropDownList({
        dataSource:autoWrkProcYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(autoWrkProcYnCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#autoWrkProcYnCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

    //수불공임편집여부
    $("#lbrHmEditYnCd").kendoExtDropDownList({
        dataSource:lbrHmEditYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataBound:function(e){
            $.each(lbrHmEditYnCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#lbrHmEditYnCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
    });

  //수불공임편집여부
    $("#printAreaTp").kendoExtDropDownList({
        dataSource:printAreaTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    var onlyTelNo = new RegExp("[^0-9.;\-]");
    $(".telNo").keyup(function(e){
        var content = $(this).val();
        if(content.match(onlyTelNo)){
            $(this).val('');
        }
    });

    $(".telNo").focusout(function(){
        $(this).val($.trim($(this).val()));
        var content = $(this).val();
        if(content.match(onlyTelNo)){
            $(this).val('');
        }
    });


    //버튼 - 주소  추가
     $("#btnAddAddress").kendoButton({
         click:function(e) {
             zipCodeSearchPopupWin = dms.window.popup({
                 windowId:"zipCodeSearchPopupWin"
                 , width:"700"
                 , height:"400"
                 , title:"<spring:message code='global.title.zipSearch' />"
                 , content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                     , data:{
                         "autoBind":false
                         ,"usrNm":""
                         ,"callbackFunc":function(data){
                             if (data.length >= 1) {
                                 zipInfoDataSet(data);
                             }
                         }
                     }
                 }
             });
         }
     });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            getSerSetData();
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var formParam = $("saveForm").serializeObject($("#saveForm").serializeArrayInSelector("[data-json-obj='true']"));
            var cmmCodeList = [
                {"cmmCd":$("#paymMthCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER061", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#rcptTpCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER072", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#wonUnitCutCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER063", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#demicalPointCutCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER064", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#custTelYnCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER065", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#partRcvYnCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER066", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#resvSerAlramCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER067", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#autoWrkProcYnCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER068", "remark10":"default", "sortOrder":"1"}
                ,{"cmmCd":$("#lbrHmEditYnCd").data("kendoExtDropDownList").value(), "cmmCdNm":"test", "cmmGrpCd":"SER069", "remark10":"default", "sortOrder":"1"}
            ];

            var param = $.extend(
                {"serviceSettingVO":formParam}
                ,{"cmmCodeListVO":cmmCodeList}
            );

            $.ajax({
                url:"<c:url value='/ser/svi/serviceSetting/multiServiceSettings.do' />",
                data:JSON.stringify(param),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //취소
    $("#btnReset").kendoButton({
        click:function(e) {
            $("#saveForm").get(0).reset();
        }
    });

});

getSerSetData = function() {
    var formParam = {};
    $.ajax({
        url:"<c:url value='/ser/svi/serviceSetting/selectServiceSettings.do' />",
        data:JSON.stringify(formParam),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {
            if(jqXHR.data){
                $("#boardStdPrefCd").data("kendoExtDropDownList").value(jqXHR.data[0].boardStdPrefCd);
                $("#resvIvalCd").data("kendoExtDropDownList").value(jqXHR.data[0].resvIvalCd);
                $("#resvKeepHmCd").data("kendoExtDropDownList").value(jqXHR.data[0].resvKeepHmCd);
                $("#resvNkeepHmCd").data("kendoExtDropDownList").value(jqXHR.data[0].resvNkeepHmCd);
                $("#resvAvlbStartHm").val(jqXHR.data[0].resvAvlbStartHm);
                $("#resvAvlbEndHm").val(jqXHR.data[0].resvAvlbEndHm);
                $("#nextFreeHmCd").data("kendoExtDropDownList").value(jqXHR.data[0].nextFreeHmCd);
                $("#nextFreeRunDistValCd").data("kendoExtDropDownList").value(jqXHR.data[0].nextFreeRunDistValCd);
                $("#printAreaTp").data("kendoExtDropDownList").value(jqXHR.data[0].printAreaTp||"EE");
                $("#callCenTelNo").val(jqXHR.data[0].callCenTelNo);
                $("#emgcCenTelNo").val(jqXHR.data[0].emgcCenTelNo);
                $("#serDlrTelNo").val(jqXHR.data[0].serDlrTelNo);
                $("#serDlrAddr1Nm").val(jqXHR.data[0].serDlrAddr1Nm);
                $("#serResvAlarm").val(jqXHR.data[0].serResvAlarm);
                $("#partResvAlarm").val(jqXHR.data[0].partResvAlarm);
                $("#preChkAlarm").val(jqXHR.data[0].preChkAlarm);
                $("#roAlarm").val(jqXHR.data[0].roAlarm);
                $("#estAlarm").val(jqXHR.data[0].estAlarm);
                $("#calcAlarm").val(jqXHR.data[0].calcAlarm);
            }
        }
    });
}

zipInfoDataSet = function(data) {

    var sungNm = dms.string.strNvl(data[0].sungNm);
    var cityNm = dms.string.strNvl(data[0].cityNm);
    var distNm = dms.string.strNvl(data[0].distNm);

    $("#serDlrSungCd").val(dms.string.strNvl(data[0].sungCd));
    $("#serDlrSungNm").val(dms.string.strNvl(data[0].sungNm));
    $("#serDlrAreaCd").val(dms.string.strNvl(data[0].cityCd));
    $("#serDlrAreaNm").val(dms.string.strNvl(data[0].cityNm));
    $("#serDlrDistCd").val(dms.string.strNvl(data[0].distCd));
    $("#serDlrDistNm").val(dms.string.strNvl(data[0].distNm));

    $("#serDlrAddr1Nm").val(sungNm+" "+cityNm+" "+distNm);

}



//거래처 팝업 열기 함수.
var venderSearchPopupWin;
function selectVenderMasterPopupWindow(){

    venderSearchPopupWin = dms.window.popup({
        windowId:"venderSearchPopupWin"
        ,title:"<spring:message code = 'ser.title.venderSelect'/>"   // 거래처 조회
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    var grid = $('#grid').data('kendoExtGrid');
                    var dataItems = grid.dataSource._data;
                    var checkVal = true;

                    // 중복값 체크
                    $.each(dataItems, function(idx, obj){
                        if(data[0].bpCd == obj.subBpCd){
                            checkVal = false;
                        }
                    });
                    if(checkVal){
                        var dataItem = grid.dataItem(grid.select());
                        dataItem.subBpCd = data[0].bpCd;
                        dataItem.subBpNm = data[0].bpNm;
                        grid.refresh();
                    }

                    venderSearchPopupWin.close();
                }
            }
        }
    });
}

</script>








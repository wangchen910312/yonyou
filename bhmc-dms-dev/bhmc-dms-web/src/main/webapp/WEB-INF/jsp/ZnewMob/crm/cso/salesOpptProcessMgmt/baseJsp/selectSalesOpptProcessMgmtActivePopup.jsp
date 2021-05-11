<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_pop_list -->
        <section id="content_pop_list">
            <div class="content_title">
                <h1 id="content_pop_list_title"><spring:message code="crm.lbl.activeAdd" /><!-- 추적추가  --></h1>
            </div>

            <div class="formarea" id="activeAddTabDiv">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="required"><spring:message code="crm.lbl.traceMth" /><!-- 추적방식 --></th>
                            <td>
                                <div class="f_text"><input id="traceMthCd" name="traceMthCd"  data-json-obj="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"  class="required"><spring:message code="crm.lbl.traceDt" /><!-- 추적시간 --></th>
                            <td>
                                <div class="f_item01">
                                    <input type="datetime-local" id="traceDt" name="traceDt" data-json-obj="true" style="background-color:#ffffff;" />
                                </div>
                            </td>
                        </tr>
                        <!--<tr>
                            <th scope="row"></th>
                            <td>
                                <div class="f_item01"><input id="traceTime" name="traceTime" data-json-obj="true"  />
                                    <span class="time" onclick="timepicker2('traceTime')">시간선택</span>
                                </div>
                            </td>
                        </tr>-->
                        <tr>
                            <th scope="row" class="required"><spring:message code="crm.lbl.nextTraceMthCd" /><!-- 다음추적방식 --></th>
                            <td>
                                <div class="f_text"><input id="nextTraceMthCd" name="nextTraceMthCd"data-json-obj="true"  /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.nextTraceDt" /><!-- 다음추적일자 --></th>
                            <td>
                                <div class="f_item01">
                                    <input type="datetime-local" id="nextTraceDt" name="nextTraceDt" data-json-obj="true" style="background-color:#ffffff;" />
                                </div>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th scope="row"></th>
                            <td>
                                <div class="f_item01">
                                    <input id="nextTraceTime" name="nextTraceTime" data-json-obj="true"  />
                                    <span class="time" onclick="timepicker2('nextTraceTime')">시간선택</span>
                                </div>
                            </td>
                        </tr> -->
                        <tr>
                            <th scope="row" class="required"><spring:message code="crm.lbl.traceCont" /><!-- 추적상황 --></th>
                            <td>
                                <textarea rows="5" cols="" class="f_textarea"  id="traceCont" name="traceCont" maxlength="500" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="crm.lbl.activeGrade" /><!-- 추적등급 --></th>
                            <td>
                                <div class="f_text"><input id="traceGradeCd" name="traceGradeCd" data-json-obj="true"  /></div>
                            </td>
                        </tr>
                        <tr class="btnStep02" style="display:none;">
                            <th scope="row"><spring:message code="crm.lbl.validCheck" /><!-- 유효성판단 --></th>
                            <td>
                                <div class="f_text"><input id="validGradeCd" name="validGradeCd" data-json-obj="true"  /></div>
                            </td>
                        </tr>
                        <tr class="btnStep02" style="display:none;">
                            <th scope="row"><spring:message code="crm.lbl.invalidReason" /><!-- 무효원인 --></th>
                            <td>
                                <div class="f_text"><input id="invalidCauCd" name="invalidCauCd" data-json-obj="true"  /></div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
                <input type="hidden" id="btnCustSearch" />
                <input type="hidden" id="dlrCd" name="dlrCd"  data-json-obj="true" />
                <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
                <input type="hidden" id="custSearch" name="custSearch"  class="custSearch" />

                <input type="hidden" id="leadStatCd" name="leadStatCd"  />

            </div><!-- //activeAddTabDiv -->

            <div class="con_btnarea btncount2">
            <dms:access viewId="VIEW-D-13118" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnCancel" class="btnd1"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
            </dms:access>
            <dms:access viewId="VIEW-D-13119" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnCtlSaveTrace" class="btnd1"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
            </dms:access>
            </div>
        </section>
    </section>
<!-- script -->
<script>

var traceGrdMap = [];

<c:forEach var="obj" items="${traceGrdList}">
    traceGrdMap["${obj.cmmCd}"] = "${obj.traceIvalDay}";
</c:forEach>

var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

var traceMthCdList = [];
var traceMthCdMap = [];

var traceGradeCdList = [];
var traceGradeCdMap = [];

var validGradeCdList = [];
var validGradeCdMap = [];

var invalidCauCdList = [];
var invalidCauCdMap = [];

var cSeq = "";

var d = new Date();
var time = d.getHours() + ":" + d.getMinutes();

function date_add(sDate, nDays){
    var yy = parseInt(sDate.substr(0,4), 10);
    var mm = parseInt(sDate.substr(5,2), 10);
    var dd = parseInt(sDate.substr(8), 10);

    d = new Date(yy, mm -1, dd + nDays);

    yy = d.getFullYear();
    mm = d.getMonth() + 1;
    mm = (mm < 10)?'0' + mm : mm;
    dd = d.getDate();
    dd = (dd < 10)?'0' + dd : dd;

    return yy + '-' + mm + '-' + dd;
}

<c:forEach var="obj" items="${traceMthCdList}">
traceMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
traceMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
<c:forEach var="obj" items="${traceGradeCdList}">
<c:if test="${obj.cmmCd != 'D'}">
traceGradeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
traceGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:if>
</c:forEach>
<c:forEach var="obj" items="${validGradeCdList}">
validGradeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
validGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
<c:forEach var="obj" items="${invalidCauCdList}">
invalidCauCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
invalidCauCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;
$(document).ready(function() {
    $("#traceDt").val(parent.toDt + "T" + time);

    $("#traceMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:traceMthCdList
        , index:0
    });
    $("#nextTraceMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:traceMthCdList
        , index:0
    });
    $("#traceGradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:traceGradeCdList
        , index:0
        , select:function(e){
            var dataItem = this.dataItem(e.item);

            if(traceGrdMap[dataItem.cmmCd] != "" && typeof(traceGrdMap[dataItem.cmmCd]) != "undefined" ){
                $("#nextTraceDt").val(date_add(parent.toDt, parseInt(traceGrdMap[dataItem.cmmCd])) + "T" + time);
                if($("#nextTraceMthCd").data("kendoExtDropDownList").value() == ""){
                    $("#nextTraceMthCd").data("kendoExtDropDownList").value("03");
                }
            }
        }
    });

    $("#validGradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:dms.data.cmmCdFilter(validGradeCdList)
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "03"){
                $("#invalidCauCd").data("kendoExtDropDownList").enable(true);
            } else {
                $("#invalidCauCd").data("kendoExtDropDownList").enable(false);
                $("#invalidCauCd").data("kendoExtDropDownList").value(" ");
            }
        }
    });

    $("#invalidCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:invalidCauCdList
        , index:0
    });
    $("#invalidCauCd").data("kendoExtDropDownList").enable(false);

    var options = parent.activeAddPopupWin.options.content.data;
    if(options.leadStatCd == "09" || options.leadStatCd == "08"){
        $("#traceGradeCd").data("kendoExtDropDownList").enable(false);
    }
    if (options.autoBind) {
        $("#custNo").val(options.custNo);
        $("#leadStatCd").val(options.leadStatCd);
        $("#seq").val(options.salesOpptSeq);
        $("#traceGradeCd").data("kendoExtDropDownList").value(options.traceGradeCd);
        $("#invalidCauCd").data("kendoExtDropDownList").value(options.invalidCauCd);
        cSeq = options.cSeq;
        $("#validGradeCd").data("kendoExtDropDownList").value(options.validGradeCd);
        if(options.validGradeCd == "03") {
            $("#invalidCauCd").data("kendoExtDropDownList").enable(true);
        }
        if(traceGrdMap[options.traceGradeCd] != "" && typeof(traceGrdMap[options.traceGradeCd]) != "undefined" ){
            $("#nextTraceDt").val(date_add(parent.toDt, parseInt(traceGrdMap[options.traceGradeCd])) + "T" + time);
            $("#nextTraceMthCd").data("kendoExtDropDownList").value("03");
        }
    }
    if (options.leadStatCd == "02"){
        $(".btnStep02").show();
    }

    //취소 버튼.
    $("[id^='btnCancel']").click(function(){
        parent.activeAddPopupWin.close();
    });
});

//추적저장 버튼.
$("#btnCtlSaveTrace").kendoButton({
    click:function(e){

        var traceMthCd = $("#traceMthCd").data("kendoExtDropDownList").value();
        var traceCont = $("#traceCont").val();
        var traceGradeCd = $("#traceGradeCd").data("kendoExtDropDownList").value();
        var nextTraceDt = $("#nextTraceDt").val();
        var nextTraceMthCd = $("#nextTraceMthCd").data("kendoExtDropDownList").value();
        if ( dms.string.isEmpty(traceMthCd)){
            mob.notification.warning("<spring:message code='crm.lbl.traceMth' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }
        if ( dms.string.isEmpty(traceDt)){
            mob.notification.warning("<spring:message code='crm.lbl.traceDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }
        if ( dms.string.isEmpty(traceCont)){
            mob.notification.warning("<spring:message code='crm.lbl.traceCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }

        if ( dms.string.isEmpty(traceGradeCd)){
            mob.notification.warning("<spring:message code='crm.lbl.activeGrade' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }

        // hg 20150317
        if ( !dms.string.isEmpty(nextTraceMthCd) ){
            if(dms.string.isEmpty(nextTraceDt)){
                mob.notification.warning("<spring:message code='crm.lbl.nextTraceDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }
        }

        // hg 20150317
        if ( !dms.string.isEmpty(nextTraceDt) ){
            if(dms.string.isEmpty(nextTraceMthCd)){
                mob.notification.warning("<spring:message code='crm.lbl.nextTraceMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }
        }

        var salesOpptTraceParam = {};
            $("#activeAddTabDiv").serializeObject(
                    $("#activeAddTabDiv").serializeArrayInSelector("[data-json-obj='true']")
            );

        salesOpptTraceParam["traceMthCd"] = traceMthCd;
        salesOpptTraceParam["nextTraceMthCd"] = $("#nextTraceMthCd").data("kendoExtDropDownList").value();
        salesOpptTraceParam["traceGradeCd"] = $("#traceGradeCd").data("kendoExtDropDownList").value();
        salesOpptTraceParam["validGradeCd"] = $("#validGradeCd").data("kendoExtDropDownList").value();
        salesOpptTraceParam["invalidCauCd"] = $("#invalidCauCd").data("kendoExtDropDownList").value();
        salesOpptTraceParam["saleOpptSeq"] = $("#seq").val();
        salesOpptTraceParam["traceCont"] = traceCont;
        salesOpptTraceParam["leadStatCd"] = $("#leadStatCd").val();//                leadStatCd
        salesOpptTraceParam["cSeq"] = cSeq;

        var sTraceDt = $("#traceDt").val();
        if(dms.string.isEmpty(sTraceDt)){
            salesOpptTraceParam["traceDt"] = null;
        }else{
            salesOpptTraceParam["traceDt"] = chgDateTimeStamphhMM($("#traceDt").val());
        }

        var sNextTraceDt = $("#nextTraceDt").val();
        if(dms.string.isEmpty(sNextTraceDt)){
            salesOpptTraceParam["nextTraceDt"] = null;
        }else{
            salesOpptTraceParam["nextTraceDt"] = chgDateTimeStamphhMM($("#nextTraceDt").val());
        }

        console.log("btnCtlSaveTrace Saving of Request Info. !!");
        console.log(salesOpptTraceParam);

        mob.loading.show();
        $.ajax({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptTraceMgmts.do' />"
            ,data:JSON.stringify(salesOpptTraceParam)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                mob.loading.hide();
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success:function(result){
                mob.loading.hide();
                mob.notification.success("<spring:message code='global.info.success'/>");

            }
        }).done(function(result) {
            if(parent.callbackActive!=null || parent.callbackActive != undefined){
                parent.callbackActive();
            }

            $("[id^='btnCancel']").click();
        });
    }
});
</script>
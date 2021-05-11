<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <div class="content">
        <input type="hidden" id="resvDocNo" name="resvDocNo" data-json-obj="true">
        <!-- 보증현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-13027" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13029" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnExcelExport" class="btn_m"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11520" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </dms:access>
                </div>
            </div>
            <form id="form">
                <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup id="reservationStatColGroup">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                                <td>
                                    <input type="text" id="sCarRegNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.resvDocNo' /><!-- 예약접수번호 --></th>
                                <td>
                                    <input type="text" id="sResvDocNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.resvChannel' /><!-- 예약채널 --></th>
                                <td>
                                    <input id="sResvTp" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.resvDt' /><!--  예약시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sSerResvStartFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sSerResvStartToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                             </tr>
                             <tr>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                                <td>
                                    <input type="text" id="sVinNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.resvAcceptNm' /><!-- 예약접수자 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sRegUsrNm" class="form_input">
                                        <a href="javascript:userSearch();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.resvStat' /><!-- 예약접수상태 --></th>
                                <td>
                                    <input id="sResvStatCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.repairResvDt' /><!--  수리예약시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sResvFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sResvToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="numberOf_box mt10" style="display:none">
                <ul>
                    <li class="ico05"><p><spring:message code='ser.lbl.resvReady' /> <span id="resvReady"><strong>0</strong></span><spring:message code='ser.lbl.cnt' /></p></li>
                    <li><p><spring:message code='ser.lbl.keepRev' /> <span id="resvKeep"><strong>0</strong></span><spring:message code='ser.lbl.cnt' /></p></li>
                    <li class="ico03"><p><spring:message code='ser.lbl.revLate' /><!-- Late --> <span id="resvLate"><strong>0</strong></span><spring:message code='ser.lbl.cnt' /></p></li>
                    <li class="ico02"><p><spring:message code='ser.lbl.missRev' /><!-- No Show --> <span id="resvMiss"><strong>0</strong></span><spring:message code='ser.lbl.cnt' /></p></li>
                    <li class="ico04"><p><spring:message code='ser.lbl.revCancel' /><!-- 예약취소 --> <span id="resvCancel"><strong>0</strong></span><spring:message code='ser.lbl.cnt' /></p></li>
                </ul>
            </div>
            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>

            <div class="header_area">
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11519" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnResvAlram" class="btn_m btn_search"><spring:message code="ser.btn.serResvAlram" /></button><!-- 정비예약알람 -->
                    </dms:access>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- script -->
<script>

//20170508 hg
var isTablet="${isTablet}";
var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
}

var userSearchPopupWin;

//공통코드:예약상태
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvStatCdArr = dms.data.arrayToMap(resvStatCdList, function(obj){return obj.cmmCd});

//공통코드:접수구분(예약채널)
var resvTpCdList = [];
<c:forEach var="obj" items="${resvTpCdList}">
resvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvTpCdArr = dms.data.arrayToMap(resvTpCdList, function(obj){return obj.cmmCd});

//공통코드:예약접수상태
var resvReptStatCdList = [];
<c:forEach var="obj" items="${resvReptStatCdList}">
resvReptStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvReptStatCdArr = dms.data.arrayToMap(resvReptStatCdList, function(obj){return obj.cmmCd});

//서비스알람설정
var resvSerAlarmValue;
<c:forEach var="obj" items="${resvSerAlarmCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    resvSerAlarmValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

// 예약상태
resvStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(resvStatCdArr[val] != undefined)
        returnVal = resvStatCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 예약채널
resvTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(resvTpCdArr[val] != undefined)
        returnVal = resvTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 예약접수상태
resvReptStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(resvReptStatCdArr[val] != undefined)
        returnVal = resvReptStatCdArr[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#gridHeader").data("kendoExtGrid").dataSource.read();
        }
    });


    $("#btnReset").kendoButton({
        click:function(e){

            $("#form").get(0).reset();
        }
    })

    // 예약서비스알람
    $("#btnResvAlram").kendoButton({
        click:function(e) {

            var grid = $("#gridHeader").data("kendoExtGrid");
            var resvData = [];

            if(resvSerAlarmValue == "A"){
                sendAlram("M");
            } else {
                serAlramPopup = dms.window.popup({
                    windowId:"serAlramPopup"
                    , title:""
                    , width:300
                    , height:120
                    , content:{
                        url:"<c:url value='/ser/rev/reservationReceipt/selectReservationAlramPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(data){
                                if(data === "A") {
                                    sendAlram("A");
                                } else {
                                    sendAlram("M");
                                }
                            }
                        }
                    }
                });
            }
        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            var param = $.extend(
                 {"sCarRegNo"            :$("#sCarRegNo").val()}
                ,{"sResvTp"              :$("#sResvTp").val()}
                ,{"sVinNo"               :$("#sVinNo").val()}
                ,{"sResvDocNo"           :$("#sResvDocNo").val()}
                ,{"sResvStatCd"          :$("#sResvStatCd").val()}
                ,{"sResvFromDt"          :$("#sResvFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sResvToDt"            :$("#sResvToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sSerResvStartFromDt"  :$("#sSerResvStartFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sSerResvStartToDt"    :$("#sSerResvStartToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sRegUsrNm"            :$("#sRegUsrNm").val()}
                ,{"sPreFixId"            :"${preFixId}"}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptStatusCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"              :"reservationReceiptService"
                            ,"templateFile"         :"ReservationReceiptStatusList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='ser.menu.reserStatus' />.xlsx"
                            ,"sCarRegNo"            :$("#sCarRegNo").val()
                            ,"sResvTp"              :$("#sResvTp").data("kendoExtDropDownList").value()
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sResvDocNo"           :$("#sResvDocNo").val()
                            ,"sResvStatCd"          :$("#sResvStatCd").data("kendoExtDropDownList").value()
                            ,"sResvFromDt"          :$("#sResvFromDt").val()
                            ,"sResvToDt"            :$("#sResvToDt").val()
                            ,"sSerResvStartFromDt"  :$("#sSerResvStartFromDt").val()
                            ,"sSerResvStartToDt"    :$("#sSerResvStartToDt").val()
                            ,"sRegUsrNm"            :$("#sRegUsrNm").val()
                            ,"sPreFixId"            :"${preFixId}"
                            ,"sListType"            :"01"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    sendAlram = function(alramType){
        var grid = $("#gridHeader").data("kendoExtGrid");
        var resvData = [];

        grid.select().each(function(i,row){
            grid.dataItem(row).resvSerAlramCd = alramType;
            resvData.push(grid.dataItem(row));
        });

        $.ajax({
            url:"<c:url value='/ser/rev/reservationReceipt/resvRegAlramCall.do' />"
            ,data:JSON.stringify(resvData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                dms.notification.success("<spring:message code='global.info.success'/>");
                $("#gridHeader").data("kendoExtGrid").dataSource.read();
            }
        });
    };

    $(document).on("click", ".linkResvDocNo", function(e){
        var grid = $("#gridHeader").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.reserCreate' />", "<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do'/>?sResvDocNo="+selectedVal.resvDocNo, "VIEW-D-10332"); // RO Main
    });

    //예약상태
    $("#sResvStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(resvStatCdList)//resvStatCdList //khs 최재훈대리님이 시켰습니다.
        ,optionLabel:" "
        //20200630 tjx 维修预约状态的查询条件选择了“等待受理”，预约服务时间的查询条件就清空  start
       	,change:function(e){
           if (this.value() == "S"){
               $("#sSerResvStartFromDt").val('');
               $("#sSerResvStartToDt").val('');
           }else{
        	   $("#sSerResvStartFromDt").val('${sResvFromDt}');
        	   $("#sSerResvStartToDt").val('${sResvToDt}');
           }
        }
  		//20200630 tjx 维修预约状态的查询条件选择了“等待受理”，预约服务时间的查询条件就清空  end
    });
    //예약채널
    $("#sResvTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(resvTpCdList)//resvTpCdList //khs 최재훈대리님이 시켰습니다.
        ,optionLabel:" "
    });

    // 예약일자
    $("#sResvFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예약일자
    $("#sResvToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예약일자
    $("#sSerResvStartFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sResvFromDt}"
    });

    // 예약일자
    $("#sSerResvStartToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sResvToDt}"
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000087"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptsList.do' />"
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

                        params["sDlrCd"]       = $("sDlrCd").val();
                        params["sListType"]    = "01";
                        params["sCarRegNo"]    = $("#sCarRegNo").val();
                        params["sResvTp"]      = $("#sResvTp").val();
                        params["sVinNo"]       = $("#sVinNo").val();
                        params["sResvDocNo"]   = $("#sResvDocNo").val();
                        params["sResvStatCd"]  = $("#sResvStatCd").data("kendoExtDropDownList").value();
                        params["sResvFromDt"]  = $("#sResvFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sResvToDt"]    = $("#sResvToDt").data("kendoExtMaskedDatePicker").value();
                        params["sSerResvStartFromDt"] = ( $("#sResvStatCd").val()== "S" ) ? "" : $("#sSerResvStartFromDt").data("kendoExtMaskedDatePicker").value();//tjx 20200715
                        params["sSerResvStartToDt"]   = ( $("#sResvStatCd").val()== "S" ) ? "" : $("#sSerResvStartToDt").data("kendoExtMaskedDatePicker").value();//tjx 20200715
                        params["sRegUsrNm"]    = $("#sRegUsrNm").val();
                        params["sPreFixId"]    = "${preFixId}";

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,resvDocNo:{type:"string", editable:false}
                        ,regDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,hopeResvDt:{type:"date"}
                        ,serResvStartDt:{type:"date"}
                        ,serResvEndDt:{type:"date"}
                        ,cancResvDt:{type:"date"}
                        ,confirmDt:{type:"date"}
                        ,resvPrintDt:{type:"date"}
                        ,resvDt:{type:"date"}
                        ,resvAlramDt:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                        ,hopeResvDtFormat:{type:"date"}
                        ,serResvStartDtFormat:{type:"date"}
                        ,serResvEndDtFormat:{type:"date"}
                        ,cancResvDtFormat:{type:"date"}
                        ,confirmDtFormat:{type:"date"}
                        ,resvPrintDtFormat:{type:"date"}
                        ,resvDtFormat:{type:"date"}
                        ,resvAlramDtFormat:{type:"date"}
                        ,regDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            elem.hopeResvDtFormat = kendo.parseDate(elem.hopeResvDt, "<dms:configValue code='dateFormat' />");
                            elem.serResvStartDtFormat = kendo.parseDate(elem.serResvStartDt, "<dms:configValue code='dateFormat' />");
                            elem.serResvEndDtFormat = kendo.parseDate(elem.serResvEndDt, "<dms:configValue code='dateFormat' />");
                            elem.cancResvDtFormat = kendo.parseDate(elem.cancResvDt, "<dms:configValue code='dateFormat' />");
                            elem.confirmDtFormat = kendo.parseDate(elem.confirmDt, "<dms:configValue code='dateFormat' />");
                            elem.resvPrintDtFormat = kendo.parseDate(elem.resvPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.resvDtFormat = kendo.parseDate(elem.resvDt, "<dms:configValue code='dateFormat' />");
                            elem.resvAlramDtFormat = kendo.parseDate(elem.resvAlramDt, "<dms:configValue code='dateFormat' />");
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:450
        ,editable:false
        ,autoBind:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,selectable:_selectable
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem.resvStatCd == "C" || dataItem.resvStatCd == "F"){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled",true);
                }
            });
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                                // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}        //VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}                           //소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:100}                               //방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}           //차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}               //모델명칭
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", width:100      //누적주행거리
                ,attributes :{"class":"ar"}
                ,format:"{0:n0}"}
            ,{field:"resvStatCdNm", title:"<spring:message code='ser.lbl.resvStat' />", width:100}                         //예약상태
            ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", width:120                            //예약번호
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkResvDocNo'>"+dataItem.resvDocNo+"</a>";
                    return spanObj;
                }
            }
            ,{field:"resvTpNm", title:"<spring:message code='ser.lbl.resvChannel' />", width:100}                          //예약채널
            ,{field:"resvDtFormat", title:"<spring:message code='ser.lbl.repairResvDt' />", width:130, attributes:{"class":"ac"}        //수리예약시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.resvDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.resvAcceptNm' />", width:100}                //예약접수자
            ,{field:"resvPrintDtFormat", title:"<spring:message code='ser.lbl.resvPrintDt' />", width:130, attributes:{"class":"ac"}    //예약프린트시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.resvPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.resvUpdt' />", width:130, attributes:{"class":"ac"}         //예약변경시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.resvChgUsrNm' />", width:100}            //예약변경자
            ,{field:"cancResvDtFormat", title:"<spring:message code='ser.lbl.resvCancelDt' />", width:130, attributes:{"class":"ac"} //예약취소시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.cancResvDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"cancUsrNm", title:"<spring:message code='ser.lbl.resvCancelUsrId' />",  width:100}        //예약취소자
            ,{field:"cancReasonCont", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100}      //취소원인
            ,{field:"hopeResvDtFormat", title:"<spring:message code='ser.lbl.hopeResvDt' />", width:130, attributes:{"class":"ac"}  //예약희망일자
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.hopeResvDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"serResvStartDtFormat", title:"<spring:message code='ser.lbl.resvDt' />", width:130, attributes:{"class":"ac"}   //예약시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.serResvStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"confirmDtFormat", title:"<spring:message code='ser.lbl.resvConfirmHm' />", width:130, attributes:{"class":"ac"} //예약완료시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.confirmDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"confirmUsrNm", title:"<spring:message code='ser.lbl.resvConfirmUsrNm' />", width:100}      //예약완료자
            ,{field:"resvRemark", title:"<spring:message code='ser.lbl.resvRemark' />", width:100}                              //예약비고
            ,{field:"saNm", title:"<spring:message code='ser.lbl.saAppoint' />", width:100}                                     //SA
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecAppoint' />", width:100, attributes:{"class":"al"} }       //테크니션
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.preLbrSubAmt' />", width:100                 //예정공임비
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"}
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:100                 //예정부품비
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"}
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.preEtcSubAmt' />", width:100                 //예정기타비
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"}
            ,{field:"sumAmt", title:"<spring:message code='ser.lbl.preTotAmt' />", width:100                    //예정총금액
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"}
            ,{field:"resvAlramDtFormat", title:"<spring:message code='ser.lbl.resvAlramDt' />", width:130                             //수리예약알람시간
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.resvAlramDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"resvAlramUsrNm", title:"<spring:message code='ser.lbl.resvAlramUsr' />", width:100}        //수리예약알람자
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}        //수리예약시간
            	,attributes:{"class":"ac tooltip-enabled"}
            	,template:"#= dms.string.strNvl(kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
        }
            ]
    });

    if(isTablet == true || isTablet == "true"){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#reservationStatColGroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[2]).css("width","7%");

            $("#gridHeader").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }

});

userSearch = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0) {
                        $("#sRegUsrNm").val(data[0].usrNm)
                    }
                }
            }
        }
    });
}

</script>
<!-- //script -->


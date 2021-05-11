<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div id="resizableContainer">
    <div class="content">
    <!-- 구원서비스조회 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12994" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13087" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnExcelExport" class="btn_m"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11535" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="form">
                <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup id="reservationSearchColGroup">
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
                                <th scope="row"><spring:message code='ser.lbl.partReserveNo' /><!-- 부품예약번호 --></th>
                                <td>
                                    <input type="text" id="sParResvDocNo" class="form_input">
                                    <input type="hidden" id="parResvDocNo">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.partResvTp' /><!-- 부품예약유형 --></th>
                                <td>
                                    <input id="parResvTp" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.preResvPartHm' /><!-- 부품예약일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sParResvStartDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sParResvEndDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                                <td>
                                    <input type="text" id="sVinNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.partResveNm' /><!-- 부품예약자 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sRegUsrNm" class="form_input">
                                        <a href="javascript:userSearch();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.partResvStat' /><!-- 부품예약상태 --></th>
                                <td>
                                    <input id="sParResvStatCd" type="text" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.itemNm' /><!-- 부품명 --></th>
                                <td>
                                    <!-- <input type="text" id="sCarOwnerNm" class="form_input"> -->
                                    <input type="text" id="sPartNm" class="form_input">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="table_grid mt10">
                <div id="hGrid" class="resizable_grid"></div>
            </div>
            <div class="header_area">
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13086" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="partResvComp" class="btn_m"><spring:message code="ser.btn.partResvComplete" /><!-- 부품예약완료 --></button>
                    </dms:access>
                </div>
            </div>
        </section>
        <input type="hidden" id="rescDocNo" name="rescDocNo" />
        <input type="hidden" id="vinNo" name="vinNo" />
    </div>
</div>
<!-- script -->
<script>
var userSearchPopupWin;

//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

//공통코드:예약부품상태
var partResvStatCdList = [];
<c:forEach var="obj" items="${partResvStatCdList}">
partResvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partResvStatCdArr = dms.data.arrayToMap(partResvStatCdList, function(obj){return obj.cmmCd});

//공통코드:RO유형
var partResvTpCdList = [];
<c:forEach var="obj" items="${partResvTpCdList}">
partResvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partResvTpCdArr = dms.data.arrayToMap(partResvTpCdList, function(obj){return obj.cmmCd});

//결제유형
paymTpCdGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(paymTpCdArr[value] != undefined)
            returnVal = paymTpCdArr[value].cmmCdNm;
    }

    return returnVal;
};

//캠페인유형
crTpCdGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(crTpMap[value] != undefined)
            returnVal = crTpMap[value].cmmCdNm;
    }
    return returnVal;
};

//RO유형
roTpCdGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(roTpCdArr[value] != undefined)
            returnVal = roTpCdArr[value].cmmCdNm;
    }
    return returnVal;
};

//부품예상 유형
partResvTpGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(partResvTpCdArr[value] != undefined)
            returnVal = partResvTpCdArr[value].cmmCdNm;
    }
    return returnVal;
};


//예약부품상태
partResvStatCdGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(partResvStatCdArr[value] != undefined)
            returnVal = partResvStatCdArr[value].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            $("#hGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    $("#btnInit").kendoButton({
        click:function(e){
            $("#form").get(0).reset();
            $("#sParResvStartDt").data("kendoExtMaskedDatePicker").value("${sParResvStartDt}");
            $("#sParResvEndDt").data("kendoExtMaskedDatePicker").value("${sParResvEndDt}");
            $("#hGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({
        click:function(e){

            var param = $.extend(
                 {"sCarRegNo"       : $("#sCarRegNo").val()}
                ,{"sParResvStatCd"  : $("#sParResvStatCd").val()}
                ,{"sPartNm"         : $("#sPartNm").val()}
                ,{"sRegUsrNm"       : $("#sRegUsrNm").val()}
                ,{"sVinNo"          : $("#sVinNo").val()}
                ,{"sParResvDocNo"   : $("#sParResvDocNo").val()}
                ,{"sParResvTp"      : $("#parResvTp").val()}
                ,{"sParResvStartDt" : $("#sParResvStartDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sParResvEndDt"   : $("#sParResvEndDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sPreFixId"       : "${preFixId}"}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/rev/partReservation/selectPartReservationListCnt.do' />"
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
                            "beanName"         :"partReservationService"
                            ,"templateFile"    :"PartReservationStatusList_Tpl.xlsx"
                            ,"fileName"        :"<spring:message code='ser.menu.parRevList' />.xlsx"
                            ,"sCarRegNo"       : $("#sCarRegNo").val()
                            ,"sParResvStatCd"  : $("#sParResvStatCd").data("kendoExtDropDownList").value()
                            ,"sPartNm"         : $("#sPartNm").val()
                            ,"sRegUsrNm"       : $("#sRegUsrNm").val()
                            ,"sVinNo"          : $("#sVinNo").val()
                            ,"sParResvDocNo"   : $("#sParResvDocNo").val()
                            ,"sParResvTp"      : $("#parResvTp").data("kendoExtDropDownList").value()
                            ,"sParResvStartDt" : $("#sParResvStartDt").val()
                            ,"sParResvEndDt"   : $("#sParResvEndDt").val()
                            ,"sPreFixId"       : "${preFixId}"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    // 부품예약완료
    $("#partResvComp").kendoButton({
        click:function(e) {
            var grid = $("#hGrid").data("kendoExtGrid");
            var rows = grid.select();
            if(rows.length < 1){
                //unselected message.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            var dataList = null;
            var rowData = [];
            var gridData = grid.dataItem(grid.select());
            var dataList = {
                    "partReservationVO":gridData
                 };
            $.ajax({
                url:"<c:url value='/ser/rev/partReservation/completePartReservation.do' />"
                ,data:JSON.stringify(gridData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    //var data = {"parResvDocNo":result};
                    //detailSet(data, false);
                    $("#hGrid").data("kendoExtGrid").dataSource.read();
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
        ,enable:false
    });

    //예약부품상태
    $("#sParResvStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partResvStatCdList
        ,optionLabel:" "
        ,index:0
    });

    $("#parResvTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partResvTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 부품 예약 일자
    $("#sParResvStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sParResvStartDt}"
    });

    // 부품 예약  일자
    $("#sParResvEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sParResvEndDt}"
    });


    $(document).on("click", ".linkPreDocNo", function(e){

        var grid = $("#hGrid").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.partResvCreate' />", "<c:url value='/ser/rev/partReservation/selectPartReservationMain.do'/>?parResvDocNo="+selectedVal.parResvDocNo, "VIEW-D-10498"); // 부품예약 Main
    });

    $("#hGrid").kendoExtGrid({
        gridId:"G-SER-1011-000086"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rev/partReservation/selectPartReservations.do' />"
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

                        params["sCarRegNo"]       = $("#sCarRegNo").val();
                        params["sParResvStatCd"]  = $("#sParResvStatCd").val();
                        params["sPartNm"]         = $("#sPartNm").val();
                        params["sRegUsrNm"]       = $("#sRegUsrNm").val();
                        params["sVinNo"]          = $("#sVinNo").val();
                        params["sParResvDocNo"]   = $("#sParResvDocNo").val();
                        params["sParResvTp"]      = $("#parResvTp").val();
                        params["sParResvStartDt"] = $("#sParResvStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sParResvEndDt"]   = $("#sParResvEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sPreFixId"]       = "${preFixId}";

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
                        ,regDt:{type:"date", editable:false}
                        ,updtDt:{type:"date", editable:false}
                        ,parResvPrintDt:{type:"date", editable:false}
                        ,cancParResvDt:{type:"date", editable:false}
                        ,confirmParDt:{type:"date", editable:false}
                        ,parResvAlarmDt:{type:"date", editable:false}
                        ,regDtFormat:{type:"date", editable:false}
                        ,updtDtFormat:{type:"date", editable:false}
                        ,parResvPrintDtFormat:{type:"date", editable:false}
                        ,cancParResvDtFormat:{type:"date", editable:false}
                        ,confirmParDtFormat:{type:"date", editable:false}
                        ,parResvAlarmDtFormat:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            elem.parResvPrintDtFormat = kendo.parseDate(elem.parResvPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.cancParResvDtFormat = kendo.parseDate(elem.cancParResvDt, "<dms:configValue code='dateFormat' />");
                            elem.confirmParDtFormat = kendo.parseDate(elem.confirmParDt, "<dms:configValue code='dateFormat' />");
                            elem.parResvAlarmDtFormat = kendo.parseDate(elem.parResvAlarmDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:350
        ,autoBind:true
        ,selectable:"row"
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,editable:false
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#parResvDocNo").val(dataItem.parResvDocNo);

            if(dataItem.parResvStatCd == "R"){
                $("#partResvComp").data("kendoButton").enable(true);
            }else{
                $("#partResvComp").data("kendoButton").enable(false);
            }
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                       // VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}               // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}                   // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}" ,hidden:true }   //현주행거리
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"} //누적주행거리
            ,{field:"parResvStatNm", title:"<spring:message code='ser.lbl.partResvStat' />", width:100}                   //부품예약상태
            ,{field:"parResvDocNo", title:"<spring:message code='ser.lbl.partReserveNo' />", width:120               //부품예약번호
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkPreDocNo'>"+dataItem.parResvDocNo+"</a>";
                    return spanObj;
                }
            }
            ,{field:"parResvTpNm", title:"<spring:message code='ser.lbl.partResvTp' />", width:100 ,attributes :{"class":"ac"}} //부품예약유형
            ,{field:"regDtFormat", title:"<spring:message code='ser.lbl.preResvPartHm' />", width:150, attributes:{"class":"ac"}  //부품예약시간
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.partResveNm' />", width:100 }                    //부품예약자
            ,{field:"parResvPrintDtFormat", title:"<spring:message code='ser.lbl.parResvPrintTime' />", width:150, attributes:{"class":"ac"} // 부품예약프린트시간
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.parResvPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.parResvChgDt' />", width:150, attributes:{"class":"ac"} // 부품예약변경시간
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.parRecvUpdtUsrNm' />", width:100 }                             //부품예약변경자
            ,{field:"cancParResvDtFormat", title:"<spring:message code='ser.lbl.parResvCancTime' />", width:150, attributes:{"class":"ac"} //부품예약취소시간
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.cancParResvDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"cancParUsrNm", title:"<spring:message code='ser.lbl.parResvCancUsrNm' />", width:100 }                            //부품예약취소자
            ,{field:"cancReasonNm", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:150}                                 //취소원인
            ,{field:"confirmParDtFormat", title:"<spring:message code='ser.lbl.parResvConfirmTime' />", width:150, attributes:{"class":"ac"} //부품예약완료시간
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.confirmParDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"confirmParUsrNm", title:"<spring:message code='ser.lbl.parResvConfirmUsrNm' />", width:100 }                            //부품예약완료자
            ,{field:"itemCdQty", title:"<spring:message code='ser.lbl.parResvItem' />", width:100, attributes:{"class":"ar"} ,format:"{0:n0}"}//부품예약품목
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"} //예정부품비
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.preEtcSubAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"} //에정기타비
            ,{field:"sumAmt", title:"<spring:message code='ser.lbl.prePartTotAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}//예정부품총금액
            ,{field:"preAmt", title:"<spring:message code='ser.lbl.preAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}       //부품선수금
            ,{field:"parResvRemark", title:"<spring:message code='ser.lbl.partResvRemark' />", width:100}                                     // 부품예약비고
            ,{field:"reqQty", title:"<spring:message code='ser.lbl.dsctScheduleQty' />", width:100, attributes:{"class":"ar"} ,format:"{0:n0}" }//부품예약수량
            ,{field:"parResvAlarmDtFormat", title:"<spring:message code='ser.lbl.parResvAramTime' />", width:150, attributes:{"class":"ac"}  //부품예약알람시간
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.parResvAlarmDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }
            ,{field:"parResvAlarmId", title:"<spring:message code='ser.lbl.parAlramUsrNm' />", width:100}                  //부품예약알람자
            ,{field:"parReadyStatCdNm", title:"<spring:message code='serl.lbl.parReadyStatCd' />", width:80                                   // 부품준비상태
                ,attributes:{"class":"ac"}
                ,hidden:true
            }
         ]
    });

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#reservationSearchColGroup  col");
            $(colEmt[0]).css("width","6%");
            $(colEmt[1]).css("width","15%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[3]).css("width","15%");
            $(colEmt[4]).css("width","8%");
            $(colEmt[5]).css("width","15%");
            $(colEmt[6]).css("width","9%");;
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

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


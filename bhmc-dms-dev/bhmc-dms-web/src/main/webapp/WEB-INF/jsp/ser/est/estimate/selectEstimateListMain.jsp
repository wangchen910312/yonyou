<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div id="resizableContainer">
    <div class="content">
    <!-- 보증현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12959" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11567" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11568" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="searchForm">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
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
                                <input type="text" id="sCarRegNo" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.estDocNo' /><!-- 견적번호 --></th>
                            <td>
                                <input type="text" id="sEstDocNo" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                            <td>
                                <input id="sRoTp" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roDt' /><!-- RO일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRoFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRoToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- VIN NO --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.estWrtrNm' /></th> <!-- 정비견적자 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="sRegUsrNm" class="form_input">
                                    <a href="javascript:userSearch();"></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.estimateStatCd' /><!-- 견적상태 --></th>
                            <td>
                                <input type="text" id="sEstStatCd" class="form_comboBox"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.estDt' /><!-- 견적등록일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sEstFromDt" value="${sFromDt}" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sEstToDt" value="${sToDt}" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>

        <!-- 일반 -->
        <div id="tabstrip2" class="tab_area" style="display:none;">
            <!-- 탭메뉴 -->
            <ul>
                <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                <li class="k-state-active"><spring:message code="ser.lbl.rpipProject" /><!-- 정비항목 --></li>
                <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 고객요청사항 & 고장설명 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp" />
            <!-- //고객요청사항 & 고장설명 -->

            <!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrList.jsp" />
            <!-- //정비항목 -->

            <!-- 부품 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
            <!-- //부품 -->

            <!-- 기타 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->
        </div>
        <!-- //일반 -->

        <input type="hidden" id="estDocNo" name="estDocNo" data-json-obj="true">

    </div>
</div>
<!-- script -->
<script>

var userSearchPopupWin;

var isTablet="${isTablet}";
if(isTablet == "true"){
    _width=950;//tablet
    _height=600;//tablet
}

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
  crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

/** 캠페인 유형 **/
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
  roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});

//견적상태 Array
var estStatCdList = [];
<c:forEach var="obj" items="${estStatCdList}">
estStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

// 상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//캠페인유형
crTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(crTpMap[val] != undefined)
        returnVal = crTpMap[val].cmmCdNm;
    }
    return returnVal;
};

getLtsModelNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(ltsMap[val] != undefined)
        returnVal = ltsMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    $("#tabstrip, #tabstrip2").kendoExtTabStrip({
        animation:false
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
            //serviceJs.commonListInit();     // service 공통 JS
        }
    });

    /** 엑셀 버튼**/
    $("#btnExcelExport").kendoButton({

        click:function(e){

            var param = $.extend(
                  {"sEstFromDt"      : $("#sEstFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sEstToDt"        : $("#sEstToDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sRoFromDt"       : $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sRoToDt"         : $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sEstStatCd"      : $("#sEstStatCd").val()}
                 ,{"sCarRegNo"       : $("#sCarRegNo").val()}
                 ,{"sEstDocNo"       : $("#sEstDocNo").val()}
                 ,{"sRoTp"           : $("#sRoTp").val()}
                 ,{"sVinNo"          : $("#sVinNo").val()}
                 ,{"sRegUsrNm"       : $("#sRegUsrNm").val()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/est/estimate/selectEstimateListCnt.do' />"
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
                            "beanName"         : "estimateService"
                            ,"templateFile"    : "EstimateList_Tpl.xlsx"
                            ,"fileName"        : "<spring:message code='ser.menu.estList' />.xlsx"
                            ,"sEstFromDt"      : $("#sEstFromDt").val()
                            ,"sEstToDt"        : $("#sEstToDt").val()
                            ,"sRoFromDt"       : $("#sRoFromDt").val()
                            ,"sRoToDt"         : $("#sRoToDt").val()
                            ,"sEstStatCd"      : $("#sEstStatCd").data("kendoExtDropDownList").value()
                            ,"sCarRegNo"       : $("#sCarRegNo").val()
                            ,"sEstDocNo"       : $("#sEstDocNo").val()
                            ,"sRoTp"           : $("#sRoTp").data("kendoExtDropDownList").value()
                            ,"sVinNo"          : $("#sVinNo").val()
                            ,"sRegUsrNm"       : $("#sRegUsrNm").val()
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    // 견적시작일
    $("#sEstFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    // 견적종료일
    $("#sEstToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 견적 상태
    $("#sEstStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:estStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:" "
        ,index:0
    });

    $(document).on("click", ".linkEstNo", function(e){

        var grid = $("#gridHeader").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);

        var url = "<c:url value='/ser/est/estimate/selectEstimateManageMain.do' />?estDocNo="+selectedVal.estDocNo+"&vinNo="+selectedVal.vinNo+"&ltsModelCd="+selectedVal.ltsModelCd;
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.estCreate' />", url, "VIEW-D-10335"); // RO Main
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000073"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/est/estimate/selectEstimateListMains.do' />"
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

                        params["sEstFromDt"] = $("#sEstFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sEstToDt"]   = $("#sEstToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoFromDt"]  = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"]    = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sEstStatCd"] = $("#sEstStatCd").val();
                        params["sRegUsrNm"]  = $("#sRegUsrNm").val();
                        params["sVinNo"]     = $("#sVinNo").val();
                        params["sRoTp"]      = $("#sRoTp").val();
                        params["sCarRegNo"]  = $("#sCarRegNo").val();
                        params["sEstDocNo"]  = $("#sEstDocNo").val();
                        params["sPreFixId"]  = "${preFixId}";

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
                        ,estDocNo:{type:"string", editable:false}
                        ,estDt:{type:"date"}
                        ,estPrintDt:{type:"date"}
                        ,estCancDt:{type:"date"}
                        ,regDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,estDtFormat:{type:"date"}
                        ,estPrintDtFormat:{type:"date"}
                        ,estCancDtFormat:{type:"date"}
                        ,roDtFormat:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.estDtFormat = kendo.parseDate(elem.estDt, "<dms:configValue code='dateFormat' />");
                            elem.estPrintDtFormat = kendo.parseDate(elem.estPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.estCancDtFormat = kendo.parseDate(elem.estCancDt, "<dms:configValue code='dateFormat' />");
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:186
        ,editable:false
        ,selectable:"row"
        ,autoBind:true
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());
                var estDocNo = selectedVal.estDocNo;
                $("#estDocNo").val(estDocNo);

                lbrInfo(estDocNo, "ET");
                partInfo(estDocNo, "ET");
                trobleDescInfo(estDocNo, "ET");  // 고객요구사항및 고장설명
                etcIssueSet(estDocNo, "ET");     // 기타사항

            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}       // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}          // VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}  // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}       // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}  // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", width:100}        // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}      // 현주행거리
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"} // 누적주행거리
            ,{field:"estStatNm", title:"<spring:message code='ser.lbl.estimateStatCd' />", width:100, attributes:{"class":"ac"}}   // 견적상태
            ,{field:"estDocNo", title:"<spring:message code='ser.lbl.estDocNo' />", width:110
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkEstNo'>"+dataItem.estDocNo+"</a>";
                    return spanObj;
                }
             }  // 견적번호
            ,{field:"estDtFormat", title:"<spring:message code='ser.lbl.estDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
            , template:"#= dms.string.strNvl(kendo.toString(data.estDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // 견적등록일자
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.estWrtrNm' />", width:100}   // 정비견적자
            ,{field:"estPrintDtFormat", title:"<spring:message code='ser.lbl.estPrintDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
            , template:"#= dms.string.strNvl(kendo.toString(data.estPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // 정비견적프린트시간
            ,{field:"estCancDtFormat", title:"<spring:message code='ser.lbl.estCancDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
            , template:"#= dms.string.strNvl(kendo.toString(data.estCancDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // 정비견적취소시간
            ,{field:"estCancNm", title:"<spring:message code='ser.lbl.estCancId' />", width:100}            // 정비견적취소자
            ,{field:"estCancReasonNm", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100}   // 취소원인
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.estUpdtDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
            , template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            } // 정비견적수정시간
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.estUpdtNm' />", width:100}            // 정비견적변경자
            ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", width:100, attributes:{"class":"ac"}}   // RO상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110}                 // RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100, attributes:{"class":"ac"}}     // RO유형
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }   // RO일자
            ,{field:"roUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}    // 정비위탁자
            ,{field:"estRemark", title:"<spring:message code='ser.lbl.estRemark' />", width:100, attributes:{"class":"ar"}}                     //정비정산비고
            ,{field:"lbrCalcSumAmt", title:"<spring:message code='ser.lbl.lbrEstAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}     //공임견적금액
            ,{field:"parCalcSumAmt", title:"<spring:message code='ser.lbl.parEstAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}     //부품정산금액
            ,{field:"etcCalcAmt", title:"<spring:message code='ser.lbl.etcEstAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}         //기타견적금액
            ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.lbrCdDcAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}         //공임할인금액
            ,{field:"parDcAmt", title:"<spring:message code='ser.lbl.parDcAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}           //부품할인금액
            ,{field:"pointTotAmt", title:"<spring:message code='ser.lbl.dlrPointUseAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}     //포인트사용금액
            ,{field:"bmPointTotAmt", title:"<spring:message code='ser.lbl.bmPointUseAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"} //BM포인트사용금액
            ,{field:"etcTotAmt", title:"<spring:message code='ser.lbl.etcSaleAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}        //기타할인금액
            ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.finalEstAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}       //견적금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.estInterSettAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}  //견적절사금액
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.estZeroAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}   //견적제로금액
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}          //수납금액 (수납)
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.realDrivDis' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}       // 현주행거리
        ]
    });
    $(".btn_right_absolute").hide();
    $(".form_search a").hide();

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#searchForm  col");
            $(colEmt[0]).css("width","6%");
            $(colEmt[1]).css("width","14%");
            $(colEmt[2]).css("width","9%");
            $(colEmt[3]).css("width","15%");
            $(colEmt[4]).css("width","9%");
            $(colEmt[5]).css("width","15%");
            $(colEmt[6]).css("width","9%");
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


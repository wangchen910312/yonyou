<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-13199" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13197" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-13198" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="searchForm">
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                                <td>
                                    <input type="text" id="sVinNo" maxlength="17" class="form_input upper" data-name="<spring:message code="ser.lbl.vinNo" />" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.vsitr" /></th><!-- 방문자 -->
                                <td>
                                    <input type="text" id="sDriverNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호  -->
                                <td>
                                    <input type="text" id="sRoDocNo" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- RO일자 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input required type="text" id="sRoFromDt" value="${sRoFromDt}" class="form_datepicker ac"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input required type="text" id="sRoToDt" value="${sRoToDt}" class="form_datepicker ac"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /></th><!-- 차량번호 -->
                                <td>
                                    <input type="text" id="sCarRegNo" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.etcCdTp" /></th><!-- 기타사항코드 -->
                                <td>
                                    <input type="text" id="sEtcTpCd" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!-- RO유형-->
                                <td>
                                    <input type="text" id="sRoTp" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roStatus' /></th><!-- RO상태 -->
                                <td>
                                    <input type="text" id="sRoStatCd" class="form_comboBox" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </section>
        <div class="table_grid mt5">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </div>
</div>
<script type="text/javascript">


var sDlrCd = "${dlrCd}";

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});

//공통코드:RO상태
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
<c:if test="${obj.cmmCd ne '07'}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd;});



$(document).ready(function(){

    // RO유형
    setRoTpCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(roTpCdMap[val] != undefined)
                returnVal = roTpCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    // RO상세
    setRoStatCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(roStatCdMap[val] != undefined)
                returnVal = roStatCdMap[val].cmmCdNm;
        }
        return returnVal;
    };


    // RO상태
    $("#sRoStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatCdList
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

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoFromDt}"
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sRoToDt}"
    });



    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }

            var param = $.extend(
                  {"sVinNo"               :$("#sVinNo").val()}
                 ,{"sDriverNm"            :$("#sDriverNm").val()}
                 ,{"sRoDocNo"             :$("#sRoDocNo").val()}
                 ,{"sRoFromDt"            :$("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sRoToDt"              :$("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sCarRegNo"            :$("#sCarRegNo").val()}
                 ,{"sEtcTpCd"             :$("#sEtcTpCd").val()}
                 ,{"sRoTp"                :$("#sRoTp").val()}
                 ,{"sRoStatCd"            :$("#sRoStatCd").val()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectSerivceEtcHistoryCnt.do' />"
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
                            "beanName"              :"repairOrderService"
                            ,"templateFile"         :"RepairOrderEtcHistList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='ser.menu.roEtcHist' />.xlsx"
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sDriverNm"            :$("#sDriverNm").val()
                            ,"sRoDocNo"             :$("#sRoDocNo").val()
                            ,"sRoFromDt"            :$("#sRoFromDt").val()
                            ,"sRoToDt"              :$("#sRoToDt").val()
                            ,"sCarRegNo"            :$("#sCarRegNo").val()
                            ,"sEtcTpCd"             :$("#sEtcTpCd").val()
                            ,"sRoTp"                :$("#sRoTp").data("kendoExtDropDownList").value()
                            ,"sRoStatCd"            :$("#sRoStatCd").data("kendoExtDropDownList").value()
                            ,"sListType"            :"EH"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });


    $("#grid").kendoExtGrid({
        gridId:"G-SER-0717-000002"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersEtcHistory.do' />"
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

                        params["sVinNo"]    = $("#sVinNo").val();
                        params["sDriverNm"] = $("#sDriverNm").val();
                        params["sRoDocNo"]  = $("#sRoDocNo").val();
                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"]   = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        params["sEtcTpCd"]  = $("#sEtcTpCd").val();
                        params["sRoTp"]     = $("#sRoTp").val();
                        params["sRoStatCd"] = $("#sRoStatCd").val();

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
                        rnum:{type:"number"}
                        ,carRegNo:{type:"string"}
                        ,vinNo:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelNm:{type:"string"}
                        ,runDistVal:{type:"number"}
                        ,lastRunDistVal:{type:"number"}
                        ,roStatNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,roTpNm:{type:"string"}
                        ,roDt:{type:"date"}
                        ,regUsrNm:{type:"string"}
                        ,roPrintDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,updtUsrNm:{type:"string"}
                        ,etcTpCd:{type:"string"}
                        ,etcTpNm:{type:"string"}
                        ,etcReqPrc:{type:"number"}

                        ,roDtFormat:{type:"date"}
                        ,roPrintDtFormat:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.roPrintDtFormat = kendo.parseDate(elem.roPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:350
        ,pageable:true
        ,selectable:"row"
        ,autoBind:true
        ,editable:false
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                     // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                       // VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}               // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:200}                   // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            } // 주행거리
            ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal'/>", width:100
                ,attributes :{"class":"ar"}
                ,format:"{0:n0}"
            } // 인도주행거리
            ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", width:100, attributes:{"class":"ac"}} // RO상태
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}                   // RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100, attributes:{"class":"ac"}}
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }         // RO확인시간
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}                 // 위탁인
            ,{field:"roPrintDtFormat", title:"<spring:message code='ser.lbl.roPrintDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }         // RO프린트시간
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.roUpdtDt' />", width:125
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }         // RO변경시간
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.roUpdtUsrNm' />", width:100}             // 변경자
            ,{field:"etcTpCd", title:"<spring:message code='ser.lbl.etcCdTp' />", width:100}                   // 기타사항코드
            ,{field:"etcTpNm", title:"<spring:message code='ser.lbl.etcCdNm' />", width:150}                   // 기타사항명
            ,{field:"etcReqPrc", title:"<spring:message code='ser.lbl.etcAmt' />", width:120
                ,attributes :{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0,
                        max:100000000,
                        decimals:0,
                        spinner:false
                    });
                }
            } // 기타사항금액
        ]
    });


    $(".upper").bind("keyup", function(){
        $(this).val($(this).val().toUpperCase());
    });

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#searchForm  col");
            $(colEmt[0]).css("width","8%");
            $(colEmt[1]).css("width","14%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[3]).css("width","14%");
            $(colEmt[4]).css("width","8%");
            $(colEmt[5]).css("width","14%");
            $(colEmt[6]).css("width","8%");
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

});



</script>


<style>
.uppercase
 {
  text-transform:uppercase;
 }
 </style>
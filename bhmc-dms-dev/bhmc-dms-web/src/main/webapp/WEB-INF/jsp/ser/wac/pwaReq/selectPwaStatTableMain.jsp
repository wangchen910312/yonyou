<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

    <div id="resizableContainer">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.menu.pwaStatTable" /></h1>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12012" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchPwaC"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12011" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchPwaQ"><spring:message code="ser.btn.reqStatus" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12010" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchPwaA"><spring:message code="ser.btn.appStatus" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12009" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchPwaR"><spring:message code="ser.btn.returnStatus" /></button>
                    </dms:access>
                    <!--<button type="button" class="btn_m btn_print" id="btnPrintPwa" ><spring:message code="global.btn.print" /></button>  인쇄 -->
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearchPwaC">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carRegDt" /><!-- 등록일자 --></th>
                            <td colspan="2">
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="hidden" id="dlrCd" name="dlrCd">
                                        <input id="sPwaFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sPwaToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.pwaDocNo' /></th>
                            <td colspan="2">
                                <input id="dlrCd" name="dlrCd" type="hidden">
                                <input id="sPwaStatCd" name="sPwaStatCd" value="C" type="hidden">
                                <input id="sPwaDocNo" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input" style="text-transform:uppercase">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- PWA 통계표 그리드 -->
            <div class="table_grid">
                <div id="pwaGrid" class="resizable_grid"></div>
            </div>
            <!-- //PWA 통계표 그리드 -->

        </section>
    </div>



<script type="text/javascript">

$(document).ready(function() {

  //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 일자(FROM)
    $("#sPwaFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPwaFromDt}"
    });

    // 일자(TO)
    $("#sPwaToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sPwaToDt}"
    });


    //버튼 - PWA 통계표 조회(기본조회)
    $("#btnSearchPwaC").kendoButton({
        click:function(e) {
            $("#sPwaStatCd").val("C");
            $('#pwaGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - PWA 통계표 조회(청구현황)
    $("#btnSearchPwaQ").kendoButton({
        click:function(e) {
            $("#sPwaStatCd").val("Q");
            $('#pwaGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - PWA 통계표 조회(승인현황)
    $("#btnSearchPwaA").kendoButton({
        click:function(e) {
            $("#sPwaStatCd").val("A");
            $('#pwaGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - PWA 통계표 조회(반송현황)
    $("#btnSearchPwaR").kendoButton({
        click:function(e) {
            $("#sPwaStatCd").val("R");
            $('#pwaGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //PWA 통계표 그리드
    $("#pwaGrid").kendoExtGrid({
        gridId:"G-SER-1011-000171"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/pwaReq/selectPwaStatTable.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]     = $("#dlrCd").val();
                        params["sPwaFromDt"] = $("#sPwaFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sPwaToDt"]   = $("#sPwaToDt").data("kendoExtMaskedDatePicker").value();
                        params["sPwaDocNo"]  = $("#sPwaDocNo").val();
                        params["sPwaStatCd"] = $("#sPwaStatCd").val();
                        params["sVinNo"]     = $("#sVinNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"claimDocNo"
                    ,fields:{
                         dlrSignReqDt:{type:"date", editable:false}
                        ,dlrSignReqDtFormat:{type:"date", editable:false}
                        ,pwaDocNo:{type:"string", editable:false}
                        ,pwaApproveNo:{type:"string", editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,cauOperAtcCd:{type:"string", editable:false}
                        ,cauItemCd:{type:"string", editable:false}
                        ,runDistVal:{type:"number", editable:false}
                        ,pwaTpNm1:{type:"string", editable:false}
                        ,pwaTpNm2:{type:"string", editable:false}
                        ,subAmt:{type:"number", editable:false}
                        ,pwaTotAmt:{type:"number", editable:false}
                        ,hqApproveDt:{type:"date", editable:false}
                        ,hqApproveDtFormat:{type:"date", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,pwaStatNm:{type:"string", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.dlrSignReqDtFormat = kendo.parseDate(elem.dlrSignReqDt, "<dms:configValue code='dateFormat' />");
                            elem.hqApproveDtFormat = kendo.parseDate(elem.hqApproveDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,selectable:"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
            {field:"dlrSignReqDtFormat", title:"<spring:message code='ser.lbl.claimReqDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.dlrSignReqDt == null ? '':data.dlrSignReqDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"pwaDocNo", title:"<spring:message code='ser.lbl.pwaDocNo' />", width:120, attributes:{"class":"al"}}
            ,{field:"pwaApproveNo", title:"<spring:message code='ser.lbl.pwaApprovalNo' />", width:120, attributes:{"class":"al"}}
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.vinNo' />", width:150, attributes:{"class":"al"}}
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:90, attributes:{"class":"al"}}
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:90, attributes:{"class":"al"}}
            ,{field:"cauOperAtcCd", title:"<spring:message code='ser.lbl.mainLbrCd' />", width:100, attributes:{"class":"al"}}
            ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />", width:100, attributes:{"class":"al"}}
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}
            ,{field:"pwaTpNm1", title:"<spring:message code='ser.lbl.pwaTpCd1' />", width:200, attributes:{"class":"al"}}
            ,{field:"pwaTpNm2", title:"<spring:message code='ser.lbl.pwaTpCd2' />", width:200, attributes:{"class":"al"}}
            ,{field:"subAmt", title:"<spring:message code='ser.lbl.subLbrAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:##,###}"}
            ,{field:"pwaTotAmt", title:"<spring:message code='global.lbl.totAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:##,###}"}
            ,{field:"hqApproveDtFormat", title:"<spring:message code='ser.lbl.approveDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.hqApproveDt == null ? '':data.hqApproveDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"regDt", title:"<spring:message code='ser.lbl.carRegDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"pwaStatNm", title:"<spring:message code='global.lbl.lastAchkResCd' />", width:80, attributes:{"class":"ac"}}
        ]
    });
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:968px !important; max-width:968px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});
</script>
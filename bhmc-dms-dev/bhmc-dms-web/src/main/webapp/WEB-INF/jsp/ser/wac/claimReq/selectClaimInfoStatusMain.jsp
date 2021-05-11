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
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12987" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12014" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12013" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimInfoStatus"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="form">
                <div class="table_form" role="search" data-btnid="btnSearchClaimInfoStatus">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호 -->
                                <td>
                                    <input id="dlrCd" name="dlrCd" type="hidden">
                                    <input id="sRoDocNo" type="text" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimStatNm" /></th><!-- 클레임상태 -->
                                <td>
                                    <input type="text" id="sClaimStatCd" name="sClaimStatCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimReqDtEx" /><!-- 클레임 요청일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sClaimReqFromDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sClaimReqToDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- vinNo -->
                                <td>
                                    <input type="text" id="sVinNo" name="sVinNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /></th><!-- 차량번호 -->
                                <td>
                                    <input type="text" id="sCarRegNo" name="sCarRegNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimTp" /></th><!-- 클레임유형 -->
                                <td>
                                    <input type="text" id="sClaimTp" name="sClaimTp" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <!-- 클레임 정보 현황 그리드 -->
            <div class="table_grid mt10">
                <div id="claimInfoStatusGrid" class="resizable_grid"></div>
            </div>
            <!-- //클레임 정보 현황 그리드 -->

        </section>
    </div>



<script type="text/javascript">

//달력목록
var calendarList = [{"calendarId":"", "calendarNm":""}];
<c:forEach var="obj" items="${calendarList}">
calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
</c:forEach>

/**클레임상태**/
var claimStatList = [];
 <c:forEach var ="obj" items="${claimStatDs}">
 claimStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

/**클레임유형**/
var claimTpList = [];
 <c:forEach var ="obj" items="${claimTpDs}">
 claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

$(document).ready(function() {

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 일자(FROM)
    $("#sClaimReqFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value: "${sClaimReqFromDt}"
    });

    // 일자(TO)
    $("#sClaimReqToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value: "${sClaimReqToDt}"
    });

    // 클레임상태
    $("#sClaimStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:claimStatList
        ,optionLabel:" "
        ,index:0
    });

    // 클레임유형
    $("#sClaimTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:claimTpList
        ,optionLabel:" "
        ,index:0
    });

    //버튼 - 클레임 정보 현황 조회
    $("#btnSearchClaimInfoStatus").kendoButton({
        click:function(e) {
            $('#claimInfoStatusGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){

            $("#form").get(0).reset();
            $("#sClaimReqFromDt").data("kendoExtMaskedDatePicker").value("${sClaimReqFromDt}");
            $("#sClaimReqToDt").data("kendoExtMaskedDatePicker").value("${sClaimReqToDt}");
            $("#btnSearchClaimInfoStatus").click();
        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            dms.ajax.excelExport({
                "beanName"          :"claimInfoStatusService"
                ,"templateFile"     :"ClaimInfoStatusList_Tpl.xlsx"
                ,"fileName"         :"<spring:message code='ser.menu.claimInfoStatus' />.xlsx"
                ,"sDlrCd"           :$("#dlrCd").val()
                ,"sClaimReqFromDt"  :$("#sClaimReqFromDt").val()
                ,"sClaimReqToDt"    :$("#sClaimReqToDt").val()
                ,"sRoDocNo"         :$("#sRoDocNo").val()
                ,"sVinNo"           :$("#sVinNo").val()
                ,"sCarRegNo"        :$("#sCarRegNo").val()
                ,"sClaimStatCd"     :$("#sClaimStatCd").data("kendoExtDropDownList").value()
                ,"sClaimTp"         :$("#sClaimTp").data("kendoExtDropDownList").value()
            });
        }
    });

    //클레임 정보 현황 그리드
    $("#claimInfoStatusGrid").kendoExtGrid({
        gridId:"G-SER-0519-174640"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectClaimInfoStatus.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]         = $("#dlrCd").val();
                        params["sClaimReqFromDt"] = $("#sClaimReqFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sClaimReqToDt"]   = $("#sClaimReqToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoDocNo"]       = $("#sRoDocNo").val();
                        params["sClaimStatCd"]   = $("#sClaimStatCd").data("kendoExtDropDownList").value();
                        params["sClaimTp"]       = $("#sClaimTp").data("kendoExtDropDownList").value();
                        params["sVinNo"]         = $("#sVinNo").val();
                        params["sCarRegNo"]      = $("#sCarRegNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carOwnerNm"
                    ,fields:{
                         dlrCd:{type:"string", editable:false}
                        ,dlrNm:{type:"string", editable:false}
                        ,carOwnerNm:{type:"string", editable:false}
                        ,carOwnerTelNo:{type:"string", editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,carRegNo:{type:"string", editable:false}
                        ,wartDt:{type:"date", editable:false}
                        ,wartDtFormat:{type:"date", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,roStartDt:{type:"date", editable:false}
                        ,roStartDtFormat:{type:"date", editable:false}
                        ,roEndDt:{type:"date", editable:false}
                        ,roEndDtFormat:{type:"date", editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,claimStatNm:{type:"string", editable:false}
                        ,claimReqDt:{type:"date", editable:false}
                        ,claimReqDtFormat:{type:"date", editable:false}
                        ,claimConfirmDt:{type:"date", editable:false}
                        ,claimConfirmDtFormat:{type:"date", editable:false}
                        ,crNo:{type:"string", editable:false}
                        ,cauOperAtcCd:{type:"string", editable:false}
                        ,cauItemCd:{type:"string", editable:false}
                        ,cauItemNm:{type:"string", editable:false}
                        ,reqAmt:{type:"number", editable:false}
                        ,confirmTotAmt:{type:"number", editable:false}

                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.wartDtFormat = kendo.parseDate(elem.wartDt, "<dms:configValue code='dateFormat' />");
                            elem.roStartDtFormat = kendo.parseDate(elem.roStartDt, "<dms:configValue code='dateFormat' />");
                            elem.roEndDtFormat = kendo.parseDate(elem.roEndDt, "<dms:configValue code='dateFormat' />");
                            elem.claimConfirmDtFormat = kendo.parseDate(elem.claimConfirmDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,editable:false
        ,selectable:"row"
        ,resizable:true
        ,columns:[
             {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100}
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.custNm' />", width:100}
            ,{field:"carOwnerTelNo", title:"<spring:message code='ser.lbl.telNo' />", width:100}
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}
            ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}   // 현주행거리
            ,{field:"wartDtFormat", title:"<spring:message code='ser.lbl.wcEndDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.wartDt == null ? '':data.wartDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}
            ,{field:"roStartDtFormat", title:"<spring:message code='ser.lbl.roStartDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.roStartDt == null ? '':data.roStartDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"roEndDtFormat", title:"<spring:message code='ser.lbl.roEndDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.roEndDt == null ? '':data.roEndDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:100}
            ,{field:"claimTpNm", title:"<spring:message code='ser.lbl.claimTp' />", width:100, attributes:{"class":"ac"}}
            ,{field:"claimStatNm", title:"<spring:message code='ser.lbl.claimStatNm' />", width:100, attributes:{"class":"ac"}}
            ,{field:"claimReqDtFormat", title:"<spring:message code='ser.lbl.claimReqDtEx' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.claimReqDt == null ? '':data.claimReqDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"claimConfirmDtFormat", title:"<spring:message code='ser.lbl.judgDtEx' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.claimConfirmDt == null ? '':data.claimConfirmDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}
            ,{field:"cauOperAtcCd", title:"<spring:message code='ser.lbl.mainLbrCd' />", width:100}
            ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />", width:100}
            ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemNm' />", width:200, attributes:{"class":"al"}}
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"itemAmt", title:"<spring:message code='ser.lbl.confirmItemAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"subAmt", title:"<spring:message code='ser.lbl.confirmSubAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"reqAmt", title:"<spring:message code='ser.lbl.questAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"confirmTotAmt", title:"<spring:message code='ser.lbl.judgAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}

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
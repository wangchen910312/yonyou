<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

    <!-- 고객추출 -->
    <div id="resizableContainer">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.menu.claimStatus" /></h1>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12008" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimStatusC"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12007" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimStatusQ"><spring:message code="ser.btn.reqStatus" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12006" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimStatusA"><spring:message code="ser.btn.appStatus" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12005" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimStatusR"><spring:message code="ser.btn.returnStatus" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12004" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimStatusS"><spring:message code="ser.btn.standByStatus" /></button>
                    </dms:access>
                    <!--<button type="button" class="btn_m btn_print" id="btnPrintClaimStatus" ><spring:message code="global.btn.print" /></button>  인쇄 -->
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearchClaimStatusC">
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
                            <th scope="row"><spring:message code="sal.lbl.date" /><!-- 일자 --></th>
                            <td colspan="2">
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="hidden" id="dlrCd" name="dlrCd">
                                        <input id="sClaimFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sClaimToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.vinNo' /></th>
                            <td colspan="2">
                                <input id="sClaimStatCd" name="sClaimStatCd" type="hidden">
                                <input id="sVinNo" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.claimTp" /></th><!-- 클레임유형 -->
                            <td>
                                <input type="text" id="sClaimTp" name="sClaimTp" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 일자별 클레임요청 마스터 그리드 -->
            <div class="table_grid">
                <div id="claimStatusGrid" class="resizable_grid"></div>
            </div>
            <!-- //일자별 클레임요청 마스터 그리드 -->

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
    $("#sClaimFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sClaimFromDt}"
    });

    // 일자(TO)
    $("#sClaimToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sClaimToDt}"
    });

    /**클레임유형**/
    var claimTpList = [];
     <c:forEach var ="obj" items="${claimTpDs}">
     claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var claimTpMap = dms.data.arrayToMap(claimTpList , function(obj){return obj.cmmCd;});

     $("#sClaimTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimTpList
         ,template:"[#=cmmCd#] #=cmmCdNm#"
         ,optionLabel:" "
         ,index:0
     });

    //버튼 - 클레임 현황 조회(기본조회)
    $("#btnSearchClaimStatusC").kendoButton({
        click:function(e) {
            $("#sClaimStatCd").val("C");
            $('#claimStatusGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 클레임 현황 조회(청구현황)
    $("#btnSearchClaimStatusQ").kendoButton({
        click:function(e) {
            $("#sClaimStatCd").val("Q");
            $('#claimStatusGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 클레임 현황 조회(승인현황)
    $("#btnSearchClaimStatusA").kendoButton({
        click:function(e) {
            $("#sClaimStatCd").val("A");
            $('#claimStatusGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 클레임 현황 조회(반송현황)
    $("#btnSearchClaimStatusR").kendoButton({
        click:function(e) {
            $("#sClaimStatCd").val("R");
            $('#claimStatusGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 클레임 현황 조회(대기현황)
    $("#btnSearchClaimStatusS").kendoButton({
        click:function(e) {
            $("#sClaimStatCd").val("S");
            $('#claimStatusGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //RO 화면으로 이동
    $(document).on("click", ".linkRoDocNo", function(e){
        var grid = $("#claimStatusGrid").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);

        var param="?roDocNo="+selectedVal.roDocNo;
        param +="&infoType=RO";

        return parent._createOrReloadTabMenu('<spring:message code="ser.menu.roCreate" />'
                ,"<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do"+param+"'/>", "VIEW-D-10337");
    });

    //클레임 화면으로 이동
    $(document).on("click", ".linkClaimDocNo", function(e){
        var grid = $("#claimStatusGrid").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);

        var param="?claimDocNo="+selectedVal.claimDocNo+
                "&roDocNo="+selectedVal.roDocNo+
                "&vinNo="+selectedVal.vinNo;

        return parent._createOrReloadTabMenu('<spring:message code="ser.menu.claimReqMng" />'
                ,"<c:url value='/ser/wac/claimReq/selectClaimRequestMain.do"+param+"'/>", "VIEW-D-10354");
    });

    //클레임 현황 그리드
    $("#claimStatusGrid").kendoExtGrid({
        gridId:"G-SER-1011-000157"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectClaimStatus.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]       = $("#dlrCd").val();
                        params["sClaimFromDt"] = $("#sClaimFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sClaimToDt"]   = $("#sClaimToDt").data("kendoExtMaskedDatePicker").value();
                        params["sVinNo"]       = $("#sVinNo").val();
                        params["sClaimTp"]     = $("#sClaimTp").data("kendoExtDropDownList").value();
                        params["sClaimStatCd"] = $("#sClaimStatCd").val();

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
                         claimDocNo:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,claimReqDt:{type:"date", editable:false}
                        ,claimReqDtFormat:{type:"date", editable:false}
                        ,claimTpNm:{type:"string", editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,runDistVal:{type:"number", editable:false}
                        ,reqAmt:{type:"number", editable:false}
                        ,claimTotAmt:{type:"number", editable:false}
                        ,claimConfirmDt:{type:"date", editable:false}
                        ,claimConfirmDtFormat:{type:"date", editable:false}
                        ,claimStatNm:{type:"string", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.claimReqDtFormat = kendo.parseDate(elem.claimReqDt, "<dms:configValue code='dateFormat' />");
                            elem.claimConfirmDtFormat = kendo.parseDate(elem.claimConfirmDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,selectable:"row"
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
             {field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:200, attributes:{"class":"ac"}
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='linkClaimDocNo'>"+dataItem.claimDocNo+"</a>";
                     return spanObj;
                 }
             }
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:200, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkRoDocNo'>"+dataItem.roDocNo+"</a>";
                    return spanObj;
                }
            }
            ,{field:"claimReqDtFormat", title:"<spring:message code='ser.lbl.claimReqDtEx' />", width:200
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.claimReqDt == null ? '':data.claimReqDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"claimTpNm", title:"<spring:message code='par.lbl.claimType' />", width:200, attributes:{"class":"ac"}}
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.vinNo' />", width:200, attributes:{"class":"ac"}}
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}
            ,{field:"reqAmt", title:"<spring:message code='sal.lbl.imsAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"claimTotAmt", title:"<spring:message code='ser.lbl.approvalAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"claimConfirmDtFormat", title:"<spring:message code='ser.lbl.judgDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.claimConfirmDt == null ? '':data.claimConfirmDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"claimStatNm", title:"<spring:message code='ser.lbl.judgStat' />", width:200, attributes:{"class":"ac"}}
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
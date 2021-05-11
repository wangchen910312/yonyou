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
                <div class="btn_right">
                    <button class="btn_m btn_search" id="btnSearchClaimStatusC"><spring:message code="global.btn.search" /></button>
                    <button type="button" id="print" class="btn_m "><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
                    <button type="button" id="printA4" class="btn_m "><spring:message code="ser.btn.printA4" /><!-- A4인쇄 --></button>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearchClaimStatusC">
                <table>
                    <caption></caption>
                    <colgroup id="dlrclaimoldColGroup">
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
                            <th scope="row"><spring:message code="ser.lbl.judgDt" /><!-- 판정일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sClaimConfirmFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sClaimConfirmToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.fincReqDt" /><!-- 신청일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sClaimFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sClaimToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 일자별 클레임요청 마스터 그리드 -->
            <div class="table_grid mt10">
                <div id="claimStatusGrid" class="resizable_grid"></div>
            </div>
            <!-- //일자별 클레임요청 마스터 그리드 -->

            <input type="hidden" id="dlrCd" name="dlrCd" value="${dlrCd}">

        </section>
    </div>



<script type="text/javascript">

$(document).ready(function() {

    // 일자(FROM)
    $("#sClaimConfirmFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sClaimFromDt}"
    });

    // 일자(TO)
    $("#sClaimConfirmToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sClaimToDt}"
    });

    // 일자(FROM)
    $("#sClaimFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 일자(TO)
    $("#sClaimToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#btnSearchClaimStatusC").kendoButton({
        click:function(e) {
            if( (dms.string.isEmpty($("#sClaimConfirmFromDt").val()) || dms.string.isEmpty($("#sClaimConfirmToDt").val())) &&
                (dms.string.isEmpty($("#sClaimFromDt").val()) || dms.string.isEmpty($("#sClaimToDt").val())) ){

                dms.notification.warning("<spring:message code='global.lbl.applyDt' var='applyDt'/><spring:message code='global.info.validation.required' arguments='${applyDt}' />");
                return;
            }

            $("#claimStatusGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    $("#print").kendoButton({
        click:function(e) {
            var gridData = $("#claimStatusGrid").data("kendoExtGrid");

            var selectRows = gridData.select();

            if(selectRows.length == 0 ){
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }

            var selectData = [];
            var time = new Date().getTime();
            if(selectRows != null){
                $.each( selectRows  , function(idx , obj){
                    var paramData = {};
                    paramData.dlrCd = gridData.dataItem(obj).dlrCd;
                    paramData.claimNo = gridData.dataItem(obj).claimDocNo;
                    paramData.itemCd = gridData.dataItem(obj).itemCd;
                    paramData.distNo = time+"";
                    selectData.push(paramData);
                });
            }

            $.ajax({
                url:"<c:url value='/ser/wac/claimOldItemManage/insertDlrClaimOldItemPrint.do' />"
                ,data:JSON.stringify(selectData)
                ,contentType:"application/json"
                ,dataType:"json"
                ,method:"POST"
                ,success:function(result){
                    var params = "&sDlrCd=${dlrCd}&sDistNo="+time;
                    parent._createOrReloadTabMenu("<spring:message code='ser.lbl.oldItemTread' />", "<c:url value='/ReportServer?reportlet=ser/selectLabelPrintList.cpt'/>"+params);
                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            });

            /* popup으로 띄울경우
            var iReportParam = "&sDlrCd=${dlrCd}&sClaimDocAndLineNo="+claimDocAndLineNo;
            var iReportUrl = "<c:url value='/ReportServer?reportlet=ser/selectLabelPrintList.cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='ser.lbl.oldItemTread' />", 'top=0,left=0,width=925,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1'); */

            //selectLabelPrintList.cpt
        }
    });

    $("#printA4").kendoButton({
        click:function(e) {
            var gridData = $("#claimStatusGrid").data("kendoExtGrid");

            var selectRows = gridData.select();

            if(selectRows.length == 0 ){
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }

            var selectData = [];
            var time = new Date().getTime();
            if(selectRows != null){
                $.each( selectRows  , function(idx , obj){
                    var paramData = {};
                    paramData.dlrCd = gridData.dataItem(obj).dlrCd;
                    paramData.claimNo = gridData.dataItem(obj).claimDocNo;
                    paramData.itemCd = gridData.dataItem(obj).itemCd;
                    paramData.distNo = time+"";
                    selectData.push(paramData);
                });
            }

            $.ajax({
                url:"<c:url value='/ser/wac/claimOldItemManage/insertDlrClaimOldItemPrint.do' />"
                ,data:JSON.stringify(selectData)
                ,contentType:"application/json"
                ,dataType:"json"
                ,method:"POST"
                ,success:function(result){
                    var params = "&sDlrCd=${dlrCd}&sDistNo="+time;
                    parent._createOrReloadTabMenu("<spring:message code='ser.lbl.oldItemTread' />", "<c:url value='/ReportServer?reportlet=ser/selectLabelA4PrintList.cpt'/>"+params);
                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            });
            /* popup으로 띄울경우
            var iReportParam = "&sDlrCd=${dlrCd}&sClaimDocAndLineNo="+claimDocAndLineNo;
            var iReportUrl = "<c:url value='/ReportServer?reportlet=ser/selectLabelA4PrintList.cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='ser.lbl.oldItemTread' />", 'top=0,left=0,width=925,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1'); */

            //selectLabelA4PrintList.cpt
        }
    });

    //클레임 현황 그리드
    $("#claimStatusGrid").kendoExtGrid({
        gridId:"G-SER-0727-000540"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimPart.do' />"
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
                        params["sClaimConfirmFromDt"] = $("#sClaimConfirmFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sClaimConfirmToDt"]   = $("#sClaimConfirmToDt").data("kendoExtMaskedDatePicker").value();
                        params["sClaimStatCd"] = "A";

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
                        ,reqQty:{type:"number", editable:false}
                        ,claimConfirmDt:{type:"date", editable:false}
                        ,claimConfirmDtFormat:{type:"date", editable:false}
                        ,claimStatNm:{type:"string", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        var newData = $.extend(true,{},d);
                        var targetIdx = 0;
                        $.each(d.data, function(idx, elem) {
                            newData.data[idx+targetIdx].claimReqDtFormat = kendo.parseDate(elem.claimReqDt, "<dms:configValue code='dateFormat' />");
                            newData.data[idx+targetIdx].claimConfirmDtFormat = kendo.parseDate(elem.claimConfirmDt, "<dms:configValue code='dateFormat' />");
                            if(elem.reqQty>1){
                                for(var i=0; i<elem.reqQty-1; i++){
                                    var copyObj = $.extend(true,{},elem);
                                    newData.data.splice(idx+targetIdx,0,copyObj);
                                    targetIdx++;
                                }
                            }
                        });
                        newData.total = d.total + targetIdx;
                    }
                    return newData;
                }
            }
        }
        ,selectable:"multiple"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,editable:false
        ,columns:[
            {field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:200, attributes:{"class":"ac"}}
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:200, attributes:{"class":"ac"}}
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:300, attributes:{"class":"ac"}}
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:200, attributes:{"class":"ac"}
                /* ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkRoDocNo'>"+dataItem.roDocNo+"</a>";
                    return spanObj;
                } */
            }
            ,{field:"carDstinNm", title:"<spring:message code='ser.lbl.pcDstinCd' />/<spring:message code='ser.lbl.model' />", width:200, attributes:{"class":"ac"}
                ,sortable:false
                ,template:function(dataItem){
                    return dataItem.carDstinNm + "/" + dataItem.modelNm;
                }
            }
        ]
    });
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#dlrclaimoldColGroup col");
            $(colEmt[1]).css("width","24%");
            $(colEmt[3]).css("width","24%");
            $(".table_grid").attr("style","width:968px !important; max-width:968px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});
</script>
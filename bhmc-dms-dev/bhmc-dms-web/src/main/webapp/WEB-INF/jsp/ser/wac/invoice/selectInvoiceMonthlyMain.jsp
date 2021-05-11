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
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.monthlyInvoice" /></h1><!-- 월별 INVOICE -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12001" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </dms:access>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.invcMon" /></th> <!-- 확정월 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromDt" class="form_monthpicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToDt" class="form_monthpicker ac"/>
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.claimTp" /></th><!-- 클레임유형 -->
                            <td>
                                <input type="text" id="sClaimTp" name="sClaimTp" class="form_comboBox"    />
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 인보이스 목록 -->
            <div>
                <div class="table_grid mt10">
                    <div id="gridMaster" ></div>
                </div>
            </div>
            <form id="invcForm">
                <!-- 인보이스 목록-->
                <div class="table_form mt10">
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
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.invcNo" /></th><!-- INVOICE NO. -->
                                <td>
                                    <input type="text" id="invcNo" name="invcNo" readonly class="form_input al form_readonly" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.confirmLbrAmt" /></th><!-- 공임금액 -->
                                <td>
                                    <input type="text" id="confirmLbrAmt" name="confirmLbrAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.invcClaimCnt" /></th><!-- 대상건수 -->
                                <td>
                                    <input type="text" id="invcClaimCnt" name="invcClaimCnt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.confirmItemAmt" /></th><!-- 부품금액 -->
                                <td>
                                    <input type="text" id="confirmItemAmt" name="confirmItemAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.reqAmt" /></th><!-- 청구금액 -->
                                <td>
                                    <input type="text" id="claimReqAmt" name="claimReqAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.confirmSubAmt" /></th><!-- 외주금액 -->
                                <td>
                                    <input type="text" id="confirmSubAmt" name="confirmSubAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.ddctTotAmt" /></th><!-- 공제금액(-) -->
                                <td>
                                    <input type="text" id="ddctTotAmt" name="ddctTotAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.invcClaimTotAmt" /></th><!-- 확정금액 -->
                                <td>
                                    <input type="text" id="invcClaimTotAmt" name="invcClaimTotAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.confirmTotAmt" /></th><!-- 계산 합계 -->
                                <td>
                                    <input type="text" id="confirmTotAmt" name="confirmTotAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <input type="hidden" id="sClaimDocNo" name="sClaimDocNo" />
                <input type="hidden" id="sRoDocNo" name="sRoDocNo" />
            </form>
            <!-- 인보이스 상세 목록 -->
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-12000" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnDetailExcelExport" class="btn_s btn_s_min5"><spring:message code="global.btn.excelDownload" /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_grid mt5">
                    <div id="gridDetail" class="grid"></div>
                </div>
            </section>
            <!-- 인보이스 상세 목록-->

            <!-- 인보이스 공제 목록 -->
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11999" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnDeductExcelExport" class="btn_s btn_s_min5"><spring:message code="global.btn.excelDownload" /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_grid mt5">
                    <div id="gridDeduct" class="resizable_grid"></div>
                </div>
            </section>
            <!-- 인보이스 공제 목록-->
        </section>
    </div>
</div>

<!-- script -->
<script>
/**클레임유형**/
var claimTpList = [];
 <c:forEach var ="obj" items="${claimTpDs}">
 claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 var claimTpMap = dms.data.arrayToMap(claimTpList , function(obj){return obj.cmmCd;});

$(document).ready(function() {

    /**클레임유형**/
    setClaimTpMap = function(value , code){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(dms.string.strNvl(code) != ""){
                resultVal = "["+claimTpMap[value].cmmCd+"]";
            }
             if(claimTpMap[value] != undefined){
               resultVal +=  claimTpMap[value].cmmCdNm;
            }
        }
        return resultVal;
    };

 // ********************** 데이터 format 세팅 **********************

    /**클레임유형**/
    $("#sClaimTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:claimTpList
        ,optionLabel:" "
        ,template:"[#=cmmCd#] #= setClaimTpMap(cmmCd) #"
        ,valueTemplate:"[#=cmmCd#] #= setClaimTpMap(cmmCd) #"
        ,index:0
    });

     /** 공임금액,부품금액,청구금액,외주금액,공제금액(-),확정금액,계산합계 **/
    $("#confirmLbrAmt,#confirmItemAmt,#claimReqAmt,#confirmSubAmt,#ddctTotAmt,#invcClaimTotAmt,#confirmTotAmt").kendoExtNumericTextBox({
         min:0
        ,format:"n2" //"{0:##,###}"
        ,value :0.00
        ,spinners:false             // 증,감 화살표
      });
    /** 대상건수 **/
    $("#invcClaimCnt").kendoExtNumericTextBox({
         min:0
        ,format:"n0" //"{0:##,###}"
        ,value :0
        ,spinners:false             // 증,감 화살표
    });

    /**조회조건 시작일자 **/
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,start:"year"
        ,depth:"year"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**조회조건 종료일자**/
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,start:"year"
        ,depth:"year"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });


    chageDate = function(toDt){
        //var fromVal = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
        var yy = kendo.toString(kendo.parseDate(toDt), "yyyy");
        var mm = kendo.toString(kendo.parseDate(toDt), "MM");
        var dd = kendo.toString((new Date(yy ,mm ,0)).getDate());
        var toDt = kendo.parseDate(yy+"-"+mm+"-"+dd);
        return toDt;
    };


    /********************** 버튼  설정 ***************************/
    /** 조회 버튼**/
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#gridMaster").data("kendoExtGrid").dataSource.read();
            initAll();
        }
    });

    //엑셀버튼
    $("#btnDetailExcelExport").kendoButton({
        click:function(e){
            if($("#gridDetail").data("kendoExtGrid").dataSource._data.length == 0){
                dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.info.valNoMsg' arguments='${excelDownload}' />");
                return;
            }

            dms.ajax.excelExport({
                "beanName"         :"invoiceMonthlyService"
                ,"templateFile"    :"InvoiceMonthlyDetailList_Tpl.xlsx"
                ,"fileName"        :"<spring:message code='ser.title.monthlyInvoice' />_Detail.xlsx"
                ,"sInvcNo"         :$("#invcNo").val()
                ,"sClaimTp"        :$("#sClaimTp").data("kendoExtDropDownList").value()
                ,"sGubun"          :"detail"
            });
        },enable:false
    });

    //엑셀버튼
    $("#btnDeductExcelExport").kendoButton({
        click:function(e){
            if($("#gridDeduct").data("kendoExtGrid").dataSource._data.length == 0){
                dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.info.valNoMsg' arguments='${excelDownload}' />");
                return;
            }

            dms.ajax.excelExport({
                "beanName"         :"invoiceMonthlyService"
                ,"templateFile"    :"InvoiceMonthlyDeductList_Tpl.xlsx"
                ,"fileName"        :"<spring:message code='ser.title.monthlyInvoice' />_Deduct.xlsx"
                ,"sInvcNo"         :$("#invcNo").val()
                //,"sClaimDocNo"     :$("#sClaimDocNo").val()
                //,"sRoDocNo"        :$("#sRoDocNo").val()
                ,"sGubun"          :"deduct"
            });
        },enable:false
    });

    /** 초기화 **/
    initAll = function(e){
        $("#invcForm").get(0).reset();
        $("#sClaimDocNo").val("");
        $("#sRoDocNo").val("");

        $("#btnDetailExcelExport").data("kendoButton").enable(false)
        $("#btnDeductExcelExport").data("kendoButton").enable(false)

        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        $("#gridDeduct").data("kendoExtGrid").dataSource.data([]);

    };

    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000161"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/invoice/selectInvoiceMonthlyMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         var sToDt =  $("#sToDt").data("kendoExtMaskedDatePicker").value();

                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"]   = chageDate(sToDt);

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,invcDt:{type:"date" } //인보이스일자
                       ,invcNo:{type:"string" }//인보이스번호
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:170
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());

            $("#invcNo").val(selectedVal.invcNo);
            $("#confirmLbrAmt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimLbrAmt);
            $("#invcClaimCnt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimCnt);
            $("#confirmItemAmt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimItemAmt);
            $("#claimReqAmt").data("kendoExtNumericTextBox").value(selectedVal.claimReqAmt);
            $("#confirmSubAmt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimSubAmt);
            $("#ddctTotAmt").data("kendoExtNumericTextBox").value(selectedVal.ddctTotAmt);
            $("#invcClaimTotAmt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimTotAmt);
            $("#confirmTotAmt").data("kendoExtNumericTextBox").value(selectedVal.confirmTotAmt);

            $("#gridDetail").data("kendoExtGrid").dataSource._destroyed = [];
            $("#gridDeduct").data("kendoExtGrid").dataSource._destroyed = [];

            $("#btnDetailExcelExport").data("kendoButton").enable(true);
            $("#btnDeductExcelExport").data("kendoButton").enable(true);

            $("#gridDetail").data("kendoExtGrid").dataSource.read();
            $("#gridDeduct").data("kendoExtGrid").dataSource.read();
        }
        ,columns:[
            {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:80,sortable:false, attributes:{"class":"ac"}}
            ,{field:"invcDt",title:"<spring:message code='ser.lbl.invcDt' />", width:150,sortable:false, attributes :{"class":"al"}
                , attributes :{"class":"ac"}
                , format:"{0:yyyy-MM}"
            }
            ,{field:"invcNo",title:"<spring:message code='ser.lbl.invcNo' />", width:150,sortable:false, attributes :{"class":"al"}}
            ,{field:"invcClaimTotAmt",title:"<spring:message code='ser.lbl.invcClaimTotAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
            ,{field:"ddctTotAmt",title:"<spring:message code='ser.lbl.ddctTotAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
            ,{field:"confirmTotAmt",title:"<spring:message code='ser.lbl.confirmTotAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
        ]

    });

    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1011-000162"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/invoice/selectInvoiceMonthlyDetail.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sInvcNo"] = $("#invcNo").val();
                         params["sClaimTp"] = $("#sClaimTp").data("kendoExtDropDownList").value();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,invcNo:{type:"string" } //인보이스번호
                       ,judgDt:{type:"date" }//판정일자
                     }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:170
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,change : function(e){
            /* 상세 공제 조회 안함 20170801
            var selectedVal = this.dataItem(this.select());
            $("#sRoDocNo").val(selectedVal.roDocNo);
            $("#sClaimDocNo").val(selectedVal.claimDocNo);
            $("#btnDeductExcelExport").data("kendoButton").enable(true);
            $("#gridDeduct").data("kendoExtGrid").dataSource.page(1); */
        }
        ,columns:[
            {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
            ,{field:"roDocNo",title:"<spring:message code='ser.lbl.roDocNo' />", width:120,sortable:false, attributes :{"class":"al"}}
            ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:100,sortable:false, attributes :{"class":"al"}}
            ,{field:"claimTp",title:"<spring:message code='ser.lbl.claimTp' />", width:120
               ,attributes :{"class":"al"}
               ,template: "#= setClaimTpMap(claimTp,'Y') #"
             }
            ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />", width:180, attributes :{"class":"al"} , format:"{0:n2}"}
            ,{field:"judgDt",title:"<spring:message code='ser.lbl.judgDt' />", width:120
               , attributes :{"class":"ac"}
               , format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"confirmTotAmt",title:"<spring:message code='ser.lbl.confirmTotAmt' />", width:140, attributes :{"class":"ar"} , format:"{0:n2}"}
            ,{field:"confirmLbrAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:140, attributes :{"class":"ar"} , format:"{0:n2}"}
            ,{field:"confirmItemAmt",title:"<spring:message code='ser.lbl.confirmItemAmt' />", width:140, attributes :{"class":"ar"} , format:"{0:n2}"}
            ,{field:"confirmSubAmt",title:"<spring:message code='ser.lbl.confirmSubAmt' />", width:140, attributes :{"class":"ar"} , format:"{0:n2}"}
        ]
    });

    $("#gridDeduct").kendoExtGrid({
        gridId:"G-SER-1011-000163"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/invoice/selectInvoiceMonthlyDeduct.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sInvcNo"] = $("#invcNo").val();
                         //params["sRoDocNo"] = $("#sRoDocNo").val();
                         //params["sClaimDocNo"] = $("#sClaimDocNo").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,invcNo:{type:"string" } //인보이스번호
                       ,ddctNo:{type:"string" } //공제번호
                       ,ddctReasonCd:{type:"string" }//공제사유코드
                       ,ddctReasonCont:{type:"string" }//공제사유명
                       ,ddctAmt:{type:"number" }//공제금액
                       ,claimDocNo:{type:"string" }//클레임번호 */
                       ,ddctReqDt:{type:"date" }//공제일자
                     }

                 }//model
           }//schema
        }//dataSource
        //,detailTemplate:"<div>claimDocNo:#:claimDocNo #</div><div>ddctNo:#:ddctNo #</div>"
        ,editable:false
        ,scrollable:true
        ,autoBind:true
        ,sortable:false
        ,selectable:"row"
        ,height:170
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"ddctNo",title:"<spring:message code='ser.lbl.ddctNo' />", width:120,sortable:false, attributes :{"class":"al"}}
               ,{field:"ddctReasonCd",title:"<spring:message code='ser.lbl.ddctReasonCd' />", width:120,sortable:false, attributes :{"class":"al"}}
               ,{field:"ddctReasonCont",title:"<spring:message code='ser.lbl.ddctReasonNm' />", width:350, attributes :{"class":"al"} }
               ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:150, attributes :{"class":"al"} }
               ,{field:"ddctAmt",title:"<spring:message code='ser.lbl.deductionAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
               ,{field:"ddctReqDt",title:"<spring:message code='ser.lbl.judgDt' />", width:120
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }
                 ]

    });

    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});
</script>
<!-- //script -->

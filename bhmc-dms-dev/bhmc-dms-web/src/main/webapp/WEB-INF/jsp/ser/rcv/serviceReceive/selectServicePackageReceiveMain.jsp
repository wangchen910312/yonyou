<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>        <!-- content -->
<!-- 수납 -->
<div class="content_v1">
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="ser.title.reciveMng" /></h1><!--수납관리  --> --%>
        <div class="btn_left">
            <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
        </div>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>

    <form id="rcvForm" name="rcvForm" method="POST">
    <input type="hidden" id="rcvDocNo">
    <input type="hidden" id="dlrCd">

    <div class="table_form form_width_100per">
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
                    <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!--RO번호  -->
                    <td>
                        <input type="text" id="sRoDocNo" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.payer" /></th><!--지불자  -->
                    <td>
                        <input type="text" id="sPaymUsrNm" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.payTerm" /></th><!--지불기한  -->
                    <td>
                        <input type="text" id="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.payWay" /></th><!--지불유형  -->
                    <td>
                        <input type="text" value="" class="form_input" id="">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

     <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="receiveGrid"></div>
    </div>

    <section class="group mt5">
        <div class="table_grid mt10">
            <table id="receive" class="grid">
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1"><spring:message code="par.lbl.dpstAmt" /></th><!--실수금액  -->
                        <th scope="col" data-field="data2"><spring:message code="ser.lbl.receiveDt" /></th><!--수납완요일자  -->
                        <th scope="col" data-field="data3"><spring:message code="ser.lbl.outstdAmt" /></th><!--미수금  -->
                        <th scope="col" data-field="data4"><spring:message code="ser.lbl.outstdAmtDt" /></th><!--미수금확인시간  -->
                        <th scope="col" data-field="data5"><spring:message code="ser.lbl.invoiceTp" /></th><!--영수증유형  -->
                        <th scope="col" data-field="data6"><spring:message code="ser.lbl.invoiceNo" /></th><!--영수증번호  -->
                        <th scope="col" data-field="data7"><spring:message code="ser.lbl.invoiceDt" /></th><!--영수증일자  -->
                        <th scope="col" data-field="data8"><spring:message code="ser.lbl.receiveBigo" /></th><!--수납비고  -->
                    </tr>
                </thead>
                <tbody>
                    <tr id="disTrY">
                        <td><input class="form_numeric ar r" id="rcvAmt"></td>
                        <td><input class="form_datepicker" id="rcvCpltDt"></td>
                        <td><input class="form_numeric ar" id="npayAmt"></td>
                        <td><input class="form_datepicker" id="npayChkDt"></td>
                        <td><input class="form_comboBox" id="rcptTp"></td>
                        <td><input type="text" class="form_input" id="rcptNo"></td>
                        <td><input class="form_datepicker" id="rcptDt"></td>
                        <td><input class="form_input" id="rcvRemark"></td>
                    </tr>
                    <tr id="disTrN">
                        <td id="rcvAmt1"></td>
                        <td id="rcvCpltDt1"></td>
                        <td id="npayAmt1"></td>
                        <td id="npayChkDt1"></td>
                        <td id="rcptTp1"></td>
                        <td id="rcptNo1"></td>
                        <td id="rcptDt1"></td>
                        <td id="rcvRemark1"></td>
                    </tr>
                </tbody>
            </table>

            <table id="refund" class="grid" style="display:none;">
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1"><spring:message code="par.lbl.dpstAmt" /></th><!--실수금액  -->
                        <th scope="col" data-field="data2"><spring:message code="ser.lbl.receiveDt" /></th><!--수납완요일자  -->
                        <th scope="col" data-field="data5"><spring:message code="ser.lbl.invoiceTp" /></th><!--영수증유형  -->
                        <th scope="col" data-field="data6"><spring:message code="ser.lbl.invoiceNo" /></th><!--영수증번호  -->
                        <th scope="col" data-field="data3"><spring:message code="ser.lbl.refdAmt" /></th><!--  환불금액 -->
                        <th scope="col" data-field="data4"><spring:message code="ser.lbl.refdDt" /></th><!--환불확인시간  -->
                        <th scope="col" data-field="data7"><spring:message code="ser.lbl.refdPrsnNm" /></th><!--환불담당자  -->
                        <th scope="col" data-field="data8"><spring:message code="ser.lbl.refdRemark" /></th><!--환불비고  -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input class="form_numeric ar r" id="rcvAmt2"></td>
                        <td><input class="form_datepicker" id="rcvCpltDt2"></td>
                        <td><input class="form_comboBox" id="rcptTp2"></td>
                        <td><input type="text" class="form_input" id="rcptNo2"></td>
                        <td><input class="form_datepicker" id="refdAmt"></td>
                        <td><input class="form_numeric ar" id="refdDt"></td>
                        <td><input class="form_input" id="refdPrsnNm"></td>
                        <td><input class="form_input" id="refdRemark"></td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" id="rcvSubDocNo" name="rcvSubDocNo">
        </div>
    </section>

    <div class="header_area">
        <div class="btn_left">
            <button type="button" id="btnRefund" class="btn_m"><spring:message code="ser.btn.refund" /></button><!--환불  -->
        </div>
        <div class="btn_right">
            <button type="button" class="btn_m" id="receiveStart"><spring:message code="ser.btn.receiveStart" /></button><!--수납시작  -->
            <button type="button" class="btn_m" id="receiveEnd"><spring:message code="ser.btn.receiveEnd" /></button><!--수납완료  -->
            <button type="button" class="btn_m" id="receiveCancel"><spring:message code="ser.btn.receiveCancel" /></button><!--수납취소  -->
            <button type="button" class="btn_m" id="refundConfirm" style="display:none;"><spring:message code="ser.btn.refundConfirm" /></button><!--환불확인  -->
        </div>
    </div>
    </form>
</section>
<!-- //수납 -->
</div>

<!-- script -->
<script>

//공통코드:수납상태
var receiveCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${receiveCdList}">
receiveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수납상태 map
var receiveCdMap = dms.data.arrayToMap(receiveCdList, function(obj){return obj.cmmCd});

//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//영수증유형 Array
var rcptTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });

//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});

//지불방식 Array
var paymMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//영수증유형 Array
var rcptTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });

//수납 구분
receiveCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(receiveCdMap[val] != undefined)
            returnVal = receiveCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//결제유형
paymTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymTpCdArr[val] != undefined)
            returnVal = paymTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

// 지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymMthCdMap[val] != undefined)
            returnVal = paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rcptTpCdMap[val] != undefined)
            returnVal = rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

var sysDate = "${sysDate}"
var saveYn = false;
var row = 0;
$(document).ready(function() {


    $("#disTrY").hide();

    $("#rcvAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,spinners:false
    });

    $("#rcvAmt2").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,spinners:false
     });

    $("#npayAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,spinners:false
    });

    $("#refdAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,spinners:false
     });

    $("#rcvCpltDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:sysDate
    });

    $("#rcvCpltDt2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:sysDate
    });

    $("#npayChkDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:sysDate
    });

    $("#rcptDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#refdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:sysDate
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#receiveGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#rcptTp").kendoExtDropDownList({
        dataSource:rcptTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
     });

    $("#rcptTp2").kendoExtDropDownList({
        dataSource:rcptTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
     });

    $("#sRcvStatCd").kendoExtDropDownList({
        dataSource:receiveCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });
    //초기화
    $("#btnReset").kendoButton({
        click:function(e){
            saveYn = false;
            $("#rcvForm").get(0).reset();
            $("#calcDocNo").html("");
            $("#calcPrsnNm").html("");
            $("#roDocNo").html("");
            $("#rcptTp").val("");
            $("#rcptNo").val("");
            $("#npayAmt").val("");
            $("#rcvAmt").val("");
            $("#npayChkDt").val("");
            $("#rcvCpltDt").val("");
            $("#rcptDt").val("");
            $("#rcvRemark").val("");
            $("#rcptTp1").html("");
            $("#rcptNo1").html("");
            $("#npayAmt1").html("");
            $("#rcvAmt1").html("");
            $("#npayChkDt1").html("");
            $("#rcvCpltDt1").html("");
            $("#rcptDt1").html("");
            $("#rcvRemark1").html("");
            $("#disTrN").show();
            $("#disTrY").hide();
            $("#receiveGrid").data("kendoExtGrid").dataSource.read();
            $("#detailGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    // 환불
    $("#btnRefund").kendoButton({
        click:function(e) {
            $("#receive").hide();
            $("#refund").show();
            $("#btnRefund").hide();
            $("#btnReceive").show();

            $("#receiveStart").hide();
            $("#receiveEnd").hide();
            $("#receiveConfirm").hide();
            $("#receiveCancel").hide();
            $("#refundConfirm").show();

            var grid = $("#detailGrid").data("kendoExtGrid");
            var dataItem = grid.dataItem(grid.select());

            if(dataItem != null){
                $("#rcptTp2").data("kendoExtDropDownList").value(dataItem.rcptTp);
                $("#rcptNo2").val(dataItem.rcptNo);
                $("#rcvAmt2").data("kendoExtNumericTextBox").value(dataItem.rcvAmt);
                if(dataItem.rcvCpltDt != null){
                    $("#rcvCpltDt2").data("kendoExtMaskedDatePicker").value(dataItem.rcvCpltDt);
                }
                $("#refdAmt").data("kendoExtNumericTextBox").value(dataItem.refdAmt);
                if(dataItem.refdDt != null){
                    $("#refdDt").data("kendoExtMaskedDatePicker").value(dataItem.refdDt);
                }
                $("#refdPrsnNm").val(dataItem.refdPrsnNm)
                $("#refdRemark").val(dataItem.refdRemark);
            }
        }
    });

    // 수납
    /*
    $("#btnReceive").kendoButton({
        click:function(e) {
            $("#refund").hide();
            $("#receive").show();
            $("#btnReceive").hide();
            $("#btnRefund").show();

            $("#receiveStart").show();
            $("#receiveEnd").show();
            $("#receiveConfirm").show();
            $("#receiveCancel").show();
            $("#refundConfirm").hide();
        }
    }); */

    //수납시작
    $("#receiveStart").kendoButton({
        click:function(e){
              $("#disTrY").show();
              $("#disTrN").hide();

              var grid = $("#receiveGrid").data("kendoExtGrid");
              var rows = grid.select();
              var rowCnt = rows.length;
              var rcvAmt = 0;

              if(rowCnt > 0){
                  rows.each(function(index, row) {
                      var data = grid.dataItem(row);
                      rcvAmt += data.paymAmt;
                  });
              }

              $("#rcvAmt").data("kendoExtNumericTextBox").value(rcvAmt);
        }
        ,enable:true
    });

    //수납완료
    $("#receiveEnd").kendoButton({
        click:function(e){
            updateReceive('F')
        }
        ,enable:true
    });

    //수납취소
    $("#receiveCancel").kendoButton({
        click:function(e){
            updateReceive('C')
        }
        ,enable:true
    });
    //환불확인
    $("#refundConfirm").kendoButton({
        click:function(e){
            updateReceive('R')
        }
        ,enable:true
    });

    //그리드 설정
    $("#receiveGrid").kendoExtGrid({
        gridId:"G-SER-1011-000079"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServicePackageReceives.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sPaymUsrNm"] = $("#sPaymUsrNm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,rcvDocNo:{type:"string"}
                        ,vinNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,rcvStatCd:{type:"string"}
                        ,calcDt:{type:"date"}
                        ,rcvSubDocNo:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,multiSelectWithCheckbox:true
        ,selectable:"multiple row"
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            saveYn = false;

            if(dataItem != null){
                if(dataItem.length > 0){
                    $("#disTrN").show();
                    $("#disTrY").hide();
                    $("#calcDocNo").html(dataItem.calcDocNo);
                    $("#calcPrsnNm").html(dataItem.calcPrsnNm);
                    $("#roDocNo").html(dataItem.roDocNo);
                    $("#roTp").html(roTpCdMap[dataItem.roTp].cmmCdNm);
                    $("#rcvDocNo").val(dataItem.rcvDocNo);
                    $("#dlrCd").val(dataItem.dlrCd);

                    $("#npayChkDt").html("");
                    $("#rcvCpltDt").html("");
                    $("#rcptDt").html("");

                    $("#npayChkDt1").html("");
                    $("#rcvCpltDt1").html("");
                    $("#rcptDt1").html("");

                    $("#rcptTp").data("kendoExtDropDownList").value("");
                    $("#rcptNo").val("");
                    $("#npayAmt").data("kendoExtNumericTextBox").value("");
                    $("#rcvAmt").data("kendoExtNumericTextBox").value("");
                    $("#rcvRemark").val("");
                    $("#rcptTp1").html("");
                    $("#rcptNo1").html("");
                    $("#npayAmt1").html("");
                    $("#rcvAmt1").html("");
                    $("#rcvRemark1").html("");

                    $("#receive").show();
                    $("#refund").hide();
                    $("#btnRefund").show();

                    $("#receiveStart").show();
                    $("#receiveEnd").show();
                    $("#receiveConfirm").show();
                    $("#receiveCancel").show();
                    $("#refundConfirm").hide();

                    $("#rcvCpltDt").data("kendoExtMaskedDatePicker").value(sysDate);
                    $("#rcptDt").data("kendoExtMaskedDatePicker").value(sysDate);

                    if(dataItem.rcvStatCd == "F") {
                        $("#receiveStart").data("kendoButton").enable(false);
                        $("#receiveEnd").data("kendoButton").enable(false);
                        $("#receiveConfirm").data("kendoButton").enable(false);
                    } else {
                        $("#receiveStart").data("kendoButton").enable(true);
                        $("#receiveEnd").data("kendoButton").enable(true);
                        $("#receiveConfirm").data("kendoButton").enable(true);
                    }
                }
            }
        }
        ,height:360
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100//차량번호
                ,attributes:{"class":"ac"}
            }
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150//VIN
                ,attributes:{"class":"ac"}
            }
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80//차량소유자
                ,attributes:{"class":"ac"}
            }
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", width:120, attributes:{"class":"ac"}
            }//운전자
            ,{field:"rcvStatCd", title:"<spring:message code='ser.lbl.receiveStat' />", width:120, attributes:{"class":"ac"}
                ,template:"#=receiveCdGrid(rcvStatCd)#"
            }//수납상태
            ,{field:"calcDt", title:"<spring:message code='ser.lbl.calcConDt' />", width:120, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}//정산일자
             ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:120, attributes:{"class":"ac"}
            }//정비정산번호
            ,{field:"calcPrsnNm", title:"<spring:message code='ser.lbl.settlement' />", width:120, attributes:{"class":"ac"}
            }//정비정산자
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:120, attributes:{"class":"ac"}
            }//지불자
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:120, attributes:{"class":"ac"}
            }//
            ,{field:"rcvSubDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:120 }
        ]
    });

    $("#detailGrid").kendoExtGrid({
        gridId:"G-SER-1011-000080"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveDetails.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sRcvDocNo"] = $("#rcvDocNo").val();

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
                        ,paymTp:{type:"string"}
                    }
                }
            }
        }
        ,height:91
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(saveYn){
                e.sender.select(e.sender.tbody.find("tr")[row]);
            }
        }
        ,change:function(e) {

            var dataItem = this.dataItem(this.select());

            if(dataItem.rcvStatCd=="O"||dataItem.rcvStatCd==null||dataItem.rcvStatCd==""||dataItem.rcvStatCd=="C"){
                $("#npayChkDt").data("kendoExtMaskedDatePicker").value(sysDate);
                $("#rcvCpltDt").data("kendoExtMaskedDatePicker").value(sysDate);
                $("#rcptDt").data("kendoExtMaskedDatePicker").value(sysDate)
                $("#rcvCpltDt1").html(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));
                $("#rcptDt1").html(kendo.toString(kendo.parseDate(sysDate),"<dms:configValue code='dateFormat' /> HH:mm"));

                $("#rcptTp").data("kendoExtDropDownList").value("");
                $("#rcptNo").val("");
                if(dataItem.rcvAmt==null){
                    dataItem.rcvAmt = 0
                }
                if(dataItem.paymAmt==null){
                    dataItem.paymAmt = 0
                }

                var paymAmt = 0;
                if(dataItem.wonUnitCutAmt > 0 ){
                    paymAmt = dataItem.wonUnitCutAmt;
                } else if(dataItem.demicPointCutAmt > 0){
                    paymAmt = dataItem.wonUnitCutAmt;
                } else {
                    paymAmt = dataItem.paymAmt;
                }

                $("#npayAmt").data("kendoExtNumericTextBox").value(kendo.toString(Number(dataItem.paymAmt)-Number(dataItem.rcvAmt),'n'));
                $("#rcvAmt").data("kendoExtNumericTextBox").value(kendo.toString(dataItem.paymAmt,'n'));
                $("#rcvRemark").val("");
                $("#rcptTp1").html("");
                $("#rcptNo1").html("");
                $("#npayAmt1").html(kendo.toString(Number(dataItem.paymAmt)-Number(dataItem.rcvAmt),'n'));
                $("#rcvAmt1").html(kendo.toString(dataItem.paymAmt,'n'));
                $("#rcvRemark1").html("");
            }else{
                $("#rcptTp").data("kendoExtDropDownList").value(dataItem.rcptTp);
                $("#rcptNo").val(dataItem.rcptNo);
                if(dataItem.rcvAmt==null){
                    dataItem.rcvAmt = 0
                }
                if(dataItem.paymAmt==null){
                    dataItem.paymAmt = 0
                }

                $("#npayAmt").data("kendoExtNumericTextBox").value(Number(dataItem.paymAmt)-Number(dataItem.rcvAmt));
                $("#rcvAmt").data("kendoExtNumericTextBox").value(kendo.toString(dataItem.rcvAmt,'n'));
                $("#npayChkDt").data("kendoExtMaskedDatePicker").value(dataItem.npayChkDt);
                $("#rcvCpltDt").data("kendoExtMaskedDatePicker").value(dataItem.rcvCpltDt);
                $("#rcptDt").data("kendoExtMaskedDatePicker").value(dataItem.rcptDt)
                $("#rcvRemark").val(dataItem.rcvRemark);
                if(dataItem.rcptTp!=null&&dataItem.rcptTp!=""){
                $("#rcptTp1").html(rcptTpCdMap[dataItem.rcptTp].cmmCdNm);
                }else{
                $("#rcptTp1").html("");
                }
                $("#rcptNo1").html(dataItem.rcptNo);
                $("#npayAmt1").html(kendo.toString(Number(dataItem.paymAmt)-Number(dataItem.rcvAmt),'n'));
                $("#rcvAmt1").html(kendo.toString(dataItem.rcvAmt,'n'));
                $("#npayChkDt1").html(kendo.toString(kendo.parseDate(dataItem.npayChkDt),"<dms:configValue code='dateFormat' /> HH:mm"));
                $("#rcvCpltDt1").html(kendo.toString(kendo.parseDate(dataItem.rcvCpltDt),"<dms:configValue code='dateFormat' /> HH:mm"));
                $("#rcptDt1").html(kendo.toString(kendo.parseDate(dataItem.rcptDt),"<dms:configValue code='dateFormat' /> HH:mm"));
                $("#rcvRemark1").html(dataItem.rcvRemark);
            }
            $("#rcvSubDocNo").val(dataItem.rcvSubDocNo);
            $("#rcvSubDocNo2").val(dataItem.rcvSubDocNo);
            $("#rcvSubDocNo3").val(dataItem.rcvSubDocNo);
        }
        ,columns:[
            {field:"calcSubDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:150,hidden:true}          // 정산번호
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                    });
                }
            }          // 지불유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100}       // 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}       // 지불자
            ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90}       // 지불기한
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.arLbrAmt' />", width:90, attributes:{"class":"ar"}}       // 발생공임비
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.arItemAmt' />", width:90, attributes:{"class":"ar"}}       // 발생부품비
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.arOtherAmt' />", width:90, attributes:{"class":"ar"}}       // 발생기타비
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}}       // 발생금액
            ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:70
                ,template:"#=paymMthCdGrid(paymMthCd)#"
                ,editor:function(container, options){
                    $('<input required name="paymMthCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymMthCdList
                        ,optionLabel:"<spring:message code='global.btn.select' />"
                        ,index:0
                    });
                }
            }    // 지불방식
            ,{field:"rcptTp", title:"<spring:message code='ser.lbl.invoiceTp' />", width:80
                ,template:"#=rcptTpCdGrid(rcptTp)#"
                ,editor:function(container, options){
                    $('<input required name="rcptTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:rcptTpCdList
                        ,optionLabel:"<spring:message code='global.btn.select' />"
                        ,index:0
                    });
                }
            }//영수증유형
            ,{field:"preAmt", title:"<spring:message code='ser.lbl.preDoUseAmt' />", width:80, attributes:{"class":"ar"}
            }//선수금 금액 사용
            ,{field:"balAmt", title:"<spring:message code='ser.lbl.advance' />", width:80, attributes:{"class":"ar"}
            }//선불금금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSett' />", width:80, attributes:{"class":"ar"}
            }//정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.settClZero' />", width:80, attributes:{"class":"ar"}
            }//정산제로
            ,{field:"dcPerm", title:"<spring:message code='ser.lbl.dcAuthor' />", width:80, attributes:{"class":"ac"}
            }//할인권한
            ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90}    // 지불비고
        ]
    });
});


//버튼 - 수납확정
function updateReceive(stat) {
    var jsonData;
    saveYn = true;

    if(stat == "R"){
        jsonData = {

                "rcvDocNo":$("#rcvDocNo").val()
                ,"rcvSubDocNo":$("#rcvSubDocNo").val()
                ,"dlrCd":$("#dlrCd").val()
                ,"rcvStatCd":stat
                ,"refdAmt":$("#refdAmt").data("kendoExtNumericTextBox").value()
                ,"refdDt":$("#refdDt").data("kendoExtMaskedDatePicker").value()
                ,"refdPrsnNm":$("#refdPrsnNm").val()
                ,"refdRemark":$("#refdRemark").val()
                ,"rcvAmt":$("#rcvAmt").data("kendoExtNumericTextBox").value()
                ,"rcvCpltDt":$("#rcvCpltDt").data("kendoExtMaskedDatePicker").value()
                ,"npayAmt":$("#npayAmt").data("kendoExtNumericTextBox").value()
                ,"npayChkDt":$("#npayChkDt").data("kendoExtMaskedDatePicker").value()
                ,"rcptTp":$("#rcptTp").val()
                ,"rcptNo":$("#rcptNo").val()
                ,"rcptDt":$("#rcptDt").data("kendoExtMaskedDatePicker").value()
                ,"rcvRemark":$("#rcvRemark").val()
                }
    } else {
        /* if($("#rcvAmt").val()=="0"||$("#rcvAmt").val()==""){
            dms.notification.info("<spring:message code='par.lbl.dpstAmt' var='gisuAmt' /><spring:message code='global.info.required.field' arguments='${gisuAmt},' />");
            return;
         }
         if($("#disTrY").is(':hidden')&&stat!='C'){
            dms.notification.info("<spring:message code='ser.btn.receiveStart' var='receiveStart' /><spring:message code='global.info.clicked.btn' arguments='${receiveStart},' />");
            return;
         } */
         jsonData = {
                        "rcvAmt":$("#rcvAmt").data("kendoExtNumericTextBox").value()
                        ,"rcvCpltDt":$("#rcvCpltDt").data("kendoExtMaskedDatePicker").value()
                        ,"npayAmt":$("#npayAmt").data("kendoExtNumericTextBox").value()
                        //,"npayChkDt":$("#npayChkDt").data("kendoExtMaskedDatePicker").value()
                        ,"rcptTp":$("#rcptTp").val()
                        ,"rcptNo":$("#rcptNo").val()
                        ,"rcptDt":$("#rcptDt").data("kendoExtMaskedDatePicker").value()
                        ,"rcvRemark":$("#rcvRemark").val()
                        ,"rcvDocNo":$("#rcvDocNo").val()
                        ,"rcvSubDocNo":$("#rcvSubDocNo").val()
                        ,"dlrCd":$("#dlrCd").val()
                        ,"rcvStatCd":stat
                        }
         if(stat=='C'){
             jsonData = {
                        "rcvDocNo":$("#rcvDocNo").val()
                        ,"rcvSubDocNo":$("#rcvSubDocNo").val()
                        ,"dlrCd":$("#dlrCd").val()
                        ,"rcvStatCd":stat
                        ,"npayAmt":0
                        ,"rcvAmt":0
                        ,"rcptTp":""
                        ,"rcptNo":""
                        ,"rcvRemark":""
                        }
         }
    }

    var grid = $("#receiveGrid").data("kendoExtGrid");
    var rows = grid.select();
    var rowCnt = rows.length;

    if(rowCnt > 0){
        var rcvSaveList = [];
        $.each(rows, function(idx, row){
            rcvSaveList.push(grid.dataItem(row));
        });
    }

    var param = $.extend(
            {"serviceReceiveDetailVO":jsonData}
            ,{"servicePackageReceiveSaveVO":rcvSaveList}
         )

    $.ajax({
        url:"<c:url value='/ser/rcv/serviceReceive/multiServicePackageReceiveDetail.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {
             //$("#btnReset").click();
             $("#receiveGrid").data("kendoExtGrid").dataSource.read();
             //$("#detailGrid").data("kendoExtGrid").dataSource.read();
             $("#rcvSubDocNo2").val($("#rcvSubDocNo3").val());
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

</script>
<!-- //script -->

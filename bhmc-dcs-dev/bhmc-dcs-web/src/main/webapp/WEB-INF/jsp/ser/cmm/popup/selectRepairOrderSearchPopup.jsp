<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <input type="hidden" id="roDocNo" name="roDocNo">
    <input type="hidden" id="calcDocNo" name="calcDocNo">
    <input type="hidden" id="close" name="close" />
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.btn.searchCondition" /><!-- 조회조건 --></h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.dealer' /></th><!-- 딜러 -->
                    <td>
                        <input id="sDlrCd" name="sDlrCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.vsitr' /></th><!-- 방문자 -->
                    <td>
                        <input id="sDriverNm" name="sDriverNm" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.saNm' /></th><!-- SA -->
                    <td>
                        <input id="sSaNm" name="sSaNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- RO번호 -->
                    <td>
                        <input id="sRoDocNo" name="sRoDocNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.runDist' /></th><!-- 주행거리 -->
                    <td>
                        <input id="sRunDistVal" name="sRunDistVal" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt5">
        <div id="grid" class="grid"></div>
    </div>

    <div class="table_grid mt5">
        <div id="lbrGrid" class="grid"></div>
    </div>
    <div class="table_grid mt5">
        <div id="partGrid" class="grid"></div>
    </div>

    <div class="table_form table_form_info mt5">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:13%;">
                <col style="width:12%;">
                <col style="width:13%;">
                <col style="width:12%;">
                <col style="width:13%;">
                <col style="width:12%;">
                <col style="width:13%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="ser.lbl.calcCost" /></th><!--정산비용  -->
                    <th scope="col"><spring:message code="global.lbl.calcAmt" /></th><!--정산금액  -->
                    <th scope="col"><spring:message code="global.lbl.dcRate" /></th><!--할인율  -->
                    <th scope="col"><spring:message code="global.lbl.dcAmt" /></th><!--할인금액  -->
                    <th scope="col">BM<spring:message code="ser.lbl.pointUseAmt" /></th><!--BM포인트사용금액  -->
                    <th scope="col"><spring:message code="ser.lbl.pointUseAmt" /></th><!--포인트사용금액  -->
                    <th scope="col"><spring:message code="ser.lbl.etcSaleAmt" /></th><!--기타혜택금액  -->
                    <th scope="col"><spring:message code="ser.lbl.finalCalcAmt" /></th><!--최종정산금액  -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.lbrSubAmt" /></th><!--공임비소계  -->
                    <td class="ar"><span id="lbrCalcAmt"></span></td>
                    <td class="ar"><span id="lbrDcRate"></span></td>
                    <td class="ar"><span id="lbrDcAmt"></span></td>
                    <td class="ar"><span id="lbrBmPointUseAmt"></span></td>
                    <td class="ar"><span id="lbrPointUseAmt"></span></td>
                    <td class="ar"><span id="lbrEtcDcAmt"></span></td>
                    <td class="ar"><span id="lbrCalcSumAmt"></span></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.parSubCamt" /></th><!--부품비소계  -->
                    <td class="ar"><span id="parCalcAmt"></span></td>
                    <td class="ar"><span id="parDcRate"></span></td>
                    <td class="ar"><span id="parDcAmt"></span></td>
                    <td class="ar"><span id="parBmPointUseAmt"></span></td>
                    <td class="ar"><span id="parPointUseAmt"></span></td>
                    <td class="ar"><span id="parEtcDcAmt"></span></td>
                    <td class="ar"><span id="parCalcSumAmt"></span></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.etcSubAmt" /></th><!--기타비용소계  -->
                    <td class="ar"><span id="etcCalcAmt"></span></td>
                    <td class="ar"><span id="etcDcRate"></span></td>
                    <td class="ar"><span id="etcDcAmt"></span></td>
                    <td class="ar"><span id="etcBmPointUseAmt"></span></td>
                    <td class="ar"><span id="etcPointUseAmt"></span></td>
                    <td class="ar"><span id="etcOtherDcAmt"></span></td>
                    <td class="ar"><span id="etcCalcSumAmt"></span></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.serTotAmt" /></th><!--서비스총계  -->
                    <td class="ar"><span id="calcTotAmt"></span></td>
                    <td class="ar"><span id="dcTotRate"></span></td>
                    <td class="ar"><span id="dcTotAmt"></span></td>
                    <td class="ar"><span id="bmPointTotAmt"></span></td>
                    <td class="ar"><span id="pointTotAmt"></span></td>
                    <td class="ar"><span id="etcTotAmt"></span></td>
                    <td class="ar"><span id="lastCalcTotAmt"></span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt5">
        <div id="calcGrid" class="grid"></div>
    </div>

<div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:90%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.roRemark" /><!-- 서비스건의비고 --></th>
                    <td>
                        <input type="text" id="roRemark" name="roRemark" class="form_input form_readonly" readonly>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.CalcRemark" /><!-- 서비스정산비고 --></th>
                    <td>
                        <input type="text" id="calcRemark" name="calcRemark" class="form_input form_readonly" readonly>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<script type="text/javascript">

    //공통코드:RO유형
    var roTpCdList = [];
    <c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>
    var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

    //영수증유형 Array
    var rcptTpCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${rcptTpCdList}">
    rcptTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //영수증유형 Map
    var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });

    //공통코드:결제유형
    var paymTpCdList = [];
    <c:forEach var="obj" items="${paymTpCdList}">
    paymTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>
    var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});

    $(document).ready(function() {


        /**
         * 팝업 옵션
         */
         var options = parent.repairOrderSearchPopup.options.content.data;

         $("#close").val( (options.close == undefined || options.close == "") ? "N":options.close  );

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows.length == 0 ){
                    dms.notification.warning("<spring:message code='global.info.required.select' />");
                    return;
                }

                if(rows != null){

                    var data = [];

                    $.each( rows  , function(idx , obj){
                        data.push(grid.dataItem(obj));
                    });

                    options.callbackFunc(data);

                    if($("#close").val() == "Y")parent.repairOrderSearchPopup.close();

                }
            }
        });

        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var dlrCd;
                            if($("#othDlrHis").checked){
                                dlrCd = "";
                            } else {
                                dlrCd = $("sDlrCd").val();
                            }
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sSaNm"] = $("#sSaNm").val();
                            params["sVinNo"] = $("#sVinNo").val();
                            params["sRoDocNo"] = $("#sRoDocNo").val();
                            params["sRunDistVal"] = $("#sRunDistVal").val();
                            params["sDriverNm"] = $("#sDriverNm").val();
                            params["dlrCd"] = dlrCd;
                            params["roStatCd"] = options.roStatCd;

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
                            ,roDocNo:{type:"string", editable:false}
                            ,roDt:{type:"date"}
                        }
                    }
                }
            }
            ,height:111
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,change:function(e){
                if(!e.sender.dataItem(e.sender.select()).isNew()){

                    var selectedVal = this.dataItem(this.select());
                    var roDocNo = selectedVal.roDocNo;
                    $("#roDocNo").val(roDocNo);
                    $("#roRemark").val(selectedVal.roRemark);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#partGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.read();
                    $("#partGrid").data("kendoExtGrid").dataSource.read();

                    $.ajax({
                        url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveByKey.do' />"
                        ,data:JSON.stringify({"sRoDocNo":roDocNo})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            $("#lbrCalcAmt").html("");
                            $("#lbrDcRate").html("");
                            $("#lbrDcAmt").html("");
                            $("#lbrBmPointUseAmt").html("");
                            $("#lbrPointUseAmt").html("");
                            $("#lbrEtcDcAmt").html("");
                            $("#parCalcAmt").html("");
                            $("#parDcRate").html("");
                            $("#parDcAmt").html("");
                            $("#parBmPointUseAmt").html("");
                            $("#parPointUseAmt").html("");
                            $("#parEtcDcAmt").html("");
                            $("#etcCalcAmt").html("");
                            $("#etcDcRate").html("");
                            $("#etcDcAmt").html("");
                            $("#etcBmPointUseAmt").html("");
                            $("#etcPointUseAmt").html("");
                            $("#etcOtherDcAmt").html("");
                            $("#calcTotAmt").html("");
                            $("#dcTotRate").html("");
                            $("#dcTotAmt").html("");
                            $("#bmPointTotAmt").html("");
                            $("#pointTotAmt").html("");
                            $("#etcTotAmt").html("");
                            $("#calcRemark").val("");
                        }
                        ,success:function(dataItem, textStatus) {

                            $("#lbrCalcAmt").html(dataItem.lbrCalcAmt);
                            $("#lbrDcRate").html(dataItem.lbrDcRate);
                            $("#lbrDcAmt").html(dataItem.lbrDcAmt);
                            $("#lbrBmPointUseAmt").html(dataItem.lbrBmPointUseAmt);
                            $("#lbrPointUseAmt").html(dataItem.lbrPointUseAmt);
                            $("#lbrEtcDcAmt").html(dataItem.lbrEtcDcAmt);
                            $("#parCalcAmt").html(dataItem.parCalcAmt);
                            $("#parDcRate").html(dataItem.parDcRate);
                            $("#parDcAmt").html(dataItem.parDcAmt);
                            $("#parBmPointUseAmt").html(dataItem.parBmPointUseAmt);
                            $("#parPointUseAmt").html(dataItem.parPointUseAmt);
                            $("#parEtcDcAmt").html(dataItem.parEtcDcAmt);
                            $("#etcCalcAmt").html(dataItem.etcCalcAmt);
                            $("#etcDcRate").html(dataItem.etcDcRate);
                            $("#etcDcAmt").html(dataItem.etcDcAmt);
                            $("#etcBmPointUseAmt").html(dataItem.etcBmPointUseAmt);
                            $("#etcPointUseAmt").html(dataItem.etcPointUseAmt);
                            $("#etcOtherDcAmt").html(dataItem.etcOtherDcAmt);
                            $("#calcTotAmt").html(dataItem.calcTotAmt);
                            $("#dcTotRate").html(dataItem.dcTotRate);
                            $("#dcTotAmt").html(dataItem.dcTotAmt);
                            $("#bmPointTotAmt").html(dataItem.bmPointTotAmt);
                            $("#pointTotAmt").html(dataItem.pointTotAmt);
                            $("#etcTotAmt").html(dataItem.etcTotAmt);
                            $("#calcDocNo").val(dataItem.calcDocNo);
                            $("#calcRemark").val(dataItem.calcRemark);
                            $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#calcGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });
                };
            }
            ,columns:[
                {field:"dlrCd", title:"<spring:message code='ser.lbl.dealer' />", width:100}                       // 딜러
                ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                       // VIN
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 차량소유주
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:70}                 // 주행거리
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:150}                   // RO번호
                ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}} // RO확인시간
                ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                    ,template:"#=roTpCdGrid(roTp)#"
                    ,editor:function(container, options){
                        $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:roTpCdList
                        });
                    }
                }                                // RO유형
                ,{field:"regUsrId", title:"<spring:message code='ser.lbl.roUser' />", width:100}                            // RO발행자
            ]
        });

        // 정비 그리드
        $("#lbrGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderLabors.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sRoDocNo"] = $("#roDocNo").val();

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
                            ,roTp:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,lbrCd:{type:"string", editable:false}
                            ,lbrNm:{type:"string", editable:false}
                            ,lbrTp:{type:"string", editable:false}
                            ,lbrPrc:{type:"number"}
                            ,expcLbrAmt:{type:"number"}
                        }
                    }
                }
            }
            ,height:91
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,sortable:false
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}                              // 정비코드
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:300}                             // 정비항목
                ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:70, attributes:{"class":"ar"}}   // 정비공임
                ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80}                              // 정비유형
                ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"}      // 공임단가
                ,{field:"dcAmt", title:"<spring:message code='serv.lbl.dcAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"}         // 할인금액
                ,{field:"expcLbrAmt", title:"<spring:message code='ser.lbl.preLbrAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"}  // 예정공임비
            ]
        });

        // 부품 그리드
        $("#partGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderParts.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sRoDocNo"] = $("#roDocNo").val();

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
                            roTp:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,itemCd:{type:"string", editable:false}
                            ,itemNm:{type:"string", editable:false, validation:{required:true}}
                            ,itemPrc:{type:"number", editable:false}
                            ,itemQty:{type:"number"}
                        }
                    }
                }
            }
            ,height:91
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,sortable:false
            ,columns:[
                {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                 // 부품번호
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300}                                // 부품명
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}    // 부품수량
                ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:80}                             // 계산단위
                ,{field:"giTp", title:"<spring:message code='ser.lbl.giTp' />", width:80}                                 // 출고유형
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n0}"}  // 부품단가
                ,{field:"expcParAmt", title:"<spring:message code='ser.lbl.preParAmt' />", width:80, attributes:{"class":"ar"} ,format:"{0:n0}"}                     // 예정부품대
            ]
        });

        $("#calcGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cal/calculate/selectCalculateDetails.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sCalcDocNo"] = $("#calcDocNo").val();

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
            ,columns:[
                {field:"calcSubDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:150}          // 정산번호
                ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}       // 지불자
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
                ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90}       // 지불기한
                ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:70}    // 지불방식
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:70, attributes:{"class":"ar"}}          // 발생금액
                ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:70, attributes:{"class":"ar"}}    // 미수금액
                ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90, attributes:{"class":"ar"}}    // 지불비고
            ]
        });

        // RO유형
        roTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(roTpCdArr[val] != undefined)
                returnVal = roTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        //수납 구분
        receiveCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(receiveCdMap[val] != undefined)
                returnVal = receiveCdMap[val].cmmCdNm;
            }
            return returnVal;
        }

        //결제유형
        paymTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(paymTpCdArr[val] != undefined)
                returnVal = paymTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }
    });
</script>
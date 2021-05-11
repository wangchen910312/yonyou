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
            <button type="button" id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

        <form id="roHistoryForm">
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                    <col style="width:8%;">
                    <col style="width:24%;">
                    <col style="width:8%;">
                    <col style="width:24%;">
                    <col style="width:8%;">
                    <col style="width:24%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.vinNo' /></span></th><!-- VIN -->
                        <td class="readonly_area" >
                            <input type="text" id="sVinNo" name="sVinNo" readonly class="form_input upper" data-name="<spring:message code="ser.lbl.vinNo" />" required />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- ro일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRoFromDt" class="form_datepicker ac"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRoToDt" class="form_datepicker ac"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th>
                        <td>
                            <input id="sLbrCd" name="sLbrCd" type="text" class="form_input"/> <!-- 공임코드 -->
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.lbrNm' /></th>
                        <td >
                            <input id="sLbrNm" name="sLbrNm" type="text" class="form_input"/> <!-- 공임명 -->
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <input id="sItemCd" class="form_input">
                        </td>

                      <!--   <th scope="row"></th>
                        <td></td> -->
                    </tr>

                </tbody>
                </table>
            </div>
            <input type="hidden" id="sDlrCd" name="sDlrCd" class="form_input"/>
        </form>
        <div class="table_grid mt5">
            <div id="grid" class="grid"></div>
        </div>

        <div id="tabstrip1" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                <li class="k-state-active"><spring:message code="ser.lbl.lbr" /><!-- 공임 --></li>
                <li><spring:message code="ser.lbl.item" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                <li><spring:message code='ser.lbl.calcCost' /><!-- 정산비용 --></li>
            </ul>
            <!-- //탭메뉴 -->


            <!-- 고객요청사항 & 고장설명 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp">
                <c:param name="gubun" value="P"></c:param>
            </c:import>

            <!-- //고객요청사항 & 고장설명 -->

            <!-- 공임 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- //공임 -->

            <!-- 부품 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="partGrid" class="grid"></div>
                </div>
            </div>
            <!-- //부품 -->

            <!-- 기타 -->
             <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->

            <div style="min-height:205px;">
                <!-- 정산비용 -->
                <div class="table_form table_form_info">
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
                                <th scope="col"><spring:message code="ser.lbl.calcAmt" /></th><!--정산금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dcRate" /></th><!--할인율  -->
                                <th scope="col"><spring:message code="ser.lbl.dcAmt" /></th><!--할인금액  -->
                                <th scope="col"><spring:message code="ser.lbl.bmPointUseAmt" /></th><!--BM포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.pointUseAmt" /></th><!--포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.etcSaleAmt" /></th><!--기타혜택금액  -->
                                <th scope="col"><spring:message code="ser.lbl.finalCalcAmt" /></th><!--최종정산금액  -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcLbrSubAmt" /></th><!--공임비소계  -->
                                <td class="ar" id="lbrCalcAmt"></td>
                                <td class="ar" id="lbrDcRate"></td>
                                <td class="ar" id="lbrDcAmt"></td>
                                <td class="ar" id="lbrBmPointUseAmt"></td>
                                <td class="ar" id="lbrPointUseAmt"></td>
                                <td class="ar" id="lbrEtcDcAmt"></td>
                                <td class="ar" id="lbrCalcSumAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcParSubCamt" /></th><!--부품비소계  -->
                                <td class="ar" id="parCalcAmt"></td>
                                <td class="ar" id="parDcRate"></td>
                                <td class="ar" id="parDcAmt"></td>
                                <td class="ar" id="parBmPointUseAmt"></td>
                                <td class="ar" id="parPointUseAmt"></td>
                                <td class="ar" id="parEtcDcAmt"></td>
                                <td class="ar" id="parCalcSumAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcEtcSubAmt" /></th><!--기타비용소계  -->
                                <td class="ar" id="etcCalcAmt"></td>
                                <td class="ar" id="etcDcRate"></td>
                                <td class="ar" id="etcDcAmt"></td>
                                <td class="ar" id="etcBmPointUseAmt"></td>
                                <td class="ar" id="etcPointUseAmt"></td>
                                <td class="ar" id="etcOtherDcAmt"></td>
                                <td class="ar" id="etcCalcSumAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcSerTotAmt" /></th><!--서비스총계  -->
                                <td class="ar" id="calcTotAmt"></td>
                                <td class="ar" id="dcTotRate"></td>
                                <td class="ar" id="dcTotAmt"></td>
                                <td class="ar" id="bmPointTotAmt"></td>
                                <td class="ar" id="pointTotAmt"></td>
                                <td class="ar" id="etcTotAmt"></td>
                                <td class="ar" id="lastCalcTotAmt"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt5">
                    <div id="calcGrid" class="grid"></div>
                </div>
            </div>
            <!-- //정산비용 -->
        </div>

        <div class="table_form mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:40%;">
                    <col style="width:10%;">
                    <col style="width:40%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roRemark" /><!-- 서비스건의비고 --></th>
                        <td>
                            <input type="text" id="roRemark" name="roRemark" class="form_input form_readonly" readonly>
                        </td>
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
    roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

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


    //공통코드:정비유형(수리유형)
    var lbrTpCdList = [];
    <c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});

    // RO유형
    roTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(roTpCdArr[val] != undefined)
                returnVal = roTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

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

    setLbrTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(lbrTpCdArr[value] != undefined)
            resultVal =  lbrTpCdArr[value].cmmCdNm;
        }
        return resultVal;
    };

    $(document).ready(function() {

        $("#tabstrip,#tabstrip1,#tabstrip2").kendoExtTabStrip({
            animation:false
        });

        /**
         * 팝업 옵션
         */
         var options = parent.repairOrderSearchPopup.options.content.data;

         $("#sVinNo").val(options.vinNo);
         $("#close").val( (options.close == undefined || options.close == "") ? "N":options.close  );

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){

                var validator = $("#roHistoryForm").kendoExtValidator().data("kendoExtValidator");
                if (validator.validate()) {
                    $("#grid").data("kendoExtGrid").dataSource.data([]);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#partGrid").data("kendoExtGrid").dataSource.data([]);

                    $("#grid").data("kendoExtGrid").dataSource.read();
                 }
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

        /**주행거리**/
        $("#sRunDistFromVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        /**주행거리**/
        $("#sRunDistToVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // RO일자
        $("#sRoFromDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // RO일자
        $("#sRoToDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 정산From일자
        $("#sCalcFromDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 정산TO일자
        $("#sCalcToDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000028"
            ,dataSource:{
                transport:{
                    read:{
                       // url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersHistory.do' />"
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


                            params["sVinNo"] = $("#sVinNo").val();
                            params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();

                            params["sLbrCd"] = $("#sLbrCd").val();
                            params["sLbrNm"] = $("#sLbrNm").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();

                            /*
                            params["sSaNm"] = $("#sSaNm").val();

                            params["sRoDocNo"] = $("#sRoDocNo").val();
                            params["sRunDistFromVal"] = $("#sRunDistFromVal").val();
                            params["sRunDistToVal"] = $("#sRunDistToVal").val();
                            params["sDriverNm"] = $("#sDriverNm").val();
                            params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoToDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();

                            params["dlrCd"] = dlrCd;
                            params["sRoStatCd"] = $("#sRoStatCd").val();
                      */
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
            ,height:150
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,change:function(e){
              //  if(!e.sender.dataItem(e.sender.select()).isNew()){

                    var selectedVal = this.dataItem(this.select());
                    var roDocNo = selectedVal.roDocNo;
                    $("#roDocNo").val(roDocNo);
                    $("#roRemark").val(selectedVal.roRemark);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#partGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.read();
                    $("#partGrid").data("kendoExtGrid").dataSource.read();

                    trobleDescInfo(roDocNo, "RO");
                    etcIssueSet(roDocNo, "RO");  // 기타사항

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
              //  };
            }
            ,columns:[
                {field:"dlrCd", title:"<spring:message code='ser.lbl.dealer' />", width:100}                       // 딜러
                ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:70
                    ,attributes :{"class":"ar"}
                    ,format:"{0:n0}"
                } // 주행거리
                ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis'/>", width:70
                    ,attributes :{"class":"ar"}
                    ,format:"{0:n0}"
                } // 누적주행거리
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:150}                   // RO번호
                ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                    ,attributes :{"class":"ac"}
                    ,template:"#=roTpCdGrid(roTp)#"
                    }
                ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}} // RO확인시간
            ]
        });

        // 정비 그리드
        $("#lbrGrid").kendoExtGrid({
            gridId:"G-SER-1011-000029"
            ,dataSource:{
                transport:{
                    read:{
                      //  url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do' />"
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLaborsHist.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sPreFixId"] = "RO";
                            params["sDocNo"] = $("#roDocNo").val();

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
            ,height:180
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,sortable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:false
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:80}                              // 정비코드
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250}                             // 정비항목
                ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80
                        ,template:"#= setLbrTpMap(lbrTp)#"
                        ,attributes:{"class":"ac"}
                    }                              // 정비유형
                ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:60, attributes:{"class":"ar"}}   // 정비공임
                ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:60, attributes:{"class":"ar"} ,format:"{0:n0}" }// 정비수량
                ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}      // 공임단가
                ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}  // 예정공임비
                ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}         // 할인율
                ,{field:"dcAmt", title:"<spring:message code='serv.lbl.dcAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}         // 할인금액
            ]
        });

        // 부품 그리드
        $("#partGrid").kendoExtGrid({
            gridId:"G-SER-1011-000030"
            ,dataSource:{
                transport:{
                    read:{
                      //  url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do' />"
                        url:"<c:url value='/ser/cmm/tabInfo/selectServicePartsHist.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sPreFixId"] = "RO";
                            params["sDocNo"] = $("#roDocNo").val();

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
            ,height:180
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,sortable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:false
            ,columns:[
                {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                 // 부품번호
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300}                                // 부품명
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}    // 부품수량
                ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:80, attributes:{"class":"ac"}}                             // 계산단위
                ,{field:"giTp", title:"<spring:message code='ser.lbl.giTp' />", width:80}                                 // 출고유형
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}  // 부품단가
                ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParAmt' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}                     // 예정부품대
            ]
        });

        $("#calcGrid").kendoExtGrid({
            gridId:"G-SER-1011-000031"
            ,dataSource:{
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
            ,height:75
            ,pageable:false
            ,autoBind:false
            ,sortable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                {field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
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
                ,{field:"", title:"<spring:message code='ser.lbl.payerCd' />", width:100}             // 지불자
                ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}      // 지불자
                ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90}      // 지불기한
                ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:70}   // 지불방식
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:70, attributes:{"class":"ar"},format:"{0:n2}"}          // 발생금액
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"},format:"{0:n2}"}    // 실금액
                ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:70, attributes:{"class":"ar"},format:"{0:n2}"}    // 미수금액
            ]
        });

        if(options.autoBind && dms.string.isNotEmpty($("#sVinNo").val())){
           // $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //var onlyNumAlpha = new RegExp("[^A-Z0-9]");
        $(".upper").bind("keyup", function(){
            $(this).val($(this).val().toUpperCase());
        });

    });
    $(".btn_right_absolute").hide();
    $(".form_search a").hide();
</script>

<style>
.uppercase
 {
  text-transform:uppercase;
 }
 </style>
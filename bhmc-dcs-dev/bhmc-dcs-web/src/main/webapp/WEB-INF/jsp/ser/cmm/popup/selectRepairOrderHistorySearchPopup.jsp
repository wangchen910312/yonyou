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
        </div>
    </div>

    <form id="roHistoryForm">
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                <col style="width:10%;">
                <col style="width:22%;">
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.vinNo' /></span></th><!-- VIN -->
                    <td class="readonly_area">
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
<%--                 <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li> --%>
<%--                 <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li> --%>
                <li class="k-state-active"><spring:message code="ser.lbl.lbr" /><!-- 공임 --></li>
                <li><spring:message code="ser.lbl.item" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
                <li><spring:message code='ser.lbl.calcCost' /><!-- 정산비용 --></li>
            </ul>
            <!-- //탭메뉴 -->


            <!-- 고객요청사항 & 고장설명 -->
<%--             <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp"> --%>
<%--                 <c:param name="gubun" value="S"></c:param> --%>
<%--             </c:import> --%>

            <!-- //고객요청사항 & 고장설명 -->

            <!-- 공임 -->
            <div style="min-height:238px;">
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- //공임 -->

            <!-- 부품 -->
            <div style="min-height:238px;">
                <div class="table_grid">
                    <div id="partGrid" class="grid"></div>
                </div>
            </div>
            <!-- //부품 -->

            <!-- 기타 -->
             <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->

            <div style="min-height:238px;">
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
                                <th scope="col"><spring:message code="global.lbl.calcAmt" /></th><!--정산금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dcRate" /></th><!--할인율  -->
                                <th scope="col"><spring:message code="ser.lbl.dcAmt" /></th><!--할인금액  -->
                                <th scope="col">BM<spring:message code="ser.lbl.pointUseAmt" /></th><!--BM포인트사용금액  -->
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
    </div>
</div>
</section>

<script type="text/javascript">

    var sDlrCd = "${dlrCd}";

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

    //공통코드:결제기간
    var paymPridCdList = [];
    <c:forEach var="obj" items="${paymPridCdList}">
    paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd;});

    //지불방식 Array
    var paymMthCdList = [];
    <c:forEach var="obj" items="${paymMthCdList}">
    paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //지불방식 Map
    var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

    //공통코드:정비유형(수리유형)
    var lbrTpCdList = [];
    <c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});

    $(document).ready(function() {

        setLbrTpMap = function(value){
            var resultVal = "";
            if( dms.string.strNvl(value) != ""){
                if(lbrTpCdArr[value] != undefined)
                resultVal =  lbrTpCdArr[value].cmmCdNm;
            }
            return resultVal;
        };


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

        initCalData = function(){
            $("#lbrCalcAmt").html("");
            $("#lbrDcRate").html("");
            $("#lbrDcAmt").html("");
            $("#lbrBmPointUseAmt").html("");
            $("#lbrPointUseAmt").html("");
            $("#lbrEtcDcAmt").html("");
            $("#lbrCalcSumAmt").html("");

            $("#parCalcAmt").html("");
            $("#parDcRate").html("");
            $("#parDcAmt").html("");
            $("#parBmPointUseAmt").html("");
            $("#parPointUseAmt").html("");
            $("#parEtcDcAmt").html("");
            $("#parCalcSumAmt").html("");

            $("#etcCalcAmt").html("");
            $("#etcDcRate").html("");
            $("#etcDcAmt").html("");
            $("#etcBmPointUseAmt").html("");
            $("#etcPointUseAmt").html("");
            $("#etcOtherDcAmt").html("");
            $("#etcCalcSumAmt").html("");

            $("#calcTotAmt").html("");
            $("#dcTotRate").html("");
            $("#dcTotAmt").html("");
            $("#bmPointTotAmt").html("");
            $("#pointTotAmt").html("");
            $("#etcTotAmt").html("");
            $("#lastCalcTotAmt").html("");

            $("#calcRemark").val("");
            $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
        }

        $("#grid").kendoExtGrid({
            gridId:"G-SER-0903-155001"
            ,dataSource:{
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


                            params["sVinNo"] = $("#sVinNo").val();
                            params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();

                            params["sLbrCd"] = $("#sLbrCd").val();
                            params["sLbrNm"] = $("#sLbrNm").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();

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
            ,height:200
            ,pageable:false
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,change:function(e){

                    var selectedVal = this.dataItem(this.select());
                    var roDocNo = selectedVal.roDocNo;
                    var dlrCd = selectedVal.dlrCd;
                    $("#roDocNo").val(roDocNo);
                    $("#sDlrCd").val(selectedVal.dlrCd);
                    $("#roRemark").val(selectedVal.roRemark);
                    $("#calcRemark").val(selectedVal.calcRemark);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.read();
                    $("#partGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#partGrid").data("kendoExtGrid").dataSource.read();

                    //trobleDescInfo(roDocNo, "RO");
                    etcIssueSet(roDocNo, "RO");  // 기타사항

                    $.ajax({
                        url:"<c:url value='/ser/cal/calculate/selectCalculateByKey.do' />"
                        ,data:JSON.stringify({"sRoDocNo":roDocNo, "sDlrCd":dlrCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            initCalData();
                        }
                        ,success:function(dataItem, textStatus) {

                            $("#lbrCalcAmt").html(dataItem.lbrCalcAmt);
                            $("#lbrDcRate").html(dataItem.lbrDcRate);
                            $("#lbrDcAmt").html(dataItem.lbrDcAmt);
                            $("#lbrBmPointUseAmt").html(dataItem.lbrBmPointUseAmt);
                            $("#lbrPointUseAmt").html(dataItem.lbrPointUseAmt);
                            $("#lbrEtcDcAmt").html(dataItem.lbrEtcDcAmt);
                            $("#lbrCalcSumAmt").html(dataItem.lbrCalcSumAmt);

                            $("#parCalcAmt").html(dataItem.parCalcAmt);
                            $("#parDcRate").html(dataItem.parDcRate);
                            $("#parDcAmt").html(dataItem.parDcAmt);
                            $("#parBmPointUseAmt").html(dataItem.parBmPointUseAmt);
                            $("#parPointUseAmt").html(dataItem.parPointUseAmt);
                            $("#parEtcDcAmt").html(dataItem.parEtcDcAmt);
                            $("#parCalcSumAmt").html(dataItem.parCalcSumAmt);

                            $("#etcCalcAmt").html(dataItem.etcCalcAmt);
                            $("#etcDcRate").html(dataItem.etcDcRate);
                            $("#etcDcAmt").html(dataItem.etcDcAmt);
                            $("#etcBmPointUseAmt").html(dataItem.etcBmPointUseAmt);
                            $("#etcPointUseAmt").html(dataItem.etcPointUseAmt);
                            $("#etcOtherDcAmt").html(dataItem.etcOtherDcAmt);
                            $("#etcCalcSumAmt").html(dataItem.etcCalcSumAmt);

                            $("#calcTotAmt").html(dataItem.calcTotAmt);
                            $("#dcTotRate").html(dataItem.dcTotRate);
                            $("#dcTotAmt").html(dataItem.dcTotAmt);
                            $("#bmPointTotAmt").html(dataItem.bmPointTotAmt);
                            $("#pointTotAmt").html(dataItem.pointTotAmt);
                            $("#etcTotAmt").html(dataItem.etcTotAmt);
                            $("#lastCalcTotAmt").html(dataItem.lastCalcTotAmt);

                            $("#calcDocNo").val(dataItem.calcDocNo);
                            $("#calcRemark").val(dataItem.calcRemark);

                            $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#calcGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });
            }
            ,columns:[
                {field:"dlrCd", title:"<spring:message code='ser.lbl.dealer' />", width:100}                       // 딜러
                ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:90
                    ,attributes :{"class":"ar"}
                    ,format:"{0:n0}"
                } // 주행거리
                ,{field:"giRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal'/>", width:90
                    ,attributes :{"class":"ar"}
                    ,format:"{0:n0}"
                } // 누적주행거리
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}                   // RO번호
                ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                    ,attributes :{"class":"ac"}
                    ,template:"#=roTpCdGrid(roTp)#"
                    }
                ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}} // RO확인시간
            ]
        });

        // 정비 그리드
        $("#lbrGrid").kendoExtGrid({
            gridId:"G-SER-0903-155002"
            ,dataSource:{
                transport:{
                    read:{
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
                            params["sDlrCd"] = $("#sDlrCd").val();

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
                ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:50, attributes:{"class":"ar"} ,format:"{0:n0}" }// 정비수량
                ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:75, attributes:{"class":"ar"}, format:"{0:n2}"}      // 공임단가
                ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:75, attributes:{"class":"ar"}, format:"{0:n2}"}  // 예정공임비
                ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:75, attributes:{"class":"ar"}, format:"{0:n2}"}         // 할인율
                ,{field:"dcAmt", title:"<spring:message code='serv.lbl.dcAmt' />", width:75, attributes:{"class":"ar"}, format:"{0:n2}"}         // 할인금액
            ]
        });

        // 부품 그리드
        $("#partGrid").kendoExtGrid({
            gridId:"G-SER-0903-155003"
            ,dataSource:{
                transport:{
                    read:{
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
                            params["sDlrCd"] = $("#sDlrCd").val();

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

        // 정산비용 그리드
        $("#calcGrid").kendoExtGrid({
            gridId:"G-SER-0903-155004"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceives.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sCalcDocNo"] = $("#calcDocNo").val();
                            params["sRoDocNo"] = $("#roDocNo").val();
                            params["sDlrCd"] = $("#sDlrCd").val();

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
                            ,paymCd:{type:"string"}
                            ,paymUsrNm:{type:"string"}
                            ,paymPrid:{type:"string"}
                            ,calcAmt:{type:"number"}
                            ,wonUnitCutAmt:{type:"number"}
                            ,demicPointCutAmt:{type:"number"}
                            ,paymAmt:{type:"number"}
                            ,paymRemark:{type:"string"}
                        }
                    }
                }
            }
            ,height:95
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,sortable:false
            ,selectable:"row"
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:false
            ,resizable:false                // 필터링 기능 사용안함
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
                ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100}       // 지불자코드
                ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}      // 지불자
                ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90
                    ,template:"#=paymPridCdGrid(paymPrid)#"
                    ,editor:function(container, options){
                        $('<input required name="paymPrid" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:paymPridCdList
                        });
                    }
                }   // 지불기한
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
                        });
                    }
                }   // 수납방식
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:70
                    , attributes:{"class":"ar"},format:"{0:n2}"}  // 수납금액
                ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90
                    , attributes:{"class":"ar"},format:"{0:n2}"}  // 실수금액
                ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:70
                    , attributes:{"class":"ar"},format:"{0:n2}"}  // 미수금액
            ]
        });

        // RO유형
        roTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = roTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        //수납 구분
        receiveCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = receiveCdMap[val].cmmCdNm;
            }
            return returnVal;
        }

        //결제유형
        paymTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = paymTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        //결제기간
        paymPridCdGrid = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             if(paymPridCdArr[val] != undefined)
             returnVal = paymPridCdArr[val].cmmCdNm;
         }
         return returnVal;
        };

        //지불방식
        paymMthCdGrid = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             if(paymMthCdMap[val] != undefined)
             returnVal = paymMthCdMap[val].cmmCdNm;
         }
         return returnVal;
        };

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
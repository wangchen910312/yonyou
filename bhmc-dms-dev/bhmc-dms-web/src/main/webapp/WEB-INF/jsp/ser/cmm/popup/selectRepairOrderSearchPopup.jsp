<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <input type="hidden" id="roDocNo" name="roDocNo">
    <input type="hidden" id="calcDocNo" name="calcDocNo">
    <input type="hidden" id="close" name="close" />
    <input type="hidden" id="listType" name="listType" />

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:22%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                    <td class="vinInfo">
                        <input type="text" id="sVinNo" name="sVinNo" class="form_input upper">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carRegNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" name="sCarRegNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 차량소유자 -->
                    <td>
                        <input id="sCarOwnerNm" name="sCarOwnerNm" class="form_input">
                    </td>
               </tr>
                <tr>
                   <%--  <th scope="row"><spring:message code='ser.lbl.tecNm' /></th><!-- 정비자 -->
                    <td>
                        <input id="sTecNm" name="sTecNm" class="form_input">
                    </td> --%>
                    <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th><!-- ro번호 -->
                    <td>
                        <input id="sRoDocNo" name="sRoDocNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- ro일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRoFromDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRoToDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.driver' /></th><!-- 운전자 -->
                    <td>
                        <input id="sDriverNm" name="sDriverNm" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.roTp' /></th><!-- 위탁유형 -->
                    <td>
                        <input id="sRoTp" name="sRoTp" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.item' /></th><!-- 부품항목 -->
                    <td>
                        <input id="" name="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.rpipProject' /></th><!-- 정비항목 -->
                    <td>
                        <input id="" name="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt5">
        <div id="grid" class="grid"></div>
    </div>

    <div id="tabstrip1" class="tab_area" style="display:none;">
        <!-- 탭메뉴 -->
        <ul>
            <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
            <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
            <li class="k-state-active"><spring:message code="ser.lbl.lbr" /><!-- 정비항목 --></li>
            <li><spring:message code="ser.lbl.part" /><!-- 부품수령 --></li>
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
                <col>
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
  var lbrTpCdList  = []; //기본 수리유형
  <c:forEach var="obj" items="${lbrTpCdList}">
      lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:forEach>
  var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});


    $(document).ready(function() {

        var sysdate = "${sysDate}";

        $("#tabstrip1,#tabstrip2").kendoExtTabStrip({
            animation:false
        });


        /**
         * 팝업 옵션
         */
         var parentData = parent.repairOrderSearchPopup.options.content.data;

         var isTablet = parent.isTablet;
         var _height = 0;

         if(isTablet){
             _height = 250;
         }else{
             _height = 359;
         }

         $("#listType").val(parentData.listType);
         $("#sVinNo").val(parentData.vinNo);
         $("#close").val( (parentData.close == undefined || parentData.close == "") ? "N":parentData.close  );

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){

                if( dms.string.isEmpty($("#sRoToDt").val()) || dms.string.isEmpty($("#sRoFromDt").val()) ){
                    dms.notification.warning("<spring:message code='ser.lbl.roDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                    return;
                }
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

                    parentData.callbackFunc(data);

                    if($("#close").val() == "Y")parent.repairOrderSearchPopup.close();

                }
            }
        });

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

       //RO 유형
        $("#sRoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roTpCdList
            ,optionLabel:" "
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
            ,value:"${sRoFromDt}"
        });

        // RO일자
        $("#sRoToDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"${sRoToDt}"
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
            gridId:"G-SER-1011-000032"
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row" // khs문제시 삭제
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                        //url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersHistory.do' />"
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

                            params["sDlrCd"]      = $("#sDlrCd").val();
                            params["sVinNo"]      = $("#sVinNo").val();
                            params["sCarRegNo"]   = $("#sCarRegNo").val();
                            params["sRoDocNo"]    = $("#sRoDocNo").val();
                            params["sTecNm"]      = $("#sTecNm").val();
                            params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                            params["sDriverNm"]   = $("#sDriverNm").val();
                            params["sRoFromDt"]   = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoToDt"]     = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                            params["sRoTp"]       = $("#sRoTp").val();
                            params["sListType"]   = $("#listType").val();

                            if(parentData.hasOwnProperty("pdiYn")){
                                params["sPdiYn"] = parentData.pdiYn;
                            }

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
            ,height:_height
            ,pageable:true
            ,autoBind:false
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,change:function(e){
/*
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
                 */
            }
            ,columns:[
                {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:110, attributes :{"class":"ar"}, format:"{0:n0}"}     //주행거리
                ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis'/>", width:110 ,attributes :{"class":"ar"}, format:"{0:n0}"} //누적주행거리
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}                    // RO번호
                ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", width:120}                   // 정산번호
                ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                    , template:"#=roTpCdGrid(roTp)#"
                    , attributes :{"class":"ac"}
                }
                ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}} // RO확인시간
                ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", width:100, attributes:{"class":"ac"}}   // RO상태
            ]
        });

        // 정비 그리드
        $("#lbrGrid").kendoExtGrid({
            gridId:"G-SER-1011-000033"
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row" // khs문제시 삭제
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do' />"
                       // url:"<c:url value='/ser/cmm/tabInfo/selectServiceLaborsHist.do' />"
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
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}                              // 정비코드
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200}                             // 정비항목
                ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80 , attributes:{"class":"ac"} , template:"#=lbrTpCdGrid(lbrTp)#" }                              // 정비유형
                ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:70, attributes:{"class":"ar"}}   // 수불공임
                ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:70, attributes:{"class":"ar"} ,format:"{0:n0}", hidden:true}  // 정비수량
                ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}           // 공임단가
                ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}       // 예정공임비
                ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}           // 할인율
                ,{field:"dcAmt", title:"<spring:message code='serv.lbl.dcAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}            // 할인금액
            ]
        });

        // 부품 그리드
        $("#partGrid").kendoExtGrid({
            gridId:"G-SER-1011-000034"
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row" // khs문제시 삭제
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do' />"
                      //  url:"<c:url value='/ser/cmm/tabInfo/selectServicePartsHist.do' />"
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
                            ,itemSalePrc:{type:"number", editable:false}
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
            ,columns:[
                {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                   // 부품번호
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200}                                  // 부품명
                ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:80, attributes :{"class":"ac"} }  // 계량단위
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}      // 부품수량
                ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}  // 부품단가
                ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }        // 부품금액
                ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}           // 할인율
                ,{field:"dcAmt", title:"<spring:message code='serv.lbl.dcAmt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}            // 할인금액
                ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParAmt' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}", hidden:true}   // 예정부품대
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"}, hidden:true}
            ]
        });

        $("#calcGrid").kendoExtGrid({
            gridId:"G-SER-1011-000035"
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
            ,height:81
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
                ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", attributes :{"class":"ac"} , width:70}   // 지불방식
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:70, attributes:{"class":"ar"}, format:"{0:n2}"}          // 발생금액
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}    // 실금액
                ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:70, attributes:{"class":"ar"}, format:"{0:n2}"}    // 미수금액
            ]
        });

        if(parentData.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

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


     // 정비유형(수리유형)
        lbrTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(lbrTpCdArr[val] != undefined)
                returnVal = lbrTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }


        //var onlyNumAlpha = new RegExp("[^A-Z0-9]");
        $(".upper").bind("keyup", function(){
            $(this).val($(this).val().toUpperCase());
        });

        if(parentData.listType == "RW") {
            $("#sVinNo").attr("readonly", true);
            $(".vinInfo").addClass("readonly_area");
            $("#btnSearch").click();
        }
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
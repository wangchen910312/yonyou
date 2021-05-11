<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 송장등록 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.purcOrdList" /> --%><!-- 구매오더 현황 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button class="btn_m btn_add" id="btnAddItem"><spring:message code="par.btn.addItem" /><!-- 부품추가 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" class="form_comboBox" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sBpCd" name="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly/>
                                <input id="sBpNm" name="sBpTp" class="form_input hidden"  data-type="combo" required data-name="<spring:message code="par.lbl.custTp" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grScheDt" /><!-- 입고예정일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcReqDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcReqDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" class="form_comboBox" type="text" data-type="combo"/>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="gridPurcOrd" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

    <!-- 송장정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.invcInfo" /><!-- 송장정보 --></h2>
            <div class="btn_right">
                <button class="btn_s"  id="btnExcelUpload"><spring:message  code="par.btn.uploadExcel" /></button>
                <button class="btn_s btn_del"   id="btnDelItem"><spring:message      code="par.btn.deleteItem" /></button>
                <button class="btn_s btn_save"  id="btnSave"><spring:message         code="par.btn.invcSave" /></button>
            </div>
        </div>
        <div class="table_form form_width_70per" id="invcForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.invcDocNo" /><!-- Invoice번호 --></span></th>
                        <td>
                            <input id="mobisInvcNo" type="text" class="form_input form_required">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.vatCd" /><!-- 세금코드 --></span></th>
                        <td class="required_area">
                            <input id="vatCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></span></th>
                        <td class="required_area">
                            <input id="invcDt" class="form_datepicker" data-type="maskDate">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!--공급업체 --></th>
                        <td>
                            <input type="text" id="bpCd" name="bpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                            <input type="text" id="bpNm" class="form_input form_readonly" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!--금액합계 --></th>
                        <td>
                            <input id="invcTotAmt" data-type="number" readonly class="form_numeric">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.arrvDt" /><!--도착일자 --></span></th>
                        <td class="required_area">
                            <input id="arrvDt" class="form_datepicker" data-type="maskDate">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td>
                            <input id="remark" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totVatAmt" /><!--세액합계 --></th>
                        <td class="bor_none">
                            <input id="vatAmt" data-type="number" readonly class="form_numeric">
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="gridInvc" class="grid"></div>
        </div>
    </section>
    <!-- //송장정보 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            sessionBpTp         = "${bpTp}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            pPurcOrdNo          = "${pPurcOrdNo}",
            gVatCd              = Number("${vatCd}"),
            purcOrdTpList       = [],
            purcOrdTpObj        = {},
            purcOrdStatList     = [],
            purcOrdStatObj      = {},
            purcUnitList        = [],
            purcUnitObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            grStrgeTpList       = [],
            purcItemTpList      = [],
            purcItemTpObj       = {},
            dlPdcCdList         = [],
            dlPdcCdObj          = {},
            vatCdList           = [],
            checkdIds           = {},
            tempGrid            = {},
            venderSearchPopupWin,
            transObj;



        purcItemTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcItemTpList}" varStatus="status">
            purcItemTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            purcItemTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        prcTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        purcOrdTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


        purcOrdStatList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
            purcOrdStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        dlPdcCdList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${purcUnit}" varStatus="status">
            purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${storageList}" varStatus="status">
            grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

        vatCdList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${vatCdList}" varStatus="status">
            vatCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>


        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
            gVatCd = .16;
        }
        console.log('gVatCd:',gVatCd);

    $(document).ready(function() {

        //오더유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //구매오더상태선택
        $("#sPurcOrdStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,index:0
        });


        $("#sPurcReqDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcReqDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });



        //세금코드
        $("#vatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:vatCdList
            ,select:onSelectVatCd
        });

        // Invoice일자
        $("#invcDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        // 도착일자
        $("#arrvDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#invcTotAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#vatAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#gridPurcOrd").data("kendoExtGrid").dataSource.read();
            }
        });

        // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                var frGrid   = $("#gridPurcOrd").data("kendoExtGrid"),
                    toGrid   = $("#gridInvc").data("kendoExtGrid"),
                    rows   = frGrid.select(),
                    rowObj = {};

                if(rows !== null){
                    if(rows.length < 1){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
                    $.each(rows, function(idx, row){

                        rowObj.dlrCd              = frGrid.dataItem(row).dlrCd;
                        rowObj.purcOrdNo          = frGrid.dataItem(row).purcOrdNo;
                        rowObj.purcOrdLineNo      = frGrid.dataItem(row).purcOrdLineNo;
                        rowObj.itemCd             = frGrid.dataItem(row).itemCd;
                        rowObj.itemNm             = frGrid.dataItem(row).itemNm;
                        rowObj.invcTotAmt         = frGrid.dataItem(row).purcAmt;
                        rowObj.invcPrc            = frGrid.dataItem(row).purcPrc;
                        rowObj.invcQty            = frGrid.dataItem(row).purcQty;
                        rowObj.invcQtyOrg         = frGrid.dataItem(row).purcQty;
                        rowObj.invcUnitCd         = frGrid.dataItem(row).purcUnitCd;
                        rowObj.invcAmt            = frGrid.dataItem(row).purcAmt;
                        rowObj.grStrgeCd          = frGrid.dataItem(row).grStrgeCd;
                        rowObj.vatAmt             = 0;
                        rowObj.dlPdcCd            = '';

                        if(tempGrid.hasOwnProperty(frGrid.dataItem(row).purcOrdNo + '' + frGrid.dataItem(row).purcOrdLineNo)){
                            //이미 추가된 라인입니다.[구매번호]
                            var purcNo = '[' + frGrid.dataItem(row).purcOrdNo+'-'+frGrid.dataItem(row).purcOrdLineNo + ']';
                            dms.notification.warning("<spring:message code='global.info.duplicateLineParam' arguments='" + purcNo + "'/>");



                            return false;
                        }

                        tempGrid[frGrid.dataItem(row).purcOrdNo + '' + frGrid.dataItem(row).purcOrdLineNo] = frGrid.dataItem(row);
                        toGrid.dataSource.add(rowObj);
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);

                    });

                    frGrid.clearSelection();

                    calTotalAmt();
                }
            }
        });


        // 송장등록 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#gridInvc").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    header;


                header = {
                        invcTp          :'01'   //'01' 구매송장
                      , invcDstinCd     :'' //사용안함.
                      , invcStatCd      :'01'   //'01' 등록
                      , invcDt          :$("#invcDt").data("kendoExtMaskedDatePicker").value()
                      , arrvDt          :$("#arrvDt").data("kendoExtMaskedDatePicker").value()
                      , bpCd            :$("#bpCd").val()
                      , mobisInvcNo     :$("#mobisInvcNo").val()
                      , invcTotAmt      :$("#invcTotAmt").val()
                      , vatCd           :$("#vatCd").data("kendoExtDropDownList").value()
                      , vatAmt          :$("#vatAmt").val()
                      , remark          :$("#remark").val()
                };

                if(dms.string.isEmpty($("#mobisInvcNo").val())){
                    //송장번호는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.required.field' arguments='${invcDocNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDt").data("kendoExtMaskedDatePicker").value())){
                    //Invoice일자는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.invcDt' var='invcDt' /><spring:message code='global.info.required.field' arguments='${invcDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDatePicker").value())){
                    //도착일은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.required.field' arguments='${arrvDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcTotAmt").val()) || $("#invcTotAmt").val() == 0){
                    //금액합계를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.totAmt' var='totAmt' /><spring:message code='global.info.confirmMsgParam' arguments='${totAmt}'/>");
                    return false;
                }

                if($("#vatCd").data("kendoExtDropDownList").value() === '02' && (dms.string.isEmpty($("#vatAmt").val()) || $("#vatAmt").val() == 0)){
                    //세액합계를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.totVatAmt' var='totVatAmt' /><spring:message code='global.info.confirmMsgParam' arguments='${totVatAmt}'/>");
                    return false;
                }

                if(rows.length  == 0 ){
                    // 저장할 목록이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                        // 수량정보를 확인해주세요
                        dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                        saveList = [];
                        return false;
                    }
                    if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                        // 단가정보를 확인해주세요
                        dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                        saveList = [];
                        return false;
                    }
                    if(dms.string.isEmpty(gridData.invcAmt) || gridData.invcAmt == 0){
                        // 금액를 확인해주세요
                        dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                        saveList = [];
                        return false;
                    }

                    if(dms.string.isEmpty(gridData.invcTotAmt) || gridData.invcTotAmt == 0){
                        // 총액을 입력하십시오.
                        dms.notification.warning("<spring:message code='par.lbl.totAmt' var='totAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${totAmt}'/>");
                        saveList = [];
                        return false;
                    }

                    if(dms.string.isEmpty(gridData.purcOrdNo)){
                        // 구매오더번호를 확인해주세요
                        dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.confirmMsgParam' arguments='${purcOrdNo}'/>");
                        saveList = [];
                        return false;
                    }


                    if(dms.string.isEmpty(gridData.dlPdcCd)){
                        // 배송PDC를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.dlPdcCd' var='dlPdcCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlPdcCd}'/>");
                        saveList = [];
                        return false;
                    }

                    gridData.mobisInvcNo = $("#mobisInvcNo").val();

                    saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data ={
                           "invcVO":header
                          ,"invcItemList":saveList
                        };
                    console.log("saveData::"+kendo.stringify(data));

                    $.ajax({
                         url:"<c:url value='/par/pcm/invc/insertInvc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.info.regSuccessParam' arguments='${invcInfo}'/>");
                                btnView('S');

                                $("#gridPurcOrd").data("kendoExtGrid").dataSource.read();

                            } else {
                                console.log('errorResult:',result);
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.err.regFailedParam' arguments='${invcInfo}'/>");
                                }
                                // 에러 메시지 확인.
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            console.log('error:',jqXHR,status,error);
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });
                }
              }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 엑셀 업로드 버튼
        $("#btnExcelUpload").kendoButton({
            click:function(e){
                //alert("엑셀 업로드");
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){

                var grid     = $("#gridInvc").data("kendoExtGrid"),
                    purcGrid = $("#gridPurcOrd").data("kendoExtGrid"),
                    rows     = grid.select();



                rows.each(function(index, row) {
                    delete tempGrid[grid.dataItem(row).purcOrdNo + '' + grid.dataItem(row).purcOrdLineNo];
                });
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        /**
         * grid 배송PDC DropDownList
         */
         dlPdcCdDropDownEditor = function(container, options) {

            console.log('dlPdcCdDropDownEditor:',arguments);

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  dlPdcCdList
             });
         };

      // 가격유형
         changePrcTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = prcTpObj[val];
             }
             return returnVal;
         };

         // 구매단위
         changePurcUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcUnitObj[val];
             }
             console.log('changePurcUnit:',val, returnVal,purcUnitObj);
             return returnVal;
         };

         // 구매상태
         changePurcOrdStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdStatObj[val];
             }
             return returnVal;
         };

         // 배송PDC
         changeDlPdcCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = dlPdcCdObj[val];
             }
             return returnVal;
         };


        // 구매 그리드
        $("#gridPurcOrd").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/purcOrd/selectInvcItems.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;


                            // 구매오더 검색조건 코드.
                            params["sBpCd"]              = $("#sBpCd").val();
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sPurcReqDtFr"]       = $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcReqDtTo"]       = $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatCd"]      = $("#sPurcOrdStatCd").data("kendoExtDropDownList").value();
                            console.log('params:',params);

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"purcOrdNo"
                      ,fields:{
                              dlrCd          :{ type:"string"   , validation:{required:true} }
                            , purcReqDt      :{ type:"date"     , editable:false}
                            , bpCd           :{ type:"string"   , editable:false}
                            , bpNm           :{ type:"string"   , editable:false}
                            , purcOrdTp      :{ type:"string"   , editable:false}
                            , purcOrdStatCd  :{ type:"string"   , editable:false}
                            , purcOrdNo      :{ type:"string"   , editable:false}
                            , purcOrdLineNo  :{ type:"string"   , editable:false}
                            , itemCd         :{ type:"string"   , editable:false}
                            , itemNm         :{ type:"string"   , editable:false}
                            , grStrgeCd      :{ type:"string"   , editable:false}
                            , purcQty        :{ type:"number"}
                            , grQty          :{ type:"number"}
                            , purcUnitCd     :{ type:"string"   , editable:false}
                            , purcPrc        :{ type:"number"}
                            , purcAmt        :{ type:"number"}
                            , prcTp          :{ type:"string"}
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , autoBind   :false
            , height     :250
            , multiSelectWithCheckbox:true
            , pageable:false
            , editable:false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //입고예정일
                      title:"<spring:message code='par.lbl.grScheDt' />"
                     ,field:"purcReqDt"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"grStrgeCd"
                     ,width:105
                     ,hidden:true
                  }
                , {   //거래처 코드
                      title:"<spring:message code='par.lbl.bpCd' />"
                     ,field:"bpCd"
                     ,width:105
                     ,hidden:true
                  }
                , {   //공급업체
                      title:"<spring:message code='par.lbl.bpCd' />"
                     ,field:"bpNm"
                     ,width:120
                  }
                , {   //오더유형
                      title:"<spring:message code='par.lbl.purcOrdTp' />"
                     ,field:"purcOrdTp"
                     ,template:'#= changePurcOrdTp(purcOrdTp)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:120
                  }
                , {   //구매오더상태
                      title:"<spring:message code='par.lbl.purcOrdStatCd' />"
                     ,field:"purcItemStatCd"
                     ,width:90
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePurcOrdStat(purcItemStatCd)#'
                  }
                , {   //구매오더번호
                      title:"<spring:message code='par.lbl.purcOrdNo' />"
                     ,field:"purcOrdNo"
                     ,width:100
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcOrdLineNo"
                     ,width:60
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:100
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                  }
                , {   //구매수량
                      title:"<spring:message code='par.lbl.purcQty' />"
                     ,field:"purcQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //입고수량
                      title:"<spring:message code='par.lbl.grQty' />"
                     ,field:"grQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitCd' />"
                     ,field:"purcUnitCd"
                     ,width:70
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePurcUnit(purcUnitCd)#'
                     ,editable:false
                  }
                , {   //단가유형
                      title:"<spring:message code='par.lbl.prcTp' />"
                     ,field:"prcTp"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePrcTp(prcTp)#'
                     ,hidden:true
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"purcPrc"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"purcAmt"
                     ,width:100
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,editable:false
                  }
                , { field:"" }
            ]
        });

        //  오더유형
        changePurcOrdTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = purcOrdTpObj[val];
            }
            return returnVal;
        };

        // 송장 그리드
        $("#gridInvc").kendoExtGrid({
              dataSource:{
                  schema:{
                      data :"data"
                     ,total:"total"
                     ,model:{
                        id:"invcDocNo"
                       ,fields:{
                               dlrCd          :{ type:"string"   , validation:{required:true} }
                             , purcReqDt      :{ type:"date"     , editable:false}
                             , invcDocNo      :{ type:"string"   , editable:false}
                             , invcDocLineNo  :{ type:"number"   , editable:false}
                             , mobisInvcNo    :{ type:"string"   , editable:false}
                             , mobisInvcLineNo:{ type:"number"   , editable:false}
                             , purcOrdNo      :{ type:"string"   , editable:false}
                             , purcOrdLineNo  :{ type:"string"   , editable:false}
                             , itemCd         :{ type:"string"   , editable:false}
                             , itemNm         :{ type:"string"   , editable:false}
                             , grStrgeCd      :{ type:"string"   , editable:false}
                             , invcTotAmt     :{ type:"number"}
                             , invcPrc        :{ type:"number"   , editable:false}
                             , taxDdctPrc     :{ type:"number"}
                             , invcQty        :{ type:"number"}
                             , invcUnitCd     :{ type:"string"   , editable:false}
                             , invcAmt        :{ type:"number"}
                             , vatAmt         :{ type:"number"}
                             , dlPdcCd        :{ type:"string"}
                         }
                     }
                 }
              }
            , selectable :"multiple"
            , scrollable :true
            , autoBind   :false
            , height     :250
            , multiSelectWithCheckbox:true
            , pageable   :false
            , sortable   :false
            , edit       :onEdit
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //송장문서번호
                      title:"<spring:message code='par.lbl.invcDocNo' />"
                     ,field:"invcDocNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"invcDocLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //모비스송장번호
                      title:"<spring:message code='par.lbl.mobisInvcNo' />"
                     ,field:"mobisInvcNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"grStrgeCd"
                     ,width:100
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"mobisInvcLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //구매오더번호
                      title:"<spring:message code='par.lbl.purcOrdNo' />"
                     ,field:"purcOrdNo"
                     ,width:100
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcOrdLineNo"
                     ,width:60
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:100
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                  }
                , {   //총액
                      title:"<spring:message code='par.lbl.totAmt' />"
                     ,field:"invcTotAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,editor:function(container, options){
                         var input = $("<input/>");

                         input.attr("name", options.field);
                         input.appendTo(container);
                         input.kendoExtNumericTextBox({
                             min:0,
                             spinners:false
                         });
                     }
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"invcPrc"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //세금공제단가
                      title:"<spring:message code='par.lbl.taxDdctPrc' />"
                     ,field:"taxDdctPrc"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"invcQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,editor:function(container, options){
                         var input = $("<input/>");

                         input.attr("name", options.field);
                         input.appendTo(container);
                         input.kendoExtNumericTextBox({
                             min:0,
                             spinners:false
                         });
                     }
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"invcQtyOrg"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,editor:function(container, options){
                         var input = $("<input/>");

                         input.attr("name", options.field);
                         input.appendTo(container);
                         input.kendoExtNumericTextBox({
                             min:0,
                             spinners:false
                         });
                     }
                     ,hidden:true
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"invcUnitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePurcUnit(invcUnitCd)#'
                     ,editable:false
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"invcAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"vatAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //배송 PDC
                      title:"<spring:message code='par.lbl.dlPdcCd' />"
                     ,field:"dlPdcCd"
                     ,editor:dlPdcCdDropDownEditor
                     ,template:'#= changeDlPdcCd(dlPdcCd)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:140
                  }
                , { field:"" }
            ]
        });


        function initPage(){
            var minDate = new Date(sevenDtBf),
                maxDate = new Date(toDt),
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;
            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#invcForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#gridPurcOrd").data("kendoExtGrid").dataSource.data([]);
            $("#gridInvc").data("kendoExtGrid").dataSource.data([]);
            $("#vatAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#vatAmt").data("kendoExtNumericTextBox").enable(false);
            $("#invcTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#invcTotAmt").data("kendoExtNumericTextBox").enable(false);

            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#sBpNm").val(sessionBpNm);
            $("#bpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#bpNm").val(sessionBpNm);
            $("#sBpTp").val(sessionBpTp);  //고객유형 기본셋팅


            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();


            $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").value(toDt);
            $("#invcDt").data("kendoExtMaskedDatePicker").value(toDt);
            $("#arrvDt").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

            $("#vatCd").data("kendoExtDropDownList").value('01');
            $("#sPurcOrdStatCd").data("kendoExtDropDownList").value('02');
            $("#sPurcOrdStatCd").data("kendoExtDropDownList").enable(false);
            tempGrid = {};

            btnView('I');

        }

        function onEdit(e) {
            var grid = this,
                model = e.model,
                input = e.container.find(".k-input"),
                fieldName = grid.columns[e.container.index()].field;

            if(fieldName === "invcTotAmt"){

                input.blur(function(){
                    // 세율 (비과세인 경우 1로 계싼 )
                    var vatCd = $("#vatCd").data("kendoExtDropDownList").value();
                    // 선택된 값
                    var rows = e.sender.select();
                    var selectedItem = e.sender.dataItem(rows[0]);

                    // 입력된 총액으로 계산(단가,세액,금액 계산)
                    var invcTotAmt = selectedItem.invcTotAmt;

                    if(invcTotAmt > 0 && invcTotAmt != null){

                        var invcPrc,vatAmt,invcAmt,taxDdctPrc;
                        // 세액 = (총액 * 부가세율) / 100
                        //vatAmt = Math.ceil((invcTotAmt * vat) / 100);

                        if(vatCd !== '01'){
                           // 금액
                            invcAmt = Number((invcTotAmt * 100) / (100 + (100*gVatCd))).toFixed(2);
                            vatAmt = Number((invcAmt * (100*gVatCd)) / 100 ).toFixed(2);
                        }else{
                            // 금액 = 총액
                            invcAmt = invcTotAmt;
                            vatAmt = 0;
                        }
                        // 금액 = 총액 - 세액
                        //invcAmt = invcTotAmt - vatAmt;
                        // 세액
                        // 단가 = 금액 / 수량
                        taxDdctPrc = Number(invcAmt / selectedItem.invcQty).toFixed(2);

                        selectedItem.set("taxDdctPrc", taxDdctPrc);   // 단가
                        selectedItem.set("invcAmt", invcAmt);   // 금액
                        selectedItem.set("vatAmt", vatAmt); // 세액
                        // 전체 계산
                        calTotalAmt();
                    }
                });
            }else if(fieldName === "invcQty"){
                input.blur(function(){
                    // 세율 (비과세인 경우 1로 계싼 )
                    var vatCd = $("#vatCd").data("kendoExtDropDownList").value(),
                        // 선택된 값
                        rows = e.sender.select(),
                        selectedItem = e.sender.dataItem(rows[0]),
                        // 입력된 수량으로 계산(단가,세액,금액 계산)
                        invcQty = selectedItem.invcQty;

                    if(invcQty > selectedItem.invcQtyOrg){

                        dms.notification.error("<spring:message code='par.lbl.qty' var='invcQty' /><spring:message code='par.lbl.purcQty' var='purcQty' /><spring:message code='global.err.chkGreateParam' arguments='${invcQty},${purcQty}'/>");
                        selectedItem.set("invcQty", selectedItem.invcQtyOrg);   // 수량
                        return false;
                    }

                    if(invcQty > 0 && invcQty != null){

                        var invcPrc,vatAmt,invcAmt, invcTotAmt, taxDdctPrc;
                        // 세액 = (총액 * 부가세율) / 100
                        //vatAmt = Math.ceil((invcTotAmt * vat) / 100);
                        invcTotAmt = Number(invcQty) * Number(selectedItem.invcPrc);


                        if(vatCd !== '01'){
                           // 금액
                            invcAmt = Number((invcTotAmt * 100) / (100 + (100*gVatCd))).toFixed(2);
                            vatAmt = Number((invcAmt * (100*gVatCd)) / 100 ).toFixed(2);
                        }else{
                            // 금액 = 총액
                            invcAmt = invcTotAmt;
                            vatAmt = 0;
                        }
                        // 금액 = 총액 - 세액
                        //invcAmt = invcTotAmt - vatAmt;
                        // 세액
                        // 단가 = 금액 / 수량
                        taxDdctPrc = Number(invcAmt / invcQty).toFixed(2);

                        selectedItem.set("invcTotAmt", invcTotAmt);   // 총금액
                        selectedItem.set("taxDdctPrc", taxDdctPrc);   // 단가
                        selectedItem.set("invcAmt", invcAmt);   // 금액
                        selectedItem.set("vatAmt", vatAmt); // 세액
                        // 전체 계산
                        calTotalAmt();
                    }
                });
            }

            if(fieldName === "invcPrc" ||fieldName === "taxDdctPrc" ||fieldName === "invcAmt" ||fieldName === "vatAmt" ){
                this.closeCell();
            }
        }

        /**
        * 세액 선택시 note1(금액 계산시 필요)
        */
        function onSelectVatCd(e){
            console.log('onSelectVatCd:',this.dataItem(e.item));
            var vatCd = this.dataItem(e.item).cmmCd;
            calRowAmt(vatCd);
        };

        //Grid 계산
        function calRowAmt(pVatCd){
            var grid = $("#gridInvc").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                // 세율
                invcTotAmt = 0,
                invcPrc,vatAmt,invcAmt,taxDdctPrc = 0;


            console.log('calRowAmt:',pVatCd);
            //  금액 계산
            rows.each(function(index, row) {
                var data = grid.dataSource.at(index);

                invcTotAmt = data.invcTotAmt;

                console.log('invcTotAmt:',invcTotAmt);
                if(invcTotAmt > 0 && invcTotAmt != null){

                    if(pVatCd !== '01'){

                        console.log('부가세 계산');
                         // 금액
                        invcAmt = Number((invcTotAmt * 100) / (100 + (100*gVatCd))).toFixed(2);
                        vatAmt = Number((invcAmt * (100*gVatCd)) / 100 ).toFixed(2);
                        console.log('invcAmt:',invcAmt);
                        console.log('vatAmt:',vatAmt);
                    }else{
                        console.log('영세율');
                        invcAmt = invcTotAmt;
                        vatAmt = 0;
                    }

                    // 단가 = 금액 / 수량
                    taxDdctPrc = Number(invcAmt / data.invcQty).toFixed(2);
                    console.log('taxDdctPrc:',taxDdctPrc);
                    data.set("taxDdctPrc", taxDdctPrc);   // 단가
                    data.set("invcAmt", invcAmt);   // 금액
                    data.set("vatAmt", vatAmt); // 세액
                }

            });
            // Total 계산
            calTotalAmt();
        }

        //Total 계산
        function calTotalAmt(){
             var rows         = $("#gridInvc").data("kendoExtGrid").tbody.find("tr"),
                 invcTotAmt   = 0,
                 vatAmt       = 0;

             //  금액 계산
             rows.each(function(index, row) {

                data = $("#gridInvc").data("kendoExtGrid").dataItem(rows[index]);

                 if(data.invcTotAmt != null && data.vatAmt != null){
                     invcTotAmt += Number(data.invcTotAmt);
                     vatAmt += Number(data.vatAmt);
                 }

                 $("#vatAmt").data("kendoExtNumericTextBox").value(vatAmt);
                 $("#invcTotAmt").data("kendoExtNumericTextBox").value(invcTotAmt);
             });
        }

        function btnView(pType){

            if(pType === "I"){ //초기화인 경우
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#vatCd").data("kendoExtDropDownList").enable(true);
                $("#mobisInvcNo").attr("disabled", false);
                $("#invcDt").data("kendoExtMaskedDatePicker").enable(true);
                $("#arrvDt").data("kendoExtMaskedDatePicker").enable(true);
                $("#remark").attr("disabled", false);
                //$("#gridInvc").data("kendoExtGrid").setOptions({editable:false});
            }else if(pType === "S"){ //그 외

                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);

                $("#vatCd").data("kendoExtDropDownList").enable(false);
                $("#mobisInvcNo").attr("disabled", true);
                $("#invcDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#arrvDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#remark").attr("disabled", true);
                //$("#gridInvc").data("kendoExtGrid").setOptions({editable:true});
            }
        }

        function fnChkDateValue(e){

           var  elmt  = e.sender.element[0],
                id    = elmt.id,
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;

           console.log("val:" + this.value());
           console.log('id:',id);
           if(this.value() == null){
               if(id === 'sPurcReqDtFr'){
                   var minDate = new Date(sevenDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   frDD = minDate.getDate();
                   $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                   $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcReqDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else{
                   $("#" + id).data("kendoExtMaskedDatePicker").value(toDt);
               }
           }else{
               if(id === 'sPurcReqDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcReqDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }


        }

        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":''
                        ,"bpNm":''
                        ,"callbackFunc":function(data){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            $("#sBpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                            $("#sBpNm").val(data[0].bpNm);
                            $("#sBpTp").val(data[0].bpTp);
                            $("#gridPurcOrd").data("kendoExtGrid").dataSource.data([]);
                            $("#gridInvc").data("kendoExtGrid").dataSource.data([]);
                            tempGrid = {};

                            if(data[0].bpTp === '01'){
                                $("#sPurcOrdStatCd").data("kendoExtDropDownList").value('02');
                            }else{
                                $("#sPurcOrdStatCd").data("kendoExtDropDownList").value('03');
                            }
                        }
                    }
                }
            });
        }
        initPage();
    });
</script>
<!-- //script -->


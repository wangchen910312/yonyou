<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 송장등록현황 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.invcRegStatus" /> --%><!-- 송장등록 현황 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td>
                            <input id="sInvcStatCd" class="form_comboBox" type="text" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.confirmDt" /><!-- 확정일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sInvcDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sInvcDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
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
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <!-- 송장등록 그리드 -->
            <div id="gridRegInvc" class="grid"></div>
        </div>
    </section>
    <!-- //송장등록정보 -->

    <!-- 송장확정정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.invcInfo" /><!-- 송장정보 --></h2>
            <div class="btn_right">
                <button class="btn_s btn_save"  id="btnSave"><spring:message        code="par.btn.invcCnfm" /></button>
                <button class="btn_s btn_del"   id="btnCncl"><spring:message        code="par.btn.cnclCnfmStatus" /></button>
                <button class="btn_s btn_del hidden"   id="btnDelInvcDoc"><spring:message  code="par.btn.delDoc" /></button>
                <button class="btn_s"           id="btnReceiveCnfm"><spring:message  code="par.btn.receiveCnfm" /></button>
            </div>
        </div>
        <div class="table_form form_width_70per hidden"  id="invcForm">
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
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- Invoice번호 --></th>
                        <td>
                            <input id="mobisInvcNo" type="text" class="form_input form_readonly" readonly>
                            <input id="invcDocNo" type="text" class="hidden">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.vatCd" /><!-- 세금코드 --></th>
                        <td>
                            <input id="vatCd" class="form_comboBox" data-type="combo" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td>
                            <input id="invcStatCd" class="form_comboBox" type="text" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></th>
                        <td>
                            <input id="invcTp" class="form_comboBox" data-type="combo" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!--금액합계 --></th>
                        <td class="readonly_area">
                            <input id="invcTotAmt" data-type="number" readonly class="form_numeric">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></th>
                        <td class="readonly_area">
                            <input id="invcDt" class="form_datepicker" data-type="maskDate" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!--공급업체 --></th>
                        <td>
                            <input id="bpCd" class="form_input hidden form_readonly" readonly />
                            <input id="bpNm" class="form_input form_readonly"  readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totVatAmt" /><!--세액합계 --></th>
                        <td class="readonly_area">
                            <input id="vatAmt" data-type="number" readonly class="form_numeric" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.arrvDt" /><!--도착일자 --></th>
                        <td class="readonly_area">
                            <input id="arrvDt" class="form_datepicker" data-type="maskDate" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="3">
                            <input id="remark" type="text" value="" class="form_input form_readonly" readonly/>
                            <input id="ifYn" type="text" class="form_input form_readonly hidden" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.confirmDt" /><!--확정일자 --></th>
                        <td class="readonly_area">
                            <input id="confirmDt" class="form_datepicker"  data-type="maskDate" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="gridCnfmInvc" class="grid"></div>
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
            invcTpList          = [],
            purcOrdTpObj        = {},
            invcTpObj           = {},
            invcStatList        = [],
            invcStatObj         = {},
            invcUnitList        = [],
            invcUnitObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            grStrgeTpList       = [],
            dlPdcCdList         = [],
            dlPdcCdObj          = {},
            vatCdList           = [],
            vatCdObj            = {},
            trsfTpObj           = {},
            checkdIds           = {},
            tempGrid            = {},
            dlPdcCdObj          = {},
            venderSearchPopupWin,
            transObj;

        prcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        invcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${invcTpList}" varStatus="status">
            invcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            invcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


        invcStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${invcStatList}" varStatus="status">
            invcStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            invcStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        dlPdcCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${invcUnit}" varStatus="status">
            invcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            invcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${storageList}" varStatus="status">
            grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

        vatCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${vatCdList}" varStatus="status">
            vatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            vatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
            trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

    $(document).ready(function() {


        //송장상태선택
        $("#sInvcStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcStatList
            ,index:0
        });


        $("#sInvcDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sInvcDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //송장유형선택
        $("#invcTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcTpList
            ,index:0
        });

        //상태선택
        $("#invcStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcStatList
            ,index:0
        });

        //세금코드
        $("#vatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:vatCdList
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

        // 확정일자
        $("#confirmDt").kendoExtMaskedDatePicker({
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

                $("#gridRegInvc").data("kendoExtGrid").dataSource.read();
            }
        });

        // 송장확정 버튼
        $("#btnSave").kendoButton({
            click:function(e){
                var saveList      = [],
                    grid          = $("#gridCnfmInvc").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    header;


                header = {
                    invcDocNo       :$("#invcDocNo").val()
                };

                if(dms.string.isEmpty($("#mobisInvcNo").val())){
                    //송장번호를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDocNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDocNo").val())){
                    //송장번호를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDocNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDt").data("kendoExtMaskedDatePicker").value())){
                    //Invoice일자를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDt' var='invcDt' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDatePicker").value())){
                    //도착일를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.confirmMsgParam' arguments='${arrvDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
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


                $.ajax({
                     url:"<c:url value='/par/pcm/invc/updateInvcCnfm.do' />"
                    ,data:kendo.stringify(header)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        var arrDt = $("#arrvDt").data("kendoExtMaskedDatePicker").value(),
                            arrYY = arrDt.getFullYear(),
                            arrMM = arrDt.getMonth(),
                            arrDD = arrDt.getDate();

                        if (result === 1) {
                            dms.notification.success("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${invcInfo}'/>");
                            btnView('S');

                            $("#gridRegInvc").data("kendoExtGrid").dataSource.read();

                            $("#invcStatCd").data("kendoExtDropDownList").value('02');
                            $("#confirmDt").data("kendoExtMaskedDatePicker").value(new Date(toDt));

                            parent._createOrReloadTabMenu('<spring:message code="par.menu.partInStockConfirm" />'
                                    ,"<c:url value='/par/pcm/receive/selectReceiveCnfmMain.do?pMobisInvcNo="+$("#mobisInvcNo").val()+"&pBpCd="+$("#bpCd").val()+"&pBpNm="+$("#bpNm").val()+"&pArrvYy="+arrYY+"&pArrvMm="+arrMM+"&pArrvDd="+arrDD+"'/>", "VIEW-I-10166");

                        } else {
                            if(result === 0){
                                dms.notification.error("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.info.cnfmFailedParam' arguments='${invcInfo}'/>");
                            }
                            // 에러 메시지 확인.
                        }

                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                });
              }
        });

        // 송장취소  버튼
        $("#btnCncl").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#gridCnfmInvc").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    header;


                header = {
                    invcDocNo       :$("#invcDocNo").val()
                };

                if(dms.string.isEmpty($("#mobisInvcNo").val())){
                    //송장번호를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDocNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDocNo").val())){
                    //송장번호를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDocNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDt").data("kendoExtMaskedDatePicker").value())){
                    //Invoice일자를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDt' var='invcDt' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDatePicker").value())){
                    //도착일를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.confirmMsgParam' arguments='${arrvDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
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


                $.ajax({
                     url:"<c:url value='/par/pcm/invc/cancelInvcCnfm.do' />"
                    ,data:kendo.stringify(header)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {


                        if (result === 1) {
                            dms.notification.success("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.info.cancelSuccessParam' arguments='${invcInfo}'/>");
                            btnView('C');

                            $("#invcStatCd").data("kendoExtDropDownList").value('01');
                            $("#confirmDt").data("kendoExtMaskedDatePicker").value(new Date(''));

                            $("#gridRegInvc").data("kendoExtGrid").dataSource.read();

                        } else {
                            if(result === 0){
                                dms.notification.error("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.err.cancelFailedParam' arguments='${invcInfo}'/>");
                            }
                            // 에러 메시지 확인.
                        }

                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                });
              }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 입고확정화면이동
        $("#btnReceiveCnfm").kendoButton({
            click:function(e) {
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partInStockConfirm" />'
                        ,"<c:url value='/par/pcm/receive/selectReceiveCnfmMain.do'/>", "VIEW-I-10166");
            }
        });


        //송장문서삭제 버튼
        $("#btnDelInvcDoc").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#gridCnfmInvc").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    data          = {},
                    header;


                header = {
                    invcDocNo       :$("#invcDocNo").val()
                };

                if(dms.string.isEmpty($("#mobisInvcNo").val())){
                    //송장번호를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDocNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDocNo").val())){
                    //송장번호를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDocNo}'/>");
                    return false;
                }

                if($("#ifYn").val() === 'Y'){
                    //송장을 삭제할 수 없습니다.
                    dms.notification.warning("<spring:message code='par.err.delFailedInvc'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#invcDt").data("kendoExtMaskedDatePicker").value())){
                    //Invoice일자를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.invcDt' var='invcDt' /><spring:message code='global.info.confirmMsgParam' arguments='${invcDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDatePicker").value())){
                    //도착일를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.confirmMsgParam' arguments='${arrvDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보를 확인해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
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

                    saveList.push(gridData);
                });

                data = {
                        "invcVO":header
                       ,"invcItemList":saveList
                     };


                $.ajax({
                     url:"<c:url value='/par/pcm/invc/deleteInvcDoc.do' />"
                    ,data:kendo.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {


                        if (result === 1) {
                            dms.notification.success("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.info.delSuccessParam' arguments='${invcInfo}'/>");
                            btnView('I');

                            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
                            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
                            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                            if (!partsJs.validate.getAllPluginObjInfo($("#invcForm")[0])) {
                                return false;
                            }

                            // 품목 정보 Reset
                            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                            partsJs.validate.groupObjAllDataInit();

                            $("#gridRegInvc").data("kendoExtGrid").dataSource.read();

                        } else {
                            if(result === 0){
                                dms.notification.error("<spring:message code='par.title.invcInfo' var='invcInfo' /><spring:message code='global.err.delFailedParam' arguments='${invcInfo}'/>");
                            }
                            // 에러 메시지 확인.
                        }

                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                });
              }
        });


         // 가격유형
         changePrcTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = prcTpObj[val];
             }
             return returnVal;
         };

         //단위
         changeInvcUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcUnitObj[val];
             }
             return returnVal;
         };

         // 송장상태
         changeInvcStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcStatObj[val];
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

         // 세금코드
         changeVatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = vatCdObj[val];
             }
             return returnVal;
         };


        // 송장등록 그리드
        $("#gridRegInvc").kendoExtGrid({
            gridId:"G-PAR-0803-171901"
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/invc/selectInvcItems.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;


                            // 송장 검색조건 코드.
                            params["sBpCd"]               = $("#sBpCd").val();
                            params["sMobisInvcNo"]        = $("#sMobisInvcNo").val();
                            params["sInvcDtFr"]           = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcDtTo"]           = $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sInvcStatCd"]         = $("#sInvcStatCd").data("kendoExtDropDownList").value();

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
                       id:"invcDocNo"
                      ,fields:{
                              dlrCd          :{ type:"string"}
                            , invcDocNo      :{ type:"string"}
                            , invcTp         :{ type:"string"}
                            , invcStatCd     :{ type:"string"}
                            , regDt          :{ type:"date"  }
                            , invcDt         :{ type:"date"  }
                            , pltCd          :{ type:"string"}
                            , pltNm          :{ type:"string"}
                            , bpCd           :{ type:"string"}
                            , bpNm           :{ type:"string"}
                            , mobisInvcNo    :{ type:"string"}
                            , vatCd          :{ type:"string"}
                            , purcOrdStatCd  :{ type:"string"}
                            , purcOrdNo      :{ type:"string"}
                            , vatAmt         :{ type:"number"}
                            , invcTotAmt     :{ type:"number"}
                            , itemCnt        :{ type:"number"}
                            , itemQty        :{ type:"number"}
                            , arrvDt         :{ type:"date"  }
                            , confirmDt      :{ type:"date"  }
                            , remark         :{ type:"string"}
                            , ifYn           :{ type:"string"}
                        }
                    }
                }
            }
            , selectable :"row"
            , change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){


                    $.ajax({
                        url:"<c:url value='/par/pcm/invc/selectInvcItemByKey.do' />",
                        data:JSON.stringify({ sInvcDocNo:selectedItem.invcDocNo}),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    }).done(function(result) {

                        var dataLen      = result.data.length,
                            gridData     = $("#gridCnfmInvc").data("kendoExtGrid"),
                            rows;

                            $("#invcDocNo").val(selectedItem.invcDocNo);
                            $("#mobisInvcNo").val(selectedItem.mobisInvcNo);
                            $("#vatCd").data("kendoExtDropDownList").value(selectedItem.vatCd);
                            $("#invcStatCd").data("kendoExtDropDownList").value(selectedItem.invcStatCd);
                            $("#invcTp").data("kendoExtDropDownList").value(selectedItem.invcTp);
                            $("#invcTotAmt").data("kendoExtNumericTextBox").value(selectedItem.invcTotAmt);
                            $("#invcDt").data("kendoExtMaskedDatePicker").value(selectedItem.invcDt);
                            $("#bpCd").val(selectedItem.bpCd);
                            $("#bpNm").val(selectedItem.bpNm);
                            $("#vatAmt").data("kendoExtNumericTextBox").value(selectedItem.vatAmt);
                            $("#arrvDt").data("kendoExtMaskedDatePicker").value(selectedItem.arrvDt);
                            $("#remark").val(selectedItem.remark);
                            $("#ifYn").val(selectedItem.ifYn);
                            $("#confirmDt").data("kendoExtMaskedDatePicker").value(selectedItem.confirmDt);

                            gridData.dataSource.data(result.data);

                            if(selectedItem.invcStatCd === '02'){
                                btnView('S');
                            }else if(selectedItem.invcStatCd === '03'){
                                btnView('I');
                            }else{
                                btnView('C');
                            }

                            //for(var i = 0; i < dataLen; i = i + 1){
                            //    gridData.dataSource.add(result.data[i]);
                            //}
                    });
                }
             }
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , height     :250
            , editable:false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //송장번호
                      title:"<spring:message code='par.lbl.invcDocNo' />"
                     ,field:"invcDocNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //송장번호
                      title:"<spring:message code='par.lbl.invcDocNo' />"
                     ,field:"mobisInvcNo"
                     ,width:140
                  }
                , {   //송장일자
                      title:"<spring:message code='par.lbl.invcDt' />"
                     ,field:"invcDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //송장상태
                      title:"<spring:message code='par.lbl.invcStatCd' />"
                     ,field:"invcStatCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeInvcStat(invcStatCd)#'
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
                , {   //인터페이스여부
                      title:"<spring:message code='par.lbl.ifYn' />"
                     ,field:"ifYn"
                     ,width:100
                     ,hidden:true
                  }
                , {   //운송유형
                      title:"<spring:message code='par.lbl.trsfTp' />"
                     //,field:"trsfTp"
                     //,template:'#= changeTrsfTp(trsfTp)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:120
                  }
                , {   //물류회사
                      title:"<spring:message code='par.lbl.logisticsCmpn' />"
                     ,field:"inrTspCode"
                     ,width:120
                  }
                , {   //Box수량
                      title:"<spring:message code='par.lbl.boxNo' />"
                     ,field:"inrInvCseCnt"
                     ,width:120
                  }
                , {   //송장유형
                      title:"<spring:message code='par.lbl.invcTp' />"
                     ,field:"invcTp"
                     ,template:'#= changeInvcTp(invcTp)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:120
                     ,hidden:true
                  }
                , {   //등록일
                      title:"<spring:message code='par.lbl.regDt' />"
                     ,field:"regDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,hidden:true
                  }
                , {   //센터 코드
                      title:"<spring:message code='par.lbl.pltCd' />"
                     ,field:"pltCd"
                     ,width:105
                     ,hidden:true
                  }
                , {   //센터명
                      title:"<spring:message code='par.lbl.pltNm' />"
                     ,field:"pltNm"
                     ,width:120
                     ,hidden:true
                  }
                , {   //세금코드
                      title:"<spring:message code='par.lbl.vatCd' />"
                     ,field:"vatCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeVatCd(vatCd)#'
                     ,editable:false
                     ,hidden:true
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"vatAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,hidden:true
                  }
                , {   //부품건수
                      title:"<spring:message code='par.lbl.parCnt' />"
                     ,field:"itemCnt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //부품수량
                      title:"<spring:message code='par.lbl.itemQty' />"
                     ,field:"itemQty"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //구매금액
                      title:"<spring:message code='par.lbl.purcIncTaxAmt' />"
                     ,field:"purcIncTaxAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //구매금액(세금제외)
                      title:"<spring:message code='par.lbl.purcAmt' />"
                     ,field:"purcAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //운송비
                      title:"<spring:message code='par.lbl.trsfAmt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //보험비
                      title:"<spring:message code='par.lbl.incAmt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //송장금액
                      title:"<spring:message code='par.lbl.invcAmt' />"
                     ,field:"invcTotAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //도착일자
                      title:"<spring:message code='par.lbl.arrvDt' />"
                     ,field:"arrvDt"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,hidden:true
                  }
                , {   //확정일자
                      title:"<spring:message code='par.lbl.confirmDt' />"
                     ,field:"confirmDt"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //비고
                      title:"<spring:message code='par.lbl.remark' />"
                     ,field:"remark"
                     ,width:140
                     ,hidden:true
                  }
            ]
        });

        //  송장유형
        changeInvcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = invcTpObj[val];
            }
            return returnVal;
        };

       // 운송유형
        changeTrsfTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = trsfTpObj[val];
            }
            return returnVal;
        };

        // 송장 그리드
        $("#gridCnfmInvc").kendoExtGrid({
            gridId:"G-PAR-0803-172001"
           ,dataSource:{
                  schema:{
                      data :"data"
                     ,total:"total"
                     ,model:{
                        id:"invcDocNo"
                       ,fields:{
                               dlrCd               :{ type:"string"}
                             , invcDocNo           :{ type:"string"}
                             , invcDocLineNo       :{ type:"number"}
                             , mobisInvcNo         :{ type:"string"}
                             , mobisInvcLineNo     :{ type:"number"}
                             , purcOrdNo           :{ type:"string"}
                             , purcOrdLineNo       :{ type:"string"}
                             , purcOrdLineDetlNo   :{ type:"string"}
                             , itemCd              :{ type:"string"}
                             , itemNm              :{ type:"string"}
                             , invcTotAmt          :{ type:"number"}
                             , invcPrc             :{ type:"number"}
                             , invcQty             :{ type:"number"}
                             , invcUnitCd          :{ type:"string"}
                             , invcAmt             :{ type:"number"}
                             , vatAmt              :{ type:"number"}
                             , dlPdcCd             :{ type:"string"}
                             , boxNo               :{ type:"string"}
                             , invcGrDt            :{ type:"date"}
                         }
                     }
                 }
              }
            , selectable :"multiple"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , height     :250
            , pageable   :false
            , sortable   :false
            , editable   :false
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
                , {   //오더유형
                      title:"<spring:message code='par.lbl.purcOrdTp' />"
                     ,field:"purcOrdTp"
                     ,template:'#= changePurcOrdTp(purcOrdTp)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:120
                  }
                ,{
                     field:"purcReqDt"
                    ,title:"<spring:message code='par.lbl.ordReqDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                    ,width:90
                  }                //처리일자
                , {   //Line
                      title:"<spring:message code='par.lbl.line' />"
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
                 ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                 ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.supplyNo' />"
                     ,width:140 }  //공급업체
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcOrdLineNo"
                     ,width:70
                     ,hidden:true
                  }
                , {   //라인구분자
                      title:" "
                     ,field:"purcOrdLineDetlNo"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:20
                     ,sortable:false
                     ,hidden:true
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
                , {   //구매단가
                      title:"<spring:message code='par.lbl.purcPrice' />"
                     ,field:"invcPrc"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //구매단가(세금제외)
                      title:"<spring:message code='par.lbl.purcPriceTax' />"
                     ,field:"taxDdctPrc"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //발송수량
                      title:"<spring:message code='par.lbl.sendQty' />"
                     ,field:"invcQty"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //구매금액
                      title:"<spring:message code='par.lbl.purcIncTaxAmt' />"
                     ,field:"invcTotAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //구매금액(세금제외)
                      title:"<spring:message code='par.lbl.purcAmt' />"
                     ,field:"invcAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"invcUnitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeInvcUnit(invcUnitCd)#'
                     ,editable:false
                     ,hidden:true
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"vatAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,hidden:true
                  }
                , {   //배송 PDC
                      title:"<spring:message code='par.lbl.dlPdcCd' />"
                     ,field:"dlPdcCd"
                     ,template:'#= changeDlPdcCd(dlPdcCd)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:140
                  }
                 ,{   //송장입고일자
                      title:"<spring:message code='sal.lbl.grDt' />"
                     ,field:"invcGrDt"
                     ,attributes:{ "style":"text-align:center"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,width:125
                     ,hidden:true
                  }
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

     // 배송PDC
        changeDlPdcCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = dlPdcCdObj[val];
            }
            return returnVal;
        };



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

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#gridRegInvc").data("kendoExtGrid").dataSource.data([]);
            $("#gridCnfmInvc").data("kendoExtGrid").dataSource.data([]);
            //$("#vatAmt").closest(".k-numerictextbox").addClass("form_readonly");
            //$("#vatAmt").data("kendoExtNumericTextBox").enable(false);
            //$("#invcTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
            //$("#invcTotAmt").data("kendoExtNumericTextBox").enable(false);

            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#sBpNm").val(sessionBpNm);

            $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(new Date(sevenDtBf));
            $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(new Date(toDt));

            $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


            $("#vatCd").data("kendoExtDropDownList").enable(false);
            $("#invcTp").data("kendoExtDropDownList").enable(false);
            $("#invcStatCd").data("kendoExtDropDownList").enable(false);
            tempGrid = {};

            btnView('I');

        }

        function btnView(pType){

            if(pType === "I"){ //초기화인 경우
                $("#btnDelInvcDoc").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCncl").data("kendoButton").enable(false);
            }else if(pType === "S"){//송장확정 후
                $("#btnDelInvcDoc").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCncl").data("kendoButton").enable(true);
            }else if(pType === "C"){ //송장 취소 후
                $("#btnDelInvcDoc").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCncl").data("kendoButton").enable(false);
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

           if(this.value() == null){
               if(id === 'sInvcDtFr'){
                   var minDate = new Date(sevenDtBf);
                       frYY = minDate.getFullYear();
                       frMM = minDate.getMonth();
                       frDD = minDate.getDate();
                       $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                       $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sInvcDtTo'){
                   var maxDate = new Date(toDt);
                       toYY = maxDate.getFullYear();
                       toMM = maxDate.getMonth();
                       toDD = maxDate.getDate();

                       $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                       $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else{
                   $("#" + id).data("kendoExtMaskedDatePicker").value(toDt);
               }
           }else{
               if(id === 'sInvcDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sInvcDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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
                            $("#gridRegInvc").data("kendoExtGrid").dataSource.data([]);
                            $("#gridCnfmInvc").data("kendoExtGrid").dataSource.data([]);
                        }
                    }
                }
            });
        }
        initPage();
    });
</script>
<!-- //script -->


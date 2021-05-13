<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 송장등록현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.invcRegStatus" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11613" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11612" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_save btn_s_min" id="btnSave"><spring:message code="par.btn.receiveRedy" /></button>
            </dms:access>
            <button type="button" id="btnDownloadList" name="btnDownloadList" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button><!--wangc 2021年5月12日17:38:59 增加导出按钮 -->
            <dms:access viewId="VIEW-D-11611" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
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
                            <input id="sInvcStatCd" class="form_comboBox" type="text" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- 확정일자 --></th>
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
            <%-- <h2 class="title_basic"><spring:message code="par.title.invcInfo" /></h2> --%>
            <div class="btn_right">
                <button class="btn_s btn_del btn_s_min5 hidden" id="btnCncl"><spring:message code="par.btn.cnclCnfmStatus" /></button>
                <button class="btn_s btn_del btn_s_min5 hidden" id="btnDelInvcDoc"><spring:message code="par.btn.delDoc" /></button>
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
                            <input id="arrvDtChar" class="form_input hidden form_readonly" readonly />
                            <input id="arrvTmChar" class="form_input hidden form_readonly" readonly />
                            <input id="regDtChar" class="form_input hidden form_readonly" readonly />
                            <input id="regUsrId" class="form_input hidden form_readonly" readonly />
                            <input id="updtDtStr" class="form_input hidden form_readonly" readonly />
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
            <div id="gridCnfmInvc" class="resizable_grid"></div>
        </div>
    </section>
</div>
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

    function setInvoiceArrvDePopupWindow(){

        setInvoiceArriveDtPopupWindow = dms.window.popup({
            windowId:"setInvoiceArriveDtPopupWindow"
            , title:"<spring:message code = 'par.title.setArrvDt'/>"   // 도착일자 선택
            , width:330
            , height:300
            , content:{
                url:"<c:url value='/par/cmm/setInvoiceArriveDtPopup.do'/>"
                ,data:{
                     "arrvDt":$("#arrvDt").data("kendoExtMaskedDateTimePicker").value()
                    ,"bpNm" :''
                    ,"callbackFunc":function(data){

                        var arrvYY,
                            arrvMM,
                            arrvDD,
                            arrvHH,
                            arrvMI,
                            arrvSS;
                        if(!dms.string.isEmpty(data)){
                            var arrvDate = new Date(data)
                            $("#arrvDt").data("kendoExtMaskedDateTimePicker").value(data);

                            arrvYY = arrvDate.getFullYear();
                            arrvMM = arrvDate.getMonth()+1;
                            arrvMM = dms.string.lpad(arrvMM.toString(),'0',2);
                            arrvDD = dms.string.lpad(arrvDate.getDate().toString(),'0',2);
                            arrvHH = dms.string.lpad(arrvDate.getHours().toString(),'0',2);
                            arrvMI = dms.string.lpad(arrvDate.getMinutes().toString(),'0',2);
                            arrvSS = dms.string.lpad(arrvDate.getMilliseconds().toString(),'0',2);

                            $("#arrvDtChar").val(arrvYY+''+arrvMM+''+arrvDD);
                            $("#arrvTmChar").val(arrvHH+''+arrvMI+''+'00');

                            fnCnfmInvoiceInfo();
                            setInvoiceArriveDtPopupWindow.close();
                        }
                    }
                }
            }
        });


    }

    var venderSearchPopupWin;
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

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

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

    function fnCnfmInvoiceInfo(){
        var saveList      = [],
            grid          = $("#gridCnfmInvc").data("kendoExtGrid"),
            rows          = grid.tbody.find("tr"),
            header;


        header = {
             invcDocNo       :$("#invcDocNo").val()
            ,mobisInvcNo     :$("#mobisInvcNo").val()
            ,arrvDtChar      :$("#arrvDtChar").val()
            ,arrvTmChar      :$("#arrvTmChar").val()
            ,regDtChar       :$("#regDtChar").val()
            ,regUsrId        :$("#regUsrId").val()
            ,updtDtStr       :$("#updtDtStr").val()
            ,grDocNo         :$("#invcDocNo").val()
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

        if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDateTimePicker").value())){
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
                var arrDt = $("#arrvDt").data("kendoExtMaskedDateTimePicker").value(),
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
                            ,"<c:url value='/par/pcm/receive/selectReceiveCnfmMain.do?pMobisInvcNo="+$("#mobisInvcNo").val()+"&pBpCd="+$("#bpCd").val()+"&pBpNm="+$("#bpNm").val()+"&pArrvYy="+arrYY+"&pArrvMm="+arrMM+"&pArrvDd="+arrDD+"&pInvcDocNo="+$("#invcDocNo").val()+"'/>", "VIEW-D-10186");

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
        $("#arrvDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
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
                setInvoiceArrvDePopupWindow();
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

                if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDateTimePicker").value())){
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
        /*$("#btnReceiveCnfm").kendoButton({
            click:function(e) {
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partInStockConfirm" />'
                        ,"<c:url value='/par/pcm/receive/selectReceiveCnfmMain.do'/>", "VIEW-D-10186");
            }
        });*/


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

                if(dms.string.isEmpty($("#arrvDt").data("kendoExtMaskedDateTimePicker").value())){
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
            gridId:"G-PAR-0831-171901"
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
                            , invcAmtCur     :{ type:"number"}
                            , invcTotAmt     :{ type:"number"}
                            , purcIncTaxAmt  :{ type:"number"}
                            , invcTotalLine  :{ type:"number"}
                            , invcSumQt      :{ type:"number"}
                            , invcCseCnt     :{ type:"number"}
                            , invcTspCode    :{ type:"string"}
                            , arrvDt         :{ type:"date"  }
                            , confirmDt      :{ type:"date"  }
                            , remark         :{ type:"string"}
                            , ifYn           :{ type:"string"}
                            , updtDtStr      :{ type:"string" }
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
                            $("#arrvDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.arrvDt);
                            $("#remark").val(selectedItem.remark);
                            $("#ifYn").val(selectedItem.ifYn);
                            $("#arrvDtChar").val(selectedItem.arrvDtChar);
                            $("#arrvTmChar").val(selectedItem.arrvTmChar);
                            $("#regDtChar").val(selectedItem.regDtChar);
                            $("#regUsrId").val(selectedItem.regUsrId);
                            $("#confirmDt").data("kendoExtMaskedDatePicker").value(selectedItem.confirmDt);
                            $("#updtDtStr").val(selectedItem.updtDtStr);


                            for(var i = 0;i < dataLen; i = i + 1  ){
                                result.data[i].purcRegDt = kendo.parseDate(result.data[i].purcRegDt);
                            }

                            gridData.dataSource.data(result.data);

                            if(selectedItem.invcStatCd === '02' || selectedItem.invcStatCd === '00'){
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
                {field:"rnum", title:"<spring:message code='par.lbl.no' />" ,width:50}
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:160}//송장번호
                ,{field:"invcDt", title:"<spring:message code='par.lbl.invcDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//송장일자
                ,{field:"invcStatCd", title:"<spring:message code='par.lbl.invcStatCd' />" ,width:80 ,attributes:{ "class":"ac"}
                    ,template:'#= changeInvcStat(invcStatCd)#'
                }//송장상태
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpTp' />" ,width:120}//공급업체
                ,{field:"trsfTp", title:"<spring:message code='par.lbl.trsfTp' />" ,attributes:{ "class":"ac"} ,width:120
                    //,template:'#= changeTrsfTp(trsfTp)#'
                }//운송유형
                ,{field:"invcTspCode", title:"<spring:message code='par.lbl.logisticsCmpn' />" ,width:120}//물류회사
                ,{field:"invcCseCnt", title:"<spring:message code='par.lbl.boxNo' />" ,attributes:{ "class":"ar"} ,width:120}//Box수량
                ,{field:"invcTotalLine", title:"<spring:message code='par.lbl.parCnt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품건수
                ,{field:"invcSumQt", title:"<spring:message code='par.lbl.itemQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품수량
                ,{field:"invcAmtCur", title:"<spring:message code='par.lbl.purcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                ,{field:"purcIncTaxAmt", title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"trsfAmt", title:"<spring:message code='par.lbl.trsfAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//운송비
                ,{field:"incAmt", title:"<spring:message code='par.lbl.incAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//보험비
                ,{field:"invcTotAmt", title:"<spring:message code='par.lbl.invcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//송장금액
                ,{field:"confirmDt", title:"<spring:message code='par.lbl.confirmDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//확정일자
                ,{field:"arrvDt", title:"<spring:message code='par.lbl.arrvDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateTimeFormat' />}" ,attributes:{ "class":"ac"}, hidden:true}//도착일자
                ,{field:"updtDtStr", title:" " ,width:90, hidden:true}//수정일시
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
            gridId:"G-PAR-0519-190202"
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
                             , invcIfOrdNo         :{ type:"string"}
                             , purcOrdLineNo       :{ type:"string"}
                             , purcOrdLineDetlNo   :{ type:"string"}
                             , purcRegDt           :{ type:"date"}
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
                             , avlbStockQty        :{ type:"number", editable:false }
                             , borrowQty           :{ type:"number", editable:false }
                             , rentQty             :{ type:"number", editable:false }
                             , stockQty            :{ type:"number", editable:false }
                             , resvStockQty        :{ type:"number", editable:false }
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
                {field:"purcOrdTp", title:"<spring:message code='par.lbl.purcOrdTp' />" ,width:160
                     ,template:'#= changePurcOrdTp(purcOrdTp)#'
                }//오더유형
                ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:140}//처리일자
                ,{field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:100}//구매오더번호
                ,{field:"invcIfOrdNo", title:"BMP <spring:message code='par.lbl.purcOrdNo' />" ,width:100}//BMP구매오더번호
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.supplyNo' />" ,width:140}//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:100}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                ,{field:"invcPrc" ,title:"<spring:message code='par.lbl.purcBasePrc' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.purcPriceTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(세금제외)
                ,{field:"invcQty" ,title:"<spring:message code='par.lbl.sendQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//발송수량
                ,{field:"invcAmt" ,title:"<spring:message code='par.lbl.purcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"dlPdcCd" ,title:"<spring:message code='par.lbl.dlPdcCd' />" ,attributes:{ "class":"ac"} ,width:140
                    ,template:'#= changeDlPdcCd(dlPdcCd)#'
                }//배송 PDC
                ,{title:"<spring:message code='par.lbl.strgeStockQty' />" ,field:"stockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//재고수량
                ,{title:"<spring:message code='par.lbl.avlbStockQty' />" ,field:"avlbStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//가용수량
                ,{title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,field:"resvStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//예약수량
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
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
        initPage();
        
      //excel的模板下载 wangc 2021年5月12日17:43:01
        $("#btnDownloadList").kendoButton({
            click:function(e){
            	dms.ajax.excelExport({
                    "beanName"         :"invcService"
                    ,"templateFile"    :"ElectronReceiptList_Tpl.xlsx"
                    ,"fileName"        :"电子发票信息列表.xlsx"
                    ,"sBpCd"             : $("#sBpCd").val()//供应商代码
                	,"sMobisInvcNo"      : $("#sMobisInvcNo").val()//装箱单编号
                	//,"sInvcDtFr"         : $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value()//确认日期
                	//,"sInvcDtTo"         : $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value()//确认日期
                	,"sInvcDtFr"         : $("#sInvcDtFr").val()//确认日期
                	,"sInvcDtTo"         : $("#sInvcDtTo").val()//确认日期
               		,"sInvcStatCd"       : $("#sInvcStatCd").data("kendoExtDropDownList").value()//装箱单状态
               		,"sServiceName"      :"invc"//电子发票信息和待入库清单
                });
            }
        });
    });
</script>
<!-- //script -->


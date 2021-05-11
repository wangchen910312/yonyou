<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 입고확정 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.receiveCnfmInfo" /> --%><!-- 입고확정 정보 --></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.receiveCnfm" /><!-- 입고확정 --></button>
                <!-- 조회기능 존재하지만 필요없어진 관계로 hidden처리함.(송장번호가 필요하기에 송장팝업으로 대체) -->
                <button class="btn_m btn_search hidden" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpNm" /><!-- 공급업체 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="sBpCd" name="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly/>
                                <input id="sBpNm" name="sBpTp" class="form_input hidden"  data-type="combo" required data-name="<spring:message code="par.lbl.custTp" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                       <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input form_readonly" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- 송장일자 --></th>
                        <td class="readonly_area">
                            <input id="sInvcDt" class="form_datepicker" data-type="maskDate" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.confirmDt" /><!-- 확정일자 --></th>
                        <td class="readonly_area">
                            <input id="sConfirmDt" class="form_datepicker" data-type="maskDate" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.arrvDt" /><!--도착일자 --></th>
                        <td class="readonly_area">
                            <input id="sArrvDt" class="form_datepicker" data-type="maskDate" readonly/>
                        </td>
                        <th scope="row" ><spring:message code="par.lbl.taxRate" /><!-- 세율 --></th>
                        <td>
                            <input id="dcRate" data-type="number" class="form_numeric form_readonly" readonly>
                        </td>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td class="hidden">
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td class="hidden">
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td class="hidden">
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td class="hidden">
                            <input id="sAbcInd" data-type="combo" class="form_comboBox">
                            <input id="sDlPdcCd" data-type="combo" class="form_comboBox hidden">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s"          id="btnInvcMng"><spring:message       code="par.btn.invcRef" /><!-- 송장관리(장상단도입) --></button>
                <button class="btn_s"          id="btnInvcListPop"><spring:message   code="par.btn.invcPop" /><!-- 송장리스트팝업 --></button>
                <button class="btn_s btn_add"  id="btnAddPurcOrd"><spring:message    code="par.btn.purcOrdRef" /></button>
                <button class="btn_s btn_file" id="btnExcelUpload"><spring:message   code="par.btn.uploadExcel" /></button>
                <button class="btn_s btn_add"  id="btnAddItem"><spring:message       code="par.btn.add" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 입고확정대상 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            sessionBpTp         = "${bpTp}",
            toDt                = "${toDt}",
            toDate              = new Date(toDt),
            sevenDtBf           = "${sevenDtBf}",
            pMobisInvcNo        = "${pMobisInvcNo}",
            pBpCd               = "${pBpCd}",
            pBpNm               = "${pBpNm}",
            pArrvYy             = "${pArrvYy}",
            pArrvMm             = "${pArrvMm}",
            pArrvDd             = "${pArrvDd}",
            pItemDistinCd       = "${pItemDistinCd}",
            purcOrdTpObj        = {},
            locationListObj     = {},
            locationObj         = {},
            invcUnitObj         = {},
            invcTpList          = [],
            invcTpObj           = {},
            invcStatList        = [],
            invcStatObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            abcIndList          = [],
            carlineCdList       = [],
            grStrgeTpList       = [],
            grStrgeTpObj        = {},
            claimTpList         = [],
            claimTpObj          = {},
            claimTargetTpList   = [],
            claimTargetTpObj    = {},
            purcItemTpList      = [],
            purcItemTpObj       = {},
            dlPdcCdList         = [],
            existItemChkObj     = {},
            checkdIds           = {},
            venderSearchPopupWin,
            searchItemPopupWindow,
            itemByBpCdPopupWindow,
            prevPurcOrdPopupWindow,
            invcListPopupWindow,
            searchTrsfTp,
            transObj;


        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${invcUnitList}" varStatus="status">
            invcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        grStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        claimTpObj[' '] = "";
        <c:forEach var="obj" items="${clTpList}" varStatus="status">
            claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        claimTargetTpObj[' '] = "";
        <c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
            claimTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        dlPdcCdList.push({cmmCd:"", cmmCdNm:"ALL"});
        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        abcIndList.push({cmmCd:"", cmmCdNm:"ALL"});
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        carlineCdList.push({cmmCd:"", cmmCdNm:"ALL"});
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
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

    $(document).ready(function() {

        //배송PDC선택
        $("#sDlPdcCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dlPdcCdList
            ,index:0
        });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:abcIndList
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:carlineCdList
           ,index:0
       });

        $("#sInvcDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sConfirmDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

     // 도착일자
        $("#sArrvDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

      //세유ㄹ
        $("#dcRate").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });


        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);



        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pMobisInvcNo = '';
                pBpCd = '';
                pBpNm = '';
                pArrvDt = '';
                initPage();
            }
        });

         // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                var bpCd          = $("#sBpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectItemPopupWindow();
            }
        });

      //버튼 - 추가
      /*
        $("#btnAdd").kendoButton({
            click:function(e) {
                var bpCd          = $("#sBpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }

                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "dlPdcCd"            :''
                    ,"itemCd"             :''
                    ,"itemNm"             :''
                    ,"invcDocNo"          :''
                    ,"invcDocLineNo"      :null
                    ,"invcDt"             :toDate
                    ,"purcOrdTp"          :'01'
                    ,"purcOrdNo"          :''
                    ,"purcOrdLineNo"      :null
                    ,"purcOrdLineDetlNo"  :''
                    ,"mobisInvcNo"        :''
                    ,"mobisInvcLineNo"    :null
                    ,"invcTargetQty"      :0
                    ,"invcQty"            :0
                    ,"compareQty"         :0
                    ,"invcUnitCd"         :'EA'
                    ,"prcTp"              :'01'
                    ,"invcPrc"            :0
                    //,"invcIncTaxPrc"    :0
                    ,"invcAmt"            :0
                    ,"invcTotAmt"         :0
                    ,"taxAmt"             :0
                    ,"taxDdctPrc"         :0
                    ,"grStrgeCd"          :''
                    ,"grLocCd"            :''
                    ,"claimQty"           :0
                    ,"claimTp"            :''
                    ,"claimTargCd"        :''
                    ,"dlBpCd"             :''
                    ,"dlBpNm"             :''
                    ,"reqCont"            :''
                    ,"dcRate"             :$("#dcRate").data("kendoExtNumericTextBox").value()
                 });
            }
        });
      */

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();


                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete existItemChkObj[l_rowData.itemCd];
                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

     // 송장관리
        $("#btnInvcMng").kendoButton({
            click:function(e) {
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partInvcSave" />'
                        ,"<c:url value='/par/pcm/invc/selectInvcList.do'/>", "VIEW-I-10164");
            }
        });

     // 송장리스트팝업
        $("#btnInvcListPop").kendoButton({
            click:function(e) {

                var bpCd = $("#sBpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectInvcListPopupWindow();
            }
        });

     // 엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {

                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

     // 구매오더 참조
        $("#btnAddPurcOrd").kendoButton({
            click:function(e) {

                var bpCd = $("#sBpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPrevPurcOrdPopupWindow();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                var bpCd          = $("#sBpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                existItemChkObj = {};
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    lCrud         = '',
                    paramUrl      = '',
                    chkRow,
                    header;

                header = {
                      bpCd            :$("#sBpCd").val()
                     ,mobisInvcNo     :$("#sMobisInvcNo").val()
                     ,arrvDt          :$("#sArrvDt").data("kendoExtMaskedDatePicker").value()
                };

                if(dms.string.isEmpty($("#sBpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){

                        if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.grStrgeCd)){
                            // 입고창고를 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                            saveList = [];
                            return false;
                        }

                        /*
                        if(dms.string.isEmpty(gridData.grLocCd)){
                            // 입고로케이션를 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.locationCd' var='grLocCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grLocCd}'/>");
                            saveList = [];
                            return false;
                        }*/

                        /*
                        if(gridData.claimQty > 0){

                            if(Number(gridData.claimQty) > Number(gridData.invcQty)){
                                // 클레임 수량이 입고확정수량보다 클 수 없습니다.
                                dms.notification.warning("<spring:message code='par.err.compareClaimInvcQty' />");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.claimTp)){
                                // 클레임 사유를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.claimTp' var='claimTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTp}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.claimTargCd)){
                                // 클레임 대상을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.claimTargetCd' var='claimTargetCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTargetCd}'/>");
                                saveList = [];
                                return false;
                            }else{
                                //클레임 대상이 배송처인 경우
                                if(gridData.claimTargCd === '02'){
                                    if(dms.string.isEmpty(gridData.dlBpCd)){
                                        // 배송업체를 선택하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                                        saveList = [];
                                        return false;
                                    }

                                    if(dms.string.isEmpty(gridData.dlBpNm)){
                                        // 배송업체를 선택하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                                        saveList = [];
                                        return false;
                                    }
                                }
                            }


                        }
                        */

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "invcVO"  :header
                          ,"invcItemList":saveList
                        };

                    $.ajax({
                         url:"<c:url value='/par/pcm/receive/insertReceiveCnfm.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {

                            if (result === 1) {
                                dms.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                                existItemChkObj = {};
                                $("#grid").data("kendoExtGrid").dataSource.read();

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                                }
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });
                }

              }
        });

        /**
         * grid 입고창고 DropDownList
         */
         grStrgeCdDropDownEditor = function(container, options) {


             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  grStrgeTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });
         };

        /**
         * grid 입고Location DropDownList
         */
         grLocCdDropDownEditor = function(container, options) {

            var itemCd = options.model.itemCd;

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  locationListObj[itemCd]
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });
         };

         /**
          * grid 구매단가&구매수량
          */
          changeInvcQtyEditor = function(container, options) {
              var input = $("<input/>"),
                  pValue;

              input.attr("name", options.field);

              input.keyup(function(){
                  if(options.field === 'invcQty'){

                      pValue = Math.floor( $(this).val());

                      /*if(pValue > options.model.invcTargetQty){
                          if(!dms.string.isEmpty(options.model.invcDocNo)){
                              options.model.set("invcQty", options.model.invcTargetQty);
                              if(options.model.dcRate > 0){
                                  options.model.set("invcAmt", (options.model.invcTargetQty * options.model.invcPrc));
                                  options.model.set("taxAmt",  options.model.invcTargetQty * options.model.invcPrc * options.model.dcRate);
                              }else{
                                  options.model.set("invcAmt", options.model.invcTargetQty * options.model.invcPrc);
                                  options.model.set("taxAmt",  0);
                              }
                          }else{
                              if(options.model.dcRate > 0){
                                  options.model.set("invcAmt", pValue * options.model.invcPrc);
                                  options.model.set("taxAmt",  pValue * options.model.invcPrc * options.model.dcRate);
                              }else{
                                  options.model.set("invcAmt", pValue * options.model.invcPrc);
                                  options.model.set("taxAmt",  0);
                              }
                          }


                      }else{*/
                          if(!dms.string.isEmpty(options.model.invcDocNo)){
                              options.model.set("compareQty", options.model.invcTargetQty -  pValue);
                          }

                          if(options.model.dcRate > 0){
                              options.model.set("invcTotAmt", pValue * options.model.invcPrc);
                              options.model.set("invcAmt",    pValue * options.model.invcPrc - (pValue * options.model.invcPrc * options.model.dcRate));
                              options.model.set("taxAmt",     pValue * options.model.invcPrc * options.model.dcRate);
                              options.model.set("taxDdctPrc", options.model.invcPrc - (options.model.invcPrc * options.model.dcRate));
                          }else{
                              options.model.set("invcTotAmt", pValue * options.model.invcPrc);
                              options.model.set("invcAmt",    pValue * options.model.invcPrc);
                              options.model.set("taxAmt",     0);
                              options.model.set("taxDdctPrc", options.model.invcPrc);
                          }
                      //}
                  }else if(options.field === 'dcRate'){
                      pValue = Number(Number( $(this).val()).toFixed(2));
                      if(options.model.dcRate > 0){
                          options.model.set("invcTotAmt", options.model.invcPrc * options.model.invcQty);
                          options.model.set("invcAmt",    options.model.invcPrc * options.model.invcQty - (options.model.invcPrc * options.model.invcQty * $(this).val()));
                          options.model.set("taxAmt",     options.model.invcPrc * options.model.invcQty * $(this).val());
                          options.model.set("taxDdctPrc", options.model.invcPrc - (options.model.invcPrc * $(this).val()));
                      }else{
                          options.model.set("invcTotAmt", options.model.invcPrc * options.model.invcQty);
                          options.model.set("invcAmt",    options.model.invcPrc * options.model.invcQty);
                          options.model.set("taxAmt",     0);
                          options.model.set("taxDdctPrc", options.model.invcPrc);
                      }
                  }else if(options.field === 'invcPrc'){
                      pValue = Number(Number( $(this).val()).toFixed(2));
                      console.log('pValue:',pValue);
                      console.log('typeof pValue:',typeof pValue);
                      console.log('$(this).val():',$(this).val());
                      console.log('options.model.dcRate:',options.model.dcRate);
                      console.log('options.model.invcQty:',options.model.invcQty);
                      if(options.model.dcRate > 0){
                          console.log('111');
                          options.model.set("invcTotAmt", $(this).val() * options.model.invcQty);
                          options.model.set("invcAmt",    $(this).val() * options.model.invcQty - ($(this).val() * options.model.invcQty * options.model.dcRate));
                          options.model.set("taxAmt",     $(this).val() * options.model.invcQty * options.model.dcRate);
                          options.model.set("taxDdctPrc", $(this).val() - ($(this).val() * options.model.dcRate));
                      }else{
                          console.log('222');
                          options.model.set("invcTotAmt", $(this).val() * options.model.invcQty);
                          options.model.set("invcAmt",    $(this).val() * options.model.invcQty);
                          options.model.set("taxAmt",     0);
                          options.model.set("taxDdctPrc", $(this).val());
                      }
                  }
              });

              input.blur(function(){
                 var resultGrid = $("#grid").data("kendoExtGrid"),
                     rows       = resultGrid.tbody.find("tr"),
                     totalAmt   = 0,
                     gridData;

                 if(!dms.string.isEmpty(pValue)){

                     if(options.field === 'invcQty'){
                         options.model.set("invcQty", pValue);
                     }else if(options.field === 'invcPrc'){
                         options.model.set("invcPrc", pValue);
                     }else if(options.field === 'dcRate'){
                         options.model.set("dcRate", pValue);
                     }

                 }

              });

              input.appendTo(container);
              input.kendoExtNumericTextBox({
                  min:0,
                  spinners:false
              });
          };

        /**
         * grid 클레임사유 DropDownList
         */
         grClaimTpDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });
         };

        /**
         * grid 클레임대상 DropDownList
         */
         claimTargCdDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTargetTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });


         };

      // 입고확정 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-0805-153701"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/invc/selectReceiveItemByCondition.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             console.log('operation:',operation);
                             params["sort"]               = options.sort;

                             // 입고확정대상 검색조건 코드.
                             //params["sDlPdcCd"]           = $("#sDlPdcCd").data("kendoExtDropDownList").value();
                             //params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                             //params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                             params["sBpCd"]              = $("#sBpCd").val();
                             //params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                             params["sMobisInvcNo"]       = $("#sMobisInvcNo").val();
                             //params["sItemCd"]            = $("#sItemCd").val();
                             //params["sItemNm"]            = $("#sItemNm").val();
                             //params["sInvcDtFr"]          = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                             //params["sInvcDt"]            = $("#sInvcDt").data("kendoExtMaskedDatePicker").value();
                             //params["sConfirmDt"]         = $("#sConfirmDt").data("kendoExtMaskedDatePicker").value();


                             console.log('params:',params);
                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){
                          var itemList = [];

                          if(result.total === 0){
                              dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }

                          for(var i = 0, dataLen = result.total; i < dataLen; i = i + 1 ){
                              itemList.push(result.data[i].itemCd);
                          }

                          var header = {
                                  sItemCdLst       :itemList
                          };

                          $.ajax({
                              url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
                             ,data:kendo.stringify(header)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,async:false
                             ,success:function(result) {

                                 locationListObj = {};

                                 locationObj[' '] = "";
                                 for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                                     if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                                         locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                                     }else{
                                         locationListObj[result.data[i].itemCd] = [];
                                         locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                                     }

                                     if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                                         locationObj[result.data[i].locCd] = result.data[i].locCd;
                                     }
                                 }

                             }
                             ,error:function(jqXHR,status,error) {
                                 dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                 return false;
                             }

                         });

                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"receiveNo"
                       ,fields:{
                               dlrCd               :{ type:"string" , validation:{required:true} }
                             , boxNo               :{ type:"string", editable:false }
                             , invcDocNo           :{ type:"string", editable:false }
                             , invcDocLineNo       :{ type:"number", editable:false }
                             , invcDt              :{ type:"date"  , editable:false }
                             , purcOrdTp           :{ type:"string", editable:false }
                             , purcOrdNo           :{ type:"string", editable:false }
                             , purcOrdLineNo       :{ type:"string", editable:false }
                             , bmpOrdNo            :{ type:"string", editable:false }
                             , bmpOrdLineNo        :{ type:"string", editable:false }
                             , purcOrdLineDetlNo   :{ type:"string", editable:false }
                             , mobisInvcNo         :{ type:"string", editable:false }
                             , mobisInvcLineNo     :{ type:"number", editable:false }
                             , itemCd              :{ type:"string" }
                             , itemNm              :{ type:"string" }
                             , invcTargetQty       :{ type:"number", editable:false }
                             , invcQty             :{ type:"number" }
                             , purcQty             :{ type:"number", editable:false}
                             , compareQty          :{ type:"number" }
                             , invcUnitCd          :{ type:"string" }
                             , invcTp              :{ type:"string", editable:false }
                             , invcStatCd          :{ type:"string", editable:false }
                             , prcTp               :{ type:"string", editable:false }
                             , invcPrc             :{ type:"number" }
                             , taxDdctPrc          :{ type:"number" }
                             //, invcIncTaxPrc       :{ type:"number" }
                             , invcAmt             :{ type:"number" }
                             , invcTotAmt          :{ type:"number" }
                             , taxAmt              :{ type:"number" }
                             , grStrgeCd           :{ type:"string" }
                             , grLocCd             :{ type:"string" }
                             //, claimUnitCd         :{ type:"string", editable:false}
                             , claimQty            :{ type:"number" }
                             , claimTp             :{ type:"string" }
                             , claimTargCd         :{ type:"string" }
                             , dlBpCd              :{ type:"string" }
                             , dlBpNm              :{ type:"string" }
                             , reqCont             :{ type:"string" }
                             , dcRate              :{ type:"number" }
                             , purcRegDt           :{ type:"date", editable:false }
                             , arrvDt              :{ type:"date", editable:false }
                             , dlPdcCd             :{ type:"string", editable:false }
                         }
                     }
                 }
             }
             , selectable :"multiple"
             , scrollable :true
             , sortable   :false
             , autoBind   :false
            // , multiSelectWithCheckbox:true
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                          if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                          }else {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                          }
                      });
                 }

              }
             , pageable:false
             , filterable:false
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             , edit:function(e){
                 var eles = e.container.find("input"),
                     rows = e.sender.select(),
                     selectedItem = e.sender.dataItem(rows[0]),
                     grid = this,
                     input = e.container.find(".k-input"),
                     pVal,
                     orgVal,
                     fieldName = grid.columns[e.container.index()].field;

                 console.log('selectedItem:',selectedItem);
                 console.log('selectedItem.invcDocNo:',selectedItem.invcDocNo);
                 console.log('selectedItem.prcTp:',selectedItem.prcTp);
                 if(fieldName === "dlBpNm"||fieldName === "taxAmt" || fieldName === "compareQty" || fieldName === "invcTargetQty"|| fieldName === "invcUnitCd"|| fieldName === "invcAmt"|| fieldName === "invcTotAmt"|| fieldName === "taxDdctPrc" ){
                      this.closeCell();
                 }else if(fieldName === "claimQty" || fieldName === "claimTp" || fieldName === "claimTargCd" || fieldName === "grStrgeCd" || fieldName === "grLocCd" || fieldName === "reqCont"|| fieldName === "invcQty"){
                     $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                 }else if(fieldName === "chk"){
                     this.closeCell();
                 }else if(fieldName === "invcPrc"||fieldName === "dcRate"  ){
                     if(!dms.string.isEmpty(selectedItem.invcDocNo)){
                         this.closeCell();
                     }else{
                         $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                     }
                 }else if(fieldName === "itemCd"){
                     if(!dms.string.isEmpty(selectedItem.invcDocNo)){
                         this.closeCell();
                     }else{
                         console.log('eles:', eles);
                         console.log('input:', input);
                         pVal = input.val();
                         orgVal = input.val();

                         console.log('pVal:', pVal);
                         console.log('selectedItem:', selectedItem);


                         input.keyup(function(){
                             pVal = input.val();
                         });

                         input.blur(function(){

                             console.log('a:',pVal, orgVal);
                             console.log('a:',existItemChkObj);

                             if(orgVal !== pVal){

                                 if(existItemChkObj.hasOwnProperty(pVal)){
                                     //이미 등록되어있는 부품입니다.
                                     var itemInfo = pVal;
                                     dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                     e.model.set('itemCd', orgVal);

                                     return false;
                                 }

                                 $.ajax({
                                     url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemByKey.do' />"
                                    ,data:kendo.stringify({sItemCd:pVal, sBpCd:$("#sBpCd").val()})
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,async:false
                                    ,success:function(result) {

                                        console.log('result111:',result);
                                        if (result.total === 1) {
                                            e.model.set('dlrCd', result.data[0].dlrCd);
                                            e.model.set('boxNo', '');
                                            e.model.set('dlPdcCd', '');
                                            e.model.set('purcOrdTp', '01');
                                            e.model.set('invcDocNo', '');
                                            e.model.set('invcDt', toDate);
                                            e.model.set('bmpOrdNo', "");
                                            e.model.set('bmpOrdLineNo', null);
                                            e.model.set('purcOrdNo', "");
                                            e.model.set('purcOrdLineNo', null);
                                            e.model.set('purcOrdLineDetlNo', "");
                                            e.model.set('mobisInvcNo', "");
                                            e.model.set('mobisInvcLineNo', null);
                                            e.model.set('itemCd', result.data[0].itemCd);
                                            e.model.set('itemNm', result.data[0].itemNm);
                                            e.model.set('invcUnitCd', result.data[0].stockUnitCd);
                                            e.model.set('invcQty', 1);
                                            e.model.set('invcTargetQty', 0);
                                            e.model.set('compareQty', 0);
                                            e.model.set('invcPrc', result.data[0].purcPrc);
                                            if($("#dcRate").data("kendoExtNumericTextBox").value() > 0){
                                                e.model.set('invcTotAmt',  result.data[0].purcPrc);
                                                e.model.set('invcAmt',     result.data[0].purcPrc - (result.data[0].purcPrc * $("#dcRate").data("kendoExtNumericTextBox").value()));
                                                e.model.set('taxAmt',      result.data[0].purcPrc * $("#dcRate").data("kendoExtNumericTextBox").value());
                                                e.model.set('taxDdctPrc',  result.data[0].purcPrc - (result.data[0].purcPrc * $("#dcRate").data("kendoExtNumericTextBox").value()));
                                            }else{
                                                e.model.set('invcTotAmt',  result.data[0].purcPrc);
                                                e.model.set('invcAmt',     result.data[0].purcPrc);
                                                e.model.set('taxAmt',      0);
                                                e.model.set('taxDdctPrc',  result.data[0].purcPrc);
                                            }
                                            //e.model.set('invcIncTaxPrc', result.data[0].purcPrc * $("#dcRate").data("kendoExtNumericTextBox").value());
                                            e.model.set('prcTp', result.data[0].prcTp);
                                            e.model.set('grStrgeCd', result.data[0].grStrgeCd);
                                            e.model.set('grLocCd', "");
                                            e.model.set('claimQty', 0);
                                            e.model.set('dcRate', $("#dcRate").data("kendoExtNumericTextBox").value());

                                            delete existItemChkObj[orgVal];

                                            existItemChkObj[pVal] = pVal;

                                        } else {
                                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                            e.model.set('itemCd', orgVal);
                                        }
                                    }
                                    ,error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                        e.model.set('itemCd', orgVal);
                                    }

                                });
                             }

                         });

                         $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);

                     }

                 }

              }
             , columns:[
                   {
                       title:"&nbsp;"
                      ,field:"chk"
                      ,width:30
                      ,attributes:{style:"text-align:center;"}
                      ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                      ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                      ,sortable:false
                   }
                 , {   //딜러코드
                       title:"<spring:message code='par.lbl.dlrCd' />"
                      ,field:"dlrCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //배송PDC창고
                       title:"<spring:message code='par.lbl.dlPdcCd' />"
                      ,field:"dlPdcCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //BOX NO
                       title:"BOX NO"
                      ,field:"boxNo"
                      ,width:100
                    }
                 ,{
                       field:"purcRegDt"
                      ,title:"<spring:message code='par.lbl.ordReqDt' />"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90
                   }                //구매신청일
                 , {   //BMP구매오더번호
                       title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,field:"bmpOrdNo"
                      ,width:100
                   }
                 , {   //구매오더번호
                       title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,field:"purcOrdNo"
                      ,width:100
                      ,hidden:true
                   }
                 , {   //오더신청자
                       title:"<spring:message code='par.lbl.ordRegId' />"
                      ,field:"ordRegUsrId"
                      ,width:120
                   }
                 , {   //Line
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"purcOrdLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:70
                      ,sortable:false
                      ,hidden:true
                   }
                 , {   //BMPLine
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"bmpOrdLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:70
                      ,sortable:false
                   }
                 , {   //라인구분자
                       title:" "
                      ,field:"purcOrdLineDetlNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:20
                      ,sortable:false
                   }
                 , {   //부품번호
                       title:"<spring:message code='par.lbl.itemCd' />"
                      ,field:"itemCd"
                      ,width:140
                   }
                 , {   //부품명
                       title:"<spring:message code='par.lbl.itemNm' />"
                      ,field:"itemNm"
                      ,width:200
                      ,sortable:false
                   }
                 , {   //단위
                       title:"<spring:message code='par.lbl.unitNm' />"
                      ,field:"invcUnitCd"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeInvcUnit(invcUnitCd)#'
                      ,hidden:true
                   }
                 , {   //송장번호
                       title:"<spring:message code='par.lbl.invcDocNo' />"
                      ,field:"invcDocNo"
                      ,width:100
                      ,hidden:true
                   }
                 , {   //송장번호
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"invcDocLineNo"
                      ,width:100
                      ,hidden:true
                   }
                 , {   //모비스송장번호
                       title:"<spring:message code='par.lbl.invcDocNo' />"
                      ,field:"mobisInvcNo"
                      ,width:140
                   }
                 , {   //송장유형
                       title:"<spring:message code='par.lbl.invcTp' />"
                      ,field:"invcTp"
                      ,template:'#= changeInvcTp(invcTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:120
                   }
                 , {   //INVOICE일자
                       title:"<spring:message code='par.lbl.invcDt' />"
                      ,field:"invcDt"
                      ,width:100
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
                 , {   //도착일자
                       title:"<spring:message code='par.lbl.invcDt' />"
                      ,field:"arrvDt"
                      ,width:100
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,hidden:true
                    }
                 , {   //송장라인번호
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"mobisInvcLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:40
                      ,sortable:false

                   }
                 , {   //오더유형
                       title:"<spring:message code='par.lbl.purcOrdTp' />"
                      ,field:"purcOrdTp"
                      ,template:'#= changePurcOrdTp(purcOrdTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:120
                      ,hidden:true
                   }
                 , {  //거래처 코드
                       title:"<spring:message code='par.lbl.bpCd' />"
                      ,field:"bpCd"
                      ,width:105
                      ,hidden:true
                   }
                 , {  //공급업체
                       title:"<spring:message code='par.lbl.bpCd' />"
                      ,field:"bpNm"
                      ,width:140
                      ,hidden:true
                   }
                 , {   //송장수량
                       title:"<spring:message code='par.lbl.invcQty' />"
                      ,field:"invcTargetQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                      ,sortable:false
                   }
                 , {   //오더수량
                       title:"<spring:message code='par.lbl.purcQty' />"
                      ,field:"purcQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                      ,sortable:false
                   }
                 , {   //입고수량
                       title:"<spring:message code='par.lbl.grQty' />"
                      ,field:"invcQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                      ,editor:changeInvcQtyEditor
                      ,sortable:false
                   }
                 , {   //차이수량
                       title:"<spring:message code='par.lbl.gapQty' />"
                      ,field:"compareQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                      ,sortable:false
                   }
                 , {   //차이사유
                       title:"<spring:message code='par.lbl.reasonCont' />"
                      ,width:140
                   }
                 , {   //입고창고
                       title:"<spring:message code='par.lbl.grStrgeCd' />"
                      ,field:"grStrgeCd"
                      ,width:100
                      ,editor:grStrgeCdDropDownEditor
                      ,template:'#= changeGrStrgeCd(grStrgeCd)#'
                      ,sortable:false
                   }
                 , {   //로케이션
                       title:"<spring:message code='par.lbl.locationCd' />"
                      ,field:"grLocCd"
                      ,width:140
                      ,editor:grLocCdDropDownEditor
                      ,template:'#= changeGrLocCd(grLocCd)#'
                      ,sortable:false
                   }
                 , {   //단가유형
                       title:"<spring:message code='par.lbl.prcTp' />"
                      ,field:"prcTp"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changePrcTp(prcTp)#'
                      ,hidden:true
                   }
                 , {   //입고단가(세금미포함)
                       title:"<spring:message code='par.lbl.grItemPrice' />"
                      ,field:"taxDdctPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //입고단가(포함)
                       title:"<spring:message code='par.lbl.grItemPriceTax' />"
                      ,field:"invcPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,editor:changeInvcQtyEditor
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //D/C Rate
                       title:"<spring:message code='par.lbl.taxRate' />"
                      ,field:"dcRate"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,editor:changeInvcQtyEditor
                      ,format:"{0:n2}"
                      ,decimal:0
                      ,hidden:true
                   }
                 , {   //입고금액(세금제외)
                       title:"<spring:message code='par.lbl.grAmt' />"
                      ,field:"invcAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //입고금액
                       title:"<spring:message code='par.lbl.grAmtTax' />"
                      ,field:"invcTotAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //세액
                       title:"<spring:message code='par.lbl.taxAmt' />"
                      ,field:"taxAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                      ,hidden:true
                   }
                 , {   //클레임수량
                       title:"<spring:message code='par.lbl.claimQty' />"
                      ,field:"claimQty"
                      ,width:70
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,editor:function(container, options){
                          var input = $("<input/>");

                          input.attr("name", options.field);
                          input.appendTo(container);
                          input.kendoExtNumericTextBox({
                              min:0,
                              spinners:false
                          });
                      }
                      ,decimal:0
                      ,sortable:false
                      ,hidden:true
                   }
                 , {   //클레임사유
                       title:"<spring:message code='par.lbl.claimTp' />"
                      ,field:"claimTp"
                      ,width:100
                      ,editor:grClaimTpDropDownEditor
                      ,template:'#= changeClaimTp(claimTp)#'
                      ,sortable:false
                      ,hidden:true
                   }
                 , {   //클레임대상
                       title:"<spring:message code='par.lbl.claimTargetCd' />"
                      ,field:"claimTargCd"
                      ,width:100
                      ,editor:claimTargCdDropDownEditor
                      ,template:'#= changeClaimTargCd(claimTargCd)#'
                      ,sortable:false
                      ,hidden:true
                   }
                 , {   //배송업체 코드
                       title:"<spring:message code='par.lbl.dlBpCd' />"
                      ,field:"dlBpCd"
                      ,width:105
                      ,hidden:true
                   }
                 , {   //배송업체 코드
                       title:"<spring:message code='par.lbl.dlBpCd' />"
                      ,field:"dlBpNm"
                      ,attributes:{ "style":"text-align:right"}
                      ,template:"<span>#:dlBpNm #<img src='<c:url value='/resources/img/btn_search.png'/>' style='float:right;cursor:pointer;' onclick='fnDlBpCdPop(this)'/></span>"
                      ,width:140
                      ,sortable:false
                      ,hidden:true
                   }
                 , {   //요청사항
                       title:"<spring:message code='par.lbl.reqCont' />"
                      ,field:"reqCont"
                      ,width:140
                      ,sortable:false
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

         // 송장상태
         changeInvcStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcStatObj[val];
             }
             return returnVal;
         };


         // 입고 창고
         changeGrStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = grStrgeTpObj[val];
             }
             return returnVal;
         };

         // 입고로케이션
         changeGrLocCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = locationObj[val];
             }
             return returnVal;
         };

         // 클레임사유
         changeClaimTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = claimTpObj[val];
             }
             return returnVal;
         };



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
                 //returnVal = invcUnitObj[val];
             }
             return returnVal;
         };

         //  오더유형
         changePurcOrdTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdTpObj[val];
             }
             return returnVal;
         };

        // 부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"itemCd":$("#sItemCd").val()
                        ,"itemDstinCd":pItemDistinCd
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sItemCd").val(data[0].itemCd);
                                $("#sItemNm").val(data[0].itemNm);

                            }
                            searchItemPopupWindow.close();
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

            //$("#grid").data("kendoExtGrid").dataSource.data([]);

            existItemChkObj = {};

            //$("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            //$("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅


          //송장관리에서 넘어온 경우
            if(!dms.string.isEmpty(pMobisInvcNo)){
                $("#sMobisInvcNo").val(pMobisInvcNo);
                $("#sBpCd").val(pBpCd);
                $("#sBpNm").val(pBpNm);
                $("#sArrvDt").data("kendoExtMaskedDatePicker").value(new Date(pArrvYy, pArrvMm, pArrvDd));
                $("#sMobisInvcNo").attr("disabled", true);
                $("#grid").data("kendoExtGrid").dataSource.read();
            }else{
                $("#sMobisInvcNo").attr("disabled", false);
                $("#grid").data("kendoExtGrid").dataSource.data([]);
            }

            if(!dms.string.isEmpty($("#sBpCd").val())){
                $("#btnAddPurcOrd").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
            }else{
                $("#btnAddPurcOrd").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
            }

            $("#dcRate").data("kendoExtNumericTextBox").value(0.17);
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
               if(id === 'sArrvDt'){
                       $("#sArrvDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
               }else if(id === 'sConfirmDt'){
                       $("#sConfirmDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
               }else if(id === 'sInvcDt'){
                       $("#sInvcDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
               }
           }else{
               if(id === 'sArrvDt'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sArrvDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sConfirmDt'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = sConfirmDt().getDate();
                   $("#sConfirmDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else if(id === 'sInvcDt'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = sConfirmDt().getDate();
                   $("#sInvcDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }

        }

        initPage();
    });

    function fnDlBpCdPop(e){
        var grid     = $("#grid").data("kendoExtGrid"),
            //rowIndex = grid.items().index(grid.select()),
            tr       = grid.select().closest("tr"),
            dataItem = grid.dataItem(tr);


        if(dataItem.claimTargCd === '02'){
            selectVenderMasterGridPopupWindow();

        }else{
            dms.notification.warning("<spring:message code='par.err.claimTargetChk' />");
        }

        //var selected = grid.select();
    }

     // 클레임대상
    changeClaimTargCd = function(val){
        var returnVal = "",
            grid     = $("#grid").data("kendoExtGrid"),
            rowIndex = grid.items().index(grid.select()),
            dataItem = grid.dataSource.at(rowIndex);


        if(val != null && val != ""){
            returnVal = claimTargetTpObj[val];

            if(!dms.string.isEmpty(dataItem)){
                if(dataItem.claimTargCd !== '02'){
                   dataItem.set("dlBpCd", '');
                   dataItem.set("dlBpNm", '');
                }
            }
        }
        return returnVal;
    };

    $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });



        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    function selectVenderMasterGridPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderMasterPopup"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,deactivate :false
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":true
                    ,"bpTp":'04'
                    ,"callbackFunc":function(data){
                        var grid     = $("#grid").data("kendoExtGrid"),
                            //rowIndex = grid.items().index(grid.select()),
                            tr       = grid.select().closest("tr"),
                            dataItem = grid.dataItem(tr);
                        //$("#sBpCd").val(data[0].bpCd);
                        //$("#sBpNm").val(data[0].bpNm);
                        dataItem.set("dlBpCd", data[0].bpCd);
                        dataItem.set("dlBpNm", data[0].bpNm);
                      //  dataItem.dlBpCd = data[0].bpCd;
                      //  dataItem.dlBpNm = data[0].bpNm;
                    }
                }
            }
        });
    }

  //부품 팝업 열기 함수.
    function selectItemPopupWindow(){

      console.log('selectItemPopupWindow');
        itemByBpCdPopupWindow = dms.window.popup({
              windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , width:860
            , height:550
            , content:{
                url:"<c:url value='/par/cmm/selectItemPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#sBpCd").val()
                    , "bpNm":$("#sBpNm").val()
                    , "bpTp":""
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"multiple"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            popItemData  = {},
                            dcRate       = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            tDate,
                            rows;

                        for(var i = 0; i < dataLen; i = i + 1){
                            //내용

                            popItemData.dlrCd              = data[i].dlrCd;
                            popItemData.dlPdcCd            = "";
                            popItemData.purcOrdTp          = "01";
                            popItemData.prcTp              = "01";
                            popItemData.invcTp             = "01";
                            popItemData.invcStatCd         = "02";
                            popItemData.invcDocNo          = "";
                            popItemData.invcDt             = toDate;
                            popItemData.bmpOrdNo           = "";
                            popItemData.bmpOrdLineNo       = null;
                            popItemData.purcOrdNo          = "";
                            popItemData.purcOrdLineNo      = null;
                            popItemData.purcOrdLineDetlNo = "";
                            popItemData.mobisInvcNo        = "";
                            popItemData.mobisInvcLineNo    = null;
                            popItemData.itemCd             = data[i].itemCd;
                            popItemData.itemNm             = data[i].itemNm;
                            popItemData.invcUnitCd         = data[i].stockUnitCd;
                            popItemData.invcQty            = 1;
                            popItemData.invcTargetQty      = 0;
                            popItemData.compareQty         = 0;
                            popItemData.invcPrc            = data[i].purcPrc;
                            //popItemData.invcIncTaxPrc      = (data[i].purcPrc + (data[i].purcPrc * 0.17));
                            if( dcRate> 0){
                                popItemData.invcTotAmt         = data[i].purcPrc;
                                popItemData.invcAmt            = data[i].purcPrc - (data[i].purcPrc * dcRate);
                                popItemData.taxAmt             = data[i].purcPrc * dcRate;
                                popItemData.taxDdctPrc         = data[i].purcPrc - (data[i].purcPrc * dcRate);
                            }else{
                                popItemData.invcTotAmt         = data[i].purcPrc;
                                popItemData.invcAmt            = data[i].purcPrc;
                                popItemData.taxAmt             = 0;
                                popItemData.taxDdctPrc         = data[i].purcPrc;
                            }

                            popItemData.grStrgeCd          = data[i].grStrgeCd;
                            popItemData.grLocCd            = "";
                            popItemData.claimQty           = 0;
                            popItemData.claimTp            = "";
                            popItemData.claimTargCd        = "";
                            popItemData.dlBpCd             = "";
                            popItemData.dlBpNm             = "";
                            popItemData.reqCont            = "";
                            popItemData.dcRate             = $("#dcRate").data("kendoExtNumericTextBox").value();


                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;;
                                gridData.dataSource.add(popItemData);
                            }
                        }

                        gridData.select(gridData.tbody.find(">tr"));
                        itemByBpCdPopupWindow.close();
                    }
                }
            }
        });
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

                        existItemChkObj = {};

                        $("#sBpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                        $("#sBpNm").val(data[0].bpNm);
                        $("#sBpTp").val(data[0].bpTp);
                        $("#grid").data("kendoExtGrid").dataSource.data([]);


                        $("#btnAddPurcOrd").data("kendoButton").enable(true);
                        $("#btnExcelUpload").data("kendoButton").enable(true);
                        $("#btnAddItem").data("kendoButton").enable(true);
                        $("#btnDelItem").data("kendoButton").enable(true);
                    }
                }
            }
        });
    }

  //구매오더 복사 팝업 열기 함수.
    function selectPrevPurcOrdPopupWindow(){

        prevPurcOrdPopupWindow = dms.window.popup({
            windowId:"PrevPurcOrdPopup"
            , title:"<spring:message code='par.title.purcOrdCopy' />"   // 구매오더 복사
            , width:860
            , height:450
            , content:{
                url:"<c:url value='/par/cmm/selectPrevPurcOrdPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#sBpCd").val()
                    , "bpNm":$("#sBpNm").val()
                    , "itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            popPrevData  = {};


                        for(var i = 0; i < dataLen; i = i + 1){

                            // 구매오더 조회.
                            //selectCopyPurcOrd(data[i].purcOrdNo);


                        //}
                            popPrevData.dlrCd              = data[i].dlrCd;
                            popPrevData.dlPdcCd            = "";
                            popPrevData.purcOrdTp          = "01";
                            popPrevData.invcTp             = "01";
                            popPrevData.invcStatCd         = "02";
                            popPrevData.prcTp              = data[i].prcTp;
                            popPrevData.invcDocNo          = "";
                            popPrevData.invcDt             = toDate;
                            popPrevData.bmpOrdNo          = "";
                            popPrevData.bmpOrdLineNo      = null;
                            popPrevData.purcOrdNo          = "";
                            popPrevData.purcOrdLineNo      = null;
                            popPrevData.purcOrdLineDetlNo = "";
                            popPrevData.mobisInvcNo        = "";
                            popPrevData.mobisInvcLineNo    = null;
                            popPrevData.itemCd             = data[i].itemCd;
                            popPrevData.itemNm             = data[i].itemNm;
                            popPrevData.invcUnitCd         = data[i].purcUnitCd;
                            popPrevData.invcQty            = data[i].purcQty;
                            popPrevData.invcTargetQty      = 0;
                            popPrevData.compareQty         = 0;
                            popPrevData.invcPrc            = data[i].purcPrc;
                            //popPrevData.invcIncTaxPrc      = 0;//(data[i].purcPrc + (data[i].purcPrc * 0.17));
                            if( dcRate> 0){
                                popPrevData.invcTotAmt         = data[i].purcAmt;
                                popPrevData.invcAmt            = data[i].purcAmt - (data[i].purcAmt * dcRate);
                                popPrevData.taxAmt             = data[i].purcAmt * dcRate;
                                popPrevData.taxDdctPrc         = data[i].purcPrc - (data[i].purcPrc * dcRate);
                            }else{
                                popPrevData.invcTotAmt         = data[i].purcAmt;
                                popPrevData.invcAmt            = data[i].purcAmt;
                                popPrevData.taxAmt             = 0;
                                popPrevData.taxDdctPrc         = data[i].purcPrc;
                            }
                            popPrevData.grStrgeCd          = data[i].grStrgeCd;
                            popPrevData.grLocCd            = "";
                            popPrevData.claimQty           = 0;
                            popPrevData.claimTp            = "";
                            popPrevData.claimTargCd        = "";
                            popPrevData.dlBpCd             = "";
                            popPrevData.dlBpNm             = "";
                            popPrevData.reqCont            = "";

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;;
                                gridData.dataSource.add(popPrevData);
                            }
                        }
                        prevPurcOrdPopupWindow.close();

                    }
                }
            }
        });
    }
  //송장리스트 팝업 열기 함수.
    function selectInvcListPopupWindow(){

        invcListPopupWindow = dms.window.popup({
            windowId:"invcListPopup"
            , title:"<spring:message code='par.title.invcList' />"   // 송장목록
            , width:860
            , height:450
            , content:{
                url:"<c:url value='/par/cmm/selectInvcListPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#sBpCd").val()
                    , "bpNm":$("#sBpNm").val()
                    , "invcStatCd":'02'
                    , "itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        $("#sMobisInvcNo").val(data[0].mobisInvcNo);
                        $("#sArrvDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].arrvDt));
                        $("#sInvcDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].invcDt));
                        $("#sConfirmDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].confirmDt));
                        //$("#sMobisInvcNo").attr("disabled", true);
                        invcListPopupWindow.close();

                        existItemChkObj = {};
                        $("#grid").data("kendoExtGrid").dataSource.read();

                    }
                }
            }
        });
    }

 // 구매 복사 적용.
    function selectCopyPurcOrd(pPurcOrdNo){

        $.ajax({
            url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItemByKey.do' />",
            data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {

            var dataLen      = result.data.length,
                gridData     = $("#grid").data("kendoExtGrid"),
                popPrevData  = {};

            for(var i = 0; i < dataLen; i = i + 1){

                popPrevData.dlrCd              = result.data[i].dlrCd;
                popPrevData.dlPdcCd            = "";
                popPrevData.purcOrdTp          = "01";
                popPrevData.invcTp             = "01";
                popPrevData.invcStatCd         = "02";
                popPrevData.prcTp              = result.data[i].prcTp;
                popPrevData.invcDocNo          = "";
                popPrevData.invcDt             = toDate;
                popPrevData.purcOrdNo          = "";
                popPrevData.purcOrdLineNo      = null;
                popPrevData.bmpOrdNo          = "";
                popPrevData.bmpOrdLineNo      = null;
                popPrevData.purcOrdLineDetlNo = "";
                popPrevData.mobisInvcNo        = "";
                popPrevData.mobisInvcLineNo    = null;
                popPrevData.itemCd             = result.data[i].itemCd;
                popPrevData.itemNm             = result.data[i].itemNm;
                popPrevData.invcUnitCd         = result.data[i].purcUnitCd;
                popPrevData.invcQty            = result.data[i].purcQty;
                popPrevData.invcTargetQty      = 0;
                popPrevData.compareQty         = 0;
                popPrevData.invcPrc            = result.data[i].purcPrc;
                //popPrevData.invcIncTaxPrc      = 0;//(data[i].purcPrc + (data[i].purcPrc * 0.17));
                if( dcRate> 0){
                    popPrevData.invcTotAmt         = result.data[i].purcAmt;
                    popPrevData.invcAmt            = result.data[i].purcAmt - (result.data[i].purcAmt * dcRate);
                    popPrevData.taxAmt             = result.data[i].purcAmt * dcRate;
                    popPrevData.taxDdctPrc         = result.data[i].purcPrc - (result.data[i].purcPrc * dcRate);
                }else{
                    popPrevData.invcTotAmt         = result.data[i].purcAmt;
                    popPrevData.invcAmt            = result.data[i].purcAmt;
                    popPrevData.taxAmt             = 0;
                    popPrevData.taxDdctPrc         = result.data[i].purcPrc;
                }
                popPrevData.grStrgeCd          = result.data[i].grStrgeCd;
                popPrevData.grLocCd            = "";
                popPrevData.claimQty           = 0;
                popPrevData.claimTp            = "";
                popPrevData.claimTargCd        = "";
                popPrevData.dlBpCd             = "";
                popPrevData.dlBpNm             = "";
                popPrevData.reqCont            = "";

                if(existItemChkObj.hasOwnProperty(result.data[i].itemCd)){
                    //이미 등록되어있는 부품입니다.
                    var itemInfo = result.data[i].itemCd + '[' + result.data[i].itemNm + ']';
                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                }else{
                    existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;;
                    gridData.dataSource.add(popPrevData);
                }
            }

        });
    }
</script>
<!-- //script -->
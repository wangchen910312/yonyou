<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 고객정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.lbl.custInfo" /> --%><!-- 고객 정보 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /></button><!--취소  -->
                <button class="btn_m" id="btnReturn"><spring:message code="par.btn.invReturn" /></button><!--반품  -->
                <button class="btn_m" id="btnCnfm"><spring:message code="par.btn.fix" /></button><!--확정  -->
                <button class="btn_m" id="btnPrint"><spring:message code="par.btn.receivePrint" /></button><!--인쇄 -->
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.salePriceCreate" /><!-- 생성 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                        <td>
                            <input id="custTp" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.saleType" /><!-- 판매유형 --></span></th>
                        <td class="required_area">
                            <input id="saleTp" name="saleTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.saleType" />" class="form_comboBox"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parSaleOrdNo" /><!-- 판매오더번호 --></th>
                        <td>
                            <input id="parSaleOrdNo" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="custNm" class="form_input" />
                                <input type="text" id="custCd" class="form_input hidden" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="ordStatCd" type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.orderDt" /><!-- 오더일 --></th>
                        <td>
                            <input id="ordDt" type="text" class="form_datepicker" data-type="maskDate">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.title.venderTel" /><!-- 연락처 --></th>
                        <td>
                            <input id=custTelNo type="text" class="form_input">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.prsNm" /><!-- 담당자 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="saId" name="saId" class="form_input hidden" required data-name="<spring:message code="par.lbl.prsNm" />" readonly />
                                <input type="text" id="saNm" name="saNm" class="form_input form_readonly" required data-name="<spring:message code="par.lbl.prsNm" />" readonly />
                                <a id="searchSaId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dcRate" /><!-- 할인율 --></th>
                        <td>
                            <input id="dcRate" data-type="number" min="0" class="form_numeric">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="3">
                            <input id="remark" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="refId"  class="form_input hidden"  readonly />
                                <input type="text" id="refNm"  class="form_input form_readonly" readonly />
                                <a id="searchSaId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.totAmtBefDc" /><!-- 할인전총액 --></th>
                        <td>
                            <input id="dcBefTotAmt" name="dcBefTotAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmtBefDc" />"/>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.dcAmt" /><!-- 할인가격 --></th>
                        <td>
                            <input id="dcAmt" name="dcAmt" data-type="number" min="0" class="form_numeric" readonly data-name="<spring:message code="sal.lbl.dcAmt" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 총액 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add"  id="btnPackage"><spring:message       code="par.btn.package" /></button>
                <button class="btn_s btn_add"  id="btnAddItem"><spring:message       code="par.btn.itemPop" /></button>
                <button class="btn_s btn_file" id="btnCopyFromExcel"><spring:message code="par.btn.copyFromExcel" /></button>
                <button class="btn_s btn_add"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div>
            <!-- 부품판매 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //부품판매 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        pParSalesOrdNo      = "${pParSalesOrdNo}",
        gCrud               = "C",
        custTpList          = [],
        ordStatCdList       = [],
        saleTpList          = [],
        giStrgeTpList       = [],
        saleTpObj           = {},
        giStrgeTpObj        = {},
        unitCdObj           = {},
        prcTpObj            = {},
        tempGrid            = {},
        itemDstinCdObj      = {},
        popItemObj          = {},
        locationObj         = {},
        locationListObj     = {},
        itemSalePrcPopupWindow,
        userSearchPopupWin,
        customerSearchPopupWin,
        workPackagePopup,
        popupWindow,
        changeAmtEditor,
        changePrcTp,
        changeUnitCd,
        changeItemDstinCd;


        locationObj[' '] = "";
        custTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${custTpList}" varStatus="status">
            custTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>

        ordStatCdList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">
            ordStatCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>

        saleTpList.push({cmmCd:" ", cmmCdNm:" "});
        saleTpObj[' '] = "";
        <c:forEach var="obj" items="${saleTpList}" varStatus="status">
            saleTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        giStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            giStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

    $(document).ready(function() {
        var validator = $("#searchForm").kendoExtValidator().data("kendoExtValidator");

        //고객유형선택
        $("#custTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        //오더상태선택
        $("#ordStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,index:0
        });

        //판매유형
        $("#saleTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        //오더일
        $("#ordDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //D/C Rate
        $("#dcRate").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        //할인전 총계
        $("#dcBefTotAmt").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //할인금액
        $("#dcAmt").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        // 연락처
        $("#custTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:"_"
        });



        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pParSalesOrdNo = ''; //판매현황 화면에서 넘어온 판매번호 삭제.
                gCrud      = "C";
                initPage();
            }
        });

        $("#searchSaId").on('click', userSearchPopup);

        $("#searchCustCd").on('click', custSearchPopup);

        $("#custTp").on('change', fnChangeCustTp);


        // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){

                /*if(dms.string.isEmpty($("#custTp").data("kendoExtDropDownList").value())){
                    //고객유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
                    return false;
                }*/

                if(dms.string.isEmpty($("#saleTp").data("kendoExtDropDownList").value())){
                    //판매유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.saleType' var='saleType' /><spring:message code='global.info.required.field' arguments='${saleType}'/>");
                    return false;
                }

                //if (validator.validate()) {
                    selectItemSalePrcPopupWindow();
                //}
            }
        });

        //패키지 버튼
        $("#btnPackage").kendoButton({
            click:function(e){

                selectWorkPackagePopupWindow();
            }
        });

        // 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        // 인쇄
        $("#btnPrint").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        // 반품
        $("#btnReturn").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        // copy from excel
        $("#btnCopyFromExcel").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "parSaleOrdNo"      :''
                    ,"parSaleOrdLineNo"  :''
                    ,"itemDstinCd"       :'02'
                    ,"itemCd"            :''
                    ,"itemNm"            :''
                    ,"unitCd"            :''
                    ,"giStrgeCd"         :''
                    ,"giLocCd"            :''
                    ,"saleTp"            :$("#saleTp").data("kendoExtDropDownList").value()
                    ,"ordQty"            :0
                    ,"prcTp"             :$("#saleTp").data("kendoExtDropDownList").value()
                    ,"prc"               :0
                    ,"dcRate"            :$("#dcRate").data("kendoExtNumericTextBox").value()
                    ,"amt"               :0
                    ,"avlbStockQty"      :0
                    ,"eqipExpcDt"        :''
                 });

            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();


                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete popItemObj[l_rowData.itemCd];
                    delete locationObj[l_rowData.itemCd];
                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){

                var paramUrl      = '',
                    header;

                if (!validator.validate()) {
                     return false;
                }

                header = {
                        parSaleOrdNo    :$('#parSaleOrdNo').val()
                };

                $.ajax({
                    url:"<c:url value='/par/ism/issue/cancelPartsSaleOrd.do' />"
                   ,data:kendo.stringify(header)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {

                       if (result === true) {
                           dms.notification.success("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.delSuccessParam' arguments='${parSaleOrdNo}'/>");

                           initPage();
                       } else {
                           console.log('errorResult:',result);
                           if(result === 0){
                               dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.err.delFailedParam' arguments='${parSaleOrdNo}'/>");
                           }
                       }
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });
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
                    header;

                if (!validator.validate()) {
                     return false;
                }

                header = {
                        ordDt           :$("#ordDt").data("kendoExtMaskedDatePicker").value()
                      , saleTp          :$("#saleTp").data("kendoExtDropDownList").value()
                      , custTp          :$("#custTp").data("kendoExtDropDownList").value()
                      , custCd          :$("#custCd").val()
                      , custNm          :$("#custNm").val()
                      , custTelNo       :$("#custTelNo").data("kendoMaskedTextBox").value()
                      , saId            :$("#saId").val()
                      , dcRate          :$("#dcRate").data("kendoExtNumericTextBox").value()
                      , dcBefTotAmt     :$("#dcBefTotAmt").data("kendoExtNumericTextBox").value()
                      , dcAmt           :$("#dcAmt").data("kendoExtNumericTextBox").value()
                      , totAmt          :$("#totAmt").data("kendoExtNumericTextBox").value()
                      , remark          :$("#remark").val()
                };

                console.log('gCrud:',gCrud);
                if(gCrud === "C"){
                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(!dms.string.isEmpty(gridData.itemCd)){
                            if(dms.string.isEmpty(gridData.ordQty) || gridData.ordQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.itemCd)){
                                // 부품을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }
                            
                            if(dms.string.isEmpty(gridData.giLocCd)){
                                // 로케이션을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.locationCd' var='locCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${locCd}'/>");
                                saveList = [];
                                return false;
                            }
                            
                            if(Number(gridData.ordQty) > Number(gridData.avlbStockQty)){
                                // 가용재고보다 클 수 없음.
                                dms.notification.warning("<spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${avlbStockQty}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                               "partsSaleOrdVO":header
                              ,"partsSaleOrdItemList":saveList
                            };
                        console.log("saveData::"+kendo.stringify(data),paramUrl );

                        $.ajax({
                             url:"<c:url value='/par/ism/issue/createPartsSaleOrd.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                if (result.resultYn == true) {
                                    dms.notification.success("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.regSuccessParam' arguments='${parSaleOrdNo}'/>");

                                    console.log('result:',result);
                                    pParSalesOrdNo = result.parSaleOrdNo;
                                    $('#parSaleOrdNo').val(result.parSaleOrdNo);
                                    $("#ordStatCd").data("kendoExtDropDownList").value(result.ordStatCd);
                                    // 부품판매 조회.
                                    selectPartsSaleOrd(pParSalesOrdNo);

                                } else {
                                    console.log('errorResult:',result);
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.err.regFailedParam' arguments='${parSaleOrdNo}'/>");
                                    }
                                }
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });
                    }
                }else if(gCrud === "U"){
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
                        insertListLeng = saveData.insertList.length;


                    for(var i = insertListLeng-1; i >= 0; i = i - 1){
                        if(dms.string.isEmpty(saveData.insertList[i].itemCd)){
                            saveData.insertList.splice(i,1);
                        }
                    }

                    header.parSaleOrdNo = $('#parSaleOrdNo').val();

                    saveData.partsSaleOrdVO = header;

                    if (grid.cudDataLength == 0) {
                            $.ajax({
                                url:"<c:url value='/par/ism/issue/updatePartsSaleOrd.do' />"
                               ,data:kendo.stringify(header)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {
                                    console.log('result:',result);
                                   if (result === 1) {
                                       dms.notification.success("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.modifySuccessParam' arguments='${parSaleOrdNo}'/>");

                                       // 부품판매 조회.
                                       selectPartsSaleOrd(pParSalesOrdNo);

                                   } else {
                                       console.log('errorResult:',result);
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.err.modifyFailedParam' arguments='${parSaleOrdNo}'/>");
                                       }
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }

                           });
                    }else{
                        if (grid.gridValidation()) {

                            console.log('saveData:', saveData);
                            $.ajax({
                                url:"<c:url value='/par/ism/issue/multiPartsSaleOrds.do' />"
                               ,data:kendo.stringify(saveData)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   if (result === true) {
                                       dms.notification.success("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.modifySuccessParam' arguments='${parSaleOrdNo}'/>");

                                       // 부품판매 조회.
                                       selectPartsSaleOrd(pParSalesOrdNo);

                                   } else {
                                       console.log('errorResult:',result);
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.err.modifyFailedParam' arguments='${parSaleOrdNo}'/>");
                                       }
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }

                           });
                        }
                    }

                }else{
                   alert('CRUD정보가 없습니다.');
                }
              }
        });

        // 확정 버튼
        $("#btnCnfm").kendoButton({
            click:function(e){

                var grid           = $("#grid").data("kendoExtGrid"),
                    rows           = grid.tbody.find("tr"),
                    saveData       = grid.getCUDData("insertList", "updateList", "deleteList"),
                    insertListLeng = saveData.insertList.length,
                    lCrud          = '',
                    paramUrl       = '',
                    header;

                if (!validator.validate()) {
                     return false;
                }

                header = {
                        parSaleOrdNo    :$('#parSaleOrdNo').val()
                      , ordDt           :$("#ordDt").data("kendoExtMaskedDatePicker").value()
                      , saleTp          :$("#saleTp").data("kendoExtDropDownList").value()
                      , custTp          :$("#custTp").data("kendoExtDropDownList").value()
                      , custCd          :$("#custCd").val()
                      , custNm          :$("#custNm").val()
                      , custTelNo       :$("#custTelNo").data("kendoMaskedTextBox").value()
                      , saId            :$("#saId").val()
                      , dcRate          :$("#dcRate").data("kendoExtNumericTextBox").value()
                      , dcBefTotAmt     :$("#dcBefTotAmt").data("kendoExtNumericTextBox").value()
                      , dcAmt           :$("#dcAmt").data("kendoExtNumericTextBox").value()
                      , totAmt          :$("#totAmt").data("kendoExtNumericTextBox").value()
                      , remark          :$("#remark").val()
                };

                saveData.partsSaleOrdVO = header;
                saveData.updateList = grid.dataSource._data;
                console.log('saveData:'+kendo.stringify(saveData));

                $.ajax({
                    url:"<c:url value='/par/ism/issue/cnfmPartsSaleOrd.do' />"
                   ,data:kendo.stringify(saveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {

                       if (result === true) {
                           dms.notification.success("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${parSaleOrdNo}'/>");

                           // 부품판매 조회.
                           selectPartsSaleOrd(pParSalesOrdNo);

                       } else {
                           console.log('errorResult:',result);
                           if(result === 0){
                               dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
                           }
                       }
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });

              }
        });


        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {
             var input = $("<input/>"),
                 pValue;

             input.attr("name", options.field);

             input.keyup(function(){

             });

             input.blur(function(){
                 if(options.field === 'ordQty'){
                     pValue = Math.floor( $(this).val());
                     if(options.model.dcRate === 0){
                         options.model.set("amt", options.model.prc * pValue);
                     }else{
                         options.model.set("amt", (options.model.prc * pValue) - (options.model.prc * pValue * options.model.dcRate));
                     }
                 }else if(options.field === 'dcRate'){
                     pValue =  Number(Number($(this).val()).toFixed(2));
                     if(pValue === 0){
                         options.model.set("amt", options.model.prc * options.model.ordQty);
                     }else{
                         options.model.set("amt", (options.model.prc * options.model.ordQty) - (options.model.prc * options.model.ordQty * pValue));
                     }
                 }else if(options.field === 'prc'){
                     pValue =  Number(Number($(this).val()).toFixed(2));
                     if(options.model.dcRate === 0){
                         options.model.set("amt", pValue * options.model.ordQty);
                     }else{
                         options.model.set("amt", (pValue * options.model.ordQty) - (pValue * options.model.ordQty * options.model.dcRate));
                     }
                 }

                 fnSetAmtInfo();

             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 min:0,
                 spinners:false
             });
         };

         /**
          * grid 출고창고 DropDownList
          */
          giStrgeCdDropDownEditor = function(container, options) {

             console.log('giStrgeCdDropDownEditor:',arguments);

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  giStrgeTpList
              });
          };
         /**
          * grid 출고Location DropDownList
          */
          giLocCdDropDownEditor = function(container, options) {

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
          * grid 판매우형 DropDownList
          */
          saleTpDropDownEditor = function(container, options) {

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  saleTpList
              });
          };

        // 부품판매등록 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/ism/issue/selectPartsSaleOrdItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 판매현황 검색조건 코드.
                            params["sParSaleOrdNo"] = $("#parSaleOrdNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen = result.data.length;
                         for(var i = 0; i < dataLen; i = i + 1){
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                              parSaleOrdNo      :{ type:"string" }
                            , parSaleOrdLineNo  :{ type:"number" }
                            , saleTp            :{ type:"string" }
                            , itemDstinCd       :{ type:"string" } //품목구분
                            , itemCd            :{ type:"string" }
                            , itemNm            :{ type:"string" }
                            , unitCd            :{ type:"string" }
                            , ordQty            :{ type:"number" }
                            , prcTp             :{ type:"string" }
                            , prc               :{ type:"number" }
                            , amt               :{ type:"number" }
                            , dcRate            :{ type:"number" }
                            , avlbStockQty      :{ type:"number" }
                            , eqipExpcDt        :{ type:"date"   }
                        }
                    }
                }
            }
            , height:353
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , multiSelectWithCheckbox:true
            , pageable:false
          /*  , copyFromExcel:function(data) {

                for(var i=0; i<data.length; i++){
                    var cells = data[i];

                    this.dataSource.add({
                        itemDstinCd:cells[0]
                        ,itemCd:cells[1]
                        ,itemNm:cells[2]
                        ,ordQty:cells[3]
                        ,unitCd:cells[4]
                        ,prc:cells[5]
                        ,dcRate:cells[6]
                        ,amt:cells[7]
                        ,avlbStockQty:cells[8]
                        ,eqipExpcDt:cells[9]
                        ,prcTp:"01"
                    });

                }
            }
            */
            , edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    itemList     = [],
                    pVal,
                    orgVal,
                    dcAmt,
                    fieldName = grid.columns[e.container.index()].field;

                console.log('fieldName:',fieldName);
                console.log('e.model:',e.model);

                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "itemDstinCd"||fieldName === "unitCd"||fieldName === "prcTp"||fieldName === "avlbStockQty"
                   ||fieldName === "pkgItemCd"||fieldName === "saleQty"||fieldName === "taxAmt"){
                     this.closeCell();
                }else if(fieldName === "itemCd"){
                    //console.log('eles:', eles);
                    //console.log('input:', input);
                    pVal = input.val();
                    orgVal = input.val();

                    //console.log('pVal:', pVal);
                    //console.log('selectedItem:', selectedItem);


                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){

                        console.log('a:',pVal, orgVal);
                        console.log('a:',popItemObj);

                        if(orgVal !== pVal){

                            if(popItemObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                e.model.set('itemCd', orgVal);

                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemrcByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sPrcTp:$("#saleTp").data("kendoExtDropDownList").value()})
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   console.log('result111:',result);
                                   if (result.total === 1) {

                                       $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                                       $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                                       $("#saleTp").data("kendoExtDropDownList").enable(false);

                                       dcAmt = 0;

                                       if(dcRate === 0){
                                           dcAmt = result.data[0].salePrcAmt;
                                       }else{
                                           dcAmt = result.data[0].salePrcAmt - (result.data[0].salePrcAmt * $("#dcRate").data("kendoExtNumericTextBox").value()) ;
                                       }

                                       e.model.set('itemDstinCd', '02');
                                       e.model.set('itemCd', result.data[0].itemCd);
                                       e.model.set('itemNm', result.data[0].itemNm);
                                       e.model.set('unitCd', result.data[0].stockUnitCd);
                                       e.model.set('ordQty', 1);
                                       e.model.set('prc', result.data[0].salePrcAmt);
                                       e.model.set('amt', dcAmt);
                                       e.model.set('prcTp', $("#saleTp").data("kendoExtDropDownList").value());
                                       e.model.set('dcRate', $("#dcRate").data("kendoExtNumericTextBox").value());
                                       e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                       e.model.set('giStrgeCd', result.data[0].giStrgeCd);
                                       e.model.set('giLocCd', '');

                                       delete popItemObj[orgVal];

                                       popItemObj[pVal] = pVal;

                                       itemList.push(result.data[0].itemCd);

                                       fnSetLocCdObj(itemList);


                                       fnSetAmtInfo();

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



                }

             }
            , columns:[
                  {   //판매현황번호
                      title:"<spring:message code='par.lbl.parSaleOrdNo' />"
                     ,field:"parSaleOrdNo"
                     ,width:100
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"parSaleOrdLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //판매유형
                      title     :"<spring:message code='par.lbl.saleType'  />"
                     ,field     :"saleTp"
                     ,width     :80
                     ,editor    :saleTpDropDownEditor
                     ,template  :'#= changeSaleTp(saleTp)#'
                     ,attributes:{ "style":"text-align:left"}
                  }
                , {   //품목구분
                      title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                     ,field     :"itemDstinCd"
                     ,width     :80
                     ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                     ,attributes:{ "style":"text-align:left"}
                  }
                , {   //패키지
                      title:"<spring:message code='par.lbl.package' />"
                     ,field:"pkgItemCd"
                     ,width:100
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
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"ordQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //출고수량
                      title:"<spring:message code='par.lbl.giQty' />"
                     ,field:"saleQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                     ,hidden:true
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
                     ,field:"prc"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //D/C Rate
                      title:"<spring:message code='par.lbl.dcRate' />"
                     ,field:"dcRate"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                     ,decimal:0
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"amt"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"taxAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //가용수량
                      title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,field:"avlbStockQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //출고창고
                      title:"<spring:message code='par.lbl.giStrgeCd' />"
                     ,field:"giStrgeCd"
                     ,width:100
                     ,editor:giStrgeCdDropDownEditor
                     ,template:'#= changeStrgeCd(giStrgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locationCd' />"
                     ,field:"giLocCd"
                     ,width:140
                     ,editor:giLocCdDropDownEditor
                     ,template:'#= changeGiLocCd(giLocCd)#'
                     ,sortable:false
                  }
                , {   //수령인
                      title:"<spring:message code='par.lbl.receiveId' />"
                     ,field:"receiveId"
                     ,width:80
                  }
                 ,{   title:"<spring:message code='par.lbl.receiveDt'/>"
                     ,field:"receiveDt"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,width:80
                  }
                 ,{
                      title:"<spring:message code='par.lbl.receiveTime' />"
                     ,field:"receiveDt"
                     ,format:"{0:HH:mm }"
                     ,width:80
                  }
                , {   //취소수량
                      title:"<spring:message code='global.lbl.cancQty' />"
                     ,width:100
                  }
                , {   //취소일자
                      title:"<spring:message code='global.lbl.cancDt' />"
                     ,width:100
                  }
                , {   //취소시간
                      title:"<spring:message code='par.lbl.giReasonCd' />"
                     ,width:100
                  }
                , {   //반품수량
                      title:"<spring:message code='par.lbl.returnPartsQty' />"
                     ,field:"returnQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //반품일
                      title:"<spring:message code='par.lbl.returnDt' />"
                     ,field:"returnDt"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //반품시간
                      title:"<spring:message code='par.lbl.returnTime' />"
                     ,field:"returnTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                  }
                , {   //반품인
                      title:"<spring:message code='par.lbl.returner' />"
                     ,field:"returnId"
                     ,width:80
                  }
                , {   //설치예정일
                      title:"<spring:message code='par.lbl.eqipExpcDt' />"
                     ,field:"eqipExpcDt"
                     ,width:100
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,hidden:true
                  }
                , { field:"" }
            ]
        });

        /*
        var ctrlDown = false;
        var ctrlKey = 17;
        var vKey = 86;

        $("#grid")
        .on("keydown", function(e){

            if(e.keyCode == ctrlKey) {
                ctrlDown = true;
            }

            if(ctrlDown && (e.keyCode == vKey)) {
                var value = $.trim(window.clipboardData.getData("Text"));
                var grid = $("#grid").data("kendoExtGrid");
                var rows = value.split("\r\n");

                var data = [];

                for(var i=0; i<rows.length; i++){
                    var cells = rows[i].split("\t");

                    grid.dataSource.add({
                        itemDstinCd:cells[0]
                        ,itemCd:cells[1]
                        ,itemNm:cells[2]
                        ,ordQty:cells[3]
                        ,unitCd:cells[4]
                        ,prc:cells[5]
                        ,dcRate:cells[6]
                        ,amt:cells[7]
                        ,avlbStockQty:cells[8]
                        ,eqipExpcDt:cells[9]
                        ,prcTp:"01"
                    });

                }
            }
        })
        .on("keyup", function(e){

            if(e.keyCode == ctrlKey) {
                ctrlDown = false;
            }
        });
        */


         // 가격유형
         changePrcTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = prcTpObj[val];
             }
             return returnVal;
         };

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         // 판매
         changeSaleTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = saleTpObj[val];
             }
             return returnVal;
         };

         // 부품유형
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemDstinCdObj[val];
             }
             return returnVal;
         };

        // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = giStrgeTpObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeGiLocCd = function(giLocCd){
             var returnVal = "";
             console.log('changeGiLocCd:',giLocCd);
             console.log('changeGiLocCd2:',locationObj[giLocCd]);
             if(giLocCd != null && giLocCd != ""){
                 returnVal = locationObj[giLocCd];
             }
             console.log('returnVal:',returnVal);
             return returnVal;
         };

         function fnChangeCustTp(e){
             $('#custCd').val('');
             $('#custNm').val('');
             $("#custTelNo").data("kendoMaskedTextBox").value('');
         }

        // 부품판매 정보 조회.
        function selectPartsSaleOrd(pParSalesOrdNo){

            $.ajax({
                url:"<c:url value='/par/ism/issue/selectPartsSaleOrdByKey.do' />",
                data:JSON.stringify({ sParSaleOrdNo:pParSalesOrdNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                    var ordStatCd;

                    console.log('selectPartsSaleOrd result:', result);

                    partsJs.validate.groupObjAllDataSet(result);

                    ordStatCd = $("#ordStatCd").data("kendoExtDropDownList").value();

                    $("#grid").data("kendoExtGrid").dataSource.read();

                    gCrud = "U";

                    btnView(ordStatCd);

            });
        }


        //부품 팝업 열기 함수.
        function selectItemSalePrcPopupWindow(){

            itemSalePrcPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "prcTp"       :$("#saleTp").data("kendoExtDropDownList").value()
                        , "itemDstinCd" :'02'
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                dcAmt,
                                dcRate = $("#dcRate").data("kendoExtNumericTextBox").value(),
                                rows;

                            if(dataLen > 0){
                                $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                                $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                                $("#saleTp").data("kendoExtDropDownList").enable(false);
                            }

                            for(var i = 0; i < dataLen; i = i + 1){
                                itemList.push(data[i].itemCd);
                            }
                            fnSetLocCdObj(itemList);

                            for(var i = 0; i < dataLen; i = i + 1){
                                dcAmt = 0;

                                if(dcRate === 0){
                                    dcAmt = data[i].salePrcAmt;
                                }else{
                                    dcAmt = data[i].salePrcAmt - (data[i].salePrcAmt * dcRate) ;
                                }

                                popItemData.itemDstinCd    = '02';
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].stockUnitCd;
                                popItemData.ordQty         = 1;
                                popItemData.prc            = data[i].salePrcAmt;
                                popItemData.amt            = dcAmt;
                                popItemData.prcTp          = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.saleTp         = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.dcRate         = dcRate;
                                popItemData.avlbStockQty   = data[i].avlbStockQty;
                                popItemData.giStrgeCd      = data[i].giStrgeCd;
                                popItemData.giLocCd        = '';



                                if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data[i].itemCd] = data[i].itemNm;;
                                    gridData.dataSource.add(popItemData);
                                }
                            }

                            gridData.select(gridData.tbody.find(">tr"));
                            itemSalePrcPopupWindow.close();

                            fnSetAmtInfo();
                        }
                    }
                }
            });
        }

        function initPage(){
            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#grid").data("kendoExtGrid").dataSource.data([]);

            $("#ordStatCd").data("kendoExtDropDownList").enable(false);


            $("#dcBefTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#dcBefTotAmt").data("kendoExtNumericTextBox").enable(false);
            $("#dcAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#dcAmt").data("kendoExtNumericTextBox").enable(false);
            $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#totAmt").data("kendoExtNumericTextBox").enable(false);

            $("#dcRate").closest(".k-numerictextbox").removeClass("form_readonly");
            $("#dcRate").data("kendoExtNumericTextBox").enable(true);
            $("#saleTp").data("kendoExtDropDownList").enable(true);
            $("#saleTp").data("kendoExtDropDownList").value('01');

            $("#dcRate").data("kendoExtNumericTextBox").value(0);
            locationObj = {};

            popItemObj = {};

            btnView(); //초기화 시 버튼 구성


            //판매현황 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pParSalesOrdNo)){
                selectPartsSaleOrd(pParSalesOrdNo);
            }

        }

        function btnView(pStat){

            if(dms.string.isEmpty(pStat)){ //신규 등록 시
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#custTp").data("kendoExtDropDownList").enable(true);
                $("#saleTp").data("kendoExtDropDownList").enable(true);

                $("#btnPackage").data("kendoButton").enable(true);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnCopyFromExcel").data("kendoButton").enable(true);


            }else if(pStat === "01"){ //등록 상태 인경우
                $("#btnReturn").data("kendoButton").enable(true);
                $("#btnPrint").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#custTp").data("kendoExtDropDownList").enable(false);
                $("#saleTp").data("kendoExtDropDownList").enable(false);

                $("#btnPackage").data("kendoButton").enable(true);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnCopyFromExcel").data("kendoButton").enable(true);

            }else if(pStat === "02"){ //확정 상태 인경우
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#custTp").data("kendoExtDropDownList").enable(false);
                $("#saleTp").data("kendoExtDropDownList").enable(false);

                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnCopyFromExcel").data("kendoButton").enable(false);
                $("#btnPackage").data("kendoButton").enable(false);

            }else{ //그 외(취소)
                $("#btnReturn").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnSend").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#custTp").data("kendoExtDropDownList").enable(false);
                $("#saleTp").data("kendoExtDropDownList").enable(false);

                $("#btnPackage").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnCopyFromExcel").data("kendoButton").enable(false);
            }

        }

        initPage();
    });

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#saId").val(data[0].usrId);
                            $("#saNm").val(data[0].usrNm);

                        }
                       // userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function custSearchPopup() {
        if(dms.string.isEmpty($("#custTp").data("kendoExtDropDownList").value())){
            //고객유형은 필수 입력 사항입니다.
            dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
            return false;
        }

        if($("#custTp").data("kendoExtDropDownList").value() === '01'){
            selectCustSearchPopupWindow();
        }else if($("#custTp").data("kendoExtDropDownList").value() === '02'){
            selectVenderMasterPopupWindow();
        }
    }

    function selectVenderMasterPopupWindow(){

        customerSearchPopupWin = dms.window.popup({
            windowId:"customerSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // 고객 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        $("#custCd").val(data[0].bpCd);
                        $("#custNm").val(data[0].bpNm);

                        customerSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            console.log(data);

                            $("#custCd").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#custTelNo").data("kendoMaskedTextBox").value(data[0].hpNo);

                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }

    function selectWorkPackagePopupWindow(){

        workPackagePopup = dms.window.popup({
            windowId:"workPackagePopup"
            ,height:600
            ,title:"<spring:message code='par.lbl.pakage' />"   // 패키지
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectWorkPackagePopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(parData, lbrData){

                        var gridData     = $("#grid").data("kendoExtGrid"),
                            popItemData  = {},
                            itemList     = [],
                            tDate,
                            dcAmt,
                            dcRate = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            rows;

                        if(parData.length > 0) {

                            $.each(parData, function(idx, data){
                                itemList.push(data.itemCd);
                            });

                            fnSetLocCdObj(itemList);

                            $.each(parData, function(idx, data){

                                console.log('data:', data);
                                dcAmt = 0;

                                if(dcRate === 0){
                                    dcAmt = data.salePrcAmt;
                                }else{
                                    dcAmt = data.salePrcAmt - (data.salePrcAmt * dcRate) ;
                                }

                                popItemData.itemDstinCd    = '02';
                                popItemData.itemCd         = data.itemCd;
                                popItemData.itemNm         = data.itemNm;
                                popItemData.unitCd         = data.stockUnitCd;
                                popItemData.ordQty         = 1;
                                popItemData.prc            = data.salePrcAmt;
                                popItemData.amt            = dcAmt;
                                popItemData.prcTp          = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.saleTp         = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.dcRate         = dcRate;
                                popItemData.avlbStockQty   = data.avlbStockQty;
                                popItemData.pkgItemCd      = data.pkgItemCd;
                                popItemData.giStrgeCd      = data.giStrgeCd;
                                popItemData.giLocCd        = '';


                                if(popItemObj.hasOwnProperty(data.itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data.itemCd + '[' + data.itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data.itemCd] = data.itemNm;;
                                    gridData.dataSource.add(popItemData);
                                }

                            });

                            $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                            $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                            $("#saleTp").data("kendoExtDropDownList").enable(false);

                            fnSetAmtInfo();
                        }

                    }
                }
            }
        });
    }

    function fnSetLocCdObj(pItemList){

        var header = {
                sItemCdLst       :pItemList
        };

        $.ajax({
            url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
           ,data:kendo.stringify(header)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {

               for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                   if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                       [result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                   }else{
                       locationListObj[result.data[i].itemCd] = [];
                       locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                   }

                   if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                       locationObj[result.data[i].locCd] = result.data[i].locNm;
                   }
               }
               
               console.log('locationObj:',locationObj);
               console.log('locationListObj:',locationListObj);

           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }

    function fnSetAmtInfo(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            totalAmt    = 0,
            dcBefAmt    = 0,
            dcAmt       = 0,
            gridData;

        rows.each(function(index, row) {
            gridData = grid.dataSource.at(index);

            dcBefAmt = dcBefAmt + (Math.floor(gridData.prc) * Math.floor(gridData.ordQty));

            if(Math.floor(gridData.dcRate) === 0){
                dcAmt    = 0;
                totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.ordQty));
            }else{
                dcAmt    = dcAmt + (Math.floor(gridData.prc) * Math.floor(gridData.ordQty) * Math.floor(gridData.dcRate));
                totalAmt = totalAmt + ((Math.floor(gridData.prc) * Math.floor(gridData.ordQty)) - (Math.floor(gridData.prc) * Math.floor(gridData.ordQty) * Math.floor(gridData.dcRate)));
            }

        });
        $("#dcBefTotAmt").data("kendoExtNumericTextBox").value(dcBefAmt);
        $("#dcAmt").data("kendoExtNumericTextBox").value(dcAmt);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
    }
</script>
<!-- //script -->


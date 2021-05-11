<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

    <!-- 기타출고정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11933" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11932" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11931" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnCnfm"><spring:message code="par.btn.confirm" /><!-- 확정 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11930" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel hidden" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
                <button class="btn_m btn_cancel" id="btnNewCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
			</dms:access>
            <dms:access viewId="VIEW-D-11929" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_print hidden" id="btnPrint" type="button"><spring:message code="par.btn.print" /><!--출력  --></button>
			</dms:access>
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
                    <tr class="hidden">
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGiTp" /><!-- 기타출고유형 --></span></th>
                        <td>
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentalNo" /><!-- 차입반환출고번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGiDocNo" class="form_input form_readonly" readonly>
                                <a id="searchEtcGiDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentalDt" /><!-- 차입반환일자 --></th>
                        <td>
                            <input id="regDt" type="text" value="" class="form_datepicker form_readonly" data-type="maskDate" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpCstCd" /><!-- 업무고객코드 --></th>
                        <td>
                            <div class="form_search" id="bpTd">
                                <input type="text" id="bpCd" class="form_input form_readonly" readonly/>
                                <a id="searchBpCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row">
                            <span><spring:message code="par.lbl.bpCstNm" /><!-- 업무고객 -->
                        </th>
                        <td>
                            <input type="text" id="bpNm" class="form_input form_readonly"  readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.ownDlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input type="text" id="dlrCd" class="form_input form_readonly"  readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.rentalItemCnt" /><!-- 품목수 --></th>
                        <td class="readonly_area">
                            <input id="itemCnt" data-type="number" class="form_numeric"  readonly>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.rentItemQty' /></th>
                        <td class="readonly_area">
                            <input id="itemQty" data-type="number" class="form_numeric"  readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.rentAmt" /><!--금액합계 --></th>
                        <td class="readonly_area">
                            <input id="giTotAmt" data-type="number" class="form_numeric"  readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentRemark" /><!--비고 --></th>
                        <td colspan="7">
                            <input id="remark" type="text" value="" class="form_input">
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11928" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_s_min5 btn_add"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11927" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_s_min5 btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
			</dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품기타출고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

    </section>
</div>
    <!-- //부품기타출고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        pEtcGiDocNo         = "${pEtcGiDocNo}",
        sessionDlrCd        = "${dlrCd}",
        gVatCd              = Number("${vatCd}"),
        gCrud               = "C",
        mvtTpList           = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        popItemObj          = {},
        selectShareStockGiItemPopupWindow,
        customerSearchPopupWin,
        issueEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd;


        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
           // gVatCd = .16;
            gVatCd = .13;
        }
        console.log('gVatCd:',gVatCd);

        locationObj[' '] = "";
        //mvtTpList.push({cmmCd:"47", cmmCdNm:"借出登记出库"});//TODO [InBoShim] 대여출고 중문교체.

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if("47" === "${obj.cmmCd}"){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        strgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
            strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

    $(document).ready(function() {

        //기타출고유형선택
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        /*
        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });
        //총수량
        $("#totQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });
        */

        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#itemCnt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#itemQty").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#giTotAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGiDocNo = ''; //기타출고현황 화면에서 넘어온 기타출고번호 삭제.
                gCrud       = "C";
                initPage();
            }
        });

        $("#searchBpCd").on('click', selectVenderMasterPopupWindow);
        $("#searchEtcGiDocNo").on('click', selectIssueEtcListPopupWindow);

      //버튼 - 출력
        $("#btnPrint").kendoButton({
            click:function(e) {

            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                 selectItemSalePrcPopupWindow();
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){
                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();

                        var grid = $("#grid").data("kendoExtGrid"),
                        rows = grid.select();

                        rows.each(function(index, row) {
                            var l_rowData = grid.dataItem(row);
                            delete popItemObj[l_rowData.itemCd][l_rowData.strgeCd];

                        });

                        rows.each(function(index, row) {
                            grid.removeRow(row);
                        });

                        fnSetAmtInfo();
                    }
                    conformKendoWindow.close();
                }).end();
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                    lCrud         = '',
                    paramUrl      = '',
                    header,
                    chkCalcAmt;

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 딜러를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        mvtTp           :mvtType
                      , bpCd            :$("#bpCd").val()
                      , remark          :$("#remark").val()
                      , updtDtStr       :$("#updtDtStr").val()
                };

                if(gCrud === "C"){

                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(!dms.string.isEmpty(gridData.itemCd)){

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


                            if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                                // 수량을 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }

                            chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.qty) * 100)/100;

                            if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0.5 ){
                                // 금액을 확인해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                               "issueEtcVO":header
                              ,"issueEtcItemList":saveList
                            };

                        $.ajax({
                             url:"<c:url value='/par/ism/issue/createIssueEtcReg.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {

                                if (result.resultYn == true) {
                                    dms.notification.success("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGiDocNo}'/>");

                                    pEtcGiDocNo = result.etcGiDocNo;
                                    $('#etcGiDocNo').val(result.etcGiDocNo);

                                    fnSetButton('01');

                                    selectEtcIssue(pEtcGiDocNo);
                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
                                    }
                                }

                            }
                            ,error:function(jqXHR,status,error) {
                                dms.loading.hide($("#screenSection"));
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#screenSection"));
                            }
                            ,complete:function(){
                                dms.loading.hide($("#screenSection"));
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

                    header.etcGiDocNo = $('#etcGiDocNo').val();
                    header.statCd     = '01';

                    saveData.issueEtcVO = header;
                    if (grid.gridValidation()) {

                        $.ajax({
                            url:"<c:url value='/par/ism/issue/multiIssueEtcs.do' />"
                           ,data:kendo.stringify(saveData)
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:true
                           ,success:function(result) {

                               if (result === true) {
                                   dms.notification.success("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGiDocNo}'/>");

                                   pEtcGiDocNo = $('#etcGiDocNo').val();
                                   $('#etcGiDocNo').val(pEtcGiDocNo);

                                   $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                   fnSetButton('01');

                                   // 부품기타출고 조회.
                                   selectEtcIssue(pEtcGiDocNo);

                               } else {

                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
                                   }
                               }
                           }
                           ,error:function(jqXHR,status,error) {
                               dms.loading.hide($("#screenSection"));
                               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                           }
                           ,beforeSend:function(){
                               dms.loading.show($("#screenSection"));
                           }
                           ,complete:function(){
                               dms.loading.hide($("#screenSection"));
                           }

                       });
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
                    mvtType        = $("#mvtTp").data("kendoExtDropDownList").value(),
                    saveList       = [],
                    saveData       = grid.getCUDData("insertList", "updateList", "deleteList"),
                    insertListLeng = saveData.insertList.length,
                    updateListLeng = saveData.updateList.length,
                    deleteListLeng = saveData.deleteList.length,
                    modifyLeng     = insertListLeng + deleteListLeng,
                    header,
                    chkCalcAmt;


                if(modifyLeng > 0){

                    dms.notification.warning("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                    saveList = [];
                    return false;
                }


                if(dms.string.isEmpty($("#bpCd").val())){
                    // 딜러를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        mvtTp           :mvtType
                      , etcGiDocNo       :$('#etcGiDocNo').val()
                      , bpCd            :$("#bpCd").val()
                      , remark          :$("#remark").val()
                      , updtDtStr       :$("#updtDtStr").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(!dms.string.isEmpty(gridData.itemCd)){
                        if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
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

                        if(dms.string.isEmpty(gridData.strgeCd)){
                            // 창고를 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.strgeCd' var='strgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strgeCd}'/>");
                            saveList = [];
                            return false;
                        }

                        chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.qty) * 100)/100;

                        if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0.5 ){
                            // 금액을 확인해주세요.
                            dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                            saveList = [];
                            return false;
                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                            "issueEtcVO":header
                            ,"issueEtcItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/createIssueEtcCnfm.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result.resultYn == true) {
                               dms.notification.success("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${etcGiDocNo}'/>");

                               pEtcGiDocNo = $('#etcGiDocNo').val();

                               fnSetButton('02');

                               // 부품기타출고 조회.
                               selectEtcIssue(pEtcGiDocNo);

                           } else {

                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.issueEtcRentalNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
                               }
                           }
                       }
                       ,error:function(jqXHR,status,error) {
                           dms.loading.hide($("#screenSection"));
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,beforeSend:function(){
                           dms.loading.show($("#screenSection"));
                       }
                       ,complete:function(){
                           dms.loading.hide($("#screenSection"));
                       }
                   });
                }
              }
        });

        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){
                parent._createOrReloadTabMenu('<spring:message code="par.menu.receiveEtcReturn" />'
                        ,"<c:url value='/par/pcm/receive/selectReceiveEtcReturnMain.do?pReceiveEtcNo="+$("#etcGiDocNo").val()+"'/>", "VIEW-D-10505");

            }
        });

        // 취소 버튼 (저장 시점에만 취소 가능, 확정 시점에는 취소 불가능)
        $("#btnNewCancel").kendoButton({
            click:function(e){
                var saveList = [],
                grid = $("#grid").data("kendoExtGrid"),
                rows = grid.tbody.find("tr");

                if(gCrud === "U"){
                    regIssueEtcVO = {
                        etcGiDocNo:$('#etcGiDocNo').val()
                        ,statCd:'03'
                    };

                    if (grid.gridValidation()){
                        $.ajax({
                            url:"<c:url value='/par/ism/issue/regCancIssueEtcs.do' />"
                            ,data:kendo.stringify(regIssueEtcVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result){
                                if(result === true){
                                    dms.notification.success("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.info.cancelSuccessParam' arguments='${etcGiDocNo}'/>");

                                    pEtcGiDocNo = $('#etcGiDocNo').val();

                                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                    fnSetButton('03');

                                    selectEtcIssue(pEtcGiDocNo);
                                }else{
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.issueEtcRentalNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
                                    }
                                }
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.loading.hide($("#screenSection"));
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#screenSection"));
                            }
                            ,complete:function(){
                                dms.loading.hide($("#screenSection"));
                            }
                       });
                    }
                }
            }
        });

        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {
             var input = $("<input/>"),
                 mvtTp,
                 pValue;

             mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();
             input.attr("name", options.field);

             input.keyup(function(){
                 pValue = Number($(this).val());

                 if(options.field === 'qty'){
                     options.model.set("amt",         Math.round(Number(options.model.prc) * Number(pValue) * 100)/100);
                     options.model.set("taxAmt",     (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) - Math.round(((Math.round(Number(options.model.prc) * Number(pValue) * 100)/100)  / Number( 1 + gVatCd ) * 100))/100);
                     options.model.set("taxDdctAmt",  Math.round((Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) / Number( 1 + gVatCd ) * 100)/100);
                     options.model.set("taxDdctPrc",  Math.round(Nubmer(options.model.prc) / Number( 1 + gVatCd ) * 100)/100);
                     //options.model.set("taxAmt",     (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) *  gVatCd);
                     //options.model.set("taxDdctAmt", (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) - ((Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) *  gVatCd));
                     //options.model.set("taxDdctPrc",  options.model.prc - (options.model.prc *  gVatCd));
                 }
                 options.model.set("dcRate",      gVatCd);

             });

             input.blur(function(){
                 fnSetAmtInfo();

             });

             input.appendTo(container);
             if(options.field === 'qty') {
                 input.kendoExtNumericTextBox({
                     format: "n0"
                     ,decimals:0
                     ,restrictDecimals: true
                     ,min:0
                     ,spinners:false
                 });
             } else {
                 input.kendoExtNumericTextBox({
                     format: "n2"
                     ,decimals:2
                     ,restrictDecimals: true
                     ,min:0
                     ,spinners:false
                 });
             }
         };

         /**
          * grid 출고창고 DropDownList
          */
          giStrgeCdDropDownEditor = function(container, options) {


              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  strgeTpList
                 ,change:function(e){
                     options.model.set('locCd','');
                  }
              });
          };

         giLocCdDropDownEditor = function(container, options) {

             var itemCd = options.model.itemCd,
                 strgeCd = options.model.strgeCd;

             if(!dms.string.isEmpty(locationListObj[itemCd])){
                 $('<input data-bind="value:' + options.field + '"  />')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     dataTextField: "cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:  locationListObj[itemCd][strgeCd]
                    ,change:function(e){
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                     }
                 });
             }
          };

        // 부품기타출고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-151601"
           ,height:480
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/ism/issue/selectIssueEtcItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 기타출고현황 검색조건 코드.
                            params["sEtcGiDocNo"] = $("#etcGiDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen      = result.data.length,
                             gridData     = $("#grid").data("kendoExtGrid"),
                             itemList     = [];

                         for(var i = 0; i < dataLen; i = i + 1){
                             if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                                 popItemObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                             }else{
                               //  itemList.push(result.data[i].itemCd);
                                 popItemObj[result.data[i].itemCd] = {};
                                 popItemObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                             }
                         }

                         //if(dataLen > 0){
                         //    fnSetLocCdObj(itemList);
                         //}

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"etcGiDocNo"
                      ,fields:{
                              etcGiDocNo      :{ type:"string", editable:false }
                            , etcGiDocLineNo  :{ type:"number", editable:false }
                            , itemCd          :{ type:"string", editable:false }
                            , itemNm          :{ type:"string" }
                            , unitCd          :{ type:"string" }
                            , qty             :{ type:"number" }
                            , stdStrgeCd      :{ type:"string" }
                            , strgeCd         :{ type:"string" }
                            , locCd           :{ type:"string" }
                            , retailPrc       :{ type:"number" }
                            , movingAvgPrc    :{ type:"number" }
                            , prc             :{ type:"number" , editable:false}
                            , amt             :{ type:"number" }
                            , taxAmt          :{ type:"number" }
                            , giDt            :{ type:"date"   , editable:false }
                            , giTime          :{ type:"string" , editable:false }
                            , dcRate          :{ type:"number" }
                            , taxDdctPrc      :{ type:"number" }
                            , taxDdctAmt      :{ type:"number" }
                            , avlbStockQty    :{ type:"number" }
                            , returnQty       :{ type:"number"   , editable:false }
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , multiSelectWithCheckbox:true
            , pageable:false
            , edit:function(e){
                var eles         = e.container.find("input"),
                    grid         = this,
                    rows         = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input        = e.container.find(".k-input"),
                    mvtType      = $("#mvtTp").data("kendoExtDropDownList").value(),
                    itemList     = [],
                    fieldName    = grid.columns[e.container.index()].field,
                    pVal,
                    orgVal;


                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "stdStrgeCd"||fieldName === "retailPrc"||fieldName === "taxAmt"
                        ||fieldName === "movingAvgPrc"||fieldName === "avlbStockQty"||fieldName === "unitCd"||fieldName === "strgeCd"||fieldName === "locCd" ){
                     this.closeCell();
                }else if(fieldName === "qty"||fieldName === "prc"){
                    //입고확정 상태인 경우 그리드 수정 불가
                    if(selectedItem.giStatCd === '02'||selectedItem.giStatCd === '03'){
                        this.closeCell();
                    }
                }else if(fieldName === "itemCd"){
                    pVal = input.val();
                    orgVal = input.val();



                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){


                        if(dms.string.isEmpty($("#bpCd").val())){
                            // 업체를 선택해주세요.
                            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                            e.model.set('itemCd', orgVal);
                            return false;
                        }

                        if(orgVal !== pVal){

                            if(popItemObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                e.model.set('itemCd', orgVal);

                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sPrcTp:'01'})
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   if (result.total === 1) {

                                       e.model.set('itemCd',       result.data[0].itemCd);
                                       e.model.set('itemNm',       result.data[0].itemNm);
                                       e.model.set('unitCd',       result.data[0].stockUnitCd);
                                       e.model.set('qty',          1);
                                       e.model.set('prc',          result.data[0].movingAvgPrc);
                                       e.model.set('amt',          result.data[0].movingAvgPrc);
                                       e.model.set('taxAmt',       result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc / ( 1 + gVatCd )));
                                       e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                       e.model.set('stdStrgeCd',   result.data[0].giStrgeCd);
                                       e.model.set('strgeCd',      result.data[0].giStrgeCd);
                                       e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                       e.model.set('retailPrc',    result.data[0].salePrcAmt);
                                       e.model.set('dcRate',       gVatCd);
                                       e.model.set('taxDdctPrc',   result.data[0].movingAvgPrc / ( 1 + gVatCd ));
                                       e.model.set('taxDdctAmt',   result.data[0].movingAvgPrc / ( 1 + gVatCd ));


                                       delete popItemObj[orgVal];

                                       popItemObj[pVal] = pVal;

                                       //itemList.push(result.data[0].itemCd);

                                       //fnSetLocCdObj(itemList);

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
                  {   //기타출고현황번호
                      title:"<spring:message code='par.lbl.etcGiDocNo' />"
                     ,field:"etcGiDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGiDocLineNo"
                     ,width:60
                     ,hidden:true
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
                , {   //기준창고
                      title:"<spring:message code='par.lbl.stdStrgeCd' />"
                     ,field:"stdStrgeCd"
                     ,width:100
                     ,template:'#= changeStrgeCd(stdStrgeCd)#'
                     ,sortable:false
                     ,hidden:true
                  }
                , {   //출고창고
                      title:"<spring:message code='par.lbl.strgeCd' />"
                     ,field:"strgeCd"
                     ,width:140
                     ,editor:giStrgeCdDropDownEditor
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locationCd' />"
                     ,field:"locCd"
                     ,width:140
                     //,editor:giLocCdDropDownEditor
                     //,template:'#= changeGiLocCd(strgeCd, locCd)#'
                     ,sortable:false
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.giQty' />"
                     ,field:"qty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                  }
                , {   //반환수량
                      title:"<spring:message code='par.lbl.returnQty' />"
                     ,field:"returnQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,hidden:true
                  }
                , {   //이동평균단가
                      title:"<spring:message code='par.lbl.movingAvgPrc' />"
                     ,field:"movingAvgPrc"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //소매가
                      title:"<spring:message code='par.lbl.salePriceCost01' />"
                     ,field:"retailPrc"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //단가(차출출고는 단가 수정 불가)
                      title:"<spring:message code='par.lbl.giPrice' />"
                     ,field:"prc"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.giAmount' />"
                     ,field:"amt"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"taxAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //출고일
                      title:"<spring:message code='global.lbl.giDt' />"
                     ,field:"giDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,hidden:true
                  }
                , {   //출고시간
                      title:"<spring:message code='par.lbl.giTime' />"
                     ,field:"giTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                     ,hidden:true
                  }
                , {   //가용수량
                      title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,field:"avlbStockQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true
                  }
                , {   //D/C Rate
                      title:"<spring:message code='par.lbl.dcRate' />"
                     ,field:"dcRate"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                 ,{
                      field:"taxDdctPrc"
                     ,title:"<spring:message code='par.lbl.taxDdctPrc' />"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }//출고단가(세금미포함)
                 ,{
                      field:"taxDdctAmt"
                     ,title:"<spring:message code='par.lbl.amtTax' />"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }//출고금액(세금미포함)
                  ,{
                      field:"giStatCd"
                     ,title:"<spring:message code='par.lbl.giStatCd' />"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,hidden:true
                   }//부품출고상태
            ]
        });

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };


         // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = strgeTpObj[val];
             }
             return returnVal;
         };

      // 로케이션
         changeGiLocCd = function(strgeCd, locCd){
             var returnVal = "";
             if(locCd != null && locCd != ""){
                 if(dms.string.isEmpty(locationObj[strgeCd])){
                     returnVal = '';
                 }else{
                     if(dms.string.isEmpty(locationObj[strgeCd][locCd])){
                         returnVal = '';
                     }else{
                         returnVal = locationObj[strgeCd][locCd];
                     }
                 }
             }else{
                 returnVal = '';
             }

             return returnVal;
         };

        initPage();
    });

    function initPage(){
        var grid        = $("#grid").data("kendoExtGrid");

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

        //$("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
        //$("#totQty").data("kendoExtNumericTextBox").enable(false);
        //$("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
        //$("#totAmt").data("kendoExtNumericTextBox").enable(false);

        $("#mvtTp").data("kendoExtDropDownList").value('47');
        $("#mvtTp").data("kendoExtDropDownList").enable(false);

        $("#dlrCd").val(sessionDlrCd);

       // $("#btnAdd").data("kendoButton").enable(true);
       // $("#btnDelItem").data("kendoButton").enable(true);
       // $("#btnSave").data("kendoButton").enable(true);

        popItemObj = {};

        gCrud = "C";

        fnSetButton();

        //기타출고현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pEtcGiDocNo)){
            selectEtcIssue(pEtcGiDocNo);
        }

    }

    // 부품기타출고 정보 조회.
    function selectEtcIssue(pEtcGiDocNo){

        $.ajax({
            url:"<c:url value='/par/ism/issue/selectIssueEtcByKey.do' />",
            data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {


                partsJs.validate.groupObjAllDataSet(result);

                $("#grid").data("kendoExtGrid").dataSource.read();

                gCrud = "U";

                fnSetButton(result.statCd);


        });
    }

    //부품 팝업 열기 함수.
    function selectItemSalePrcPopupWindow(){

        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , width:900
            , height:550
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , content:{
                  url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind"    :true
                    , "prcTp"       :'01'
                    , "itemDstinCd" :'02'
                    , "itemCd"      :''
                    , "selectable"  :"multiple"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            popItemData  = {},
                            itemList     = [],
                            tDate,
                            rows;

                        //for(var i = 0; i < dataLen; i = i + 1){
                        //    itemList.push(data[i].itemCd);
                        //}
                        //fnSetLocCdObj(itemList);

                        for(var i = 0; i < dataLen; i = i + 1){

                            /*
                            if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].giStrgeCd])){
                                  popItemData.locCd = locationListObj[data[i].itemCd][data[i].giStrgeCd][0].cmmCd;
                                }else{
                                    popItemData.locCd = '';
                                }
                            }else{
                                popItemData.locCd = '';
                            }
                            */

                            popItemData.itemCd         = data[i].itemCd;
                            popItemData.itemNm         = data[i].itemNm;
                            popItemData.unitCd         = data[i].stockUnitCd;
                            popItemData.qty            = data[i].giQty;
                            popItemData.prc            = data[i].movingAvgPrc;
                            popItemData.amt            = Number(data[i].giQty) * Number(data[i].movingAvgPrc);
                            popItemData.dcRate         = gVatCd;
                            popItemData.taxDdctPrc     = data[i].movingAvgPrc / ( 1 + gVatCd );
                            popItemData.taxAmt         = (Number(data[i].giQty) * Number(data[i].movingAvgPrc)) - ((Number(data[i].giQty) * Number(data[i].movingAvgPrc)) / ( 1 + gVatCd ));
                            popItemData.taxDdctAmt     = (Number(data[i].giQty) * Number(data[i].movingAvgPrc)) / ( 1 + gVatCd );
                            popItemData.stdStrgeCd     = data[i].giStrgeCd;
                            popItemData.strgeCd        = data[i].giStrgeCd;
                            popItemData.locCd          = data[i].giLocCd;
                            popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                            popItemData.retailPrc      = data[i].salePrcAmt;
                            popItemData.etcGiDocNo     = '';
                            popItemData.etcGiDocLineNo = null;
                            popItemData.avlbStockQty   = data[i].avlbStockQty;


                            if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                if(popItemObj[data[i].itemCd].hasOwnProperty(data[i].giStrgeCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']' + '[' + strgeTpObj[data[i].giStrgeCd] + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                                    gridData.dataSource.add(popItemData);
                                }
                            }else{
                                popItemObj[data[i].itemCd] = {};
                                popItemObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                                gridData.dataSource.add(popItemData);
                            }


                        }

                        gridData.select(gridData.tbody.find(">tr"));
                        selectShareStockGiItemPopupWindow.close();

                        fnSetAmtInfo();
                    }
                }
            }
        });
    }

    // 차출출고리스트 팝업 열기 함수.
    function selectIssueEtcListPopupWindow(){

        issueEtcListPopupWindow = dms.window.popup({
            windowId:"issueEtcRentalListPopup"
            ,title:"<spring:message code='par.title.issueDocInfo' />"   // 출고문서정보
            ,content:{
                url:"<c:url value='/par/cmm/selectIssueEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                    ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                    ,"statCd"   :"02"
                    ,"bpCd"     :$("#bpCd").val()
                    ,"bpCdNm"   :$("#bpNm").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            $("#etcGiDocNo").val(data[0].etcGiDocNo);
                            pEtcGiDocNo = data[0].etcGiDocNo;
                            selectEtcIssue(pEtcGiDocNo);
                        }
                        issueEtcListPopupWindow.close();
                    }
                }
            }
        });
    }

    function selectVenderMasterPopupWindow(){

        customerSearchPopupWin = dms.window.popup({
            windowId:"customerSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // customer select
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"selectable":"row"
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            customerSearchPopupWin.close();
                        }
                    }
                }
            }
        });
    }


    function fnSetAmtInfo(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            totalAmt    = 0,
            totalQty    = 0,
            mvtTp,
            gridData;

        mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();

        rows.each(function(index, row) {
            gridData = grid.dataSource.at(index);

            totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.qty));
            totalQty = totalQty + Math.floor(gridData.qty);

        });
        //$("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        //$("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
    }

    function fnSetButton(pType){
        if(pType === '01'){
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnNewCancel").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);
            btnPrint
        }else if(pType === '02'){
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnNewCancel").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
        }else if(pType === '03'){
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnNewCancel").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
        }else{
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnNewCancel").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(false);
        }

        $("#btnPrint").data("kendoButton").enable(false);//기능구현전까지 사용안함
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

               if(result.total > 0){
                   for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                       if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                           if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){

                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }else{
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }

                           //locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }else{
                           locationListObj[result.data[i].itemCd] = {};
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }


                       if(!locationObj.hasOwnProperty(result.data[i].strgeCd)){
                           locationObj[result.data[i].strgeCd] = {};
                           locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                       }else{

                           if(!locationObj[result.data[i].strgeCd].hasOwnProperty(result.data[i].locCd)){
                               locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                           }
                       }

                   }
               }

           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(0, {
            "etcGiDocNo"        :''
           ,"etcGiDocLineNo"    :null
           ,"itemCd"            :''
           ,"itemNm"            :''
           ,"unitCd"            :''
           ,"qty"               :0
           ,"stdStrgeCd"        :''
           ,"strgeCd"           :''
           ,"locCd"             :''
           ,"retailPrc"         :0
           ,"movingAvgPrc"      :0
           ,"prc"               :0
           ,"amt"               :0
           ,"avlbStockQty"      :0
        });
    }

</script>
<!-- //script -->


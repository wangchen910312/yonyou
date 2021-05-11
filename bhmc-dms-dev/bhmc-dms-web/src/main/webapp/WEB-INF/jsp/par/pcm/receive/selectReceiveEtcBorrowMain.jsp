<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 기타입고정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11923" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11922" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11921" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnCnfm"><spring:message code="par.btn.confirm" /><!-- 확정 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11920" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel hidden" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
                <button class="btn_m btn_cancel" id="btnNewCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11919" hasPermission="${dms:getPermissionMask('READ')}">
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
                </colgroup>
                <tbody>
                    <tr class="hidden">
                        <th scope="row" class="hidden"><span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span></th>
                        <td class="required_area hidden">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" class="form_comboBox" required />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.receiveEtcBorrowNo" /><!-- 차입등기번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGrDocNo" class="form_input form_readonly" readonly>
                                <a id="searchEtcGrDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.borrowDocDt" /><!-- 차입등기일자 --></th>
                        <td class="readonly_area">
                            <input id="regDt" type="text" class="form_datepicker" data-type="maskDate" readonly>
                        </td>
                        <th scope="row">
                            <spring:message code="par.lbl.bpCstCd" /><!-- 업무고객코드 -->
                        </th>
                        <td>
                            <div class="form_search" id="bpTd">
                                <input type="text" id="bpCd" class="form_input form_readonly" readonly/>
                                <input id="bpTp" name="bpTp" class="form_input hidden"/>
                                <a id="searchBpCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row">
                            <span><spring:message code="par.lbl.bpCstNm" /><!-- 업무고객 -->
                        </th>
                        <td class="required_area" >
                            <input type="text" id="bpNm" class="form_input form_readonly"  readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <span><spring:message code="par.lbl.ownDlrCd" /><!-- 딜러코드 --></span>
                        </th>
                        <td>
                            <input type="text" id="dlrCd" class="form_input form_readonly"  readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.borrowItemCnt" /><!-- 품목수 --></th>
                        <td class="readonly_area">
                            <input id="itemCnt" data-type="number" class="form_numeric"  readonly>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.borrowItemQty' /></th>
                        <td class="readonly_area">
                            <input id="itemQty" data-type="number" class="form_numeric"  readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.borrowAmt" /><!--금액합계 --></th>
                        <td class="readonly_area">
                            <input id="grTotAmt" data-type="number" class="form_numeric"  readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.borrowRemark" /><!--비고 --></th>
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
			<dms:access viewId="VIEW-D-11918" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_add btn_s_min5"  id="btnAdd"><spring:message code="par.btn.add" /></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11917" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_del btn_s_min5"  id="btnDelItem"><spring:message code="par.btn.del" /></button>
			</dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품기타입고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //부품기타입고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        pEtcGrDocNo         = "${pEtcGrDocNo}",
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
        issueEtcPopupWindow,
        customerSearchPopupWin,
        itemByBpCdPopupWindow,
        receiveEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd;

        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
            //gVatCd = .16;
            gVatCd = .13;
        }

        locationObj[' '] = "";
        //mvtTpList.push({cmmCd:"35", cmmCdNm:"借进登记入库"}); //TODO [InBoShim] 차입입고 중문교체.

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            if("35" === "${obj.cmmCd}"){
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

        //기타입고유형선택
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

        $("#grTotAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGrDocNo = ''; //기타입고현황 화면에서 넘어온 기타입고번호 삭제.
                gCrud       = "C";
                initPage();
            }
        });

        $("#searchBpCd").on('click', selectVenderMasterPopupWindow);
        $("#searchEtcGrDocNo").on('click', selectReceiveEtcListPopupWindow);


        //버튼 - 출력
        $("#btnPrint").kendoButton({
            click:function(e) {

            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                var bpCd          = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectItemPopupWindow();
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
                                delete popItemObj[l_rowData.itemCd];

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
                    // 거래처를 입력해주세요
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
                               "receiveEtcVO":header
                              ,"receiveEtcItemList":saveList
                            };

                        $.ajax({
                             url:"<c:url value='/par/pcm/receive/createReceiveEtcReg.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {

                                if (result.resultYn == true) {
                                    dms.notification.success("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.regSuccessParam' arguments='${receiveEtcBorrowNo}'/>");

                                    pEtcGrDocNo = result.etcGrDocNo;
                                    $('#etcGrDocNo').val(result.etcGrDocNo);

                                    fnSetButton('01');

                                    // 부품기타입고 조회.
                                    selectEtcReceive(pEtcGrDocNo);

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.err.regFailedParam' arguments='${receiveEtcBorrowNo}'/>");
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

                    header.etcGrDocNo = $('#etcGrDocNo').val();
                    header.statCd     = '01';

                    saveData.receiveEtcVO = header;
                    if (grid.gridValidation()) {

                        $.ajax({
                            url:"<c:url value='/par/pcm/receive/multiReceiveEtcs.do' />"
                           ,data:kendo.stringify(saveData)
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:true
                           ,success:function(result) {

                               if (result === true) {
                                   dms.notification.success("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.regSuccessParam' arguments='${receiveEtcBorrowNo}'/>");

                                   pEtcGrDocNo = $('#etcGrDocNo').val();
                                   $('#etcGrDocNo').val(pEtcGrDocNo);

                                   $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                   fnSetButton('01');

                                   // 부품기타입고 조회.
                                   selectEtcReceive(pEtcGrDocNo);

                               } else {
                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.err.regFailedParam' arguments='${receiveEtcBorrowNo}'/>");
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
                      , etcGrDocNo      :$('#etcGrDocNo').val()
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

                        chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.qty) * 100)/100;

                        if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0.5 ){
                            // 금액을 확인해주세요.
                            dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.itemCd)){
                            // 부품을 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "receiveEtcVO":header
                          ,"receiveEtcItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/pcm/receive/createReceiveEtcCnfm.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result.resultYn == true) {
                               dms.notification.success("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${receiveEtcBorrowNo}'/>");

                               pEtcGrDocNo = $('#etcGrDocNo').val();
                               fnSetButton('02');

                               // 부품기타입고 조회.
                               selectEtcReceive(pEtcGrDocNo);

                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${receiveEtcBorrowNo}'/>");
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

        // 취소 버튼 (출고화면으로 Link , 이전 버전)
        $("#btnCancel").kendoButton({
            click:function(e){
                parent._createOrReloadTabMenu('<spring:message code="par.menu.issueEtcReturn" />'
                        ,"<c:url value='/par/ism/issue/selectIssueEtcReturnMain.do?pIssueEtcNo="+$("#etcGrDocNo").val()+"'/>", "VIEW-D-10510");

            }
        });

        // 취소 버튼 (저장 시점에만 취소 가능, 확정 시점에는 취소 불가능)
        $("#btnNewCancel").kendoButton({
            click:function(e){
                var saveList = [],
                grid = $("#grid").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                mvtType = $("#mvtTp").data("kendoExtDropDownList").value(),
                lCrud = '',
                header;

                if(gCrud === "U"){
                    saveData = {
                        etcGrDocNo:$('#etcGrDocNo').val()
                        ,statCd:'03'
                    };

                    regReceiveEtcVO = saveData;
                    if (grid.gridValidation()){
                        $.ajax({
                            url:"<c:url value='/par/pcm/receive/regCancReceiveEtcs.do' />"
                            ,data:kendo.stringify(regReceiveEtcVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result){
                                if(result === true){
                                    dms.notification.success("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.info.cancelSuccessParam' arguments='${receiveEtcBorrowNo}'/>");

                                    pEtcGrDocNo = $('#etcGrDocNo').val();
                                    $('#etcGrDocNo').val(pEtcGrDocNo);

                                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                    fnSetButton('03');

                                    // 부품기타입고 조회.
                                    selectEtcReceive(pEtcGrDocNo);
                                }else{
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.receiveEtcBorrowNo' var='receiveEtcBorrowNo' /><spring:message code='global.err.regFailedParam' arguments='${receiveEtcBorrowNo}'/>");
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
                 pValue;

             input.attr("name", options.field);

             //input.min
             input.keyup(function(){

                 pValue = Number($(this).val());

                 /* 원래 차입차출은 세금없었음. 수정 전17년 2월 27일
                 options.model.set("amt",         options.model.prc * options.model.qty);
                 options.model.set("taxAmt",     (options.model.prc * options.model.qty) *  0);
                 options.model.set("taxDdctAmt", (options.model.prc * options.model.qty) - ((options.model.prc * options.model.qty) *  0));
                 options.model.set("taxDdctPrc", (options.model.prc) - (options.model.prc *  0));
                 options.model.set("dcRate",      0);
                 */

                 if(options.field === 'prc'){
                     if(pValue <= 99999) {
                         options.model.set("amt",         Math.round(Number(pValue) * Number(options.model.qty) * 100)/100);
                         options.model.set("taxAmt",     (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) - ((Math.round(Number(pValue) * Number(options.model.qty) * 100)/100)  / ( 1 + gVatCd )));
                         options.model.set("taxDdctAmt", (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100)  / ( 1 + gVatCd ));
                         options.model.set("taxDdctPrc",  Math.round((Number(pValue) / Number( 1 + gVatCd )) * 100)/100);
                     } else {
                         pValue = 99999;
                         options.model.set("amt",         Math.round(Number(pValue) * Number(options.model.qty) * 100)/100);
                         options.model.set("taxAmt",     (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) - ((Math.round(Number(pValue) * Number(options.model.qty) * 100)/100)  / ( 1 + gVatCd )));
                         options.model.set("taxDdctAmt", (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100)  / ( 1 + gVatCd ));
                         options.model.set("taxDdctPrc",  Math.round((Number(pValue) / Number( 1 + gVatCd )) * 100)/100);
                     }

                     //options.model.set("taxAmt",     (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) *  gVatCd);
                     //options.model.set("taxDdctAmt", (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) - ((Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) *  gVatCd));
                     //options.model.set("taxDdctPrc",  pValue - (pValue *  gVatCd));
                 }else if(options.field === 'qty'){
                     if(pValue <= 10000) {
                         options.model.set("amt",         Math.round(Number(options.model.prc) * Number(pValue) * 100)/100);
                         options.model.set("taxAmt",     (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) - ((Math.round(Number(options.model.prc) * Number(pValue) * 100)/100)  / ( 1 + gVatCd )));
                         options.model.set("taxDdctAmt", (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100)  / ( 1 + gVatCd ));
                         options.model.set("taxDdctPrc",  Math.round((Number(options.model.prc) / Number( 1 + gVatCd )) * 100)/100);
                     } else {
                         pValue = 10000;
                         options.model.set("amt",         Math.round(Number(options.model.prc) * Number(pValue) * 100)/100);
                         options.model.set("taxAmt",     (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) - ((Math.round(Number(options.model.prc) * Number(pValue) * 100)/100)  / ( 1 + gVatCd )));
                         options.model.set("taxDdctAmt", (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100)  / ( 1 + gVatCd ));
                         options.model.set("taxDdctPrc",  Math.round((Number(options.model.prc) / Number( 1 + gVatCd )) * 100)/100);
                     }

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
             if(options.field === 'qty'){
                 input.kendoExtNumericTextBox({
                     format: "n0"
                     ,decimals:0
                     ,restrictDecimals: true
                     ,min:0
                     ,max:10000
                     ,spinners:false
                 });
             } else {
                 input.kendoExtNumericTextBox({
                     format: "n2"
                     ,decimals:2
                     ,restrictDecimals: true
                     ,min:0
                     ,max:99999
                     ,spinners:false
                 });
             }

         };

         /**
          * grid 입고창고 DropDownList
          */
          grStrgeCdDropDownEditor = function(container, options) {


              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  strgeTpList
                 ,change:function(e){
                     var data ={
                             "strgeCd":options.model.strgeCd
                             ,"itemCd":options.model.itemCd
                         };

                     $.ajax({
                         url:"<c:url value='/par/pmm/itemMaster/selectItemMovingAvgPrcByKey.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {
                            if(dms.string.isEmpty(result.movingAvgPrc)){
                                options.model.set('prc',0);
                                options.model.set('amt',0);
                                options.model.set('taxDdctPrc',0);
                                options.model.set('taxDdctAmt',0);
                                options.model.set('movingAvgPrc',0);
                                options.model.set('taxAmt',0);
                            }else{

                                options.model.set('prc',result.movingAvgPrc);
                                options.model.set('amt',result.movingAvgPrc * options.model.qty);
                                options.model.set('taxDdctPrc',result.movingAvgPrc / ( 1 + gVatCd ));
                                options.model.set('taxDdctAmt',(result.movingAvgPrc * options.model.qty) / ( 1 + gVatCd ));
                                options.model.set('movingAvgPrc',result.movingAvgPrc);
                                options.model.set('taxAmt',(result.movingAvgPrc * options.model.qty) - (result.movingAvgPrc * options.model.qty) / ( 1 + gVatCd ));
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });

                     options.model.set('locCd','');
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };

         grLocCdDropDownEditor = function(container, options) {

             var itemCd  = options.model.itemCd,
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


        // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-161101"
           ,height:480
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/receive/selectReceiveEtcItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 기타입고현황 검색조건 코드.
                            params["sEtcGrDocNo"] = $("#etcGrDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen      = result.data.length,
                             gridData     = $("#grid").data("kendoExtGrid"),
                             itemList     = [];

                         //for(var i = 0; i < dataLen; i = i + 1){
                         //    itemList.push(result.data[i].itemCd);
                         //}
                         //fnSetLocCdObj(itemList);

                         for(var i = 0; i < dataLen; i = i + 1){
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"etcGrDocNo"
                      ,fields:{
                              etcGrDocNo      :{ type:"string" }
                            , etcGrDocLineNo  :{ type:"number" }
                            , itemCd          :{ type:"string" , editable:false }
                            , itemNm          :{ type:"string" }
                            , unitCd          :{ type:"string" }
                            , qty             :{ type:"number" }
                            , stdStrgeCd      :{ type:"string" }
                            , strgeCd         :{ type:"string" }
                            , locCd           :{ type:"string" }
                            , movingAvgPrc    :{ type:"number" , editable:false }
                            , prc             :{ type:"number" }
                            , amt             :{ type:"number" }
                            , taxAmt          :{ type:"number" }
                            , grDt            :{ type:"date"   , editable:false }
                            , grTime          :{ type:"string" , editable:false }
                            , dcRate          :{ type:"number" }
                            , taxDdctPrc      :{ type:"number" }
                            , taxDdctAmt      :{ type:"number" }
                            , returnQty       :{ type:"number"   , editable:false }
                            , grStatCd        :{ type:"string" , editable:false }
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

                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "stdStrgeCd"||fieldName === "unitCd"
                   ||fieldName === "etcGrDocNo"||fieldName === "etcGrDocLineNo"||fieldName === "locCd" ){
                     this.closeCell();
                }else if(fieldName === "qty"||fieldName === "prc"||fieldName === "strgeCd"){
                    //입고확정 상태인 경우 그리드 수정 불가 , 취소 상태인 경우 그리드 수정 불가.
                    if(selectedItem.grStatCd === '02' || selectedItem.grStatCd === '03'){
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
                                url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sBpCd:$("#bpCd").val()})
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
                                       e.model.set('stdStrgeCd',   result.data[0].strgeCd);
                                       e.model.set('strgeCd',      result.data[0].strgeCd);
                                       e.model.set('locCd',        '');
                                       e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                       //e.model.set('dcRate',       0);
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
                  {   //기타입고현황번호
                      title:"<spring:message code='par.lbl.etcGrDocNo' />"
                     ,field:"etcGrDocNo"
                     ,width:140
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGrDocLineNo"
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
                     ,width:220
                  }
                , {   //기준창고
                      title:"<spring:message code='par.lbl.stdStrgeCd' />"
                     ,field:"stdStrgeCd"
                     ,width:100
                     ,template:'#= changeStrgeCd(stdStrgeCd)#'
                     ,sortable:false
                     ,hidden:true
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.strgeCd' />"
                     ,field:"strgeCd"
                     ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locationCd' />"
                     ,field:"locCd"
                     ,width:140
                     //,editor:grLocCdDropDownEditor
                     //,template:'#= changeGrLocCd(strgeCd, locCd)#'
                     ,sortable:false
                     ,hidden:true
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.grQty' />"
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
                , {   //차입입고단가
                      title:"<spring:message code='par.lbl.grBorrowPrc' />"
                     ,field:"prc"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.grBorrowAmt' />"
                     ,field:"amt"
                     ,width:140
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
                , {   //입고일
                    title:"<spring:message code='global.lbl.grDt' />"
                   ,field:"grDt"
                   ,width:90
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,attributes:{ "style":"text-align:center"}
                   ,hidden:true
                }
              , {   //입고시간
                    title:"<spring:message code='par.lbl.grTime' />"
                   ,field:"grTime"
                   ,attributes:{ "style":"text-align:center"}
                   ,width:80
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
                }//입고단가(세금미포함)
               ,{
                    field:"taxDdctAmt"
                   ,title:"<spring:message code='par.lbl.amtTax' />"
                   ,width:80
                   ,attributes:{ "class":"ar"}
                   ,format:"{0:n2}"
                   ,hidden:true
                }//입고금액(세금미포함)
                ,{
                    field:"grStatCd"
                   ,title:"<spring:message code='par.lbl.grStatCd' />"
                   ,width:80
                   ,attributes:{ "class":"ac"}
                   ,hidden:true
                 }//부품입고상태
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
         changeGrLocCd = function(strgeCd, locCd){
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

 // 부품기타입고 정보 조회.
    function selectEtcReceive(pEtcGrDocNo){

        $.ajax({
            url:"<c:url value='/par/pcm/receive/selectReceiveEtcByKey.do' />",
            data:JSON.stringify({ sEtcGrDocNo:pEtcGrDocNo}),
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
        $("#mvtTp").data("kendoExtDropDownList").value('35');
        $("#mvtTp").data("kendoExtDropDownList").enable(false);

        $("#dlrCd").val(sessionDlrCd);

        popItemObj = {};

        gCrud = "C";

        fnSetButton();

        //기타입고현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pEtcGrDocNo)){
            selectEtcReceive(pEtcGrDocNo);
        }

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
                            $("#bpTp").val(data[0].bpTp);
                            customerSearchPopupWin.close();
                        }
                    }
                }
            }
        });
    }

   // 차입입고리스트 팝업 열기 함수.
    function selectReceiveEtcListPopupWindow(){

        receiveEtcListPopupWindow = dms.window.popup({
            windowId:"ReceiveEtcBorrowListPopup"
            ,title:"<spring:message code='par.title.storingInfo' />"   // 입고정보
            ,content:{
                url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                    ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                    ,"statCd"   :"02"
                    ,"bpCd"     :''//$("#bpCd").val()
                    ,"bpNm"     :''//$("#bpNm").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            $("#etcGrDocNo").val(data[0].etcGrDocNo);
                            pEtcGrDocNo = data[0].etcGrDocNo;

                            selectEtcReceive(pEtcGrDocNo)
                        }
                        receiveEtcListPopupWindow.close();
                    }
                }
            }
        });
    }

  //부품 팝업 열기 함수.
    function selectItemPopupWindow(){

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
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    ,'itemDstinCd':'02'//借进登记入库 添加 功能初始增加条件 贾明 2018-9-27 
                    ,"bpTp":'03' //借进登记入库 添加 功能初始增加条件 贾明 2018-9-27 
                    //, "bpTp":$("#bpTp").val()
                    //, "bpTp":'03'   //차입 부품 대상은 모든 품목임
                    , "selectable":"multiple"
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
                                if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].grStrgeCd])){
                                  popItemData.locCd = locationListObj[data[i].itemCd][data[i].grStrgeCd][0].cmmCd;
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
                            popItemData.qty            = 1;
                            popItemData.prc            = data[i].movingAvgPrc;
                            popItemData.amt            = data[i].movingAvgPrc;
                            popItemData.dcRate         = gVatCd;
                            popItemData.taxDdctPrc     = data[i].movingAvgPrc / ( 1 + gVatCd );
                            popItemData.taxAmt         = data[i].movingAvgPrc - (data[i].movingAvgPrc / ( 1 + gVatCd ));
                            popItemData.taxDdctAmt     = data[i].movingAvgPrc / ( 1 + gVatCd );
                            popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                            popItemData.stdStrgeCd     = data[i].grStrgeCd;
                            popItemData.strgeCd        = data[i].grStrgeCd;
                            popItemData.locCd          = data[i].grLocCd;
                            popItemData.etcGrDocNo     = '';
                            popItemData.etcGrDocLineNo = null;


                            if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                popItemObj[data[i].itemCd] = data[i].itemNm;
                                gridData.dataSource.add(popItemData);
                            }


                        }

                        gridData.select(gridData.tbody.find(">tr"));

                        fnSetAmtInfo();
                        itemByBpCdPopupWindow.close();
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
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnNewCancel").data("kendoButton").enable(false);
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
            "etcGrDocNo"        :''
           ,"etcGrDocLineNo"    :null
           ,"refDocNo"          :''
           ,"refDocLineNo"      :null
           ,"itemCd"            :''
           ,"itemNm"            :''
           ,"unitCd"            :''
           ,"qty"               :0
           ,"stdStrgeCd"        :''
           ,"strgeCd"           :''
           ,"locCd"             :''
           ,"prc"               :0
           ,"amt"               :0
        });
    }
</script>
<!-- //script -->


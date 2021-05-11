<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 其他出库信息 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <!-- <h1 class="title_basic">其他出库信息</h1> -->
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11955" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11954" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 생성 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11953" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnCnfm"><spring:message code="par.btn.confirm" /><!-- 확정 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11952" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11951" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_print hidden" id="btnPrint" type="button"><spring:message code="par.btn.print" /><!--출력  --></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form" id="headerForm">
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
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.giTp" /><!-- 출고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCd" /></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input id="bpCd" class="form_input form_required" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="bpNm" class="form_input" />
                                <a id="searchCustNm"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.etcGiDocNo" /><!-- 기타출고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGiDocNo" class="form_input" />
                                <a id="searchEtcGiDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemQty" /><!-- 수량총계 --></th>
                        <td>
                            <input id="itemQty" data-type="number" class="form_numeric" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCnt" /><!-- 품목수 --></th>
                        <td>
                            <input id="itemCnt" data-type="number" class="form_numeric"  readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.amt" /><!-- 금액총계 --></th>
                        <td>
                            <input id="giTotAmt" data-type="number" class="form_numeric" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td>
                            <input id="remark" type="text" value="" class="form_input">
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11950" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_add  btn_s_min5"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11949" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_del  btn_s_min5"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            </dms:access>
            </div>
        </div>

        <div class="table_grid">
            <!-- 부품기타출고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

    </section>
</div>
    <!-- // 其他出库信息 -->
     <!-- 조달입출고
           -부품 정보 가져올때 도매가 가져옴(세금 포함)
           -세금 17%적용항 TAX_DDCT 정보에 적용함.
           -부품팝업은 판매팝업의 도매가임.
     -->

<!-- script -->
<script>
    var toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        gVatCd              = Number("${vatCd}"),
        gCrud               = "C",
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        giReasonCdObj       = {},
        giReasonCdList      = [],
        mvtTpList           = [],
        existItemChkObj     = {},
        pEtcGiDocNo,
        selectShareStockGiItemPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        searchItemPopupWindow,
        issueEtcListPopupWindow,
        giStrgeCdDropDownEditor,
        giLocCdDropDownEditor;

        locationObj[' '] = "";

        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
            //gVatCd = .16;
            gVatCd = .13;
        }
        console.log('gVatCd:',gVatCd);

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            if("61" === "${obj.cmmCd}"){
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

        giReasonCdObj[' '] = "";
        <c:forEach var="obj" items="${giReasonCdList}" varStatus="status">
            giReasonCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            giReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        $(document).ready(function() {

           //기타출고유형선택
            $("#mvtTp").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:mvtTpList
                ,index:0
            });

            //총계
            $("#giTotAmt").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });
          //총수량
            $("#itemCnt").kendoExtNumericTextBox({
                format:"n0"
               ,spinners:false
            });
            //총수량
            $("#itemQty").kendoExtNumericTextBox({
                format:"n0"
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

            //버튼 - 추가
            $("#btnAdd").kendoButton({
                click:function(e) {

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 업체를 선택해주세요.
                        dms.notification.warning("<spring:message code='par.lbl.dlrCd' var='dlrCd' /><spring:message code='global.info.confirmMsgParam' arguments='${dlrCd}'/>");
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
                                    delete existItemChkObj[l_rowData.itemCd][l_rowData.strgeCd];
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
                        header;

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
                                    dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${qty}'/>");
                                    saveList = [];
                                    return false;
                                }
                                /*
                                if(dms.string.isEmpty(gridData.giReasonCd)){
                                    // 출고 사유를 입력하십시오.
                                    dms.notification.warning("<spring:message code='par.lbl.giReasonCd' var='giReasonCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${giReasonCd}'/>");
                                    saveList = [];
                                    return false;
                                }*/

                                if(dms.string.isEmpty(gridData.strgeCd)){
                                    // 창고를 선택하십시오
                                    dms.notification.warning("<spring:message code='par.lbl.strgeCd' var='strgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strgeCd}'/>");
                                    saveList = [];
                                    return false;
                                }

                                if(Number(gridData.qty) > Number(gridData.avlbStockQty)){
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
                                   "issueEtcVO":header
                                  ,"issueEtcItemList":saveList
                                };

                            $.ajax({
                                 url:"<c:url value='/par/ism/issue/createIssueEtcReg.do' />"
                                ,data:kendo.stringify(data)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,success:function(result) {

                                    if (result.resultYn == true) {
                                        dms.notification.success("<spring:message code='par.lbl.saveSuccMsg'/>");

                                        pEtcGiDocNo = result.etcGiDocNo;
                                        $('#etcGiDocNo').val(result.etcGiDocNo);

                                        fnSetButton('01');

                                        // 부품기타출고 조회.
                                        selectEtcIssue(pEtcGiDocNo);

                                    } else {
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
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
                                ,async:false
                                ,success:function(result) {

                                    if (result === true) {
                                        dms.notification.success("<spring:message code='par.lbl.saveSuccMsg'/>");

                                        pEtcGiDocNo = $('#etcGiDocNo').val();
                                        $('#etcGiDocNo').val(pEtcGiDocNo);

                                        $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                        fnSetButton('01');

                                        // 부품기타출고 조회.
                                        selectEtcIssue(pEtcGiDocNo);

                                    } else {

                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
                                        }
                                    }
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
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
                        header;


                    //라인 추가 및 라인 삭제 시 저장 후 확정해야함.
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

                            if(dms.string.isEmpty(gridData.giReasonCd)){
                                // 출고 사유를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.giReasonCd' var='giReasonCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giReasonCd}'/>");
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
                            url:"<c:url value='/par/ism/issue/createIssueProcure.do' />"
                           ,data:kendo.stringify(data)
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:false
                           ,success:function(result) {

                               if (result.resultYn == true) {
                                   dms.notification.success("<spring:message code='par.lbl.issueFunds' var='etcGiDocNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${etcGiDocNo}'/>");

                                   pEtcGiDocNo = $('#etcGiDocNo').val();

                                   fnSetButton('02');

                                   // 부품기타출고 조회.
                                   selectEtcIssue(pEtcGiDocNo);

                               } else {

                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
                                   }
                               }
                           }
                           ,beforeSend:function(){
                               dms.loading.show($("#screenSection"));
                           }
                           ,complete:function(){
                               dms.loading.hide($("#screenSection"));
                           }
                           ,error:function(jqXHR,status,error) {
                               dms.loading.hide($("#screenSection"));
                               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                           }
                       });
                    }
                  }
            });
            //취소 버튼
            $("#btnCancel").kendoButton({
                click:function(e){

                    var saveList      = [],
                        grid          = $("#grid").data("kendoExtGrid"),
                        rows          = grid.tbody.find("tr"),
                        mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                        header;

                    header = {
                            etcGiDocNo      :$('#etcGiDocNo').val()
                           ,bpCd            :$('#bpCd').val()
                           ,mvtTp           :mvtType
                           ,updtDtStr       :$("#updtDtStr").val()
                    };

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                            saveList.push(gridData);
                    });

                    if(saveList.length > 0){
                        var data ={
                                "issueEtcVO":header
                               ,"issueEtcItemList":saveList
                            };

                        $.ajax({
                            url:"<c:url value='/par/ism/issue/cancelIssueEtc.do' />"
                           ,data:kendo.stringify(data)
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:false
                           ,success:function(result) {

                               if (result === true) {
                                   dms.notification.success("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${etcGiDocNo}'/>");

                                   fnSetButton('03');

                                   selectEtcIssue($('#etcGiDocNo').val());

                               } else {

                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.delFailedParam' arguments='${etcGiDocNo}'/>");
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

            $("#searchCustCd").on('click', selectCustSearchPopupWindow);
            $("#searchCustNm").on('click', selectCustSearchPopupWindow);
            $("#searchEtcGiDocNo").on('click', selectIssueEtcListPopupWindow);

            /**
             * grid 단가&수량
             */
             changeAmtEditor = function(container, options) {
                 var input       = $("<input/>"),
                     lTaxDdctPrc = 0,
                     mvtTp,
                     pValue;

                 mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();
                 input.attr("name", options.field);

                 input.keyup(function(){

                 });

                 input.blur(function(){
                     lTaxDdctPrc = options.model.prc /  ( 1 + gVatCd );
                     options.model.set("amt",         options.model.prc * options.model.qty);
                     options.model.set("taxAmt",     (options.model.prc * options.model.qty) - (lTaxDdctPrc *  options.model.qty));
                     options.model.set("taxDdctAmt",  lTaxDdctPrc *  options.model.qty);
                     options.model.set("taxDdctPrc",  lTaxDdctPrc);
                     options.model.set("dcRate",      gVatCd);
                     fnSetAmtInfo();
                 });

                 input.appendTo(container);
                 if(options.field === 'qty') {
                     input.kendoExtNumericTextBox({
                         format: "n2"
                         ,decimals:2
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
                gridId:"G-PAR-0808-175547"
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
                             var dataLen = result.data.length,
                                 itemList = [];

                             for(var i = 0; i < dataLen; i = i + 1){
                                 if(existItemChkObj.hasOwnProperty(result.data[i].itemCd)){
                                     existItemChkObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                                 }else{
                                     existItemChkObj[result.data[i].itemCd] = {};
                                     existItemChkObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                                 }
                             }

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
                                , avlbStockQty    :{ type:"number" }
                                , stdStrgeCd      :{ type:"string" }
                                , strgeCd         :{ type:"string" }
                                , giReasonCd      :{ type:"string" }
                                , locCd           :{ type:"string" }
                                , retailPrc       :{ type:"number" }
                                , prc             :{ type:"number" }
                                , amt             :{ type:"number" }
                                , taxAmt          :{ type:"number" }
                                , receiveId       :{ type:"string" , editable:false }
                                , giDt            :{ type:"date"   , editable:false }
                                , giTime          :{ type:"string" , editable:false }
                                , cancQty         :{ type:"number" , editable:false }
                                , cancDt          :{ type:"date"   , editable:false }
                                , cancTime        :{ type:"string" , editable:false }
                                , cancId          :{ type:"string" , editable:false }
                                , cancUsrNm       :{ type:"string" , editable:false }
                                , dcRate          :{ type:"number" }
                                , taxDdctPrc      :{ type:"number" }
                                , taxDdctAmt      :{ type:"number" }
                                , giStatCd        :{ type:"string" , editable:false }
                            }
                        }
                    }
                }
                , selectable :"multiple"
                , scrollable :true
                , sortable   :false
                , autoBind   :false
                , filterable:false
                , appendEmptyColumn:true
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

                    if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "retailPrc"||fieldName === "taxAmt"||fieldName === "avlbStockQty"
                            ||fieldName === "unitCd"||fieldName === "receiveId"||fieldName === "cancDt"||fieldName === "cancTime"
                            ||fieldName === "cancId"||fieldName === "strgeCd"||fieldName === "locCd"  ){
                         this.closeCell();
                    }else if(fieldName === "qty"||fieldName === "prc"||fieldName === "giReasonCd"){
                        //출고대기만 수정 가능.
                        if(selectedItem.giStatCd === '02'){
                            this.closeCell();
                        }
                    }else if(fieldName === "itemCd"){
                        pVal = input.val();
                        orgVal = input.val();

                        input.keyup(function(){
                            pVal = input.val();
                        });

                        input.blur(function(){

                            if(dms.string.isEmpty($("#bpCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() === '41'){
                                // 업체를 선택해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.custCd' var='custCd' /><spring:message code='global.info.confirmMsgParam' arguments='${custCd}'/>");
                                e.model.set('itemCd', orgVal);
                                return false;
                            }

                            if(orgVal !== pVal){

                                if(existItemChkObj.hasOwnProperty(pVal)){
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
                                       var lTaxDdctPrc = 0;

                                       if (result.total === 1) {
                                           lTaxDdctPrc = result.data[0].salePrcAmt /  ( 1 + gVatCd );

                                           e.model.set('itemCd',       result.data[0].itemCd);
                                           e.model.set('itemNm',       result.data[0].itemNm);
                                           e.model.set('unitCd',       result.data[0].stockUnitCd);
                                           e.model.set('qty',          1);
                                           e.model.set('prc',          result.data[0].salePrcAmt);
                                           e.model.set('amt',          result.data[0].salePrcAmt);
                                           e.model.set('taxAmt',       result.data[0].salePrcAmt - lTaxDdctPrc);
                                           e.model.set('strgeCd',      result.data[0].giStrgeCd);
                                           e.model.set('retailPrc',    result.data[0].salePrcAmt);
                                           e.model.set('dcRate',       gVatCd);
                                           e.model.set('taxDdctPrc',   lTaxDdctPrc);
                                           e.model.set('taxDdctAmt',   lTaxDdctPrc);
                                           e.model.set('avlbStockQty', result.data[0].avlbStockQty);

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

                    }

                 }
                , columns:[
                      {   //조달출고현황번호
                          title:"<spring:message code='par.lbl.obtGiDocNo' />"
                         ,field:"etcGiDocNo"
                         ,width:120
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
                         ,width:100
                      }
                    , {   //부품명
                          title:"<spring:message code='par.lbl.itemNm' />"
                         ,field:"itemNm"
                         ,width:180
                      }
                    , {   //수량
                          title:"<spring:message code='par.lbl.qty' />"
                         ,field:"qty"
                         ,width:60
                         ,attributes:{ "class":"ar"}
                         ,editor:changeAmtEditor
                         ,format:"{0:n2}"
                      }
                    , {   //가용수량
                          title:"<spring:message code='par.lbl.avlbStockQty' />"
                         ,field:"avlbStockQty"
                         ,width:60
                         ,attributes:{ "class":"ar"}
                         ,format:"{0:n2}"
                      }
                    , {   //단가
                          title:"<spring:message code='par.lbl.prc' />"
                         ,field:"prc"
                         ,width:80
                         ,attributes:{ "class":"ar"}
                         ,editor:changeAmtEditor
                         ,format:"{0:n2}"
                      }
                    , {   //출고창고
                          title:"<spring:message code='par.lbl.giStrgeCd' />"
                         ,field:"strgeCd"
                         ,width:100
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
                    , {   //소매가
                          title:"<spring:message code='par.lbl.salePriceCost01' />"
                         ,field:"retailPrc"
                         ,width:80
                         ,attributes:{ "class":"ar"}
                         ,format:"{0:n2}"
                      }
                    , {   //단위
                          title:"<spring:message code='par.lbl.unitNm' />"
                         ,field:"unitCd"
                         ,width:80
                         ,attributes:{ "class":"ac"}
                         ,template:'#= changeUnitCd(unitCd)#'
                      }
                    , {   //금액
                          title:"<spring:message code='par.lbl.amt' />"
                         ,field:"amt"
                         ,width:90
                         ,attributes:{ "class":"ar"}
                         ,format:"{0:n2}"
                      }
                    , {   //세액
                          title:"<spring:message code='par.lbl.vatAmt' />"
                         ,field:"taxAmt"
                         ,width:90
                         ,attributes:{ "class":"ar"}
                         ,format:"{0:n2}"
                      }
                    , {   //출고사유
                          title:"<spring:message code='par.lbl.giReasonCd' />"
                         ,field:"giReasonCd"
                         ,width:100
                         ,sortable:false
                      }
                    , {   //출고일
                          title:"<spring:message code='global.lbl.giDt' />"
                         ,field:"giDt"
                         ,width:80
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                         ,attributes:{ "class":"ac"}
                      }
                    , {   //출고시간
                          title:"<spring:message code='par.lbl.receiveTime' />"
                         ,field:"giTime"
                         ,attributes:{ "class":"ac"}
                         ,width:80
                      }
                    , {   //수령인
                          title:"<spring:message code='ser.lbl.outUser' />"
                         ,field:"receiveId"
                         ,width:80
                      }
                    , {   //취소수량
                          title:"<spring:message code='par.lbl.cancQty' />"
                         ,field:"cancQty"
                         ,width:60
                         ,attributes:{ "class":"ar"}
                         ,format:"{0:n0}"
                         ,decimal:0
                      }
                    , {   //취소일
                          title:"<spring:message code='par.lbl.cancDt' />"
                         ,field:"cancDt"
                         ,width:80
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                         ,attributes:{ "class":"ac"}
                      }
                    , {   //취소시간
                          title:"<spring:message code='par.lbl.cancTime' />"
                         ,field:"cancTime"
                         ,attributes:{ "class":"ac"}
                         ,width:80
                      }
                    , {   //반품인
                          title:"<spring:message code='par.lbl.cancer' />"
                         ,field:"cancId"
                         ,width:80
                         ,hidden:true
                      }
                    , {   //반품인
                          title:"<spring:message code='par.lbl.cancer' />"
                         ,field:"cancUsrNm"
                         ,width:80
                      }
                    , {   //D/C Rate
                        title:"<spring:message code='par.lbl.dcRate' />"
                            ,field:"dcRate"
                            ,width:60
                            ,attributes:{ "class":"ar"}
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

            // 출고사유
            /*
            changeGiReasonCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = giReasonCdObj[val];
                }
                return returnVal;
            };
            */

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
            if (!partsJs.validate.getAllPluginObjInfo($("#headerForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#grid").data("kendoExtGrid").dataSource.data([]);

            $("#itemCnt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#itemCnt").data("kendoExtNumericTextBox").enable(false);
            $("#itemQty").closest(".k-numerictextbox").addClass("form_readonly");
            $("#itemQty").data("kendoExtNumericTextBox").enable(false);
            $("#giTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#giTotAmt").data("kendoExtNumericTextBox").enable(false);

            $("#mvtTp").data("kendoExtDropDownList").enable(false);
            $("#mvtTp").data("kendoExtDropDownList").value("61");

            existItemChkObj = {};

            gCrud = "C";

            fnSetButton();

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
                        , "prcTp"       :'02' //도매가
                        , "itemDstinCd" :'02'
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                lTaxDdctPrc  = 0,
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                rows;

                            //for(var i = 0; i < dataLen; i = i + 1){
                            //    itemList.push(data[i].itemCd);
                            //}
                            //fnSetLocCdObj(itemList);

                            for(var i = 0; i < dataLen; i = i + 1){
                                lTaxDdctPrc  = Number(data[i].salePrcAmt) /  ( 1 + gVatCd );

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
                                popItemData.amt            = Number(data[i].salePrcAmt) * Number(data[i].giQty);
                                popItemData.dcRate         = gVatCd;
                                popItemData.taxDdctPrc     = lTaxDdctPrc;
                                popItemData.taxAmt         = (Number(data[i].salePrcAmt) * Number(data[i].giQty)) - (lTaxDdctPrc * Number(data[i].giQty));
                                popItemData.taxDdctAmt     = lTaxDdctPrc * Number(data[i].giQty);
                                //popItemData.taxDdctPrc     = data[i].salePrcAmt - (data[i].salePrcAmt * gVatCd);
                                //popItemData.taxAmt         = (Number(data[i].salePrcAmt) * Number(data[i].giQty)) * gVatCd;
                                //popItemData.taxDdctAmt     = (Number(data[i].salePrcAmt) * Number(data[i].giQty)) - ((Number(data[i].salePrcAmt) * Number(data[i].giQty)) * gVatCd);
                                popItemData.prc            = data[i].salePrcAmt;
                                popItemData.avlbStockQty   = data[i].avlbStockQty;
                                popItemData.strgeCd        = data[i].giStrgeCd;
                                popItemData.locCd          = data[i].giLocCd;
                                popItemData.retailPrc      = data[i].salePrcAmt;
                                popItemData.giReasonCd     = '';
                                popItemData.etcGiDocNo     = '';
                                popItemData.etcGiDocLineNo = null;


                                if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                    if(existItemChkObj[data[i].itemCd].hasOwnProperty(data[i].giStrgeCd)){
                                        //이미 등록되어있는 부품입니다.
                                        var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']' + '[' + strgeTpObj[data[i].giStrgeCd] + ']';
                                        dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                    }else{
                                        existItemChkObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }else{
                                    existItemChkObj[data[i].itemCd] = {};
                                    existItemChkObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
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

        /* 딜러조회 검색 팝업 */
        var dealerSearchPopupWin;
        function selectCustSearchPopupWindow(){
            dealerSearchPopupWin = dms.window.popup({
                windowId :"dealerSearchPopupWin"
                ,title :"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
                ,modal:true
                , content :{
                    url :"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                        , data:{
                            "autoBind" :false
                            ,"dlrCd":$("#bpCd").val()
                            ,"dlrNm":$("#bpNm").val()
                            ,"closeAfterSelect":true
                            ,"callbackFunc" :function(data){
                                if(data.length >= 1) {
                                    $("#bpCd").val(data[0].dlrCd);
                                    $("#bpNm").val(data[0].dlrNm);
                                }
                            }
                        }
                }
            });
        }

       // 조달출고리스트 팝업 열기 함수.
        function selectIssueEtcListPopupWindow(){

            issueEtcListPopupWindow = dms.window.popup({
                windowId:"issueEtcFundsListPopup"
                ,title:"<spring:message code='par.title.etcGiDocNo' />"//기타출고번호
                ,width:805
                ,height:385
                ,content:{
                    url:"<c:url value='/par/cmm/selectIssueEtcListPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                        ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                        ,"bpCd"     :$("#bpCd").val()
                        ,"bpCdNm"   :$("#bpNm").val()
                        ,"etcGiDocNo":$("#etcGiDocNo").val()
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
                totalAmt = totalAmt + (gridData.prc * gridData.qty);
                totalQty = totalQty + gridData.qty;

            });
            $("#itemQty").data("kendoExtNumericTextBox").value(totalQty);
            $("#itemCnt").data("kendoExtNumericTextBox").value(rows.length);
            $("#giTotAmt").data("kendoExtNumericTextBox").value(totalAmt);
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

        function fnSetButton(pType){
            if(pType === '01'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(true);
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
            }else if(pType === '02'){
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
            }else if(pType === '03'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
            }else{
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
            }
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
               ,"strgeCd"           :''
               ,"giReasonCd"        :''
               ,"locCd"             :''
               ,"retailPrc"         :0
               ,"prc"               :0
               ,"amt"               :0
            });
        }

</script>
<!-- //script -->


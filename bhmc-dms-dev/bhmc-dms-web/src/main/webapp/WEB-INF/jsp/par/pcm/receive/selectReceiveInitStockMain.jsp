<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript"
    src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 基础库存入库 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
    <div class="header_area">
        <div class="btn_left">
            <button class="btn_m btn_reset" id="btnInit">
                <spring:message code="par.btn.init" />
                <!-- 초기화 -->
            </button>
        </div>
        <div class="btn_right">
            <button class="btn_m" id="btnSave">
                <spring:message code="par.btn.salePriceCreate" />
                <!-- 생성 -->
            </button>
            <button class="btn_m" id="btnCnfm">
                <spring:message code="par.btn.confirm" />
                <!-- 확정 -->
            </button>
            <button class="btn_m btn_cancel" id="btnCancel">
                <spring:message code="par.btn.cancel" />
                <!--취소  -->
            </button>
        </div>
    </div>
    <div class="table_form" id="headerForm">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">
                        <span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span>
                    </th>
                    <td class="required_area">
                        <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                    </td>
                    <th scope="row">
                        <span class="bu_required"><spring:message code="par.lbl.sBpCd" /><!-- 공급업체 --></span>
                    </th>
                    <td class="required_area">
                        <input id="bpCd" class="form_input form_required form_readonly" readonly>
                        <input id="bpTp" name="bpTp" class="form_input hidden" />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.sBpNm" /><!-- 공급업체 -->
                    </th>
                    <td>
                        <input type="text" id="bpNm" class="form_input form_readonly" readonly>
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.initStockReceiveDocNo" />
                        <!-- 기초재고입고문서번호 -->
                    </th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="etcGrDocNo" class="form_input form_readonly" readonly>
                            <a id="searchEtcGrDocNo"><!-- 검색 --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <spring:message code="par.lbl.itemQty" />
                        <!-- 수량총계 -->
                    </th>
                    <td>
                        <input id="itemQty" data-type="number" class="form_numeric" readonly />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.itemCnt" /><!-- 품목수 -->
                    </th>
                    <td>
                      <input id="itemCnt" data-type="number" class="form_numeric" readonly>
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.amt" /><!-- 금액총계 -->
                    </th>
                    <td>
                        <input id="grTotAmt" data-type="number" class="form_numeric" readonly />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.remark" />
                        <!--비고 -->
                    </th>
                    <td>
                        <input id="remark" type="text" value="" class="form_input"/>
                        <input id="updtDtStr" type="text" class="form_input hidden"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnExcelUpload" name="btnExcelUpload" class="btn_s btn_add btn_s_min5">
                <spring:message code="par.btn.excelUpload" />
            </button>
            <button class="btn_s btn_add  btn_s_min5" id="btnAddItem">
                <spring:message code="par.btn.add" />
            </button>
            <button class="btn_s btn_del  btn_s_min5" id="btnDelItem">
                <spring:message code="par.btn.del" />
            </button>
        </div>
    </div>

    <div class="table_grid">
        <!-- 부품기타입고 그리드 -->
        <div id="grid" class="resizable_grid"></div>
    </div>

    </section>
</div>
<!-- // 其他出库信息 -->
<!-- 기초재고입고
           -부품 정보 가져올때 도매가 가져옴(세금 포함)
           -세금 17%적용항 TAX_DDCT 정보에 적용함.
           -부품팝업은 판매팝업의 도매가임.
     -->
<!-- script -->
<script>
var toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    sessionDlrCd        = "${dlrCd}",
    sessionDlrNm        = "${dlrNm}",
    gVatCd              = Number("${vatCd}"),
    gCrud               = "C",
    unitCdObj           = {},
    strgeTpObj          = {},
    strgeTpList         = [],
    locationListObj     = {},
    locationObj         = {},
    mvtTpList           = [],
    existItemChkObj     = {},
    pEtcGrDocNo         = {},
    issueEtcFundListPopupWindow,
    changeAmtEditor,
    receiveEtcListPopupWindow,
    itemByBpCdPopupWindow,
    grStrgeCdDropDownEditor,
    grLocCdDropDownEditor;

    locationObj[' '] = "";

    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if("31" === "${obj.cmmCd}"){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
        //gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);

        $(document).ready(function() {



           //기타출고유형선택
            $("#mvtTp").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:mvtTpList
                ,index:0
            });

           //총계
            $("#grTotAmt").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });
            //총수량
            $("#itemCnt").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });
            //총품목수
            $("#itemQty").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });

            // 초기화 버튼
            $("#btnInit").kendoButton({
                click:function(e){
                    pEtcGrDocNo = '';
                    gCrud       = "C";
                    initPage();
                }
            });

         // 부품추가 버튼
            $("#btnAddItem").kendoButton({
                click:function(e){
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

                    var grid = $("#grid").data("kendoExtGrid"),
                        rows = grid.select();


                    rows.each(function(index, row) {
                        var l_rowData = grid.dataItem(row);
                        delete existItemChkObj[l_rowData.itemCd];

                    });

                    rows.each(function(index, row) {
                        grid.removeRow(row);
                    });

                    fnSetAmtInfo();

                }
            });

         // 엑셀 업로드
            $("#btnExcelUpload").kendoButton({
                click:function(e) {
                    var bpCd = $("#bpCd").val();

                    if(dms.string.isEmpty(bpCd)){
                        //공급업체 정보가 없습니다.
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                        return false;
                    }

                    receiveEtcExcelUploadPopupWin = dms.window.popup({
                        title:"<spring:message code='par.title.uploadFile' />"
                        ,windowId:"receiveEtcExcelUploadPopupWin"
                        ,width : 680
                        ,height: 340
                        ,content:{
                             url:"<c:url value='/par/cmm/selectReceiveEtcExcelUploadPopup.do'/>"
                            ,data:{
                                "bpTp":$("#bpTp").val()
                               ,"callbackFunc":function(data){

                                    var dataLen      = data.length,
                                        gridData     = $("#grid").data("kendoExtGrid"),
                                        popItemData  = {},
                                        itemList     = [],
                                        tDate,
                                        rows;



                                    for(var i = 0; i < dataLen; i = i + 1){
                                        itemList.push(data[i].itemCd);
                                    }
                                    fnSetLocCdObj(itemList);

                                    for(var i = 0; i < dataLen; i = i + 1){
                                        //내용
                                        popItemData.itemCd         = data[i].itemCd;
                                        popItemData.itemNm         = data[i].itemNm;
                                        popItemData.qty            = data[i].invcQty;
                                        popItemData.prc            = data[i].invcPrc;
                                        popItemData.amt            = data[i].invcTotAmt;
                                        popItemData.strgeCd        = data[i].grStrgeCd;
                                        popItemData.dcRate         = gVatCd;
                                        popItemData.taxDdctPrc     = data[i].taxDdctPrc;
                                        popItemData.taxDdctAmt     = data[i].invcAmt;
                                        popItemData.taxAmt         = data[i].taxAmt;
                                        popItemData.locCd          = '';
                                        popItemData.grReasonCd     = '';
                                        popItemData.refDocNo       = '';
                                        popItemData.refDocLineNo   = '';
                                        popItemData.etcGrDocNo     = '';
                                        popItemData.etcGrDocLineNo = null;

                                        if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                            //이미 등록되어있는 부품입니다.
                                            var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                            dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                        }else{
                                            existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                            gridData.dataSource.add(popItemData);
                                        }
                                    }

                                    gridData.select(gridData.tbody.find(">tr"));
                                    dms.loading.hide();
                                    receiveEtcExcelUploadPopupWin.close();
                                    fnSetAmtInfo();
                                }
                            }
                        }
                    });
                }
            });

           // 저장 버튼(등록)
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
                                if(dms.string.isEmpty(gridData.grReasonCd)){
                                    // 입고 사유를 입력하십시오.
                                    dms.notification.warning("<spring:message code='par.lbl.grReasonCd' var='grReasonCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grReasonCd}'/>");
                                    saveList = [];
                                    return false;
                                }
                                */

                                if(dms.string.isEmpty(gridData.strgeCd)){
                                    // 창고를 선택하십시오
                                    dms.notification.warning("<spring:message code='par.lbl.strgeCd' var='strgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strgeCd}'/>");
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
                                        dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");

                                        pEtcGrDocNo = result.etcGrDocNo;
                                        $('#etcGrDocNo').val(result.etcGrDocNo);
                                        fnSetButton('01');

                                        // 부품기타출고 조회.
                                        selectEtcReceive(pEtcGrDocNo);
                                    } else {
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
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
                                       dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");
                                       pEtcGrDocNo = $('#etcGrDocNo').val();
                                       $('#etcGrDocNo').val(pEtcGrDocNo);
                                       $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                                       fnSetButton('01');

                                       // 부품기타입고 조회.
                                       selectEtcReceive(pEtcGrDocNo);
                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
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
                        modifyLeng     = insertListLeng + updateListLeng + deleteListLeng,
                        header;


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
                          , etcGrDocNo       :$('#etcGrDocNo').val()
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

                            /*
                            if(dms.string.isEmpty(gridData.giLocCd)){
                                // 로케이션을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.locationCd' var='locCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${locCd}'/>");
                                saveList = [];
                                return false;
                            }
                            */

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
                                   dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");
                                   pEtcGrDocNo = $('#etcGrDocNo').val();

                                   fnSetButton('02');

                                   // 부품기타입고 조회.
                                   selectEtcReceive(pEtcGrDocNo);

                               } else {
                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
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

                    var saveList      = [],
                        grid          = $("#grid").data("kendoExtGrid"),
                        rows          = grid.tbody.find("tr"),
                        mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                        header;


                    header = {
                            etcGrDocNo      :$('#etcGrDocNo').val()
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
                                "receiveEtcVO":header
                                ,"receiveEtcItemList":saveList
                            };

                        $.ajax({
                            url:"<c:url value='/par/pcm/receive/cancelReceiveEtcs.do' />"
                           ,data:kendo.stringify(data)
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:true
                           ,success:function(result) {

                               if (result === true) {
                                   dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${etcGrDocNo}'/>");

                                   fnSetButton('03');

                                   selectEtcReceive($("#etcGrDocNo").val());

                               } else {
                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.err.delFailedParam' arguments='${etcGrDocNo}'/>");
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

            //$("#searchCustCd").on('click', selectVenderMasterPopupWindow);
            $("#searchEtcGrDocNo").on('click', selectReceiveEtcListPopupWindow);

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

                 });

                 input.blur(function(){
                     options.model.set("amt",         options.model.prc * options.model.qty);
                     options.model.set("taxAmt",     (options.model.prc * options.model.qty) - ((options.model.prc * options.model.qty)  / ( 1 + gVatCd )));
                     options.model.set("taxDdctAmt", (options.model.prc * options.model.qty)  / ( 1 + gVatCd ));
                     options.model.set("taxDdctPrc",  options.model.prc / ( 1 + gVatCd ));
                     //options.model.set("taxAmt",     (options.model.prc * options.model.qty) *  gVatCd);
                     //options.model.set("taxDdctAmt", (options.model.prc * options.model.qty) - ((options.model.prc * options.model.qty) *  gVatCd));
                     //options.model.set("taxDdctPrc",  options.model.prc - (options.model.prc *  gVatCd));
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
             * grid 입고창고 DropDownList
             */
             grStrgeCdDropDownEditor = function(container, options) {

                console.log('grStrgeCdDropDownEditor:',container,options);

                 $('<input data-bind="value:' + options.field + '"  />')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     dataTextField: "cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:  strgeTpList
                    ,change:function(e){
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
                 gridId:"G-PAR-0808-161102"
                ,height:480
                ,dataSource:{
                     transport:{
                         read:{
                              url:"<c:url value='/par/pcm/receive/selectReceiveEtcItemByKey.do' />"
                         }
                         , parameterMap:function(options, operation) {
                             if (operation === "read") {

                                 var params = {};

                                 // 기타출고현황 검색조건 코드.
                                 params["sEtcGrDocNo"] = $("#etcGrDocNo").val();
                                 params["sStatCd"]     = '02';
                                 params["sMvtTp"]      = $("#mvtTp").data("kendoExtDropDownList").value();

                                 return kendo.stringify(params);
                             }
                         }
                     }
                     ,schema:{
                          data:function (result){
                              var dataLen      = result.data.length,
                                  gridData     = $("#grid").data("kendoExtGrid"),
                                  popItemData  = {},
                                  itemList     = [];

                              for(var i = 0; i < dataLen; i = i + 1){
                                  itemList.push(result.data[i].itemCd);
                                  existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;
                              }

                              locationListObj = {};

                              if(dataLen > 0){
                                  fnSetLocCdObj(itemList);
                              }

                              return result.data;
                          }
                         ,total:"total"
                         ,model:{
                            id:"etcGrDocNo"
                           ,fields:{
                                   etcGrDocNo      :{ type:"string", editable:false }
                                 , etcGrDocLineNo  :{ type:"number", editable:false }
                                 , itemCd          :{ type:"string" }
                                 , itemNm          :{ type:"string" }
                                 , qty             :{ type:"number" }
                                 , strgeCd         :{ type:"string" }
                                 , grReasonCd      :{ type:"string" }
                                 , locCd           :{ type:"string" }
                                 , prc             :{ type:"number" }
                                 , amt             :{ type:"number" }
                                 , dcRate          :{ type:"number" }
                                 , taxAmt          :{ type:"number" }
                                 , taxDdctPrc      :{ type:"number" }
                                 , taxDdctAmt      :{ type:"number" }
                                 , refDocNo        :{ type:"string", editable:false  }
                                 , refDocLineNo    :{ type:"number", editable:false  }
                                 , receiveUsrNm    :{ type:"string", editable:false  }
                                 , grDt            :{ type:"date"  , editable:false  }
                                 , grTime          :{ type:"string", editable:false  }
                                 , cancQty         :{ type:"number" , editable:false }
                                 , cancDt          :{ type:"date"   , editable:false }
                                 , cancTime        :{ type:"string" , editable:false }
                                 , cancId          :{ type:"string" , editable:false }
                                 , cancUsrNm       :{ type:"string" , editable:false }
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
                 //, multiSelectWithCheckbox:true
                 , pageable:false
                 , edit:function(e){
                     var eles = e.container.find("input"),
                         rows = e.sender.select(),
                         selectedItem = e.sender.dataItem(rows[0]),
                         grid = this,
                         input = e.container.find(".k-input"),
                         pVal,
                         orgVal,
                         fieldName = grid.columns[e.container.index()].field;

                     if(fieldName === "itemNm"||fieldName === "amt"){
                         this.closeCell();
                     }else if(fieldName === "itemCd"){
                         if(!dms.string.isEmpty(selectedItem.etcGrDocNo)){
                             this.closeCell();
                         }else{
                             pVal = input.val();
                             orgVal = input.val();

                             input.keyup(function(){
                                 pVal = input.val();
                             });

                             input.blur(function(){

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
                                        ,data:kendo.stringify({sItemCd:pVal, sBpCd:$("#bpCd").val()})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,async:false
                                        ,success:function(result) {

                                            if (result.total === 1) {
                                                e.model.set('etcGrDocNo', "");
                                                e.model.set('etcGrDocLineNo', null);
                                                e.model.set('refDocNo', "");
                                                e.model.set('refDocLineNo', null);
                                                e.model.set('itemCd', result.data[0].itemCd);
                                                e.model.set('itemNm', result.data[0].itemNm);
                                                e.model.set('grReasonCd', "");
                                                e.model.set('strgeCd', result.data[0].grStrgeCd);
                                                e.model.set('locCd', "");
                                                e.model.set('qty', 1);
                                                e.model.set('prc', result.data[0].purcPrc);
                                                e.model.set('amt', result.data[0].purcPrc);
                                                e.model.set('dcRate', gVatCd);
                                                e.model.set('taxDdctPrc', result.data[0].purcPrc / ( 1 + gVatCd ));
                                                e.model.set('taxAmt',  result.data[0].purcPrc - (result.data[0].purcPrc / ( 1 + gVatCd )));
                                                e.model.set('taxDdctAmt', result.data[0].purcPrc / ( 1 + gVatCd ));
                                                //e.model.set('taxDdctPrc', result.data[0].purcPrc - (result.data[0].purcPrc * gVatCd));
                                                //e.model.set('taxAmt',  result.data[0].purcPrc * gVatCd);
                                                //e.model.set('taxDdctAmt', result.data[0].purcPrc - (result.data[0].purcPrc * gVatCd));

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
                 }
                 , columns:[
                        {   //기초재고입고현황번호
                           title:"<spring:message code='par.lbl.initStockReceiveDocNo' />"
                          ,field:"etcGrDocNo"
                          ,width:140
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
                          ,width:200
                       }
                     , {   //수량
                           title:"<spring:message code='par.lbl.qty' />"
                          ,field:"qty"
                          ,width:80
                          ,attributes:{ "style":"text-align:right"}
                          ,editor:changeAmtEditor
                          ,format:"{0:n2}"
                          ,decimal:2
                       }
                     , {   //단가
                           title:"<spring:message code='par.lbl.prc' />"
                          ,field:"prc"
                          ,width:80
                          ,attributes:{ "style":"text-align:right"}
                          ,editor:changeAmtEditor
                          ,format:"{0:n2}"
                          ,decimals:2
                       }
                     , {   //출고창고
                           title:"<spring:message code='par.lbl.grStrgeCd' />"
                          ,field:"strgeCd"
                          ,width:120
                          ,editor:grStrgeCdDropDownEditor
                          ,template:'#= changeStrgeCd(strgeCd)#'
                          ,sortable:false
                       }
                     , {   //로케이션
                           title:"<spring:message code='par.lbl.locationCd' />"
                          ,field:"locCd"
                          ,width:140
                          ,editor:grLocCdDropDownEditor
                          ,template:'#= changeGrLocCd(strgeCd, locCd)#'
                          ,sortable:false
                       }
                     , {   //금액
                           title:"<spring:message code='par.lbl.amt' />"
                          ,field:"amt"
                          ,width:90
                          ,attributes:{ "style":"text-align:right"}
                          ,format:"{0:n2}"
                          ,decimals:2
                       }
                     , {   //기타출고현황번호
                           title:"<spring:message code='par.lbl.etcGiDocNo' />"
                          ,field:"refDocNo"
                          ,width:120
                          ,hidden:true
                       }
                     , {   //Line
                           title:"<spring:message code='par.lbl.lineNm' />"
                          ,field:"refDocLineNo"
                          ,width:60
                          ,hidden:true
                       }
                     , {   //입고사유
                           title:"<spring:message code='par.lbl.grReasonCd' />"
                          ,field:"grReasonCd"
                          ,width:100
                          ,sortable:false
                          ,hidden:true
                       }
                     , {   //입고일
                           title:"<spring:message code='global.lbl.grDt' />"
                          ,field:"grDt"
                          ,width:90
                          ,format:"{0:<dms:configValue code='dateFormat' />}"
                          ,attributes:{ "style":"text-align:center"}
                       }
                     , {   //입고시간
                           title:"<spring:message code='par.lbl.grTime' />"
                          ,field:"grTime"
                          ,attributes:{ "style":"text-align:center"}
                          ,width:90
                       }
                     , {   //수령인
                           title:"<spring:message code='par.lbl.receiverNm' />"
                          ,field:"receiveUsrNm"
                          ,width:80
                       }
                     , {   //취소수량
                         title:"<spring:message code='par.lbl.cancQty' />"
                        ,field:"cancQty"
                        ,width:60
                        ,attributes:{ "style":"text-align:right"}
                        ,format:"{0:n2}"
                        ,decimal:2
                     }
                   , {   //취소일
                         title:"<spring:message code='par.lbl.cancDt' />"
                        ,field:"cancDt"
                        ,width:80
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                        ,attributes:{ "style":"text-align:center"}
                     }
                   , {   //취소시간
                         title:"<spring:message code='par.lbl.cancTime' />"
                        ,field:"cancTime"
                        ,attributes:{ "style":"text-align:center"}
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
                           field:"taxAmt"
                          ,title:"<spring:message code='par.lbl.vatAmt' />"
                          ,width:80
                          ,attributes:{ "class":"ar"}
                          ,format:"{0:n2}"
                          ,hidden:true
                     }//세금
                     ,{
                           field:"taxDdctAmt"
                          ,title:"<spring:message code='par.lbl.amtTax' />"
                          ,width:80
                          ,attributes:{ "class":"ar"}
                          ,format:"{0:n2}"
                          ,hidden:true
                     }//입고금액(세금미포함)
                 ]
             });

             // 창고
             changeStrgeCd = function(val){
                 var returnVal = "";
                 console.log('changeStrgeCd:',val);
                 if(!dms.string.isEmpty(val)){
                     if(!dms.string.isEmpty(strgeTpObj[val])){
                         returnVal = strgeTpObj[val];
                     }else{
                         returnVal = "";
                     }
                 }
                 console.log('returnVal:',returnVal);
                 return returnVal;
             };

            // 로케이션
             changeGrLocCd = function(strgeCd, locCd){
                 var returnVal = "";
                 if(!dms.string.isEmpty(locCd)){
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
            $("#grTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#grTotAmt").data("kendoExtNumericTextBox").enable(false);
            $("#itemQty").closest(".k-numerictextbox").addClass("form_readonly");
            $("#itemQty").data("kendoExtNumericTextBox").enable(false);

            $("#mvtTp").data("kendoExtDropDownList").enable(false);
            $("#mvtTp").data("kendoExtDropDownList").value("31");

            $("#bpCd").val(sessionDlrCd);
            $("#bpNm").val(sessionDlrNm);
            $("#bpTp").val("03");

            existItemChkObj = {};

            gCrud = "C";

            fnSetButton();


        }

        var venderSearchPopupWin;
        function selectCustSearchPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                , title:"<spring:message code='par.title.othDlrSearch' />"   // 타딜러 조회
                , content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    , data:{
                          "autoBind"   :false
                        , "type"       :null
                        , "bpTp"       :"05"
                        , "remark2"    :"02"
                        , "bpDstinCd"  :"N"
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                $("#bpCd").val(data[0].bpCd);
                                $("#bpNm").val(data[0].bpNm);
                                $("#bpTp").val(data[0].bpTp);
                            }

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }

        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"//공급업체조회
                ,width:840
                ,height:400
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":$("#bpCd").val()
                        ,"bpNm":$("#bpNm").val()
                        ,"bpTp":''
                        ,"callbackFunc":function(data){

                            existItemChkObj = {};

                            initPage();
                            $("#bpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                            $("#bpNm").val(data[0].bpNm);
                            $("#bpTp").val(data[0].bpTp);
                            $("#grid").data("kendoExtGrid").dataSource.data([]);

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }

       // 조달입고리스트 팝업 열기 함수.
        function selectReceiveEtcListPopupWindow(){

           /*
            if(dms.string.isEmpty($("#bpCd").val())){
                // 딜러를 선택하십시오
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                saveList = [];
                return false;
            }
           */

            receiveEtcListPopupWindow = dms.window.popup({
                windowId:"receiveEtcListPopupWindow"
                ,title:"<spring:message code='par.title.etcReceiveInfo' />"   // 기타입고정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                        ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                        //,"statCd"   :"02"
                        ,"bpCd"     :$("#bpCd").val()
                        ,"bpNm"     :$("#bpNm").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#etcGrDocNo").val(data[0].etcGrDocNo);
                                pEtcGrDocNo = data[0].etcGrDocNo;

                                //$("#btnCancel").data("kendoButton").enable(true);

                                selectEtcReceive(pEtcGrDocNo);
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
                , width:860
                , height:550
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectItemPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "bpCd":$("#bpCd").val()
                        , "bpNm":$("#bpNm").val()
                        , "bpTp":$("#bpTp").val()
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                itemList.push(data[i].itemCd);
                            }
                            fnSetLocCdObj(itemList);

                            for(var i = 0; i < dataLen; i = i + 1){
                                //내용

                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.qty            = 1;//;data[i].qty;
                                popItemData.prc            = data[i].purcPrc;//data[i].prc;
                                popItemData.amt            = data[i].purcPrc;//data[i].amt;
                                popItemData.strgeCd        = data[i].grStrgeCd;
                                popItemData.dcRate         = gVatCd;
                                popItemData.taxDdctPrc     = data[i].purcPrc / ( 1 + gVatCd );
                                popItemData.taxDdctAmt     = data[i].purcPrc / ( 1 + gVatCd );
                                popItemData.taxAmt         = data[i].purcPrc - (data[i].purcPrc / ( 1 + gVatCd ));
                                popItemData.locCd          = '';
                                popItemData.grReasonCd     = '';
                                popItemData.refDocNo       = '';
                                popItemData.refDocLineNo   = '';
                                popItemData.etcGrDocNo     = '';
                                popItemData.etcGrDocLineNo = null;


                                if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                    gridData.dataSource.add(popItemData);
                                }
                            }

                            gridData.select(gridData.tbody.find(">tr"));
                            itemByBpCdPopupWindow.close();

                            fnSetAmtInfo();
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
            $("#grTotAmt").data("kendoExtNumericTextBox").value(totalAmt);
        }

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

                $("#bpCd").val(sessionDlrCd);
                $("#bpNm").val(sessionDlrNm);
                $("#bpTp").val("03");

                gCrud = "U";

                fnSetButton(result.statCd);

            });
        }

        function fnSetButton(pType){
            if(pType === '01'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(true);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(false);
            }else if(pType === '02'){
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
            }else if(pType === '03'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
            }else{
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(true);
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
</script>
<!-- //script -->


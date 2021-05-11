<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

    <!-- 其他入库信息 -->
<div id="resizableContainer">
    <section class="group" id='screenSection'>
        <div class="header_area">
            <!-- <h1 class="title_basic">其他入库信息</h1> -->
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11948" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11947" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_print hidden" id="btnPrint" type="button"><spring:message code="par.btn.print" /><!--출력  --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11946" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.salePriceCreate" /><!-- 생성 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11945" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnCnfm"><spring:message code="par.btn.confirm" /><!-- 확정 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11944" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.grTp" /><!-- 입고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCd" /></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input id="bpCd" class="form_input form_required" />
                                <input type="hidden" id="bpTp" name="bpTp" />
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
                        <th scope="row"><spring:message code="par.lbl.obtGrDocNo" /><!-- 조달입고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGrDocNo" class="form_input" />
                                <a id="searchEtcGrDocNo"><!-- 검색 --></a>
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
                            <input id="grTotAmt" data-type="number" class="form_numeric" readonly/>
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
			<dms:access viewId="VIEW-D-11943" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s hidden   btn_s_min5" id="btndlrGiDocNo" ><spring:message         code="par.btn.dlrGiDocNo" /><!-- 딜러출고문서번호 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11942" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_add  btn_s_min5"  id="btnAddItem"><spring:message code="par.btn.add" /></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11941" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_del  btn_s_min5"  id="btnDelItem"><spring:message           code="par.btn.del" /></button>
			</dms:access>
            </div>
        </div>

         <div class="table_grid">
            <!-- 부품기타입고 그리드 -->
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

var etcGrDocNoParam = "${etcGrDocNoParam}";//대기리스트에서 링크이동시 가져온 기타입고번호

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
       // gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);

    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if("63" === "${obj.cmmCd}"){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
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

           //총계
            $("#grTotAmt").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });
            //총수량
            $("#itemCnt").kendoExtNumericTextBox({
                format:"n0"
               ,spinners:false
            });
            //총품목수
            $("#itemQty").kendoExtNumericTextBox({
                format:"n0"
               ,spinners:false
            });

            // 초기화 버튼
            $("#btnInit").kendoButton({
                click:function(e){
                    etcGrDocNoParam = "";
                    pEtcGrDocNo = '';
                    gCrud       = "C";
                    initPage();
                }
            });

            // 딜러출고문서번호
            $("#btndlrGiDocNo").kendoButton({
                click:function(e){

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 딜러를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                        saveList = [];
                        return false;
                    }
                    selectIssueEtcFundsPopupWindow();
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
                                    delete existItemChkObj[l_rowData.itemCd];

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

           // 저장 버튼(등록)
            $("#btnSave").kendoButton({
                click:function(e){

                    var saveList = [],
                        grid = $("#grid").data("kendoExtGrid"),
                        rows = grid.tbody.find("tr"),
                        mvtType = $("#mvtTp").data("kendoExtDropDownList").value(),
                        lCrud = '',
                        paramUrl = '',
                        chkDlrCnt = 0,
                        header;

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 딜러를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                        saveList = [];
                        return false;
                    }else{
                        var chkDlrCd = {};

                        chkDlrCd.sBpTp = "05";
                        chkDlrCd.sBpCd = $("#bpCd").val();

                        $.ajax({
                            url:"<c:url value='/par/pmm/venderMaster/selectAllVenderMasters.do' />"
                            ,data:kendo.stringify(chkDlrCd)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {
                                chkDlrCnt = result.total;
                            },error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                        });
                    }

                    if(chkDlrCnt === 0 || chkDlrCnt > 1){   //BP_CD 가 like 검색이기 때문에 필요!
                        dms.notification.warning("<spring:message code='global.lbl.dlrCd' var='dlrCd' /><spring:message code='global.info.confirmMsgParam' arguments='${dlrCd}'/>");
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
                                        dms.notification.success("<spring:message code='par.lbl.saveSuccMsg'/>");

                                        pEtcGrDocNo = result.etcGrDocNo;
                                        $('#etcGrDocNo').val(result.etcGrDocNo);
                                        fnSetButton('01');

                                        // 부품기타출고 조회.
                                        selectEtcReceive(pEtcGrDocNo);


                                    } else {
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.receiveEtcFunds' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
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
                                       dms.notification.success("<spring:message code='par.lbl.saveSuccMsg'/>");

                                       pEtcGrDocNo = $('#etcGrDocNo').val();
                                       $('#etcGrDocNo').val(pEtcGrDocNo);

                                       $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                       fnSetButton('01');

                                       // 부품기타입고 조회.
                                       selectEtcReceive(pEtcGrDocNo);

                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.receiveEtcFunds' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
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
                        chkCalcAmt,
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

                            if(dms.string.isEmpty(gridData.grReasonCd)){
                                // 입고 사유를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.grReasonCd' var='grReasonCd' /><spring:message code='par.info.issueCheckMsg' arguments='${grReasonCd}'/>");
                                saveList = [];
                                return false;
                            }

                            chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.qty) * 100)/100;

                            if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0 ){
                                // 금액을 확인해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
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
                                   dms.notification.success("<spring:message code='par.lbl.receiveEtcFunds' var='receiveEtcFunds' /><spring:message code='global.info.cnfmSuccessParam' arguments='${receiveEtcFunds}'/>");

                                   pEtcGrDocNo = $('#etcGrDocNo').val();
                                   fnSetButton('02');

                                   // 부품기타입고 조회.
                                   selectEtcReceive(pEtcGrDocNo);

                               } else {
                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.receiveEtcFunds' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
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
                                   dms.notification.success("<spring:message code='par.lbl.receiveEtcFunds' var='etcGrDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${etcGrDocNo}'/>");

                                   fnSetButton('03');

                                   selectEtcReceive($("#etcGrDocNo").val());

                               } else {
                                   if(result === 0){
                                       dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.delFailedParam' arguments='${etcGiDocNo}'/>");
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

            $("#searchCustCd").on('click', selectCustSearchPopupWindow);
            $("#searchCustNm").on('click', selectCustSearchPopupWindow);
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
                     options.model.set("amt",         Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100);
                     options.model.set("taxAmt",     (Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) - ((Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100)  / ( 1 + gVatCd )));
                     options.model.set("taxDdctAmt", (Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100)  / ( 1 + gVatCd ));
                     options.model.set("taxDdctPrc",  options.model.prc / ( 1 + gVatCd ));
                     //options.model.set("taxAmt",     (Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) *  gVatCd);
                     //options.model.set("taxDdctAmt", (Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) - ((Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) *  gVatCd));
                     //options.model.set("taxDdctPrc",  options.model.prc - (options.model.prc *  gVatCd));
                     options.model.set("dcRate",      gVatCd);

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
                        //options.model.set('locCd','');
                        if(!dms.string.isEmpty(locationListObj[options.model.itemCd])){
                            if(!dms.string.isEmpty(locationListObj[options.model.itemCd][options.model.strgeCd])){
                                options.model.set('locCd',locationListObj[options.model.itemCd][options.model.strgeCd][0].cmmCd);
                            }else{
                                options.model.set('locCd','');
                            }
                        }else{
                            options.model.set('locCd','');
                        }
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
                 gridId:"G-PAR-0808-161197"
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
                                  existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;
                              }

                              locationListObj = {};
                              $("#btndlrGiDocNo").data("kendoButton").enable(false);

                              return result.data;
                          }
                         ,total:"total"
                         ,model:{
                            id:"etcGrDocNo"
                           ,fields:{
                                   etcGrDocNo      :{ type:"string", editable:false }
                                 , etcGrDocLineNo  :{ type:"number", editable:false }
                                 , itemCd          :{ type:"string", editable:false }
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
                                 , receiveId       :{ type:"string", editable:false  }
                                 , grDt            :{ type:"date"  , editable:false  }
                                 , grTime          :{ type:"string", editable:false  }
                                 , cancQty         :{ type:"number" , editable:false }
                                 , cancDt          :{ type:"date"   , editable:false }
                                 , cancTime        :{ type:"string" , editable:false }
                                 , cancId          :{ type:"string" , editable:false }
                                 , cancUsrNm       :{ type:"string" , editable:false }
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

                     if(fieldName === "itemNm"||fieldName === "amt"||fieldName === "locCd"){
                         this.closeCell();
                     }else if(fieldName === "qty"||fieldName === "prc"||fieldName === "strgeCd"||fieldName === "grReasonCd"){
                         //입고등록 만 수정.
                         if(selectedItem.grStatCd === '02'){
                             this.closeCell();
                         }else if((fieldName === "qty"||fieldName === "prc")&&etcGrDocNoParam !=""){            //외부조달일 때, 수량,단가 수정불가
                             this.closeCell();
                         }
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
                        {   //조달입고현황번호
                           title:"<spring:message code='par.lbl.obtGrDocNo' />"
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
                          ,attributes:{ "class":"ar"}
                          ,editor:changeAmtEditor
                          ,format:"{0:n2}"
                          ,decimal:2
                       }
                     , {   //단가
                           title:"<spring:message code='par.lbl.prc' />"
                          ,field:"prc"
                          ,width:80
                          ,attributes:{ "class":"ar"}
                          ,editor:changeAmtEditor
                          ,format:"{0:n2}"
                          ,decimals:2
                       }
                     , {   //입고창고
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
                          ,hidden:true
                       }
                     , {   //금액
                           title:"<spring:message code='par.lbl.amt' />"
                          ,field:"amt"
                          ,width:90
                          ,attributes:{ "class":"ar"}
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
                       }
                     , {   //입고일
                           title:"<spring:message code='global.lbl.grDt' />"
                          ,field:"grDt"
                          ,width:90
                          ,format:"{0:<dms:configValue code='dateFormat' />}"
                          ,attributes:{ "class":"ac"}
                       }
                     , {   //입고시간
                           title:"<spring:message code='par.lbl.grTime' />"
                          ,field:"grTime"
                          ,attributes:{ "class":"ac"}
                          ,width:90
                       }
                     , {   //수령인
                           title:"<spring:message code='par.lbl.receivePrsnNm' />"
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
                     ,{
                           field:"grStatCd"
                          ,title:"<spring:message code='par.lbl.grStatCd' />"
                          ,width:80
                          ,attributes:{ "class":"ac"}
                          ,hidden:true
                     }//부품입고상태
                 ]
             });

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
             settingDataByLinking();//조달입고대기리스트 관련
        });

        function initPage(){
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
            $("#mvtTp").data("kendoExtDropDownList").value("63");

            $("#btndlrGiDocNo").data("kendoButton").enable(true);

            $("#bpCd").attr("disabled",false);
            $("#bpNm").attr("disabled",false);
            $("#etcGrDocNo").attr("disabled",false);
            $("#remark").attr("disabled",false);

            $("#searchCustCd").css("pointer-events","all");
            $("#searchCustNm").css("pointer-events","all");
            $("#searchEtcGrDocNo").css("pointer-events","all");

            $(".form_search").removeClass("readonly_area");
            existItemChkObj = {};

            gCrud = "C";

            fnSetButton();
        }

      //'조달입고대기리스트'에서 링크로 이동했을 경우 데이터셋팅
        function settingDataByLinking(){
            if(etcGrDocNoParam !=""){
                $("#bpCd").attr("disabled",true);
                $("#bpNm").attr("disabled",true);
                $("#etcGrDocNo").attr("disabled",true);
                $("#remark").attr("disabled",true);

                $("#searchCustCd").css("pointer-events","none");
                $("#searchCustNm").css("pointer-events","none");
                $("#searchEtcGrDocNo").css("pointer-events","none");

                $(".form_search").addClass("readonly_area");
                selectEtcReceive(etcGrDocNoParam);
            }
        }

        var venderSearchPopupWin;
        function selectCustSearchPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code='par.title.dlrSearch' />"//딜러조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"type":null
                        ,"bpCd":$("#bpCd").val()
                        ,"bpNm":$("#bpNm").val()
                        ,"bpTp":"05"/* 거래처유형 05:딜러 */
                        ,"remark2":"02"
                        ,"bpDstinCd":"N"
                        ,"callbackFunc":function(data){
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

        //조달입고리스트 팝업 열기 함수.
        function selectReceiveEtcListPopupWindow(){

            receiveEtcListPopupWindow = dms.window.popup({
                windowId:"ReceiveEtcFundsListPopup"
                ,title:"<spring:message code='par.title.obtGrDocNo' />"//조달입고번호
                ,width:805
                ,height:385
                ,content:{
                    url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"mvtTp":$("#mvtTp").data("kendoExtDropDownList").value()
                        ,"mvtTpNm":$("#mvtTp").data("kendoExtDropDownList").text()
                        ,"bpCd":''//$("#bpCd").val()
                        ,"bpNm":''//$("#bpNm").val()
                        ,"etcGrDocNo":$("#etcGrDocNo").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0){
                                etcGrDocNoParam ="";
                                $("#etcGrDocNo").val(data[0].etcGrDocNo);
                                pEtcGrDocNo = data[0].etcGrDocNo;
                                if(data[0].regUsrId=="SYSTEM"){
                                    etcGrDocNoParam = data[0].etcGrDocNo;
                                    settingDataByLinking();
                                }else{
                                    selectEtcReceive(pEtcGrDocNo);
                                }
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
                        , "bpTp":"" //조달출고 업체유형 없음.
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                //내용

                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.qty            = 1;
                                popItemData.prc            = data[i].purcPrc;
                                popItemData.amt            = data[i].purcPrc;
                                popItemData.strgeCd        = data[i].grStrgeCd;
                                popItemData.dcRate         = gVatCd;
                                popItemData.taxDdctPrc     = data[i].purcPrc / ( 1 + gVatCd );
                                popItemData.taxDdctAmt     = data[i].purcPrc / ( 1 + gVatCd );
                                popItemData.taxAmt         = data[i].purcPrc - (data[i].purcPrc / ( 1 + gVatCd ));
                                popItemData.grReasonCd     = '';
                                popItemData.refDocNo       = '';
                                popItemData.refDocLineNo   = '';
                                popItemData.etcGrDocNo     = '';
                                popItemData.etcGrDocLineNo = null;
                                popItemData.locCd          = data[i].grLocCd;

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

       // 딜러출고 팝업 열기 함수.
        function selectIssueEtcFundsPopupWindow(){

            issueEtcFundListPopupWindow = dms.window.popup({
                windowId:"IssueEtcFundListPopup"
                ,title:"<spring:message code='par.title.etcIssueInfo' />"   // 기타출고정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectIssueEtcFundListPopup.do'/>"
                    ,data:{

                        "type":""
                        ,"autoBind":false
                        ,"bpCd"     :$("#bpCd").val()
                        ,"bpNm"     :$("#bpNm").val()
                        , "selectable"  :"multiple"
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    popItemData  = {},
                                    itemList     = [];

                                for(var i = 0; i < dataLen; i = i + 1){

                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.qty            = data[i].qty;
                                    popItemData.prc            = data[i].prc;
                                    popItemData.amt            = data[i].amt;
                                    popItemData.strgeCd        = data[i].grStrgeCd;
                                    popItemData.locCd          = data[i].grLocCd;
                                    popItemData.grReasonCd     = '';
                                    popItemData.refDocNo       = data[i].etcGiDocNo;
                                    popItemData.refDocLineNo   = data[i].etcGiDocLineNo;
                                    popItemData.etcGrDocNo     = '';
                                    popItemData.etcGrDocLineNo = null;

                                    existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                    gridData.dataSource.add(popItemData);
                                }
                                gridData.select(gridData.tbody.find(">tr"));
                            }
                            issueEtcFundListPopupWindow.close();
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
            }else if(pType === '02'){
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
            }else if(pType === '03'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
            }else{
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfm").data("kendoButton").enable(false);
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
            }

            if(etcGrDocNoParam !=""){
                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
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


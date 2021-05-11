<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 구매오더 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.purcOrdInfo" /> --%><!-- 구매오더 정보 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_save" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
                <button class="btn_m btn_save" id="btnSend"><spring:message code="par.btn.transmission" /></button><!--전송  -->
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /></button><!--취소  -->
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:22%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></span></th>
                        <td class="required_area">
                            <input id="purcOrdTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.trsfTp" /><!-- 운송유형 --></span></th>
                        <td class="required_area">
                            <input id="trsfTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="purcOrdNo" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="bpCd" class="form_input hidden form_readonly" readonly>
                            <input id="bpNm" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcRegDt" /><!-- 구매등록일 --></th>
                        <td class="readonly_area">
                            <input id="purcRegDt" type="text" value="" class="form_datepicker" data-type="date" readonly>
                            <input id="totPurcAmt" type="text" class="hidden" style="width:50%">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="purcOrdStatCd" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.advanceReceived" /><!-- 선수금 --></th>
                        <td class="readonly_area">
                            <input id="advanceReceived" class="form_numeric" readonly />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add"  id="btnAddItem"><spring:message       code="par.btn.itemPop" /></button>
                <button class="btn_s btn_add"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
                <button class="btn_s btn_file" id="btnExcelUpload"><spring:message   code="par.btn.uploadExcel" /></button>
                <button class="btn_s btn_add"  id="btnCopyPurcOrd"><spring:message   code="par.btn.copyPurcOrd" /></button>
                <button class="btn_s btn_add"  id="btnAddPurcReq"><spring:message    code="par.btn.addPurcReq" /></button>
                <button class="btn_s btn_add"  id="btnRecommOrd"><spring:message     code="par.btn.recommOrd" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div>
            <!-- 구매오더 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            pPurcOrdNo          = "${pPurcOrdNo}",
            gCrud               = "C",
            purcOrdTpList       = [],
            trsfTpList          = [],
            purcOrdStatList     = [],
            purcOrdStatObj      = {},
            purcUnitList        = [],
            purcUnitObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            grStrgeTpList       = [],
            grStrgeTpObj        = {},
            purcItemTpList      = [],
            purcItemTpObj       = {},
            popItemObj          = {},
            checkdIds           = {},
            partsInfoExcelUploadPopupWin,
            itemByBpCdPopupWindow,
            prevPurcOrdPopupWindow,
            purcReqPopupWindow,
            purcCostSgstPopupWindow,
            searchTrsfTp,
            transObj;


        //trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
            trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        purcItemTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${purcItemTpList}" varStatus="status">
            purcItemTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            purcItemTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        prcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        //purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
            purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>



        <c:forEach var="obj" items="${purcUnit}" varStatus="status">
            purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        grStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

    $(document).ready(function() {

        //오더유형선택
        $("#purcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //운송선택
        $("#trsfTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:trsfTpList
            ,index:0
        });

        //구매오더상태선택
        $("#purcOrdStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,index:0
        });

        //선수금
        $("#advanceReceived").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pPurcOrdNo = ''; //구매등록 관리 화면에서 넘어온 구매번호 삭제.
                gCrud      = "C";
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    reqStrMesg    = "<spring:message code='global.info.required.field' />",
                    selectStrMesg = "<spring:message code='global.info.chkSelectItemMsg' />",
                    lCrud         = '',
                    paramUrl      = '',
                    header;

                header = {
                        purcOrdTp       :$("#purcOrdTp").data("kendoExtDropDownList").value()
                      , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                      , bpCd            :$("#bpCd").val()
                      , purcOrdNo       :$("#purcOrdNo").val()
                      , purcOrdStatCd   :$("#purcOrdStatCd").data("kendoExtDropDownList").value()
                      , bpCd            :$("#bpCd").val()
                      , totPurcAmt      :$("#totPurcAmt").val()
                      , remark          :""
                };

                if(dms.string.isEmpty($("#purcOrdTp").data("kendoExtDropDownList").value())){
                    //구매오더 유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='global.info.required.field' arguments='${purcOrdTp}'/>");
                    return false;
                }
                if(dms.string.isEmpty($("#trsfTp").data("kendoExtDropDownList").value())){
                    //운송유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.trsfTp' var='trsfTp' /><spring:message code='global.info.required.field' arguments='${trsfTp}'/>");
                    return false;
                }
                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(gCrud === "C"){
                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(!dms.string.isEmpty(gridData.itemCd)){

                            if(dms.string.isEmpty(gridData.purcQty) || gridData.purcQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.purcPrc) || gridData.purcPrc == 0){
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


                            if(dms.string.isEmpty(gridData.purcReqDt)){
                                // 납기일를 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.periodDeliveryDt' var='periodDeliveryDt' /><spring:message code='global.info.confirmMsgParam' arguments='${periodDeliveryDt}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                               "purcOrdVO":header
                              ,"purcOrdItemList":saveList
                            };

                        $.ajax({
                             url:"<c:url value='/par/pcm/purcOrd/insertPurcOrd.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                if (result.resultYn == true) {
                                    dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.regSuccessParam' arguments='${purcOrd}'/>");

                                    pPurcOrdNo = result.purcOrdNo;
                                    // 구매오더 조회.
                                    selectPurcOrd(pPurcOrdNo);

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.regFailedParam' arguments='${purcOrd}'/>");
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


                    /******************************************************
                                            행추가 된 경우 부품번호가 없으면 빈라인이라 판단 저장에서 제외한다.
                    *******************************************************/
                    for(var i = insertListLeng-1; i >= 0; i = i - 1){
                        if(dms.string.isEmpty(saveData.insertList[i].itemCd)){
                            saveData.insertList.splice(i,1);
                        }
                    }

                    saveData.purcOrdVO = header;

                    if (grid.cudDataLength == 0) {

                        if(searchTrsfTp === $("#trsfTp").data("kendoExtDropDownList").value()){
                          //변경된 정보가 없습니다.
                            dms.notification.info("<spring:message code='global.info.required.change'/>");
                            return;
                        //헤더만 변경된 경우(운송유형)
                        }else{


                            $.ajax({
                                url:"<c:url value='/par/pcm/purcOrd/updatePurcOrd.do' />"
                               ,data:kendo.stringify(header)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {
                                   if (result === 1) {
                                       dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.modifySuccessParam' arguments='${purcOrd}'/>");

                                       // 구매오더 조회.
                                       selectPurcOrd(pPurcOrdNo);

                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.modifyFailedParam' arguments='${purcOrd}'/>");
                                       }
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }

                           });
                        }
                    }else{
                        if (grid.gridValidation()) {

                            $.ajax({
                                url:"<c:url value='/par/pcm/purcOrd/multiPurcOrds.do' />"
                               ,data:kendo.stringify(saveData)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   if (result === true) {
                                       dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.modifySuccessParam' arguments='${purcOrd}'/>");

                                       // 구매오더 조회.
                                       selectPurcOrd(pPurcOrdNo);

                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.modifyFailedParam' arguments='${purcOrd}'/>");
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

        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){

                var saveList        = [],
                    lCrud           = '',
                    paramUrl        = '',
                    header;




                if(dms.string.isEmpty($("#purcOrdNo").val())){
                    //구매번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.emptyParamInfo' arguments='${purcOrdNo}'/>");
                    return false;
                }
                if(dms.string.isEmpty($("#purcOrdStatCd").data("kendoExtDropDownList").value())){
                    //구매오더 상태 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcItemStatCd' var='purcItemStatCd' /><spring:message code='global.info.emptyParamInfo' arguments='${purcItemStatCd}'/>");
                    return false;
                }

                header = {
                          purcOrdTp       :$("#purcOrdTp").data("kendoExtDropDownList").value()
                        , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                        , bpCd            :$("#bpCd").val()
                        , purcOrdNo       :$("#purcOrdNo").val()
                        , purcOrdStatCd   :'05'
                        , bpCd            :$("#bpCd").val()
                        , remark          :""
                };


                $.ajax({
                     url:"<c:url value='/par/pcm/purcOrd/cancelPurcOrd.do' />"
                    ,data:kendo.stringify(header)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {

                        if (result === 1) {

                            //취소 완료 되었습니다.
                            dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.cancelSuccessParam' arguments='${purcOrd}'/>");

                            selectPurcOrd(pPurcOrdNo);

                        } else {
                            if(result === 0){
                                //취소 실패하였습니다.
                                dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.cancelFailedParam' arguments='${purcOrd}'/>");
                            }
                        }
                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                });
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

        // 구매오더 복사 버튼
        $("#btnCopyPurcOrd").kendoButton({
            click:function(e){
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPrevPurcOrdPopupWindow();
            }
        });

        // 구매요청 추가 버튼
        $("#btnAddPurcReq").kendoButton({
            click:function(e){
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPurcReqPopupWindow();
            }
        });

        // 추천오더 버튼
        $("#btnRecommOrd").kendoButton({
            click:function(e){

                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPurcCostSgstPopupWindow();

                /*
                $.ajax({
                    url:"<c:url value='/par/pcm/purcCost/selectSgstPurcOrds.do' />",
                    data:JSON.stringify({ sBpCd:$("#bpCd").val()}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {

                    var dataLen      = result.data.length,
                        gridData     = $("#grid").data("kendoExtGrid"),
                        popPrevData  = {},
                        tDate;

                    for(var i = 0; i < dataLen; i = i + 1){
                        tDate = new Date();
                        if(dms.string.isEmpty(result.data[i].purcLeadHm)){
                            result.data[i].purcLeadHm = 0;
                        }

                        tDate.setDate(tDate.getDate() + Number(result.data[i].purcLeadHm));

                        popPrevData.dlrCd          = result.data[i].dlrCd;
                        popPrevData.purcItemTp     = "02";
                        popPrevData.purcItemStatCd = "01";
                        popPrevData.grStrgeCd      = result.data[i].grStrgeCd;
                        popPrevData.itemCd         = result.data[i].itemCd;
                        popPrevData.itemNm         = result.data[i].itemNm;
                        popPrevData.purcUnitCd     = result.data[i].unitCd;
                        popPrevData.purcQty        = result.data[i].purcSgstQty;
                        popPrevData.purcReqQty     = 0;
                        popPrevData.purcPrc        = result.data[i].purcPrc;
                        popPrevData.purcAmt        = result.data[i].purcSgstQty * result.data[i].purcPrc;
                        popPrevData.prcTp          = '01';
                        popPrevData.delYn          = "N";
                        popPrevData.grEndYn        = "N";
                        popPrevData.purcReqDt      = tDate;

                        if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                            //이미 등록되어있는 부품입니다.
                            var itemInfo = result.data[i].itemCd + '[' + result.data[i].itemNm + ']';
                            dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                        }else{
                            popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                            gridData.dataSource.add(popPrevData);
                        }
                    }

                });
                */
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "dlrCd"         :''
                    ,"purcItemTp"    :'03'
                    ,"purcItemStatCd":'01'
                    ,"grStrgeCd"     :''
                    ,"itemCd"        :''
                    ,"itemNm"        :''
                    ,"purcUnitCd"    :''
                    ,"purcQty"       :0
                    ,"purcReqQty"    :0
                    ,"purcPrc"       :0
                    ,"purcAmt"       :0
                    ,"prcTp"         :'01'
                    ,"delYn"         :'N'
                    ,"grEndYn"       :'N'
                    ,"purcReqDt"     :''
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
                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {
                partsInfoExcelUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='par.title.purcOrdExcelUpload' />"
                    ,windowId:"partsInfoExcelUploadPopupWin"
                    ,content:{
                        url:"<c:url value='/par/pcm/cmm/selectPartsInfoExcelUploadPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(data){
                                //$('#grid').data('kendoExtGrid').dataSource.read();

                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    popItemData  = {},
                                    tDate;

                                for(var i = 0; i < dataLen; i = i + 1){

                                    tDate = new Date();
                                    if(dms.string.isEmpty(data[i].purcLeadHm)){
                                        data[i].purcLeadHm = 0;
                                    }


                                    tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));
                                    popItemData.dlrCd          = data[i].dlrCd;
                                    popItemData.purcItemTp     = "03";
                                    popItemData.purcItemStatCd = "01";
                                    popItemData.grStrgeCd      = data[i].grStrgeCd;
                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.purcUnitCd     = data[i].purcUnitCd;
                                    popItemData.purcQty        = data[i].purcQty;
                                    popItemData.purcReqQty     = 0;
                                    popItemData.purcPrc        = data[i].purcPrc;
                                    popItemData.purcAmt        = data[i].purcAmt;
                                    popItemData.prcTp          = "01";  //구매가
                                    popItemData.delYn          = "N";
                                    popItemData.grEndYn        = "N";
                                    popItemData.purcReqDt      = tDate;

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


                                partsInfoExcelUploadPopupWin.close();

                            }
                        }
                    }
                });
            }
        });

        // 전송 버튼
        $("#btnSend").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    saveData      = grid.getCUDData("insertList", "updateList", "deleteList"),
                    lCrud         = '',
                    paramUrl      = '',
                    header;

                if(dms.string.isEmpty($("#purcOrdNo").val())){
                    //구매번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.emptyParamInfo' arguments='${purcOrdNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#purcOrdStatCd").data("kendoExtDropDownList").value())){
                    //구매오더 상태 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcItemStatCd' var='purcItemStatCd' /><spring:message code='global.info.emptyParamInfo' arguments='${purcItemStatCd}'/>");
                    return false;
                }

                if($("#purcOrdStatCd").data("kendoExtDropDownList").value() !== '01'){
                    //등록 상태에서만 전송가능합니다.
                    dms.notification.warning("<spring:message code='par.info.sendStatMsg' />");
                    return false;
                }

                if(saveData.insertList.length > 0){
                    //등록라인 전송 실패하였습니다.
                    dms.notification.error("<spring:message code='par.lbl.insertItem' var='insertItem' /><spring:message code='global.err.sendFailedParam' arguments='${insertItem}'/>");
                    return false;
                }
                if(saveData.updateList.length > 0){
                    //수정라인 전송 실패하였습니다.
                    dms.notification.error("<spring:message code='par.lbl.modifyItem' var='modifyItem' /><spring:message code='global.err.sendFailedParam' arguments='${modifyItem}'/>");
                    return false;
                }
                if(saveData.deleteList.length > 0){
                    //삭제라인 전송 실패하였습니다.
                    dms.notification.error("<spring:message code='par.lbl.delItem' var='delItem' /><spring:message code='global.err.sendFailedParam' arguments='${delItem}'/>");
                    return false;
                }

                header = {
                          purcOrdTp       :$("#purcOrdTp").data("kendoExtDropDownList").value()
                        , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                        , bpCd            :$("#bpCd").val()
                        , purcOrdNo       :$("#purcOrdNo").val()
                        , purcOrdStatCd   :'02'
                        , bpCd            :$("#bpCd").val()
                        , remark          :""
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data ={
                           "purcOrdVO":header
                          ,"purcOrdItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/pcm/purcOrd/sendPurcOrd.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === 1) {

                               //전송 완료 되었습니다.
                               dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.sendSuccessParam' arguments='${purcOrd}'/>");
                               selectPurcOrd(pPurcOrdNo);

                           } else {
                               if(result === 0){
                                   //전송 실패하였습니다.
                                   dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.sendFailedParam' arguments='${purcOrd}'/>");
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



        // 구매등록일자
        $("#purcRegDt").kendoDatePicker({
            format:"<dms:configValue code='dateFormat' />"
        });


        $("#purcOrdStatCd").data("kendoExtDropDownList").enable(false);

        /**
         * grid 구매단가&구매수량
         */
         changePurcAmtEditor = function(container, options) {
             var input = $("<input/>"),
                 pValue;

             input.attr("name", options.field);

             input.keyup(function(){
                 if(options.field === 'purcQty'){
                     pValue = Math.floor( $(this).val());
                     options.model.set("purcAmt", options.model.purcPrc * pValue);
                 }else if(options.field === 'purcPrc'){
                     pValue =  Number($(this).val()).toFixed(2);
                     options.model.set("purcAmt", options.model.purcQty * pValue);
                 }

             });

             input.blur(function(){
                var resultGrid = $("#grid").data("kendoExtGrid"),
                    rows       = resultGrid.tbody.find("tr"),
                    totalAmt   = 0,
                    gridData;

                if(!dms.string.isEmpty(pValue)){
                    if(options.field === 'purcQty'){
                        options.model.set("purcQty", pValue);
                    }else if(options.field === 'purcPrc'){
                        options.model.set("purcPrc", pValue);
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
         * grid 입고창고 DropDownList
         */
         grStrgeCdDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  grStrgeTpList
             });
         };

        // 구매등록 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 구매오더 검색조건 코드.
                            params["sPurcOrdNo"] = $("#purcOrdNo").val();

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
                       id:"purcOrdNo"
                      ,fields:{
                              dlrCd          :{ type:"string" , validation:{required:true} }
                            , purcOrdNo      :{ type:"string" }
                            , purcOrdLineNo  :{ type:"number" }
                            , purcItemStatCd :{ type:"string" }
                            , purcItemTp     :{ type:"string"}
                            , itemCd         :{ type:"string"}
                            , itemNm         :{ type:"string"}
                            , purcUnitCd     :{ type:"string"}
                            , purcQty        :{ type:"number" }
                            , purcReqQty     :{ type:"number" }
                            , prcTp          :{ type:"string"}
                            , purcPrc        :{ type:"number" }
                            , purcAmt        :{ type:"number"}
                            , purcReqNo      :{ type:"string"}
                            , purcReqLineNo  :{ type:"string"}
                            , grStrgeCd      :{ type:"string" }
                            , purcReqDt      :{ type:"date"   }
                            , delYn          :{ type:"string"}
                            , grEndYn        :{ type:"string"}
                            , purcReqRegUsrId:{ type:"string"}
                            , regUsrId       :{ type:"string"}
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , multiSelectWithCheckbox:true
            , pageable:false
            , edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    pVal,
                    orgVal,
                    tDate,
                    fieldName = grid.columns[e.container.index()].field;



                if(fieldName === "purcAmt"||fieldName === "purcItemStatCd"||fieldName === "purcItemTp"||fieldName === "itemNm"||fieldName === "purcUnitCd"||fieldName === "purcReqRegUsrId"){
                     this.closeCell();
                }else if(fieldName === "itemCd"){
                    pVal = input.val();
                    orgVal = input.val();

                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){

                        if(orgVal !== pVal){

                            if(popItemObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                e.model.set('itemCd', orgVal);

                                return false;
                            }

                            if((!dms.string.isEmpty(orgVal))&&(!dms.string.isEmpty(selectedItem.purcOrdNo))){
                                dms.notification.warning("<spring:message code='par.err.purcOrdItemNoUpdateMsg'/>");
                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sBpCd:sessionBpCd})
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   if (result.total === 1) {

                                       tDate = new Date();

                                       if(dms.string.isEmpty(result.data[0].purcLeadHm)){
                                           result.data[0].purcLeadHm = 0;
                                       }

                                       tDate.setDate(tDate.getDate() + Number(result.data[0].purcLeadHm));

                                       if(dms.string.isEmpty($("#purcOrdNo").val())){
                                           e.model.set('purcOrdNo', '');
                                       }else{
                                           e.model.set('purcOrdNo', $("#purcOrdNo").val());
                                       }

                                       e.model.set('purcOrdLineNo', 0);
                                       e.model.set('dlrCd', result.data[0].dlrCd);
                                       e.model.set('purcItemStatCd', '01');
                                       e.model.set('purcItemTp', '03');
                                       e.model.set('itemCd', result.data[0].itemCd);
                                       e.model.set('itemNm', result.data[0].itemNm);
                                       e.model.set('purcUnitCd', result.data[0].stockUnitCd);
                                       e.model.set('purcQty', 1);
                                       e.model.set('purcReqQty', 0);
                                       e.model.set('purcPrc', result.data[0].purcPrc);
                                       e.model.set('purcAmt', result.data[0].purcPrc);
                                       e.model.set('prcTp', result.data[0].prcTp);
                                       e.model.set('purcReqNo', '');
                                       e.model.set('purcReqLineNo', 0);
                                       e.model.set('purcReqRegUsrId', '');
                                       e.model.set('purcReqDt', tDate);
                                       e.model.set('grStrgeCd', result.data[0].grStrgeCd);
                                       e.model.set('delYn', 'N');
                                       e.model.set('grEndYn', 'N');

                                       delete popItemObj[orgVal];

                                       popItemObj[pVal] = pVal;

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
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //구매오더번호
                      title:"<spring:message code='par.lbl.purcOrdNo' />"
                     ,field:"purcOrdNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcOrdLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //상태
                      title:"<spring:message code='par.lbl.purcStat' />"
                     ,field:"purcItemStatCd"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,template:'#= changePurcOrdStat(purcItemStatCd)#'
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
                , {   //구매수량
                      title:"<spring:message code='par.lbl.purcQty' />"
                     ,field:"purcQty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,editor:changePurcAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //구매요청수량
                      title:"<spring:message code='par.lbl.purcReqQty' />"
                     ,field:"purcReqQty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"purcUnitCd"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,template:'#= changePurcUnit(purcUnitCd)#'
                  }
                , {   //단가유형
                      title:"<spring:message code='par.lbl.prcTp' />"
                     ,field:"prcTp"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,template:'#= changePrcTp(prcTp)#'
                     ,hidden:true
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"purcPrc"
                     ,width:120
                     ,attributes:{ "class":"ar"}
                     ,editor:changePurcAmtEditor
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"purcAmt"
                     ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //납기일
                      title:"<spring:message code='par.lbl.periodDeliveryReqDt' />"
                     ,field:"purcReqDt"
                     ,width:100
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"grStrgeCd"
                     ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     ,template:'#= changeGrStrgeCd(grStrgeCd)#'
                  }
                , {   //생성유형
                      title:"<spring:message code='par.lbl.purcItemTp' />"
                     ,field:"purcItemTp"
                     ,width:100
                     ,template:'#= changePurcItemTp(purcItemTp)#'
                  }
                , {   //구매요청자ID
                      title:"<spring:message code='par.lbl.purcReqUsrId' />"
                     ,field:"purcReqRegUsrId"
                     ,width:120
                  }
                , {   //구매요청번호
                      title:"<spring:message code='par.lbl.refDocNo' />"
                     ,field:"purcReqNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcReqLineNo"
                     ,width:60
                     ,hidden:true
                  }
                , {   //삭제여부
                      title:"<spring:message code='par.lbl.delYn' />"
                     ,field:"delYn"
                     ,width:60
                     ,hidden:true
                  }
                , {   //입고완료여부
                      title:"<spring:message code='par.lbl.grEndYn' />"
                     ,field:"grEndYn"
                     ,width:60
                     ,hidden:true
                  }
                , {   //등록자ID
                    title:"<spring:message code='par.lbl.regUsrId' />"
                   ,field:"regUsrId"
                   ,width:120
                   ,hidden:true
                }
                , { field:"" }
            ]
        });

         // 입고 창고
         changeGrStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = grStrgeTpObj[val];
             }
             return returnVal;
         };

         // 생성유형
         changePurcItemTp = function(val){

             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcItemTpObj[val];
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

         // 구매단위
         changePurcUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcUnitObj[val];
             }
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

        // 구매 정보 조회.
        function selectPurcOrd(pPurcOrdNo){

            $.ajax({
                url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />",
                data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                    var ordStatCd;

                    partsJs.validate.groupObjAllDataSet(result);
                    ordStatCd = $("#purcOrdStatCd").data("kendoExtDropDownList").value();
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                    searchTrsfTp =  $("#trsfTp").data("kendoExtDropDownList").value();
                    gCrud = "U";
                    btnView(ordStatCd);
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
                    popPrevData  = {},
                    tDate;

                for(var i = 0; i < dataLen; i = i + 1){
                    tDate = new Date();

                    if(dms.string.isEmpty(result.data[i].purcLeadHm)){
                        result.data[i].purcLeadHm = 0;
                    }

                    tDate.setDate(tDate.getDate() + Number(result.data[i].purcLeadHm));

                    popPrevData.dlrCd          = result.data[i].dlrCd;
                    popPrevData.purcItemTp     = "03";
                    popPrevData.purcItemStatCd = "01";
                    popPrevData.grStrgeCd      = result.data[i].grStrgeCd;
                    popPrevData.itemCd         = result.data[i].itemCd;
                    popPrevData.itemNm         = result.data[i].itemNm;
                    popPrevData.purcUnitCd     = result.data[i].purcUnitCd;
                    popPrevData.purcQty        = result.data[i].purcQty;
                    popPrevData.purcReqQty     = 0;
                    popPrevData.purcPrc        = result.data[i].purcPrc;
                    popPrevData.purcAmt        = result.data[i].purcAmt;
                    popPrevData.prcTp          = result.data[i].prcTp;
                    popPrevData.delYn          = "N";
                    popPrevData.grEndYn        = "N";
                    popPrevData.purcReqDt      = tDate;


                    if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                        //이미 등록되어있는 부품입니다.
                        var itemInfo = result.data[i].itemCd + '[' + result.data[i].itemNm + ']';
                        dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                    }else{
                        popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                        gridData.dataSource.add(popPrevData);
                    }
                }

            });
        }

        //부품 팝업 열기 함수.
        function selectItemPopupWindow(){

            itemByBpCdPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectItemPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind":false
                        , "bpCd":$("#bpCd").val()
                        , "bpNm":$("#bpNm").val()
                        , "bpTp":""
                        , "selectable":"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                tDate = new Date();
                                if(dms.string.isEmpty(data[i].purcLeadHm)){
                                    data[i].purcLeadHm = 0;
                                }

                                tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                                popItemData.dlrCd          = data[i].dlrCd;
                                popItemData.purcItemTp     = "03";
                                popItemData.purcItemStatCd = "01";
                                popItemData.grStrgeCd      = data[i].grStrgeCd;
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.purcUnitCd     = data[i].stockUnitCd;
                                popItemData.purcQty        = 1;
                                popItemData.purcReqQty     = 0;
                                popItemData.purcPrc        = data[i].purcPrc;
                                popItemData.purcAmt        = data[i].purcPrc;
                                popItemData.prcTp          = "01";  //구매가
                                popItemData.delYn          = "N";
                                popItemData.grEndYn        = "N";
                                popItemData.purcReqDt      = tDate;

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
                            itemByBpCdPopupWindow.close();
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
                , content:{
                    url:"<c:url value='/par/cmm/selectPrevPurcOrdPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind":false
                        , "bpCd":$("#bpCd").val()
                        , "bpNm":$("#bpNm").val()
                        , "selectable":"single"
                        , "callbackFunc":function(data){

                            var dataLen = data.length;


                            for(var i = 0; i < dataLen; i = i + 1){

                                // 구매오더 조회.
                                selectCopyPurcOrd(data[i].purcOrdNo);

                                prevPurcOrdPopupWindow.close();

                            }

                        }
                    }
                }
            });
        }

        //구매요청 추가 팝업 열기 함수.
        function selectPurcReqPopupWindow(){

            purcReqPopupWindow = dms.window.popup({
                windowId:"PurcReqPopup"
                , title:"<spring:message code='par.title.addPurcReq' />"   // 구매요청 추가
                , content:{
                    url:"<c:url value='/par/cmm/selectPurcReqPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind":false
                        , "bpCd":$("#bpCd").val()
                        , "bpNm":$("#bpNm").val()
                        , "selectable":"single"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                tDate = new Date();
                                if(dms.string.isEmpty(data[i].purcLeadHm)){
                                    data[i].purcLeadHm = 0;
                                }

                                tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                                popItemData.dlrCd          = data[i].dlrCd;
                                popItemData.purcItemTp     = "01";
                                popItemData.purcItemStatCd = "01";
                                popItemData.grStrgeCd      = data[i].grStrgeCd;
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.purcUnitCd     = data[i].purcReqUnitCd;
                                popItemData.purcQty        = data[i].purcReqQty;
                                popItemData.purcReqQty     = data[i].purcReqQty;
                                popItemData.purcPrc        = data[i].purcPrc;
                                popItemData.purcAmt        = data[i].purcReqQty * data[i].purcPrc;
                                popItemData.purcReqNo      = data[i].purcReqNo;
                                popItemData.purcReqLineNo  = data[i].purcReqLineNo;
                                popItemData.prcTp          = "01";  //구매가
                                popItemData.delYn          = "N";
                                popItemData.grEndYn        = "N";
                                popItemData.regUsrId       = data[i].regUsrId;
                                popItemData.purcReqDt      = tDate;


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

                            purcReqPopupWindow.close();

                        }
                    }
                }
            });
        }

        //구매제시 팝업 열기 함수.
        function selectPurcCostSgstPopupWindow(){

            purcCostSgstPopupWindow = dms.window.popup({
                windowId:"PurcCostSgstPopup"
                , title:"<spring:message code='par.title.addPurcCostSgst' />"   // 구매제시 추가
                , content:{
                    url:"<c:url value='/par/cmm/selectPurcCostSgstPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind":false
                        , "bpCd":$("#bpCd").val()
                        , "bpNm":$("#bpNm").val()
                        , "selectable":"single"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popPrevData  = {},
                                tDate;

                            for(var i = 0; i < dataLen; i = i + 1){
                                tDate = new Date();
                                if(dms.string.isEmpty(data[i].purcLeadHm)){
                                    data[i].purcLeadHm = 0;
                                }

                                tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                                popPrevData.dlrCd          = data[i].dlrCd;
                                popPrevData.purcItemTp     = "02";
                                popPrevData.purcItemStatCd = "01";
                                popPrevData.grStrgeCd      = data[i].grStrgeCd;
                                popPrevData.itemCd         = data[i].itemCd;
                                popPrevData.itemNm         = data[i].itemNm;
                                popPrevData.purcUnitCd     = data[i].unitCd;
                                popPrevData.purcQty        = data[i].purcSgstQty;
                                popPrevData.purcReqQty     = 0;
                                popPrevData.purcPrc        = data[i].purcPrc;
                                popPrevData.purcAmt        = data[i].purcSgstQty * data[i].purcPrc;
                                popPrevData.prcTp          = '01';
                                popPrevData.delYn          = "N";
                                popPrevData.grEndYn        = "N";
                                popPrevData.purcReqDt      = tDate;

                                if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data[i].itemCd] = data[i].itemNm;;
                                    gridData.dataSource.add(popPrevData);
                                }
                            }

                            gridData.select(gridData.tbody.find(">tr"));

                            purcCostSgstPopupWindow.close();

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

            popItemObj = {};

            btnView(); //초기화 시 버튼 구성
            $("#advanceReceived").data("kendoExtNumericTextBox").value(50000);
            $("#bpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#bpNm").val(sessionBpNm);  //공급업체 기본셋팅


            //구매오더 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pPurcOrdNo)){
                selectPurcOrd(pPurcOrdNo);
            }

        }

        function btnView(pStat){

            if(dms.string.isEmpty(pStat)){ //신규 등록 시
                $("#btnSave").show();
                $("#btnSend").hide();
                $("#btnCancel").hide();
                $("#purcOrdTp").data("kendoExtDropDownList").enable(true);
                $("#trsfTp").data("kendoExtDropDownList").enable(true);

                $("#btnAddItem").show();
                $("#btnAdd").show();
                $("#btnDelItem").show();
                $("#btnExcelUpload").show();
                $("#btnCopyPurcOrd").show();
                $("#btnAddPurcReq").show();
                $("#btnRecommOrd").show();

            }else if(pStat === "01"){ //등록 상태 인경우
                $("#btnSave").show();
                $("#btnSend").show();
                $("#btnCancel").show();
                $("#purcOrdTp").data("kendoExtDropDownList").enable(false);
                $("#trsfTp").data("kendoExtDropDownList").enable(true);

                $("#btnAddItem").show();
                $("#btnAdd").show();
                $("#btnDelItem").show();
                $("#btnExcelUpload").show();
                $("#btnCopyPurcOrd").show();
                $("#btnAddPurcReq").show();
                $("#btnRecommOrd").show();

            }else{ //그 외

                $("#btnSave").hide();
                $("#btnSend").hide();
                $("#btnCancel").hide();
                $("#purcOrdTp").data("kendoExtDropDownList").enable(false);
                $("#trsfTp").data("kendoExtDropDownList").enable(false);

                $("#btnAddItem").hide();
                $("#btnAdd").hide();
                $("#btnDelItem").hide();
                $("#btnExcelUpload").hide();
                $("#btnCopyPurcOrd").hide();
                $("#btnAddPurcReq").hide();
                $("#btnRecommOrd").hide();
            }

        }

        initPage();
    });


</script>
<!-- //script -->


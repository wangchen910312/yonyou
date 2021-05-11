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
                <button class="btn_m btn_reset"   id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_save"   id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
                <button class="btn_m btn_save"   id="btnSend"><spring:message code="par.btn.transmission" /></button><!--전송  -->
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /></button><!--취소  -->
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
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.mvtTp" /><!-- 수불유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" data-type="combo" class="form_comboBox" />
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
                            <input id="bpCd" class="form_input hidden form_readonly" readonly >
                            <input id="bpNm" class="form_input form_readonly"  readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcRegDt" /><!-- 구매등록일 --></th>
                        <td>
                            <input id="purcRegDt" type="text" value="" class="form_datepicker" data-type="date">
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
                <button class="btn_s btn_add"  id="btnAddItem"><spring:message       code="par.btn.addItem" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.deleteItem" /></button>
                <button class="btn_s btn_file" id="btnExcelUpload"><spring:message   code="par.btn.uploadExcel" /></button>
                <button class="btn_s btn_add"  id="btnMvtItem"><spring:message       code="par.btn.copyPurcOrd" /></button>
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
            mvtTpList           = [],
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
            searchTrsfTp,
            itemByBpCdPopupWindow,
            prevPurcOrdPopupWindow,
            purcReqPopupWindow,
            transObj;


        //trsfTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
            trsfTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>

        purcItemTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcItemTpList}" varStatus="status">
            purcItemTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            purcItemTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        prcTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            mvtTpList.push({cmmCd:"${obj.mvtTp}", cmmCdNm:"${obj.mvtTpNm}"});
        </c:forEach>

        purcOrdStatList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
            purcOrdStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
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
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        $("#mvtTp").on('change', fnChangeMvt);

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
                    mvtValue      = $("#mvtTp").data("kendoExtDropDownList").value(),
                    header;

                if(mvtValue === '01'||mvtValue === '02'||mvtValue === '03'||mvtValue === '04'){
                    header = {
                            mvtTp           :mvtValue
                          , bpCd            :$("#bpCd").val()
                          , stmtTxt         :''
                    };
                }else if(mvtValue === '11'||mvtValue === '12'||mvtValue === '13'||mvtValue === '14'||mvtValue === '15'||mvtValue === '16'||mvtValue === '88'){
                    header = {
                            mvtTp           :mvtValue
                          , custNo          :$("#bpCd").val()
                          , stmtTxt         :''
                    };
                }else{
                    header = {
                            mvtTp           :mvtValue
                          , stmtTxt         :''
                    };
                }



                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                console.log('gCrud:',gCrud);
                if(gCrud === "C"){
                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(dms.string.isEmpty(gridData.itemQty) || gridData.itemQty == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(mvtValue === '01'||mvtValue === '02'||mvtValue === '03'||mvtValue === '04'){
                            if(dms.string.isEmpty(gridData.purcPrc) || gridData.purcPrc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.strgeCd)){
                                // 입고창고를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                saveList = [];
                                return false;
                            }
                        }else if(mvtValue === '11'||mvtValue === '12'||mvtValue === '13'||mvtValue === '14'||mvtValue === '15'||mvtValue === '16'||mvtValue === '88'){
                            if(dms.string.isEmpty(gridData.salePrc) || gridData.salePrc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.strgeCd)){
                                // 입고창고를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.strgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                saveList = [];
                                return false;
                            }
                        }else{
                            if(dms.string.isEmpty(gridData.frStrgeCd)){
                                // 입고창고를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.giStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.toStrgeCd)){
                                // 입고창고를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                saveList = [];
                                return false;
                            }
                        }





                        saveList.push(gridData);
                    });

                    if(saveList.length > 0){
                        var data ={
                               "mvtDocVO"    :header
                              ,"mvtDocItemVO":saveList
                            };
                        console.log("saveData::"+kendo.stringify(data),paramUrl );

                        $.ajax({
                             url:"<c:url value='/par/pmm/mvtDoc/multiSaveMvtDocs.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {
                               console.log('result:',result);
                                if (result.data.length > 0) {
                                    dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.regSuccessParam' arguments='${purcOrd}'/>");

                                    //pPurcOrdNo = result.purcOrdNo;
                                    // 구매오더 조회.
                                    //selectPurcOrd(pPurcOrdNo);

                                } else {
                                    console.log('errorResult:',result);
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.regFailedParam' arguments='${purcOrd}'/>");
                                    }
                                }
                            }
                            ,error:function(jqXHR,status,error) {
                                console.log('error:',arguments);
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });
                    }
                }else if(gCrud === "U"){
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

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
                                    console.log('result:',result);
                                   if (result === 1) {
                                       dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.modifySuccessParam' arguments='${purcOrd}'/>");

                                       // 구매오더 조회.
                                       selectPurcOrd(pPurcOrdNo);

                                   } else {
                                       console.log('errorResult:',result);
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
                                       console.log('errorResult:',result);
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
                          trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
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
        $("#btnMvtItem").kendoButton({
            click:function(e){
                var bpCd     = $("#bpCd").val(),
                    mvtValue = $("#mvtTp").data("kendoExtDropDownList").value();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }

                if(dms.string.isEmpty(mvtValue)){
                    //수불 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.mvtTp' var='mvtTp' /><spring:message code='global.info.emptyParamInfo' arguments='${mvtTp}'/>");
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
                            popPrevData.cancStmtYn     = 'N';
                            popPrevData.strgeCd        = result.data[i].grStrgeCd;
                            popPrevData.locCd          = 'A07AA-01';
                            popPrevData.itemCd         = result.data[i].itemCd;
                            popPrevData.itemNm         = result.data[i].itemNm;
                            popPrevData.itemUnitCd     = result.data[i].unitCd;
                            popPrevData.itemQty        = result.data[i].purcSgstQty;
                            popPrevData.purcPrc        = result.data[i].purcPrc;
                            popPrevData.purcAmt        = result.data[i].purcSgstQty * result.data[i].purcPrc;
                            popPrevData.ddlnYn         = "N";
                            popPrevData.currCd         = 'YN';


                            console.log('tDate2:',tDate);

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

        // 전송 버튼
        $("#btnSend").kendoButton({
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

                if($("#purcOrdStatCd").data("kendoExtDropDownList").value() !== '01'){
                    //등록 상태에서만 전송가능합니다.
                    dms.notification.warning("<spring:message code='par.info.sendStatMsg' />");
                    return false;
                }

                header = {
                          trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                        , bpCd            :$("#bpCd").val()
                        , purcOrdNo       :$("#purcOrdNo").val()
                        , purcOrdStatCd   :'02'
                        , bpCd            :$("#bpCd").val()
                        , remark          :""
                };


                $.ajax({
                     url:"<c:url value='/par/pcm/purcOrd/sendPurcOrd.do' />"
                    ,data:kendo.stringify(header)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {

                        console.log('result111:',result);
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
             var input     = $("<input/>"),
                 mvtValue  = $("#mvtTp").data("kendoExtDropDownList").value(),
                 pValue;

             input.attr("name", options.field);

             if(mvtValue === '01'||mvtValue === '02'||mvtValue === '03'||mvtValue === '04'){
                 input.keyup(function(){
                     if(options.field === 'itemQty'){
                         pValue = Math.floor( $(this).val());
                         options.model.set("purcAmt", options.model.purcPrc * pValue);
                     }else if(options.field === 'purcPrc'){
                         pValue =  Number(Number($(this).val()).toFixed(2));
                         options.model.set("purcAmt", options.model.itemQty * pValue);
                     }

                 });

                 input.blur(function(){
                    var resultGrid = $("#grid").data("kendoExtGrid"),
                        rows       = resultGrid.tbody.find("tr"),
                        totalAmt   = 0,
                        gridData;

                    if(!dms.string.isEmpty(pValue)){
                        if(options.field === 'itemQty'){
                            options.model.set("itemQty", pValue);
                        }else if(options.field === 'purcPrc'){
                            options.model.set("purcPrc", pValue);
                        }
                    }

                 });
             }else if(mvtValue === '11'||mvtValue === '12'||mvtValue === '13'||mvtValue === '14'||mvtValue === '15'||mvtValue === '16'||mvtValue === '88'){
                 input.keyup(function(){
                     if(options.field === 'itemQty'){
                         pValue = Math.floor( $(this).val());
                         options.model.set("saleAmt", options.model.salePrc * pValue);
                     }else if(options.field === 'purcPrc'){
                         pValue =  Number($(this).val()).toFixed(2);
                         options.model.set("saleAmt", options.model.itemQty * pValue);
                     }

                 });

                 input.blur(function(){
                    var resultGrid = $("#grid").data("kendoExtGrid"),
                        rows       = resultGrid.tbody.find("tr"),
                        totalAmt   = 0,
                        gridData;

                    if(!dms.string.isEmpty(pValue)){
                        if(options.field === 'itemQty'){
                            options.model.set("itemQty", pValue);
                        }else if(options.field === 'salePrc'){
                            options.model.set("salePrc", pValue);
                        }
                    }

                 });
             }

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

            console.log('grStrgeCdDropDownEditor:',arguments);

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
                       id:"mvtDocNo"
                      ,fields:{
                              dlrCd          :{ type:"string" , validation:{required:true} }
                            , cancStmtYn     :{ type:"string" }
                            , autoCreYn      :{ type:"string" }
                            , strgeCd        :{ type:"string" }
                            , frStrgeCd      :{ type:"string" }
                            , toStrgeCd      :{ type:"string" }
                            , locCd          :{ type:"string" }
                            , itemCd         :{ type:"string", editable:false}
                            , itemNm         :{ type:"string", editable:false}
                            , itemQty        :{ type:"number" }
                            , itemUnitCd     :{ type:"string", editable:false}
                            , refDocTp       :{ type:"string", editable:false}
                            , refDocNo       :{ type:"string", editable:false}
                            , refDocLineNo   :{ type:"number" }
                            , cancMvtDocNo   :{ type:"string", editable:false}
                            , cancMvtDocYyMmDt:{ type:"string", editable:false}
                            , cancMvtDocLineNo:{ type:"number" }
                            , currCd         :{ type:"string" }
                            , purcPrc        :{ type:"number" }
                            , purcAmt        :{ type:"number"}
                            , salePrc        :{ type:"number" }
                            , saleAmt        :{ type:"number"}
                            , ddlnYn         :{ type:"string", editable:false}
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
                var eles = e.container.find("input");
                var fieldName;
                if(eles.length > 1){
                    fieldName = eles[eles.length-1].getAttribute("name");
                }else{
                    fieldName = eles.attr("name");
                }

                if(fieldName === "purcAmt"){
                     this.closeCell();
                }

             }
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //취소전표여부
                      title:"취소전표여부"
                     ,field:"cancStmtYn"
                     ,width:100
                     ,hidden:true
                  }
                , {   //자동생성품목코드
                      title:"자동생성여부"
                     ,field:"autoCreYn"
                     ,width:30
                     ,hidden:true
                  }
                , {   //창고
                      title:"<spring:message code='par.lbl.strgeCd' />"
                     ,field:"strgeCd"
                     ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     //,template:'#= changeGrStrgeCd(strgeCd)#'
                  }
                , {   //출고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"toStrgeCd"
                     ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     //,template:'#= changeGrStrgeCd(toStrgeCd)#'
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.giStrgeCd' />"
                     ,field:"frStrgeCd"
                     ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     //,template:'#= changeGrStrgeCd(frStrgeCd)#'
                  }
                , {   ///로케이션
                      title:"로케이션"
                     ,field:"locCd"
                     ,width:100
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:100
                     ,editable:false
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                     ,editable:false
                  }
                , {   //품목수량
                      title:"품목수량"
                     ,field:"itemQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changePurcAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"itemUnitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePurcUnit(itemUnitCd)#'
                     ,editable:false
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"purcPrc"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changePurcAmtEditor
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"purcAmt"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,editable:false
                  }
                , {   //참조문서번호
                      title:"참조문서번호"
                     ,field:"refDocNo"
                     ,width:120
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"salePrc"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changePurcAmtEditor
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"saleAmt"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,editable:false
                  }
                , {   //참조문서번호
                      title:"참조문서번호"
                     ,field:"refDocNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:60
                  }
                , {   //취소문서번호
                      title:"취소문서번호"
                     ,field:"cancMvtDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"cancMvtDocLineNo"
                     ,width:60
                     ,hidden:true
                  }
                , {   //취소문서년월
                      title:"취소문서년월"
                     ,field:"cancMvtDocYyMmDt"
                     ,width:60
                     ,hidden:true
                  }
                , {   //통화코드
                      title:"통화코드"
                     ,field:"currCd"
                     ,width:60
                     ,hidden:true
                  }
                , {   //마감여부
                      title:"마감여부"
                     ,field:"ddlnYn"
                     ,width:60
                     ,hidden:true
                  }
                , { field:"" }
            ]
        });

         // 입고 창고
         changeGrStrgeCd = function(val){
             console.log('changeGrStrgeCd:', grStrgeTpObj, val);
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = grStrgeTpObj[val];
             }
             console.log('returnVal:', returnVal);
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
             console.log('changePurcUnit:',val, returnVal,purcUnitObj);
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

                    console.log('selectPurcOrd result:', result);

                    partsJs.validate.groupObjAllDataSet(result);

                    ordStatCd = $("#purcOrdStatCd").data("kendoExtDropDownList").value();

                    $("#grid").data("kendoExtGrid").dataSource.read();

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
                    mvtValue     = $("#mvtTp").data("kendoExtDropDownList").value(),
                    popPrevData  = {},
                    tDate;

                console.log('result:', result);
                for(var i = 0; i < dataLen; i = i + 1){

                    tDate = new Date();

                    if(dms.string.isEmpty(result.data[i].purcLeadHm)){
                        result.data[i].purcLeadHm = 0;
                    }

                    tDate.setDate(tDate.getDate() + Number(result.data[i].purcLeadHm));

                    popPrevData.dlrCd          = result.data[i].dlrCd;
                    popPrevData.cancStmtYn     = 'N';
                    popPrevData.locCd          = 'A07AA-01';
                    popPrevData.itemCd         = result.data[i].itemCd;
                    popPrevData.itemNm         = result.data[i].itemNm;
                    popPrevData.itemUnitCd     = result.data[i].purcUnitCd;
                    popPrevData.itemQty        = result.data[i].purcQty;

                    console.log(111);
                    if(mvtValue === '01'||mvtValue === '02'||mvtValue === '03'||mvtValue === '04'){
                        console.log(222);
                        popPrevData.strgeCd        = result.data[i].grStrgeCd;
                        popPrevData.purcPrc        = result.data[i].purcPrc;
                        popPrevData.purcAmt        = result.data[i].purcAmt;
                    }else if(mvtValue === '11'||mvtValue === '12'||mvtValue === '13'||mvtValue === '14'||mvtValue === '15'||mvtValue === '16'||mvtValue === '88'){
                        console.log(333);
                        popPrevData.strgeCd        = result.data[i].grStrgeCd;
                        popPrevData.salePrc        = result.data[i].purcPrc;
                        popPrevData.saleAmt        = result.data[i].purcAmt;
                    }else{
                        console.log(555);
                        popPrevData.frStrgeCd        = result.data[i].grStrgeCd;
                        popPrevData.toStrgeCd        = '';
                    }

                    console.log(777);
                    popPrevData.refDocNo       = result.data[i].purcOrdNo;
                    popPrevData.refDocLineNo   = result.data[i].purcOrdLineNo;
                    popPrevData.ddlnYn          = "N";
                    popPrevData.currCd          = 'YN';

                    console.log('popPrevData:',popPrevData);

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

                                popItemData.dlrCd          = data[i].dlrCd;
                                popItemData.cancStmtYn     = 'N';
                                popItemData.strgeCd        = data[i].grStrgeCd;
                                popItemData.locCd          = 'A07AA-01';
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.itemUnitCd     = data[i].stockUnitCd;
                                popItemData.itemQty        = 1;
                                popItemData.purcPrc        = data[i].purcPrc;
                                popItemData.purcAmt        = data[i].purcPrc;
                                popItemData.ddlnYn          = "N";
                                popItemData.currCd          = 'YN';
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
                                popItemData.cancStmtYn     = 'N';
                                popItemData.strgeCd        = data[i].grStrgeCd;
                                popItemData.locCd          = 'A07AA-01';;
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.itemUnitCd     = data[i].purcReqUnitCd;
                                popItemData.itemQty        = data[i].purcReqQty;
                                popItemData.purcPrc        = data[i].purcPrc;
                                popItemData.purcAmt        = data[i].purcReqQty * data[i].purcPrc;
                                popItemData.purcReqNo      = data[i].purcReqNo;
                                popItemData.purcReqLineNo  = data[i].purcReqLineNo;
                                popItemData.ddlnYn          = "N";
                                popItemData.currCd          = 'YN';
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
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnSend").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#trsfTp").data("kendoExtDropDownList").enable(true);

                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnMvtItem").data("kendoButton").enable(true);
                $("#btnAddPurcReq").data("kendoButton").enable(true);
                $("#btnRecommOrd").data("kendoButton").enable(true);

            }else if(pStat === "01"){ //등록 상태 인경우
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnSend").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#trsfTp").data("kendoExtDropDownList").enable(true);

                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnMvtItem").data("kendoButton").enable(true);
                $("#btnAddPurcReq").data("kendoButton").enable(true);
                $("#btnRecommOrd").data("kendoButton").enable(true);

            }else{ //그 외

                $("#btnSave").data("kendoButton").enable(false);
                $("#btnSend").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#trsfTp").data("kendoExtDropDownList").enable(false);

                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnMvtItem").data("kendoButton").enable(false);
                $("#btnAddPurcReq").data("kendoButton").enable(false);
                $("#btnRecommOrd").data("kendoButton").enable(false);
            }

        }

        function fnChangeMvt(e){

            var l_mvtType = $(this).data("kendoExtDropDownList").value(),
                mvtValue  = $("#mvtTp").data("kendoExtDropDownList").value(),
                grid      = $("#grid").data("kendoExtGrid");

            if(l_mvtType === '21'||l_mvtType === '22'||l_mvtType === '23'||l_mvtType === '24'||l_mvtType === '25'||l_mvtType === '26'){
                grid.hideColumn("strgeCd");
                grid.showColumn("frStrgeCd");
                grid.showColumn("toStrgeCd");

                grid.hideColumn("salePrc");
                grid.hideColumn("saleAmt");
                grid.hideColumn("purcPrc");
                grid.hideColumn("purcAmt");
            }else{

                grid.showColumn("strgeCd");
                grid.hideColumn("frStrgeCd");
                grid.hideColumn("toStrgeCd");

                //구매
                if(mvtValue === '01'||mvtValue === '02'||mvtValue === '03'||mvtValue === '04'){
                    grid.showColumn("purcPrc");
                    grid.showColumn("purcAmt");
                    grid.hideColumn("salePrc");
                    grid.hideColumn("saleAmt");
                //판매
                }else{
                    grid.hideColumn("purcPrc");
                    grid.hideColumn("purcAmt");
                    grid.showColumn("salePrc");
                    grid.showColumn("saleAmt");
                }

            }

        }

        initPage();
    });
</script>
<!-- //script -->


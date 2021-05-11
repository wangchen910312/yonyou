<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 공구사용기록정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11965" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11964" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11963" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_print hidden" id="btnPrint" type="button"><spring:message code="par.btn.print" /><!--출력  --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11962" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
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
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.toolGiTp" /><!-- 공구출고유형 --></span></th>
                        <td class="required_area">
                            <input id="toolGiTp" name="toolGiTp" data-type="combo" type="text"  required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.repairPrsn" /><!-- 수리공 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="techId" class="form_input hidden" />
                                <input type="text" id="techNm" class="form_input form_readonly" readonly />
                                <a id="searchTechId"><!-- 검색 --></a>
                                <input type="text" id="statCd" class="form_input hidden" />
                                <input type="text" id="mvtDocNo" class="form_input hidden" />
                                <input type="text" id="mvtDocYyMm" class="form_input hidden" />
                                <input type="text" id="updtDtStr" class="form_input hidden" />
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.toolGiDocNo" /><!-- 공구출고문서번호 --></th>
                        <td>
                             <div class="form_search">
                                <input id="toolGiDocNo" class="form_input form_readonly" readonly>
                                <a id="searchToolGiDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.toolGiDt" /><!-- 공구출고일자 --></th>
                        <td class="readonly_area">
                            <input id="giDt" class="form_datepicker" data-type="maskDate"  readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.totalQty" /><!-- 수량총계 --></th>
                        <td>
                            <input id="totQty" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 금액총계 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsNm" /><!-- 담당자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="prsnId" class="form_input hidden" />
                                <input type="text" id="prsnNm" class="form_input form_readonly" readonly />
                                <a id="searchPrsnId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row" id="roTitle"><span id="roRequiredSpan" class="bu_required"><spring:message code="par.lbl.invRoDocNo" /><!-- 위탁서번호 --></span></th>
                        <td id="roInfo">
                            <div class="form_search">
                                <input type="text" id="roDocNo" class="form_input form_readonly" readonly />
                                <a id="searchRoDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11961" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_add btn_s_min5" id="btnAdd"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11960" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_del btn_s_min5" id="btnDelItem"><spring:message code="par.btn.del" /></button>
            </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 공구출고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //부품기타출고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        pToolGiDocNo        = "${pToolGiDocNo}",
        toolGiTpChkObj      = {},
        toolGiTpList        = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        popItemObj          = {},
        itemSalePrcPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd,
        userSearchPopupWin,
        tecSearchPopup,
        repairOrderSearchPopup,
        toolGiListPopupWindow;

        locationObj[' '] = "";

        //공구출고유형 : GI(工具借用:공구출고), RT(工具归还:공구반환), 65(工具报损:공구폐기)
        <c:forEach var="obj" items="${toolGiTpList}" varStatus="status">
            toolGiTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            toolGiTpChkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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
        $("#toolGiTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:toolGiTpList
            ,index:0
        });

        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });
        //총수량
        $("#totQty").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#giDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#searchTechId").on('click', fmTechPopup);
        $("#searchPrsnId").on('click', userSearchPopup);
        $("#searchToolGiDocNo").on('click', fnToolGiListPopupWindow);
        $("#searchRoDocNo").on('click', fnRoSearchPopupWindow);
        $("#toolGiTp").on('change', fnChangeToolGiTp);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pToolGiDocNo = ''; //기타출고현황 화면에서 넘어온 기타출고번호 삭제.
                initPage($("#toolGiTp").data("kendoExtDropDownList").value());
            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                var toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();

                if(!dms.string.isEmpty($("#statCd").val()) && $("#statCd").val() !== '01'){
                    //라인 추가 할 수 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.err.failedParam' arguments='${lineNm}'/>");
                    return false;
                }

                if(dms.string.isEmpty(toolGiTp)){
                    // 공구출고유형를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.toolGiTp' var='toolGiTp' /><spring:message code='global.info.confirmMsgParam' arguments='${toolGiTp}'/>");
                    saveList = [];
                    return false;
                }else{
                    //출고유형이 공구출고인 경우
                    if(toolGiTp === 'GI'){
                        if(dms.string.isEmpty($("#techId").val())){
                            // 수리공 정보를 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.repairPrsn' var='techId' /><spring:message code='global.info.confirmMsgParam' arguments='${techId}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty($("#roDocNo").val())){
                            // 위탁서 정보를 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.invRoDocNo' var='roDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${roDocNo}'/>");
                            saveList = [];
                            return false;
                        }
                    }else if(toolGiTp === 'RT'){
                        if(dms.string.isEmpty($("#techId").val())){
                            // 수리공 정보를 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.repairPrsn' var='techId' /><spring:message code='global.info.confirmMsgParam' arguments='${techId}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty($("#roDocNo").val())){
                            // 위탁서 정보를 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.invRoDocNo' var='roDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${roDocNo}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty($("#toolGiDocNo").val())){
                            // 공구출고문서 정보를 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${toolGiDocNo}'/>");
                            saveList = [];
                            return false;
                        }
                    }
                }
                selectItemSalePrcPopupWindow();
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){

                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지 적용.
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
                    toolGiType    = $("#toolGiTp").data("kendoExtDropDownList").value(),
                    toolGiDocNo   = $("#toolGiDocNo").val(),
                    paramUrl      = '',
                    chkRow,
                    header;

                header = {
                        toolGiTp           :toolGiType
                       ,toolGiDocNo        :$("#toolGiDocNo").val()
                       ,roDocNo            :$("#roDocNo").val()
                       ,statCd             :$("#statCd").val()
                       ,mvtDocNo           :$("#mvtDocNo").val()
                       ,mvtDocYyMm         :$("#mvtDocYyMm").val()
                       ,updtDtStr          :$("#updtDtStr").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
                //출고 수정 시
                if(toolGiType !== 'RT' && !dms.string.isEmpty(toolGiDocNo)){
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

                    saveData.toolGiVO = header;

                    if (grid.gridValidation()) {
                        $.ajax({
                            url:"<c:url value='/par/stm/toolMaster/multiToolGis.do' />"
                           ,data:kendo.stringify(saveData)
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:true
                           ,success:function(result) {

                               if (result === true) {
                                   dms.notification.success("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${toolGiDocNo}'/>");

                                   pToolGiDocNo = $("#toolGiDocNo").val();

                                   $("#btnCancel").data("kendoButton").enable(true);

                                   selectToolGi(pToolGiDocNo);

                               } else {
                                   if(result === 0){
                                       dms.notification.success("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${toolGiDocNo}'/>");
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

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);
                        chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        if(toolGiType === 'RT'){
                            if(chkRow === true){
                                if(!dms.string.isEmpty(gridData.itemCd)){

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

                                    saveList.push(gridData);
                                }
                            }
                        }else{
                            if(!dms.string.isEmpty(gridData.itemCd)){

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

                                saveList.push(gridData);
                            }
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                               "toolGiVO":header
                              ,"toolGiItemList":saveList
                            };

                        $.ajax({
                             url:"<c:url value='/par/stm/toolMaster/createToolGi.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {

                                if (result.resultYn == true) {
                                    dms.notification.success("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${toolGiDocNo}'/>");

                                    pToolGiDocNo = result.toolGiDocNo;

                                    // 공구출고 조회.
                                    if(toolGiType !== "RT"){

                                        $("#btnCancel").data("kendoButton").enable(true);

                                        selectToolGi(pToolGiDocNo);

                                    }else{

                                        $("#btnCancel").data("kendoButton").enable(false);
                                        $("#btnDelItem").data("kendoButton").enable(false);


                                        $("#grid").data("kendoExtGrid").dataSource.read();
                                        $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                                    }

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${toolGiDocNo}'/>");
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

             }
        });

        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    toolGiType    = $("#toolGiTp").data("kendoExtDropDownList").value(),
                    toolGiDocNo   = $("#toolGiDocNo").val(),
                    paramUrl      = '',
                    header;

                header = {
                        toolGiTp           :toolGiType
                       ,toolGiDocNo        :$("#toolGiDocNo").val()
                       ,roDocNo            :$("#roDocNo").val()
                       ,statCd             :$("#statCd").val()
                       ,mvtDocNo           :$("#mvtDocNo").val()
                       ,mvtDocYyMm         :$("#mvtDocYyMm").val()
                       ,updtDtStr          :$("#updtDtStr").val()
                };


                if(toolGiType === 'RT'){
                    //반품은 취소 불가능 합니다.
                    dms.notification.warning("<spring:message code='global.err.cnclFailed' />");
                    return false;
                }

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(!dms.string.isEmpty(gridData.itemCd)){


                        if(!dms.string.isEmpty(gridData.refDocNo)){
                            // 반품된 공구가있습니다.
                            dms.notification.warning("<spring:message code='par.btn.invReturn' var='invReturn' /><spring:message code='par.lbl.toolCd' var='toolCd' /><spring:message code='global.info.stInfo' arguments='${invReturn}, ${toolCd}'/>");
                            saveList = [];
                            return false;
                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "toolGiVO":header
                          ,"toolGiItemList":saveList
                        };

                    $.ajax({
                         url:"<c:url value='/par/stm/toolMaster/cancelToolGi.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result === 1) {
                                dms.notification.success("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${toolGiDocNo}'/>");

                                pToolGiDocNo = $("#toolGiDocNo").val();

                                //저장 후 수정 불가.
                                $("#btnSave").data("kendoButton").enable(false);
                                $("#btnAdd").data("kendoButton").enable(false);
                                $("#btnCancel").data("kendoButton").enable(false);

                                // 공구출고 조회.
                                if(toolGiType !== "RT"){

                                    selectToolGi(pToolGiDocNo);

                                }else{

                                    $("#grid").data("kendoExtGrid").dataSource.read();
                                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                                }

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${toolGiDocNo}'/>");
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

        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {
             var input = $("<input/>"),
                 grid  = $("#grid").data("kendoExtGrid"),
                 toolGiTp,
                 pValue,
                 orgValue,
                 orgReturnValue;



             toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();
             input.attr("name", options.field);

             input.keyup(function(){
                 orgValue       = options.model.qty;
                 orgReturnValue = options.model.returnQty;
                 pValue = input.val();
             });

             input.blur(function(){
                 $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 if(options.field === 'qty'){
                     if(toolGiTp !== 'RT'){
                         if(Number(pValue) > Number(options.model.stockQty)){
                             options.model.set('qty', Number(orgValue));
                         }else{
                             pValue = Math.floor( $(this).val());
                             options.model.set("amt", options.model.prc * pValue);

                             fnSetAmtInfo();
                         }

                     }
                 }else if(options.field === 'prc'){
                     if(toolGiTp !== 'RT'){

                         pValue =  Number(Number($(this).val()).toFixed(2));
                         options.model.set("amt", pValue * options.model.qty);

                         fnSetAmtInfo();
                     }
                 }else if(options.field === 'returnQty'){
                     if(toolGiTp === 'RT'){
                         if(( Number(pValue) + Number(options.model.preReturnQty) ) > Number(options.model.qty)){
                             options.model.set('returnQty', Number(orgReturnValue));
                         }else{
                             pValue = Math.floor( $(this).val());
                             options.model.set("amt", options.model.prc * pValue);

                             fnSetAmtInfo();
                         }
                     }
                 }
             });

             input.appendTo(container);
             if(options.field === 'qty'||options.field === 'returnQty') {
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
            gridId:"G-PAR-0811-093601"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/toolMaster/selectToolGiItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params['sToolGiDocNo'] = $("#toolGiDocNo").val()

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen  = result.data.length,
                             itemList = [];

                         for(var i = 0; i < dataLen; i = i + 1){
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                         }

                         for(var i = 0; i < dataLen; i = i + 1){
                             itemList.push(result.data[i].itemCd);
                         }
                         if(dataLen > 0){
                             fnSetLocCdObj(itemList);
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"toolGiDocNo"
                      ,fields:{
                              toolGiDocNo     :{ type:"string", editable:false }
                            , toolGiDocLineNo :{ type:"number", editable:false }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , itemCd          :{ type:"string", editable:false }
                            , itemNm          :{ type:"string", editable:false }
                            , unitCd          :{ type:"string" }
                            , stockQty        :{ type:"number" }
                            , qty             :{ type:"number" }
                            , returnQty       :{ type:"number" }
                            , preReturnQty    :{ type:"number" }
                            , strgeCd         :{ type:"string" }
                            , locCd           :{ type:"string" }
                            , prc             :{ type:"number" }
                            , amt             :{ type:"number" }
                            , giDt            :{ type:"date" }
                            , giTime          :{ type:"string" }
                            , returnDt        :{ type:"date" }
                            , returnTime      :{ type:"string" }
                            , techId          :{ type:"string" }
                            , techNm          :{ type:"string" }
                            , giPrsnId        :{ type:"string" }
                            , giPrsnNm        :{ type:"string" }
                            , returnPrsnId    :{ type:"string" }
                            , returnPrsnNm    :{ type:"string" }
                            , cancYn          :{ type:"string" }
                            , mvtDocYyMm      :{ type:"string" }
                            , mvtDocNo        :{ type:"string" }
                            , mvtDocLineNo    :{ type:"number" }
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
                    toolGiType   = $("#toolGiTp").data("kendoExtDropDownList").value(),
                    itemList     = [],
                    fieldName    = grid.columns[e.container.index()].field,
                    pVal,
                    orgVal;

                if(fieldName === "itemNm"||fieldName === "strgeCd"||fieldName === "stockQty"
                   ||fieldName === "amt"||fieldName === "giDt"||fieldName === "unitCd"||fieldName === "returnPrsnId"||fieldName === "returnPrsnNm"
                   ||fieldName === "giTime"||fieldName === "returnDt"||fieldName === "returnTime"||fieldName === "preReturnQty"
                   ||fieldName === "techId"||fieldName === "techNm"||fieldName === "giPrsnId"||fieldName === "giPrsnNm"){
                     this.closeCell();
                }else if(fieldName === "itemCd"){
                    pVal = input.val();
                    orgVal = input.val();

                    if(!dms.string.isEmpty(e.model.toolGiDocNo)){
                        this.closeCell();
                    }

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

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sPrcTp:'01' , sItemDstinCd:'07'})
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
                                       e.model.set('stockQty',     result.data[0].avlbStockQty - result.data[0].clamStockQty);
                                       e.model.set('prc',          result.data[0].movingAvgPrc);
                                       e.model.set('amt',          result.data[0].movingAvgPrc);
                                       e.model.set('strgeCd',      result.data[0].giStrgeCd);
                                       e.model.set('giPrsnId',     $("#prsnId").val());
                                       e.model.set('giPrsnNm',     $("#prsnNm").val());
                                       e.model.set('techId',       $("#techId").val());
                                       e.model.set('techNm',       $("#techNm").val());

                                       delete popItemObj[orgVal];

                                       popItemObj[pVal] = pVal;

                                       itemList.push(result.data[0].itemCd);

                                       fnSetLocCdObj(itemList);

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

                }else if(fieldName === "qty"){
                    if(toolGiType === 'RT'){
                        this.closeCell();
                    }else{
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                    }
                }else if(fieldName === "returnQty"){
                    if(toolGiType !== 'RT'){
                        this.closeCell();
                    }else{
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    }
                }else if(fieldName === "prc"){
                    if(toolGiType === 'RT'){
                        this.closeCell();
                    }else{
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                    }
                }
             }
            , columns:[
                  {   //공구출고현황번호
                      title:"<spring:message code='par.lbl.toolGiDocNo' />"
                     ,field:"toolGiDocNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"toolGiDocLineNo"
                     ,width:60
                     ,hidden:true
                  }
                , {   //참조문서
                      title:"<spring:message code='par.lbl.toolGiDocNo' />"
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
                , {   //부품번호
                      title:"<spring:message code='par.lbl.toolCd' />"
                     ,field:"itemCd"
                     ,width:100
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.toolNm' />"
                     ,field:"itemNm"
                     ,width:180
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"qty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
               , {   //반환수량
                    field:"returnQty"
                   ,title:"<spring:message code='par.lbl.returnQty' />"
                   ,attributes:{ "class":"ar"}
                   ,editor:changeAmtEditor
                   ,format:"{0:n0}"
                   ,width:100
                 }
                 ,{   //재고수량
                      title:"<spring:message code='par.lbl.strgeStockQty' />"
                     ,field:"stockQty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,decimal:2
                 }
               , {   //기반환수량
                    field:"preReturnQty"
                   ,title:"<spring:message code='par.lbl.preReturnQty' />"
                   ,attributes:{ "class":"ar"}
                   ,format:"{0:n0}"
                   ,width:100
                 }
                , {   //단가
                    title:"<spring:message code='par.lbl.prc' />"
                   ,field:"prc"
                   ,editor:changeAmtEditor
                   ,width:80
                   ,attributes:{ "class":"ar"}
                   ,format:"{0:n2}"
                   ,decimals:2
                   ,hidden:true
                }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,template:'#= changeUnitCd(unitCd)#'
                     ,hidden:true
                  }
                , {   //출고창고
                    title:"<spring:message code='par.lbl.giStrgeCd' />"
                   ,field:"strgeCd"
                   ,width:150
                   ,template:'#= changeStrgeCd(strgeCd)#'
                   ,sortable:false
                }
                , {   //로케이션
                    title:"<spring:message code='par.lbl.locationCd' />"
                   ,field:"locCd"
                   ,width:140
                   ,editor:giLocCdDropDownEditor
                   ,template:'#= changeGiLocCd(strgeCd, locCd)#'
                   ,sortable:false
                }
              , {   //금액
                    title:"<spring:message code='global.lbl.amt' />"
                   ,field:"amt"
                   ,width:90
                   ,attributes:{ "class":"ar"}
                   ,format:"{0:n2}"
                   ,decimals:2
                   ,hidden:true
                }
               ,{
                    field:"remark"
                   ,title:"<spring:message code='par.lbl.remark' />"
                   ,width:140
                 }//비고
               , {   //공구출고일자
                    field:"giDt"
                   ,title:"<spring:message code='par.lbl.toolGiDt' />"
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,attributes:{ "class":"ac"}
                   ,width:100
                 }
               , {   //공구출고시간
                    field:"giTime"
                   ,title:"<spring:message code='par.lbl.toolGiTime' />"
                   ,width:100
                 }
               , {   //반환일자
                    field:"returnDt"
                   ,title:"<spring:message code='par.lbl.toolReturnDt' />"
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,attributes:{ "class":"ac"}
                   ,width:100
                 }
               , {   //반환시간
                    field:"returnTime"
                   ,title:"<spring:message code='par.lbl.toolReturnTime' />"
                   ,attributes:{ "class":"ac"}
                   ,width:100
                 }
              , {   //수리공
                   title:"<spring:message code='par.lbl.repairPrsn' />"
                  ,field:"techId"
                  ,width:100
                  ,hidden:true
                }
              , {   //수리공
                   title:"<spring:message code='par.lbl.repairPrsn' />"
                  ,field:"techNm"
                  ,width:180
                 }
              , {   //출고담당자
                   title:"<spring:message code='par.lbl.prsNm' />"
                  ,field:"giPrsnId"
                  ,width:100
                  ,hidden:true
                }
              , {   //출고담당자
                   title:"<spring:message code='par.lbl.prsNm' />"
                  ,field:"giPrsnNm"
                  ,width:180
                 }
              , {   //반환담당자
                   title:"<spring:message code='par.lbl.prsNm' />"
                  ,field:"returnPrsnId"
                  ,width:100
                  ,hidden:true
                }
              , {   //반환담당자
                   title:"<spring:message code='par.lbl.prsNm' />"
                  ,field:"returnPrsnNm"
                  ,width:180
                 }
              , {   //취소여부
                   title :"<spring:message code='par.lbl.cancYn' />"
                  ,field :"cancYn"
                  ,width :50
                  ,hidden:true
                 }
              , {   //수불년월
                   title :"<spring:message code='par.lbl.mvtDocYyMm' />"
                  ,field :"mvtDocYyMm"
                  ,width :50
                  ,hidden:true
                 }
              , {   //수불번호
                   title :"<spring:message code='par.lbl.mvtDocNo' />"
                  ,field :"mvtDocNo"
                  ,width :50
                  ,hidden:true
                 }
              , {   //수불라인
                   title :"<spring:message code='par.lbl.lineNm' />"
                  ,field :"mvtDocLineNo"
                  ,width :50
                  ,hidden:true
                 }
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

  //부품 팝업 열기 함수.
    function selectItemSalePrcPopupWindow(){

        itemSalePrcPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , width:840
            , height:420
            , content:{
                url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind"    :true
                    , "prcTp"       :'02'
                    , "itemDstinCd" :'07'
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

                            popItemData.itemCd          = data[i].itemCd;
                            popItemData.itemNm          = data[i].itemNm;
                            popItemData.unitCd          = data[i].stockUnitCd;
                            popItemData.qty             = 1;
                            popItemData.stockQty        = data[i].stockQty;
                            popItemData.prc             = data[i].salePrcAmt;
                            popItemData.amt             = data[i].salePrcAmt;
                            popItemData.strgeCd         = data[i].giStrgeCd;
                            //popItemData.locCd           = '';
                            popItemData.toolGiDocNo     = '';
                            popItemData.toolGiDocLineNo = null;
                            popItemData.giPrsnId        = $("#prsnId").val();
                            popItemData.giPrsnNm        = $("#prsnNm").val();
                            popItemData.techId          = $("#techId").val();
                            popItemData.techNm          = $("#techNm").val();

                            if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].giStrgeCd])){
                                    popItemData.locCd = locationListObj[data[i].itemCd][data[i].giStrgeCd][0].cmmCd;
                                }else{
                                    popItemData.locCd = '';
                                }
                            }else{
                                popItemData.locCd = '';
                            }

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

    // 공구출고 정보 조회.
    function selectToolGi(pToolGiDocNo){
        var toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();
        $.ajax({
            url:"<c:url value='/par/stm/toolMaster/selectToolGiByKey.do' />",
            data:JSON.stringify({ sToolGiDocNo:pToolGiDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {

                partsJs.validate.groupObjAllDataSet(result);
                $("#grid").data("kendoExtGrid").dataSource.read();

                $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                if($("#statCd").val() !== '01'){
                   //반품 발생 후 수정 불가.
                   $("#btnAdd").data("kendoButton").enable(false);
                   $("#btnCancel").data("kendoButton").enable(false);

                   if(toolGiTp === 'RT'){
                       $("#btnSave").data("kendoButton").enable(true);
                       $("#toolGiTp").data("kendoExtDropDownList").value('RT');
                   }else{
                       $("#btnSave").data("kendoButton").enable(false);
                       $("#btnDelItem").data("kendoButton").enable(false);
                   }
                }else{
                    if(toolGiTp === 'RT'){
                        $("#btnSave").data("kendoButton").enable(true);
                        $("#btnAdd").data("kendoButton").enable(false);
                        $("#btnCancel").data("kendoButton").enable(false);
                        $("#toolGiTp").data("kendoExtDropDownList").value('RT');
                        $("#btnDelItem").data("kendoButton").enable(false);
                    }else if(toolGiTp === 'GI'){
                        $("#btnSave").data("kendoButton").enable(true);
                        $("#btnAdd").data("kendoButton").enable(true);
                        $("#btnCancel").data("kendoButton").enable(true);
                    }else if(toolGiTp === '65'){
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnAdd").data("kendoButton").enable(false);
                        $("#btnCancel").data("kendoButton").enable(true);
                        $("#btnDelItem").data("kendoButton").enable(false);
                    }
                }
        });
    }

    function fnSetAmtInfo(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            totalAmt    = 0,
            totalQty    = 0,
            toolGiTp,
            gridData;

        toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();

        rows.each(function(index, row) {
            gridData = grid.dataSource.at(index);
            totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.qty));
            totalQty = totalQty + Math.floor(gridData.qty);

        });
        $("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
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
                            var grid          = $("#grid").data("kendoExtGrid"),
                                rows          = grid.tbody.find("tr");

                            $("#prsnId").val(data[0].usrId);
                            $("#prsnNm").val(data[0].usrNm);

                             rows.each(function(index, row) {
                                 var gridData = grid.dataSource.at(index);

                                 if($("#toolGiTp").data("kendoExtDropDownList").value() !== 'RT'){
                                     gridData.giPrsnId = data[0].usrId;
                                     gridData.giPrsnNm = data[0].usrNm;
                                 }else{
                                     gridData.returnPrsnId = data[0].usrId;
                                     gridData.returnPrsnNm = data[0].usrNm;
                                 }

                             });

                        }
                        userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    // 테크니션 팝업
    function fmTechPopup(){

        // 공구 출고 후에는 수리공 변경 불가능함.
        if(!dms.string.isEmpty($("#toolGiDocNo").val())){
            // 이미 공구 출고 됨
            dms.notification.warning("<spring:message code='par.lbl.toolGiDocNo' var='toolGiDocNo' /><spring:message code='global.info.alreadyCont' arguments='${toolGiDocNo}'/>");
            return false;
        }
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
                ,title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
                ,width:840
                ,height:380
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                    ,data:{
                        "autoBind":true
                        ,"callbackFunc":function(jsonObj) {
                            if(jsonObj.length > 0) {
                                var grid          = $("#grid").data("kendoExtGrid"),
                                    rows          = grid.tbody.find("tr");

                                 $("#techId").val(jsonObj[0].tecId);
                                 $("#techNm").val(jsonObj[0].tecNm);

                                 rows.each(function(index, row) {
                                     var gridData = grid.dataSource.at(index);

                                     gridData.techId = jsonObj[0].tecId;
                                     gridData.techNm = jsonObj[0].tecNm;

                                 });
                            }
                        }
                    }
                }
        });
    }

     //RO검색 팝업
     function fnRoSearchPopupWindow(){
         var toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();

         //출고유형이 공구출고가 아닌 경우
         if(toolGiTp !== 'GI'){
             return false;
         }

        repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:840
            , height:550
            , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "close" :"Y"
                    , "callbackFunc":function(data){
                        $("#roDocNo").val(data[0].roDocNo);
                    }
                }
            }
        });
    }

     // 공구출고리스트 팝업 열기 함수.
     function fnToolGiListPopupWindow(){
        var sendToolGiTp;

         if(dms.string.isEmpty($("#toolGiTp").data("kendoExtDropDownList").value())){
             // 공구출고유형를 선택하십시오
             dms.notification.warning("<spring:message code='par.lbl.toolGiTp' var='toolGiTp' /><spring:message code='global.info.confirmMsgParam' arguments='${toolGiTp}'/>");
             saveList = [];
             return false;
         }

         if(dms.string.isEmpty($("#techId").val())){
             // 수리공 정보를 입력하십시오
             dms.notification.warning("<spring:message code='par.lbl.repairPrsn' var='techId' /><spring:message code='global.info.confirmMsgParam' arguments='${techId}'/>");
             saveList = [];
             return false;
         }

         if($("#toolGiTp").data("kendoExtDropDownList").value() === '65'){
             sendToolGiTp = '65';
         }else{
             sendToolGiTp = 'GI';
         }

         toolGiListPopupWindow = dms.window.popup({
             windowId:"toolGiListPopup"
             ,title:"<spring:message code='par.title.toolGiInfo' />"   //공구출고정보
             ,width : 840
             ,height: 420
             ,content:{
                 url:"<c:url value='/par/cmm/selectToolGiListPopup.do'/>"
                 ,data:{
                       "type"      :"custom1"
                     , "autoBind"  :false
                     , "techId"    :$("#techId").val()
                     , "techNm"    :$("#techNm").val()
                     , "toolGiTp"  :sendToolGiTp
                     , "selectable":"single"
                     , "callbackFunc":function(data){
                         if(data.length === 1)
                         {
                             selectToolGi(data[0].toolGiDocNo);
                         }
                         toolGiListPopupWindow.close();
                     }
                 }
             }
         });
     }

    function fnChangeToolGiTp(e){

        var grid = $("#grid").data("kendoExtGrid");

        //공구출고인경우
        if($("#toolGiTp").data("kendoExtDropDownList").value() === 'GI'){

            $("#roTitle").show();
            $("#roInfo").show();

            $("#grid thead [data-field=giDt]").text("<spring:message code='par.lbl.toolGiDt' />");
            $("#grid thead [data-field=giTime]").text("<spring:message code='par.lbl.toolGiTime' />");
            $("#grid thead [data-field=qty]").text("<spring:message code='par.lbl.qty' />");

            grid.hideColumn(8);
            grid.showColumn(10);
            grid.showColumn(19);
            grid.showColumn(20);
            grid.hideColumn(26);

            grid.showColumn(24);

            $("#roRequiredSpan").addClass("bu_required");

          //공구반환인경우
        }else if($("#toolGiTp").data("kendoExtDropDownList").value() === 'RT'){

            $("#roTitle").show();
            $("#roInfo").show();

            $("#grid thead [data-field=giDt]").text("<spring:message code='par.lbl.toolGiDt' />");
            $("#grid thead [data-field=giTime]").text("<spring:message code='par.lbl.toolGiTime' />");
            $("#grid thead [data-field=qty]").text("<spring:message code='par.lbl.qty' />");
            grid.showColumn(8);
            grid.showColumn(10);
            grid.showColumn(19);
            grid.showColumn(20);
            grid.showColumn(26);

            grid.hideColumn(24);
            $("#roRequiredSpan").removeClass("bu_required");

         //폐기인경우
        }else if($("#toolGiTp").data("kendoExtDropDownList").value() === '65'){

            $("#roTitle").hide();
            $("#roInfo").hide();

            $("#grid thead [data-field=giDt]").text("<spring:message code='par.lbl.disuseDt' />");
            $("#grid thead [data-field=giTime]").text("<spring:message code='par.lbl.disuseTime' />");
            $("#grid thead [data-field=qty]").text("<spring:message code='par.lbl.disuseQty' />");
            grid.hideColumn(8);
            grid.hideColumn(10);
            grid.hideColumn(19);
            grid.hideColumn(20);
            grid.hideColumn(26);

            grid.showColumn(24);

            $("#roRequiredSpan").addClass("bu_required");

        }

        pToolGiDocNo = '';
        initPage($("#toolGiTp").data("kendoExtDropDownList").value());
    }

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(0, {
            "toolGiDocNo"       :''
           ,"toolGiDocLineNo"   :null
           ,"refDocNo"          :''
           ,"refDocLineNo"      :null
           ,"itemCd"            :''
           ,"itemNm"            :''
           ,"unitCd"            :''
           ,"qty"               :0
           ,"strgeCd"           :''
           ,"locCd"             :''
           ,"prc"               :0
           ,"amt"               :0
           ,"giPrsnId"          :$("#prsnId").val()
           ,"giPrsnNm"          :$("#prsnNm").val()
           ,"techId"            :$("#techId").val()
           ,"techNm"            :$("#techNm").val()
        });
    }

    function fnBtnView(pTp){
        if(pTp === 'GI'){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(true);
        }else if(pTp === 'RT'){
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
        }else if(pTp === '65'){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(true);
        }
    }

    function initPage(pType){

        var grid        = $("#grid").data("kendoExtGrid"),
            toolGiTp    = $("#toolGiTp").data("kendoExtDropDownList").value();

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

        $("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totQty").data("kendoExtNumericTextBox").enable(false);
        $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totAmt").data("kendoExtNumericTextBox").enable(false);

        if(dms.string.isEmpty(pType)){
            $("#toolGiTp").data("kendoExtDropDownList").value('GI');
            grid.hideColumn(8);
            grid.showColumn(10);
            grid.showColumn(19);
            grid.showColumn(20);
            grid.hideColumn(26);

            grid.showColumn(24);

            toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();
        }else{
            $("#toolGiTp").data("kendoExtDropDownList").value(pType);

            toolGiTp = $("#toolGiTp").data("kendoExtDropDownList").value();
        }

        fnBtnView(toolGiTp);

        popItemObj = {};


        //기타출고현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pToolGiDocNo)){
            selectToolGi(pToolGiDocNo);
        }

    }

</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
<!-- selectStorageMain -->
<section class="group" id="screenSection">
    <div class="header_area">
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11858" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button><!--btnInit  -->
		</dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11857" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSave" name="btnSave" class="btn_m"><spring:message code="par.btn.save" /><!-- 생성 --></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11856" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnCnfm" name="btnCnfm" class="btn_m"><spring:message code="par.btn.strgeMoveCnfm" /><!-- 확정 --></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11855" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnCancel" name="btnCancel" class="btn_m btn_cancel"><spring:message code="par.btn.strgeMoveCancel" /><!--취소  --></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11854" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnExcelUpload" name="btnExcelUpload" class="btn_m btn_add" ><spring:message code="par.btn.uploadExcel" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11853" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnPrint" name="btnPrint" class="btn_m btn_print"><spring:message code="par.btn.print" /><!--출력  --></button>
        </dms:access>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch"  id="searchForm">
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
                    <th scope="row"><spring:message code="par.lbl.mvtTp" /></th>
                    <td>
                        <input id="sMvtTp" name="sMvtTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giStrgeCd" /></th>
                    <td>
                        <input id="sOutStrgeCd" name="sOutStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.grStrgeCd" /></th>
                    <td>
                        <input id="sInStrgeCd" name="sInStrgeCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.strgeMoveDocNo" /></th><!-- 창고이동번호 -->
                    <td>
                        <div class="form_search">
                            <div id="divEtcGiDocNoArea">
                                <input id="etcGiDocNo" name="etcGiDocNo" class="form_input" />
                                <a id="searchEtcGiDocNo"><!-- 검색 --></a>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.strgeMoveGenDt" /><!-- 창고이동일자 --></th>
                    <td class="readonly_area">
                        <input id="regDt" type="text" class="form_datepicker" data-type="maskDate" readonly />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.handler" /><!-- 등록자 --></th>
                    <td>
                        <input id="regUsrId" class="form_input form_readonly hidden" readonly />
                        <input id="regUsrNm" class="form_input form_readonly" readonly />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.strgeMoveQty" /><!-- 이동수량 --></th>
                    <td class="readonly_area">
                        <input id="itemQty" data-type="number" class="form_numeric"/>
                        <input id="updtDtStr" type="text" class="form_input hidden" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13242" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_s_min" id="btnSetStrgeCdPop"><spring:message code="par.lbl.newStrgeCd" /><!-- 신창고설정팝업 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11852" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnAdd" name="btnAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11851" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDel" name="btnDel" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.rowDel" /></button>
            </dms:access>
            </div>
        </div>
        <div class="table_grid">
            <div id="storageMoveGrid" class="resizable_grid"></div>
        </div>
    </section>
</section>

</div>
<!-- script -->
<script type="text/javascript">
    //mvtTpList
    var mvtTpList = [],
    giStrgeCdList = [],
    giStrgeCdMap = {},
    strgeTpObj = {},
    strgeTpList = [],
    locCdList = [],
    locCdMap = {},
    storgeMoveReasonCdList = [],
    storgeMoveReasonCdMap  = {},
    userCdList = [],
    userCdMap = {},
    popItemObj = {},
    gCrud = "C",
    locationListObj = {},
    locationObj = {},
    pEtcGiDocNo,
    searchStorgeItemPopupWindow,
    storageItemExcelUploadPopupWin,
    selectShareStockGiItemPopupWindow,
    searchItemPopupWindow;

    <c:forEach var="obj" items="${mvtTpList}">
        mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    </c:forEach>
    //giStrgeCdList
    <c:forEach var="obj" items="${giStrgeCdList}">
    giStrgeCdList.push({
        "strgeCd":"${obj.strgeCd}"
        ,"strgeNm":"${obj.strgeNm}"
    });
    </c:forEach>

    strgeTpObj[' '] = "";
    strgeTpList.push({cmmCd:"", cmmCdNm:" "});
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    $.each(giStrgeCdList, function(idx, obj){
        giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
    });
    //location Array
    <c:forEach var="obj" items="${locCdList}">
    locCdList.push({
        "locCd":"${obj.locCd}"
        ,"locNm":"${obj.locNm}"
    });
    </c:forEach>
    $.each(locCdList, function(idx, obj){
        locCdMap[obj.locCd] = obj.locNm;
    });
    //storge move reason Array
    <c:forEach var="obj" items="${storgeMoveReasonCdList}">
    storgeMoveReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    $.each(storgeMoveReasonCdList, function(idx, obj){
        storgeMoveReasonCdMap[obj.cmmCd] = obj.cmmCdNm;
    });
    //userCdList
    <c:forEach var="obj" items="${userCdList}">
    userCdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    </c:forEach>
    $.each(userCdList, function(idx, obj){
        userCdMap[obj.usrId] = obj.usrNm;
    });

//page init Func
function pageInit(){

    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    popItemObj = {};
    $("#sMvtTp").data("kendoExtDropDownList").value('21');//수불유형 재고이동
    $("#storageMoveGrid").data("kendoExtGrid").dataSource.data([]);
    gCrud = "C";

    fnSetButton();
}

//신창고설정팝업
$("#btnSetStrgeCdPop").kendoButton({
    click:function(e){
        var grid = $("#storageMoveGrid").data("kendoExtGrid"),
            rows = grid.tbody.find("tr"),
            lCrud = '',
            paramUrl = '',
            chkRow,
            chkCnt = 0,
            chkLow = [],
            header;

        rows.each(function(index, row){
            var gridData = grid.dataSource.at(index);
            chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

            if(chkRow === true){
                chkCnt = chkCnt + 1;
                chkLow.push(index);
            }
        });

        if(chkCnt < 1){
            dms.notification.warning("<spring:message code='global.info.unselected' />");
            return false;
        }

        setStrgeCdPopup(chkLow);
    }
});

function setStrgeCdPopup(pChkLow){
    setStrgeCdPopupWindow = dms.window.popup({
        windowId:"setStrgeCdPopupWindow"
        ,title:"<spring:message code = 'par.lbl.newStrgeCd'/>"
        ,width:330
        ,height:300
        ,content:{
            url:"<c:url value='/par/cmm/setStrgeCdPopup.do'/>"
            ,data:{
                 "callbackFunc":function(data){
                    var grid = $("#storageMoveGrid").data("kendoExtGrid"),
                        rows = grid.tbody.find("tr"),
                        lCrud = '',
                        paramUrl = '',
                        chkRow,
                        chkCnt = 0,
                        chkLen = pChkLow.length,
                        header;

                    for(var i = 0; i < chkLen; i = i + 1){
                        var dataItem = $("#storageMoveGrid").data("kendoExtGrid").dataSource.data()[pChkLow[i]];

                        if(!dms.string.isEmpty(data.strgeCd)){
                            dataItem.set('grStrgeCd',data.strgeCd);
                        }
                        if(!dms.string.isEmpty(data.grReasonCd)){
                            dataItem.set('grReasonCd',data.grReasonCd);
                        }
                    }
                    setStrgeCdPopupWindow.close();
                }
            }
        }
    });
}

$(document).ready(function() {

    //창고이동일
    $("#regDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //itemQty
    $("#itemQty").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
    });
    $("#itemQty").data("kendoExtNumericTextBox").readonly();

    $("#searchEtcGiDocNo").on('click', selectEtcGiDocListPopupWindow);
    //기타입고번호 keypress event
    $('#etcGiDocNo').keypress(function(event){

        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
            var pEtcGiDocNo = $('#etcGiDocNo').val();
            //기타입고번호 조회.
            selectEtcIssue(pEtcGiDocNo);
        }
        event.stopPropagation();
    });

    //btnSave
    $("#btnSave").kendoButton({
        click:function(e){

            var saveList = [],
                grid = $("#storageMoveGrid").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                mvtType = $("#sMvtTp").data("kendoExtDropDownList").value(),
                lCrud = '',
                paramUrl = '',
                validateCnt = 0,
                header;

            header = {
                mvtTp      : mvtType
               ,updtDtStr  :$("#updtDtStr").val()
            };

            if(rows.length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            rows.each(function(index, row) {

                var gridData = grid.dataSource.at(index);

                if(dms.string.isEmpty(gridData.itemCd)){
                    // 부품을 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                    validateCnt++;

                }else if(dms.string.isEmpty(gridData.strgeMoveStockQty) || gridData.strgeMoveStockQty == 0){
                    // 수량을 입력하십시오.
                    dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${qty}'/>");
                    validateCnt = 1;
                    return false;
                }else if(dms.string.isEmpty(gridData.grReasonCd)){
                    // 입고 사유를 입력하십시오.
                    dms.notification.warning("<spring:message code='par.info.storageMovingReasonMsg'/>");
                    validateCnt = 1;
                    return false;
                }else if(dms.string.isEmpty(gridData.giStrgeCd)){
                    // 창고를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${giStrgeCd}'/>");
                    validateCnt = 1;
                    return false;
                }else if(dms.string.isEmpty(gridData.grStrgeCd)){
                    // 창고를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.newStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                    validateCnt = 1;
                    return false;
                }else if(gridData.giStrgeCd === gridData.grStrgeCd){
                    // 창고를 선택하십시오
                    dms.notification.warning("<spring:message code='par.err.chkStockMoveSameStrgeCd'/>");
                    validateCnt = 1;
                    return false;
                }else if(Number(gridData.strgeMoveStockQty) > Number(gridData.giAvlbStockQty)){
                    // 가용재고보다 클 수 없음.
                    dms.notification.warning("<spring:message code='par.lbl.realAvlbStockQty' var='realAvlbStockQty' /><spring:message code='par.lbl.strgeMoveQty' var='strgeMoveQty' /><spring:message code='global.err.chkGreateParam' arguments='${strgeMoveQty},${realAvlbStockQty}'/>");
                    validateCnt = 1;
                    return false;
                }else{
                }

                if(validateCnt == 0){
                    saveList.push(gridData);
                }

            });
            //유효성 통과 카운트 0일때
            if(validateCnt == 0){
                if(gCrud === "C"){//추가/수정 구분 : 추가
                    if(saveList.length > 0){
                        var data ={
                            "stockMovStorageHeaderVO":header
                            ,"stockMovStorageDetailList":saveList
                        }

                        $.ajax({
                             url:"<c:url value='/par/stm/stockMovement/createStockMovStorageReg.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {

                                if (result.resultYn == true) {

                                    //기타입고문서번호 설정.
                                    pEtcGiDocNo = result.etcGiDocNo;
                                    $('#etcGiDocNo').val(result.etcGiDocNo);
                                    $('#regDt').data("kendoExtMaskedDatePicker").value(result.regDt);
                                    $("#updtDtStr").val(result.updtDtStr);
                                    //재고이동부품 그리드 조회.
                                    $("#storageMoveGrid").data("kendoExtGrid").dataSource.read();
                                    //수정모드 설정.
                                    gCrud = "U";
                                    //버튼 리스트 처리.
                                    fnSetButton('01');

                                    dms.notification.success("<spring:message code='par.info.storageMovingRegSuccMsg'/>");
                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.strgeMoveDocNo' var='strgeMoveDocNo' /><spring:message code='global.err.regFailedParam' arguments='${strgeMoveDocNo}'/>");
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

                     header.etcGiDocNo = $('#etcGiDocNo').val();
                     header.statCd = '01';

                     //재고이동 헤더정보 설정.
                     saveData.stockMovStorageHeaderVO = header;

                     if (grid.gridValidation()) {

                         $.ajax({
                             url:"<c:url value='/par/stm/stockMovement/multiStockMovStorages.do' />"
                            ,data:kendo.stringify(saveData)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                if (result === true) {
                                    dms.notification.success("<spring:message code='par.info.storageMovingRegSuccMsg'/>");

                                    pEtcGiDocNo = $('#etcGiDocNo').val();
                                    $("#storageMoveGrid").data("kendoExtGrid").dataSource._destroyed = [];
                                    $("#storageMoveGrid").data("kendoExtGrid").dataSource.read();

                                    gCrud = "U";

                                    fnSetButton('01');

                                    // 부품기타출고 조회.
                                    selectEtcIssue(pEtcGiDocNo);

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.strgeMoveDocNo' var='strgeMoveDocNo' /><spring:message code='global.err.regFailedParam' arguments='${strgeMoveDocNo}'/>");
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
                 }
            }
        }
    });
    //btnCancel
    $("#btnCancel").kendoButton({
        click:function(e){
            var saveList = [],
                reverseList = [],
                grid = $("#storageMoveGrid").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                mvtType = $("#sMvtTp").data("kendoExtDropDownList").value(),
                header;

            header = {
                etcGiDocNo:$('#etcGiDocNo').val()
                ,mvtTp:mvtType
                ,updtDtStr:$("#updtDtStr").val()
            };

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                saveList.push(gridData);
            });

            //이평가 재계산시 순서가 중요하기때문에 취소인 경우 그리드를 반대순서로 설정한다
            reverseList = saveList.reverse();

            if(reverseList.length > 0){
                var data ={
                    "stockMovStorageHeaderVO":header
                    ,"stockMovStorageDetailList":reverseList
                };

                $.ajax({
                    url:"<c:url value='/par/stm/stockMovement/cancelStockMovStorage.do' />"
                    ,data:kendo.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:true
                    ,success:function(result) {

                       if (result === true) {
                           dms.notification.success("<spring:message code='par.lbl.strgeMoveDocNo' var='strgeMoveDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${strgeMoveDocNo}'/>");

                           fnSetButton('03');

                           selectEtcIssue($('#etcGiDocNo').val());

                       } else {
                           if(result === 0){
                               dms.notification.error("<spring:message code='par.lbl.strgeMoveDocNo' var='strgeMoveDocNo' /><spring:message code='global.err.delFailedParam' arguments='${strgeMoveDocNo}'/>");
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

    //btnCnfm
    $("#btnCnfm").kendoButton({
        click:function(e){
            var grid = $("#storageMoveGrid").data("kendoExtGrid"),
            rows = grid.tbody.find("tr"),
            mvtType = $("#sMvtTp").data("kendoExtDropDownList").value(),
            saveList = [],
            saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
            insertListLeng = saveData.insertList.length,
            updateListLeng = saveData.updateList.length,
            deleteListLeng = saveData.deleteList.length,
            modifyLeng = insertListLeng + deleteListLeng,
            header;

            if(modifyLeng > 0){
                dms.notification.warning("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                saveList = [];
                return false;
            }

            header = {
                mvtTp:mvtType
                ,etcGiDocNo:$('#etcGiDocNo').val()
                ,updtDtStr:$("#updtDtStr").val()
            };

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);

                if(!dms.string.isEmpty(gridData.itemCd)){
                    if(dms.string.isEmpty(gridData.strgeMoveStockQty) || gridData.strgeMoveStockQty == 0){
                        // 수량을 입력하십시오.
                        dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${qty}'/>");
                        saveList = [];
                        return false;
                    }

                    if(dms.string.isEmpty(gridData.itemCd)){
                        // 부품을 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                        saveList = [];
                        return false;
                    }

                    if(dms.string.isEmpty(gridData.giStrgeCd)){
                        // 창고를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${giStrgeCd}'/>");
                        saveList = [];
                        return false;
                    }

                    if(dms.string.isEmpty(gridData.grStrgeCd)){
                        // 창고를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                        saveList = [];
                        return false;
                    }

                    if(gridData.giStrgeCd === gridData.grStrgeCd){
                        // 창고를 선택하십시오
                        dms.notification.warning("<spring:message code='par.err.chkStockMoveSameStrgeCd'/>");
                        saveList = [];
                        return false;
                    }

                    saveList.push(gridData);
                }
            });

            if(saveList.length > 0){
                var data ={
                    "stockMovStorageHeaderVO":header
                    ,"stockMovStorageDetailList":saveList
                };

                $.ajax({
                    url:"<c:url value='/par/stm/stockMovement/createStockMovStorageCnfm.do' />"
                    ,data:kendo.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:true
                    ,success:function(result) {

                        if(result.resultYn == true){

                           pEtcGiDocNo = $('#etcGiDocNo').val();
                           fnSetButton('02');
                           // 부품기타출고 조회.
                           selectEtcIssue(pEtcGiDocNo);

                           dms.notification.success("<spring:message code='par.info.storageMovingCnfmSuccMsg'/>");

                       } else {
                           if(result === 0){
                               dms.notification.error("<spring:message code='par.lbl.strgeMoveDocNo' var='strgeMoveDocNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${strgeMoveDocNo}'/>");
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

    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call
            pageInit();
        }
    });

    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });

    //btnPrint
    $("#btnPrint").kendoButton({
        enable:false
        ,click:function(e){
            if(dms.string.isEmpty($('#etcGiDocNo').val())){
                //{기타출고번호}은(는) 필수 입력사항 입니다.
                dms.notification.info("<spring:message code='par.lbl.strgeMoveDocNo' var='arguMsg' /><spring:message code='global.info.required.field' arguments='${arguMsg}'/>");
                return;
            }
            //param title, url, viewId, isReload
            parent._createOrReloadTabMenu("<spring:message code='par.title.giPrintDoc' />", "<c:url value='/ReportServer?reportlet=par/selectStoragePrintMain.cpt'/>&sDlrCd=${dlrCd}&sEtcGiDocNo="+$('#etcGiDocNo').val(),"VIEW-D-12647", true);
        }
    });
    //btnExcelUpload
    $("#btnExcelUpload").kendoButton({
        click:function(e){
            //selectStorgeItemExcelUploadPopupWindow Func call
            selectStorgeItemExcelUploadPopupWindow();
        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
        click:function(e){
            //selectStorageItemPopupWindow Func call
            selectItemSalePrcPopupWindow();
        }
    });
    //btnDel
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#storageMoveGrid").data("kendoExtGrid"),
                rows = grid.select();

            rows.each(function(index, row) {
                var l_rowData = grid.dataItem(row);
                delete popItemObj[l_rowData.itemCd][l_rowData.giStrgeCd];

            });

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });
    //sMvtTp
    $("#sMvtTp").kendoExtDropDownList({
        dataSource:mvtTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
    });

    $("#sMvtTp").data("kendoExtDropDownList").enable(false);
    //sOutStrgeCd
    $("#sOutStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:true
        ,index:6
    });
    //sInStrgeCd
    $("#sInStrgeCd").kendoExtDropDownList({
        dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:giStrgeCdList
        ,optionLabel:" "
        ,autoBind:true
        ,index:6
    });

    /**
     * grid 단가&수량
     */
    changeAmtEditor = function(container, options) {
        var input = $("<input/>"),
        pValue;

        input.attr("name", options.field);

        input.keyup(function(){
            if(options.field === 'strgeMoveStockQty'){
                pValue = $(this).val();
                options.model.set("movingAvgAmt", options.model.movingAvgPrc * pValue);
            }
        });
        input.blur(function(){

            calTotalQty();
        });

        input.appendTo(container);
        if(options.field === 'strgeMoveStockQty') {
            input.kendoExtNumericTextBox({
                format:"n2"
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
    giStrgeCdDropDownEditor = function(container, options){

        $('<input data-bind="value:' + options.field + '"  />')
        .appendTo(container)
        .kendoExtDropDownList({
            dataTextField: "cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,change:function(e){
                options.model.set('giLocCd','');
            }
        });
    };

    giLocCdDropDownEditor = function(container, options){

        var itemCd = options.model.itemCd,
        strgeCd = options.model.giStrgeCd;

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

    /**
    * grid 입고창고 DropDownList
    */
    grStrgeCdDropDownEditor = function(container, options){

        $('<input data-bind="value:' + options.field + '"  />')
        .appendTo(container)
        .kendoExtDropDownList({
            dataTextField: "cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,change:function(e){
                if(!dms.string.isEmpty(locationListObj[options.model.itemCd])){
                    if(!dms.string.isEmpty(locationListObj[options.model.itemCd][options.model.grStrgeCd])){
                        options.model.set('grLocCd',locationListObj[options.model.itemCd][options.model.grStrgeCd][0].cmmCd);
                    }else{
                        options.model.set('grLocCd','');
                    }
                }else{
                    options.model.set('grLocCd','');
                }
            }
        });
    };

    grLocCdDropDownEditor = function(container, options) {

        var itemCd = options.model.itemCd,
        strgeCd = options.model.grStrgeCd;

        if(!dms.string.isEmpty(locationListObj[itemCd])){
            $('<input data-bind="value:' + options.field + '"  />')
            .appendTo(container)
            .kendoExtDropDownList({
                dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:locationListObj[itemCd][strgeCd]
                ,optionLabel:" "
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                }
             });
        }
    };
    //storageMoveGrid
    $("#storageMoveGrid").kendoExtGrid({
        gridId:"G-PAR-1221-102201"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/stm/stockMovement/selectStockMovStorageItemByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sEtcGiDocNo"] = $("#etcGiDocNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"etcGiDocNo"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,etcGiDocNo:{ type:"string", validation:{required:true}, editable:false }
                        ,etcGiDocLineNo:{ type:"number", validation:{required:true}, editable:false }
                        ,cancYn:{ type:"string", validation:{required:true}, editable:false }
                        ,itemCd:{ type:"string", validation:{required:true}, editable:false }
                        ,itemNm:{ type:"string", validation:{required:true}, editable:false }
                        ,unitCd:{ type:"string", validation:{required:true}, editable:false }
                        ,strgeStockQty:{ type:"number" , editable:true}
                        ,strgeMoveStockQty:{ type:"number" , editable:true}
                        ,movingAvgPrc:{ type:"number" , editable:true}
                        ,movingAvgAmt:{ type:"number" , editable:true}
                        ,giDt:{ type:"date" , editable:false }
                        ,giStrgeCd:{ type:"string"}
                        ,giLocCd:{ type:"string"}
                        ,giStockQty:{ type:"number" , editable:true}
                        ,giAvlbStockQty:{ type:"number" , editable:true}
                        ,giResvStockQty:{ type:"number" , editable:true}
                        ,giRentQty:{ type:"number" , editable:true}
                        ,giBorrowQty:{ type:"number" , editable:true}
                        ,grStrgeCd:{ type:"string"}
                        ,grLocCd:{ type:"string" }
                        ,grReasonCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,mvtDocYyMm:{ type:"string" , validation:{required:true}, editable:false }
                        ,mvtDocNo:{ type:"string" , validation:{required:true}, editable:false }
                        ,mvtDocLineNo  :{ type:"number" , validation:{required:true}, editable:false }
                        ,regUsrId:{ type:"string" , editable:false }
                    }
                }
                ,data:function (result){
                    var dataLen = result.data.length,
                    gridData = $("#storageMoveGrid").data("kendoExtGrid"),
                    itemList = [];

                    for(var i = 0; i < dataLen; i = i + 1){
                        if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                            popItemObj[result.data[i].itemCd][result.data[i].giStrgeCd] = result.data[i].itemNm;
                        }else{
                            popItemObj[result.data[i].itemCd] = {};
                            popItemObj[result.data[i].itemCd][result.data[i].giStrgeCd] = result.data[i].itemNm;
                        }
                    }

                    return result.data;
                }
            }
        }
        ,edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;

            if(!dms.string.isEmpty(e.model.mvtDocNo)) {//수불발생 시
                if(fieldName=="grStrgeCd" || fieldName=="grReasonCd" || fieldName=="strgeMoveStockQty"){
                    this.closeCell();
                }
            }

            if(fieldName === "movingAvgPrc" || fieldName === "movingAvgAmt" || fieldName === "giStockQty" || fieldName === "giAvlbStockQty" || fieldName === "giResvStockQty" || fieldName === "giBorrowQty" || fieldName === "giRentQty"
              ||fieldName=="giStrgeCd"||fieldName=="giLocCd"||fieldName=="grLocCd"){
                this.closeCell();
            }
        }
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,indvColumnRows:5
        ,multiSelectWithCheckbox:true
        ,filterable:false
        ,appendEmptyColumn:true
        ,dataBound:function(e){

            var rows = e.sender.tbody.children();
            var totItemQty = 0;
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem != null && dataItem != 'undefined'){
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                    var grStrgeCd = row.children().eq(5);
                    var grReasonCd = row.children().eq(13);
                    var strgeMoveStockQty = row.children().eq(14);

                    totItemQty += dataItem.strgeMoveStockQty;

                    if(dataItem.mvtDocNo == "" || dataItem.mvtDocNo == null){//수불발생 전
                        grStrgeCd.addClass("bg_white");
                        grReasonCd.addClass("bg_white");
                        strgeMoveStockQty.addClass("bg_white");
                    }
                }
            });

            $("#itemQty").data("kendoExtNumericTextBox").value(totItemQty);

        }
        ,columns:[
             {field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:100 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
            ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.orgStrgeCd' />", width:120
                ,template:'#= changeStrgeCd(giStrgeCd)#'
            }//giStrgeCd(입고창고)
            ,{field:"giLocCd", title:"<spring:message code='par.lbl.orgLocCd' />", width:100
                //,template:'#= changeLocCd(giStrgeCd, giLocCd)#'
                //,editor:giLocCdDropDownEditor
                //,template:'#= changeLocCd(giStrgeCd, giLocCd)#'
            }//giLocCd
            ,{field:"grStrgeCd", title:"<spring:message code='par.lbl.newStrgeCd' />", width:120
                ,editor:grStrgeCdDropDownEditor
                ,template:'#= changeStrgeCd(grStrgeCd)#'
            }//grStrgeCd
            ,{field:"grLocCd", title:"<spring:message code='par.lbl.newLocCd' />", width:80
                ,editor:grLocCdDropDownEditor
                ,template:'#= changeLocCd(grStrgeCd, grLocCd)#'
                ,hidden:true
            }//grLocCd
            ,{field:"giStockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80 }//장면재고
            ,{field:"giAvlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80 }//현재고
            ,{field:"giResvStockQty" ,title:"<spring:message code='par.lbl.realResvStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80 }//예류수량
            ,{field:"giRentQty" ,title:"<spring:message code='par.lbl.transferQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80 }//대출(차출)수량
            ,{field:"giBorrowQty" ,title:"<spring:message code='par.lbl.loanQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80 }//차입수량
            ,{field:"etcGiDocNo", title:"<spring:message code='par.lbl.strgeMoveDocNo'/>", width:150 }
            ,{field:"grReasonCd", title:"<spring:message code='par.lbl.strgeMoveReason' />", width:200
                ,editor:function(container, options){
                    var input = $('<input id="grReasonCd" name="grReasonCd" data-bind="value:' + options.field + '" maxLength="30" style="width:100%"  />')
                    .appendTo(container);
                }
            }//grReasonCd
            ,{field:"strgeMoveStockQty", title:"<spring:message code='par.lbl.strgeMoveQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}"
                ,editor:changeAmtEditor
            }//strgeMoveStockQty
            ,{field:"strgeStockQty", title:"<spring:message code='par.lbl.strgeMoveQty' />" ,width:80 ,attributes:{ "class":"ar"} ,format:"{0:n2}"
                ,editor:changeAmtEditor
                ,hidden:true
            }//strgeStockQty
            ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />"
                ,width:80
                ,attributes:{ "class":"ar"}
                ,format:"{0:n2}"}//movingAvgPrc
            ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost' />"
                ,width:80
                ,attributes:{ "class":"ar"}
                ,format:"{0:n2}"}//movingAvgAmt
            ,{field:"giDt", title:"<spring:message code='par.lbl.strgeMoveGenDt'/>"
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,width:90
             }
            ,{field:"regUsrId", title:"<spring:message code='par.lbl.stockMovWorker'/>" ,width:90
                ,template:'#= changeUserCd(regUsrId)#'
            }
        ]
    });

    //사용자
    changeUserCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = userCdMap[val];
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
    changeLocCd = function(strgeCd, locCd){
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
    //초기화.
    pageInit();
});

//item search Popup Func
function selectStorageItemPopupWindow(e){

    if($("#sOutStrgeCd").val() === ""){
        //giStrgeCd check
        dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='global.info.check.field' arguments='${giStrgeCd}' />");
        return;
    }

    searchStorgeItemPopupWindow = dms.window.popup({
        windowId:"searchStorgeItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   //itemInfo
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectStorageItemAvlbPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"autoClose":true
                ,"selectable":"multiple"
                ,"strgeCd":$("#sOutStrgeCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        var dataLen = data.length;

                        for(var i=0; i<dataLen; i++){
                            var bCheck = false;
                            var lLocCd;
                            var grid = $('#storageMoveGrid').data('kendoExtGrid');
                            var checkRows = grid.tbody.find("tr");
                            checkRows.each(function(index, checkRow) {
                                var dataItem = grid.dataItem(checkRow);
                                if(dataItem.itemCd == data[i].itemCd){
                                    bCheck = true;
                                }
                            });

                            if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].giStrgeCd])){
                                    lLocCd = locationListObj[data[i].itemCd][data[i].giStrgeCd][0].cmmCd;
                                }else{
                                    lLocCd = '';
                                }
                            }else{
                                lLocCd = '';
                            }

                            if(!bCheck){
                                if(data[i].baseAvlbStockQty > 0){
                                    var total = $("#storageMoveGrid").data("kendoExtGrid").dataSource.total()+1;
                                    BinLocationItemVO = {
                                        rnum:total + 1
                                        ,dlrCd:null
                                        ,etcGiDocNo:$("#etcGiDocNo").val()
                                        ,etcGiDocLineNo:total + 1
                                        ,cancYn:"N"
                                        ,itemCd:data[i].itemCd
                                        ,itemNm:data[i].itemNm
                                        ,unitCd:data[i].unitCd
                                        ,strgeStockQty:data[i].baseAvlbStockQty
                                        ,strgeMoveStockQty:1
                                        ,giStrgeCd:data[i].strgeCd
                                        ,giLocCd:lLocCd
                                        ,grStrgeCd:$("#sInStrgeCd").val()
                                        ,grLocCd:""
                                        ,grReasonCd:null
                                        ,mvtDocYyMm:""
                                        ,mvtDocNo:""
                                        ,mvtDocLineNo:0
                                    }
                                    $("#storageMoveGrid").data("kendoExtGrid").dataSource.add(BinLocationItemVO).set("dirty", true);
                                }
                            }
                        }

                    }
                }
            }
        }
    });
}

//storage item excel file upload Popup Func
function selectStorgeItemExcelUploadPopupWindow(){

    storageItemExcelUploadPopupWin = dms.window.popup({
        windowId:"storageItemExcelUploadPopupWin"
        ,title:"<spring:message code='par.title.stmMovExcelUpload' />"//stmMovExcelUpload
        ,width:900
        ,height:340
        ,content:{
            url:"<c:url value='/par/cmm/selectStorageItemExcelUploadPopup.do'/>"
            ,data:{
                "strgeCd":$("#sOutStrgeCd").val()
                ,"autoClose":true
                ,"callbackFunc":function(data){

                    var dataLen = data.length,
                    gridData = $("#storageMoveGrid").data("kendoExtGrid"),
                    popItemData = {},
                    itemList = [],
                    amt,
                    tDate,
                    rows;

                    for(var i = 0; i < dataLen; i = i + 1){
                        //금액
                        amt = Number(data[i].strgeMoveStockQty) * Number(data[i].movingAvgPrc);

                        //내용
                        popItemData.itemCd             = data[i].itemCd;
                        popItemData.itemNm             = data[i].itemNm;
                        popItemData.unitCd             = data[i].unitCd;
                        popItemData.strgeMoveStockQty  = data[i].strgeMoveStockQty;
                        popItemData.giStrgeCd          = data[i].giStrgeCd;
                        popItemData.giLocCd            = data[i].giLocCd;
                        popItemData.grStrgeCd          = data[i].grStrgeCd;
                        popItemData.grLocCd            = data[i].grLocCd;
                        popItemData.grReasonCd         = data[i].grReasonCd;
                        popItemData.grStockQty         = data[i].grStockQty;
                        popItemData.grAvlbStockQty     = data[i].grAvlbStockQty;
                        popItemData.grResvStockQty     = data[i].grResvStockQty;
                        popItemData.giStockQty         = data[i].giStockQty;
                        popItemData.giAvlbStockQty     = data[i].giAvlbStockQty;
                        popItemData.giResvStockQty     = data[i].giResvStockQty;
                        popItemData.strgeStockQty      = data[i].giAvlbStockQty;
                        popItemData.giBorrowQty        = data[i].borrowQty;
                        popItemData.giRentQty          = data[i].rentQty;
                        popItemData.movingAvgPrc       = data[i].movingAvgPrc;
                        popItemData.movingAvgAmt       = amt;
                        popItemData.regUsrId           = "${userId}";
                        popItemData.mvtDocNo           = "";

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
                    dms.loading.hide();
                    storageItemExcelUploadPopupWin.close();

                    calTotalQty();
                }
            }
        }
    });
}


//부품 팝업 열기 함수.
function selectItemSalePrcPopupWindow(){

    selectShareStockGiItemPopupWindow = dms.window.popup({
        windowId:"ItemMasterPopup"
        ,title:"<spring:message code='par.title.partSearch' />"
        ,width:900
        ,height:550
        ,content:{
            url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
            ,data:{
                "type":""
                ,"autoBind":true
                ,"itemDstinCd":'02'
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){

                    var dataLen = data.length,
                    gridData = $("#storageMoveGrid").data("kendoExtGrid"),
                    popItemData = {},
                    itemList = [],
                    tDate,
                    amt,
                    rows;

                    for(var i = 0; i < dataLen; i = i + 1){

                        amt = Number(data[i].giQty) * Number(data[i].movingAvgPrc);

                        popItemData.itemCd = data[i].itemCd;
                        popItemData.itemNm = data[i].itemNm;
                        popItemData.unitCd = data[i].stockUnitCd;
                        popItemData.grReasonCd = "";
                        popItemData.strgeMoveStockQty = data[i].giQty;
                        popItemData.strgeStockQty = data[i].avlbStockQty;
                        popItemData.movingAvgPrc = data[i].movingAvgPrc;
                        popItemData.movingAvgAmt = data[i].movingAvgPrc;
                        popItemData.giStrgeCd = data[i].giStrgeCd;//입고창고
                        popItemData.giLocCd = data[i].giLocCd;
                        popItemData.giStockQty = data[i].stockQty;
                        popItemData.giAvlbStockQty = data[i].avlbStockQty;
                        popItemData.giResvStockQty = data[i].resvStockQty;
                        popItemData.giBorrowQty = data[i].borrowQty;
                        popItemData.giRentQty = data[i].rentQty;
                        popItemData.grStrgeCd = "";//부품추가 시 이동창고 공백처리.
                        popItemData.grLocCd = "";
                        popItemData.regUsrId = "${userId}";
                        popItemData.mvtDocNo = "";

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

                    calTotalQty();

                }
            }
        }
    });
}

//부품 팝업 열기 함수.
function selectEtcGiDocListPopupWindow(){

    stockMovStorageListPopupWindow = dms.window.popup({
        windowId:"purcOrdListPopup"
        ,title:"<spring:message code='par.title.stockMovStorage' />"
        ,width:650
        ,height:390
        ,content:{
            url:"<c:url value='/par/cmm/selectStockMovStorageListPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"mvtTp":$("#sMvtTp").data("kendoExtDropDownList").value()
                ,"mvtTpNm":$("#sMvtTp").data("kendoExtDropDownList").text()
                ,"etcGiDocNo":$("#etcGiDocNo").val()
                ,"selectable":"single"
                ,"callbackFunc":function(data){
                    if(data.length === 1){
                        $("#etcGiDocNo").val(data[0].etcGiDocNo);
                        pEtcGiDocNo = data[0].etcGiDocNo;
                        selectEtcIssue(pEtcGiDocNo);
                    }
                    stockMovStorageListPopupWindow.close();
                }
            }
        }
    });
}

//부품기타출고 정보 조회.
function selectEtcIssue(pEtcGiDocNo){

    $.ajax({
        url:"<c:url value='/par/stm/stockMovement/selectStockMovStorageHeaderByKey.do' />",
        data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }

    }).done(function(result) {
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            partsJs.validate.groupObjAllDataSet(result);

            $("#storageMoveGrid").data("kendoExtGrid").dataSource.read();

            gCrud = "U";

            fnSetButton(result.statCd);
            $("#btnPrint").data("kendoButton").enable(true);

    });
}

function fnSetButton(pType){
    if(pType === '01'){
        $("#btnCancel").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(true);
        $("#btnCnfm").data("kendoButton").enable(true);
        $("#btnSetStrgeCdPop").data("kendoButton").enable(true);
        $("#btnAdd").data("kendoButton").enable(true);
        $("#btnDel").data("kendoButton").enable(true);
    }else if(pType === '02'){
        $("#btnCancel").data("kendoButton").enable(true);
        $("#btnSave").data("kendoButton").enable(false);
        $("#btnCnfm").data("kendoButton").enable(false);
        $("#btnSetStrgeCdPop").data("kendoButton").enable(false);
        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnDel").data("kendoButton").enable(false);
    }else if(pType === '03'){
        $("#btnCancel").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(false);
        $("#btnCnfm").data("kendoButton").enable(false);
        $("#btnSetStrgeCdPop").data("kendoButton").enable(false);
        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnDel").data("kendoButton").enable(false);
    }else{
        $("#btnCancel").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(true);
        $("#btnCnfm").data("kendoButton").enable(false);
        $("#btnSetStrgeCdPop").data("kendoButton").enable(true);
        $("#btnAdd").data("kendoButton").enable(true);
        $("#btnDel").data("kendoButton").enable(true);
    }

}
//총창고이동수량계산
function calTotalQty(){
    var rows = $("#storageMoveGrid").data("kendoExtGrid").tbody.find("tr"),
    itemQty = 0;

    //금액계산
    rows.each(function(index, row) {

       data = $("#storageMoveGrid").data("kendoExtGrid").dataItem(rows[index]);

        if(!dms.string.isEmpty(data.strgeMoveStockQty) && (data.strgeMoveStockQty > 0)){
            itemQty += Number(data.strgeMoveStockQty);
        }

        $("#itemQty").data("kendoExtNumericTextBox").value(itemQty);
    });
}

</script>
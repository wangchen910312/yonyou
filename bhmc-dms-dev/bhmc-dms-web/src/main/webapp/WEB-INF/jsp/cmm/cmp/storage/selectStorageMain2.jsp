<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">
   <!-- 창고목록 -->
   <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="cmm.title.strgeInfoMng" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11512" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11511" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m btn_m_min btn_save"><spring:message code="par.btn.fix" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11510" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnAdd" class="btn_m btn_m_min btn_add"><spring:message code="par.btn.rowAdd" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11509" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDel" class="btn_m btn_m_min btn_delete"><spring:message code="par.btn.rowDel" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11508" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button>
            </dms:access>
            </div>
        </div>

        <!-- 창고조회 -->
        <div class="table_form hidden" role="search" data-btnid="btnSearch">
            <input id="sDlrCd" type="hidden" value="${dlrCd}" />
            <input id="sPltCd" type="hidden" value="${pltCd}" />
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.strgeCd' /></th>
                        <td>
                            <input id="sStrgeCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.strgeNm' /></th>
                        <td>
                            <input id="sStrgeNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><%-- <spring:message code='global.lbl.locMngYn' /> --%></th>
                        <td>
                            <input id="sLocMngYn" type="text" class="form_comboBox hidden" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //창고조회 -->
        <div class="table_grid">
            <div id="gridStrge" class="grid"></div>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12592" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnStrgeManagerAdd" name="btnStrgeManagerAdd" class="btn_s btn_s_min5"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12591" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnStrgeManagerDel" name="btnStrgeManagerDel" class="btn_s btn_s_min5"><spring:message code="par.btn.del" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12590" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnStrgeManagerSave" name="btnStrgeManagerSave" class="btn_s btn_s_min5"><spring:message code="par.btn.save" /></button>
            </dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <div class="table_grid">
        <div id="gridStrgeManager" class="resizable_grid"></div>
    </div>

    </section>

</div>
<!-- script -->
<script type="text/javascript">
    //창고유형
    var strgeTpList = [],
    strgeTpMap = [],
    selectedRowHeaderItem,
    userSearchPopupWin;

    <c:forEach var="obj" items="${strgeTpList}">
    strgeTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //창고유형 Map
    $.each(strgeTpList, function(idx, obj){
        strgeTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //사용자 조회 팝업.
    function salePrsnSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"//user select
            ,width:840
            ,height:500
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(userData){

                        for(var i=0; i<userData.length; i++){
                            var data = userData[i];

                            var itemCheckCnt = 0,
                            grid = $("#gridStrgeManager").data("kendoExtGrid"),
                            items = grid.dataSource.view(),
                            length = items.length;

                            for (j = length-1; j>=0;j--) {
                                dataItem = items[j];
                                //중복부품처리.
                                if(dataItem.usrId === data.usrId){
                                    itemCheckCnt++;
                                }
                            }

                            if(itemCheckCnt === 0){
                                $("#gridStrgeManager").data('kendoExtGrid').dataSource.insert(0, {
                                    "dlrCd":$("#sDlrCd").val()
                                    ,"strgeCd":selectedRowHeaderItem.strgeCd
                                    ,"usrId":data.usrId
                                    ,"usrNm":data.usrNm
                                }).set("dirty", true);
                            }
                        }
                        userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function buttonEnableDisable(bFlag){

        $("#btnStrgeManagerAdd").data("kendoButton").enable(bFlag);
        $("#btnStrgeManagerDel").data("kendoButton").enable(bFlag);
        $("#btnStrgeManagerSave").data("kendoButton").enable(bFlag);
    }

    function pageInit(){
        buttonEnableDisable(false);
        $("#gridStrge").data('kendoExtGrid').dataSource.read();
    }

    $(document).ready(function() {

        //조회조건 - 로케이션관리여부
        $("#sLocMngYn").kendoExtDropDownList({
            dataSource:["","Y","N"]
            ,index:0
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                pageInit();
            }
        });
        // 창고 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                pageInit();
            }
        });
        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $("#gridStrge").data('kendoExtGrid').dataSource.insert(0, {
                    "dlrCd":$("#sDlrCd").val()
                    ,"pltCd":$("#sPltCd").val()
                    ,"netingUseYn":"N"
                    ,"locMngYn":"N"
                    ,"strgeCd":""
                    ,"strgeNm":""
                    ,"strgeTp":""
                    ,"strgeCreDt":new Date("${sysStartDate}")
                    ,"strgeRegPrsnNm":"${userNm}"
                    ,"dbYn":"N"
                    ,"strgeSaleDelYn":"Y"
                    ,"ptStockStrgeCnt":0
                    ,"ptMasterGrStrgeCnt":0
                    ,"ptMasterGiStrgeCnt":0
                    ,"ptBinStrgeCnt":0
                });
            }
        });
        //버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#gridStrge").data("kendoExtGrid"),
                    rows = grid.select(),
                    saveData = {},
                    itemUseCnt = 0,
                    saleStrgeUseCnt = 0;

                if (rows.length !== 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.selectOneRowMsg'/>");
                    return false;
                }

                //grid dataSource Deleting item checked
                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row);

                    if(dataItem.ptStockStrgeCnt > 0 || dataItem.ptMasterGrStrgeCnt > 0  || dataItem.ptMasterGiStrgeCnt > 0 || dataItem.ptBinStrgeCnt > 0 ){
                        itemUseCnt++;
                    }

                    if(dataItem.strgeSaleDelYn == "N"){
                        saleStrgeUseCnt++;
                    }

                    saveData = {
                        strgeCd: dataItem.strgeCd
                    };
                });

                if(itemUseCnt > 0){
                    dms.notification.info("<spring:message code='global.lbl.strge' var='strge' /><spring:message code='par.info.itemUseMsg' arguments='${strge}' />");
                    return false;

                }else if(saleStrgeUseCnt > 0){
                    dms.notification.info("<spring:message code='par.info.notDelSaleStrgeInfoMsg' />");
                    return false;
                }else{
                    //삭제 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.delYn' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();
                            //grid dataSource Deleting.
                            $.ajax({
                                url:"<c:url value='/cmm/cmp/storage/deleteStorage.do' />",
                                data:JSON.stringify(saveData),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(jqXHR, textStatus) {

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.page(1);

                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");
                                }
                            });
                        }
                        conformKendoWindow.close();
                    }).end();
                }
            }
        });
        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#gridStrge").data("kendoExtGrid");
                rows = grid.dataSource.data(),
                strgeCdEmptyCheckCnt = 0,
                strgeNmEmptyCheckCnt = 0,
                strgeTpEmptyCheckCnt = 0;
                //checked list
                $.each(rows, function(idx, row){
                    var item = row;
                    if(item.dbYn == "N"){
                        if(dms.string.isEmpty(item.strgeCd)){
                            strgeCdEmptyCheckCnt++;
                        }
                        if(dms.string.isEmpty(item.strgeNm)){
                            strgeNmEmptyCheckCnt++;
                        }
                        if(dms.string.isEmpty(item.strgeTp)){
                            strgeTpEmptyCheckCnt++;
                        }
                    }
                });

                if(strgeCdEmptyCheckCnt > 0){
                    //strgeCd check message.
                    dms.notification.info("<spring:message code='global.lbl.strgeCd' var='strgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${strgeCd}' />");
                    return false;
                }

                if(strgeNmEmptyCheckCnt > 0){
                    //strgeNm check message.
                    dms.notification.info("<spring:message code='global.lbl.strgeNm' var='strgeNm' /><spring:message code='par.info.issueCheckMsg' arguments='${strgeNm}' />");
                    return false;
                }

                if(strgeTpEmptyCheckCnt > 0){
                    //strgeTp check message.
                    dms.notification.info("<spring:message code='global.lbl.strgeTp' var='strgeTp' /><spring:message code='par.info.issueCheckMsg' arguments='${strgeTp}' />");
                    return false;
                }

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0){
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return false;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/cmm/cmp/storage/multiStorages.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });
        //버튼 - 창고담당자 추가
        $("#btnStrgeManagerAdd").kendoButton({
            enable:false
            ,click:function(e) {

                var strgeCd = selectedRowHeaderItem.strgeCd;

                if(strgeCd == ""){
                    dms.notification.info("<spring:message code='par.lbl.strgeNm' var='strgeNm' /><spring:message code='par.info.stdPrcSelectMsg' arguments='${strgeNm}'  />");
                    return false;
                }else{
                    salePrsnSearchPopup();
                }
            }
        });
        //버튼 - 창고담당자 삭제
        $("#btnStrgeManagerDel").kendoButton({
            enable:false
            ,click:function(e) {

                var grid = $("#gridStrgeManager").data("kendoExtGrid"),
                items = grid.dataSource.view(),
                rows = grid.tbody.find('>tr'),
                length = items.length,
                rowCnt = 0,
                item,
                i,
                elementRow,
                removeList = [];

                //delete item checked
                $.each(rows, function(index, row){
                    item = grid.dataItem(row);
                    elementRow = grid.tbody.find(".checkbox01")[index];

                    if(elementRow.checked){
                        //delete item adding.
                        removeList[item.uid] = true;
                        rowCnt++;
                    }
                });

                if(rowCnt == 0){
                    //delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                    return false;
                }
                else{
                    //삭제 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.delYn' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();
                            //grid dataSource Deleting.
                            for (i = length-1; i>=0; i--) {
                                item = items[i];
                                if(removeList[item.uid]){
                                    grid.dataSource.remove(item);
                                }
                            }
                        }
                        conformKendoWindow.close();
                    }).end();
                }
            }
        });
        //버튼 - 창고담당자 저장
        $("#btnStrgeManagerSave").kendoButton({
            enable:false
            ,click:function(e) {

                var gridStrgeManager = $("#gridStrgeManager").data("kendoExtGrid");
                var parGridData = gridStrgeManager.getCUDData("insertList", "updateList", "deleteList");

                if (gridStrgeManager.cudDataLength == 0 ) {
                    dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                    return;
                }

                if (gridStrgeManager.gridValidation()) {

                    $.ajax({
                        url:"<c:url value='/cmm/cmp/storage/multiStorageManageres.do' />",
                        data:JSON.stringify(parGridData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {
                            gridStrgeManager.dataSource._destroyed = [];
                            $("#gridStrge").data("kendoExtGrid").dataSource.read();
                            gridStrgeManager.dataSource.read();
                            //success message
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //input value check message
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });
        //gridStrge
        $("#gridStrge").kendoExtGrid({
            gridId:"G-PAR-0726-143435"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/cmp/storage/selectStorages.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sStrgeCd"] = $("#sStrgeCd").val();
                            params["sStrgeNm"] = $("#sStrgeNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string", validation:{required:true}}
                            ,pltCd:{type:"string", validation:{required:true}}
                            ,pltNm:{type:"string", validation:{required:true}, editable:false}
                            ,strgeCd:{type:"string"}
                            ,strgeNm:{type:"string"}
                            ,strgeTp:{type:"string", validation:{required:true}}
                            ,strgeManagerList:{type:"string", editable:false}
                            ,netingUseYn:{type:"string", validation:{required:true}}
                            ,locMngYn:{type:"string", validation:{required:true}}
                            ,strgeCreDt:{type:"date", editable:false}
                            ,strgeRegPrsnNm:{type:"string", editable:false}
                            ,remark:{type:"string"}
                            ,dbYn:{type:"string"}
                            ,strgeSaleDelYn:{type:"string"}
                            ,ptStockStrgeCnt:{type:"number"}
                            ,ptMasterGrStrgeCnt:{type:"number"}
                            ,ptMasterGiStrgeCnt:{type:"number"}
                            ,ptBinStrgeCnt:{type:"number"}
                        }
                    }
                }
            }
            ,height:288
            ,pageable:true
            ,autoBind:true
            ,selectable:"row single"
            ,multiSelectWithCheckbox:false
            ,appendEmptyColumn:true//empty column. default:false
            ,filterable:false
            ,indvColumnRows:3
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                // complete close cell
                if (e.model.dbYn == "Y" ) {//DB저장유무
                    if(fieldName=="strgeCd" || fieldName=="strgeTp"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e){
                selectedRowHeaderItem = {};

                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined' && !dms.string.isEmpty(selectedItem.strgeCd)){
                    selectedRowHeaderItem = selectedItem;
                    buttonEnableDisable(true);
                    $("#gridStrgeManager").data("kendoExtGrid").dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                        var strgeCd = row.children().eq(0);
                        var strgeNm = row.children().eq(1);
                        var strgeTp = row.children().eq(2);
                        var remark = row.children().eq(6);

                        if(dataItem.dbYn == "N"){
                            strgeCd.addClass("bg_white");
                            strgeTp.addClass("bg_white");
                        }
                        strgeNm.addClass("bg_white");
                        remark.addClass("bg_white");

                    }
                });
            }
            ,columns:[
                {field:"strgeCd", title:"<spring:message code='global.lbl.strgeCd' />", width:250}
                ,{field:"strgeNm", title:"<spring:message code='global.lbl.strgeNm' />", width:250}
                ,{field:"strgeTp", title:"<spring:message code='global.lbl.strgeTp' />", width:120
                    ,attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<input required name="strgeTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:true
                            ,dataSource:strgeTpList
                            ,dataValueField:"cmmCd"
                            ,dataTextField:"cmmCdNm"
                        });
                        $('<span class="k-invalid-msg" data-for="strgeTp"></span>').appendTo(container);
                    }
                    ,template:"# if(strgeTpMap[strgeTp] !== undefined) { # #= strgeTpMap[strgeTp]# # }#"
                }
                ,{field:"strgeManagerList", title:"<spring:message code='par.lbl.strgeManager' />", width:100}
                ,{field:"strgeCreDt", title:"<spring:message code='par.lbl.strgeCreDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}//contractStartDt
                ,{field:"strgeRegPrsnNm", title:"<spring:message code='par.lbl.strgeRegPrsnNm' />", width:100
                    ,width:120
                    ,attributes:{"class":"editable-cell"}
                    ,editor:function(container, options){
                        $('<input name="strgeRegPrsnNm" data-bind="value:' + options.field + '" type="text" maxlength="10" />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                        });
                    }
                }//strgeRegPrsnNm
                ,{ field:"remark", title:"<spring:message code='par.lbl.remark' />", width:300 }//remark
            ]
        });
        //gridStrgeManager
        $("#gridStrgeManager").kendoExtGrid({
            gridId:"G-PAR-0217-144401"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/cmp/storage/selectStorgeManageres.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if (operation === "read") {

                            var params = {};
                            params["sort"] = options.sort;

                            params["sStrgeCd"] = selectedRowHeaderItem.strgeCd;

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"usrId"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string", validation:{required:true}}
                            ,strgeCd:{type:"string", validation:{required:true}}
                            ,usrId:{type:"string", validation:{required:true}}
                            ,usrNm:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,height:173
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,sortable:false
            ,selectable:"row single"
            ,editable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:false
            ,indvColumnRows:3
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });

                $(".checkbox01").bind("change", function (e) {
                    var row = $(this).closest("tr"),
                    checked = $(this).is(':checked');

                    var grid = $("#gridStrgeManager").data("kendoExtGrid");
                    if(checked){
                        row.addClass("k-state-selected");
                    }else{
                        row.removeClass("k-state-selected");
                    }
                });
            }
            ,change:function(){
                //checkbox checked setting.
                $("tr").find("[type=checkbox]").prop("checked",false);
                $("tr.k-state-selected").find("[type=checkbox]").prop("checked",true);
            }
            ,columns:[
                {
                    _field:"chkAll"
                    ,title:""
                    , width:40
                    ,attributes:{"class":"ac"}
                    ,template:"<input class='checkbox01' type='checkbox' />"
                    ,headerTemplate:"<input id='chkAll' type='checkbox' />"
                }
                ,{field:"strgeCd", title:"<spring:message code='global.lbl.strgeCd' />", width:100}
                ,{field:"usrId", title:"<spring:message code='par.lbl.strgeUsrId' />", width:100}
                ,{field:"usrNm", title:"<spring:message code='par.lbl.strgeUsrNm' />", width:100}
            ]
        });
        //grid checkbox all
        $("#chkAll").bind('click', function (e){
            var $chkAll = $(this);
            var checked = $chkAll.is(":checked");
            var grid = $("#gridStrgeManager").data("kendoExtGrid");
            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                dataItem.dirty = checked;

                var elementRow = grid.tbody.find(".checkbox01")[i];
                elementRow.checked = checked;
                if(checked){
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                }else{
                    grid.tbody.find("tr[data-uid='" + dataItem.uid + "']").removeClass("k-state-selected");
                }
            }
        });
    });

</script>
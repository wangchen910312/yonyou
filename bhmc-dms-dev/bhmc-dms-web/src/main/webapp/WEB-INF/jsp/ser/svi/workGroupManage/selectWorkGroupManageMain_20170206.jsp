<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 소조관리 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.wkgrpMng" /><!-- 소조관리 --></h1>
                <div class="btn_right">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    <button class="btn_m btn_save" id="btnMasterSave"><spring:message code="global.btn.save" /></button>
                </div>
            </div>
            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table  >
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:14%;">
                        <col style="width:9%;">
                        <col style="width:19%;">
                        <col style="width:9%;">
                        <col style="width:19%;">
                        <col style="width:9%;">
                        <col style="width:13%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.wkgrpNo" /><!-- 반조번호 --></th>
                            <td>
                                <input id="sWkgrpNo" type="text" class="form_input" maxlength="10"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.mngSaNm" /><%-- 반조관리자 --%></th>
                            <td>
                                <input id="sMngSaNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.wrkgrpStat" /><%-- 반조상태 --%></th>
                            <td>
                                <input id="sUseYn" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.wrkgrpCrDt" /><%-- 반조생성시간 --%></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRegFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRegToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <div class="btn_right">
                    <button class="btn_s btn_add btn_s_min5" id="btnMasterAdd"><spring:message code="global.btn.rowAdd" /></button>
                    <button class="btn_s btn_del btn_s_min5" id="btnMasterDel"><spring:message code="global.btn.rowDel" /></button>
                    <button class="btn_s btn_cancel btn_s_min5" id="btnMasterCancel"><spring:message code="global.btn.cancel" /></button>
                </div>
            </div>
             <!-- Grid 시작 -->
            <div class="table_grid">
                <div id="gridMaster"></div>
            </div>
            <!-- Grid 종료-->

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <div class="btn_right">
                    <button class="btn_s btn_add btn_s_min5" id="btnDetailAdd"><spring:message code="global.btn.add" /></button>
                    <button class="btn_s btn_save btn_s_min5" id="btnDetailSave"><spring:message code="global.btn.save" /></button>
                    <button class="btn_s btn_del btn_s_min5" id="btnDetailDel"><spring:message code="global.btn.del" /></button>
                </div>
            </div>
             <!-- Grid 시작 -->
            <div class="table_grid">
                <div id="gridDetail" class="resizable_grid"></div>
            </div>
            <!-- Grid 종료-->

            <input id="wkgrpNo" type="hidden" />
            <input id="dlrCd" type="hidden" />

        </section>
    </div>
</div>
<!-- //원인 코드마스터 -->

<!-- script -->
<script type="text/javascript">

    var popupWindow;

    var wkgrpStatList = [{"cmmCd":"","cmmCdNm":""}];
    <c:forEach var="obj" items="${wkgrpStatList}">
    wkgrpStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var wkgrpStatArr = dms.data.arrayToMap(wkgrpStatList, function(obj){return obj.cmmCd;});

    wkgrpStatGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(wkgrpStatArr[val] != undefined)
                returnVal = wkgrpStatArr[val].cmmCdNm;
        }
        return returnVal;
    };

    $(document).ready(function() {

        // 검색조건 : 반조상태
        $("#sUseYn").kendoExtDropDownList({
            dataSource:wkgrpStatList
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            ,index:0
        });

        // 반조생성일자(FROM)
        $("#sRegFromDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 반조생성일자(TO)
        $("#sRegToDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 검색
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#gridMaster").data("kendoExtGrid").dataSource.read();
            }
        });


        $("#gridMaster").kendoExtGrid({
            gridId:"G-SER-5019-174545"
            ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/ser/svi/workGroupManage/selectWorkGroupManages.do' />"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = "${dlrCd}";
                            params["sWkgrpNo"] = $("#sWkgrpNo").val();
                            params["sMngSaNm"] = $("#sMngSaNm").val();
                            params["sUseYn"] = $("#sUseYn").val();
                            params["sRegFromDt"] = $("#sRegFromDt").data("kendoExtMaskedDatePicker").value();
                            params["sRegToDt"] = $("#sRegToDt").data("kendoExtMaskedDatePicker").value();

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
                           rnum:{type:"number"}
                           ,wkgrpNo:{ type:"string" }
                           ,wkgrpNm:{ type:"string" }
                           ,dlrCd:{ type:"string" }
                           ,useYn:{ type:"string" }
                           ,mngSaId:{ type:"string" }
                           ,mngSaNm:{ type:"string" }
                      }
                   }
                }
            }
            ,height:300
            ,selectable:"row:single"
            ,pageable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,resizable:false
            ,edit:function(e){
                var fieldName = e.container.find("input").attr("name");
                if(!e.model.isNew()){
                    if(fieldName=="wkgrpNo"){
                        this.closeCell();
                    }
                }
            }
            ,change:function(e) {

                if(!e.sender.dataItem(e.sender.select()).isNew()){

                    var selectedVal = this.dataItem(this.select());

                    $("#wkgrpNo").val(selectedVal.wkgrpNo);
                    $("#dlrCd").val(selectedVal.dlrCd);

                    $("#btnDetailAdd").data("kendoButton").enable(true);
                    $("#btnDetailSave").data("kendoButton").enable(true);
                    $("#btnDetailDel").data("kendoButton").enable(true);

                    var gridDetail = $("#gridDetail").data("kendoExtGrid");
                    gridDetail.dataSource._destroyed = [];
                    gridDetail.dataSource.page(1);

                };
            }
            ,columns:[
                {field:"wkgrpNo", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100}    // 반조번호
                ,{field:"mngSaNm", title:"<spring:message code='ser.lbl.mngSaNm' />", width:100
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="mngSaNm" class="form_input" readonly="readonly" /><a href="#" onclick="techmanPopup()"></a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="mngSaNm"></span>')
                        .appendTo(container);
                    }
                }   // 반조관리자
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.dtiInfo' />", width:100}    // 내역
                ,{field:"wrkTp", title:"<spring:message code='ser.lbl.wrkTp' />", width:100}        // 업무유형
                ,{field:"useYn", title:"<spring:message code='ser.lbl.wrkgrpStat' />", width:100
                    ,template:"#=wkgrpStatGrid(useYn)#"
                    ,editor:function(container, options) {
                        $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataValueField:"cmmCd"
                            ,dataTextField:"cmmCdNm"
                            ,dataSource:wkgrpStatList
                        });
                    }
                }    // 반조상태
                ,{field:"mngSaId", hidden:true}
            ]
        });

        $("#gridDetail").kendoExtGrid({
            gridId:"G-SER-0519-174556"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/workGroupManage/selectWorkGroupDetails.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sWkgrpNo"] = $("#wkgrpNo").val();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string", editable:false}
                            ,lineNo:{type:"string", validation:{required:true}}
                            ,wkgrpNo:{type:"string", editable:false}
                            ,tecId:{type:"string", validation:{required:true}}
                            ,tecNm:{type:"string"}
                        }
                    }
                }
            }
            ,height:300
            ,selectable:"row:single"
            ,pageable:false
            ,autoBind:true
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                ,{field:"lineNo", title:"<spring:message code='ser.lbl.prefRank' />", width:100}           // 우선순위
                //,{field:"tecId", title:"<spring:message code='ser.lbl.tecId' />", width:100}               // 정비자ID
                ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:150}               // 정비자명
                ,{field:"jobNm", title:"<spring:message code='ser.lbl.jobNm' />", width:150}               // 직무명
                ,{field:"jobGrd", title:"<spring:message code='ser.lbl.jobGrd' />", width:150}               // 직무등급
            ]
        });


        validationCheck = function(e){

            var masterGrid = $("#gridMaster").data("kendoExtGrid");
            var msgText = "";
            var result = false;
            $.each(masterGrid.dataSource._data, function(idx, obj){
                if( dms.string.isEmpty(obj.wkgrpNo)){
                    msgText = "<spring:message code='ser.lbl.wkgrpNo' var='wkgrpNo' />"+
                                  "<spring:message code='global.info.required.field' arguments='${wkgrpNo}' />";
                    result = true;
                }else if( dms.string.isEmpty(obj.mngSaNm) ){
                    msgText = "<spring:message code='ser.lbl.mngSaNm' var='mngSaNm' />"+
                                  "<spring:message code='global.info.required.field' arguments='${mngSaNm}' />";
                    result = true;
                }else if( dms.string.isEmpty(obj.wkgrpNm) ){
                    msgText = "<spring:message code='ser.lbl.dtiInfo' var='dtiInfo' />"+
                                  "<spring:message code='global.info.required.field' arguments='${dtiInfo}' />";
                    result = true;
                }else if( dms.string.isEmpty(obj.useYn) ){
                    msgText = "<spring:message code='ser.lbl.wrkgrpStat' var='wrkgrpStat' />"+
                                  "<spring:message code='global.info.required.field' arguments='${wrkgrpStat}' />";
                    result = true;
                }
                return result;
            });

            if(result) dms.notification.warning(msgText);
            return result;
        };

        // 마스터 추가
        $("#btnMasterAdd").kendoButton({
            click:function(e) {

                var masterDs = $("#gridMaster").data("kendoExtGrid").dataSource;

                masterDs.insert(0,{
                    "dlrCd":"${dlrCd}"
                    ,"wkgrpNo":""
                    ,"wkgrpNm":""
                    ,"mngSaId":""
                    ,"mngSaNm":""
                    ,"useYn":"Y"
                });
            }
        });

        // 마스터 저장/수정
        $("#btnMasterSave").kendoButton({
            click:function(e) {

                var masterGrid = $("#gridMaster").data("kendoExtGrid");

                if(validationCheck())return;

                var saveData = masterGrid.getCUDData("insertList", "updateList", "deleteList");

                if(masterGrid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/ser/svi/workGroupManage/multiWorkGroupMasters.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(request,status,error){
                           //globalNotification.show("에러발생" + error, "error");
                        }
                        ,success:function(result, textStatus){
                             var gridMaster = $("#gridMaster").data("kendoExtGrid");
                             gridMaster.dataSource._destroyed = [];
                             gridMaster.dataSource.page(1);
                             dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                    });
                }
            }
        });

        // 마스터 삭제
        $("#btnMasterDel").kendoButton({
            click:function(e) {

                var grid = $("#gridMaster").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        //취소버튼
        $("#btnMasterCancel").kendoButton({

            click:function (e){
                var grid = $("#gridMaster").data("kendoExtGrid");
                grid.cancelChanges();
            }

        });

        var tecSearchPopup;

        // 디테일 저장/수정
        $("#btnDetailSave").kendoButton({
            click:function(e) {

                var detailGrid = $("#gridDetail").data("kendoExtGrid");
                var saveData = detailGrid.getCUDData("insertList", "updateList", "deleteList");

                if(detailGrid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/ser/svi/workGroupManage/multiWorkGroupDetails.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(request,status,error){
                            dms.loading.hide($("#resizableContainer"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);

                        }
                        ,success:function(result, textStatus){
                            var gridDetail = $("#gridDetail").data("kendoExtGrid");
                            gridDetail.dataSource._destroyed = [];
                            gridDetail.dataSource.page(1);
                            dms.notification.success("<spring:message code='global.info.success'/>");
                       }
                       ,beforeSend:function(xhr){
                           dms.loading.show($("#resizableContainer"));
                       }
                       ,complete:function(xhr,status){
                           dms.loading.hide($("#resizableContainer"));
                       }
                    });
                }
            }
        });

        // 디테일 삭제
        $("#btnDetailDel").kendoButton({
            click:function(e) {

                var grid = $("#gridDetail").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        $("#btnDetailAdd").data("kendoButton").enable(false);
        $("#btnDetailSave").data("kendoButton").enable(false);
        $("#btnDetailDel").data("kendoButton").enable(false);
    });

        techmanPopup = function() {
            tecSearchPopup = dms.window.popup({
                windowId:"teckManFnSearchWin"
                , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "callbackFunc":function(jsonObj) {

                             if(jsonObj.length > 0) {

                                var rows = $("#gridMaster").data("kendoExtGrid").tbody.find("tr");
                                rows.each(function(index, row) {
                                    var dataItem = $("#gridMaster").data("kendoExtGrid").dataSource._data;
                                    if($(this).hasClass("k-state-selected")){
                                        dataItem[index].mngSaId = jsonObj[0].tecId;
                                        dataItem[index].mngSaNm = jsonObj[0].tecNm;
                                        dataItem[index].dirty = true;
                                    }
                                });

                                $("#gridMaster").data("kendoExtGrid").refresh();
                            }
                        }
                    }
                }
            });
        };

        // 디테일 추가
        $("#btnDetailAdd").kendoButton({
            click:function(e) {
                tecSearchPopup = dms.window.popup({
                    windowId:"teckManFnSearchWin"
                        , title:"<spring:message code='ser.title.tecSearch' />"   // 정비자 조회
                        , content:{
                            url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                            , data:{
                                "autoBind":true
                                ,"selectable":"multiple"
                                , "callbackFunc":function(jsonObj) {

                                    if(jsonObj.length > 0) {

                                        var grid = $('#gridDetail').data('kendoExtGrid');
                                        var dataItem = grid.dataSource._data;
                                        var maxLineNo = 0;

                                        $.each(jsonObj, function(idx, data){

                                            var copyData;

                                            // 우선순위 생성
                                            if(grid.dataSource.total() != 0) {
                                                maxLineNo = dataItem[grid.dataSource.total()-1].lineNo;
                                            }

                                            var checkVal = true;

                                            // 중복값 체크
                                            $.each(dataItem, function(idx, obj){
                                                if(data.tecId == obj.tecId){
                                                    checkVal = false;
                                                }
                                            });

                                            if(checkVal) {
                                                copyData = {
                                                    lineNo:Number(maxLineNo) + 1              // 우선순위
                                                    ,tecId:data.tecId                         // 정비코드
                                                    ,tecNm:data.tecNm                         // 정비항목
                                                    ,dlrCd:$("#dlrCd").val()
                                                    ,wkgrpNo:$("#wkgrpNo").val()
                                                }

                                                grid.dataSource.add(copyData);
                                            }

                                        });
                                    }
                                }
                            }
                        }

                });
            }
        });
</script>

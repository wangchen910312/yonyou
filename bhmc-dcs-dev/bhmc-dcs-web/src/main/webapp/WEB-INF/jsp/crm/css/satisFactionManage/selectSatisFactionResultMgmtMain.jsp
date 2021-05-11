<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 만족도조사결과 시작 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.satisfactionMngBhmc" /></h1><!-- BHMC 만족도조사 결과 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12529" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_excel" id="btnCtlExcelImport"><spring:message code='global.btn.upload' /></button><!-- 업로드 上?-->
        </dms:access>
        <dms:access viewId="VIEW-I-12528" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_assignment" id="btnDist"><spring:message code='crm.lbl.distribute' /></button><!-- 배포 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12527" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12526" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnCtlSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
        </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnCtlSearch">
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
                    <th scope="row"><spring:message code="global.lbl.regDt" /></th><!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                        <div class="date_left">
                            <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" data-json-obj="true">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sRegDtTo" name="sRegDtTo" class="form_datepicker" data-json-obj="true">
                        </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="masterGrid"></div>
    </div>
</section>
<!-- //만족도조사결과 끝 -->
<!-- 만족도조사결과상세 시작 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.detail" /></h1><!-- 상세 -->
    </div>
    <div class="table_grid mt10">
        <div id="detailGrid" class="resizable_grid"></div>
    </div>
</section>
<!-- //만족도조사결과상세 끝 -->
</div>

<script type="text/javascript">

    var yesOrNoList = [];
    var yesOrNoMap = [];

    yesOrNoList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    yesOrNoList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    yesOrNoMap["Y"] = "<spring:message code='global.lbl.yes' />";
    yesOrNoMap["N"] = "<spring:message code='global.lbl.n' />";

    var excelUploadPopupWin;
    var gridColumns = [];

    $(document).ready(function() {

        var lastSelectedItem = "";

        $("#sRegDtFrom").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

      //버튼 - 일괄등록
        $("#btnCtlExcelImport").kendoButton({
            click:function(e) {
                excelUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='global.title.fileUpload' />"
                    ,windowId:"excelUploadPopupWin"
                    ,height:200
                    ,content:{
                        url:"<c:url value='/crm/css/satisFactionResultManage/selectSatisFactionResultExcelUploadPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(){
                                $('#masterGrid').data('kendoExtGrid').dataSource.read();
                            }
                        }
                    }
                });
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {
                var grid = $("#masterGrid").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/crm/css/satisFactionResultManage/multiSatisFactionResultMgmt.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,success:function(jqXHR, textStatus) {
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

        //버튼 - 배포
        $("#btnDist").kendoButton({
            click:function(e) {

                var grid = $("#masterGrid").data("kendoExtGrid")
                , dataItem = grid.dataItem(grid.select())
                ;

                if ( dms.string.isNotEmpty(dataItem.distDt)){
                    dms.notification.info("<spring:message code='crm.lbl.distribute' var='returnMsg' /><spring:message code='global.info.usedMsg' arguments='${returnMsg}' />");
                    return false;
                }
                var saveData = {};

                saveData["seq"] = dataItem.seq;
                saveData["distDt"] = new Date();

                if ( dms.string.isEmpty(dataItem.seq)){
                    dms.notification.info("<spring:message code='global.lbl.item' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                }

                $.ajax({
                    url:"<c:url value='/crm/css/satisFactionResultManage/updateDistSatisFactionResultMgmt.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        // 조회
        $("#btnCtlSearch").kendoButton({
            click:function(e) {

                var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                        (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                ){
                   dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
                }

                $("#masterGrid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
        $("#masterGrid").on("click", "tr.k-state-selected", function (e) {
             var grid = $("#masterGrid").data("kendoExtGrid")
                 , dataItem = grid.dataItem(grid.select())
             ;

             if (dataItem.seq !== lastSelectedItem) {
                 lastSelectedItem = dataItem.seq;

                 $("#detailGrid").data("kendoExtGrid").dataSource.read();
             }

        });

        // 전시장조사결과 시작 //
        $("#masterGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/css/satisFactionResultManage/selectSatisFactionResultMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                            var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sRegDtFrom"] = sRegDtFrom;
                            params["sRegDtTo"] = sRegDtTo;

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                        id:"seq"
                        ,fields:{
                            rnum:{type:"number"}
                            , titleNm:{type:"String", editable:true}
                            , regUsrNm:{type:"String", editable:false}
                            , regDt:{type:"date", editable:false}
                            , distDt:{type:"date", editable:false}
                            , distYn:{type:"String", editable:true}
                            , displayYn:{type:"String", editable:true}
                        }
                    }
                }
            }
            ,dataBinding:function(e) {
                lastSelectedItem = "";
                $("#detailGrid").data("kendoExtGrid").dataSource.data([]);
            }
            ,columns:[
                {field:"titleNm", title:"<spring:message code='global.lbl.title' />", width:300 // 제목
                    ,attributes:{"class":"al"}
                }
                ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:90 // 제목
                    ,attributes:{"class":"ac"}
                }
                ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:120, attributes:{"class":"ac"}
                    ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                ,{field:"distDt", title:"<spring:message code='par.lbl.distributeDt' />", width:120, attributes:{"class":"ac"}
                    ,template:"#if (distDt !== null ){# #= kendo.toString(data.distDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
//                 ,{field:"distYn", title:"<spring:message code='crm.lbl.distribute' />", width:120
//                     , attributes:{"class":"ac"}
//                     , editor:function(container, options){
//                         $('<input data-bind="value:' + options.field + '"  />')
//                         .appendTo(container)
//                         .kendoExtDropDownList({
//                             dataTextField:"cmmCdNm"
//                             , dataValueField:"cmmCd"
//                             , dataSource:yesOrNoList
//                         });
//                     }
//                     , template:'#if (distYn !== ""){# #= yesOrNoMap[distYn]# #}#'
//                 }
//                 ,{field:"displayYn", title:"<spring:message code='global.lbl.displayYn' />", width:70, attributes:{"class":"ac"}
//                     , editor:function(container, options){
//                         $('<input data-bind="value:' + options.field + '"  />')
//                         .appendTo(container)
//                         .kendoExtDropDownList({
//                             dataTextField:"cmmCdNm"
//                             , dataValueField:"cmmCd"
//                             , dataSource:yesOrNoList
//                         });
//                     }
//                     , template:'#if (displayYn !== ""){# #= yesOrNoMap[displayYn]# #}#'
//                 }
            ]
            /* ,change:function(e) {
                var dataItem = this.dataItem(this.select());

                if (dataItem.seq !== lastSelectedItem) {
                    lastSelectedItem = dataItem.seq;

                    $("#detailGrid").data("kendoExtGrid").dataSource.read();
                }
            } */
            //,multiSelectLocked:true
            //,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            //,selectable:"row"
            ,filterable:false
            ,navigatable:false
            ,autoBind:true
            ,resizable:true
            ,sortable:false
            ,height:200
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        });
        // 전시장조사결과 종료 //

        // 전시장조사결과상세 시작 //
        $("#detailGrid").kendoExtGrid({
            dataSource:{
                requestEnd:function(e) {
                    if (e.response.total > 0) {
                        var columnList = e.response.columnList;
                        var sColumn = [];
                        sColumn = gridColumns.concat(sColumn);

                        $.each(columnList, function(idx, headerCont) {
                           var column = {};
                           column["field"] = "C"+idx;
                           column["title"] = headerCont;
                           column["width"] = 80;
                           column["attributes"] = {"class":"ac"};
                           //column["template"] = '<input type="checkbox" class="checkbox" onclick="bf_checkStat(this, \'#=uid#\')" id="'+row.ocnCd+'" #= '+row.ocnCd+' == "Y" ? checked="checked":"" #  />';
                           sColumn.push(column);
                        });

                        $("#detailGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );
                    }
                }
                ,transport:{
                    read:{
                        url:"<c:url value='/crm/css/satisFactionResultManage/selectSatisFactionResultDtlMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            var grid = $('#masterGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());
                            var seq = "";
                            if(selectedItem!=null)  {
                                var seq = selectedItem.seq;
                            }

                            params["sSeq"]                  = seq;

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                        id:"rnum"
                        ,fields:{
                            seq:{type:"string"}
                            , regDt:{type:"date"}
                        }
                    }
                }
            }
            ,columns:[
                {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:80 // 제목
                    ,attributes:{"class":"al"}
                }
            ]
            ,pageable:false
            ,filterable:false
            ,reorderable:true
            ,editable:false
            ,navigatable:false
            ,autoBind:false
            ,sortable:false
            ,scrollable:true
            ,height:height-100
        });
        gridColumns = $("#detailGrid").data("kendoExtGrid").columns;
        // 전시장조사결과상세 종료 //
        var height = $("#detailGrid").height();

    });

</script>
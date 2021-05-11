<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<!-- 만족도조사결과 시작 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.title.satisfactionMngBhmc" /></h1><!-- BHMC 만족도조사 결과 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11190" hasPermission="${dms:getPermissionMask('READ')}">
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
                                <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" data-json-obj="true" data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRegDtTo" name="sRegDtTo" class="form_datepicker" data-json-obj="true" data-type="maskDate"/>
                            </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="masterGrid" class="resizable_grid"></div>
        </div>
    </section>
    <!-- //만족도조사결과 끝 -->
    <!-- 만족도조사결과상세 시작 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="global.title.detail" /></h1><!-- 상세 -->
        </div>
        <div class="table_grid mt10">
            <div id="detailGrid"></div>
        </div>
    </section>
    <!-- //만족도조사결과상세 끝 -->
</div>

<script type="text/javascript">

    var toDt            = new Date();

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

        // 조회
        $("#btnCtlSearch").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value()
                        ,$("#sRegDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#masterGrid").data("kendoExtGrid").dataSource.read();
                }else{
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sRegDtTo").focus();
                }
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
                            , regDt:{type:"date", editable:false}
                            , regDtFormat:{type:"date", editable:false}
                            , distDt:{type:"date", editable:false}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
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
                ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100   // 가입일
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
            ]
            ,change:function(e) {
                var dataItem = this.dataItem(this.select());

                if (dataItem.seq !== lastSelectedItem) {
                    lastSelectedItem = dataItem.seq;

                    $("#detailGrid").data("kendoExtGrid").dataSource.read();
                }
            }
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,filterable:false
            ,navigatable:false
            ,autoBind:true
            ,resizable:true
            //,height:150
            ,editable:false
            ,selectable:"row"
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

                        $("#detailGrid").data("kendoExtGrid").setOptions({
                             columns:sColumn
                            ,appendEmptyColumn:true
                        });
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
            ,resizable:true
            ,selectable:"row"
            ,height:150
        });
        gridColumns = $("#detailGrid").data("kendoExtGrid").columns;
        // 전시장조사결과상세 종료 //


    });

</script>
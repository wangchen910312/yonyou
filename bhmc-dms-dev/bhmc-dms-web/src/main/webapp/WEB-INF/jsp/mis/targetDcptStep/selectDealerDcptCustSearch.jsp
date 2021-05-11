<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectDealerDcptCustSearch.jsp
    Description:목표 분해(집객목표현황) 탭 화면
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<div id="resizableContainer">
    <section class="group">
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.monitordate" /></span>
                    <input type="text" id="sMonitorCustDate" name="sMonitorCustDate" value="${targetDcptStepSearchVO.sMonitorCustDate}" style="width:150px;" class="form_comboBox" >
                    <dms:access viewId="VIEW-D-10807" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_s" id="btnTargetDcptCustSearch" name="btnTargetDcptCustSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="crm.lbl.potenCustCnt" /><!-- 잠재고객수 -->, <spring:message code="mis.lbl.recent3month" /><!-- 최근 3개월 현황 --></h2>
            </div>
            <!-- 잠재고객수, 최근 3개월 현황 그리드 시작 -->
            <div class="table_grid">
                <div id="statusGrid"></div>
            </div>
            <!-- 잠재고객수, 최근 3개월 현황 그리드 종료 -->

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="mis.lbl.collectcustomertargetconfig" /><!-- 집객목표설정 --></h2>
            </div>
            <!-- 집객목표설정 그리드 시작 -->
            <div class="table_grid">
                <div id="custTargetGrid"></div>
            </div>
            <!-- 집객목표설정 그리드 종료 -->

            <div class="header_area">
                <div class="btn_right">
                	<dms:access viewId="VIEW-D-10808" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장  --></button>
                    </dms:access>
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="custGridVal"></div>
                <div id="custGridVals"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
    </section>
</div>
<script type="text/javascript">

    $(document).ready(function() {

        $("#sMonitorCustDate").kendoDatePicker({
            value:"${sysDate}"
            ,start:"year"
            ,depth:"year"
            ,format:"yyyyMM"
        });

        var now = new Date();

        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }

        var sMonitorDate = $("#sMonitorCustDate").val();
        var sMonitorYear = sMonitorDate.substr(0,4);
        var sMonitorMonth = sMonitorDate.substr(4,2);
        var sMonitorDay = sMonitorDate.substr(6,2);
        var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

        $("#sDcptCustDate").val(sMonitorYear + sMonitorMonth + '01');
        $("#sTimeCustProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

        $("#custGridVal").show();
        $("#custGridVals").hide();

        $("#btnTargetDcptCustSearch").kendoButton({
            click:function(e) {

                var sMonitorDate = $("#sMonitorCustDate").val();
                var sMonitorYear = sMonitorDate.substr(0,4);
                var sMonitorMonth = sMonitorDate.substr(4,2);
                var sMonitorDay = sMonitorDate.substr(6,2);
                var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

                $("#sDcptCustDate").val(sMonitorYear + sMonitorMonth + '01');
                $("#sTimeCustProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

                var sNowDate = leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2);
                var sSearchDate = sMonitorDate.substr(0,6);

                $('#statusGrid').data('kendoExtGrid').dataSource.page(1);
                $('#custTargetGrid').data('kendoExtGrid').dataSource.page(1);

                if(sNowDate == sSearchDate) {
                    $("#btnSave").show();
                    $("#custGridVal").show();
                    $("#custGridVals").hide();
                    $('#custGridVal').data('kendoExtGrid').dataSource.page(1);
                } else {
                    $("#btnSave").hide();
                    $("#custGridVal").hide();
                    $("#custGridVals").show();
                    $('#custGridVals').data('kendoExtGrid').dataSource.page(1);
                }

            }
        });

        // 저장
        $("#btnSave").kendoButton({
            click:function(e){

                var saveData = $("#custGridVal").data("kendoExtGrid").getCUDData("insertCustList", "updateCustList", "deleteCustList");
                if ($("#custGridVal").data("kendoExtGrid").cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var param = $.extend( saveData, {"searchOcn":$("#searchOcn").val()} );

                $.ajax({
                    url:"<c:url value='/mis/tds/multiTargetDealerDcptCustThirdGrid.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(error);
                    }
                    ,success:function(jqXHR, textStatus) {
                        var grid = $("#custGridVal").data("kendoExtGrid");
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        //그리드 설정
        $("#statusGrid").kendoExtGrid({
             gridId:"G-MIS-0924-205647"
            ,dataSource:{
                requestEnd:function(e) {

                    var firstList = e.response.firstColumnList;
                    var sColumn = [];
                    sColumn = gridColumns1.concat(sColumn);

                    $.each(firstList, function(idx, row){
                        var firstColumn = {};
                        firstColumn["field"] = row.carlineCd;
                        firstColumn["title"] = row.carlineNm;
                        firstColumn["width"] = 60;
                        firstColumn["attributes"] = {"class":"ar"};
                        firstColumn["template"] = row.resultValue;
                        sColumn.push(firstColumn);
                    });

                    $("#statusGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDealerDcptCustFirstGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorCustDate"] = $("#sMonitorCustDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"nameGubn"
                        ,fields:{
                            nameGubn:{type:"string"}
                            ,nameChannel:{type:"string"}
                            ,statusCarlineCd:{type:"string"}
                            ,statusCarlineNm:{type:"string"}
                            ,resultValue:{type:"string"}
                        }
                    }
                }
            }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false      //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false
        ,height:190
        ,editable   :false
        ,resizable  :false
        ,autoBind   :false
        ,selectable :false
        ,navigatable:true
        ,sortable:false
        ,pageable:false
        ,reorderable:true
            ,columns:[
                {field:"nameGubn", title:"<spring:message code='mis.lbl.gubn' />", width:80, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameGubn == "1"){
                            return '<spring:message code="crm.lbl.potenCustCnt" />(H-B)';
                        } else if(dataItem.nameGubn == "2"){
                            return '<spring:message code="mis.lbl.dealrate" />(<spring:message code="mis.lbl.recent3month" />)';
                        } else if(dataItem.nameGubn == "3"){
                            return '<spring:message code="mis.lbl.custinfoinputrate" />(<spring:message code="mis.lbl.recent3month" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"nameChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.nameChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
            ]
        });

        gridColumns1 = $("#statusGrid").data("kendoExtGrid").columns;


        //그리드 설정
        $("#custTargetGrid").kendoExtGrid({
             gridId:"G-MIS-0924-205802"
            ,dataSource:{
                requestEnd:function(e) {

                    var secondList = e.response.secondColumnList;
                    var sColumn = [];
                    sColumn = gridColumns2.concat(sColumn);

                    $.each(secondList, function(idx, row){
                        var secondColumn = {};
                        secondColumn["field"] = row.carlineCd;
                        secondColumn["title"] = row.carlineNm;
                        secondColumn["width"] = 60;
                        secondColumn["attributes"] = {"class":"ar"};
                        secondColumn["template"] = row.custValue;
                        sColumn.push(secondColumn);
                    });

                    $("#custTargetGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDealerDcptCustSecondGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorCustDate"] = $("#sMonitorCustDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"custGubn"
                        ,fields:{
                            custGubn:{type:"string"}
                            ,custChannel:{type:"string"}
                            ,custCarlineCd:{type:"string"}
                            ,custCarlineNm:{type:"string"}
                            ,custValue:{type:"string"}
                        }
                    }
                }
            }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false      //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false
        ,height:116
        ,scrollable:false
        ,editable   :false
        ,resizable  :false
        ,autoBind   :false
        ,selectable :false
        ,navigatable:true
        ,sortable:false
        ,pageable:false
        ,reorderable:true
            ,columns:[
                {field:"custGubn", title:"<spring:message code='mis.lbl.gubn' />", width:80, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custGubn == "1"){
                            return '<spring:message code="mis.lbl.saletargetmonth" />';
                        } else if(dataItem.custGubn == "2"){
                            return '<spring:message code="mis.lbl.collectcustomertarget" />(<spring:message code="mis.lbl.opinionvalue" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"custChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.custChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
            ]
        });

        gridColumns2 = $("#custTargetGrid").data("kendoExtGrid").columns;

        //그리드 설정
        $("#custGridVal").kendoExtGrid({
             gridId:"G-MIS-0924-211030"
            ,dataSource:{
                requestEnd:function(e) {

                    var thirdList = e.response.thirdColumnList;
                    var sColumn = [];
                    sColumn = gridColumns3.concat(sColumn);

                    $.each(thirdList, function(idx, row){
                        var thirdColumn = {};
                        thirdColumn["field"] = row.carlineCd;
                        thirdColumn["title"] = row.carlineNm;
                        thirdColumn["width"] = 60;
                        thirdColumn["attributes"] = {"class":"ar"};
                        thirdColumn["template"] = row.custGubnValue;

                        sColumn.push(thirdColumn);

                    });

                    $("#custGridVal").data("kendoExtGrid").setOptions({ columns:sColumn } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDealerDcptCustThirdGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorCustDate"] = $("#sMonitorCustDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"custGubnVal"
                        ,fields:{
                             custGoalYy:{type:"string", editable:false}
                            ,custGoalMm:{type:"string", editable:false}
                            ,custGubnVal:{type:"string", editable:false}
                            ,custChannelVal:{type:"string", editable:false}
                            ,custGubnCarlineCd:{type:"string", editable:false}
                            ,custGubnCarlineNm:{type:"string", editable:false}
                        }
                    }
                }
            }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false      //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false
        ,height:72
        ,scrollable:false
        ,resizable  :false
        ,autoBind   :false
        ,selectable :false
        ,navigatable:true
        ,sortable:false
        ,pageable:false
        ,reorderable:true
            ,columns:[
                {field:"custGubnVal", title:"<spring:message code='mis.lbl.gubn' />", width:80, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custGubnVal == "1"){
                            return '<spring:message code="mis.lbl.collectcustomertarget" />(<spring:message code="mis.lbl.prefVal" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"custChannelVal", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custChannelVal == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.custChannelVal == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
            ]
        });

        gridColumns3 = $("#custGridVal").data("kendoExtGrid").columns;

      //그리드 설정
        $("#custGridVals").kendoExtGrid({
             gridId:"G-MIS-0924-211031"
            ,dataSource:{
                requestEnd:function(e) {

                    var thirdList = e.response.thirdColumnList;
                    var sColumn = [];
                    sColumn = gridColumns3.concat(sColumn);

                    $.each(thirdList, function(idx, row){
                        var thirdColumn = {};
                        thirdColumn["field"] = row.carlineCd;
                        thirdColumn["title"] = row.carlineNm;
                        thirdColumn["width"] = 60;
                        thirdColumn["attributes"] = {"class":"ar"};
                        thirdColumn["template"] = row.custGubnValue;

                        sColumn.push(thirdColumn);

                    });

                    $("#custGridVals").data("kendoExtGrid").setOptions({ columns:sColumn } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDealerDcptCustThirdGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorCustDate"] = $("#sMonitorCustDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"custGubnVals"
                        ,fields:{
                             custGoalYy:{type:"string", editable:false}
                            ,custGoalMm:{type:"string", editable:false}
                            ,custGubnVal:{type:"string", editable:false}
                            ,custChannelVal:{type:"string", editable:false}
                            ,custGubnCarlineCd:{type:"string", editable:false}
                            ,custGubnCarlineNm:{type:"string", editable:false}
                        }
                    }
                }
            }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false      //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false
        ,height:72
        ,scrollable:false
        ,resizable  :false
        ,autoBind   :false
        ,selectable :false
        ,navigatable:true
        ,sortable:false
        ,pageable:false
        ,reorderable:true
        ,editable:false
            ,columns:[
                {field:"custGubnVal", title:"<spring:message code='mis.lbl.gubn' />", width:80, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custGubnVal == "1"){
                            return '<spring:message code="mis.lbl.collectcustomertarget" />(<spring:message code="mis.lbl.prefVal" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"custChannelVal", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custChannelVal == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.custChannelVal == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
            ]
        });

        gridColumns3 = $("#custGridVals").data("kendoExtGrid").columns;

    });

</script>
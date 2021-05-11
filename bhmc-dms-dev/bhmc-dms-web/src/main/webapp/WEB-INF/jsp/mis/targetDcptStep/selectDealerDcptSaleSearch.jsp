<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name:selectDealerDcptSaleSearch.jsp
    Description:목표 분해(판매고문) 탭 화면
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
        <div class="header_area">
            <div class="left_area ml0">
                <span class="span_txt"><spring:message code="mis.lbl.monitordate" /><!-- 모니터링일자 --></span>
                <input type="text" id="sMonitorSaleDate" name="sMonitorSaleDate" value="${targetDcptStepSearchVO.sMonitorSaleDate}" style="width:150px;" class="form_comboBox" >
                <dms:access viewId="VIEW-D-10805" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnTargetDcptSaleSearch" name="btnTargetDcptSaleSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                </dms:access>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="monthAllGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="mis.lbl.monthmodeldcpttarget" /><!-- 당월 차형별 분해 목표 -->, <spring:message code="mis.lbl.goalRstfVal" /><!-- 진도 -->, <spring:message code="mis.lbl.gap" /><!-- 차이 --></h2>
            <div class="btn_right">
                <p class="txt_right">* <spring:message code="mis.lbl.gap" /><!-- 차이 -->：<spring:message code="mis.lbl.targetmessage" /><!-- 목표 대비 분해 진도 미달 시 경고 표시 --></p>
            </div>
        </div>

        <!-- 당월 차형별 분해 목표, 진도, 차이 그리드 시작 -->
        <div class="table_grid">
            <div id="scDcptGrid"></div>
        </div>
        <!-- 당월 차형별 분해 목표, 진도, 차이 그리드 종료 -->

        <div class="header_area pt10">
            <h2 class="title_basic"><spring:message code="mis.lbl.monthsalemantarget" /><!-- 당월 판매 고문 목표 --></h2>
            <div class="btn_right">
            	<dms:access viewId="VIEW-D-10806" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장  -->
                </dms:access>
            </div>
        </div>

        <!-- 당월 판매 고문목표 그리드 시작 class="resizable_grid" -->
        <div class="table_grid">
            <div id="saleManGrid"></div>
        </div>
        <!-- 당월 판매 고문목표 그리드 종료 -->

    </section>
</div>
<script type="text/javascript">

    $(document).ready(function() {

        var Rtotal = 0; // 당월 판매 고문 목표 total 값

        $("#sMonitorSaleDate").kendoDatePicker({
            value:"${sysDate}"
            ,start:"year"
            ,depth:"year"
            ,format:"yyyyMM"
        });

        $("#btnTargetDcptSaleSearch").kendoButton({
            click:function(e) {


                $('#scDcptGrid').data('kendoExtGrid').dataSource.page(1);
                $('#saleManGrid').data('kendoExtGrid').dataSource.page(1);
            //    $('#monthAllGrid').data('kendoExtGrid').dataSource.page(1);
           }
        });

        // 저장
        $("#btnSave").kendoButton({
            click:function(e){

                var saveData = $("#saleManGrid").data("kendoExtGrid").getCUDData("insertSaleList", "updateSaleList", "deleteSaleList");
                if ($("#saleManGrid").data("kendoExtGrid").cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var param = $.extend( saveData, {"searchOcn":$("#searchOcn").val()} );

                $.ajax({
                    url:"<c:url value='/mis/tds/multiTargetDcptDealerSaleManSearchGrid.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(error);
                    }
                    ,success:function(jqXHR, textStatus) {
                        var grid = $("#saleManGrid").data("kendoExtGrid");
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        $('#monthAllGrid').data('kendoExtGrid').dataSource.page(1);
                        $('#scDcptGrid').data('kendoExtGrid').dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        //그리드 설정
        $("#monthAllGrid").kendoExtGrid({
            gridId:"G-MIS-0924-160008"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptDealerSaleTargetAllGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorSaleDate"] = $("#sMonitorSaleDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"allMonthTargetVal"
                        ,fields:{
                             allMonthTargetVal:{type:"string"}
                            ,allDifferenceTargetVal:{type:"string"}
                            ,allSalemanCnt:{type:"string"}
                        }
                    }
                }
            }
            ,height:48
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false            //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,autoBind   :false
            ,selectable :false
            ,columns:[
                {field:"allMonthTargetVal", title:"<spring:message code='mis.lbl.goalPrefVal' />", width:250, format:"{0:n0}", attributes:{"class":"ar"}}       //목표
                ,{field:"allDifferenceTargetVal", title:"<spring:message code='mis.lbl.gapremark' />", width:250, format:"{0:n0}", attributes:{"class":"ar"}}   //차이: 분해  대기 수량
                ,{field:"allSalemanCnt"
                    ,template:function(dataItem){
                           return Rtotal;
                    }

                    , title:"<spring:message code='mis.lbl.salesAdvisorcnt' />", width:250, format:"{0:n0}", attributes:{"class":"ar"}}      //판매고문인수
            ]
        });

        //당월 차형별 분해 목표ㅡ 진도, 차이 그리드 설정
        $("#scDcptGrid").kendoExtGrid({
            gridId:"G-MIS-1007-162920"
            ,dataSource:{
                requestEnd:function(e) {

                    var carDcptChannelList = e.response.carDcptColumnList || [];
                    var sColumn1 = [];
                    sColumn1 = gridColumns1.concat(sColumn1);


                    $.each(carDcptChannelList, function(idx, row){
                        var carDcptChannelColumn = {};
                        carDcptChannelColumn["field"] = row.carlineCd;
                        carDcptChannelColumn["title"] = row.carlineNm;
                        carDcptChannelColumn["width"] = 60;
                        carDcptChannelColumn["attributes"] = {"class":"ar"};
                        carDcptChannelColumn["template"] = row.scDcptGoalPrefVal;
                        sColumn1.push(carDcptChannelColumn);
                    });

                    $("#scDcptGrid").data("kendoExtGrid").setOptions({ columns:sColumn1 } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDealerSaleDcptStatusGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorSaleDate"] = $("#sMonitorSaleDate").val();

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
                            ,scDcptCarlineCd:{type:"string"}
                            ,scDcptCarlineNm:{type:"string"}
                            ,scDcptGoalPrefVal:{type:"string"}
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
            ,height:94
            ,scrollable:false
            ,editable   :false
            ,resizable  :false
            ,autoBind   :false
            ,selectable :false
            ,navigatable:true
            ,sortable:false
            ,pageable:false
            ,reorderable:true
            ,dataBound:function(e){

                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.nameGubn === "C"){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("f_font01");
                    }
                });
            }
            ,columns:[
                {field:"nameGubn", title:"<spring:message code='mis.lbl.dealermodel' />", attributes:{"class":"ac"}, width:80
                    ,template:function(dataItem){
                        if(dataItem.nameGubn == "A"){
                            return '<spring:message code="mis.lbl.goalPrefVal" />';
                        } else if(dataItem.nameGubn == "B"){
                            return '<spring:message code="mis.lbl.dcptprocess" />';
                        } else if(dataItem.nameGubn == "C"){
                            return '<spring:message code="mis.lbl.gap" />';
                        }
                        return '-';
                    }
                }
            ]
        });

        gridColumns1 = $("#scDcptGrid").data("kendoExtGrid").columns;

        //당월 판매 고문목표 그리드 설정
        $("#saleManGrid").kendoExtGrid({
            gridId:"G-MIS-1007-151352"
            ,dataSource:{
                requestEnd:function(e) {

                    var smDcptChannelList = e.response.smDcptColumnList || [];
                    var sColumn = [];
                    sColumn = gridColumns2.concat(sColumn);
                    Rtotal = e.response.total;
                    $.each(smDcptChannelList, function(idx, row){
                        var smDcptChannelColumn = {};
                        smDcptChannelColumn["field"] = row.carlineCd;
                        smDcptChannelColumn["title"] = row.carlineNm;
                        smDcptChannelColumn["width"] = 60;
                        smDcptChannelColumn["attributes"] = {"class":"ar"};
                        smDcptChannelColumn["template"] = row.carDcptGoalPrefVal;
                        sColumn.push(smDcptChannelColumn);
                    });

                    $("#saleManGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );

                    $('#monthAllGrid').data('kendoExtGrid').dataSource.page(1);
                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptDealerSaleManSearchGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sMonitorSaleDate"] = $("#sMonitorSaleDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"saleGoalYy"
                        ,fields:{
                             saleGoalYy:{type:"string", editable:false}
                            ,saleGoalMm:{type:"string", editable:false}
                            ,carDcptEmpNo:{type:"string", editable:false}
                            ,carDcptEmpNm:{type:"string", editable:false}
                            ,carDcptCarlineCd:{type:"string", editable:false}
                            ,carDcptCarlineNm:{type:"string", editable:false}
                            ,carDcptGoalPrefVal:{type:"string"}
                            ,carDcptGoalSumfVal:{type:"string", editable:false}
                        }
                    }
                }
            }
            ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,filterable:false
            ,height:370
            ,resizable  :false
            ,autoBind   :false
            ,selectable :false
            ,navigatable:true
            ,sortable:false
            ,columns:[
                {field:"carDcptEmpNm", title:"<spring:message code='mis.lbl.empNm' />", attributes:{"class":"ac"}, width:100}
                ,{field:"carDcptGoalSumfVal", title:"<spring:message code='mis.lbl.total' />", attributes:{"class":"ar"}, width:100}
            ]
        });

        gridColumns2 = $("#saleManGrid").data("kendoExtGrid").columns;

    });


</script>
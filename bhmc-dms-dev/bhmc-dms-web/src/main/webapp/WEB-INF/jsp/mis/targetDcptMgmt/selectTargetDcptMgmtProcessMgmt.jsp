<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frmProcessmgmt" id="frmProcessmgmt" action="<c:url value="/mis/tdm/selectTargetDcptMgmtProcessMgmtSearch.do"/>">

<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색 1 -->
        <input type="text" id="sProcessMgmtYyMmDd" name="sProcessMgmtYyMmDd" value="${sProcessMgmtYyMmDd}" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtProcessMgmtSearch" name="btnTargetDcptMgmtProcessMgmtSearch"><spring:message code="global.btn.search" /></button><!-- 과정관리자료조회  -->
    </div>
</div>
<!-- 그리드 시작 -->
<div class="table_info table_info_v2 mt10">
    <div class="table_grid">
        <div id="saleGrid"></div>
    </div>
</div>
<!-- 그리드 종료 -->
<p class="mt5">* <spring:message code="mis.lbl.dateprocessing" />:<spring:message code="mis.lbl.dateprocessingcomment" /></p><!-- * 일진도:판매목표 대비 일진도 미달 시 경고 표시  -->
<!-- 그리드 시작 -->
<div class="table_info table_info_v2 mt10">
    <div class="table_grid">
        <div id="custGrid"></div>
    </div>
</div>
<!-- 그리드 종료 -->

<p class="mt5">* <spring:message code="mis.lbl.dateprocessing" />:<spring:message code="mis.lbl.datecustcomment" /></p><!-- * 일진도:집객목표 대비 일진도 미달 시 경고 표시  -->
<!-- 진도자료 팝업 -->
<section id="lastMonthSaleVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.salesrate" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="totalMonthGoalVal" name="totalMonthGoalVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                    <td><input type="text" id="totalMonthDealRate" name="totalMonthDealRate" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly>%</td>
                    <td><input type="text" id="totalMonthGapVal" name="totalMonthGapVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section id="lastYearSaleVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.salesrate" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="totalYearGoalVal" name="totalYearGoalVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                    <td><input type="text" id="totalYearDealRate" name="totalYearDealRate" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly>%</td>
                    <td><input type="text" id="totalYearGapVal" name="totalYearGapVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->

<!-- 진도자료 팝업 -->
<section id="lastMonthCustVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.collectcustomerqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="totalMonthGoalVal" name="totalMonthGoalVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                    <td><input type="text" id="totalMonthDealRate" name="totalMonthDealRate" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly>%</td>
                    <td><input type="text" id="totalMonthGapVal" name="totalMonthGapVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section id="lastYearCustVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.collectcustomerqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="totalMonthGoalVal" name="totalMonthGoalVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                    <td><input type="text" id="totalMonthDealRate" name="totalMonthDealRate" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly>%</td>
                    <td><input type="text" id="totalMonthGapVal" name="totalMonthGapVal" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<script type="text/javascript">
    $(document).ready(function() {

        $("#sProcessMgmtYyMmDd").kendoDatePicker({
            value:"${sysdate}"
           ,format:"yyyyMMdd"
           ,parseFormats:["yyyyMMdd"]
       });

       $("#sProcessMgmtYyMmDd").kendoMaskedTextBox({
           mask:"########"
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
       if('${sProcessMgmtYyMmDd}' == "" || '${sProcessMgmtYyMmDd}' == 'null') {
           $("#sProcessMgmtYyMmDd").val(leadingZeros(now.getFullYear(), 4)+leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));
       } else {
           $("#sProcessMgmtYyMmDd").val('${sProcessMgmtYyMmDd}');
       }

        $("#btnTargetDcptMgmtProcessMgmtSearch").kendoButton({
            click:function(e) {
                $('#frmProcessmgmt').submit();
               }
        });

        $("#lastMonthSaleVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthSaleVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearSaleVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthSaleVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastMonthCustVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthCustVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearCustVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastYearCustVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");


       //그리드 설정
        $("#saleGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0913-194300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtProcessMgmtSaleGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sProcessMgmtYyMmDd"] = $("#sProcessMgmtYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"nameGubn"
                        ,fields:{
                             nameGubn:{type:"string"}
                            ,nameChannel:{type:"string"}
                            ,totalDayGoalVal:{type:"number"}
                            ,totalDayDealRate:{type:"number"}
                            ,totalDayGapVal:{type:"string"}
                            ,totalMonthGapVal:{type:"string"}
                            ,totalYearGapVal:{type:"string"}
                        }
                    }
                }
            }
            ,height:94
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"nameGubn", title:"<spring:message code='mis.lbl.gubn' />", width:220, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameGubn == "1"){
                            return '<spring:message code="mis.lbl.goalRstRate" />';
                        } else if(dataItem.nameGubn == "2"){
                            return '<spring:message code="mis.lbl.custRstRate" />';
                        }
                        return '-';
                    }
                }
                ,{field:"nameChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.nameChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"totalDayGoalVal", title:"<spring:message code='mis.lbl.salesqty' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayDealRate", title:"<spring:message code='mis.lbl.salesrate' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.gapvalue' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.processday' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalDayGapVal <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.totalDayGapVal  > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"totalMonthGapVal", title:"<spring:message code='mis.lbl.lastmonth' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalMonthGapVal <= '0') {
                                spanObj = "<a href='javascript:lastMonthSaleVsitPopup();' class='ico_circle green'></a>";
                            } else if (dataItem.totalMonthGapVal > '0') {
                                spanObj = "<a href='javascript:lastMonthSaleVsitPopup();' class='ico_circle red'></a>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"totalYearGapVal", title:"<spring:message code='mis.lbl.lastyearmonth' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalYearGapVal <= '0' || dataItem.totalYearGapVal == '') {
                                spanObj = "<a href='javascript:lastYearSaleVsitPopup();' class='ico_circle green'></a>";
                            } else if (dataItem.totalYearGapVal  > '0') {
                                spanObj = "<a href='javascript:lastYearSaleVsitPopup();' class='ico_circle green'></a>";
                            }
                        return spanObj;
                    }
                }
            ]
        });

      //그리드 설정
        $("#custGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0913-194300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtProcessMgmtCustGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sProcessMgmtYyMmDd"] = $("#sProcessMgmtYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"nameGubn"
                        ,fields:{
                             nameGubn:{type:"string"}
                            ,nameChannel:{type:"string"}
                            ,totalDayGoalVal:{type:"number"}
                            ,totalDayDealRate:{type:"number"}
                            ,totalDayGapVal:{type:"string"}
                            ,totalMonthGapVal:{type:"string"}
                            ,totalYearGapVal:{type:"string"}
                        }
                    }
                }
            }
            ,height:94
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"nameGubn", title:"<spring:message code='mis.lbl.gubn' />", width:220, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameGubn == "1"){
                            return '<spring:message code="mis.lbl.goalRstRate" />';
                        } else if(dataItem.nameGubn == "2"){
                            return '<spring:message code="mis.lbl.custRstRate" />';
                        }
                        return '-';
                    }
                }
                ,{field:"nameChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.nameChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"totalDayGoalVal", title:"<spring:message code='mis.lbl.salesqty' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayDealRate", title:"<spring:message code='mis.lbl.salesrate' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.gapvalue' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.processday' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalDayGapVal <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.totalDayGapVal  > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"totalMonthGapVal", title:"<spring:message code='mis.lbl.lastmonth' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalMonthGapVal <= '0') {
                                spanObj = "<a href='javascript:lastMonthCustVsitPopup();' class='ico_circle green'></a>";
                            } else if (dataItem.totalMonthGapVal > '0') {
                                spanObj = "<a href='javascript:lastMonthCustVsitPopup();' class='ico_circle red'></a>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"totalYearGapVal", title:"<spring:message code='mis.lbl.lastyearmonth' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalYearGapVal <= '0') {
                                spanObj = "<a href='javascript:lastYearCustVsitPopup();' class='ico_circle green'></a>";
                            } else if (dataItem.totalYearGapVal > '0') {
                                spanObj = "<a href='javascript:lastYearCustVsitPopup();' class='ico_circle red'></a>";
                            }
                        return spanObj;
                    }
                }
            ]
        });
    });


    function lastMonthSaleVsitPopup(){

        var win = $("#lastMonthSaleVsitPopup").data("kendoWindow");
        var grid = $("#saleGrid").data("kendoExtGrid")
        , selectedItem = grid.dataItem(grid.select())
        , totalMonthGoalVal = selectedItem.totalMonthGoalVal
        , totalMonthDealRate = selectedItem.totalMonthDealRate
        , totalMonthGapVal = selectedItem.totalMonthGapVal

        $("#totalMonthGoalVal").val(totalMonthGoalVal);
        $("#totalMonthDealRate").val(totalMonthDealRate);
        $("#totalMonthGapVal").val(totalMonthGapVal);
        win.center();
        win.open();

    }

    function lastYearSaleVsitPopup(){

        var win = $("#lastYearSaleVsitPopup").data("kendoWindow");
        var grid = $("#saleGrid").data("kendoExtGrid")
        , selectedItem = grid.dataItem(grid.select())
        , totalYearGoalVal = selectedItem.totalYearGoalVal
        , totalYearDealRate = selectedItem.totalYearDealRate
        , totalYearGapVal = selectedItem.totalYearGapVal

        $("#totalYearGoalVal").val(totalYearGoalVal);
        $("#totalYearDealRate").val(totalYearDealRate);
        $("#totalYearGapVal").val(totalYearGapVal);
        win.center();
        win.open();

    }

    function lastMonthCustVsitPopup(){

        var win = $("#lastMonthCustVsitPopup").data("kendoWindow");
        var grid = $("#custGrid").data("kendoExtGrid")
        , selectedItem = grid.dataItem(grid.select())
        , totalMonthGoalVal = selectedItem.totalMonthGoalVal
        , totalMonthDealRate = selectedItem.totalMonthDealRate
        , totalMonthGapVal = selectedItem.totalMonthGapVal

        $("#totalMonthGoalVal").val(totalMonthGoalVal);
        $("#totalMonthDealRate").val(totalMonthDealRate);
        $("#totalMonthGapVal").val(totalMonthGapVal);
        win.center();
        win.open();

    }

    function lastYearCustVsitPopup(){

        var win = $("#lastYearCustVsitPopup").data("kendoWindow");
        var grid = $("#custGrid").data("kendoExtGrid")
        , selectedItem = grid.dataItem(grid.select())
        , totalYearGoalVal = selectedItem.totalYearGoalVal
        , totalYearDealRate = selectedItem.totalYearDealRate
        , totalYearGapVal = selectedItem.totalYearGapVal

        $("#totalYearGoalVal").val(totalYearGoalVal);
        $("#totalYearDealRate").val(totalYearDealRate);
        $("#totalYearGapVal").val(totalYearGapVal);
        win.center();
        win.open();

    }



</script>
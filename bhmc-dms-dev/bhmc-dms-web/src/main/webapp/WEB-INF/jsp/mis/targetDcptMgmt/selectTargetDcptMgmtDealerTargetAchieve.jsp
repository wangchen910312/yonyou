<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group">
    <div class="mt0">
        <div class="header_area">
            <div class="left_area ml0">
                <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
                <input type="text" id="sDealerTargetAchieveYyMmDd" name="sDealerTargetAchieveYyMmDd" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
                <input type="text" id="sCustChannel" name="sCustChannel" class="form_comboBox" style="width:100px;">
                <button type="button" class="btn_s" id="btnTargetDcptMgmtTargetAchieveSearch" name="btnTargetDcptMgmtTargetAchieveSearch"><spring:message code="global.btn.search" /></button><!-- 딜러분해자료조회  -->
            </div>
        </div>
        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.achievementstatus" /></h2>
        </div>
        <div class="table_info table_info_v2 mt5">
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid"></div>
            </div>
            <!-- 그리드 종료 -->
            </div>

        <p class="mt5">* <spring:message code="mis.lbl.processday" />:<spring:message code="mis.lbl.datecustcomment" /></p>
    </div>
</section>
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
                    <th scope="col"><spring:message code="mis.lbl.achievementvalue" /></th><!-- 달성값 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="lastMonthCustVsitCnt" name="lastMonthCustVsitCnt" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                    <td><input type="text" id="prosMonthCustVsitPer" name="prosMonthCustVsitPer" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly>%</td>
                    <td><input type="text" id="gapMonthCustVsitCnt" name="gapMonthCustVsitCnt" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<!-- 진도자료 팝업 -->
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
                    <th scope="col"><spring:message code="mis.lbl.achievementvalue" /></th><!-- 달성값 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="lastYearCustVsitCnt" name="lastYearCustVsitCnt" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>
                    <td><input type="text" id="prosYearCustVsitPers" name="prosYearCustVsitPers" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly>%</td>
                    <td><input type="text" id="gapYearCustVsitCnt" name="gapYearCustVsitCnt" style="width:50px;background-color:transparent;text-align:center;border-style:none;" Readonly></td>

                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<script type="text/javascript">

    $(document).ready(function() {

        $("#sDealerTargetAchieveYyMmDd").kendoDatePicker({
            value:"${sysdate}"
           ,format:"yyyyMMdd"
           ,parseFormats:["yyyyMMdd"]
        });

        $("#sDealerTargetAchieveYyMmDd").kendoMaskedTextBox({
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

            $("#sDealerTargetAchieveYyMmDd").val(leadingZeros(now.getFullYear(), 4)+leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));

        $("#sCustChannel").kendoExtDropDownList({
            dataSource:["","IDCC","SHOP"]
            ,index:0
        });

      //버튼 - 조회
        $("#btnTargetDcptMgmtTargetAchieveSearch").kendoButton({
            click:function(e) {

                if($("#sDealerTargetAchieveYyMmDd").val() == ''){
                    alert("<spring:message code='global.info.required.select'/>");
                    return;
                }


                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

      //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0907-195900"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtDealerTargetAchieveGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDealerTargetAchieveYyMmDd"] = $("#sDealerTargetAchieveYyMmDd").val();
                            params["sCustChannel"] = $("sCustChannel").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"targetAchieveCarlineCd"
                        ,fields:{
                             targetAchieveCarlineCd:{type:"string"}
                            ,sumAllCustVsitCnt:{type:"string"}
                            ,monthGoalPrefVal:{type:"string"}
                            ,dayGoalPrefVal:{type:"string"}
                            ,gapTodatCUstVsitCnt:{type:"number"}
                            ,sumCustVsitCnt:{type:"number"}
                            ,gapCustVsitCnt:{type:"number"}
                            ,lastMonthGoalPrefVal:{type:"number"}
                            ,lastMonthCustVsitCnt:{type:"number"}
                            ,gapMonthCustVsitCnt:{type:"number"}
                            ,prosMonthCustVsitPer:{type:"string"}
                            ,lastYearGoalPrefVal:{type:"number"}
                            ,lastYearCustVsitCnt:{type:"number"}
                            ,gapYearCustVsitCnt:{type:"number"}
                            ,prosYearCustVsitPer:{type:"string"}
                            ,lastMonthName:{type:"string"}
                            ,lastYearhName:{type:"string"}

                        }
                    }
                }
            }
            ,height:600
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
                {field:"targetAchieveCarlineCd", title:"<spring:message code='mis.lbl.dealermodel' />", width:100, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"sumAllCustVsitCnt", title:"<spring:message code='mis.lbl.attractiondaycnt' />", width:150, format:"{0:n0}", sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"sumCustVsitCnt", title:"<spring:message code='mis.lbl.attractiondaytotalcnt' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"dayGoalPrefVal", title:"<spring:message code='mis.lbl.targetdaycnt' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"gapTodatCUstVsitCnt", title:"<spring:message code='mis.lbl.gap' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"prosDayCustVsitPers", title:"<spring:message code='mis.lbl.targetprocessing' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"prosMonthCustVsitPers", title:"<spring:message code='mis.lbl.totalprocessing' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"dayGoalPrefVal", title:"<spring:message code='mis.lbl.processday' />", width:200, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.gapTodatCUstVsitCnt <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.gapTodatCUstVsitCnt  > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"lastMonthCustVsitCnt", title:"<spring:message code='mis.lbl.lastmonth' />", width:200, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.gapMonthCustVsitCnt <= '0') {
                                spanObj = "<a href='javascript:lastMonthCustVsitPopup();' class='ico_circle green'></a>";
                            } else if (dataItem.gapMonthCustVsitCnt > '0') {
                                spanObj = "<a href='javascript:lastMonthCustVsitPopup();' class='ico_circle red'></a>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"lastYearCustVsitCnt", title:"<spring:message code='mis.lbl.lastyearsamemonth' />", width:200, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.gapYearCustVsitCnt <= '0') {
                                spanObj = "<a href='javascript:lastYearCustVsitPopup();' class='ico_circle green'></a>";
                            } else if (dataItem.gapYearCustVsitCnt > '0') {
                                spanObj = "<a href='javascript:lastYearCustVsitPopup();' class='ico_circle red'></a>";
                            }
                        return spanObj;
                    }

                }

            ]
        });

        $("#lastMonthCustVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthCustVsitCnt",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearCustVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastYearCustVsitCnt",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");



    });

    function lastMonthCustVsitPopup(){

        var win = $("#lastMonthCustVsitPopup").data("kendoWindow");
        var grid = $("#grid").data("kendoExtGrid")
        , selectedItem = grid.dataItem(grid.select())
        , lastMonthCustVsitCnt = selectedItem.lastMonthCustVsitCnt
        , prosMonthCustVsitPer = selectedItem.prosMonthCustVsitPer
        , gapMonthCustVsitCnt = selectedItem.gapMonthCustVsitCnt
        , lastMonthName = selectedItem.lastMonthName ;

        $("#lastMonthCustVsitCnt").val(lastMonthCustVsitCnt);
        $("#prosMonthCustVsitPer").val(prosMonthCustVsitPer);
        $("#gapMonthCustVsitCnt").val(gapMonthCustVsitCnt);


        win.center();
        win.open();

    }

    function lastYearCustVsitPopup(){

        var win = $("#lastYearCustVsitPopup").data("kendoWindow");
        var grid = $("#grid").data("kendoExtGrid")
        , selectedItem = grid.dataItem(grid.select())
        , lastYearCustVsitCnt = selectedItem.lastYearCustVsitCnt
        , prosYearCustVsitPers = selectedItem.prosYearCustVsitPers
        , gapYearCustVsitCnt = selectedItem.gapYearCustVsitCnt
        , lastYearhName = selectedItem.lastYearhName;

        $("#lastYearCustVsitCnt").val(lastYearCustVsitCnt);
        $("#prosYearCustVsitPers").val(prosYearCustVsitPers);
        $("#gapYearCustVsitCnt").val(gapYearCustVsitCnt);
        win.center();
        win.open();

    }

</script>
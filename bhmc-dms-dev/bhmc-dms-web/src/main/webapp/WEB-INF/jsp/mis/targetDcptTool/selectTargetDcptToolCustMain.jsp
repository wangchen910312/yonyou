<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 집객 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">집객</h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active">목표현황</li>
            <li>달성현황</li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 목표현황 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
                    <input type="text" id="sCustTargetStatusYear" name="sCustTargetStatusYear" value="" class="form_comboBox" style="width:100px;"><!-- 조회년도  -->
                    <input type="text" id="sCustTargetStatusMonth" name="sCustTargetStatusMonth" value="" class="form_comboBox" style="width:100px;"><!-- 조회월  -->
                    <input type="text" id="sCustTargetStatusDate" name="sCustTargetStatusDate" value="" class="form_comboBox" style="width:100px;"><!-- 조회일  -->
                    <button type="button" class="btn_s" id="btnsCustTargetStatusSearch" name="btnsCustTargetStatusSearch"><spring:message code="global.btn.search" /></button>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2">
            <form method="post" name="frmCustTargetStatus" id="frmCustTargetStatus" action="<c:url value="/mis/tdt/selectTargetDcptToolCustTarget.do"/>">
            <%
                String sCustTargetStatusYearParam = request.getParameter("sCustTargetStatusYearParam");
                pageContext.setAttribute("sCustTargetStatusYearParam", sCustTargetStatusYearParam);

                String sCustTargetStatusMonthParam = request.getParameter("sCustTargetStatusMonthParam");
                pageContext.setAttribute("sCustTargetStatusMonthParam", sCustTargetStatusMonthParam);

                String sCustTargetStatusDateParam = request.getParameter("sCustTargetStatusDateParam");
                pageContext.setAttribute("sCustTargetStatusDateParam", sCustTargetStatusDateParam);
            %>
            <input type="hidden" id="sCustTargetStatusYearParam" name="sCustTargetStatusYearParam" value="${pageContext.request.contextPath}">
            <input type="hidden" id="sCustTargetStatusMonthParam" name="sCustTargetStatusMonthParam" value="${pageContext.request.contextPath}">
            <input type="hidden" id="sCustTargetStatusDateParam" name="sCustTargetStatusDateParam" value="${pageContext.request.contextPath}">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th_bg">구분</th>
                            <th scope="col">채널</th>
                            <th scope="col">아반떼</th>
                            <th scope="col">올 뉴 투싼</th>
                            <th scope="col">쏘나타9</th>
                            <th scope="col">ix25</th>
                            <th scope="col">MISTRA</th>
                            <th scope="col">올 뉴 싼타페</th>
                            <th scope="col">신형 아반떼</th>
                            <th scope="col">쏘나타8</th>
                            <th scope="col">베르나</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" rowspan="2">잠재 고객수</th>
                            <td>IDCC</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>전시장</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2">거래율<br>(최근 3개월)</th>
                            <td>IDCC</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                        </tr>
                        <tr>
                            <td>전시장</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                        </tr>
                        <tr>
                            <th scope="row">개인정보취득율<br>(최근 3개월)</th>
                            <td>전시장</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                            <td>10%</td>
                            <td>20%</td>
                            <td>5%</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2">당월 판매목표</th>
                            <td>IDCC</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>전시장</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2">집객목표<br>(의견값)</th>
                            <td>IDCC</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>전시장</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2">집객목표<br>(설정값)</th>
                            <td>IDCC</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>전시장</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
        <!-- //목표현황 -->

        <!-- 달성현황 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
                    <input type="text" id="sCustGoalStatusYear" name="sCustGoalStatusYear" value="" class="form_comboBox" style="width:100px;"><!-- 조회년도  -->
                    <input type="text" id="sCustGoalStatusMonth" name="sCustGoalStatusMonth" value="" class="form_comboBox" style="width:100px;"><!-- 조회월  -->
                    <input type="text" id="sCustGoalStatusDate" name="sCustGoalStatusDate" value="" class="form_comboBox" style="width:100px;"><!-- 조회일  -->
                    <button type="button" class="btn_s" id="btnsCustGoalStatusSearch" name="btnsCustGoalStatusSearch"><spring:message code="global.btn.search" /></button>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2">
            <form method="post" name="frmCustGoalStatus" id="frmCustGoalStatus" action="<c:url value="/mis/tdm/selectCustGoalStatusSearch.do"/>">
            <input type="hidden" id="sCustGoalStatusYearParam" name="sCustGoalStatusYearParam" value="">
            <input type="hidden" id="sCustGoalStatusMonthParam" name="sCustGoalStatusMonthParam" value="">
            <input type="hidden" id="sCustGoalStatusDateParam" name="sCustGoalStatusDateParam" value="">
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="custGoalGrid"></div>
            </div>
            <!-- 그리드 종료 -->
                </form>
            </div>
        </div>
        <!-- //달성현황 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>

<script>
    $(document).ready(function() {

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

        if('${sCustTargetStatusYear}' == "" || '${sCustTargetStatusYear}' == 'null') {
            $("#sCustTargetStatusYear").val(leadingZeros(now.getFullYear(), 4));
            $("#sCustTargetStatusYearParam").val(leadingZeros(now.getFullYear(), 4));
        } else {
            $("#sCustTargetStatusYear").val($("#sCustTargetStatusYearParam").val());
        }

        if('${sCustTargetStatusMonth}' == "" || '${sCustTargetStatusMonth}' == 'null') {
            $("#sCustTargetStatusMonth").val(leadingZeros(now.getMonth()+1, 2));
            $("#sCustTargetStatusMonthParam").val(leadingZeros(now.getMonth()+1, 2));
        } else {
            $("#sCustTargetStatusMonth").val($("#sCustTargetStatusMonthParam").val());
        }

        if('${sCustTargetStatusDate}' == "" || '${sCustTargetStatusDate}' == 'null') {
            $("#sCustTargetStatusDate").val(leadingZeros(now.getDate(), 2));
            $("#sCustTargetStatusDateParam").val(leadingZeros(now.getDate(), 2));
        } else {
            $("#sCustTargetStatusDate").val($("#sCustTargetStatusDateParam").val());
        }

        $("#sCustTargetStatusYear").kendoExtDropDownList({
            dataSource:["2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026"]
            ,index:0
        });

        $("#sCustTargetStatusMonth").kendoExtDropDownList({
            dataSource:["01","02","03","04","05","06","07","08","09","10","11","12"]
            ,index:0
        });

        $("#sCustTargetStatusDate").kendoExtDropDownList({
            dataSource:["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15"
                         ,"16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
            ,index:0
        });

        $("#btnsCustTargetStatusSearch").kendoButton({
            click:function(e) {
                $("#sCustTargetStatusYearParam").val($("#sCustTargetStatusYear").val());
                $("#sCustTargetStatusMonthParam").val($("#sCustTargetStatusMonth").val());
                $("#sCustTargetStatusDateParam").val($("#sCustTargetStatusDate").val());
                $('#frmCustTargetStatus').submit();
               }
        });

        $(".tab_area").kendoExtTabStrip({
            animation:false
        });

        if($("#sCustGoalStatusYearParam").val() == "" || $("#sCustGoalStatusYearParam").val() == 'null') {
            $("#sCustGoalStatusYear").val(leadingZeros(now.getFullYear(), 4));
            $("#sCustGoalStatusYearParam").val(leadingZeros(now.getFullYear(), 4));
        } else {
            $("#sCustGoalStatusYear").val($("#sCustGoalStatusYearParam").val());
        }

        if($("#sCustGoalStatusMonthParam").val() == "" || $("#sCustGoalStatusMonthParam").val() == 'null') {
            $("#sCustGoalStatusMonth").val(leadingZeros(now.getMonth()+1, 2));
            $("#sCustGoalStatusMonthParam").val(leadingZeros(now.getMonth()+1, 2));
        } else {
            $("#sCustGoalStatusMonth").val($("#sCustGoalStatusMonthParam").val());
        }

        if($("#sCustGoalStatusDateParam").val() == "" || $("#sCustGoalStatusDateParam").val() == 'null') {
            $("#sCustGoalStatusDate").val(leadingZeros(now.getDate(), 2));
            $("#sCustGoalStatusDateParam").val(leadingZeros(now.getDate(), 2));
        } else {
            $("#sCustGoalStatusDate").val($("#sCustGoalStatusDateParam").val());
        }

        $("#sCustGoalStatusYear").kendoExtDropDownList({
            dataSource:["2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026"]
            ,index:0
        });

        $("#sCustGoalStatusMonth").kendoExtDropDownList({
            dataSource:["01","02","03","04","05","06","07","08","09","10","11","12"]
            ,index:0
        });

        $("#sCustGoalStatusDate").kendoExtDropDownList({
            dataSource:["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15"
                         ,"16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
            ,index:0
        });

        $("#btnsCustGoalStatusSearch").kendoButton({
            click:function(e) {
                $('#custGoalGrid').data('kendoExtGrid').dataSource.page(1);
               }
        });

      //그리드 설정
        $("#custGoalGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0728-144300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdt/selectTargetDcptToolCustGoal.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCustGoalStatusYear"] = $("#sCustGoalStatusYear").val();
                            params["sCustGoalStatusMonth"] = $("#sCustGoalStatusMonth").val();
                            params["sCustGoalStatusDate"] = $("#sCustGoalStatusDate").val();

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
                            ,carlineCd:{type:"string", validation:{required:true}, editable:false}
                            ,goalPrefVal:{type:"string", validation:{required:true}, editable:false}
                            ,goalPrefRate:{type:"string", validation:{required:true}, editable:false}
                            ,goalPrefGap:{type:"string", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,height:600
            ,sortable:false
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:[
                {field:"carlineCd", title:"차종코드", width:100, attributes:{"class":"ac"}

                }
                ,{field:"goalPrefVal", title:"달성값", width:150, attributes:{"class":"ac"}

                }
                ,{field:"goalPrefRate", title:"진도", width:150, attributes:{"class":"ac"}

                }
                ,{field:"goalPrefGap", title:"차이", width:150

                }
            ]
        });
    });
</script>
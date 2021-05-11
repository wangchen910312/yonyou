<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title">Sparklines</h2>
            </div>

            <div id="example">
                <div class="demo-section k-content">
                    <div class="climate">
                        Climate Control History
                    </div>
                    <table class="history">
                        <tr>
                            <td class="spark"><span id="press-log"></span></td>
                        </tr>
                        <tr>
                            <td class="spark"><span id="temp-log"></span></td>
                        </tr>
                        <tr>
                            <td class="spark"><span id="hum-log"></span></td>
                        </tr>
                    </table>

                    <div class="temperature">
                        Temperature Control
                    </div>
                    <div class="stats">
                        <span id="temp-range"></span>
                    </div>

                    <div class="conditioner">
                        <h4>
                            Conditioner Working Time
                        </h4>

                        <ul class="pie-list stats">
                            <li>Mon <span id="stats-mon"></span></li>
                            <li>Tue <span id="stats-tue"></span></li>
                            <li>Wed <span id="stats-wed"></span></li>
                            <li>Thu <span id="stats-thu"></span></li>
                            <li>Fri <span id="stats-fri"></span></li>
                            <li>Sat <span id="stats-sat"></span></li>
                            <li>Sun <span id="stats-sun"></span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<style>
    .temperature, .conditioner {
        margin:0;
        padding:30px 0 0 0;
    }
    .history {
        border-collapse:collapse;
        width:100%;
    }
    .history td {
        padding:0;
        vertical-align:bottom;
    }
    .history td.value {
        font-size:1.6em;
        font-weight:normal;
        line-height:20px;
    }
    .history td.value span {
        font-size:.5em;
        vertical-align:top;
        line-height:30px;
    }
    .stats {
        text-align:center;
    }
    .pie-list {
        margin:0;
        padding:0;
        list-style-type:none;
    }
    .pie-list li {
        display:inline-block;
        text-align:center;
        width:34px;
        font-size:10px;
    }
    #stats-mon,
    #stats-tue,
    #stats-wed,
    #stats-thu,
    #stats-fri,
    #stats-sat,
    #stats-sun {
        display:block;
        width:34px;
        line-height:30px;
    }
    #temp-range {
        width:100%;
        line-height:30px
    }
</style>

<script type="text/javascript">
    createCharts = function() {
        $("#press-log").kendoSparkline({
            data:[
                936, 968, 1025, 999, 998, 1014, 1017, 1010, 1010, 1007,
                1004, 988, 990, 988, 987, 995, 946, 954, 991, 984,
                974, 956, 986, 936, 955, 1021, 1013, 1005, 958, 953,
                952, 940, 937, 980, 966, 965, 928, 916, 910, 980
            ]
        });

        $("#temp-log").kendoSparkline({
            type:"column",
            data:[
                16, 17, 18, 19, 20, 21, 21, 22, 23, 22,
                20, 18, 17, 17, 16, 16, 17, 18, 19, 20,
                21, 22, 23, 25, 24, 24, 22, 22, 23, 22,
                22, 21, 16, 15, 15, 16, 19, 20, 20, 21
            ],
            tooltip:{
                format:"{0} &deg;C"
            }
        });

        $("#hum-log").kendoSparkline({
            type:"area",
            data:[
                71, 70, 69, 68, 65, 60, 55, 55, 50, 52,
                73, 72, 72, 71, 68, 63, 57, 58, 53, 55,
                63, 59, 61, 64, 58, 53, 46, 48, 45, 45,
                63, 64, 63, 67, 58, 56, 53, 59, 51, 54
            ],
            tooltip:{
                format:"{0} %"
            }
        });

        $("#temp-range").kendoSparkline({
            type:"bullet",
            data:[21, 23],
            valueAxis:{
                min:0,
                max:30,
                plotBands:[{
                    from:0, to:15, opacity:0.15
                }, {
                    from:15, to:22, opacity:0.3
                }, {
                    from:22, to:30, opacity:0.15
                }]
            },
            tooltip:{
                visible:true
            }
        });

        $("#stats-mon").kendoSparkline({
            type:"pie",
            data:[14, 10]
        });

        $("#stats-tue").kendoSparkline({
            type:"pie",
            data:[8, 16]
        });

        $("#stats-wed").kendoSparkline({
            type:"pie",
            data:[8, 16]
        });

        $("#stats-thu").kendoSparkline({
            type:"pie",
            data:[12, 12]
        });

        $("#stats-fri").kendoSparkline({
            type:"pie",
            data:[6, 18]
        });

        $("#stats-sat").kendoSparkline({
            type:"pie",
            data:[1, 23]
        });

        $("#stats-sun").kendoSparkline({
            type:"pie",
            data:[5, 19]
        });
    }

    $(document).ready(createCharts);
    $(document).bind("kendo:skinChange", createCharts);
</script>
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
                <h2 id="content_list_title">Donut Charts</h2>
            </div>

            <div id="example">
                <div class="demo-section k-content wide">
                    <div id="chart" style="background:center no-repeat url('');">
                    </div>
                </div>
            </div>
        </section>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script type="text/javascript">
    var names       = "";
    var category    = "";
    var value       = "";

    var labels      = {};

    var firstData   = [];
    var secondData  = [];
    var mainData    = [];

    names = "Total Visitors";

    firstData.push({"category":"Asia", "value":30.8});
    firstData.push({"category":"Europe", "value":21.1});
    firstData.push({"category":"Latin America", "value":16.3});
    firstData.push({"category":"Africa", "value":17.6});
    firstData.push({"category":"Middle Eash", "value":9.2});
    firstData.push({"category":"North America", "value":4.6});

    mainData.push({"name":names, "data":firstData});

    names = "2012";

    secondData.push({"category":"Asia", "value":5.8});
    secondData.push({"category":"Europe", "value":16.1});
    secondData.push({"category":"Latin America", "value":11.3});
    secondData.push({"category":"Africa", "value":9.6});
    secondData.push({"category":"Middle Eash", "value":5.2});
    secondData.push({"category":"North America", "value":3.6});

    labels = {visible:true, background:"transparent", position:"outsideEnd", template:"#= category #:\n #= value #%"};

    mainData.push({"name":names, "data":secondData, "labels":labels});

    createCharts = function() {
        $("#chart").kendoChart({
            title:{
                text:"Share of Internet Population Growth"
            },
            legend:{
                visible:true
            },
            chartArea:{
                background:""
            },
            seriesDefaults:{
                type:"donut",
                startAngle:300
            },
            series:mainData,
            tooltip:{
                visible:true,
                template:"#= category # (#= series.name #):#= value #%"
            }
        });
    }

    $(document).ready(createCharts);
    $(document).bind("kendo:skinChange", createCharts);
</script>
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
                <h2 id="content_list_title">Line Charts</h2>
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
    var names = "";

    var totalData   = [];
    var uniqueData  = [];
    var mainData    = [];

    names = "Total Visitors";
    totalData.push(56000);
    totalData.push(63000);
    totalData.push(74000);
    totalData.push(91000);
    totalData.push(117000);
    totalData.push(138000);

    mainData.push({"name":names, "data":totalData});

    names = "Unique Visitors";
    uniqueData.push(52000);
    uniqueData.push(34000);
    uniqueData.push(23000);
    uniqueData.push(48000);
    uniqueData.push(67000);
    uniqueData.push(83000);

    mainData.push({"name":names, "data":uniqueData});

    createCharts = function() {
        $("#chart").kendoChart({
            title:{
                text:"Site Visitors Stats"
            },
            legend:{
                visible:true
            },
            seriesDefaults:{
                type:"line"
            },
            series:mainData,
            valueAxis:{
                max:140000,
                line:{
                    visible:true
                },
                labels:{
                    rotation:"auto"
                }
            },
            categoryAxis:{
                categories:["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
                majorGridLines:{
                    visible:false
                }
            },
            tooltip:{
                visible:true,
                template:"#= series.name #:#= value #"
            }
        });
    }

    $(document).ready(createCharts);
    $(document).bind("kendo:skinChange", createCharts);
</script>
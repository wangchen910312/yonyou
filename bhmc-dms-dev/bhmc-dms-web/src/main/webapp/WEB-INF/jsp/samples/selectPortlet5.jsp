<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <div style="text-align:center;" id="ptl-sample-5">
        <div id="chart"></div>
    </div>
    <script>
        function createChart() {
            $("#chart").kendoChart({
                title:{
                    text:"售后月报"
                },
                legend:{
                    visible:false
                },
                seriesDefaults:{
                    type:"bar"
                },
                series:[{
                    name:"目标",
                    data:[56000, 63000, 74000, 91000, 117000, 138000]
                }, {
                    name:"实际",
                    data:[52000, 34000, 23000, 48000, 67000, 83000]
                }],
                valueAxis:{
                    max:140000,
                    line:{
                        visible:false
                    },
                    minorGridLines:{
                        visible:true
                    },
                    labels:{
                        rotation:"auto"
                    }
                },
                chartArea:{
                    height:200
                    ,width:540
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

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

	<div style="height:80%" id="ptl-sample-6">
        <div id="p6chart" style="height:80%"></div>
    </div>
    <script>
        function createChart() {
            $("#p6chart").kendoChart({
                title:{
                    position:"bottom"//,
                    ,text:"按车种统计售后金额"
                },
                legend:{
                    visible:false
                },
                xAxis:{
                    line:{
                      visible:false
                    }
                  },
                chartArea:{
                    background:""
                        ,height:220
                        ,margin:{
                            top:45
                          }
                },
                seriesDefaults:{
                    labels:{
                        visible:true,
                        background:"transparent",
                        template:"#= category #:\n #= value#%"
                    }
                },
                series:[{
                    type:"pie",
                    startAngle:150,
                    data:[{
                        category:"伊兰特-领动 1.6AT",
                        value:53.8,
                        color:"#9de219"
                    },{
                        category:"索纳塔八代2.4AT",
                        value:16.1,
                        color:"#90cc38"
                    },{
                        category:"名图1.8AT",
                        value:11.3,
                        color:"#068c35"
                    },{
                        category:"胜达2.0AT",
                        value:9.6,
                        color:"#006634"
                    },{
                        category:"胜达2.4AT",
                        value:5.2,
                        color:"#004d38"
                    },{
                        category:"途胜",
                        value:3.6,
                        color:"#033939"
                    }]
                }],
                tooltip:{
                    visible:true,
                    format:"{0}%"
                }
            });
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>

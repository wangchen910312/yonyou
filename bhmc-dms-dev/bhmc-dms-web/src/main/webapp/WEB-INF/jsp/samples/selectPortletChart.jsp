<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <div style="text-align:center;" id="ptl-chart-2">
        <div id="saleschart"></div>
    </div>
    <script>

        function createChart() {
            var serisData = [];
            var salesData = [];
            var categData = [];

            var condition = {"sYearMonth":"201703"};
            $.ajax({
                url:"<c:url value='/sal/rpt/ptl/selectSalesOrderStatsPtl.do' />"
                ,data:JSON.stringify(condition)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    //dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    for (var i=0; i<jqXHR.data.length; i++) {
                        categData.push(jqXHR.data[i].carlineNm);
                        salesData.push(jqXHR.data[i].msale);
                    }

                    serisData.push({"name":"sales", "data":salesData});

                    $("#saleschart").kendoChart({
                        title:{
                            text:"售后月报"
                        },
                        legend:{
                            visible:false
                        },
                        seriesDefaults:{
                            type:"bar"
                        },
                        series:serisData,
                        valueAxis:{
                            max:10,
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
                            ,width:500
                          },
                        categoryAxis:{
                            categories:categData,
                            majorGridLines:{
                                visible:false
                            }
                        },
                        tooltip:{
                            visible:true,
                            template:"#= series.name #:#= value #"
                        },
                        plotAreaClick:function(e) {

                            var params = {};
                            params["tCd"] = "11096";
                            $.ajax({
                                url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoByTcd.do' />"
                                ,data:JSON.stringify(params)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                            }).done(function(viewData) {
                                if(viewData != null && !dms.string.isEmpty(viewData.viewUrl)){
                                    parent._addTabMenu(viewData.viewNm, _contextPath + viewData.viewUrl, viewData.tCd, viewData.viewId);
                                }
                            });
                        }
                    });

                }
            });


        }
        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>

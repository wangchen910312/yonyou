<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <!-- <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
    </ul> -->
    <ul data-role="listview" id="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:65%;">#:rowData.vinNo#</span>
    <span style="width:35%;">#:fnChangeynObj(rowData.confirmYn)#</span>
    <span style="width:65%;" class="clboth">#:rowData.ocnCd#/#:rowData.modelNm#</span>
    <span style="width:35%;">[#:rowData.carlineCd#]#:rowData.carlineNm#</span>
    <span style="width:65%;" class="clboth">#:rowData.stockAgingCnt#</span>
</div>
</script>

<script type="text/javascript">
    var pageIndex = 0;
    var pageSize = 1000;
    var rowIndex = 0;
    var rowTotal = 1000;
    var listData = new kendo.data.DataSource({
        transport:{
            read:function(options) {
                if (rowIndex >= rowTotal) {
                    return;
                }

                app.showLoading();
                pageIndex++;

                var params = {};
                params["recordCountPerPage"] = pageSize;
                params["pageIndex"] = pageIndex;
                params["firstIndex"] = (pageIndex - 1) * pageSize;
                params["lastIndex"] = pageIndex * pageSize;
                params["sort"] = [{"dir":"desc","field":"confirmYn"}];

                params["sConfirmYn"] = parent.$("#sConfirmYn").val();
                params["sStockDt"] = chgDate(parent.$("#sStockDt").val());
                params["sVinNo"] = parent.$("#sVinNo").val();


                $.ajax({
                    url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailSearch.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        checklistCnt("listarea_noData", result.total, noDatamsg);
                        var stockNoSum=0;
                        var stockDoneSum=0;
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;

                                data.push({rowData:result.data[i]});

                                if(row.confirmYn == "Y"){
                                    stockDoneSum++;
                                }else{
                                    stockNoSum++;
                                }
                            });

                            parent.makeDetailHtml(result.data, parent.keyMapArr, "#defaultHtml", "#hiddenHtml");

                            parent.$("#stockSum").text(result.total);
                            parent.$("#stockDoneSum").text(stockDoneSum);
                            parent.$("#stockNoSum").text(stockNoSum);

                            options.success(data);
                            //app.hideLoading();
                        }
                        else {
                            parent.$("#stockSum").text(0);
                            parent.$("#stockDoneSum").text(0);
                            parent.$("#stockNoSum").text(0);
                            parent.setMainListHeightId(".listarea",0);
                            //app.hideLoading();
                        }
                    }
                });
            }
        },
        requestEnd: function(e) {
            app.hideLoading();
        },
        pageSize:pageSize,
        serverPaging:true,
        schema:{
            total:function(){ return rowTotal; }
        }
    });


    fnChangeynObj = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.ynObj[val];
        }

        return returnVal;
    };

    listViewClick = function(e) {
        parent.contentDetail(e.dataItem.rowData);
    }
    var app = setKendoMobApp();

    //var app = setKendoMobAppForNativeScroll();
</script>
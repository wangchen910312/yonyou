<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <ul data-role="listview" data-source="listData" data-template="list-template">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem bgNone">
    <span style="width:15%">#:rowIdx #</span>
    <span style="width:50%">#:targNm #</span>
    <span style="width:35%">#:targCntVal #</span>
</div>
</script>

<script type="text/javascript">
    var pageIndex = 0;
    var pageSize = 100;
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
                params["sort"] = null;

                params["sDlrCd"] = parent.$("#sDlrCd").val();
                params["sMakCd"] = parent.$("#sMakCd").val();

                $.ajax({
                    url:"<c:url value='/crm/mcm/marketingCampaign/selectGoals.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        checklistCnt("detailList_noData5", result.total, noDatamsg);
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;
                                data.push({pageIdx:pageIndex,
                                    rowIdx:rowIndex,
                                    targNm:row.targNm,
                                    targCntVal:row.targCntVal
                                });
                            });

                            options.success(data);
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", rowTotal);
                            parent.setSubListHeightNew("detailList",1,rowTotal);
                        }
                        else {
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", 0);
                            parent.setSubListHeightNew("detailList",1,0);
                        }
                    }
                });
            }
        },
        pageSize:pageSize,
        serverPaging:true,
        schema:{
            total:function(){ return rowTotal; }
        }
    });

    //var app = setKendoMobApp();
    var app = setKendoMobAppForNativeScroll();
</script>
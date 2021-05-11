<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
    <ul data-role="listview" data-source="listData" data-template="list-template">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem bgNone">
        <span style="width:30%">#:trimNull(custNm) #</span>
        <span style="width:40%">#:trimNull(pconCustNm) #</span>
        <span style="width:30%">#:activeStatCdListVal(activeStatCd) #</span>
        <span class="clboth" style="width:30%">#:activeTpCdListVal(activeTpCd) #</span>
        <span style="width:70%">#:activeTpSubCdListVal(activeTpSubCd) #</span>
        <span class="clboth" style="width:30%">#:trimNull(regUsrId) #</span>
        <span style="width:70%">#:trimNull((regDt)) #</span>
        <span class="clboth" style="width:100%">#:trimNull(activeCont) #/#:trimNull(activeRsltCont) #</span>
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

                params["sDlrCd"]       = parent.$("#sDlrCd").val();
                /* params["sPltCd"]       = parent.$("#sPltCd").val(); */
                params["sVocNo"]       = parent.$("#sVocNo").val();

                $.ajax({
                    url:"<c:url value='/mob/crm/crq/vocMgmt/selectActives.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;
                                data.push({pageIdx:pageIndex,
                                    rowIdx:rowIndex,
                                    custNm:row.custNm,
                                    pconCustNm:row.pconCustNm,
                                    activeStatCd:row.activeStatCd,
                                    activeTpCd:row.activeTpCd,
                                    activeTpSubCd:row.activeTpSubCd,
                                    regUsrId:row.regUsrId,
                                    regDt:row.regDt,
                                    activeCont:row.activeCont,
                                    activeRsltCont:row.activeRsltCont
                                });
                            });

                            options.success(data);
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", rowTotal);
                            parent.setSubListHeightNew("detailList",4,rowTotal);
                        }
                        else {
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", 0);
                            parent.setSubListHeightNew("detailList",4,0);
                        }

                        checklistCnt("subList_noData", result.total, noDatamsg);
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

    activeStatCdListVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.activeStatCdMap[val];
        }
        return returnVal;
    };

    activeTpCdListVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.activeTpCdMap[val];
        }
        return returnVal;
    };

    activeTpSubCdListVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.activeTpSubCdMap[val];
        }
        return returnVal;
    };

    //var app = setKendoMobApp();
    var app = setKendoMobAppForNativeScroll();
</script>
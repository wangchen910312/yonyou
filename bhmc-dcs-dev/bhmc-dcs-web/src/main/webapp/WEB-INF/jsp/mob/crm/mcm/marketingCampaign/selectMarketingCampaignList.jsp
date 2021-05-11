<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:100%">#:makNm #</span>
    <span class="clboth" style="width:40%">#:hostTeamNm #</span>
    <span style="width:40%">#:fnChangeStat(statCd) #</span>
    <span style="width:20%">#:fnChangeMakTpCd(makTpCd) #</span>
    <span class="clboth" style="width:40%">#:chgDate2Str(startDt) #</span>
    <span style="width:60%">#:chgDate2Str(endDt) #</span>
</div>
</script>

<script type="text/javascript">
    //시스템 날짜 정보 가져오기.
    /* var vDateTimeFormat = "${_dateTimeFormat}";
    var vDtyyyyMMdd = "${_dateFormat}";

    var dlrCd  = "${dlrCd}";    // 딜러코드
    var dlrNm  = "${dlrNm}";    // 딜러
    var userId = "${userId}";   // 사용자코드
    var userNm = "${userNm}";   // 사용자
    var toDay = "${toDay}";     // 현재일자
    var oneDay = "${oneDay}";   // 해당월 1일 */

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

                params["sMakNm"] = parent.$("#sMakNm").val();
                params["sHostCd"] = parent.$("#sHostCd").val();
                params["sHostTeamCd"] = parent.$("#sHostTeamCd").val();
                params["sMakTpCd"] = parent.$("#sMakTpCd").val();
                params["sMakSubTpCd"] = parent.$("#sMakSubTpCd").val();
                params["sStatCd"] = parent.$("#sStatCd").val();
                params["sStartDt"] = new Date(parent.$("#sStartDt").val());
                params["sEndDt"] = new Date(parent.$("#sEndDt").val());

                $.ajax({
                    url:"<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaignLists.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
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
                                     makCd:row.makCd,
                                     makNm:row.makNm,
                                     hostTeamNm:row.hostTeamNm,
                                     statCd:row.statCd,
                                     makTpCd:row.makTpCd,
                                     startDt:row.startDt,
                                     endDt:row.endDt});
                            });

                            options.success(data);
                            app.hideLoading();
                        }
                        else {
                            app.hideLoading();
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

    fnChangehostTeamCd = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.hostTeamList[val];
        }

        return returnVal;
    };

    fnChangeStat = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.statCdObj[val];
        }

        return returnVal;
    };

    fnChangeMakTpCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.makTpCdObj[val];
        }

        return returnVal;
    }

    listViewClick = function(e) {
        parent.fnContentDetail(e.dataItem.makCd);
    }

    var app = setKendoMobApp();
    //var app = setKendoMobAppForNativeScroll();
</script>
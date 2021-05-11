<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%">#:chgDateFormat(vsitDt) #</span>
    <span style="width:50%">#:trimNull(custNm) #</span>
    <span style="width:50%" class="clboth" >#:chgDateFormat(vsitEndDtFormat) #</span>
    <span style="width:50%">#:trimNull(hpNo) #</span>
    <!--<span style="width:50%">#:trimNull(vistPrdmm) #</span>-->
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var strParams ="";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({

    transport:{
        read:{
            url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmt.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            app.showLoading();
            if (operation === "read") {

                var params = {};

                params["recordCountPerPage"] = options.pageSize;
                params["pageIndex"] = options.page;
                params["firstIndex"] = options.skip;
                params["lastIndex"] = options.skip + options.take;
                params["sort"] = options.sort;

                var sRegDtFrom = parent.$("#sRegDtFrom").val();
                var sRegDtTo = parent.$("#sRegDtTo").val();

                if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                        (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                ){
                   mob.notification.warning("<spring:message code='global.lbl.allocDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
                }

                //params["sStartDt"] = new Date( parent.$("#sStartDt").val());
                //params["sEndDt"] = new Date(parent.$("#sEndDt").val());

                if(parent.$("#sRegDtFrom").val() == "" /*|| parent.$("#search7Area span[name='searchStr']").text() == ""*/){
                    params["sVsitDtFrom"] = null;
                }else{
                    params["sVsitDtFrom"] = chgDate(parent.$("#sRegDtFrom").val());
                }

                if(parent.$("#sRegDtTo").val() == "" /*|| parent.$("#search7Area span[name='searchStr']").text() == ""*/){
                    params["sVsitDtTo"] = null;
                }else{
                    params["sVsitDtTo"] = chgDate(parent.$("#sRegDtTo").val());
                }

                params["sCustNm"] = parent.$("#sCustNm").val();
                params["sHpNo"] = parent.$("#sHpNo").val();
                params["sMngScId"] = parent.$("#sMngScId").data("kendoExtDropDownList").value();
                params["sHoldTp"] = parent.$("#sInfoPathCd").data("kendoExtDropDownList").value();
                params["sLeadStatCd"] = parent.$("#sLeadStatCd").data("kendoExtDropDownList").value();
                params["sInfoTp"] = parent.$("#sInfoTpList").data("kendoExtDropDownList").value();
                /* params["sBhmcYn"] = parent.$("#sBhmcYn").data("kendoExtDropDownList").value(); */
                params["sIntrCarlineCd"] = parent.$("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                params["sIntrFscpModtpCd"] = parent.$("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
                params["sTraceGradeCd"] = parent.$("#sTraceGradeCd").data("kendoExtDropDownList").value();

                parent.$("#content_list").css("display","block");
                strParams = kendo.stringify(params);
console.log(params);

                return kendo.stringify(params);

            }
        }
    }
    ,batch:true
    ,pageSize:pageSize
    ,serverPaging:true
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
            ,fields:{
                rnum:{type:"number"}
                            , vsitResvDt:{type:"date"}
                            , vsitDt:{type:"date"}
                            , vsitEndDt:{type:"date"}
                            , expcPurcDt:{type:"date"}
                            , traceDt:{type:"date"}
                            , nextTraceDt:{type:"date"}
                            , regDt:{type:"date"}
                            , updtDt:{type:"date"}
                            , vsitResvDtFormat:{type:"date"}
                            , vsitDtFormat:{type:"date"}
                            , vsitEndDtFormat:{type:"date"}
                            , traceDtFormat:{type:"date"}
                            , nextTraceDtFormat:{type:"date"}
                            , regDtFormat:{type:"date"}
                            , updtDtFormat:{type:"date"}
                            , vistPrdmm:{type:"string"}
            }
        },parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                console.log("d.data",d.data);
                                elem.vsitResvDtFormat = kendo.parseDate(elem.vsitResvDt, "<dms:configValue code='dateFormat' />");
                                elem.vsitDtFormat = elem.vsitDt;
                                elem.vsitEndDtFormat = elem.vsitEndDt;
                                elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateFormat' />");
                                elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");

                            });
                        }
                        app.hideLoading();
                        return d;
                    }
    },
    change :function(e){
        $.ajax({
            url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmtSummary.do' />"
            ,data:strParams
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                //app.hideLoading();
                parent.$("#visitingCustCnt").text("0");
                parent.$("#visitLeaveCnt").text("0");
            }
            ,success:function(result) {
                if(result!=null && result!= ""){
                    parent.$("#visitingCustCnt").text(result.stayRoomCnt);
                    parent.$("#visitLeaveCnt").text(result.leaveRoomCnt);
                }
            }
        });
        parent.$("#totalSum").text(this.total());

        app.hideLoading();
        checklistCnt("listarea_noData9",this.total(),noDatamsg);
        //checklistCnt("listarea_noData",this.total(),noDatamsg);
        //parent.setMainListHeight();
    }
    ,error:function(e){
        console.log(e);
        app.hideLoading();
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});

function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
}

chgDateFormat = function(val){
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm')
    }else{
        returnVal = '';
    }
    return returnVal;
}


var app = setKendoMobApp();
//var app = setKendoMobAppForNativeScroll();
</script>

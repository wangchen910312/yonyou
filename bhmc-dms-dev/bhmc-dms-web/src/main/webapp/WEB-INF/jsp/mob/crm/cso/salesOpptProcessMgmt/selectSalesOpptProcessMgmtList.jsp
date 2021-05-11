<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="${template}" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div name="listMain2" class="checkitem">
    <span class="check" name="check">
        <input id="isSave_#:rnum #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rnum #"></label>
        <input type="hidden" name="seq" value="#:trimNull(id) #" />
        <input type="hidden" name="custNo" value="#:trimNull(custNo) #">
    </span>
    <span style="width:30%" class="spanNormal" >#:trimNull(leadStatNm)   #</span>
    <span style="width:40%" class="spanNormal" >#:trimNull(custNm) #</span>
    <span style="width:30%" class="spanNormal" >#:trimNull(hpNo) #</span>
    <span style="width:30%" class="spanNormal" >#:trimNull(infoTpNm) #</span>
    <span style="width:40%" class="spanNormal" >#:trimNull(validGradeNm) #</span>
    <span style="width:30%" class="spanNormal" >#:trimNull(traceGradeNm) #</span>
</div>
</script>

<script type="text/x-kendo-template" id="list-template2">
<div name="listMain" class="dlistitem">
    <span style="width:30%" class="spanNormal">#:trimNull(leadStatNm)   #</span>
    <span style="width:40%" class="spanNormal">#:trimNull(custNm) #</span>
    <span style="width:30%" class="spanNormal">#:trimNull(hpNo) #</span>
    <span style="width:30%" class="spanNormal">#:trimNull(infoTpNm) #</span>
    <span style="width:40%" class="spanNormal">#:trimNull(validGradeNm) #</span>
    <span style="width:30%" class="spanNormal">#:trimNull(traceGradeNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 50;
var rowIndex = 0, rowTotal = 100;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
    template:kendo.template($("#list-template2").html()),
    transport:{
        read:{
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
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
                params["sort"] = [{"dir":"desc","field":"sRegDtFrom"}]

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

                if(parent.$("#sRegDtFrom").val() == "" /* || parent.$("#search7Area span[name='searchStr']").text() == "" */){
                    params["sSubmitDtFrom"] = null;
                }else{
                    params["sSubmitDtFrom"] = chgDate(parent.$("#sRegDtFrom").val());
                }

                if(parent.$("#sRegDtTo").val() == ""  /* || parent.$("#search7Area span[name='searchStr']").text() == "" */){
                    params["sSubmitDtTo"] = null;
                }else{
                    params["sSubmitDtTo"] = chgDate(parent.$("#sRegDtTo").val());
                }

                //20170518 hg
                if(parent.$("#sNewDtFrom").val() == ""){
                    params["sLeadStartDtFrom"] = null;
                }else{
                    params["sLeadStartDtFrom"] = chgDate(parent.$("#sNewDtFrom").val());
                }

                if(parent.$("#sNewDtTo").val() == ""){
                    params["sLeadStartDtTo"] = null;
                }else{
                    params["sLeadStartDtTo"] = chgDate(parent.$("#sNewDtTo").val());
                }

                params["sCust"] = "";
                //params["sRegDtFrom"] = null;
                //params["sRegDtTo"] = null;

                params["sCustNm"] = parent.$("#sCustNm").val();
                params["sHpNo"] = parent.$("#sHpNo").val();
                params["sMngScId"] = parent.$("#sMngScId").data("kendoExtDropDownList").value();
                //params["sMngScId"] = "";
                params["sHoldTp"] = parent.$("#sInfoPathCd").data("kendoExtDropDownList").value();
                params["sInfoTp"] = parent.$("#sInfoTpList").data("kendoExtDropDownList").value();
                params["sLeadStatCd"] = parent.$("#sLeadStatCd").data("kendoExtDropDownList").value();
                /* params["sBhmcYn"] = parent.$("#sBhmcYn").data("kendoExtDropDownList").value(); */
                params["sIntrCarlineCd"] = parent.$("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                params["sIntrFscpModtpCd"] = parent.$("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
                params["sTraceGradeCd"] = parent.$("#sTraceGradeCd").data("kendoExtDropDownList").value();

                params["sLeadStatIng"] = "S";

                parent.$("#content_list").css("display","block");
                console.log("params ::: ", params);
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
            }
        }
        ,parse:function(d) {
            app.hideLoading();
            return d;
        }
    },

    change :function(e){
        app.hideLoading();
        checklistCnt("listarea_noData",this.total(),noDatamsg);
    }
    ,requestEnd: function() {
    }
    ,error:function(e){
        console.log(e);
        app.hideLoading();
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});


function listViewClick(e)
{
    var Data = e.dataItem;
    $(document).on("click", ".spanNormal", function(e){
        parent.contentDetail(Data);
    });
}


var app = setKendoMobApp();
//var app = setKendoMobAppForNativeScroll();
</script>

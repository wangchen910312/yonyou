<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

            <div class="listarea" id="salesOpptProgGrid">
                <div id="listhead" class="listhead dlistitem">
                    <span style="width:30%"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></span>
                    <span style="width:40%"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span>
                    <span style="width:30%"><spring:message code='global.lbl.hpNo' /><!-- 전화번호 --></span>
                    <span class="clboth" style="width:30%"><spring:message code='crm.lbl.infoType' /><!-- 리드유형 --></span>
                    <span style="width:40%"><spring:message code='crm.lbl.validCheck' /><!-- 유효성판단--></span>
                    <span style="width:30%"><spring:message code='crm.lbl.activeGrade' /><!-- 추적등급 --></span>
                </div>
                <div>
                    <div id="listView" style="height:300px; overflow:scroll;"></div>
                </div>
                <div class="checkitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
<script type="text/x-kendo-template" id="template">
# if( btnLeadStatCd == "01"){ #
<div name="listMain2" class="checkitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
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
# }else{#
<div name="listMain" class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:30%" class="spanNormal">#:trimNull(leadStatNm)   #</span>
    <span style="width:40%" class="spanNormal">#:trimNull(custNm) #</span>
    <span style="width:30%" class="spanNormal">#:trimNull(hpNo) #</span>
    <span style="width:30%" class="spanNormal">#:trimNull(infoTpNm) #</span>
    <span style="width:40%" class="spanNormal">#:trimNull(validGradeNm) #</span>
    <span style="width:30%" class="spanNormal">#:trimNull(traceGradeNm) #</span>
</div>
# }#
</script>
<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
    //template:kendo.template($("#list-template2").html()),
    transport:{
        read:{
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;
                params["sort"] = [{"dir":"desc","field":"sRegDtFrom"}]

                var sRegDtFrom = $("#sRegDtFrom").val();
                var sRegDtTo = $("#sRegDtTo").val();

                if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                        (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                ){
                   mob.notification.warning("<spring:message code='global.lbl.allocDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
                }
                if($("#sRegDtFrom").val() == "" /* || $("#search7Area span[name='searchStr']").text() == "" */){
                    params["sSubmitDtFrom"] = null;
                }else{
                    params["sSubmitDtFrom"] = chgDate($("#sRegDtFrom").val());
                }

                if($("#sRegDtTo").val() == ""  /* || $("#search7Area span[name='searchStr']").text() == "" */){
                    params["sSubmitDtTo"] = null;
                }else{
                    params["sSubmitDtTo"] = chgDate($("#sRegDtTo").val());
                }
                if($("#sNewDtFrom").val() == ""){
                    params["sLeadStartDtFrom"] = null;
                }else{
                    params["sLeadStartDtFrom"] = chgDate($("#sNewDtFrom").val());
                }

                if($("#sNewDtTo").val() == ""){
                    params["sLeadStartDtTo"] = null;
                }else{
                    params["sLeadStartDtTo"] = chgDate($("#sNewDtTo").val());
                }

                params["sCust"] = "";
                params["sCustNm"] = $("#sCustNm").val();
                params["sHpNo"] = $("#sHpNo").val();
                params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
                params["sHoldTp"] = $("#sInfoPathCd").data("kendoExtDropDownList").value();
                params["sInfoTp"] = $("#sInfoTpList").data("kendoExtDropDownList").value();
                params["sLeadStatCd"] = $("#sLeadStatCd").data("kendoExtDropDownList").value();
                params["sIntrCarlineCd"] = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                params["sIntrFscpModtpCd"] = $("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
                params["sTraceGradeCd"] = $("#sTraceGradeCd").data("kendoExtDropDownList").value();
                params["sLeadStatIng"] = "S";
                $("#content_list").css("display","block");
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    ,pageSize:pageSize
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
            return d;
        }
    },
    change :function(e){
        //listView 높이 설정
        var gap = 10;
        var btnareaHeight = ($(".btnarea").css("display") == "block")? $(".btnarea").outerHeight() : 0;
        $("#listView").height($(window).height()-($("#header").outerHeight()
                +btnareaHeight
                +$("#content_list > .content_title").outerHeight()
                +$(".listhead").outerHeight()
                +$(".tabarea2").outerHeight()
                +gap
                ));
        //--

        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        //checklistCnt("listarea_noData",this.total(),noDatamsg);
    }
    ,requestEnd: function() {
    }
    ,error:function(e){
        console.log(e);
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});
function listViewClick(data)
{
    $(document).on("click", ".spanNormal", function(e){
        contentDetail(data);
    });
}
</script>

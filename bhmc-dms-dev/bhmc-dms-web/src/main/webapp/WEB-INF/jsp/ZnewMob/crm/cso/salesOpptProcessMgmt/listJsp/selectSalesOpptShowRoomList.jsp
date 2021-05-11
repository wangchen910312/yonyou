<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

        <div class="listarea" id="salesOpptShowRoomGrid" style="display:none">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code='crm.lbl.visitDt' /><!-- 방문시간 --></span>
                <span style="width:50%"><spring:message code='par.lbl.custNm' /><!-- 고객명 --></span>
                <span style="width:50%" class="clboth"><spring:message code='crm.lbl.goOutTime' /><!-- 떠난시간 --></span>
                <span style="width:50%"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></span>
            </div>
            <div>
                <div id="subListView2" style="height:300px; overflow:scroll;"></div>
            </div>
            <div class="checkitem bgNone" style="display:none;" id="listarea_noData9"><span></span></div>
        </div>
        <div class="btnfixed txtarea">
            <div class="dlistitem bgNone" style="text-align: left;">
                <span style="width:25%"><spring:message code='crm.lbl.visitingCustCnt' />:<!-- 매장내수 --></span>
                <span style="width:10%" id="visitingCustCnt"></span>
                <span style="width:20%"><spring:message code='crm.lbl.visitLeaveCnt' />:<!-- 떠난수 --></span>
                <span style="width:10%" id="visitLeaveCnt"></span>
                <span style="width:20%"><spring:message code='crm.lbl.total' />:<!-- 총수 --></span>
                <span style="width:10%" id="totalSum"></span>
            </div>
        </div>
<script type="text/x-kendo-template" id="subTemplate2">
<div class="dlistitem" onclick="javascript:subListViewClick2(subListData2._view[#:rnum-1 #]);">
    <span style="width:50%">#:chgDateFormat(vsitDt) #</span>
    <span style="width:50%">#:trimNull(custNm) #</span>
    <span style="width:50%" class="clboth" >#:chgDateFormat(vsitEndDtFormat) #</span>
    <span style="width:50%">#:trimNull(hpNo) #</span>
</div>
</script>
<script>
//시스템 날짜 정보 가져오기.
var strParams ="";
var viewRow2=10;//한번에 조회할 건수
var pageIndex2 = 0, pageSize2 = viewRow2, rowTotal2 = 0;
// datasource below is customized for demo purposes.
var subListData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmt.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};

                params["firstIndex"]=pageIndex2;
                params["lastIndex"]=pageSize2;

                var sRegDtFrom = $("#sRegDtFrom").val();
                var sRegDtTo = $("#sRegDtTo").val();

                if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                        (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                ){
                   mob.notification.warning("<spring:message code='global.lbl.allocDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
                }
                if($("#sRegDtFrom").val() == "" /*|| parent.$("#search7Area span[name='searchStr']").text() == ""*/){
                    params["sVsitDtFrom"] = null;
                }else{
                    params["sVsitDtFrom"] = chgDate($("#sRegDtFrom").val());
                }

                if($("#sRegDtTo").val() == "" /*|| parent.$("#search7Area span[name='searchStr']").text() == ""*/){
                    params["sVsitDtTo"] = null;
                }else{
                    params["sVsitDtTo"] = chgDate($("#sRegDtTo").val());
                }

                params["sCustNm"] = $("#sCustNm").val();
                params["sHpNo"] = $("#sHpNo").val();
                params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
                params["sHoldTp"] = $("#sInfoPathCd").data("kendoExtDropDownList").value();
                params["sLeadStatCd"] = $("#sLeadStatCd").data("kendoExtDropDownList").value();
                params["sInfoTp"] = $("#sInfoTpList").data("kendoExtDropDownList").value();
                params["sIntrCarlineCd"] = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                params["sIntrFscpModtpCd"] = $("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
                params["sTraceGradeCd"] = $("#sTraceGradeCd").data("kendoExtDropDownList").value();

                $("#content_list").css("display","block");
                strParams = kendo.stringify(params);
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
            return d;
        }
    },
    change :function(e){


        rowTotal2=this._total;
        if(rowTotal2 == 0){
            tempData2=[];
            subListData2._view=tempData2;
        }else{
            tempData2.push.apply(tempData2, this._data);
            subListData2._view=tempData2;
        }

        $.ajax({
            url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmtSummary.do' />"
            ,data:strParams
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                $("#visitingCustCnt").text("0");
                $("#visitLeaveCnt").text("0");
            }
            ,success:function(result) {
                if(result!=null && result!= ""){
                    $("#visitingCustCnt").text(result.stayRoomCnt);
                    $("#visitLeaveCnt").text(result.leaveRoomCnt);
                }
            }
        });
        $("#totalSum").text(this.total());
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});
function subListViewClick2(data)
{
    contentDetail(data);
}
$(document).ready(function(){
    $("#subListView2").kendoListView({
        dataSource:subListData2
        ,template:kendo.template($("#subTemplate2").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            var gap=10;
            $("#subListView2").height($(window).height()-($("#header").outerHeight()
                    +$(".btnfixed").outerHeight()
                    +$("#content_list > .content_title").outerHeight()
                    +$("#salesOpptShowRoomGrid > .listhead").outerHeight()
                    +$(".tabarea2").outerHeight()
                    +gap
                    ));

            if(e.items.length == 0){
                $("#subListView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView2").css({"background-image":"none"});
            }
        }
    });
    $("#subListView2").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal2>pageSize2){
            pageSize2+=viewRow2;
            pageIndex2+=viewRow2;
            $(this).data('kendoListView').dataSource.read();
        }
    });
});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.menu.failCustomerDB" /><!-- 잠재고객 DB --></h2>
        </div>
        <div class="tabarea2 removeArea_ifr">
            <ul class="tabmenu tabmenu_v1">
                <dms:access viewId="VIEW-D-12734" hasPermission="${dms:getPermissionMask('READ')}">
                <li id="btnStep09"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep09');" ><span align="center"><spring:message code='crm.btn.failed' /><!-- 실패 --></span></a></li>
                </dms:access>
                <dms:access viewId="VIEW-D-12733" hasPermission="${dms:getPermissionMask('READ')}">
                <li id="btnStep08"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep08');" ><span align="center" style="background-color:#b4b6bc; border-color:#b4b6bc"><spring:message code='crm.btn.trans' /><!-- 전출 --></span></a></li>
                </dms:access>
            </ul>
        </div>
        <div class="listarea" id="salesOpptProgGrid">
            <div class="listhead dlistitem">
                <span style="width:30%" id="befNTransStat"><spring:message code='crm.lbl.beforeLeadStat' /><!-- 실패단계 --></span>
                <span style="width:30%"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span>
                <span style="width:40%"><spring:message code='global.lbl.hpNo' /><!-- 이동전화 --></span>
                <span class="clboth" id="gubun" style="width:30%"><spring:message code='global.lbl.examinTp' /><!-- 심사구분 --></span>
                <span style="width:30%"><spring:message code='crm.lbl.leadTp' /><!-- 리드유형 --></span>
                <span style="width:40%"><spring:message code='crm.lbl.approchLocation' /><!-- 리드출처 --></span>
            </div>
            <div>
                <div id="listView" style="height:300px; overflow:scroll;"></div>
            </div>
            <div class="checkitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>

        <div data-role="view">
          <ul id="subListView1" name="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" ></ul>
        </div>
    <!-- //content_list -->
    </section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:30%" class="clboth">#:trimNull(befLeadStatNm)#</span>
    <span style="width:30%" >#:trimNull(custNm)#</span>
    <span style="width:40%" >#:trimNull(hpNo)#</span>
    <span name = "gubun1" style="width:30%" class="clboth" >#:trimNull(evalNm)#</span>
    <span name = "gubun2" style="width:30%" class="clboth" >#:trimNull(traceGradeNm)#</span>
    <span style="width:30%" >#:trimNull(infoTpNm)#</span>
    <span style="width:40%" >#:trimNull(holdTpNm)#</span>
</div>
</script>

<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            var params = {};
            params["firstIndex"] = pageIndex;
            params["lastIndex"] = pageSize;

            var sSubmitDtFrom = parent.$("#sSubmitDtFrom").val();
            var sSubmitDtTo = parent.$("#sSubmitDtTo").val();
            if ( (dms.string.isNotEmpty(sSubmitDtFrom) && dms.string.isEmpty(sSubmitDtFrom)) ||
                    (dms.string.isEmpty(sSubmitDtTo) && dms.string.isNotEmpty(sSubmitDtTo))
            ){
               mob.notification.warning("<spring:message code='global.lbl.allocDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
               return false;
            }

            if (parent.$("#sSubmitDtFrom").val() == "") {
                params["sSubmitDtFrom"] = null;
            } else {
                params["sSubmitDtFrom"] = chgDate(parent.$("#sSubmitDtFrom").val());
            }

            if (parent.$("#sSubmitDtTo").val() == "") {
                params["sSubmitDtTo"] = null;
            } else {
                params["sSubmitDtTo"] = chgDate(parent.$("#sSubmitDtTo").val());
            }
            params["sCustNm"] = parent.$("#sCustNm").val();
            params["sHpNo"] = parent.$("#sHpNo").val();

            // 책임자
            params["sMngScId"] = parent.$("#sMngScId").val();
            // 리드출처
            params["sHoldTp"] = parent.$("#sHoldTp").data("kendoExtDropDownList").value();
            // 리드유형
            params["sInfoTp"] = parent.$("#sInfoTp").data("kendoExtDropDownList").value();
            // 리드상태
            params["sLeadStatCd"] = parent.$("#sLeadStatCd").data("kendoExtDropDownList").value();
            // 실패단계
            params["sBefLeadStatCd"] = parent.$("#sBefLeadStatCd").data("kendoExtDropDownList").value();

            /* 판매기회프로세스 단계와 , 실패/전출 상태에 대한 구분
             *판매기회 단계에서는 실패,전출단계 데이터가 보이면 안 됨.
             *S:진행중 , F:실패/전출
            */
            params["sLeadStatIng"] = "F";
            return kendo.stringify(params);
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
            }
        }
    }
    ,change:function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class", "search_open");
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

listViewClick = function(dataItem) {
    $("#content_list, #content_search").hide();
    $("#content_detail").show();
    $("#header_title span").removeAttr("class");
    if(dataItem!=null){
        fnContentDetail(dataItem);
    }
};
</script>
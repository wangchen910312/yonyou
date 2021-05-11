<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">

    <!--<span style="width:30%" onclick="listViewClick('#:rnum #')">#:trimNull(leadStatNm)   #</span>
    <span style="width:30%" onclick="listViewClick('#:rnum #')">#:trimNull(mngScNm)   #</span>-->
    <span style="width:30%" class="clboth" onclick="listViewClick('#:rnum #')">#:trimNull(befLeadStatNm)   #</span>
    <span style="width:30%" onclick="listViewClick('#:rnum #')">#:trimNull(custNm) #</span>
    <span style="width:40%" onclick="listViewClick('#:rnum #')">#:trimNull(hpNo) #</span>

    <span name = "gubun1" style="width:30%" class="clboth" onclick="listViewClick('#:rnum #')">#:trimNull(evalNm) #</span>
    <span name = "gubun2" style="width:30%" class="clboth" onclick="listViewClick('#:rnum #')">#:trimNull(traceGradeNm) #</span>

    <span style="width:30%" onclick="listViewClick('#:rnum #')">#:trimNull(infoTpNm) #</span>
    <span style="width:40%" onclick="listViewClick('#:rnum #')">#:trimNull(holdTpNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.

var listData = new kendo.data.DataSource({

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

                params["recordCountPerPage"] = options.pageSize;
                params["pageIndex"] = options.page;
                params["firstIndex"] = options.skip;
                params["lastIndex"] = options.skip + options.take;
                params["sort"] = options.sort;

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

                //params["sStartDt"] = new Date( parent.$("#sStartDt").val());
                //params["sEndDt"] = new Date(parent.$("#sEndDt").val());

                //params["sCust"] = parent.$("#sCust").val();
                params["sCustNm"] = parent.$("#sCustNm").val();
                params["sHpNo"] = parent.$("#sHpNo").val();

                // 책임자
                //params["sMngScId"] = parent.$("#sMngScId").data("kendoExtDropDownList").value();
                params["sMngScId"] = parent.$("#sMngScId").val();
                // 리드출처
                params["sHoldTp"] = parent.$("#sHoldTp").data("kendoExtDropDownList").value();
                //params["sInfoPathCd"] = parent.$("#sInfoPathCd").data("kendoExtDropDownList").value();
                // 리드유형
                params["sInfoTp"] = parent.$("#sInfoTp").data("kendoExtDropDownList").value();
                // 리드상태
                params["sLeadStatCd"] = parent.$("#sLeadStatCd").data("kendoExtDropDownList").value();
                // 실패단계
                params["sBefLeadStatCd"] = parent.$("#sBefLeadStatCd").data("kendoExtDropDownList").value();
                // BHMC 리드 여부
//                params["sBhmcYn"] = parent.$("#sBhmcYn").data("kendoExtDropDownList").value();
                //params["sSubmitDtFrom"] = parent.$("#sSubmitDtFrom").val();
                //params["sSubmitDtTo"] = sSubmitDtTo;
                // 의향차종
                //params["sIntrCarlineCd"] = parent.$("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                // 의향모델
                //params["sIntrModelCd"] = parent.$("#sIntrModelCd").data("kendoExtDropDownList").value();
                // 추적등급
                //params["sTraceGradeCd"] = parent.$("#sTraceGradeCd").data("kendoExtDropDownList").value();

                if ($("#leadStatCd").val() == "99") { // 전시장유동량//
                    params["sLeadStatCd"] = PARENT.$("#leadStatCd").val();
                }

                /* 판매기회프로세스 단계와 , 실패/전출 상태에 대한 구분
                 *판매기회 단계에서는 실패,전출단계 데이터가 보이면 안 됨.
                 *S:진행중 , F:실패/전출
                */
                params["sLeadStatIng"] = "F";

                parent.$("#content_list").css("display","block");

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
    },
    change :function(e){
        checklistCnt("listarea_noData",this.total(),noDatamsg);
        //parent.setMainListHeight();
        if(parent.btnGubun == "btnStep08"){
            setTimeout(getGubun1, 100);
        }else{
            setTimeout(getGubun2, 100);
        }
    }
    ,error:function(e){
        console.log(e);
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
    ,dataBound:function(e) {

    }
});


function listViewClick(e)
{
    var obj = listData._data[e-1];
    parent.contentDetail(obj);
    //parent.contentDetail(obj.dataItem);
    console.log(obj);
}

function getGubun1(){
    $("span[name=gubun1]").hide();
    $("span[name=gubun2]").show();
}

function getGubun2(){
    $("span[name=gubun2]").hide();
    $("span[name=gubun1]").show();
}

var app = setKendoMobApp();
//var app = setKendoMobAppForNativeScroll();
</script>

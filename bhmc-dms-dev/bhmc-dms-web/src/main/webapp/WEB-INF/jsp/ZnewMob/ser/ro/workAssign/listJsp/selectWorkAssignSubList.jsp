<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.title.lbrOperInfo" /><!-- 작업정보 --></h2>
        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.lbrCd" /><!-- 정비코드 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.rpirNm" /><!-- 정비명칭--></span>
                <span style="width:50%"><spring:message code="ser.lbl.assignStat" /><!-- 정비배정상태--></span>
                <span style="width:50%"><spring:message code="ser.lbl.preStartDt" /><!-- 예정시작시간--></span>
                <span style="width:50%"><spring:message code="ser.lbl.preCompDt" /><!-- 예정완료시간 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.tecNm" /><!-- 정비사--></span>
                <span style="width:50%"><spring:message code="ser.lbl.dstbHm" /><!-- 배분공임--></span>
                <span style="width:50%"><spring:message code="ser.lbl.assigner" /><!-- 정비배정자 --></span>
            </div>
            <div>
                <div id="subListView" style="height: 300px; overflow: scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
        <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rpirCd) #</span>
            <span style="width:50%">#:trimNull(rpirNm) #</span>
            <span style="width:50%">#:allocStatCdChange(allocStatCd) #</span>
            <span style="width:50%">#:chgDate2DateTimeStr(allocStartDt) #</span>
            <span style="width:50%">#:chgDate2DateTimeStr(allocEndDt) #</span>
            <span style="width:50%">#:trimNull(realTecNm) #</span>
            <span style="width:50%">#:trimNull(allocHm) #</span>
            <span style="width:50%">#:trimNull(saNm) #</span>
        </div>
</script>

<script>
var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sRoDocNo"] = $("#roDocNo").val();
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    //,pageSize:pageSize
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
    ,change :function(e){
    }
    ,error:function(e){
        console.log(e);
    }
});
rpirStatChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.rpirStatMap[val].cmmCdNm;
    }
    return returnVal;
};

allocStatCdChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.allocStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};
$(document).ready(function() {
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template: kendo.template($("#subTemplate").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });
});
</script>
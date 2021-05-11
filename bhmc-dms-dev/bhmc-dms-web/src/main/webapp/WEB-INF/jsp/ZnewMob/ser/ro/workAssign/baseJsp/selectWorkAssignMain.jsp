<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">
    <!-- content_list -->
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/ro/workAssign/listJsp/selectWorkAssignList.jsp" />
    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.assignMng" /> <spring:message code="global.title.searchCondition" /><!-- 작업배정현황 + 조회조건  --></h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text"><input id="sCarRegNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></th>
                        <td>
                            <div class="f_text"><input id="sRoDocNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></th>
                        <td>
                            <div class="f_text"><input id="sRoTp" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoFromDt" style="width:140px; background-color:#ffffff;" class="" value="${thirtyDtBf}"/>
                                <%-- <input type="search" id="sRoFromDt" style="width:140px" class="" value="${thirtyDtBf}"/>
                                <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span> --%>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoToDt" style="width:140px; background-color:#ffffff;" class="" value="${toDt}"/>
                                <%-- <input type="search" id="sRoToDt" style="width:140px" class="" value="${toDt}"/>
                                <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span> --%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                        <td>
                            <div class="f_text"><input id="sVinNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roManNm" /><!-- 정비위탁자 --></th>
                        <td>
                            <div class="f_text"><input id="sDriverNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.assignStat" /><!-- 수리배정상태 --></th>
                        <td>
                            <div class="f_text"><input id="sAllocStatCd" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sExpcDlFromDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sExpcDlFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlFromDt');">날짜선택</span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sExpcDlToDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sExpcDlToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlToDt');">날짜선택</span> -->
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div>
                <span id="btnInit" class="btnd1"><span class="search"><spring:message code='global.btn.init' /><!-- 초기화 --></span></span>
            </div>
            <dms:access viewId="VIEW-D-12664" hasPermission="${dms:getPermissionMask('READ')}">
            <div>
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <!-- <input id="roDocNo" type="hidden" /> -->
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
                </div>

                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody id="defaultHtml"><!-- 여기에 디폴트 HTML --></tbody>
                    </table>
                    <div class="content_title">
                        <h2><spring:message code="global.btn.moreInfo" /></h2>
                        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                    </div>
                    <div class="co_view" style="display:none;">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody id="hiddenHtml"><!-- 여기에 HIDE HTML --></tbody>
                        </table>
                    </div>
                </div>

                <div class="formarea" style="display:none">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="roDt" type="text"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="roTp" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="roDocNo_" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /><!-- 고품처리방식 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="atqProcTp" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carWash" /><!-- 세차처리 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carWashTp" type="text" disabled="disabled"/></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="ser.lbl.custStbyMth" /><!-- 고객대기방식 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="custWaitMthCd" type="text" disabled="disabled"/></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="ser.lbl.assigner" /><!-- 배정자 --></th>
                                <td>
                                    <input id="saId" type="hidden"/>
                                    <div class="f_text f_disabled"><input id="saNm" type="text" disabled="disabled"/></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="ser.lbl.qultTest" /><!-- 품질검사 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="qtTestCd" type="text" disabled="disabled"/></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="expcDlDt" type="text" disabled="disabled"/></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="ser.lbl.assignStat" /><!-- 배정상태 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="allocStatCd" type="text" disabled="disabled"/></div>
                                </td>
                           </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/ro/workAssign/listJsp/selectWorkAssignSubList.jsp" />
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
</section>


<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";
thirtyDtBf          = "${thirtyDtBf}";
toDate = new Date();

//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//배정상태 Array
var allocStatCdList = [];
<c:forEach var="obj" items="${allocStatCdList}">
allocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//수리유형 Array
var rpirStatList = [];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});

//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//진행상태 Array
var progressStatList = [];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd;});


//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });


//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고객대기방식유형 map
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품처리유형 map
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//차량세차유형 map
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd});

//풀질검사 Array
var qtTestList = [];
<c:forEach var="obj" items="${qtTestList}">
qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var qtTestCdMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd});

//공통코드:시승시운전
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시승시운전 map
var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd});

var yesMap = {};
yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
yesMap["N"] = "<spring:message code='global.lbl.n' />";

$(document).ready(function() {

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sCarRegNo").val("");
            $("#sRoDocNo").val("");
            $("#sRoTp").data("kendoExtDropDownList").value("");
            $("#sRoFromDt").val("");
            $("#sRoToDt").val("");
            $("#sVinNo").val("");
            $("#sDriverNm").val("");
            $("#sAllocStatCd").data("kendoExtDropDownList").value("");
            $("#sExpcDlFromDt").val("");
            $("#sExpcDlToDt").val("");
            $("#sRoFromDt").val("${thirtyDtBf}");
            $("#sRoToDt").val("${toDt}");
        }
    });

    $("#sAllocStatCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(allocStatCdList)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    $("#sRoTp").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(roTpCdList)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.workAssignMng' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        initList();
        contentList();
    });

});

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");
  $("#header_title span").attr("class","search_open");
  listData.read();
}
//배정상태 Array
var allocStatCdList = [];
<c:forEach var="obj" items="${allocStatCdList}">
allocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 배정상태 Map
var allocStatCdMap = dms.data.arrayToMap(allocStatCdList, function(obj){ return obj.cmmCd; });

// 위탁유형
changeRoTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 고객대기방식유형
changeCustWaitMthCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = custWaitMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 고품처리유형
changeAtqProcTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = atqProcTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 차량세차유형
changeCarWashTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = carWashTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//품질검사 상태
qtTestCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = qtTestCdMap[val].cmmCdNm;
    }
    return returnVal;
}

//배정상태
changeRoStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//배정상태(수정본)
allocStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(allocStatCdMap[val] != undefined)
        returnVal = allocStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};
</script>
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
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/ro/workProcess/listJsp/selectWorkProcessMgrList.jsp" />
    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.wkProcMng" /> <spring:message code="global.title.searchCondition" /><!-- RO진행관리 현황 + 조회조건  --></h2>
        </div>
        <div class="formarea">
            <input type="hidden" id="saId1" name="saId1" />
            <input type="hidden" id="saNm1" name="saNm1" />

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
                            <div class="f_text"><input type="text" id="sCarRegNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoDocNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRoTp" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoFromDt" style="width:140px; background-color:#ffffff;" class="" value="${thirtyDtBf}"/>
                                <%-- <input type="search" id="sRoFromDt" style="width:140px" class="" value="${thirtyDtBf}"/>
                                <span class="date" onclick="calpicker('sRoFromDt');"></span> --%>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoToDt" style="width:140px; background-color:#ffffff;" class="" value="${toDt}"/>
                                <%-- <input type="search" id="sRoToDt" style="width:140px" class="" value="${toDt}"/>
                                <span class="date" onclick="calpicker('sRoToDt');"></span> --%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parGiMan" /><!-- 정비위탁자 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sSaNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.processWorkStat" /><!-- 정비진도상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sWrkStatCd" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sExpcDlFromDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sExpcDlFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlFromDt');"></span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sExpcDlToDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sExpcDlToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlToDt');"></span> -->
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div>
                <span id="btnInit" class="btnd1"><span class="btnd2"><spring:message code='global.btn.init' /><!-- 초기화 --></span></span>
            </div>
            <dms:access viewId="VIEW-D-12669" hasPermission="${dms:getPermissionMask('READ')}">
            <div>
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
                </div>

                <div class="co_view" style="display:block;">
                    <div class="formarea" id="formarea">
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

                        <table  class="flist01" style="display:none;">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO 번호 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="roDocNo" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- RO 시간 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="roDt" disabled="roDt"/>
                                            <input type="hidden" id="dlrCd" name="dlrCd" />
                                            <input type="hidden" id="roGrpNo" name="roGrpNo" />
                                            <input type="hidden" id="lineNo" name="lineNo" />
                                            <input type="hidden" id="bayNo" name="bayNo" />
                                            <input type="hidden" id="rpirTp" name="rpirTp" />
                                            <input type="hidden" id="rpirCd" name="rpirCd" />
                                            <input type="hidden" id="rpirNm" name="rpirNm" />
                                            <input type="hidden" id="rpirDstinCd" name="rpirDstinCd" />
                                            <input type="hidden" id="wrkStatCd" name="wrkStatCd" />
                                            <input type="hidden" id="qtTestCd" name="qtTestCd" />
                                            <input type="hidden" id="wrkStartDt" name="wrkStartDt" />
                                            <input type="hidden" id="wrkEndDt" name="wrkEndDt" />
                                            <input type="hidden" id="planHm" name="planHm" />
                                            <input type="hidden" id="pauseCauCd" name="PauseCauCd" />
                                            <input type="hidden" id="pauseCauRmk" name="pauseCauRmk" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!-- RO 유형 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="roTp" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!-- Vin 번호 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vinNo" disabled="disabled" /> <!-- khskhs -->
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /></th><!-- 고품처리방식 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="atqProcTp_" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.carWash" /></th><!-- 세차처리 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="carWashTp" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.custStbyMth" /></th><!-- 고객대기방식 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="custWaitMthCd" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.roadTest" /></th><!-- 도로테스트 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="roadTestCd" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.qultTest" /></th><!-- 품질검사 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="qtTestMthCd" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.tdrvReq" /></th><!-- 시승요청 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="carDriveReqTp" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcDldt" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/ro/workProcess/listJsp/selectWorkProcessMgrSubList.jsp" />
            <div class="con_btnarea btncount3" id="processBtnArea">
                <dms:access viewId="VIEW-D-12668" hasPermission="${dms:getPermissionMask('READ')}">
                    <div id="changableBtn"><span id="rpipStart" data-for="wrk01" class="btnd1" onclick="saveWorkProcee('02', 'saNm1', 'saId1', '04')"><spring:message code="ser.btn.lbrStart" /><!-- 정비시작 --></span></div>
                </dms:access>
                <dms:access viewId="VIEW-D-12667" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span id="rpipComplete" data-for="wrk01" class="btnd1" onclick="saveWorkProcee('05','saNm1','saId1','04')"><spring:message code='global.btn.lbrEnd' /><!-- 정비완료 --></span></div>
                </dms:access>
                <dms:access viewId="VIEW-D-12666" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span id="rpipCancel" data-for="wrk01" class="btnd1" onclick="saveWorkProcee('01','saNm1','saId1','04')"><spring:message code='global.btn.lbrCanc' /><!-- 정비취소 --></span></div>
                </dms:access>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code="global.btn.close" /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

</section>

<script>
var _listClick = 0;

var dlrCd  = "${dlrCd}";    // 딜러코드
var loginUsrId  = "${loginUsrId}"
var loginUsrNm  = "${loginUsrNm}"

var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}",
thirtyDtBf          = "${thirtyDtBf}";

toDate = new Date();

//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//진행상태 Array
var progressStatList = [];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd; });

//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd});

//수리유형 Array
var rpirStatList = [];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});

//세차상태 Array
var carWashStatList = [];
<c:forEach var="obj" items="${carWashStatList}">
carWashStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carWashStatMap = dms.data.arrayToMap(carWashStatList, function(obj){return obj.cmmCd});

//공통코드:품질검사
var qtTestList = [];
<c:forEach var="obj" items="${qtTestList}">
qtTestList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//품질검사 map
var qtTestMap = dms.data.arrayToMap(qtTestList, function(obj){return obj.cmmCd});

//페인트상태 Array
var paintStatList = [];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paintStatMap = dms.data.arrayToMap(paintStatList, function(obj){return obj.cmmCd});



//사용여부 Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnCdMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd});


//공통코드:시승시운전
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시승시운전 map
var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd});

//중지원인 Array
var pauseStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pauseStatList}">
pauseStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 중지원인 map
var pauseStatMap = dms.data.arrayToMap(pauseStatList, function(obj){return obj.cmmCd;});

var yesMap = {};
yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
yesMap["N"] = "<spring:message code='global.lbl.n' />";


fnSearchText = function() {
    var sCarRegNo = $("#sCarRegNo");
    var sSaNm = $("#sSaNm");
    var sExpcDlFromDt = $("#sExpcDlFromDt");
    var sVinNo = $("#sVinNo");
    var sRoFromDt = $("#sRoFromDt");
    var sBayNo = $("#sBayNo");
    var sRoStatCd = $("#sRoStatCd").data("kendoExtDropDownList");
    var sCarOwnerNm = $("#sCarOwnerNm");//khskhs
    var sRoDocNo = $("#sRoDocNo");
    var sRoTp = $("#sRoTp");
    var sTecNm = $("#sTecNm");
    var sPaintStatCd = $("#sPaintStatCd").data("kendoExtDropDownList");//khskhs
}

$(document).ready(function() {

    //$("#listhead").addClass('checkitem');

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sCarRegNo").val("");
            $("#sRoDocNo").val("");
            $("#sRoTp").val("");
            $("#sRoTp").data("kendoExtDropDownList").value("");
            $("#sWrkStatCd").data("kendoExtDropDownList").value("");
            /* $("#sRoFromDt").val("");
            $("#sRoToDt").val(""); */
            $("#sVinNo").val("");
            $("#sCarOwnerNm").val("");
            $("#sDriverNm").val("");
            $("#sExpcDlFromDt").val("");
            $("#sExpcDlToDt").val("");
            $("#sSaNm").val("");
            /* $("#sRoDt").val(chgServerDate2Str(toDt));
            $("#sRoDtFrom").val(chgServerDate2Str(thirtyDtBf)); */

            $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
            $("#sRoToDt").val(chgServerDate2Str(toDt));
        }
    });

    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
        ,index:0
    });

    //수리상태
    $("#sWrkStatCd").kendoExtDropDownList({
        dataSource:progressStatList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.wkProcMng' />");<!-- RO진행관리 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>" + $("#header_title").html() + "</span>");


    $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initList();
            contentList();
        }
    });

});
</script>

<script type="text/javascript">

    //목록페이지 보기
    function contentList() {
        $("#content_search").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_list").css("display","block");
        $("#header_title span").attr("class","search_open");
        listData.read();
    }

    function contentDetail(dataItem) {
        $("#content_list").css("display", "none");
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "block");
        $("#header_title span").removeAttr("class");

        $("#rpipStart").prop("disabled", true).addClass("disabled");
        $("#rpipComplete").prop("disabled", true).addClass("disabled");
        $("#rpipCancel").prop("disabled", true).addClass("disabled");

        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

        if(dms.string.strNvl(dataItem.atqProcTp) !="")$("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
        if(dms.string.strNvl(dataItem.carWashTp) !="")$("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
        if(dms.string.strNvl(dataItem.custWaitMthCd) !="")$("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
        if(dms.string.strNvl(dataItem.qtTestMthCd) !="")$("#qtTestMthCd").val(qtTestMap[dataItem.qtTestMthCd].cmmCdNm);
        if(dms.string.strNvl(dataItem.goodwillYn) !="")$("#goodwillYn").val(yesMap[dataItem.goodwillYn]);
        if(dms.string.strNvl(dataItem.carDriveReqTp) !="")$("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
        if(dms.string.strNvl(dataItem.chgExpcDlDt) !="")$("#chgExpcDlDt").val(dataItem.chgExpcDlDt);
        if(dms.string.strNvl(dataItem.expcDlDt) !="")$("#expcDlDt").val(chgDate2DateTimeStr(dataItem.expcDlDt));
        if(dms.string.strNvl(dataItem.runDistVal) !="")$("#runDistVal").val(commaZero(dataItem.runDistVal));
        if(dms.string.strNvl(dataItem.lastRunDistVal) !="")$("#lastRunDistVal").val(commaZero(dataItem.lastRunDistVal));
        if(dms.string.strNvl(dataItem.roDt) !="")$("#roDt").val(chgDate2DateTimeStr(dataItem.roDt));
        if(dms.string.strNvl(dataItem.chgExpcDlDt) !="")$("#chgExpcDlDt").val(chgDate2DateTimeStr(dataItem.chgExpcDlDt));

        if (dataItem.roDocNo != null && dataItem.roDocNo != 'undefined') {
            // 정비내역 리스트 조회
            $("#subList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessMgrSubList.do' />");
        }
    }




    $("#btnUpdate").click(function(){
    });

</script>
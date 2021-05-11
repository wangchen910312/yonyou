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
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title"><spring:message code="ser.menu.wkProcMng" /><!-- 정비진도관리 --></h2>
        </div>

        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
                <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
                <span style="width:50%"><spring:message code="par.lbl.parGiMan" /><!-- 정비위탁자 --></span>
                <span style="width:50%"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.processWorkStat" /><!-- 정비진도상태 --></span>
                <span style="width:50%"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="checkitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>

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
                                <input type="search" id="sRoFromDt" style="width:140px" class="" value="${thirtyDtBf}"/>
                                <span class="date" onclick="calpicker('sRoFromDt');"></span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRoToDt" style="width:140px" class="" value="${toDt}"/>
                                <span class="date" onclick="calpicker('sRoToDt');"></span>
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
                                <input type="search" id="sExpcDlFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlFromDt');"></span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sExpcDlToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlToDt');"></span>
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

            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="ser.lbl.repInfo" /><!-- 정비내역--></h2>
                </div>
                <div class="co_view" >
                    <div class="listarea">
                        <div id="listhead" class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드--></span>
                            <span style="width:50%"><spring:message code="ser.lbl.rpirNm" /><!-- 수리명칭--></span>
                            <span style="width:50%"><spring:message code="ser.lbl.processWorkStat" /><!-- 정비진도상태  --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.wrkStartDt" /><!-- 수리시작시간  --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.wrkEndDt" /><!-- 수리완료시간  --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.tecNm" /><!-- 정비사  --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.paintStatus" /><!-- 판금페인트상태  --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.pauseCau" /><!-- 일시정지원인 --></span>
                        </div>
                        <iframe id="subList" name="subList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="dlistitem bgNone" style="display:none;" id="subList_noData"><span></span></div>
                    </div>
                </div>
            </div>
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


    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        $(".skeyarea").hide();
    }
    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.wkProcMng' />");<!-- RO진행관리 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>" + $("#header_title").html() + "</span>");


    $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));


    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessMgrList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            contentList();
        }
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function() {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    setTimeout(function(){ setMainListHeight();}, 200);
});
</script>

<script type="text/javascript">
    //메인화면 가기
    function goMain() {
        window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    }

    //목록페이지 보기
    function contentList() {
        $("#content_search").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
        document.getElementById("mainList").contentWindow.document.location.reload();

    }

    //검색페이지 보기
    function contentSearch() {
        $("#content_list").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_search").css("display","block");
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
        /*
        if(dataItem != null){
            $("#roDocNo").val(dataItem.roDocNo);
            $("#carRegNo").val(dataItem.carRegNo);
            $("#vinNo").val(dataItem.vinNo);
            $("#roStatCd").val(dataItem.roStatNm);
            $("#resvDocNo").val(dataItem.resvDocNo);
            $("#roGrpNo").val(dataItem.roGrpNo);
            $("#expcDldt").val(chgDate2DateTimeStr(dataItem.expcDldt));
            $("#diagDocNo").val(dataItem.diagDocNo);
            $("#bayNm").val(dataItem.bayNo);
            $("#driverNm").val(dataItem.driverNm);
            $("#roDt").val(dataItem.roDt);

            if(dataItem.custWaitMthCd != null) {
                $("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
            }

            if(dataItem.atqProcTp != null) {
                $("#atqProcTp_").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
            }

            if(dataItem.carWashTp != null) {
                $("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
            }

            if(dataItem.roTp != null) {
                $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);
            }
            if(dataItem.roadTestCd!=null){
                $("#roadTestCd").val(useYnCdMap[dataItem.roadTestCd].cmmCdNm);
            }else{
                $("#roadTestCd").val(useYnCdMap["N"].cmmCdNm);
            }

            if(dataItem.qtTestMthCd !=null){
                $("#qtTestMthCd").val(qtTestMap[dataItem.qtTestMthCd].cmmCdNm);
            }else{
                $("#qtTestMthCd").val("");
            }

            if(dataItem.carDriveReqTp!=null){
                $("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
            }else{
                $("#carDriveReqTp").val("");
            }

            $('[data-for="wrk01"]').each(function(){
                $(this).prop("disabled", false);
            });
        }
        */

        if (dataItem.roDocNo != null && dataItem.roDocNo != 'undefined') {
            // 정비내역 리스트 조회
            $("#subList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessMgrSubList.do' />");
        }
    }

    fnContentProcessDetail = function(dataItem) {
        $("#rpipStart").prop("disabled", false).removeClass("disabled");
        $("#rpipComplete").prop("disabled", false).removeClass("disabled");
        $("#rpipCancel").prop("disabled", false).removeClass("disabled");
        _listClick++;
        $("#dlrCd").val(dataItem.dlrCd);
        $("#roDocNo").val(dataItem.roDocNo);
        $("#lineNo").val(dataItem.lineNo);
        $("#bayNo").val(dataItem.bayNo);
        $("#rpirTp").val(dataItem.rpirTp);
        $("#rpirCd").val(dataItem.rpirCd);
        $("#rpirNm").val(dataItem.rpirNm);
        $("#rpirDstinCd").val(dataItem.rpirTp);
        $("#wrkStatCd").val(dataItem.wrkStatCd);
        $("#qtTestCd").val(dataItem.qtTestCd);
        $("#wrkStartDt").val(chgDateTimeStampKendo(dataItem.wrkStartDt));
        if (dataItem.wrkEndDt != null) {
            $("#wrkEndDt").val(chgDateTimeStampKendo(dataItem.wrkEndDt));
        }
        else {
            $("#wrkEndDt").val(null);
        }
        $("#planHm").val(dataItem.planHm);
        $("#pauseCauCd").val(dataItem.pauseCauCd);
        $("#pauseCauRmk").val(dataItem.pauseCauRmk);

        if(dataItem.realTecId==null){
            $("#saId1").val(loginUsrId);

        }else{
            $("#saId1").val(dataItem.realTecId);

        }

        if(dataItem.realTecNm==null){
            $("#saNm1").val(loginUsrNm);
        }else{
            $("#saNm1").val(dataItem.realTecNm);
        }



        /**
         * wrkStatCd
         *
         * 각 단계별 버튼 활성화
         * 01 : 정비대기 상태 -> 정비시작 활성화
         * 02 : 정비시작 상태 -> 정비중지 & 정비완료 & 정비취소 활성화
         * 03 : 정비중지 -> 정비재개 & 정비취소 활성화
         * 04 : 정비재개 -> 정비중지 & 정비완료 & 정비취소 활성화
         * 05 : 정비완료 -> 정비취소 활성화
         *
         * data-for="wrk01" : 정비완료 & 정비취소 버튼
         *
         * 이벤트별 상태
         * 정비취소 -> 정비대기
         * 정비대기 -> 정비시작 -> 정비시작
         * 정비시작 -> 정비중지 -> 정비중지
         * 정비중지 -> 정비재개 -> 정비재개
         * 정비재개 -> 정비완료 -> 정비완료
         *
         *
         */

        /*
        if(dataItem.wrkStatCd != "03") {
            $('[data-for="wrk01"]').each(function(){
                $(this).prop("disabled", false).removeClass("disabled");
            });
        }
        if (dataItem.wrkStatCd == "03") {
            $('[data-for="wrk01"]').each(function(){
                $(this).prop("disabled", true).addClass("disabled");
            });
            $("#rpipCancel").prop("disabled", false).removeClass("disabled");
        }
        if (dataItem.wrkStatCd != "" && dataItem.wrkStatCd != null) {
            if (dataItem.wrkStatCd == "01") {
                // 정비 중지
                $("#changableBtn").html("<span id='rpipPause' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"02\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStop' /><!-- 정비중지 --></span>");
            }
            else if (dataItem.wrkStatCd == "02") {
                // 정비 재개
                $("#changableBtn").html("<span id='rpipContinue' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"04\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrRestart' /><!-- 정비재개 --></span>");
            }
            else {
                // 정비 시작
                $("#changableBtn").html("<span id='rpipStart' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"01\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStart' /><!-- 정비시작 --></span>");
            }
            $("#rpipStart").prop("disabled", true).addClass("disabled");
        }
        if (dataItem.wrkStatCd == "" || dataItem.wrkStatCd == null || dataItem.wrkStatCd == "06"){
            $('[data-for="wrk01"]').each(function(){
                $(this).prop("disabled", true).addClass("disabled");
            });
            // 정비 시작
            $("#changableBtn").html("<span id='rpipStart' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"01\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStart' /><!-- 정비시작 --></span></span>");
            $("#rpipStart").prop("disabled", false).removeClass("disabled");
        }
        if (dataItem.wrkStatCd != "03" && dataItem.wrkStatCd != "" && dataItem.wrkStatCd != null && dataItem.wrkStatCd != "06" && dataItem.rpirTp == "04") {
           $(".btn_s_v3").each(function() {
               $(this).prop("disabled", false).removeClass("disabled");
           });
        }
        else {
           $(".btn_s_v3").each(function(){
               $(this).prop("disabled", true).addClass("disabled");
           });
        }
        */


        if(dataItem.wrkStatCd === "01"){
            $('[data-for="wrk01"]').each(function(){
                 //$(this).data("kendoButton").enable(false);
                $(this).prop("disabled", true).addClass("disabled");
            })
            //$("#rpipStart").data("kendoButton").enable(true);
            $("#changableBtn").html("<span id='rpipStart' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"02\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStart' /><!-- 정비시작 --></span></span>");
        }
        if(dataItem.wrkStatCd === "02"){
             $('[data-for="wrk01"]').each(function(){
                 //$(this).data("kendoButton").enable(true);
                 $(this).prop("disabled", false).removeClass("disabled");
             })
             //$("#rpipStart").data("kendoButton").enable(false);
             //$("#rpipContinue").data("kendoButton").enable(false);
             $("#changableBtn").html("<span id='rpipPause' data-for='wrk01' class='btnd1' onclick='saveWorkProceeByPause(\"03\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStop' /><!-- 정비중지 --></span>");
        }
        if(dataItem.wrkStatCd === "03"){
             $('[data-for="wrk01"]').each(function(){
                 //$(this).data("kendoButton").enable(false);
                 $(this).prop("disabled", true).addClass("disabled");
             })
             //$("#rpipContinue").data("kendoButton").enable(true);
             //$("#rpipCancel").data("kendoButton").enable(true);
             $("#rpipCancel").prop("disabled", false).removeClass("disabled");
             $("#changableBtn").html("<span id='rpipContinue' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"04\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrRestart' /><!-- 정비재개 --></span>");
        }
        if(dataItem.wrkStatCd === "04"){
             $('[data-for="wrk01"]').each(function(){
                 //$(this).data("kendoButton").enable(true);
                 $(this).prop("disabled", false).removeClass("disabled");
             })
             //$("#rpipStart").data("kendoButton").enable(false);
             //$("#rpipContinue").data("kendoButton").enable(false);
             $("#changableBtn").html("<span id='rpipPause' data-for='wrk01' class='btnd1' onclick='saveWorkProceeByPause(\"04\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStop' /><!-- 정비중지 --></span>");
        }
        if(dataItem.wrkStatCd === "05"){
             $('[data-for="wrk01"]').each(function(){
                 //$(this).data("kendoButton").enable(false);
                 $(this).prop("disabled", true).addClass("disabled");
             })
             //$("#rpipCancel").data("kendoButton").enable(true);
             $("#rpipCancel").prop("disabled", false).removeClass("disabled");
        }


    }

    // 버튼 - 저장
    function saveWorkProcee(stat, saNm, saId, type) {
        if (_listClick == 0) {
            return;
        }

        var saveYn = true;
        var saveYn1 = true;
        var dataItem = {};
        dataItem.dlrCd = $("#dlrCd").val();
        dataItem.roDocNo = $("#roDocNo").val();
        dataItem.lineNo = $("#lineNo").val();
        dataItem.bayNo = $("#bayNo").val();
        dataItem.rpirTp = $("#rpirTp").val();
        dataItem.rpirCd = $("#rpirCd").val();
        dataItem.rpirNm = $("#rpirNm").val();
        dataItem.rpirTp = $("#rpirDstinCd").val();
        dataItem.wrkStatCd = $("#wrkStatCd").val();
        dataItem.qtTestCd = $("#qtTestCd").val();
        dataItem.wrkStartDt = $("#wrkStartDt").val();
        dataItem.wrkEndDt = $("#wrkEndDt").val();
        dataItem.planHm = $("#planHm").val();
        dataItem.pauseCauCd = $("#pauseCauCd").val();
        dataItem.pauseCauRmk = $("#pauseCauRmk").val();
        var jsonData = {
            "dlrCd":$("#dlrCd").val()
            ,"roDocNo":$("#roDocNo").val()
            ,"roGrpNo":$("#roGrpNo").val()
            ,"realTecId":$("#" + saId).val()
            ,"realTecNm":$("#" + saNm).val()
            ,"wrkStatCd":stat
            ,"type":type
        }
        // 작업및페인트
        if(type == "04" || type == "01") {
            dataItem.realTecId = $("#" + saId).val();
            dataItem.realTecNm = $("#" + saNm).val();
            dataItem.wrkStatCd = stat;
            dataItem.roGrpNo = $("#roGrpNo").val();
            dataItem.type = type;
            //dataItem.wrkEndDt = null;
            jsonData = dataItem;
        }
        if($("#" + saId).val() == "" && saId == "saId1") {
            mob.notification.info("<spring:message code='ser.lbl.tecNm' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
            return;
        }

        /*
        if($("#" + saId).val() == "" && saId == "saId2") {
            mob.notification.info("??人必??目");
            return;
        }
        if($("#" + saId).val() == "" && saId == "saId3") {
            mob.notification.info("<spring:message code='ser.lbl.carWasher' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
            return;
        }
        */

        mob.loading.show();

            $.ajax({
                url:"<c:url value='/ser/ro/workProcess/insertWorkProcess.do' />",
                data:JSON.stringify(jsonData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                    mob.loading.hide();
                },
                success:function(jqXHR, textStatus) {
                    mob.notification.success("<spring:message code='global.info.success'/>");
                    _listClick = 0;
                    mob.loading.hide();

                    document.getElementById("subList").contentWindow.document.location.reload();

                }
            });


    }

    function saveWorkProceeByPause(stat, saNm, saId, type) {

        if (_listClick == 0) {
            return;
        }

        mob.loading.show();

        var saveYn = true;
        var saveYn1 = true;
        var dataItem = {};
        dataItem.dlrCd = $("#dlrCd").val();
        dataItem.roDocNo = $("#roDocNo").val();
        dataItem.lineNo = $("#lineNo").val();
        dataItem.bayNo = $("#bayNo").val();
        dataItem.rpirTp = $("#rpirTp").val();
        dataItem.rpirCd = $("#rpirCd").val();
        dataItem.rpirNm = $("#rpirNm").val();
        dataItem.rpirTp = $("#rpirDstinCd").val();
        dataItem.wrkStatCd = $("#wrkStatCd").val();
        dataItem.qtTestCd = $("#qtTestCd").val();
        dataItem.wrkStartDt = $("#wrkStartDt").val();
        dataItem.wrkEndDt = $("#wrkEndDt").val();
        dataItem.planHm = $("#planHm").val();
        dataItem.pauseCauCd = $("#pauseCauCd").val();
        dataItem.pauseCauRmk = $("#pauseCauRmk").val();
        dataItem.expcDlDt = $("#expcDlDt").val();

        // 작업및페인트
        if(type == "04" || type == "01") {
            dataItem.realTecId = $("#" + saId).val();
            dataItem.realTecNm = $("#" + saNm).val();
            dataItem.wrkStatCd = stat;
            dataItem.roGrpNo = $("#roGrpNo").val();
            dataItem.type = type;
            //dataItem.wrkEndDt = null;
        }
        if($("#" + saId).val() == "" && saId == "saId1") {
            mob.notification.info("<spring:message code='ser.lbl.tecNm' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
            return;
        }

            var url = "<c:url value='/mob/ser/ro/workProcess/selectPauseCausePopup.do'/>"

            pauseCustPopupWindow = mob.window.popup({
                windowId:"selectPauseCausePopup"
              , content:{
                  url:url
                  ,data:{
                      "autoBind":false
                      ,"selectable":"multiple"
                      ,"sLtsModelCd":"HP**A"

                        ,"type":"custom1"
                            ,"roDocNo":dataItem.roDocNo
                            ,"lineNo":dataItem.lineNo
                            ,"rpirCd":dataItem.rpirCd
                            ,"allocEndDt":dataItem.allocEndDt
                            ,"expcDlDt":dataItem.expcDlDt
                            ,"rpirCd":dataItem.rpirCd
                            ,"rpirNm":dataItem.rpirNm
                            ,"callbackFunc":function(data){
                                if(data != dataItem.expcDlDt){
                                    $("#chgExpcDlDt").val(data);
                                }
                                saveWorkProcee('03','saNm1','saId1','04');
                                document.getElementById("subList").contentWindow.document.location.reload();
                                //mob.loading.hide();
                            }
                  }
              }
            });





    }


    $("#btnUpdate").click(function(){
    });

  //순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
    var keyMapArr=[
                   {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
                   {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""},
                   {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""},
                   {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""},
                   {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""},
                   {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""},

                   {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""},
                   {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.totRunDistVal' />",type:""},
                   {temp:"h",key:"roStatNm",txt:"<spring:message code='ser.lbl.processWorkStat' />",type:""},
                   {temp:"h",key:"roDocNo",txt:"<spring:message code='par.lbl.invRoDocNo' />",type:""},
                   {temp:"h",key:"roTpNm",txt:"<spring:message code='par.lbl.invResvWorkType' />",type:""},
                   {temp:"h",key:"roDt",txt:"<spring:message code='par.lbl.invResvWorkTime' />",type:""},
                   {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.roManNm' />",type:""},//정비위탁자와 방문자가 같다!
                   {temp:"h",key:"expcDlDt",txt:"<spring:message code='ser.lbl.expcDlvDt' />",type:""},
                   /* {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.processWorkStat' />",type:""}, */
                   /* {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""}, */
                   {temp:"h",key:"atqProcTp",txt:"<spring:message code='ser.lbl.OldItemHandTp' />",type:""},

                   /* {temp:"h",key:"atqProcTp",txt:"<spring:message code='global.lbl.OldItemHandTp' />",type:""}, */
                   {temp:"h",key:"carWashTp",txt:"<spring:message code='ser.menu.carWashMng' />",type:""},
                   {temp:"h",key:"custWaitMthCd",txt:"<spring:message code='ser.lbl.custStbyMth' />",type:""},
                   {temp:"h",key:"qtTestMthCd",txt:"<spring:message code='ser.lbl.qtTest' />",type:""},
                   {temp:"h",key:"goodwillYn",txt:"<spring:message code='ser.lbl.goodWillYn' />",type:""},
                   {temp:"h",key:"carDriveReqTp",txt:"<spring:message code='global.lbl.tdrvReq' />",type:""},
                   {temp:"h",key:"chgExpcDlDt",txt:"<spring:message code='ser.lbl.chgExpcDlDt' />",type:""}

                   ];

</script>
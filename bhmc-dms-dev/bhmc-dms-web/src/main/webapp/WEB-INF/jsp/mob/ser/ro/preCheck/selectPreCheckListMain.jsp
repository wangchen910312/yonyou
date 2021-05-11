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
            <h2 id="content_list_title"><spring:message code="ser.menu.preCheckList" /></h2>
        </div>
        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>

                <span style="width:50%"><spring:message code="ser.lbl.preInsNo" /><!-- 입고점검번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.preChkNm" /><!-- 사전점검자 --></span>

                <span style="width:50%"><spring:message code="ser.lbl.preCheckTp" /><!-- 입고점검유형 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.preChkStatus" /><!-- 사전점검상태 --></span>

                <span style="width:50%"><spring:message code="ser.lbl.preInsDt" /><!-- 사전점검시간 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.preCheckList" /> <spring:message code="global.title.searchCondition" /><!-- 사전점검현황 조회조건  --></h2>
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
                            <div class="f_text"><input type="text" id="sCarRegNo"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.preInsNo" /><!-- 사전점검번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sDiagDocNo"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.preCheckTp' /></th><!-- 사전점검유형 -->
                        <td>
                            <div class="f_text"><input type="text" id="sCarAcptTp" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.preChkConfirmDt" /><!-- 사전점검확인일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.preChkNm" /><!-- 사전점검자 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sRegUsrNm"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.preChkStatus" /><!-- 사전점검상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sDiagStatCd" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCarlineCd" class="form_comboBox"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /></span></div>
            <dms:access viewId="VIEW-D-12655" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="ser.menu.preCheckList" /> <spring:message code="global.lbl.budgetDetlCont" /><!-- 부품예약현황 상세내역 --></h2>
            </div>
            <div class="co_group">
                <div class="formarea" id="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody class="setDetailData">
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carRegNo" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- Vin  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="vinNo" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carOwnerNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vsitr" /><!-- 방문자  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="driverNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carlineNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.model" /><!-- 모델명  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="modelNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.nowRunDist" /><!-- 사전점검주행거리  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="runDistVal" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                        </tbody>
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
                            <tbody class="setDetailData">
                                    <tr>
                                    <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /><!-- 누계주행거리 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="carRunDistVal" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkStatus" /><!-- 사전점검상태  --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="diagStatCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preInsNo" /><!-- 입고점검번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="diagDocNo" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preCheckTp" /><!-- 입고점검유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="carAcptTp" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                 <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preInsDt" /><!-- 사전점검시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="preChkDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkNm" /><!-- 사전점검자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="regUsrNm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkPrintDt" /><!-- 사전점검프린트시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="preChkPrintDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkUpdtDt" /><!-- 사전점검변경시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="updtDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkUpdtUsrNm" /><!-- 사전점검변경자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="updtUsrNm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkCancDt" /><!-- 사전점검취소시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="preChkCancDt" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkCancPrsnNm" /><!-- 사전점검취소자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="preChkCancPrsnNm" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.cancReasonCd" /><!-- 취소원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="preChkCancReasonCd" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.preChkRemark" /><!-- 사전점검비고 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="remark" type="text" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.realDrivDis" /><!-- 실제주행거리 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input id="runDistVal2" type="text" disabled="disabled"/></div><!-- 웹도 사전점검주행거리와 같다 -->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>
</section>


<script>
var dateFormat = '<dms:configValue code="dateFormat" />';
var toDt = "${toDt}", sevenDtBf = "${sevenDtBf}";

//공통코드:입고점검유형
var carAcptTpList = [];
<c:forEach var="obj" items="${carAcptTp}">
carAcptTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carAcptTpMap = dms.data.arrayToMap(carAcptTpList, function(obj){return obj.cmmCd;});

//사전점검상태
var diagStatCdList = [];
<c:forEach var="obj" items="${diagStatCdList}">
diagStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var diagStatCdMap = dms.data.arrayToMap(diagStatCdList, function(obj){return obj.cmmCd;});

//차종명
var carlineCdList = [];
var carlineCdObj = {};
<c:forEach var="obj" items="${carLineList}" varStatus="status">
carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//입고점검유형
setCarAcptTpMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(carAcptTpMap[val] != undefined)
        resultVal = carAcptTpMap[val].cmmCdNm;
    }
    return resultVal;
};

//사전점검상태
setDiagStatCdMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(diagStatCdMap[val] != undefined)
        resultVal = diagStatCdMap[val].cmmCdNm;
    }
    return resultVal;
};


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
    setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
    /* $("#sFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sToDt").val(chgServerDate2Str(toDt)); */
}


//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    if(dataItem != null){

        setDetailData(dataItem,".setDetailData input[id]");
        $("#runDistVal").val(commaZero(dataItem.runDistVal));
        $("#carRunDistVal").val(commaZero(dataItem.carRunDistVal));
        $("#runDistVal2").val(commaZero(dataItem.runDistVal));
        $("#carAcptTp").val(setCarAcptTpMap($("#carAcptTp").val()));
        $("#diagStatCd").val(setDiagStatCdMap($("#diagStatCd").val()));
        $("#carRunDistVal").val(commaZero(dataItem.carRunDistVal));

        $("#preChkDt").val(chgDate2DateTimeStr(dataItem.preChkDt));
        $("#updtDt").val(chgDate2DateTimeStr(dataItem.updtDt));
        $("#preChkCancDt").val(chgDate2DateTimeStr(dataItem.preChkCancDt));


        //$("#content_list").css("display","none");

        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");
    }
}

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//차종명
getLtsModelNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(ltsMap[val] != undefined)
        returnVal = ltsMap[val].cmmCdNm;
    }
    return returnVal;
};

//입고점검유형
setCarAcptTpMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(carAcptTpMap[val] != undefined)
        resultVal = carAcptTpMap[val].cmmCdNm;
    }
    return resultVal;
};

//사전점검상태
setDiagStatCdMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(diagStatCdMap[val] != undefined)
        resultVal = diagStatCdMap[val].cmmCdNm;
    }
    return resultVal;
};


$(document).ready(function() {

    //입고유형 dropDownList
    $("#sCarAcptTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carAcptTpList
        ,optionLabel : "<spring:message code='global.lbl.check'/>"  // 선택
    });

    //사전점검상태 dropDownList
    $("#sDiagStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:diagStatCdList
        ,optionLabel : "<spring:message code='global.lbl.check'/>"  // 선택
    });
    //차종(검색))
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.preCheckList' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/preCheck/selectPreCheckListList.do' />");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        contentList();
    });
    // 버튼 - 초기화
    $("#btnInit").click(function(){
        $("input").val("");
        $("#sCarAcptTp").data("kendoExtDropDownList").value("");
        $("#sDiagStatCd").data("kendoExtDropDownList").value("");
        $("#sCarlineCd").data("kendoExtDropDownList").value("");
        $("#sFromDt").val(chgServerDate2Str(sevenDtBf));
        $("#sToDt").val(chgServerDate2Str(toDt));
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    $("#sFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sToDt").val(chgServerDate2Str(toDt));


});
</script>
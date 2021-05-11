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
                <h2 id="content_list_title"><spring:message code="ser.title.workAssignList" /><!-- 작업배정현황 --></h2>
            </div>
            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="ser.lbl.carNo" /><!--차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.carOwner" /><!--차량소유자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDt" /><!-- 위탁일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search6Area">
                                <th scope="row"><span><spring:message code="ser.lbl.driver" /><!-- 운전자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search7Area">
                                <th scope="row"><span><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search8Area">
                                <th scope="row"><span><spring:message code="ser.lbl.tecNm" /><!-- 테크니션 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search9Area">
                                <th scope="row"><span><spring:message code="ser.lbl.assignStat" /><!-- 배정상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search10Area">
                                <th scope="row"><span><spring:message code="ser.lbl.assigner" /><!-- 배정자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search11Area">
                                <th scope="row"><span><spring:message code="ser.lbl.fosterTp" /><!-- 위탁유형 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search12Area">
                                <th scope="row"><span><spring:message code="ser.lbl.bayNo" /><!-- BAY --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.driver" /><!-- 운전자 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.assigner" /><!-- 배정자 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.assignStat" /><!-- 배정상태 --></span>

                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></span>

                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.title.workAssignList" /> <spring:message code="global.title.searchCondition" /><!-- 작업배정현황 + 조회조건  --></h2>
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
                            <div class="f_text"><input id="sCarRegNo" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자 --></th>
                        <td>
                            <div class="f_text"><input id="sCarOwnerNm" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                        <td>
                            <div class="f_text"><input id="sRoDocNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- 위탁일자 --></th>
                        <td>
                        <%--
                            <div class="f_item01">
                                <input type="text" id="sRoFromDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sRoToDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span>
                            </div>
                        </td>
                        --%>
                        <div class="f_item01">
                                <input type="text" id="sRoDt" class="" style="width:140px" readOnly/>
                                <span class="date" onclick="calpicker('sRoDt');">날짜선택</span>
                            </div>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></th>
                        <td>
                            <div class="f_text"><input id="sVinNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.driver" /><!-- 운전자 --></th>
                        <td>
                            <div class="f_text"><input id="sDriverNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></th>
                        <td>
                        <%--
                            <div class="f_item01">
                                <input type="text" id="sExpcDlFromDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sExpcDlFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sExpcDlToDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sExpcDlToDt');">날짜선택</span>
                            </div>
                            --%>
                            <div class="f_item01">
                                <input type="text" id="sExpcDlDt" class="" style="width:140px" readOnly/>
                                <span class="date" onclick="calpicker('sExpcDlDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.tecNm" /><!-- 테크니션 --></th>
                        <td>
                            <div class="f_text"><input id="sTecNm" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.assignStat" /><!-- 배정상태 --></th>
                        <td>
                            <div class="f_text"><input id="roStatCd" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.assigner" /><!-- 배정자 --></th>
                        <td>
                            <div class="f_text"><input id="sSaNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.fosterTp" /><!-- 위탁유형 --></th>
                        <td>
                            <div class="f_text"><input id="sRoTp" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY --></th>
                        <td>
                            <div class="f_text"><input id="sBayNo" type="text" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>

    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">


            <input id="roDocNo" type="hidden" />
            <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
            </div>
            <div class="co_view" style="display:block;">
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.fosterTp" /><!-- 위탁유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roTp" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.resvDocNo" /><!-- 예약번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="resvDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.preInsNo" /><!-- 사전점검번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="diagDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /><!-- 고품처리방식 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="atqProcTp" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carWash" /><!-- 세차처리 --></th>
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
                            <th scope="row"><spring:message code="ser.lbl.roDt" /><!-- 위탁확인시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roDt" type="text" disabled="disabled"/></div>
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
                            <th scope="row"><spring:message code="ser.lbl.repairAssign" /><!-- 수리배정 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
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
                            <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></th>
                            <td>
                                <input id="bayNo" type="text" disabled="disabled"/>
                                <div class="f_text f_disabled"><input id="bayNm" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.wkgrpNo" /><!-- 소조번호 --></th>
                            <td>
                                <input type="hidden" id="wkgrpCd"/>
                                <div class="f_text f_disabled"><input id="wkgrpNm" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.tecNm" /><!-- 테크니션 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="realTecNm"  type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.preCompDt" /><!-- 예정완성시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="wrkEndDt" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <%--
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.paintQty" /><!-- 페인트건수 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.paintColor" /><!-- 페인트조정 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.carColor" /><!-- 차량색상 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       <tr>
                            <th scope="row"><spring:message code="ser.lbl.paintTp" /><!-- 페인트유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                       --%>
                    </tbody>
                </table>
            </div>
            </div>
            </div>


            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.roPrcWorkHis" /><!-- 작업이력 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="ser.lbl.lbrCd" /><!-- 정비코드 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목--></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.rpirDist" /><!-- 수리구분--></span>
                            <span style="width:35%"><spring:message code="ser.lbl.rpirDt" /><!-- 수리시간 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.dstbHm" /><!-- 배분공임 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.bayNm" /><!-- BAY명--></span>
                            <span style="width:35%"><spring:message code="ser.lbl.wkgrpNo" /><!-- 소조번호--></span>
                            <span style="width:30%"><spring:message code="ser.lbl.tecNm" /><!-- 테크니션 --></span>

                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.preCompDt" /><!-- 예정완료시간 --></span>
                        </div>
                <iframe id="subList" name="subList" border="0" frameborder="0" width="100%" height=""></iframe>
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



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

toDate = new Date();

//RO상태 Array
//var roStatCdList = [{"cmmCd":"", "cmmCdNm":""}];
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>


//수리유형 Array
var rpirStatList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});


//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });


//진행상태 Array
var progressStatList = [];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd;});


//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });



//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//고객대기방식유형 map
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//고품처리유형 map
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//차량세차유형 map
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd});


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sCarRegNo").val("");
            break;
        case "search2Area" :
            $("#sCarOwnerNm").val("");
            break;
        case "search3Area" :
            $("#sRoDocNo").val("");
            break;
        case "search4Area" :
            //$("#sRoFromDt").val("");
            //$("#sRoToDt").val("");
            $("#sRoDt").val("");
            break;
        case "search5Area" :
            $("#sVinNo").val("");
            break;
        case "search6Area" :
            $("#sDriverNm").val("");
            break;
        case "search7Area" :
            //$("#sExpcDlFromDt").val("");
            //$("#sExpcDlToDt").val("");
            $("#sExpcDlDt").val("");
            break;
        case "search8Area" :
            $("#sTecNm").val("");
            break;
        case "search9Area" :
            $("#roStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search10Area" :
            $("#sSaNm").val("");
            break;
        case "search11Area" :
            $("#sRoTp").data("kendoExtDropDownList").value("");
            break;
        case "search12Area" :
            $("#sBayNo").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sCarRegNo = $("#sCarRegNo").val();
    var sCarOwnerNm = $("#sCarOwnerNm").val();
    var sRoDocNo = $("#sRoDocNo").val();
    //var sRoFromDt = $("#sRoFromDt").val();
    //var sRoToDt = $("#sRoToDt").val();
    var sRoDt = $("#sRoDt").val();
    var sVinNo = $("#sVinNo").val();
    var sDriverNm = $("#sDriverNm").val();
    //var sExpcDlFromDt = $("#sExpcDlFromDt").val();
    //var sExpcDlToDt = $("#sExpcDlToDt").val();
    var sExpcDlDt = $("#sExpcDlDt").val();
    var sTecNm = $("#sTecNm").val();
    var roStatCd = $("#roStatCd").data("kendoExtDropDownList").value();
    var sSaNm = $("#sSaNm").val();
    var sRoTp = $("#sRoTp").data("kendoExtDropDownList").value();
    var sBayNo = $("#sBayNo").val();

    if(sCarRegNo == "" && sCarOwnerNm == "" && sRoDocNo == "" && sRoDt == ""
            && sVinNo=="" && sDriverNm=="" && sExpcDlDt=="" && sTecNm==""
            && roStatCd=="" && sSaNm=="" && sRoTp=="" && sBayNo==""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sCarRegNo == "") $("#search1Area").hide();
        else $("#search1Area").show();

        if(sCarOwnerNm == "") $("#search2Area").hide();
        else $("#search2Area").show();

        if(sRoDocNo == "") $("#search3Area").hide();
        else $("#search3Area").show();

        if(sRoDt == "") $("#search4Area").hide();
        else $("#search4Area").show();

        if(sVinNo == "") $("#search5Area").hide();
        else $("#search5Area").show();

        if(sDriverNm == "") $("#search6Area").hide();
        else $("#search6Area").show();

        if(sExpcDlDt == "") $("#search7Area").hide();
        else $("#search7Area").show();

        if(sTecNm == "") $("#search8Area").hide();
        else $("#search8Area").show();

        if(roStatCd == "") $("#search9Area").hide();
        else $("#search9Area").show();

        if(sSaNm == "") $("#search10Area").hide();
        else $("#search10Area").show();

        if(sRoTp == "") $("#search11Area").hide();
        else $("#search11Area").show();

        if(sBayNo == "") $("#search12Area").hide();
        else $("#search12Area").show();

    }
    setMainListHeight();
}


$(document).ready(function() {



    $("#roStatCd").kendoExtDropDownList({
        dataSource:roStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
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
    $("#header_title").html("<spring:message code='ser.title.workAssignList' />");<!-- 작업배정현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/workAssign/selectWorkAssignList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sCarRegNo = $("#sCarRegNo");
            var sCarOwnerNm = $("#sCarOwnerNm");
            var sRoDocNo = $("#sRoDocNo");
            //var sRoFromDt = $("#sRoFromDt");
            //var sRoToDt = $("#sRoToDt");
            var sRoDt = $("#sRoDt");
            var sVinNo = $("#sVinNo");
            var sDriverNm = $("#sDriverNm");
            //var sExpcDlFromDt = $("#sExpcDlFromDt");
            //var sExpcDlToDt = $("#sExpcDlToDt");
            var sExpcDlDt = $("#sExpcDlDt");
            var sTecNm = $("#sTecNm");
            var roStatCd = $("#roStatCd").data("kendoExtDropDownList");
            var sSaNm = $("#sSaNm");
            var sRoTp = $("#sRoTp").data("kendoExtDropDownList");
            var sBayNo = $("#sBayNo");

            if(sCarRegNo.val() != "") $("#search1Area span[name='searchStr']").text(sCarRegNo.val());
            if(sCarOwnerNm.val() != "") $("#search2Area span[name='searchStr']").text(sCarOwnerNm.val());
            if(sRoDocNo.val() != "") $("#search3Area span[name='searchStr']").text(sRoDocNo.val());
            if(sRoDt.val() != "") $("#search4Area span[name='searchStr']").text(sRoDt.val());
            if(sVinNo.val() != "") $("#search5Area span[name='searchStr']").text(sVinNo.val());
            if(sDriverNm.val() != "") $("#search6Area span[name='searchStr']").text(sDriverNm.val());
            if(sExpcDlDt.val() != "") $("#search7Area span[name='searchStr']").text(sExpcDlDt.val());
            if(sTecNm.val() != "") $("#search8Area span[name='searchStr']").text(sTecNm.val());
            if(roStatCd.value() != "") $("#search9Area span[name='searchStr']").text(roStatCd.text());
            if(sSaNm.val() != "") $("#search10Area span[name='searchStr']").text(sSaNm.val());
            if(sRoTp.value() != "") $("#search11Area span[name='searchStr']").text(sRoTp.text());
            if(sBayNo.val() != "") $("#search12Area span[name='searchStr']").text(sBayNo.val());

            setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });





});
</script>
<script>

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

  //$("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
  //$("#sRoToDt").val(chgServerDate2Str(toDt));
  $("#sRoDt").val(chgServerDate2Str(toDt));

  //$("#sExpcDlFromDt").val(chgServerDate2Str(sevenDtBf));
  //$("#sExpcDlToDt").val(chgServerDate2Str(toDt));
  $("#sExpcDlDt").val(chgServerDate2Str(toDt));

}


function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem != null){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataSet(dataItem);


        $("#roTp").val(changeRoTpCd(dataItem.roTp));
        $("#custWaitMthCd").val(changeCustWaitMthCd(dataItem.custWaitMthCd));
        $("#atqProcTp").val(changeAtqProcTpCd(dataItem.atqProcTp));
        $("#carWashTp").val(changeCarWashTpCd(dataItem.carWashTp));
        //$("#bayNo").val(dataItem.bayNo);

    }


    if( dataItem.roDocNo != null && dataItem.roDocNo != 'undefined'){

        // 정비내역 리스트 조회
        $("#subList").attr("src", "<c:url value='/mob/ser/ro/workAssign/selectWorkAssignSubList.do' />");


        //setFullSizeListView("subList");



    }
  }




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




/*
setTimeout(function(){
    $("#subList").load(function() {
        var h = $(this).contents().height();
        $("#subList").height( h );
    });
}, 200);
*/

//$(".co_group").each(function(cnt){
  //  $(this).hide();
//});


</script>
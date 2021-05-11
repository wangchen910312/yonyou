<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">

        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.lbl.lead" /><spring:message code="global.title.list" /><!-- 리드 목록 --></h2>
                <div class="title_btn" id="btnCustReset">
                    <span class="tbtn" ><spring:message code="global.btn.add" /></span>
                </div>
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
                                <th scope="row"><span><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.statNm" /><!-- 상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.bhmcyn" /><!-- BHMC여부 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search6Area">
                                <th scope="row"><span><spring:message code="global.lbl.allocDt" /><!-- 배정일 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:30%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.statNm" /><!-- 상태 --></span>
                            <span class="clboth" style="width:30%"><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC여부 --></span>
                            <span style="width:35%"><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.lbl.lead" /><spring:message code="global.title.searchCondition" /><!--리드 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></th>
                        <td>
                            <div class="f_text"><input id="sLeadSrcCd" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                           <div class="f_text"><input id="sCustNm" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <div class="f_text"><input id="sStatCd" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC여부 --></th>
                        <td>
                            <div class="f_text"><input id="sBhmcYn" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></th>
                        <td>
                            <div class="f_text"><input id="sPrsnId" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.allocDt" /><!-- 배정일 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sAllocDtFrom" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sAllocDtFrom');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sAllocDtTo" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sAllocDtTo');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
        </div>

    </section>

    <!-- <input id="dlrCd" type="hidden" />
    <input id="selParReqDocNo" type="hidden" />
    <input id="selCustCd" type="hidden" />
    <input id="selCustNm" type="hidden" />
    <input id="selVinNo" type="hidden" />
    <input id="selCarNo" type="hidden" />
    <input id="selGiDocNo" type="hidden" />
    <input id="selRoDocNo" type="hidden" /> -->
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
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.leadNo" /><!-- 리드번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="leadNo" type="text" placeholder="" disabled="disabled" data-json-obj="true"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <div class="f_item01 f_required">
                                    <input id="custNo" name="custNo" type="hidden" data-json-obj="true" />
                                    <input id="updateTp" name="updateTp" type="hidden" data-json-obj="true" />

                                    <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />
                                    <input id="officeTelNo" name="officeTelNo" type="hidden" data-json-obj="true" />


                                    <input id="custNm" name="custNm" type="text" disabled="disabled" data-json-obj="true"/>
                                    <span class="search" id="custSearch">검색</span>

                                    <input id="telNo" type="hidden" data-json-obj="true"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화--></th>
                            <td>
                                <div class="f_text f_disabled"><input id="hpNo" type="text" placeholder="" disabled="disabled" data-json-obj="true"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></th>
                            <td>
                                <div class="f_text f_required">
                                    <input id="leadSrcCd" name="leadSrcCd" type="text" class="form_comboBox" data-json-obj="true"/>
                                </div>
                                <div class="f_text f_disabled">
                                    <input id="leadSrcDtl" name="leadSrcDtl" type="text" class="form_comboBox" data-json-obj="true" disabled="disabled" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.prsNm" /><!-- 담당자 --></th>
                            <td>
                                <div class="f_item01 f_disabled">
                                    <input id="prsnId" name="prsnId" type="hidden" value="" data-json-obj="true" />
                                    <input id="prsnNm" type="text"  disabled="disabled"/>
                                    <span class="search" id="btnAddUser">검색</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                            <td>
                                <div class="f_text f_required">
                                    <input id="statCd" type="text" class="form_comboBox" data-json-obj="true"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC여부 --></th>
                            <td>
                                <input type="checkbox" id="bhmcYn" name="bhmcYn" class="f_check" data-type="checkbox" disabled="disabled" data-json-obj="true"/><label for="bhmcYn"></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="regUsrNm" type="text" placeholder="" disabled="disabled"/></div>
                                <input id="regUsrId" name="regUsrId" type="hidden"  />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="regDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ddlnDt" /><!-- 마감일 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="ddlnDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.opptChgDt" /><!-- 기회전환일자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="opptChgDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                            <td>
                                <div class="f_text"><input id="remark" name="remark" type="text" data-json-obj="true"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            </div>


            <div class="co_group" id="subList1Area">
            <div class="content_title">
                <h2><spring:message code="global.title.intrCarLine" /><spring:message code="global.title.info" /><!-- 관심차종정보 --></h2>

                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                <div class="title_btn" id="btnAddVehic">
                    <span class="tbtn"><spring:message code="global.btn.add" /></span>
                </div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <%--<div class="listhead dlistitem">--%>
                        <div class="listhead deleteitem">
                            <span style="width:50%"><spring:message code="global.lbl.carLine" /><!-- 관심차종 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.typicalCar" /><!-- 관심--></span>
                            <span class="clboth" style="width:100%"><spring:message code="global.lbl.model" /><!-- 관심모델--></span>
                            <span class="delete"></span>
                        </div>
                <iframe id="subList1" name="subList1" border="1" frameborder="0" width="100%" height="200px"></iframe>
            </div>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title" id="carHistTitle">
                <h2><spring:message code="global.title.intrCarLine" /><spring:message code="global.lbl.msgHistory" /><!-- 메시지 이력 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01" id="carHistContent">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="global.crm.contactDt" /><!-- 연락일 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.contactStatCd" /><!-- 유형--></span>
                            <span style="width:30%"><spring:message code="global.lbl.pprocId" /><!-- 처리인 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.contactTp" /><!-- 방법 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.contactCont" /><!-- 활동내역 --></span>
                        </div>
                <iframe id="subList2" name="subList2" border="1" frameborder="0" width="100%" height="200px"></iframe>
            </div>

            </div>
            </div>
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnLeadSave" ><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>

        </section>



    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",

    toDate,
    gCrud;


var leadSrcList = [];
var statList = [];
var ynCdList = [];

//담당SC
var roleUsersList = [{"cmmCd":"00", "cmmCdNm":"<spring:message code='global.lbl.unAssign' />"}];
var leadSrcMap = [];
var statMap = [];

var custHoldTpDtlList         = [];

//차종
var carLineCdDSList = [];
var carLineCdObj = {};

var telNo =  "${telNo}";

<c:forEach var="obj" items="${roleUsers}">
roleUsersList.push({"cmmCd":"${obj.refId}" , "cmmCdNm":"${obj.usrNm}"});
</c:forEach>

<c:forEach var="obj" items="${leadSrcList}">
leadSrcList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${statList}">
statList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
statMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//var statMap = dms.data.arrayToMap(statList, function(obj){ return obj.cmmCd; });


ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});


<c:forEach var="obj" items="${custHoldTpDtlList}">
custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
</c:forEach>

<c:forEach var="obj" items="${carLineCdInfo}">
carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//접촉유형 DS
var contactTpArr = [];
<c:forEach var="obj" items="${activeCdList}">
    contactTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>




$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sLeadSrcCd").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sCustNm").val("");
            break;
        case "search3Area" :
            $("#sStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search4Area" :
            $("#sBhmcYn").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sPrsnId").data("kendoExtDropDownList").value("");
            break;
        case "search6Area" :
            $("#sAllocDtFrom").val("");
            $("#sAllocDtTo").val("");
            break;
        default :
            break;
    }
    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sLeadSrcCd = $("#sLeadSrcCd").data("kendoExtDropDownList").value();
    var sCustNm = $("#sCustNm").val();
    var sStatCd = $("#sStatCd").data("kendoExtDropDownList").value();
    var sBhmcYn = $("#sBhmcYn").data("kendoExtDropDownList").value();
    var sPrsnId = $("#sPrsnId").data("kendoExtDropDownList").value();
    var sAllocDtFrom = $("#sAllocDtFrom").val();
    var sAllocDtTo = $("#sAllocDtTo").val();

    if(sLeadSrcCd == "" && sCustNm == "" && sStatCd == "" && sBhmcYn == "" && sPrsnId == "" && sAllocDtFrom == "" && sAllocDtTo == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sLeadSrcCd == "") $("#search1Area").hide();
        else $("#search1Area").show();

        if(sCustNm == "") $("#search2Area").hide();
        else $("#search2Area").show();

        if(sStatCd == "") $("#search3Area").hide();
        else $("#search3Area").show();

        if(sBhmcYn == "") $("#search4Area").hide();
        else $("#search4Area").show();

        if(sPrsnId == "") $("#search5Area").hide();
        else $("#search5Area").show();

        if(sAllocDtFrom == "" && sAllocDtTo == "") $("#search6Area").hide();
        else $("#search6Area").show();

    }

    setMainListHeight();
}


$(document).ready(function() {

    $("#sPrsnId").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "   // 전체
        , dataSource:roleUsersList
        , index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    // 리드출처(검색).   sLeadSrcCd
    $("#sLeadSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:leadSrcList
        , index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });



    // 상태(검색).   statList
    $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:statList
        , index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    // bhmc여부(검색).   sBhmcYn
    $("#sBhmcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:ynCdList
        , index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });




    // 리드출처.   leadSrcList
    $("#leadSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:leadSrcList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            var custHoldTpDtl = $("#leadSrcDtl").data("kendoExtDropDownList");
            if (selcmmCd == "02"){
                custHoldTpDtl.enable(true);
                $("#leadSrcDtl").parent().parent().attr("class", "f_text f_required");
                $("#leadSrcDtl").removeAttr("disabled");
            } else {
                custHoldTpDtl.value("");
                custHoldTpDtl.enable(false);
                $("#leadSrcDtl").parent().parent().attr("class", "f_text f_disabled");
                $("#leadSrcDtl").attr("disabled", "disabled");
            }
        }
    /* ,optionLabel:"<spring:message code='global.lbl.check'/>" */
    });

    // 고객확보유형2      leadSrcDtl   (CRM***)
    $("#leadSrcDtl").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"　"
       , dataSource:custHoldTpDtlList
       , index:0
       , enable:false

   });


    // 상태.   statList
    $("#statCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"　"
        , dataSource:statList
        , index:0
        , optionLabel:"<spring:message code='global.lbl.check'/>"
    });



    function initPage(){
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='crm.menu.leadMng' />");<!-- 리드관리 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#sAllocDtFrom").val(chgServerDate2Str(sevenDtBf));
    $("#sAllocDtTo").val(chgServerDate2Str(toDt));
    var sAllocDtFrom = $("#sAllocDtFrom");
    var sAllocDtTo = $("#sAllocDtTo");
    if(sAllocDtFrom.val() != "" || sAllocDtTo.val() != "") $("#search6Area span[name='searchStr']").html(sAllocDtFrom.val() + " ~<br/>" + sAllocDtTo.val());
    setSearchBox();
    $("#mainList").attr("src", "<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sLeadSrcCd = $("#sLeadSrcCd").data("kendoExtDropDownList");
            var sCustNm = $("#sCustNm");
            var sStatCd = $("#sStatCd").data("kendoExtDropDownList");
            var sBhmcYn = $("#sBhmcYn").data("kendoExtDropDownList");
            var sPrsnId = $("#sPrsnId").data("kendoExtDropDownList");
            var sAllocDtFrom = $("#sAllocDtFrom");
            var sAllocDtTo = $("#sAllocDtTo");

            if(sLeadSrcCd.value() != "") $("#search1Area span[name='searchStr']").text(sLeadSrcCd.text());
            if(sCustNm.val() != "") $("#search2Area span[name='searchStr']").text(sCustNm.val());
            if(sStatCd.value() != "") $("#search3Area span[name='searchStr']").text(sStatCd.text());
            if(sBhmcYn.value() != "") $("#search4Area span[name='searchStr']").text(sBhmcYn.text());
            if(sPrsnId.value() != "") $("#search5Area span[name='searchStr']").text(sPrsnId.text());
            if(sAllocDtFrom.val() != "" || sAllocDtTo.val() != "") $("#search6Area span[name='searchStr']").html(sAllocDtFrom.val() + " ~<br/>" + sAllocDtTo.val());

            setSearchBox();
            contentList();
        }
    });


    // 버튼 - 저장
    //$("#btnLeadSave").kendoButton({
      //  click:function(e){
    $("#btnLeadSave").click(function(){
            // 신규고객의 등록인 경우 체크
             if ( dms.string.isEmpty($("#leadNo").val()) ) {
                 //var custTp = $("#custTp").data("kendoExtDropDownList").value();
                 var custTp = $("#custTp").val();
                 var custNm = $("#custNm").val();
                 var hpNo = $("#hpNo").val();
                 //var officeTelNo = $("#officeTelNo").val();

                 /*
                 if ( dms.string.isEmpty(custTp) ){
                     mob.notification.warning("<spring:message code='global.lbl.custTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 }
                 */


                 if ( dms.string.isEmpty(custNm) ){
                     mob.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 }

                 if (custTp == "01") { // 개인
                     if ( dms.string.isEmpty(hpNo) ){
                         mob.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     }
                 }
                 /*
                 else {  // 법인
                     if ( dms.string.isEmpty(officeTelNo) ){
                         mob.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     }
                 }
                 */

                 //$("#custNm").val(custNmSearch);
             }

             // 화면 필수 체크
             if ( dms.string.isEmpty($("#leadSrcCd").val())){
                 mob.notification.warning("<spring:message code='global.lbl.leadSrc' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#leadSrcCd").focus();
                 return false;
             } else {
                 if ($("#leadSrcCd").data("kendoExtDropDownList").value() == "02") {
                     if ( dms.string.isEmpty($("#leadSrcDtl").val())) {
                         mob.notification.warning("<spring:message code='crm.lbl.leadSrcCamp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         $("#leadSrcDtl").focus();
                         return false;
                     }
                 }
             }

             // form 데이터

             var param =
                 $("#itemForm").serializeObject(
                     $("#itemForm").serializeArrayInSelector("[data-json-obj='true']")
                 );

             var callInfoAreaParam = {};
             $("#updateTp").val("Normal");
             param["updateTp"] = $("#updateTp").val();
             param["statCd"] = $("#statCd").val();
             param["leadNo"] = $("#leadNo").val();
             param["leadTp"] = "COMMON";    // IDCC / COMMON


            //관심차종
            var dataSource = document.getElementById("subList1").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
            var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

            if (saveData.insertList.length > 0) {
                 var cnt = 0;
                 $.each(saveData.insertList, function(idx, row){
                     if(row.flagYn == "Y"){
                         cnt ++;
                      }
                 });
                 if(cnt == 0){
                    // 대표차 / 을(를) 선택해주세요.
                     mob.notification.warning("<spring:message code='global.lbl.typicalCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                     return false;
                 }
             }


             var saveLeadData = $.extend(
                 {"leadInfoVO":param}
                 , {"callInfoVO":callInfoAreaParam}
                 , {"carLineInfoVO":saveData}
             );

             console.log("Saving of Request Info.!!!");
             console.log(saveLeadData);

             $.ajax({
                 url:"<c:url value='/mob/crm/slm/leadInfo/multiLeads.do' />"
                 ,data:JSON.stringify(saveLeadData)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log("error !!!");
                     //console.log(jqXHR.responseJSON);
                     //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);

                 },
                 success:function(result){
                     console.log(result);
                     if (result != null && result != ""){
                        /* 임시
                         $("#leadNo").val(result);
                         $("#btnLeadSearch").click();
                         $("#carGrid").data("kendoExtGrid").dataSource.page(1);
                         */
                         contentList();
                     }
                 }
             }).done(function(result) {
                 console.log("Done!!!!");
             });

       // }
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



    //버튼 - 담당자
    $("#btnAddUser").click( function(){
       userSearchPopupWin = dms.window.popup({
           windowId:"userSearchPopupWin"
           ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
           ,content:{
               url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
               , data:{
                   "autoBind":false
                   ,"usrNm":""
                   ,"callbackFunc":function(data){
                       if (data.length >= 1) {
                           console.log("Return to User Popup");
                           //console.log(data[0]);
                           $("#prsnId").val(data[0].usrId);
                           $("#prsnNm").val(data[0].usrNm);
                       }
                   }
               }
           }
       });
   });



    // 고객 팝업
    $("#custSearch").click(function() {
        /*
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :"IDCCLEAD"
                    , "telNo" :telNo
                    , "callbackFunc":function(data){
                        if (data.length >= 1) {
                            console.log("Return to Customer Popup");
                            console.log(data[0]);
                            //$("#leadNo").val(data[0].leadNo);
                            $("#custNm").val(data[0].custNm);
                            $("#custNo").val(data[0].custNo);
                            $("#hpNo").val(data[0].hpNo);
                            $("#telNo").val(data[0].telNo);
                        }
                    }
                }
            }
        })
        */

    popupWindow = mob.window.popup({
        windowId:"customerSearchPopupMain"
        , content:{
            url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if ( dms.string.isNotEmpty(data.custNo) ) {
                        //initForm();
                        $("#custNo").val(data.custNo);
                        $("#custNm").val(data.custNm);
                        $("#custTp").val(data.custTp);
                        $("#hpNo").val(data.hpNo);
                        $("#telNo").val(data.telNo);
                        $("#officeTelNo").val(data.officeTelNo);
                        /*
                        $("#prefCommNo").val(data.hpNo);
                        $("#scId").val(data.mngScId);
                        $("#scNm").val(data.mngScNm);
                        */
                    }
                }
            }
        }
     })
    });



    // 추가 - 초기화
    //$("#btnCustReset").kendoButton({
      // click:function(e){
    $("#btnCustReset").click(function(){

           $("#leadNo").val("");
           $("#custNo").val("");
           $("#custNm").val("");
           $("#hpNo").val("");
           $("#telNo").val("");
           $("#prsnId").val("");
           $("#prsnNm").val("");
           $("#leadSrcCd").data("kendoExtDropDownList").value("");
           $("#leadSrcDtl").data("kendoExtDropDownList").value("");
           $("#statCd").data("kendoExtDropDownList").value("");
           $("#custTp").val("");

           $("#regUsrId").val("");
           $("#regUsrNm").val("");
           $("#remark").val("");


           $("#regDt").val("");
           $("#ddlnDt").val("");
           $("#opptChgDt").val("");


           $("#bhmcYn").prop("checked",false);
           var btnAddUser = $("#btnAddUser").data("kendoButton");             // 담당자 선택

           //var btnLeadSave = $("#btnLeadSave").data("kendoButton");            // 리드저장
           //btnLeadSave.enable(true);


           $("#hpNo").removeClass('form_readonly');
           $("#telNo").removeClass('form_readonly');
           $("#remark").removeClass('form_readonly');
           $("#leadSrcCd").data("kendoExtDropDownList").enable(true);


           // 관심차종 Reset

            $("#subList1").attr("src", "<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoSub1List.do' />");

            document.getElementById("subList1").contentWindow.resetSubList1;
            //$("#carGrid").data("kendoExtGrid").dataSource.data([]);
            //var dataSource = document.getElementById("subList1").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
            //dataSource.data([]);

            $("#carHistTitle, #carHistContent").hide();


           //$("#leadNo, #bhmcYn, #regUsrNm, #regDt, #ddlnDt, #opptChgDt, #remark").parent().parent().hide();


           contentDetail();

      // }
    });






   // ----------------------------- 관심차량 -----------------------------------




    //관심차종 추가버튼
    //$("#btnAddVehic").kendoButton({
     //   click:function(e) {
     $("#btnAddVehic").click(function(){
             intrCarLinePopupWin = mob.window.popup({
                 windowId:"intrCarLinePopupWin"
                 ,width:"100%"
                 ,height:"285px"
                 ,content:{
                     url:"<c:url value='/mob/cmm/crm/commonPopup/selectIntrCarLinePopup.do'/>"
                 }
             });
       //  }
    });



    $("#carGrid").on("click", "input.flagYn", function(e){

        var carGrid = $("#carGrid").data("kendoExtGrid");
        var uid = $(this).data("uid");

        $("input.flagYn", "#carGrid").prop("checked", false);
        $(this).prop("checked", true);

        $.each(carGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });

        carGrid.dataSource.getByUid(uid).set("flagYn", "Y");

    });


});


function addIntrCarLine(carlineCd, modelCd, flagYn){


    if(carlineCd == ""){
                        // 선택하지 않은 차종이 있습니다.
                        mob.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCarLine}' />");
                        //dataValidate = true;
                        return false;
                     }
                     if(modelCd == ""){
                         // 선택하지 않은 모델이 있습니다.
                         mob.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                         //dataValidate = true;
                         return false;
                      }

    document.getElementById("subList1").contentWindow.addItemSubList1(carlineCd, modelCd, flagYn);
}




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

    $("#sAllocDtFrom").val(chgServerDate2Str(sevenDtBf));
    $("#sAllocDtTo").val(chgServerDate2Str(toDt));

}

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    //$("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    // 부품리스트 조회
    //$("#selStockDdDocNo").val(dataItem.stockDdDocNo);
    //$("#detailList").attr("src", "<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemList.do' />");

    //saveList = [];

    if(dataItem != null){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataSet(dataItem);

        $("#leadSrcCd").data("kendoExtDropDownList").value(dataItem.leadSrcCd); // 리드출처1

        var custHoldTpDtl = $("#leadSrcDtl").data("kendoExtDropDownList");

        if(dataItem.leadSrcCd == "02"){
            $("#leadSrcDtl").data("kendoExtDropDownList").value(dataItem.leadSrcDtl); // 리드출처2

            custHoldTpDtl.enable(true);
            $("#leadSrcDtl").parent().parent().attr("class", "f_text f_required");
            $("#leadSrcDtl").removeAttr("disabled");

        }else{

            custHoldTpDtl.enable(false);
            $("#leadSrcDtl").parent().parent().attr("class", "f_text f_disabled");
            $("#leadSrcDtl").attr("disabled", "disabled");
        }


        $("#statCd").data("kendoExtDropDownList").value(dataItem.statCd); // 상태



        if(dataItem.leadNo != null && dataItem.leadNo != 'undefined'){

            // 관심차종 목록 조회
            $("#subList1").attr("src", "<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoSub1List.do' />");

            //setTimeout(function(){ alert(a);}, 200);





            // 메시지이력 목록 조회
            $("#subList2").attr("src", "<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoSub2List.do' />");

        }

    }



}





</script>
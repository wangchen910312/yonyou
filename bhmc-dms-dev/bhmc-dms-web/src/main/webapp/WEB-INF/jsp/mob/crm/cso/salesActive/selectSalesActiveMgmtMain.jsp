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
                <h2 id="content_list_title"><spring:message code="crm.lbl.salesActiveList" /><!-- 영업활동 목록 --></h2>
                 <div class="title_btn">
                    <span id="btnAdd" class="tbtn"><spring:message code="global.btn.add" /><!-- 추가 --></span>
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
                                <th scope="row"><span><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="crm.lbl.salesActiveTpCd" /><!-- 영업활동유형 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:40%"><spring:message code="crm.lbl.salesActiveStatCd" /><!-- 영업활동상태 --></span>
                    <span style="width:25%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
                    <span style="width:35%"><spring:message code="global.lbl.prefCommNo" /><!-- 선호연락처 --></span>
                    <span style="width:40%" class="clboth"><spring:message code="crm.lbl.planStartDt" /><!-- 계획시작일자 --></span>
                    <span style="width:60%"><spring:message code="crm.lbl.planEndDt" /><!-- 계획종료일자 --></span>
                    <%-- <span style="width:20%"><spring:message code="global.lbl.saleOpptSeq" /><!-- 판매기회번호 --></span> --%>
                    <span style="width:100%"  class="clboth"><spring:message code="crm.lbl.activeCont" /><!-- 활동내용 --></span>
                    <span style="width:100%"  class="clboth"><spring:message code="global.lbl.activeRsltCont" /><!-- 활동결과 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>


        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="crm.lbl.salesActiveSearch" /><!-- 영업활동 조회조건 --></h2>
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
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 -->
                                <td>
                                    <div class="f_text"><input type="text" id="sScId"  class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                                <td>
                                    <div class="f_text"><input type="text" id="sCustNm"  class="form_input" style="width:100%"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveTpCd' /></th><!-- 영업활동유형 -->
                                <td>
                                    <div class="f_text"><input type="text" id="sSalesActiveTpCd"  class="form_comboBox" style="width:100%"></div>
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
                <div class="content_title conttitlePrev">
                    <h2><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></h2>
                </div>
                <div class="formarea">
                    <table class="flist01">
                        <caption><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody id="salesActiveMgmtForm">
                             <tr>
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="hidden" id="salesActiveNo" name="salesActiveNo" data-json-obj="true" />
                                    <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                    <div class="f_item01">
                                        <input type="text" id="custNm" name="custNm" value="" readOnly>
                                        <span class="search" id="custSearch"><spring:message code='global.lbl.custSearch' /><!-- 검색 --></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.commMthCd' /><!-- 연락방식 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="commMthCd" name="commMthCd" class="form_comboBox" data-json-obj="true" required placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.prefCommNo' /><!-- 선호연락처 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="prefCommNo" name="prefCommNo" data-json-obj="true" required maxlength="14" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="2"><spring:message code='crm.lbl.planStartDt' /><!-- 계획시작일자  --></th>
                                <td>
                                     <div class="f_item01">
                                        <input type="search" id="planStartDt" name="planStartDt" value="" required readOnly data-json-obj="true"/>
                                        <span class="date" onclick="calpicker('planStartDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="f_item01">
                                        <input type="text" id="planStartDtTime" name="planStartDtTime" value="" required class="" readOnly>
                                        <span class="time" onclick="timepicker2('planStartDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="2"><spring:message code='crm.lbl.planEndDt' /><!-- 계획종료일자  --></th>
                                <td>
                                     <div class="f_item01">
                                        <input type="search" id="planEndDt" name="planEndDt" value="" readOnly required data-json-obj="true"/>
                                        <span class="date" onclick="calpicker('planEndDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="f_item01">
                                        <input type="text" id="planEndDtTime" name="planEndDtTime" value="" required class="" readOnly>
                                        <span class="time" onclick="timepicker2('planEndDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveTpCd' /><!-- 영업활동유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="salesActiveTpCd" name="salesActiveTpCd" data-json-obj="true" required class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveStatCd' /><!-- 영업활동상태 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="salesActiveStatCd" name="salesActiveStatCd" data-json-obj="true" required class="f_text" placeholder="" disabled="disabled">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></th>
                                <td>
                                     <div class="f_text f_disabled"><input type="text" id="pconCustNm" name="pconCustNm" class="f_text" placeholder="" disabled="disabled"></div>
                                    <input type="hidden" id="pconCustNo" name="pconCustNo" data-json-obj="true" >
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.pconPrefCommNo' /><!-- 연계인선호연락번호 --></th>
                                <td>
                                     <div class="f_text f_disabled"><input type="text" id="pconPrefCommNo" name="pconPrefCommNo" data-json-obj="true" class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="2"><spring:message code='crm.lbl.realActiveStart' /><!-- 실제진행시작   --></th>
                                <td>
                                     <div class="f_item01">
                                        <input type="search" id="activeStartDt" name="activeStartDt" value="" readOnly data-json-obj="true"/>
                                        <span class="date" onclick="calpicker('activeStartDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="f_item01">
                                        <div class="f_text"><input type="text" id="activeStartDtTime" name="activeStartDtTime" value="" class="" readOnly></div>
                                        <span class="time" onclick="timepicker2('activeStartDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="2"><spring:message code='crm.lbl.realActiveEnd' /><!-- 실제진행종료   --></th>
                                <td>
                                     <div class="f_item01">
                                        <input type="search" id="activeEndDt" name="activeEndDt" value="" readOnly data-json-obj="true"/>
                                        <span class="date" onclick="calpicker('activeEndDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="f_item01">
                                        <input type="text" id="activeEndDtTime" name="activeEndDtTime" value="" class="" readOnly>
                                        <span class="time" onclick="timepicker2('activeEndDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="regUsrNm" name="regUsrNm" class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                <td>
                                    <input type="hidden" id="scId" name="scId" data-json-obj="true">
                                    <div class="f_text f_disabled"><input type="text" id="scNm" name="scNm" required class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="remark" name="remark" class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.activeCont' /><!-- 활동내용 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="activeCont" name="activeCont" data-json-obj="true" required maxlength="1000" class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.activeRsltCont' /><!-- 활동결과 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="activeRsltCont" name="activeRsltCont" maxlength="1000" data-json-obj="true" class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.guideCmmtCont' /><!-- 지도평어내용 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="guideCmmtCont" name="guideCmmtCont" maxlength="1000" data-json-obj="true" class="f_text" placeholder="" disabled="disabled"></div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="con_btnarea btncount2">
                    <div><span class="btnd1t2" id="btnSave"><spring:message code='global.btn.save' /></span></div>
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
            </section>
        </div>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDate,
    gCrud;

toDate = new Date();


//판매고문
var usersDS = [];
var usersArr = [];
<c:forEach var="obj" items="${users}">
    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    usersArr["${obj.usrId}"] = "${obj.usrNm}";
</c:forEach>
usersArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = usersArr[val];
    }
    return returnVal;
};

// 영업활동유형 DS
var salesActiveTpCdDs = [];
var salesActiveTpCdArr = [];
<c:forEach var="obj" items="${salesActiveTpCdList}">
    salesActiveTpCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 연락방식 DS
var commMthCdDs = [];
var commMthCdArr = [];
<c:forEach var="obj" items="${commMthCdList}">
    commMthCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    commMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
commMthCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = commMthCdArr[val];
    }
    return returnVal;
};

// 영업활동상태 DS
var salesActiveStatCdDs = [];
var salesActiveStatCdArr = [];
<c:forEach var="obj" items="${salesActiveStatCdList}">
    salesActiveStatCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sScId").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sCustNm").val("");
            break;
        case "search3Area" :
            $("#sSalesActiveTpCd").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sScId = $("#sScId").data("kendoExtDropDownList").value();
    var sCustNm = $("#sCustNm").val();
    var sSalesActiveTpCd = $("#sSalesActiveTpCd").data("kendoExtDropDownList").value();

    if(sScId == "" && sCustNm == "" && sSalesActiveTpCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sScId == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCustNm == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sSalesActiveTpCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
}



$(document).ready(function() {
  //현재일자
    var toDay = "${toDay}";
    var lastDay = "${lastDay}";
 // 판매고문
    $("#sScId").kendoExtDropDownList({
        dataSource:usersDS
        , dataTextField:"usrNm"
        , dataValueField:"usrId"
        , optionLabel:"<spring:message code='global.lbl.all'/>"
        , index:0
    });

    // s영업활동유형
    $("#sSalesActiveTpCd").kendoExtDropDownList({
        dataSource:salesActiveTpCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.all'/>"
        , index:0
    });

    // 영업활동유형
    $("#salesActiveTpCd").kendoExtDropDownList({
        dataSource:salesActiveTpCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.all'/>"
        , index:0
    });

    // 연락방식
    $("#commMthCd").kendoExtDropDownList({
        dataSource:commMthCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.all'/>"
        , index:0
    });

    // 영업활동상태
    $("#salesActiveStatCd").kendoExtDropDownList({
        dataSource:salesActiveStatCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.all'/>"
        , index:0
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='mob.crm.menu.salesActiveMgmt' />"); //영업활동관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/crm/cso/salesActive/selectSalesActiveMgmtList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sScId      = $("#sScId").data("kendoExtDropDownList").value();
            var sCustNm = $("#sCustNm").val();
            var sSalesActiveTpCd      = $("#sSalesActiveTpCd").data("kendoExtDropDownList").value();

            if(sScId != "") $("#search1Area span[name='searchStr']").text($("#sScId").data("kendoExtDropDownList").text());
            if(sCustNm != "") $("#search2Area span[name='searchStr']").text(sCustNm);
            if(sSalesActiveTpCd != "") $("#search3Area span[name='searchStr']").text($("#sSalesActiveTpCd").data("kendoExtDropDownList").text());

            setSearchBox();
            contentList();
        }
    });

    //추가 버튼
    $("#btnAdd").bind("click", contentOpenNew);

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
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

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//폼 초기화
function initForm(){
    $("#salesActiveNo").val("");
    $("#custNo").val("");
    $("#custNm").val("");
    $("#commMthCd").data("kendoExtDropDownList").value("");
    $("#prefCommNo").val("");
    $("#planStartDt").val("");
    $("#planStartDtTime").val("");
    $("#planEndDt").val("");
    $("#planEndDtTime").val("");
    $("#salesActiveTpCd").data("kendoExtDropDownList").value("");
    $("#pconCustNm").val("");
    $("#pconCustNo").val("");
    $("#activeStartDt").val("");
    $("#activeStartDtTime").val("");
    $("#activeEndDt").val("");
    $("#activeEndDtTime").val("");
    $("#salesActiveStatCd").data("kendoExtDropDownList").value("");
    $("#pconPrefCommNo").val("");
    $("#regUsrNm").val("");
    $("#scId").val("");
    $("#scNm").val("");
    $("#remark").val("");
    $("#activeCont").val("");
    $("#activeRsltCont").val("");
    $("#guideCmmtCont").val("");

    $("#commMthCd").data("kendoExtDropDownList").enable(true);
    $("#prefCommNo").attr("disabled", false);
    $("#planStartDt").attr("disabled", false);
    $("#planStartDtTime").attr("disabled", false);
    $("#planEndDt").attr("disabled", false);
    $("#planEndDtTime").attr("disabled", false);
    $("#salesActiveTpCd").data("kendoExtDropDownList").enable(true);
    $("#pconCustNm").attr("disabled", true);
    $("#activeStartDt").attr("disabled", false);
    $("#activeStartDtTime").attr("disabled", false);
    $("#activeEndDt").attr("disabled", false);
    $("#activeEndDtTime").attr("disabled", false);
    $("#salesActiveStatCd").data("kendoExtDropDownList").enable(true);
    $("#pconPrefCommNo").attr("disabled", false);
    $("#activeCont").attr("disabled", false);
    $("#activeRsltCont").attr("disabled", false);
    $("#guideCmmtCont").attr("disabled", false);

    $("#btnSave").data("kendoButton").enable(true);
    checkInputFormDisabled();
}


//상세페이지 보기
function contentDetail(dataItem) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

  if( dataItem.salesActiveNo != null && dataItem.salesActiveNo != 'undefined'){
      var param = {"sSalesActiveNo":dataItem.salesActiveNo};
      mob.loading.show();
      $.ajax({
          //url:"<c:url value='/mob/par/pmm/itemMaster/selectMobileItemMasterByKey.do' />",
          url:"<c:url value='/mob/crm/cso/salesActive/selectSalesActiveMgmtByKey.do' />",
          data:JSON.stringify(param),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
              mob.loading.hide();
              mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
          }

      }).done(function(body) {
          mob.loading.hide();
          //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
          if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
              return false;
          }

          //입력폼 초기화
          initForm();

          $("#salesActiveNo").val(body.salesActiveNo);
          $("#custNo").val(body.custNo);
          $("#custNm").val(body.custNm);
          $("#commMthCd").data("kendoExtDropDownList").value(body.commMthCd);
          $("#prefCommNo").val(body.prefCommNo);
          $("#planStartDt").val(chgDate2Str(body.planStartDt));
          $("#planStartDtTime").val(chgDate2TimeStr(body.planStartDt));
          $("#planEndDt").val(chgDate2Str(body.planEndDt));
          $("#planEndDtTime").val(chgDate2TimeStr(body.planEndDt));
          $("#salesActiveTpCd").data("kendoExtDropDownList").value(body.salesActiveTpCd);
          $("#pconCustNm").val(body.pconCustNm);
          $("#pconCustNo").val(body.pconCustNo);
          $("#activeStartDt").val(chgDate2Str(body.activeStartDt));
          $("#activeStartDtTime").val(chgDate2TimeStr(body.activeStartDt));
          $("#activeEndDt").val(chgDate2Str(body.activeEndDt));
          $("#activeEndDtTime").val(chgDate2TimeStr(body.activeEndDt));
          $("#salesActiveStatCd").data("kendoExtDropDownList").value(body.salesActiveStatCd);
          $("#pconPrefCommNo").val(body.pconPrefCommNo);
          $("#regUsrNm").val(body.regUsrNm);
          $("#scId").val(body.scId);
          $("#scNm").val(body.scNm);
          $("#remark").val(body.remark);
          $("#activeCont").val(body.activeCont);
          $("#activeRsltCont").val(body.activeRsltCont);
          $("#guideCmmtCont").val(body.guideCmmtCont);

          // 상태가 종료이면 읽기전용
          if ( body.salesActiveStatCd == "03" ) {

              $("#commMthCd").data("kendoExtDropDownList").enable(false);
              $("#prefCommNo").attr("disabled", true);
              $("#planStartDt").attr("disabled", true);
              $("#planStartDtTime").attr("disabled", true);
              $("#planEndDt").attr("disabled", true);
              $("#planEndDtTime").attr("disabled", true);
              $("#salesActiveTpCd").data("kendoExtDropDownList").enable(false);
              $("#pconCustNm").attr("disabled", true);
              $("#activeStartDt").attr("disabled", true);
              $("#activeStartDtTime").attr("disabled", true);
              $("#activeEndDt").attr("disabled", true);
              $("#activeEndDtTime").attr("disabled", true);
              $("#salesActiveStatCd").data("kendoExtDropDownList").enable(false);
              $("#pconPrefCommNo").attr("disabled", true);
              $("#activeCont").attr("disabled", true);
              $("#activeRsltCont").attr("disabled", true);
              $("#guideCmmtCont").attr("disabled", true);

              $("#btnSave").data("kendoButton").enable(false);
              checkInputFormDisabled();
          }
          //partsJs.validate.groupObjAllDataSet(body);
      });
  }
}


function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");

    initForm();
  }

//버튼 - 입고확정
$("#btnSave").kendoButton({
    click:function(e){
        confirmOpen(confirmMsgSave,'doSave',y,n);
    }
});

// 고객 검색 팝업
var popupWindow  ;
$("#custSearch").click(function(){
    popupWindow = mob.window.popup({
        windowId:"customerSearchPopupMain"
        , content:{
            url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if ( dms.string.isNotEmpty(data.custNo) ) {
                        initForm();
                        $("#custNo").val(data.custNo);
                        $("#custNm").val(data.custNm);
                        $("#prefCommNo").val(data.hpNo);
                        $("#scId").val(data.mngScId);
                        $("#scNm").val(data.mngScNm);
                    }
                }
            }
        }
    })
});


function doSave(){
    //var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");
    var validator = $("#salesActiveMgmtForm").kendoExtMobValidator().data("kendoExtMobValidator");

    if (!validator.validate()) {
        return false;
    }
    var planStartDt = $("#planStartDt").val() +" "+ $("#planStartDtTime").val();
    var planEndDt = $("#planEndDt").val() +" "+ $("#planEndDtTime").val();


    if( planStartDt > planEndDt){
        // 계획일자 / 을(를) 확인하여 주세요.
        mob.notification.warning("<spring:message code='crm.lbl.planDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
        return;
    }

    var activeStartDt = $("#activeStartDt").val() +" "+ $("#activeStartDtTime").val()
        , activeEndDt = $("#activeEndDt").val() +" "+ $("#activeEndDtTime").val()
        , salesActiveStatCd = $("#salesActiveStatCd").data("kendoExtDropDownList").value()
        , dataValidate = false
    ;

    if ( dms.string.isNotEmpty(activeStartDt) || dms.string.isNotEmpty(activeEndDt) || salesActiveStatCd === "02" ) {

        if( dms.string.isEmpty(activeStartDt) ){
           dataValidate = true;
        }

        if( dms.string.isEmpty(activeEndDt) ){
           dataValidate = true;
        }

        if ( activeEndDt < activeStartDt ){
            dataValidate = true;
        }

        if (dataValidate) {
            // 실제진행일 을(를) 확인하여 주세요.
            mob.notification.warning("<spring:message code='crm.lbl.salesActiveDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return false;

        }

        if ( salesActiveStatCd !== "02" ) {
            // 영업활동상태 을(를) 확인하여 주세요.
            mob.notification.warning("<spring:message code='crm.lbl.salesActiveStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return false;

        }

    }

    var saveData = $("#salesActiveMgmtForm").serializeObject($("#salesActiveMgmtForm").serializeArrayInSelector("[data-json-obj='true']"));

    saveData.planStartDt = chgDateTimeStamphhMM($("#planStartDt").val() +" "+ $("#planStartDtTime").val());
    saveData.planEndDt = chgDateTimeStamphhMM($("#planEndDt").val() +" "+ $("#planEndDtTime").val());
    saveData.activeStartDt = chgDateTimeStamphhMM($("#activeStartDt").val() +" "+ $("#activeStartDtTime").val());
    saveData.activeEndDt = chgDateTimeStamphhMM($("#activeEndDt").val() +" "+ $("#activeEndDtTime").val());

    console.log("saveData::"+JSON.stringify(saveData));
    mob.loading.show();
    $.ajax({
         url:"<c:url value='/mob/crm/cso/salesActive/multiSalesActiveMgmts.do' />"
        ,data:JSON.stringify(saveData)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        /* ,success:function(jqXHR, textStatus) {

            console.log("jqXHR:" ,jqXHR)
            console.log("textStatus:" ,textStatus)
            // 저장완료일경우 해당 데이터를 다시 조회한다.
            if(textStatus == "success" && jqXHR > 0 ){

*/
        // 저장완료일경우 해당 데이터를 다시 조회한다.
        ,success:function(result) {
            mob.loading.hide();
            if(result > 0 ){
                // 저장 / 이 완료 되었습니다.
                mob.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                contentListNonRefresh();

            }else{
                // 저장정보 / 을(를) 확인하여 주세요.
                mob.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            }

        }
        ,error:function(jqXHR,status,error) {
           mob.loading.hide();
           mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
    });
}
</script>
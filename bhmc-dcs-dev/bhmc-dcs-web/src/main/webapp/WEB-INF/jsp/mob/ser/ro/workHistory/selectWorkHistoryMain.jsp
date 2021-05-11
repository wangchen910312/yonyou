<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<style>
</style>

<section id="content">
    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title"><spring:message code="ser.menu.roStatus" /><!-- RO작업이력현황 --></h2>
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
                            <th scope="row"><span><spring:message code="ser.lbl.roDate" /><!-- Ro일자 --></span></th>
                            <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                        </tr>
                        <tr id="search2Area">
                            <th scope="row"><span><spring:message code="ser.lbl.carNo" /><!--차량번호 --></span></th>
                            <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                        </tr>
                        <tr id="search3Area">
                            <th scope="row"><span><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></span></th>
                            <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="listarea">
                    <div class="listhead dlistitem">
                        <span style="width:35%"><spring:message code="ser.lbl.roDate" /><!-- Ro일자 --></span>
                        <span style="width:65%"><spring:message code="ser.lbl.roDocNo" /><!-- Ro번호 --></span>
                        <span class="clboth" style="width:35%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                        <span style="width:65%"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span>
                        <span class="clboth" style="width:35%"><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></span>
                        <span style="width:35%"><spring:message code="global.lbl.car" /><!-- 차량 --></span>
                        <span style="width:30%"><spring:message code="ser.lbl.roStatus" /><!-- RO상태 --></span>
                    </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
        </div>
    </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.roStatus" /> <spring:message code="global.title.searchCondition" /><!-- ro현황 + 조회조건  --></h2>
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
                            <th scope="row"><spring:message code="ser.lbl.roDate" /><!-- Ro일자 --></th>
                            <td class="f_term">
                                <div class="f_item01">
                                    <input type="text" id="sRoFromDt" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span>
                                </div><span class="termtext"> ∼</span>
                                <div class="f_item01">
                                    <input type="text" id="sRoToDt" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text"><input id="sCarRegNo" type="text"  class="form_input" style="width:100%"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <div class="f_text"><input id="sDriverNm" type="text" style="width:100%"/></div>
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
                <h2><spring:message code="ser.menu.roStatus" /> <spring:message code="ser.title.campaign.detailInfo" /><!-- RO작업 상세정보 --></h2>
            </div>
            <div class="co_group">
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roTp" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.itemInfo" /><!-- 부품정보--></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">

                            <span style="width:35%"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.itemNm" /><!-- 부품명--></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.giTp" /><!-- 출고유형  --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.qty" />/<spring:message code="ser.lbl.unitCd" /><!-- 수량/단위 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.prc" />/<spring:message code="ser.lbl.amt" /><!-- 단가/금액 --></span>
                        </div>
                <iframe id="itemList" name="itemList" border="1" frameborder="0" width="100%"></iframe>
            </div>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.lbrOperInfo" /><!-- 작업정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:100%"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목--></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.lbrCd" /><!-- 정비코드 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.lbrTp" /><!-- 정비유형  --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.lbrAmt" /><!-- 공임비 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.lbrHm" /><!-- 정비공임 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.lbrPrc" /><!-- 공임단가 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.dcAmt" /><!-- 할인 --></span>
                        </div>
                <iframe id="workList" name="workList" border="1" frameborder="0" width="100%"></iframe>
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


//RO유형 Array
var roTpCdList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });


//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>


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
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sRoFromDt").val("");
            $("#sRoToDt").val("");
            break;
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sDriverNm").val("");
            break
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sRoFromDt = $("#sRoFromDt").val();
    var sRoToDt = $("#sRoToDt").val();
    var sCarRegNo = $("#sCarRegNo").val();
    var sDriverNm = $("#sDriverNm").val();

    if(sRoFromDt == "" && sRoToDt == "" && sCarRegNo == "" && sDriverNm == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sRoFromDt == "" && sRoToDt == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCarRegNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sDriverNm == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
    //0705
    setMainListHeight();

}


$(document).ready(function() {

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        $(".skeyarea").hide();
    }
    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.roStatus' />");<!-- RO작업이력 현황 -->
    //0705
    //$("#header_title").on("click", contentSearch);
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");



    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/workHistory/selectWorkHistoryList.do' />");
    //$("#mainList").attr("src", "<c:url value='/resources/html/mob/guide/iframe.html' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sRoFromDt = $("#sRoFromDt");
            var sRoToDt = $("#sRoToDt");
            var sCarRegNo = $("#sCarRegNo");
            var sDriverNm = $("#sDriverNm");

            if(sRoFromDt.val() != "" || sRoToDt.val() != "") $("#search1Area span[name='searchStr']").html(sRoFromDt.val() + " ~<br/>" + sRoToDt.val());
            if(sCarRegNo.val() != "") $("#search2Area span[name='searchStr']").text(sCarRegNo.val());
            if(sDriverNm.val() != "") $("#search3Area span[name='searchStr']").text(sDriverNm.val());

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


    /*
    $("#itemList", parent.document).load(function(){
        $("body,html").animate({scrollTop:0}, 200);
    */

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
  //0705
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
  $("#sRoToDt").val(chgServerDate2Str(toDt));

}


function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    //0705
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem!=null){
        $("#roDocNo").val(dataItem.roDocNo);
        // todo:ro유형 값저장
    }

    if( dataItem.roDocNo != null && dataItem.roDocNo != 'undefined'){

        // 푸품정보 리스트 조회
        $("#itemList").attr("src", "<c:url value='/mob/ser/ro/workHistory/selectWorkHistoryItemList.do' />");
        //$("#itemList").attr("src", "<c:url value='/resources/html/mob/guide/iframe.html' />");

        // 작업정보 리스트 조회
        $("#workList").attr("src", "<c:url value='/mob/ser/ro/workHistory/selectWorkHistoryWorkList.do' />");

    }
  }

</script>
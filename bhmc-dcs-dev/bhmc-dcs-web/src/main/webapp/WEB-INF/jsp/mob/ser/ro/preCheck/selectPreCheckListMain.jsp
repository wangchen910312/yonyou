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
                <h2 id="content_list_title"><spring:message code="ser.menu.preCheckList" /><!-- 사전점검현황 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="ser.lbl.preChkDt" /><!-- 사전점검일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span></th>
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
                            <span style="width:50%"><spring:message code="ser.lbl.preChkDt" /><!-- 사전점검일자 --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.preInsNo" /><!-- 입고점검서번호 --></span>

                            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.resvDocNo" /><!-- 예약번호 --></span>

                            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.car" /><!-- 차량 --></span>
                            <%--
                            <span style="width:65%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
                            --%>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
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
                        <th scope="row"><spring:message code="ser.lbl.preChkDt" /><!-- 사전점검일자 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sFromDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sToDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCarRegNo"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sDriverNm"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sFromDt").val("");
            $("#sToDt").val("");
            break;
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sDriverNm").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sFromDt = $("#sFromDt").val();
    var sToDt = $("#sToDt").val();
    var sCarRegNo = $("#sCarRegNo").val();
    var sDriverNm = $("#sDriverNm").val();

    if(sFromDt == "" && sToDt == "" && sCarRegNo == "" && sDriverNm == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sFromDt == "" && sToDt == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCarRegNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sDriverNm == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
    setMainListHeight();
}


$(document).ready(function() {


    function initPage(){
        $(".skeyarea").hide();
    }


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.preCheckList' />");<!-- 부품예약현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/preCheck/selectPreCheckListList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sFromDt = $("#sFromDt");
            var sToDt = $("#sToDt");

            var sCarRegNo = $("#sCarRegNo");
            var sDriverNm = $("#sDriverNm");

            if(sFromDt.val() != "" || sToDt.val() != "") $("#search1Area span[name='searchStr']").html(sFromDt.val() + " ~<br/>" + sToDt.val());
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
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_search").css("display","block");

  $("#sFromDt").val(chgServerDate2Str(sevenDtBf));
  $("#sToDt").val(chgServerDate2Str(toDt));

}

</script>
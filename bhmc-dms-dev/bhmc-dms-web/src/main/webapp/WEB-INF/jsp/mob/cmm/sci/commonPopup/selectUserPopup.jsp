<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_pop_list -->
        <section id="content_pop_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_pop_list_title"><spring:message code='cmm.lbl.user.searchList' /></h2>
            </div>

            <%-- <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                             <tr id="search1Area">
                                <th scope="row"><span><spring:message code='global.lbl.usrId' /></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code='global.lbl.usrNm' /></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.empNo" /></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div> --%>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:30%"><spring:message code="global.lbl.usrId" /></span>
                    <span style="width:40%"><spring:message code="global.lbl.usrNm" /></span>
                    <span style="width:30%"><spring:message code="global.lbl.empNo" /></span>
                </div>
                <iframe id="comonPopupList" border="0" frameborder="0" width="100%"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_pop"><span></span></div>
            </div>
            <div class="con_btnarea">
                <span class="btnd1" id="btnSelect"><spring:message code="global.btn.select" /><!-- 선택 --></span>
            </div>
        </section>


        <!-- content_pop_search -->
        <section id="content_pop_search" class="content_pop_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="cmm.lbl.user.searchCondition" /><!-- 사용자 조회조건  --></h2>
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
                                <th scope="row"><spring:message code='global.lbl.usrId' /></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sUsrId"  class="form_input" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.usrNm' /></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sUsrNm"  class="form_input" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.empNo' /></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sEmpNo" class="form_input" ></div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
        </section>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();

/* $(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sUsrId").val("");
            break;
        case "search2Area" :
            $("#sUsrNm").val("");
            break;
        case "search3Area" :
            $("#sEmpNo").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
}); */


/* function setSearchBox(){
    var sUsrId = $("#sUsrId").val();
    var sUsrNm = $("#sUsrNm").val();
    var sEmpNo = $("#sEmpNo").val();

    if(sUsrId == "" && sUsrNm == "" && sEmpNo == ""){
        //$(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sUsrId == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sUsrNm == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sEmpNo == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
} */

// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;
$(document).ready(function() {
    setDataItem = null ;// 화면 로딩시 초기화

    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        } */
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='cmm.title.user.search' />");<!-- 사용자조회 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#comonPopupList").attr("src", "<c:url value='/mob/cmm/sci/commonPopup/selectUserListPopup.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            /* var sUsrId = $("#sUsrId");
            var sUsrNm = $("#sUsrNm");
            var sEmpNo = $("#sEmpNo");

            if(sUsrId.val() != "") $("#search1Area span[name='searchStr']").text(sUsrId.val());
            if(sUsrNm.val() != "") $("#search2Area span[name='searchStr']").text(sUsrNm.val());
            if(sEmpNo.val() != "") $("#search3Area span[name='searchStr']").text(sEmpNo.val()); */
            //setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_pop_list").css("display") == "block") { goMain(); }
        else if ($("#content_pop_search").css("display") == "block") { contentList(); }
        //else if ($("#content_detail").css("display") == "block") { contentList(); }
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

    //헤더 접기 실행
    $("#header_title").bind("click", function(){
        if($("#content_pop_search").css("display") == "block"){
            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
            $("#header_title span").attr("class","search_close");
        }else{
            $("#header_title span").attr("class","search_open");
            contentSearch();
        }
    });

});
</script>

<script>

//팝업 레이어닫기

function goMain() {
  //window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    parent.userSearchPopupWin.close();
}


//목록페이지 보기
function contentList() {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("comonPopupList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setPopUpListHeight2();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_pop_list").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_pop_search").css("display","block");
}

// 팝업 설정값
var options = parent.userSearchPopupWin.options.content.data;


function contentCommonDetail(dataItem) {
     setDataItem = dataItem;
  }

//선택 버튼.
$("#btnSelect").kendoButton({
    click:function(e){
        if(setDataItem != null) {
            options.callbackFunc(setDataItem);
            parent.userSearchPopupWin.close();
        }
    }
});




</script>
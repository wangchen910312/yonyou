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
                <h2 id="content_list_title"><spring:message code="crm.lbl.scId" /> <spring:message code="global.title.list" /><!-- 판매고문 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="crm.lbl.scId" /> <spring:message code="global.lbl.name" /><!-- 판매고문 이름 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.empNo" /><!-- 사원번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead checkitem">
                            <span style="width:50%"><spring:message code="crm.lbl.scId" /> <spring:message code="global.lbl.name" /><!-- 판매고문 이름 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.empNo" /><!-- 사원번호 --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>

            <div class="btnfixed">
                <div class="con_btnarea btncount2">
                    <div><span class="btnd1" id="btnCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
                    <div><span class="btnd1" id="btnConfirm"><spring:message code='global.btn.confirm' /><!-- 확인 --></span></div>
                </div>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.lbl.scId" /> <spring:message code="global.title.searchCondition" /><!-- 판매고문 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="global.lbl.name" /><!-- 판매고문 이름 --></th>
                        <td>
                            <div class="f_text"><input id="sUsrNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.empNo" /><!-- 사원번호 --></th>
                        <td>
                            <div class="f_text"><input id="sUsrId" type="text" /></div>
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


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
           $("#sUsrNm").val("");
           break;
        case "search2Area" :
           $("#sUsrId").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){

    var sUsrNm = $("#sUsrNm").val();
    var sUsrId = $("#sUsrId").val();

    if(sUsrNm == "" && sUsrId == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sUsrNm == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sUsrId == "") $("#search2Area").hide();
        else $("#search2Area").show();
    }

    setMainListHeight();
}


$(document).ready(function() {

    searchMode = "N";


    function initPage(){
        $(".skeyarea").hide();

        if(parent.userList.length > 0){


        }
    }


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='crm.lbl.scId' />");<!-- 판매고문 -->
    //$("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/crm/ass/assign/selectAssignUserPopList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sUsrNm = $("#sUsrNm");
            var sUsrId = $("#sUsrId");
            if(sUsrNm.val() != "") $("#search1Area span[name='searchStr']").text(sUsrNm.val());
            if(sUsrId.val() != "") $("#search1Area span[name='searchStr']").text(sUsrId.val());
            setSearchBox();
            contentList();
        }
    });

    // 확인버튼
    $("#btnConfirm").click(function(){

        parent.userList = [];

        $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
            if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){
                var gridData = {
                    usrNm             :$(this).parent().parent().find("span[name='usrNm']").text(),
                    usrId             :$(this).parent().parent().find("span[name='usrId']").text(),
                };
                parent.userList.push(gridData);
             }
        });
        //parent.$("#dlBpCd").val(e.dataItem.bpCd);
        //parent.$("#dlBpNm").val(e.dataItem.bpNm);
        parent.addAssignUser();

        parent.assignUserPopupWin.close();

    });

    // 취소버튼
    $("#btnCancel").click(function(){
        parent.assignUserPopupWin.close();
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

  $("#sRegDtFrom").val(chgServerDate2Str(sevenDtBf));
  $("#sRegDtTo").val(chgServerDate2Str(toDt));

}

</script>
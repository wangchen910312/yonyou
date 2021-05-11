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
        <c:import url="/WEB-INF/jsp/ZnewMob/cmm/sci/commonPopup/listJsp/selectUserListPopup.jsp"></c:import>

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

<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();

// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;
$(document).ready(function() {
    setDataItem = null ;// 화면 로딩시 초기화

    function initPage(){
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='cmm.title.user.search' />");<!-- 사용자조회 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    listData.read();

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            listData.read();
        }
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_pop_list").css("display") == "block") { goMain(); }
        else if ($("#content_pop_search").css("display") == "block") { contentList(); }
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
    parent.userSearchPopupWin.close();
}


//목록페이지 보기
function contentList() {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
  setTimeout(function(){ setPopUpListHeight2();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_pop_list").css("display","none");
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
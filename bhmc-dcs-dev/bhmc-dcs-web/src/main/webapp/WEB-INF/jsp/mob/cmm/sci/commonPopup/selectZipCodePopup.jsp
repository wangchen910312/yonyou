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
    <section id="content_list" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2>주소 목록</h2>
        </div>

        <!-- // search keyword -->
        <div class="skeyarea"><div>
                <table class="slist01">
                    <colgroup>
                        <col style="width:25%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr id="search1Area">
                            <th scope="row"><span><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search2Area">
                            <th scope="row"><span><spring:message code="global.lbl.saleOpptStepCd" /><!-- 판매기회 단계 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search3Area">
                            <th scope="row"><span><spring:message code="global.lbl.trsfStatCd" /><!-- 전출상태 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                    </tbody>
                </table>
                <!-- <div class="btnarea">
                    <span class="sbtn">전체조건 삭제</span>
                </div> -->
        </div></div>
        <!-- search keyword // -->

        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code='global.lbl.zipCd' /><!-- 우편번호 --></span>
                <span style="width:50%"><spring:message code='global.lbl.zipCd' /><!-- 확장우편번호 --></span>
                <span style="width:50%" class="clboth"><spring:message code='global.lbl.sungCd' /><!-- 성코드 --></span>
                <span style="width:50%"><spring:message code='global.lbl.sungNm' /><!-- 성이름 --></span>
                <span style="width:50%" class="clboth"><spring:message code='global.lbl.cityCd' /><!-- 도시코드 --></span>
                <span style="width:50%""><spring:message code='global.lbl.cityNm' /><!-- 도시명 --></span>
                <span style="width:50%" class="clboth"><spring:message code='par.lbl.distCd' /><!-- 지역코드 --></span>
                <span style="width:50%"><spring:message code='global.lbl.distNm' /><!-- 지역명 --></span>
            </div>
            <iframe id="comonPopupList" border="0" frameborder="0" width="100%" height="300"></iframe>
        </div>

        <div class="btnfixed">
            <div class="formarea">
                <table class="flist01">
                    <caption>주소 조회 조건</caption>
                    <colgroup>
                        <col style="width:25%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>
                                <div class="f_text f_disabled">
                                    <input type="text" value="" name="addr" id="addr" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="f_text">
                                    <input type="text" value="" name="addrDtl" id="addrDtl" placeholder="상세주소" >
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 버튼 2개  -->
            <div class="con_btnarea btncount2">
                <div><span class="btnd1t2" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></span></div>
                <div><span class="btnd1" id="btnSelect"><spring:message code="global.btn.save" /><!-- 저장 --></span></div>
            </div>
        </div>
    </section>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:block;">
        <div class="content_title conttitlePrev">
            <h1><spring:message code="global.title.searchCondition" /><!-- 조회조건 --></h1>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption>주소 조회 조건</caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">
                            <div class="f_text"><input type="text" id="sGubun" class="form_comboBox" /></div>
                        </th>
                        <td>
                            <div class="f_text">
                                <input type="text" value="" id="sValue" name="sValue">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.zipCd" /><!-- 우편번호 --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" value="" id="sZipCd" name="sZipCd">
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span class="btnd1"  id="btnSearch" ><span class="search">조회</span></span>
        </div>
    </section>
    <!-- // content_search -->

</section>


<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>


<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sGubun").val("");
            break;
        case "search2Area" :
            $("#sValue").val("");
            break;
        case "search3Area" :
            $("#sZipCd").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sGubun = $("#sGubun").val();
    var sValue = $("#sValue").val();
    var sZipCd = $("#sZipCd").val();

    if(sGubun == "" && sValue == "" && sZipCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sGubun == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sValue == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sZipCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
}

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
    $("#header_title").html("<spring:message code='global.title.zipSearch' />");<!-- 우편번호 조회 -->
    $("#header_title").on("click", contentSearch);

    // 목록 조회
    $("#comonPopupList").attr("src", "<c:url value='/mob/cmm/sci/commonPopup/selectZipCodeListPopup.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sGubun = $("#sGubun").data("kendoExtDropDownList").text();
            var sValue = $("#sValue").val();
            var sZipCd = $("#sZipCd").val()


            if(sGubun != "") $("#search1Area span[name='searchStr']").text(sGubun);
            if(sValue != "") $("#search2Area span[name='searchStr']").text(sValue);
            if(sZipCd != "") $("#search3Area span[name='searchStr']").text(sZipCd);
            setSearchBox();
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

 // 갬색구분 드랍다운 리스트.
    $("#sGubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.getCmmCdList({"cmmGrpCd":"COM018","isAppendEmptyData":true})
        ,autoBind:true
        ,index:1
    });

});
</script>

<script>

//팝업 레이어닫기
function goMain() {
    parent.zipCodeSearchPopupWin.close();
}


//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_list").css("display","block");
  document.getElementById("comonPopupList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

// 팝업 설정값
var options = parent.zipCodeSearchPopupWin.options.content.data;


function contentCommonDetail(dataItem) {
     setDataItem = dataItem;

     var addr = dataItem.sungNm + " " + dataItem.cityNm + " " + dataItem.distNm
     $("#addr").val(addr);

  }

//선택 버튼.
$("#btnSelect").kendoButton({
    click:function(e){
        if(setDataItem != null) {
            setDataItem.addrDetlCont = $("#addrDtl").val();
            options.callbackFunc(setDataItem);
            parent.zipCodeSearchPopupWin.close();
        }
    }
});

//취소 버튼.
$("#btnCancel").kendoButton({
    click:function(e){
        console.log(">>>> cancel <<<<");
        goMain();
    }
});




</script>
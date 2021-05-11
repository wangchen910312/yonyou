<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BHMC-DMS</title>
<%@ include file="defaultMobInclude.jsp" %>
</head>
<body style="background-color: #e9ecef;">
<div id="loadingScreen"style="position: fixed; left: 0; top:0; width: 100%; z-index: 99999 !important ;"></div>
<header id="header">
<%@ include file="headerMobInclude.jsp" %>
</header>
<div id="impoartPage">
    <c:import url="${_urlBaseJsp}"/>
</div>
</body>
<script type="text/javascript">
$(document).ready(function (){
    // 리스트 상세화면 확인버튼 클릭시 첫 리스트화면으로 이동
    $("#detailConfirmBtn").click(function(){
        contentListNonRefresh();
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if($("#content_list").css("display") == "block") { window.history.back(); }
        else if($("#content_search").css("display") == "block") { contentListNonRefresh();}
        else if($("#content_detail").css("display") == "block") { contentListNonRefresh();}
    });


    $("#listView").kendoListView({
        dataSource:listData
        ,template: kendo.template($("#template").html())
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView").css({"background-image":"none"});
            }
        }
    });
    $("#listView").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal>pageSize){
            pageSize+=viewRow;
            pageIndex+=viewRow;
            $(this).data('kendoListView').dataSource.read();
        }
    });

    var elements = ["#header", "#content_list > .formarea", "#content_list > .conttitlePrev", "#content_list .co_group > .content_title",
                    "#content_list .listhead", "#content_list .btnfixed", "#content_list .tabarea2", "#content_list .listarea > .bgNone"];
    $("#listView").height($(window).height()-sumElementsHeight(elements));
    var windowSize = $(window).height();
    var eleSize = sumElementsHeight(elements);
    var listSize = $("#listView").height();
});
//리스트데이터 초기화
function initList(){
    tempData=[];
    pageIndex = 0,rowTotal = 0;
    pageSize = viewRow;
}
//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

function sumElementsHeight(textArray) {
    var gap = 10;
    var sum = 0 + gap;
    $.each(textArray, function(idx,obj){
        if($(obj).is(":visible")) {
            sum += $(obj).outerHeight() * $(obj).length;
        }
    });
    return sum;
}

</script>
</html>
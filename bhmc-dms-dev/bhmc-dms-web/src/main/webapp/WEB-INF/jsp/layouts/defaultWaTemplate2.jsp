<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<spring:theme code="css" var="theme" />
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocale}">
<head>
<%@ include file="defaultInclude.jsp" %>
<style type="text/css">
header{height: 38px; background: url(/bhmc-dms-web/resources/img/logo.png) no-repeat 0 0; background-color: #3c78b5;}
header li.logo{float: left;}
header li.menu{float: left;}
header li.logout{float: left;}
#ajaxSection{background-color: white;}
</style>
</head>

<body>
<header>
    <ul>
        <li class="custCarinfoMenu">selectCustCarInfo Menu Open</li>
        <li class="logout"><a href="/bhmc-dms-web/cmm/ath/login/selectLogoutAction.do"><span>logout</span></a></li>
    </ul>
</header>
<section id="ajaxSection">
<div id="ajaxDiv"></div>
<tiles:insertAttribute name="body" />
</section>
<script type="text/javascript">
//그리드 화면 맞춤
function resizeGrid(){
    var resizableGrid = $("div.resizable_grid");

    if(resizableGrid.length == 1){
        var resizableContainer = $("#resizableContainer");
        var offsetHeight = resizableContainer.data("offsetheight")||0;

        if(resizableContainer.length == 1){
            var grid = resizableGrid.data("kendoExtGrid");
            var windowHeight = $(window).innerHeight();
            var resizableContainerHeight = resizableContainer.height();
            var gridHeight = grid.element.height();
            var gridHeaderHeight = $("div.k-grid-header", grid.element).height();
            var gridPagerHeight = $("div.k-grid-pager", grid.element).length == 0? 0:$("div.k-grid-pager", grid.element).height();

            grid.element.height(windowHeight - resizableContainerHeight + gridHeight - 10 + offsetHeight);
            $("div.k-grid-content", grid.element).height(grid.element.height() - gridHeaderHeight - gridPagerHeight - 12 + offsetHeight);
        }
    }
}

$(document).ready(function() {
    resizeGrid();
    
    $.ajax({
        url:"<c:url value='/ser/wa/selectTabletMain.do' />"
        ,data:""
        ,type:'GET'
        ,error:function(jqXHR, status, error) {
            console.log(jqXHR);
        }
        ,success:function(result) {
            $("#ajaxDiv").html(result);
        }
    });
    
    $(".custCarinfoMenu").click(function (){
        $(".reservation_top").removeClass("tablet_hide");
        $(".group").hide();
    });   
    
});

/**
 * 조회 영역[AREA]에서 엔터키 입력시 이벤트 처리
 * ex)<div class="table_form" role="search" data-btnid="btnSearch"></div>
 */
 $(".table_form[role=search]").keyup(function(e) {    	 
     var btnid = $(this).attr("data-btnid");
     if (e.keyCode == 13 && btnid) {
    	 setTimeout(function(){
    		 $("#"+btnid).click();
    	 });             
     }
 });
</script>
</body>
</html>
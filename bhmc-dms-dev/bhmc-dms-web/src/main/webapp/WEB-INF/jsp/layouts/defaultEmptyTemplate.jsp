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
</head>

<body>


<tiles:insertAttribute name="body" />


<script type="text/javascript">

//그리드 화면 맞춤
function resizeGrid(){
    var resizableContainer = $("#resizableContainer");

    if(resizableContainer.length == 1){
        var offsetHeight = resizableContainer.data("offsetheight")||0;
        var windowHeight = $(window).innerHeight();
        var resizableContainerHeight = resizableContainer.height();
        var resizableGridList = $("div.resizable_grid");

        if(resizableGridList.length != 0){
            $.each(resizableGridList, function(idx, resizableGrid){
                var that = $(resizableGrid);
                var grid = that.data("kendoExtGrid");
                var gridHeight = grid.element.height();
                var gridHeaderHeight = $("div.k-grid-header", grid.element).height();
                var gridPagerHeight = $("div.k-grid-pager", grid.element).length == 0? 0:$("div.k-grid-pager", grid.element).height();
                var gridFooterHeight = $("div.k-grid-footer", grid.element).length == 0? 0:$("div.k-grid-footer", grid.element).height();
                var offset = that.data().offset||0;

                grid.element.height(windowHeight - resizableContainerHeight + gridHeight - 10 + offsetHeight + offset);
                $("div.k-grid-content", grid.element).height(grid.element.height() - gridHeaderHeight - gridPagerHeight - gridFooterHeight - 12 + offsetHeight + offset);
            });
        }
    }
}

$(document).ready(function() {
    resizeGrid();
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
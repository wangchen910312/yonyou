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
    <!-- content -->
    <section id="content">
        <tiles:insertAttribute name="body" />
    </section>

    <footer id="footer" style="display:none;" >
        <div id="globalFooterNotification"></div>
        <tiles:insertAttribute name="footer" />
    </footer>


<script type="text/javascript">

    //현재페이지의 footer를 상위프레임에 출력한다.
    window.parent.$("#footer_content").html($("#footer").html());

    $("#footer").bind("DOMSubtreeModified",function(){
        window.parent.$("#footer_content").html($("#footer").html());
    });
    $("#footer").bind("DOMCharacterDataModified",function(){
        window.parent.$("#footer_content").html($("#footer").html());
    });

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
/*
        var windowHeight = $(window).innerHeight();
        var resizableContainers = $(".resizable-container");
        var resizableContainerHeight = 0;

        if(resizableContainers.length == 1){
            $.each(resizableContainers, function(idx, container){

                resizableContainerHeight = $(container).height();

                $(".resizable-element", container).each(function(idx, element){
                    var resizableElement = $(element);
                    var resizableElementHeight = resizableElement.height();
                    var offsetHeight = (resizableElement.data("offsetheight")||0) - 12;

                    //그리드인 경우
                    if($("div.k-grid-header", element).length != 0){
                        var gridOffsetHeight = 0;
                        gridOffsetHeight = gridOffsetHeight + $("div.k-grid-header", element).height();
                        gridOffsetHeight = gridOffsetHeight + ($("div.k-grid-pager", element).length == 0? 0:$("div.k-grid-pager", element).height());

                        resizableElement.height(windowHeight - resizableContainerHeight + resizableElementHeight + offsetHeight);
                        $("div.k-grid-content", resizableElement).height(resizableElement.height() - gridOffsetHeight - 12 + offsetHeight);
                    }else{
                        resizableElement.height(windowHeight - resizableContainerHeight + resizableElementHeight + offsetHeight);
                    }
                });
            });

        }else{

            resizableContainerHeight = $("#content").height();

            $(".resizable-element").each(function(idx, element){
                var resizableElement = $(element);
                var resizableElementHeight = resizableElement.height();
                var offsetHeight = (resizableElement.data("offsetheight")||0) - 12;

                //그리드인 경우
                if($("div.k-grid-header", element).length != 0){
                    var gridOffsetHeight = 0;
                    gridOffsetHeight = gridOffsetHeight + $("div.k-grid-header", element).height();
                    gridOffsetHeight = gridOffsetHeight + ($("div.k-grid-pager", element).length == 0? 0:$("div.k-grid-pager", element).height());

                    console.log("element.id : "+element.id);
                    console.log("windowHeight : "+windowHeight);
                    console.log("resizableElementHeight : "+resizableElementHeight);
                    console.log("gridOffsetHeight : "+gridOffsetHeight);
                    console.log("offsetHeight : "+offsetHeight);
                    console.log("resizableElementHeight + (windowHeight - resizableElementHeight) - gridOffsetHeight - 12 + offsetHeight : "+(resizableElementHeight + (windowHeight - resizableElementHeight) - gridOffsetHeight - 12 + offsetHeight));


                    resizableElement.height(windowHeight - resizableContainerHeight + resizableElementHeight + offsetHeight);
                    $("div.k-grid-content", resizableElement).height(resizableElement.height() - gridOffsetHeight - 12 + offsetHeight);
                }else{

                    console.log("element.id : "+element.id);
                    console.log("windowHeight : "+windowHeight);
                    console.log("resizableElementHeight : "+resizableElementHeight);
                    console.log("offsetHeight : "+offsetHeight);
                    console.log("resizableElementHeight + (windowHeight - resizableElementHeight) + offsetHeight : "+(resizableElementHeight + (windowHeight - resizableElementHeight) + offsetHeight));

                    resizableElement.height(windowHeight - resizableContainerHeight + resizableElementHeight + offsetHeight);
                }
            });
        }
*/
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
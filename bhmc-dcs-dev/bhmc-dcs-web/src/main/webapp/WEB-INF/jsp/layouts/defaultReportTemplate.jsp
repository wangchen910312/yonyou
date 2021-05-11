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
        <div id="contentBottom"></div>
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
    
    //리포트 iframe 리사이즈
    function resizeReport(){           
        var contentBottom = $("#contentBottom");
        var iframeReportList = $("iframe.report");

        if(iframeReportList.length != 0){
            var windowHeight = $(window).innerHeight(); 
            var offsetTop = contentBottom.offset().top;

            $.each(iframeReportList, function(idx, iframeReport){
           		var that = $(iframeReport)
            	var iframeReportHeight = that.height()||500;
				var iframeOffset = that.data("offset")||0;
            	
            	that.height(windowHeight - offsetTop + iframeReportHeight - 10 + iframeOffset);
            });
        } 
    }    

    $(document).ready(function() {
        resizeReport();
    });
    
    $(window).resize(function(){
    	resizeReport();
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
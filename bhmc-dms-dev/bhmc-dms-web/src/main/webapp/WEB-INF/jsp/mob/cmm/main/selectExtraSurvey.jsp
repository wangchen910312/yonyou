<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <div class="scrollbox" style="overflow:auto;">
        <iframe id="mainList" border="0" src="http://www.sojump.com/jq/9018047.aspx" frameborder="0" width="100%" height="100%"></iframe>
    </div>

<script>

$(document).ready(function() {
    var winHeight = $(window).height();
    $(".scrollbox").height(winHeight - 50);
});

</script>

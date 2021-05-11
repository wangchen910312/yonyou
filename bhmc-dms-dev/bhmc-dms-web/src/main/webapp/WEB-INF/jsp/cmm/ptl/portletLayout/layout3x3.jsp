<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/dms/dms.portlet.js' />"></script>
<script type="text/javascript">
var isDefaultPortletDeploy = ${isDefaultPortletDeploy};
(function($){
    $(document).ready(function() {

        //새로고침, 더보기 기능 숨김
        $("a.btnPortletRefresh a.btnPortletMore").hide();

        <c:forEach var="portlet" items="${portletList}" varStatus="i">
        var target${i.index} = "#portlet_${portlet.rowLocCnt}${portlet.columnLocCnt}";

        var portletInfo${i.index} = {
            portletLayoutId:"${portletLayout.portletLayoutId}"
            ,portletId:"${portlet.portletId}"
            ,portletNm:"${portlet.portletNm}"
            ,portletUrl:"${portlet.portletUrl}"
            ,viewId:"${portlet.viewId}"
            ,reloadYn:"${portlet.reloadYn}"
            ,rowLocCnt:"${portlet.rowLocCnt}"
            ,columnLocCnt:"${portlet.columnLocCnt}"
        };

        $(target${i.index}).data(portletInfo${i.index});
        //setTimeout(function(){
            loadPortlet(portletInfo${i.index}, target${i.index});
        //}, ${i.index}*500);
        </c:forEach>
    });
})(jQuery);
</script>
<div class="portlet_area portlet_area_x3">
    <section class="portlet" id="portlet_11">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_12">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_13">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>
</div>

<div class="portlet_area portlet_area_x3">
    <section class="portlet" id="portlet_21">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_22">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_23">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>
</div>

<div class="portlet_area portlet_area_x3">
    <section class="portlet" id="portlet_31">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_32">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_33">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >새로고침</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >더보기</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >설정</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>
</div>






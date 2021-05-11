<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<title>BHMC-DMS</title>
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.common.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.rtl.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.default.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.dataviz.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.dataviz.default.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/common.css">
<link rel="stylesheet" href="/bhmc-dms-web/resources/themes/blue/theme.css" type="text/css" />


<script type="text/javascript" src="/bhmc-dms-web/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/kendo/kendo.all.min.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/kendo/cultures/kendo.culture.ko.min.js"></script>

<!--[if lt IE 9]>
    <script src="/bhmc-dms-web/resources/js/html5shiv.js"></script>
<![endif]-->



<script type="text/javascript">var _contextPath = "/bhmc-dms-web";</script>

<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/dms.common-1.0.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/cmm/sci/js/selectCultureSettings.do"></script>


<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/kendo.ui.ext-1.0.js"></script>




<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/jquery.ext-1.0.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/jquery.xml2json.js"></script>
<script type="text/javascript">
kendo.culture("ko");
</script>

</head>

<body>

        <!-- content -->
        <section id="content">




<script src="/bhmc-dms-web/resources/js/dms/dms.portlet.js"></script>
<script type="text/javascript">
var isDefaultPortletDeploy = false;
(function($){
    $(document).ready(function() {

        $("a.btnPortletRefresh a.btnPortletMore").hide();
        var target = "#portlet_11";

        var portletInfo = {
            portletLayoutId:"TPL-001"
            ,portletId:"PTL-000-01"
            ,portletNm:"11"
            ,portletUrl:"/samples/selectPortlet1.do"
            ,viewId:""
            ,reloadYn:"Y"
            ,rowLocCnt:"1"
            ,columnLocCnt:"1"
        };

        $(target).data(portletInfo);
        loadPortlet(portletInfo, target);

        var target = "#portlet_12";

        var portletInfo = {
            portletLayoutId:"TPL-001"
            ,portletId:"PTL-000-02"
            ,portletNm:"12"
            ,portletUrl:"/samples/selectPortlet2.do"
            ,viewId:""
            ,reloadYn:"Y"
            ,rowLocCnt:"1"
            ,columnLocCnt:"2"
        };

        $(target).data(portletInfo);
        loadPortlet(portletInfo, target);

        var target = "#portlet_13";

        var portletInfo = {
            portletLayoutId:"TPL-001"
            ,portletId:"PTL-000-06"
            ,portletNm:"<spring:message code='cmm.title.todoListMng' />"
            ,portletUrl:"/samples/selectPortletTodo.do"
            ,viewId:""
            ,reloadYn:"Y"
            ,rowLocCnt:"1"
            ,columnLocCnt:"3"
        };

        $(target).data(portletInfo);
        loadPortlet(portletInfo, target);

        var target = "#portlet_21";

        var portletInfo = {
            portletLayoutId:"TPL-001"
            ,portletId:"PTL-000-04"
            ,portletNm:"21"
            ,portletUrl:"/samples/selectPortlet6.do"
            ,viewId:""
            ,reloadYn:"Y"
            ,rowLocCnt:"2"
            ,columnLocCnt:"1"
        };

        $(target).data(portletInfo);
        loadPortlet(portletInfo, target);



        var target = "#portlet_22";

        var portletInfo = {
            portletLayoutId:"TPL-001"
            ,portletId:"PTL-000-04"
            ,portletNm:"22"
            ,portletUrl:"/samples/selectPortlet5.do"
            ,viewId:""
            ,reloadYn:"Y"
            ,rowLocCnt:"2"
            ,columnLocCnt:"2"
        };

        $(target).data(portletInfo);
        loadPortlet(portletInfo, target);

        var target = "#portlet_23";

        var portletInfo = {
            portletLayoutId:"TPL-001"
            ,portletId:"PTL-000-04"
            ,portletNm:"23"
            ,portletUrl:"/samples/selectPortletChart.do"
            ,viewId:""
            ,reloadYn:"Y"
            ,rowLocCnt:"2"
            ,columnLocCnt:"3"
        };

        $(target).data(portletInfo);
        loadPortlet(portletInfo, target);

    });
})(jQuery);
</script>
<div class="portlet_area">
    <section class="portlet" id="portlet_11" style="width:618px;float:left;">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >xx</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >xx</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >xx</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_12" style="width:618px;float:left;">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >xx</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >xx</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >xx</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_13" style="width:618px;float:left;margin-left:10px;">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >xx</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >xx</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >xx</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>
</div>

<div class="portlet_area">
    <section class="portlet" id="portlet_21" style="width:618px;float:left;">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >xx</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >xx</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >xx</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_22" style="width:618px;float:left;">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >xx</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >xx</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >xx</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

    <section class="portlet" id="portlet_23" style="width:618px;float:left;margin-left:10px;">
        <div class="po_header">
            <h1></h1>
            <div class="btn_right">
                <a href="#" onclick="reloadPortlet(this);" class="po_refresh btnPortletRefresh" >xx</a>
                <a href="#" onclick="openMorePage(this);" class="po_add btnPortletMore" >xx</a>
                <a href="#" onclick="updatePortletDeploy(this);" class="po_setting btnPortletSetting" >xx</a>
            </div>
        </div>
        <div class="po_content"></div>
    </section>

</div>






        </section>

<!--         <div id="ajaxProcessing" class="process" style="display:none;"> -->
<!--             <p>ì²ë¦¬ì¤ìëë¤.</p> -->

<!--         </div> -->

        <footer id="footer" style="display:none;" >
            <div id="globalFooterNotification"></div>




<!--     <ul class="progress_txt"> -->
<!--         <li>è¿è¡ä¸­ <span class="color_g">00</span>ä»¶</li> -->
<!--         <li>ä¿ç <span class="color_r">00</span>ä»¶</li> -->
<!--         <li>å®æ <span class="color_b">00</span>ä»¶</li> -->
<!--     </ul> -->
        </footer>

<!--         <div data-iframe-height></div> -->



<script type="text/javascript">

    window.parent.$("#footer_content").html($("#footer").html());

    $("#footer").bind("DOMSubtreeModified",function(){
        window.parent.$("#footer_content").html($("#footer").html());
    });
    $("#footer").bind("DOMCharacterDataModified",function(){
        window.parent.$("#footer_content").html($("#footer").html());
    });

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
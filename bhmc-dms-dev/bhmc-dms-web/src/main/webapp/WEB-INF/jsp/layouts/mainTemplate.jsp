<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<spring:theme code="css" var="theme" />
<c:set var="springLocaleLanguage" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocaleLanguage}" class="scrollY_hidden">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<title>[${sessionScope.LOGIN_USER.dlrCd}]<tiles:insertAttribute name="title" />
</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value='${theme}' />" type="text/css" />
<dms:isTablet>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">
</dms:isTablet>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/cultures/kendo.culture.${springLocaleLanguage}.min.js"/>"></script>

<!--[if lt IE 9]>
<script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
</script>

<dms:isTablet>
<script type="text/javascript" src="<c:url value='/resources/js/mob/dms.tablet-common-1.0.js' />"></script>
</dms:isTablet>

<dms:isNormal>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
</dms:isNormal>

<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>

<dms:isNormal>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
</dms:isNormal>

<dms:isTablet>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-tablet-1.0.js' />"></script>
</dms:isTablet>

<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/publish.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/scrollbar/jquery.scrollbar.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script>
<%-- <script type="text/javascript" src="<c:url value='/resources/js/iframeResizer.min.js' />"></script> --%>
<script type="text/javascript" src="<c:url value="/resources/js/stomp/stomp.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/dms.nms.client-1.0.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/callCenterDevice.js" />"></script>
<script type="text/javascript">
    kendo.culture("${springLocaleLanguage}");

    var nmsClient;
    SimpleNmsClient.setOptions({
        jmsMesgTp:"W"                               					//메세지유형 웹푸쉬('W'),모바일푸쉬('P')
        ,userId:"<sec:authentication property='principal.username' />"	//사용자ID
        ,jmsUrl:"ws://${jmsIp}:${jmsPort}"          					//웹소켓URL
        ,onMessageCallback:function(message){       					//메세지수신콜백
             dms.notification.info(message.body);
        }
    });
    nmsClient = SimpleNmsClient.client();
    nmsClient.setDebug(false);
    nmsClient.stompConnect();

    //브라우저 탭 active/inactive 감지하여 웹소켓 연결을 제어한다.
    var hidden, visibilityChange;
    if (typeof document.hidden !== "undefined") {
        hidden = "hidden";
        visibilityChange = "visibilitychange";
    } else if (typeof document.mozHidden !== "undefined") {
        hidden = "mozHidden";
        visibilityChange = "mozvisibilitychange";
    } else if (typeof document.msHidden !== "undefined") {
        hidden = "msHidden";
        visibilityChange = "msvisibilitychange";
    } else if (typeof document.webkitHidden !== "undefined") {
        hidden = "webkitHidden";
        visibilityChange = "webkitvisibilitychange";
    }

    function handleVisibilityChange() {
        if (document[hidden]) {
            nmsClient.stompDisConnect();
        } else {
            nmsClient.stompConnect();
        }
    }

    if (typeof document.addEventListener !== "undefined" && typeof hidden !== "undefined") {
        document.addEventListener(visibilityChange, handleVisibilityChange, false);
    }

</script>
</head>

<body>

<!-- wrap -->
<div id="wrap">
    <!-- header -->
    <header id="header">
        <!-- logo -->
        <h1><spring:message code="global.title.dmsTitle" /></h1>
        <!-- //logo -->

        <!-- search -->
        <div class="search_area">
            <input id="tCd" type="text" class="search_input">
            <a href="javascript:_tCodeSearch();" class="btn_totalSearch"><spring:message code="global.lbl.search" /></a>
        </div>
        <!-- //search -->

        <!-- gnb -->
        <div id="sidebar" class="sidebar">

            <!--
            sysCd : 시스템구분 'D':딜러, 'I':법인
            webMobileDstinCd : 웹/모바일구분 'W':웹, 'M':모바일
            -->
            <dms:bulidMenu sysCd="${sysCd}" webMobileDstinCd="${webMobileDstinCd}" />

            <div class="util_menu">
                <ul>
<!--                     <li class="btn_setting" id="open_poSetting"> -->
<!--                         <a href="javascript:;"><span>portlet setting</span></a> -->
<!--                         <div class="portlet_setting" id="portlet_setting"> -->
<!--                             <div class="portlet_box"> -->
<!--                                 <ul class="portlet_list" id="portlet_list"> -->
<%--                                 <c:forEach var="portletLayout" items="${portletLayoutList}"> --%>
<%--                                 <li><a href="javascript:;" id="${portletLayout.portletLayoutId}"><img src="<c:url value="/resources/img/icon/${portletLayout.portletLayoutIconNm}" />" alt=""></a></li> --%>
<%--                                 </c:forEach> --%>
<!--                                 </ul> -->
<!--                                 <a href="javascript:;" class="close_poSetting" id="closePortletSetting"></a> -->
<!--                             </div> -->
<!--                             <div class="bg_portlet"></div> -->
<!--                         </div> -->
<!--                     </li> -->
                    <li class="btn_logout"><a href="<c:url value='/cmm/ath/login/selectLogoutAction.do' />"><span><!-- logout --></span></a></li>
                </ul>
            </div>

        </div>
        <!-- //gnb -->
    </header>
    <!-- //header -->

    <!-- container -->
    <div id="container">
        <!-- tab_nav -->
        <div id="tabMenu" class="tab_nav">

            <!-- 탭메뉴 -->
            <ul>
                <li class="home_tab k-state-active"><spring:message code="global.menu.home" /></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 숨김탭 -->
            <section class="tab_dropdown">
                <a href="javascript:;" id="btn_tabDropdown" class="btn_tabDropdown"></a>
                <div id="tab_dropdownBox" class="tab_dropdownBox">
                    <div class="dropdown_list">
                        <ul class="tab_closeBtn">
                            <li><a href="javascript:;" id="btnCloseTabMenuAll"><spring:message code="global.lbl.closeTabMenuAll" /> <span class="bg_close"></span></a></li>
                            <li><a href="javascript:;" id="btnCloseTabMenuOthers"><spring:message code="global.lbl.closeTabMenuOthers" /> <span class="bg_close"></span></a></li>
                        </ul>
                        <ul class="tab_list" id="hiddenTabMenuList">
                        </ul>
                    </div>
                    <div class="bg_tabDropdown"></div>
                </div>
            </section>
            <!-- //숨김탭 -->

            <!-- 기본탭 영역  -->
            <div class="tabMenuContent">
                <div class="tabmenu_ajax_loader"></div>
            </div>
            <!-- //기본탭 영역 -->

        </div>
        <!-- //tab_nav -->

    </div>

    <!-- footer -->
    <footer id="footer">
        <div id="globalFooterNotification"></div>
        <div id="footer_content" class="footer_left">
            <!-- <ul class="progress_txt">
                <li>进行中<span class="color_g">00</span>件</li>
                <li>保留 <span class="color_r">00</span>件</li>
                <li>完成 <span class="color_b">00</span>件</li>
            </ul> -->
        </div>
        <div class="footer_right">
<!--             <div class="notification_area"> -->
<!--                 <ul class="notification_slider"> -->
<!--                     <li><a href="#"><span class="s_title bg_b">总公司</span> <span class="date">[2016-01-08]</span> <span class="txt"></span></a></li> -->
<!--                     <li><a href="#"><span class="s_title bg_g">报道</span> <span class="date">[2016-01-08]</span> <span class="txt"></span></a></li> -->
<!--                     <li><a href="#"><span class="s_title bg_r">活动</span> <span class="date">[2016-01-08]</span> <span class="txt"></span></a></li> -->
<!--                     <li><a href="#"><span class="s_title">公告</span> <span class="date">[2016-01-08]</span> <span class="txt"></span></a></li> -->
<!--                 </ul> -->
<!--             </div> -->
            <p class="user_name"><a href="javascript:;" id="user_icon" class="user_icon"></a>${sessionScope.LOGIN_USER.usrNm}[${sessionScope.LOGIN_USER.dlrCd}]</p>
        </div>

    </footer>
</div>

<script type="text/javascript">
    var _maxTabCnt = 30;
    var _tabIdx = 1;
    var _tabMenu;
    var _lastSelectedTabMenu;
    var _extraHeight = $("#tabMenu>ul").height() + $("#footer").outerHeight();
    var _favoriteReloadFlag = true;
    var _imgDataUseMobile="";
    function getImgDataUseMobileFunc(base64Data){
        _imgDataUseMobile=base64Data;
    }

    //탭메뉴 추가
    function _createOrReloadTabMenu(title, url, viewId, isReload) {
        if(typeof isReload == 'undefined'){
            isReload = true;
        }

        _addTabMenu(title, url, "", viewId, true, isReload);
    }

    //탭메뉴 추가
    function _addTabMenu(title, url, tCd, viewId, isFromHidden, isReload) {
        var _dupTabMenuFrameId;
        var _depTabMenuId;
        var _dupTabMenuFlag = false;
        viewId = dms.string.defaultString(viewId, "");
        tCd = dms.string.defaultString(tCd, "");

        if(url.indexOf("/ReportServer") != -1){
            url = url + "&fr_locale=${springLocaleLanguage}";
        }

        //탭메뉴 갯수 체크
        _tabMenuList = _tabMenu.tabGroup.children("li");
        if (_tabMenuList.length == _maxTabCnt) {
            //탭의 최대 갯수는 30개  입니다.
            dms.notification.info("<spring:message code='global.info.maxtab' arguments='"+ _maxTabCnt +"' />");
            return;
        }

        //탭메뉴 오픈 체크
        if(dms.string.isNotEmpty(viewId)){
            //탭메뉴 중복 체크
            _tabMenuList.each(function(idx, obj){
                if($(this).data("viewId") === viewId){
                    _tabMenu.select(this);
                    _dupTabMenuFrameId = $(this).data("id");
                    _dupTabMenuId = $(this).data("tabMenuId");
                    _dupTabMenuFlag = true;
                    return false;
                }
            });

            if(_dupTabMenuFlag){
                if(isReload){
                    $("div.tabmenu_ajax_loader", $("#"+_dupTabMenuId)).show();
                    $("#"+_dupTabMenuFrameId).remove();

                    var _tabMenuFrame = $("<iframe name=\"" + _dupTabMenuFrameId + "\" id=\"" + _dupTabMenuFrameId + "\" frameborder=\"0\" scrolling=\"auto\" src=\"" + url + "\" style=\"width:100%;height:100%;\" />");

                    _tabMenuFrame.appendTo($("#"+_dupTabMenuId));
                    _tabMenuFrameLoad(_tabMenuFrame);

                //숨김탭을 오픈하는 경우가 아닌 경우
                }else if(!isFromHidden){
                    hideShowScheduler();// for iPad khskhs
                    dms.notification.info("<spring:message code='global.info.areadyOpenedTabMenu' />");
                }
                return;
            }

            //숨김탭 메뉴 체크
            $("#hiddenTabMenuList").children("li").each(function(idx, obj){
                data = $(this).data();

                if(data.viewId === viewId){
                    $(this).remove();
                    _addTabMenu(data.title, data.url, data.tCd, data.viewId);
                    _dupTabMenuFlag = true;
                    isFromHidden = true;
                    return false;
                }
            });

            if(_dupTabMenuFlag){
                //숨김탭을 오픈하는 경우가 아닌 경우
                if(!isFromHidden){
                    dms.notification.info("<spring:message code='global.info.areadyOpenedTabMenu' />");
                }
                return;
            }
        }

        _tabMenu.append({
            text:title,
            encoded:false,
            content:"<div class=\"tabmenu_ajax_loader\"></div>"
        });

        var _tabMenuId = _tabMenu.contentElements[_tabMenu.contentElements.length-1].id;
        var _tabMenuFrameId = "tabMenuFrame" + (++_tabIdx);
        var _tabMenuFrame = $("<iframe name=\"" + _tabMenuFrameId + "\" id=\"" + _tabMenuFrameId + "\" frameborder=\"0\" scrolling=\"auto\" src=\"" + url + "\" style=\"width:100%;height:100%;\" />");

        var _tabMenuFrameContainer = $("#tabMenu div.k-content:last");
        _tabMenuFrameContainer.addClass("tabMenuContent");
        _tabMenuFrameContainer.height($(window).innerHeight() - _extraHeight);
        _tabMenuFrame.appendTo(_tabMenuFrameContainer);
        _tabMenuFrameLoad(_tabMenuFrame);

        _tabMenu.tabGroup.children("li.k-last").data({
            "id":_tabMenuFrameId
            ,"tabMenuId":_tabMenuId
            ,"title":title
            ,"url":url
            ,"width":_tabMenu.tabGroup.children("li.k-last").outerWidth()
            ,"isHome":false
            ,"viewId":viewId
            ,"tCd":tCd
        });

        if(tCd){
            _tabMenu.tabGroup.children("li.k-last").attr("title", tCd);
        }
        _tabMenu.tabGroup.children("li.k-last").append("<button class=\"tab_close\">close</button>");

        //탭메뉴 히든 처리
        var tabGroupWidth = _tabMenu.tabGroup.width() - _tabMenu.tabGroup.children("li.k-last").outerWidth();
        _tabMenu.tabGroup.children("li").each(function(){
            var that = $(this);
            if(!that.hasClass("k-last")){
                tabGroupWidth = tabGroupWidth - that.outerWidth();

                if(tabGroupWidth < 0){
                    var hiddenTabMenu = $("<li/>");
                    hiddenTabMenu.data(that.data());
                    var hiddenTabMenuLink = $("<a href=\"javascript:;\">" + that.data().title + "</a>")
                                            .bind("click", function(){
                                                var data = $(this).closest("li").data();
                                                hiddenTabMenu.remove();
                                                _addTabMenu(data.title, data.url, data.tCd, data.viewId, true);
                                            });

                    var hiddenTabMenuCloseButton = $("<button type=\"button\" class=\"btn_tabClose\">close</button>")
                                                    .bind("click", function(){
                                                        hiddenTabMenu.remove();
                                                     });

                    hiddenTabMenu.append(hiddenTabMenuLink);
                    hiddenTabMenu.append(hiddenTabMenuCloseButton);

                    $("#hiddenTabMenuList").append(hiddenTabMenu);

                    _tabMenu.remove($(this));
                }
            }

        });

        _tabMenu.select("li.k-last");
        hideShowScheduler();// for iPad khskhs

    }

    //탭메뉴 삭제
    function _removeTabMenu(e) {
        var _selectedTab = _tabMenu.select();
        var _tab = $(e.target).closest("li");
        var _otherTab;

        if (_selectedTab.length > 0) {
            _otherTab = _tab.next();
            _otherTab = _otherTab.length ? _otherTab:_tab.prev();
        } else {
            _otherTab = _lastSelectedTabMenu;
        }

        _tabMenu.remove(_tab);
        _tabMenu.select(_otherTab);
        hideShowScheduler();// for iPad khskhs
    }

    //탭메뉴 IFrame 로드 이벤트
    function _tabMenuFrameLoad(_tabMenuFrame){
        _tabMenuFrame.load(function() {
            $($(this).closest("div")).children("div").hide();

            //메뉴 슬라이더 닫기
            $(this.contentWindow.document).click(function(e){
                $("#btn_closeGnb").click();
            });

            $(this.contentWindow.document).keydown(function(e){
                var backspace = 8;
                var t = e.currentTarget.activeElement;

                if (e.keyCode == 8) {
                    var tagName = t.tagName;
                    var readOnly = false;

                    if(t.getAttribute("readonly") != null && t.getAttribute("readonly") != "false") {
                        readOnly = true;
                    }

                    if (tagName == "SELECT") {
                        return false;
                    }

                    if (tagName == "INPUT" && readOnly ) {
                        return false;
                    }
                }
            });

            //메뉴 슬라이더 닫기
            $("#btn_closeGnb").click();
        });
    }

    //T코드 검색
    function _tCodeSearch(){
        var params = {};
        params["tCd"] = $('#tCd').val();

        if (!dms.string.isEmpty(params.tCd)) {
            $.ajax({
                url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoByTcd.do' />"
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(viewData) {
                if(viewData != null && !dms.string.isEmpty(viewData.viewUrl)){
                    _addTabMenu(viewData.viewNm, _contextPath + viewData.viewUrl, viewData.tCd, viewData.viewId);
                }
            });
        }
    }

    //portlet_setting close
    function closePortletSetting(){
        $("#open_poSetting>a").removeClass("active").focus();
        $("#portlet_setting").hide();
    }

    //숨김탭 닫기
    function closeHiddenTabMenu(){
        $("#btn_tabDropdown").removeClass("active");
        $("#tab_dropdownBox").hide();
    }

    function hideShowScheduler(){// for iPad khskhs
        var _tabs=_tabMenu.tabGroup.children("li");
        for(var i=0; i<_tabs.length; i++){
           var _iframeParentDivId_ios = $(_tabs[i]).attr("aria-controls");
           var _iframeId_ios = $("#" + _iframeParentDivId_ios + " iframe").attr("id");
           if(!$(_tabs[i]).hasClass("k-state-active")){
               $("#" + _iframeId_ios).contents().find("body").hide();
           }else{
               $("#" + _iframeId_ios).contents().find("body").show();
           }

        }
    }
    //增加经销商欠款提醒 贾明 2019-2-27 start
  showDistributorIsArrears = function(){
       $.ajax({
         url:"<c:url value='/cmm/ptl/portletLayout/selectDistributorArrearsInfo.do' />"
        ,data:JSON.stringify()
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }		
        ,success:function(result, textStatus){
            console.log("我的值",result.data[0]);
            //console.log("我的值",result.datearrearsYn);
            var contrantDt = kendo.toString(result.data[0].contrantDt, 'yyyy-MM-dd').substring(0,11);//合同日期
            var  arrearsYn = result.data[0].arrearsYn;//是否已欠款（Y：是 N：否）
            if ('Y' == arrearsYn ) {
               
                horseRaceLamp ("<spring:message code='global.info.distributorReminderArrears' arguments='"+ contrantDt +"' />");
             }
               
            /**
               var  opermServSt = kendo.toString(result.data[0].opermServSt, 'yyyy-MM-dd').substring(0,11);//运维服务周期 开始时间
               var  opermServEn = kendo.toString(result.data[0].opermServEn, 'yyyy-MM-dd').substring(0,11);//运维服务周期 结束时间
               console.log('opermServEn-->',opermServEn);
               var  opermServUpdt = kendo.toString(result.data[0].opermServUpdt, 'yyyy-MM-dd').substring(0,11);//运维服务周期 更新时间
               var  arrearsYn = result.data[0].arrearsYn;//是否已欠款（Y：是 N：否）
               var  nowDate = kendo.parseDate(new Date(), "yyyy-MM-dd");//系统当前时间
               var calDay = calculatedDifDays(kendo.parseDate(opermServEn, "yyyy-MM-dd"));//运维服务周期 结束时间 减去系统当前时间
               console.log("相差天数",calDay);
               var xcDay = calDay - 30;
               console.log("天数",xcDay);
               if('Y' == arrearsYn && 0 <= calDay && xcDay <=0){
                   if(0 == calDay){
                     calDay = 1;
                   }
                   horseRaceLamp ("<spring:message code='global.info.distributorReminderUnpaid' arguments='"+ opermServSt +","+ opermServEn +","+ opermServUpdt +","+ calDay +"' />")
                   dms.notification.warning("<spring:message code='global.info.distributorReminderUnpaid' arguments='"+ opermServSt +","+ opermServEn +","+ opermServUpdt +","+ calDay +"' />");
               } else if ('Y' == arrearsYn && 0 > calDay) {
                       calDay = Math.abs(calDay);
                       horseRaceLamp ("<spring:message code='global.info.distributorReminderArrears' arguments='"+ opermServEn +"' />");
                      // horseRaceLamp ("<spring:message code='global.info.distributorReminderArrears' arguments='"+ opermServSt +","+ opermServEn +","+ opermServUpdt +","+ calDay +"' />");
                     //dms.notification.warning("<spring:message code='global.info.distributorReminderArrears' arguments='"+ opermServSt +","+ opermServEn +","+ opermServUpdt +","+ calDay +"' />");
               }
              **/
               //dms.notification.warning("<spring:message code='global.info.distributorReminderUnpaid' arguments='"+ opermS +","+ opermE +","+ opermU +","+ countDay +"' />");
              //dms.notification.info("<spring:message code='global.info.maxtab' arguments='"+ _maxTabCnt +"' />");
              //dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
            
         }
      });
       
   };
    //计算相关天数 贾明 2018-12-3
    calculatedDifDays = function (endDate){
        var nowDate = kendo.toString(new Date(), "yyyy-MM-dd").substring(0,11);//当前系统时间
        var fen = ((endDate.getTime() - kendo.parseDate(nowDate, "yyyy-MM-dd").getTime())/1000)/60; 
        console.log("fe-->",fen);
        var distance = parseInt(fen/(24*60)); //相隔distance天
        console.log("distance-->",distance);
        return distance;
    }
    //跑马灯
   var horseRaceLamp = function (text)
    {
    // eleId 自己定义的变量名，任意取
    // document.createElement ('marquee'); 勿改变
        var eleId = document.createElement('marquee');
        eleId.style.position = 'absolute';
        eleId.setAttribute("onMouseOver","this.stop()");
        eleId.setAttribute("onMouseOut","this.start()");
        eleId.style.left = 100 + 'px';
        //  window.screen.height -180  window.screen.height * 0.8
        console.log("top的值",window.screen.height * 0.8);
        //eleId.style.top =  window.screen.height * 0.8 + 'px';
        eleId.style.bottom = 40 + 'px';
        //eleId.backgroundColor ="#DC143C";
        eleId.style.color="#DC143C";
        //eleId.style.height = 300 + 'px';
        //eleId.style.width = 200 + 'px';
        //eleId.style.fontSize = 15 + 'px';
        //eleId.onMouseOver= 'this.stop()';
        //eleId.onMouseOut= 'this.start()' ;
        //eleId.style.blockSize = 100px;
        console.log("e-->",eleId.style);
        console.log("人",eleId);
        eleId.innerText = text;
        document.body.appendChild (eleId);
    }
     
    window.onload = function ()
    {
         //var abc = "下周一三五停电，下周二四六停水。请各位业主相互转告";
         showDistributorIsArrears();
        //test1 (300, 300, abc);
       
    }
   
   
    //增加经销商欠款提醒 贾明 2019-2-27 end
    $(document).ready(function() {
        //하단 알림메세지 슬라이더
//         $("ul.notification_slider").bxSlider({
//             mode:'vertical',
//             auto:true,
//             pause:5000,
//             pager:false
//         });
               //增加经销商欠款提醒 贾明 2019-2-27 start
                  //showDistributorIsArrears();
              //增加经销商欠款提醒 贾明 2019-2-27 end
        $(window).resize(function(){
            var resizeHeight = $(this).innerHeight() - _extraHeight;
            $("#tabMenu div.tabMenuContent").each(function(){
                $(this).height(resizeHeight);
            });

            var tabGroupWidth = _tabMenu.tabGroup.width();
            var tabWidthTotal = 0;

            _tabMenu.tabGroup.children("li").each(function(){
                var that = $(this);
                tabWidthTotal = that.outerWidth();
            });

        });


        _tabMenu = $("#tabMenu").kendoTabStrip({
            select:function(e) {
                _lastSelectedTabMenu = this.select();
            },
            animation:false
        }).data("kendoTabStrip");


        //탭메뉴 클릭 이벤트 바인딩
        $("#tabMenu ul").on("click", "li", function(e) {

            hideShowScheduler();// for iPad khskhs

            //탭메뉴 클릭시 footer 체인지
            var _iframeParentDivId = $(this).attr("aria-controls");
            var _iframeId = $("#" + _iframeParentDivId + " iframe").attr("id");
            var _iframeUrl = $("#" + _iframeParentDivId + " iframe").attr("src");

            $("#footer_content").html($("#" + _iframeId).contents().find("#footer").html());
        });

        //탭메뉴 삭제 이벤트 바인딩
        $("#tabMenu").on("click", ".tab_close", function(e) {
            _removeTabMenu(e);
        });

        //홈화면 탭메뉴 설정
        var _tabMenuFrame = $("<iframe name=\"tabMenuFrame1\" id=\"tabMenuFrame1\" frameborder=\"0\" scrolling=\"auto\"  src=\"<c:url value='/selectMain.do' />\" style=\"width:100%;height:100%;\" />");

        var _tabMenuFrameContainer = $("#tabMenu div.tabMenuContent:first");
        _tabMenuFrameContainer.height($(window).innerHeight() - _extraHeight);
        _tabMenuFrame.appendTo(_tabMenuFrameContainer);
        _tabMenuFrameLoad(_tabMenuFrame);

        _tabMenu.tabGroup.children("li.k-last").data({
            "id":"tabMenuFrame1"
            ,"title":"home"
            ,"url":"<c:url value='/selectMain.do' />"
            ,"width":_tabMenu.tabGroup.children("li.k-last").outerWidth()
            ,"isHome":true
            ,"viewId":""
            ,"tCd":""
        });

        $("#tCd").on("keyup", function(e){
            if(e.keyCode == 13){
                _tCodeSearch();
            }
        });

        //포틀릿 레이아웃 변경
        $("#open_poSetting>a").click(function(){
            if($("#portlet_setting").is(":hidden")){
                $(this).addClass("active");
                $("#portlet_setting").show();
            }else{
                closePortletSetting();
            }
        });
        $("#closePortletSetting").click(function(){
            closePortletSetting();
        });
        $("#portlet_list li a").on({
            "mouseenter focus":function(){
                $("#portlet_list li img").each(function(){
                    $(this).attr("src",$(this).attr("src").replace("_hover.png",".png"));
                });
                $(this).addClass("focus");
                $(this).find("img").attr("src",$(this).find("img").attr("src").replace(".png","_hover.png"));
            },
            "mouseleave blur":function(){
                $(this).removeClass("focus");
                $(this).find("img").attr("src",$(this).find("img").attr("src").replace("_hover.png",".png"));
            }
        });

        $("#portlet_list li").on("click", "a", function() {
            if(!$(this).hasClass("selected")){
                $.ajax({
                    url:"<c:url value='/cmm/ptl/portletLayout/updateUserPortletLayout.do' />",
                    data:JSON.stringify({"portletLayoutId":this.id})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType :'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                }).done(function(result) {
                    closePortletSetting();
                    $("#tabMenuFrame1").attr("src", $("#tabMenuFrame1").attr("src"));
                });

            }
        });

        /**
        * 숨김탭 레이어 토클
        */
        $("#btn_tabDropdown").click(function(){
            if($("#tab_dropdownBox").is(":hidden")){
                $(this).addClass("active");
                $("#tab_dropdownBox").show();
            }else{
                closeHiddenTabMenu();
            }
        });

        /**
        * 열린탭 모두 닫기
        * 홈탭을 제외한 열린탭을 모두 닫고 홈탭으로 이동한다.
        */
        $("#btnCloseTabMenuAll").click(function(){
            _tabMenu.tabGroup.children("li").each(function(){
                if(!$(this).data().isHome){
                    _tabMenu.remove($(this));
                }
            });

            _tabMenu.select("li.k-first");

            $("#hiddenTabMenuList li").remove();
            closeHiddenTabMenu();
        });

        /**
         * 다른탭 모두 닫기
         * 홈탭과 현재 열려진 탭을 제외하고 모든탭을 닫는다.
         */
         $("#btnCloseTabMenuOthers").click(function(){
             _tabMenu.tabGroup.children("li").each(function(){
                 if(!$(this).data().isHome && _tabMenu.select().data().id != $(this).data().id){
                     _tabMenu.remove($(this));
                 }
             });

             $("#hiddenTabMenuList li").remove();

             closeHiddenTabMenu();
         });

         <c:if test="${defaultOpenViewInfo != null}">
         //초기에 오픈할 탭메뉴 정보가 있다면 탭메뉴를 오픈한다.
         _addTabMenu("${defaultOpenViewInfo.viewNm}", '<c:url value="${defaultOpenViewInfo.viewUrl}" />', "${defaultOpenViewInfo.viewUrl}", "${defaultOpenViewInfo.viewId}");
         </c:if>


        /**
        * 숨김탭 목록에서 삭제한다.
        */
//         $(".btn_tabClose").click(function(){
//             $(this).closest("li").remove();
//         })

        /**
        * 숨김탭을 활성화한다.
        * 숨김탭을 활성화 하고 숨김탭 목록에서 제거한다.
        */
//         $(".hiddenTabMenuItem").click(function(){
//         });

      // tablet  khskhs 문제시 삭제
         /* if(${isTablet}){
             $("#favoriteMenu").hide();
             $(".nav_sal").hide();
             $(".nav_par").hide();
             $(".nav_crm").hide();
             $(".nav_cmm").hide();
             $(".nav_mis").hide();
         } */
      // tablet khskhs 문제시 삭제
    });
</script>

</body>
</html>
<span class="allmenu"></span>
<nav id="nav">
    <div class="navarea">
        <!-- 개인정보 -->
        <div class="userinfo" id="userInfoArea">
            <p class="user">${userNm}(${dlrNm})<!-- 관리자(연구원) --></p>
            <div class="ubtnarea">
                <span class="home" onclick="javascript:goMain();"><spring:message code='global.menu.home' /><!-- 홈 --></span>
                <span class="setting" onclick="javascript:goConfigure();"><spring:message code='global.menu.config' /><!-- 설정 --></span>
                <span class="logtout" onclick="javascript:goLogout();"><spring:message code='global.menu.logout' /><!-- 로그아웃 --></span>
            </div>
        </div>
        <div id="mwrap"><dms:bulidMenu sysCd="D" webMobileDstinCd="M" /></div>
        <span class="closeallmenu"><spring:message code='global.btn.closeAllMenu' /><!-- 주요메뉴 닫기 --></span>
    </div>
</nav>
<h1 id="header_title"><spring:message code='global.title.dmsTitle' /><!-- 北京现代 DMS --></h1>
<span class="alarm" onclick="javascript:goMain();"><span class="home_bt"></span></span>
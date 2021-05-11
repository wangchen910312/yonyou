<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- mwrap -->
<div id="mwrap">
    <!-- 메뉴 영역 -->

    <dms:bulidMenu sysCd="D" webMobileDstinCd="M" />

    <%--
    <ul id="gnb">
        <li class="nav_favorites active"><span id="favorite"><spring:message code='global.menu.favorite' /><!-- 자주쓰는 메뉴 --></span>
            <ul id="fav_cont">
            </ul>
        </li>
        <li class="nav_allmenu active"><span><spring:message code='global.menu.allMenu' /><!-- 전체 메뉴 --></span>
            <ul>
            <c:if test="${lstSal != null }"><!-- 판매 -->
                            <c:set var="lstMenu2" value="${lstSal[0].children }" />
                                <li><span><spring:message code="sal.menu.salMain" /></span>
                                    <ul class="depth2_area scrollbar-outer">
                                    <c:forEach var="menuItem" items="${lstMenu2 }">
                                    <li>
                                        <span <c:if test="${menuItem.data.childViewUrl!='' && menuItem.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem.data.childViewUrl }' />" data-title="${menuItem.data.childViewNm }"</c:if> href="javascript:;">${menuItem.data.childViewNm}</span>
                                        <ul>
                                            <c:set var="lstMenu3" value="${menuItem.children }" />
                                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                                <c:set var="lstMenu4" value="${menuItem2.children }" />
                                                <li <c:if test="${lstMenu4[0] != null && lstMenu4[0] != '' }">class="has_4depth"</c:if>  >
                                                    <span class="menu"  <c:if test="${menuItem2.data.childViewUrl!='' && menuItem2.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" </c:if> href="javascript:;">${menuItem2.data.childViewNm}</span> <span id="menuFavIcon${menuItem2.data.childViewId}" onclick="toggleFavorite(this, '${menuItem2.data.childViewId}', '${menuItem2.data.childViewNm}', '${menuItem2.data.childViewUrl}')" class="btn_favorites"></span>
                                                </li>


                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                                </ul>
                            </li>
                        </c:if>

                        <c:if test="${lstSer != null }"><!-- 정비 -->
                            <c:set var="lstMenu2" value="${lstSer[0].children }" />
                            <li><span><spring:message code="ser.menu.serMain" /></span>
                                <ul class="depth2_area scrollbar-outer">
                                    <c:forEach var="menuItem" items="${lstMenu2 }">
                                    <li>
                                        <span <c:if test="${menuItem.data.childViewUrl!='' && menuItem.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem.data.childViewUrl }' />" data-title="${menuItem.data.childViewNm }"</c:if> href="javascript:;">${menuItem.data.childViewNm}</span>
                                        <ul>
                                            <c:set var="lstMenu3" value="${menuItem.children }" />
                                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                                <c:set var="lstMenu4" value="${menuItem2.children }" />
                                                <li <c:if test="${lstMenu4[0] != null && lstMenu4[0] != '' }">class="has_4depth"</c:if>  >
                                                    <span class="menu"  <c:if test="${menuItem2.data.childViewUrl!='' && menuItem2.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" </c:if> href="javascript:;">${menuItem2.data.childViewNm}</span> <span id="menuFavIcon${menuItem2.data.childViewId}" onclick="toggleFavorite(this, '${menuItem2.data.childViewId}', '${menuItem2.data.childViewNm}', '${menuItem2.data.childViewUrl}')" class="btn_favorites"></span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                                </ul>
                            </li>
                        </c:if>

                        <c:if test="${lstPar != null }"><!-- 부품 -->
                            <c:set var="lstMenu2" value="${lstPar[0].children }" />
                            <li><span><spring:message code="par.menu.parMain" /></span>
                                <ul class="depth2_area scrollbar-outer">
                                    <c:forEach var="menuItem" items="${lstMenu2 }">
                                        <li>
                                            <span <c:if test="${menuItem.data.childViewUrl!='' && menuItem.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem.data.childViewUrl }' />" data-title="${menuItem.data.childViewNm }"</c:if> href="javascript:;">${menuItem.data.childViewNm}</span>
                                            <ul>
                                                <c:set var="lstMenu3" value="${menuItem.children }" />
                                                <c:forEach var="menuItem2" items="${lstMenu3 }">
                                                    <c:set var="lstMenu4" value="${menuItem2.children }" />
                                                    <li <c:if test="${lstMenu4[0] != null && lstMenu4[0] != '' }">class="has_4depth"</c:if>  >
                                                        <span class="menu"  <c:if test="${menuItem2.data.childViewUrl!='' && menuItem2.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" </c:if> href="javascript:;">${menuItem2.data.childViewNm}</span> <span id="menuFavIcon${menuItem2.data.childViewId}" onclick="toggleFavorite(this, '${menuItem2.data.childViewId}', '${menuItem2.data.childViewNm}', '${menuItem2.data.childViewUrl}')" class="btn_favorites"></span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>

                        <c:if test="${lstCrm != null }"><!-- CRM -->
                            <c:set var="lstMenu2" value="${lstCrm[0].children }" />
                            <li><span><spring:message code="crm.menu.crmMain" /></span>
                                <ul class="depth2_area scrollbar-outer">
                                    <c:forEach var="menuItem" items="${lstMenu2 }">
                                        <li>
                                            <span <c:if test="${menuItem.data.childViewUrl!='' && menuItem.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem.data.childViewUrl }' />" data-title="${menuItem.data.childViewNm }"</c:if> href="javascript:;">${menuItem.data.childViewNm}</span>
                                            <ul>
                                                <c:set var="lstMenu3" value="${menuItem.children }" />
                                                <c:forEach var="menuItem2" items="${lstMenu3 }">
                                                    <c:set var="lstMenu4" value="${menuItem2.children }" />
                                                    <li <c:if test="${lstMenu4[0] != null && lstMenu4[0] != '' }">class="has_4depth"</c:if>  >
                                                        <span class="menu"  <c:if test="${menuItem2.data.childViewUrl!='' && menuItem2.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" </c:if> href="javascript:;">${menuItem2.data.childViewNm}</span> <span id="menuFavIcon${menuItem2.data.childViewId}" onclick="toggleFavorite(this, '${menuItem2.data.childViewId}', '${menuItem2.data.childViewNm}', '${menuItem2.data.childViewUrl}')" class="btn_favorites"></span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>

                        <c:if test="${lstCom != null }"><!-- 공통 -->
                            <c:set var="lstMenu2" value="${lstCom[0].children }" />
                            <li><span><spring:message code="mis.menu.misMain" /></span>
                                <ul class="depth2_area scrollbar-outer">
                                    <c:forEach var="menuItem" items="${lstMenu2 }">
                                        <li>
                                            <span <c:if test="${menuItem.data.childViewUrl!='' && menuItem.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem.data.childViewUrl }' />" data-title="${menuItem.data.childViewNm }"</c:if> href="javascript:;">${menuItem.data.childViewNm}</span>
                                            <ul>
                                                <c:set var="lstMenu3" value="${menuItem.children }" />
                                                <c:forEach var="menuItem2" items="${lstMenu3 }">
                                                    <c:set var="lstMenu4" value="${menuItem2.children }" />
                                                    <li <c:if test="${lstMenu4[0] != null && lstMenu4[0] != '' }">class="has_4depth"</c:if>  >
                                                        <span class="menu"  <c:if test="${menuItem2.data.childViewUrl!='' && menuItem2.data.childViewUrl!=null}"> class="menuItem" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" </c:if> href="javascript:;">${menuItem2.data.childViewNm}</span> <span id="menuFavIcon${menuItem2.data.childViewId}" onclick="toggleFavorite(this, '${menuItem2.data.childViewId}', '${menuItem2.data.childViewNm}', '${menuItem2.data.childViewUrl}')" class="btn_favorites"></span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
            </ul>
        </li>
    </ul>
    <!-- // 메뉴 영역 -->
    --%>
</div>


<!-- script -->
<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var _favoriteReloadFlag = true;

<%--
//즐겨찾기 초기화
function initFavorite(){
  $.ajax({
      url:"<c:url value='/mob/cmm/common/selectFavorites.do' />"
      ,data:"webMobileDstinCd=M" //웹:W, 모바일:M
      ,type:'POST'
      ,dataType:'json'
      ,error:function(jqXHR,status,error){
          dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
      }
  }).done(function(favoriteList) {
    htmlText="";
    for(var i=0; i<favoriteList.length; i++) {
        htmlText = htmlText + "<li id=\"favList"+favoriteList[i].viewId+"\"><span class=\"menu\" data-url=\"" + _contextPath + favoriteList[i].viewUrl  +"\" data-title=\"" + favoriteList[i].viewNm + "\" href=\"javascript:;\" onclick=\"favClick(this);\" >"+favoriteList[i].viewNm+"</span> <span onclick=\"removeFavorite(this, '"+favoriteList[i].viewId+"')\" class=\"btn_favorites active\" ></span></li>";
        $('#menuFavIcon'+favoriteList[i].viewId).addClass("active");
    }

    $('#fav_cont').html(htmlText);
    _favoriteReloadFlag = false;
  });
}


//즐겨찾기 추가/삭제 토글
function toggleFavorite(element, viewId, viewNm, viewUrl){
    var actionUrl;
    //즐겨찾기 삭제
    if($(element).hasClass("active")){
        removeFavorite(element, viewId);
    //즐겨찾기 추가
    }else{
        addFavorite(element, viewId, viewNm, viewUrl);
    }
}


///mob/cmm/common
//즐겨찾기 추가
function addFavorite(element, viewId, viewNm, viewUrl){
    $.ajax({
        url:"<c:url value='/mob/cmm/common/insertFavorite.do' />"
        ,data:"viewId="+viewId
        ,type:'POST'
        ,dataType:'json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
    }).done(function(viewData) {
        //메뉴 즐겨찾기 아이콘 활성화
        $(element).addClass("active");

        //즐겨찾기 목록에 추가
        htmlText="<li id=\"favList"+viewId+"\"><span class=\"menu\" data-url=\"" + _contextPath + viewUrl  +"\" data-title=\"" + viewNm+ "\" href=\"javascript:;\" onclick=\"favClick(this);\" >"+viewNm+"</span> <span onclick=\"removeFavorite(this, '"+viewId+"')\" class=\"btn_favorites active\" ></span></li>";
        $('#fav_cont').html($('#fav_cont').html() + htmlText);
    });
}

//즐겨찾기 삭제
function removeFavorite(element, viewId){
    $.ajax({
        url:"<c:url value='/mob/cmm/common/deleteFavorite.do' />"
        ,data:"viewId="+viewId
        ,type:'POST'
        ,dataType:'json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
    }).done(function(viewData) {
        //메뉴 즐겨찾기 아이콘 비활성화
        $("#menuFavIcon"+viewId).removeClass("active");

        //즐겨찾기 목록에서 삭제
        $("#favList"+viewId).remove();
    });
}
--%>


function favClick(e){
    var strViewUrl = $(e).attr("data-url");
    parent.window.open(strViewUrl, "_self");
}

$(document).ready(function() {

    $('#fav_cont').on("click", ".btn_favorites", function(e) {
        parent.dms.loading.show();
        var strViewId= $(this).data("viewid");
        $('#menuFavIcon'+ strViewId).click();
    });

     $(".menu").click(function(e){
        parent.dms.loading.show();
        var strViewUrl = $(this).attr("data-url");
        parent.window.open(strViewUrl, "_self");
    });
     //initFavorite();
});


</script>

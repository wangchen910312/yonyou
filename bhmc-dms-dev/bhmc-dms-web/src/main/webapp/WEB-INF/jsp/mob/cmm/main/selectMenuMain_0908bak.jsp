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
    <ul id="gnb">
        <li class="nav_favorites active"><span id="favorite"><spring:message code='global.menu.favorite' /><!-- 자주쓰는 메뉴 --></span>
            <ul id="fav_cont">
                <!-- <li class="favorites_none">자주 쓰는 메뉴를 등록하시면<br>더 편리하게 이용하실 수 있습니다.</li> -->
            </ul>
        </li>
        <li class="nav_allmenu active"><span><spring:message code='global.menu.allMenu' /><!-- 전체 메뉴 --></span>
            <ul>
            <c:if test="${lstSal != null }"><!-- 판매 -->
                <c:set var="lstMenu2" value="${lstSal[0].children }" />
                <li><span><spring:message code="sal.menu.salMain" /></span>
                    <ul>
                    <c:forEach var="menuItem" items="${lstMenu2 }">
                        <li><span>${menuItem.data.childViewNm}</span>
                            <ul>
                            <c:set var="lstMenu3" value="${menuItem.children }" />
                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                <li><span class="menu" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" >${menuItem2.data.childViewNm}</span> <span id="M${menuItem2.data.childViewId}" data-viewid="${menuItem2.data.childViewId}" data-viewnm="${menuItem2.data.childViewNm}"  data-viewurl="<c:url value='${menuItem2.data.childViewUrl }' />"   class="btn_favorites"  ></span></li>
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
                    <ul>
                    <c:forEach var="menuItem" items="${lstMenu2 }">
                        <li><span>${menuItem.data.childViewNm}</span>
                            <ul>
                            <c:set var="lstMenu3" value="${menuItem.children }" />
                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                <li><span class="menu" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" >${menuItem2.data.childViewNm}</span> <span id="M${menuItem2.data.childViewId}" data-viewid="${menuItem2.data.childViewId}" data-viewnm="${menuItem2.data.childViewNm}"  data-viewurl="<c:url value='${menuItem2.data.childViewUrl }' />"   class="btn_favorites"  ></span></li>
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
                    <ul>
                    <c:forEach var="menuItem" items="${lstMenu2 }">
                        <li><span>${menuItem.data.childViewNm}</span>
                            <ul>
                            <c:set var="lstMenu3" value="${menuItem.children }" />
                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                <li><span class="menu" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" >${menuItem2.data.childViewNm}</span> <span id="M${menuItem2.data.childViewId}" data-viewid="${menuItem2.data.childViewId}" data-viewnm="${menuItem2.data.childViewNm}"  data-viewurl="<c:url value='${menuItem2.data.childViewUrl }' />"   class="btn_favorites"  ></span></li>
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
                    <ul>
                    <c:forEach var="menuItem" items="${lstMenu2 }">
                        <li><span>${menuItem.data.childViewNm}</span>
                            <ul>
                            <c:set var="lstMenu3" value="${menuItem.children }" />
                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                <li><span class="menu" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" >${menuItem2.data.childViewNm}</span> <span id="M${menuItem2.data.childViewId}" data-viewid="${menuItem2.data.childViewId}" data-viewnm="${menuItem2.data.childViewNm}"  data-viewurl="<c:url value='${menuItem2.data.childViewUrl }' />"   class="btn_favorites"  ></span></li>
                            </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${lstCom != null }"><!-- COM -->
                <c:set var="lstMenu2" value="${lstCom[0].children }" />
                <li><span><spring:message code="mis.menu.misMain" /></span>
                    <ul>
                    <c:forEach var="menuItem" items="${lstMenu2 }">
                        <li><span>${menuItem.data.childViewNm}</span>
                            <ul>
                            <c:set var="lstMenu3" value="${menuItem.children }" />
                            <c:forEach var="menuItem2" items="${lstMenu3 }">
                                <li><span class="menu" data-url="<c:url value='${menuItem2.data.childViewUrl }' />" data-title="${menuItem2.data.childViewNm }" >${menuItem2.data.childViewNm}</span> <span id="M${menuItem2.data.childViewId}" data-viewid="${menuItem2.data.childViewId}" data-viewnm="${menuItem2.data.childViewNm}"  data-viewurl="<c:url value='${menuItem2.data.childViewUrl }' />"   class="btn_favorites"  ></span></li>
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

$(document).ready(function() {

    $('#fav_cont').on("click", ".btn_favorites", function(e) {
        var strViewId= $(this).data("viewid")

        $('#M'+ strViewId).click();
    });

    $("#favorite").click();

});


$(".menu").click(function(e){
    var strViewUrl = $(this).attr("data-url");
    parent.window.open(strViewUrl, "_self");

});

    $(".btn_favorites").click(function(e){

        console.debug("viewId:" + $(this).attr("data-viewid"));


        var strViewId = $(this).attr("data-viewid");

        var strViewNm = $(this).attr("data-viewnm");

        var strViewUrl = $(this).attr("data-viewurl");

        var actionUrl="";

        if($(this).hasClass("active")) {
            //$(this).removeClass("active");
            actionUrl="<c:url value='/bhmc-dms-web/cmm/ath/viewInfo/deleteFavorite.do' />";

            $('#F' + strViewId).remove();

        }else {
            //$(this).addClass("active");
            actionUrl="<c:url value='/bhmc-dms-web/cmm/ath/viewInfo/insertFavorite.do' />";
            htmlText="<li  id=\"F"+strViewId+"\"  ><span class=\"menu\" data-url=\"" + strViewUrl  +"\" data-title=\"" + strViewNm+ "\" >"+strViewNm+"</span> <span data-viewid=\""+strViewId+"\" data-viewnm=\""+strViewNm+"\" data-viewurl=\""+strViewUrl+"\" class=\"btn_favorites active\" ></span></li>";

            $('#fav_cont').html($('#fav_cont').html() + htmlText);
        }

        var params = {};

//        alert(actionUrl);

        params["viewId"] = $(this).attr("data-viewid");

        params["viewNm"] = $(this).attr("data-viewnm");

        if (!dms.string.isEmpty(params.viewId)) {
            $.ajax({
                url:actionUrl
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(viewData) {

                //if(viewData != null ){
                  //  _addTabMenu(viewData.viewNm, _contextPath + viewData.viewUrl);
               // }
            });
        }
    });

    var favorite_click=1;// khskhs  원래 0이다.
    //var favorite_click=0;

        $("#favorite").click(function(e){

          var params = {};

          params["webMobileDstinCd"] = "M";

          //params["viewId"] = $(this).attr("data-viewid");

          //params["viewNm"] = $(this).attr("data-viewnm");

          if(favorite_click==0) {
              $.ajax({
                  url:"<c:url value='/cmm/ath/viewInfo/selectFavorites.do' />"
                  ,data:JSON.stringify(params)
                  ,type:'POST'
                  ,dataType:'json'
                  ,contentType:'application/json'
                  ,error:function(jqXHR,status,error){
                      mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                  }

              }).done(function(viewData) {

                  htmlText="";
                  for(var i=0; i < viewData.total; i++) {

                      console.debug(viewData.data[i].viewNm);

                      htmlText=htmlText +  "<li  id=\"F"+viewData.data[i].viewId+"\"  ><span class=\"menu\" data-url=\"/bhmc-dms-web" + viewData.data[i].viewUrl +"\" data-title=\"" + viewData.data[i].viewNm+ "\" >"+viewData.data[i].viewNm+"</span> <span data-viewid=\""+viewData.data[i].viewId+"\" data-viewnm=\""+viewData.data[i].viewNm+"\" class=\"btn_favorites active\" ></span></li>";
                      $('#M'+viewData.data[i].viewId).addClass("active");
                  }

                  $('#fav_cont').html(htmlText);

                  favorite_click=1;

                  //$(this).innerHTML(htmlText);

              });

          }


        });



</script>
<!-- //script -->

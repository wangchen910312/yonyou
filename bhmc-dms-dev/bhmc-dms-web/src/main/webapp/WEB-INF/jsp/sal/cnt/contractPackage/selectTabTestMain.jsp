<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="dateFormat" />
<dms:configValue code='dateTimeFormat' var="dateTimeFormat" />

<!-- 단체주문 개발전 기능테스트 2016.04.29 Kim Jin-Suk -->
<section class="group">
    <div class="headerarea">

        <div class="btnright">
            <button class="btns btnadd" id="btnOwnerAdd"><spring:message code='global.btn.rowAdd' /></button>     <!-- 행추가 -->
            <button class="btns" id="btnSave">저장</button>    <!-- 저장 -->
        </div>
    </div>

    <div id="tabMenu" class="tab_nav">
        <!-- 기본 탭메뉴 -->
        <!-- //기본탭 영역 -->
    </div>

</section>
<!-- //   -->

<script>

var lastSelectedTabMenu = "";
var maxTabCnt = 10;
var tabCnt = 1;
var tabIdx = 1;
var tabMenu;
var lastSelectedTabMenu;
var extraHeight = 105;

var tabMenuFrameId;


//var childLoading = false;   // kendo loading이 완료 처리.


//탭메뉴 추가
function addTabMenu(title, url) {

    //if(childLoading){return false;}
    //childLoading = true;

    ++tabCnt;

    tabMenuFrameId = "tabFrame" + (++tabIdx);

    tabMenu.append({
        text:title,
        encoded:false,
        content:"<div class=\"tabmenuajaxlaoder\" style=\"margin:200px auto;width:50px;z-index:20000;\"><img src=\"<c:url value='/resources/img/loading-image.gif'/>\"/></div>"
    });


    var tabMenuFrame = $("<iframe name=\"" + tabMenuFrameId + "\" id=\"" + tabMenuFrameId + "\" frameborder=\"0\" scrolling=\"auto\" src=\"" + url + "\" style=\"width:100%;height:100%;\" />");
    var tabMenuFrameContainer = $("#tabMenu div.k-content:last");
    tabMenuFrameContainer.addClass("tabMenuContent");
    tabMenuFrameContainer.height($(window).innerHeight() - extraHeight);
    tabMenuFrame.appendTo(tabMenuFrameContainer);

    tabMenuFrame.load(function() {
        $($(this).closest("div")).children("div").hide();

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

    });

    tabMenu.tabGroup.children("li.k-last").append("<button class=\"tabclose\">close</button>");
    tabMenu.select("li.k-last");

}

//탭메뉴 삭제
function removeTabMenu(e) {
    var selectedTab = tabMenu.select();
    var tab = $(e.target).closest("li");
    var otherTab;

    if (selectedTab.length > 0) {
        otherTab = tab.next();
        otherTab = otherTab.length ? otherTab:tab.prev();
    } else {
        otherTab = lastSelectedTabMenu;
    }

    tabMenu.remove(tab);
    tabMenu.select(otherTab);
}



$(document).ready(function() {

    $("#btnOwnerAdd").kendoButton({
        click:function(e) {
            addTabMenu("<spring:message code='sal.menu.contReqMgmt' />","<c:url value='/sal/cnt/contract/selectContractMain.do'/>");
        }
    });


    $("#btnSave").kendoButton({
        click:function(e) {

            /*

            // iframe에 function 넣어놓고 호출해봄.
            var bf_onSave = function (){
                var param = { "AAA":$("#carlineCd").data("kendoExtDropDownList").value() };
                return param;
            }

            */
            for(var i=2; i<=tabCnt; i++){
                console.log($("#tabFrame" + i).get(0).contentWindow.bf_onSave());
            }



        }
    });

    tabMenu = $("#tabMenu").kendoExtTabStrip({
        select:function(e) {
            lastSelectedTabMenu = this.select();
        },
        animation:false
    }).data("kendoExtTabStrip");


});
</script>
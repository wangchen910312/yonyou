<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 실적보고서 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic">실적보고서</h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active">가격 상담 능력 분석</li>     <!-- 가격 상담 능력 분석 -->
            <li id="tab02">판매 실적 통계 보고서</li>                          <!-- 판매 실적 통계 보고서 -->
            <li id="tab03">영업사원 판매목표 진도보고서</li>                    <!-- 영업사원 판매목표 진도보고서 -->
            <li id="tab04">판매 일 보고서</li>                                <!-- 판매 일 보고서 -->
            <li id="tab05">판매 주간 보고서</li>                              <!-- 판매 주간 보고서 -->
            <li id="tab06">차량판매 업무리포트</li>                            <!-- 차량판매 업무리포트 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 가격 상담 능력 분석 -->
        <div class="mt0">
            <iframe id="iframeStatus01" frameborder="0" src="" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //가격 상담 능력 분석 -->

        <!-- 판매 실적 통계 보고서 -->
        <div class="mt0">
            <iframe id="iframeStatus02" frameborder="0" src="" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //판매 실적 통계 보고서 -->

        <!-- 영업사원 판매목표 진도보고서 -->
        <div class="mt0">
            <iframe id="iframeStatus03" frameborder="0" src="" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //영업사원 판매목표 진도보고서 -->

        <!-- 판매 일 보고서 -->
        <div class="mt0">
            <iframe id="iframeStatus04" frameborder="0" src="" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //판매 일 보고서 -->

        <!-- 판매 주간 보고서 -->
        <div class="mt0">
            <iframe id="iframeStatus05" frameborder="0" src="" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //판매 주간 보고서 -->

        <!-- 차량판매 업무리포트 -->
        <div class="mt0">
            <iframe id="iframeStatus06" frameborder="0" src="" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //차량판매 업무리포트 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //실적보고서 -->

<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">
var selectTabId = "tab01";

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            selectTabId = e.item.id;
            selectTab(selectTabId);
        }
    });

    selectTab(selectTabId);
});



//tab
selectTab = function(tabId){
    var iframeUrl;

    if (tabId == "tab01") {

        if($("#iframeStatus01").attr("src") == ""){
            iframeUrl = "";
            $("#iframeStatus01").attr("src", iframeUrl);
        }

    } else if (tabId == "tab02") {

        if($("#iframeStatus02").attr("src") == ""){
            iframeUrl = "";
            $("#iframeStatus02").attr("src", iframeUrl);
        }

    } else if (tabId == "tab03") {
        if($("#iframeStatus03").attr("src") == ""){
            iframeUrl = "";
            $("#iframeStatus03").attr("src", iframeUrl);
        }
    } else if (tabId == "tab04") {
        if($("#iframeStatus04").attr("src") == ""){
            iframeUrl = "";
            $("#iframeStatus04").attr("src", iframeUrl);
        }
    } else if (tabId == "tab05") {
        if($("#iframeStatus05").attr("src") == ""){
            iframeUrl = "";
            $("#iframeStatus05").attr("src", iframeUrl);
        }

    } else if (tabId == "tab06") {
        if($("#iframeStatus06").attr("src") == ""){
            iframeUrl = "";
            $("#iframeStatus06").attr("src", iframeUrl);
        }
    }

}
</script>
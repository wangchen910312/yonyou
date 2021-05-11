<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<body style="overflow-x:hidden">
<!-- content -->
<section id="content">

    <!-- 판매이익 -->
    <section class="group">

        <!-- 탭메뉴 전체 영역 -->
        <div class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active">년간 목표 현황</li>
                <li>사용자 가이드</li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 판매목표 -->
            <div class="mt0" style="width:825px;">
            <div class="header_area">
                    <div class="left_area ml0">
                    </div>
                    <div class="btn_right">
                    </div>
                </div>
                <div class="table_info table_info_v1" style="width:800px; height:1200px;">
                    <iframe src="/bhmc-dms-dev/ReportServer?reportlet=mis/manuTargetYearList.cpt"  frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
                </div>
            </div>
            <!-- //판매목표 -->

            <!-- 차형별 이익 설정 -->
            <div class="mt0" style="width:825px;">
                <div class="header_area">
                    <div class="left_area ml0">
                    </div>
                    <div class="btn_right">
                    </div>
                </div>
                <div class="table_info table_info_v2" style="width:800px; height:1200px;">
                    <iframe src="/bhmc-dms-dev/ReportServer?reportlet=mis/manuTargetYearList.cpt"  frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
                </div>
            </div>
            <!-- //차형별 이익 설정 -->

        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //판매이익 -->


</section>
<!-- //content -->

<!-- script -->
<script>


    $(document).ready(function() {
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".form_comboBox").kendoExtDropDownList();
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });
    });
</script>
<!-- //script -->
</body>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section id="content">
    <!-- 부품임무관리 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.corpSalesAchievement" /></h1> --%>
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
                <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></span></th>
                        <td>
                            <input id="sDlrCd" type="text" value="" class="form_input form_required" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.saleType" /></th>
                        <td>
                            <input id="sSaleTp" value="" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.year" /></th>
                        <td>
                            <input id="sYear" value="" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div class="grid"></div>
        </div>
    </section>
    <!-- // 부품임무관리 -->

</section>
<!-- //content -->

<!-- script -->
<script>

$(document).ready(function() {



});
</script>
<!-- //script -->
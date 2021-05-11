<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- content -->
<section id="content">
    <!-- 실적관리 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.corpSalesAchievement" /> --%></h1>
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
                <button type="button" id="btnExcelUpload" class="btn_m btn_add" ><spring:message code="par.btn.uploadExcel" /></button>
                <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            </div>
        </div>

        <div class="table_form">
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
                            <input id="sDlrCd" type="text" value="" class="form_input form_required">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.saleType" /></th>
                        <td>
                            <input id="sSaleTp" value="" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.year" /></th>
                        <td>
                            <input id="sYear" value="" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div class="grid"></div>
        </div>
    </section>
    <!-- // 업무관리(계획실적) -->

</section>
<!-- //content -->

<!-- script -->
<script>
//saleTypeCdList
var saleTypeCdList = [];
<c:forEach var="obj" items="${saleTypeCdList}">
saleTypeCdList.push({
    "cmmCdNm":"${obj.cmmCdNm}"
    ,"cmmCd":"${obj.cmmCd}"
});
</c:forEach>

    $(document).ready(function() {

        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnExcelUpload
        $("#btnExcelUpload").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnSave
        $("#btnSave").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        //sPreAmtTp
        $("#sSaleTp").kendoExtDropDownList({
            dataSource:saleTypeCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        //sYear TODO:[InBoShim] year datalist setting.
        $("#sYear").kendoExtDropDownList({
            dataSource:[{cmmCd:2015, cmmCdNm:2015},{cmmCd:2016,  cmmCdNm:2016},{cmmCd:2017,  cmmCdNm:2017}]
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        $(".grid").kendoGrid({
            height:500,
            columns:[{
                field:"",
                title:"",
                width:100
            },{
                title:"M 年",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"",
                    title:"目标金额", // 목표금액
                    width:100
                },{
                    field:"",
                    title:"件數", // 건수
                    width:60
                },{
                    field:"",
                    title:"数量", // 수량
                    width:100
                },{
                    field:"",
                    title:"金额", // 금액
                    width:100
                },{
                    field:"",
                    title:"%",
                    width:40
                }]
            },{
                title:"M-1 年",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"",
                    title:"目标金额", // 목표금액
                    width:100
                },{
                    field:"",
                    title:"件數", // 건수
                    width:60
                },{
                    field:"",
                    title:"数量", // 수량
                    width:100
                },{
                    field:"",
                    title:"金额", // 금액
                    width:100
                },{
                    field:"",
                    title:"%",
                    width:40
                }]
            }]
        });
    });
</script>
<!-- //script -->
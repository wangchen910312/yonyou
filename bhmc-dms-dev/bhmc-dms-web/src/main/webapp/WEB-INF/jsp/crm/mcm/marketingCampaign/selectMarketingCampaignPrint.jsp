<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 캠페인 정보 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.campaignInfo" /><!-- 캠페인정보 --></h1>
    </div>

    <div>
        <iframe id="iframeTab" name="iframeTab" src="" frameborder="0" scrolling="auto" width="100%" height="950"></iframe>
    </div>
</section>
<!-- //캠페인 정보 -->

<script type="text/javascript">

/**
 *  공통 탭
 *      - 기본정보/방안/목표/대상/예산
 *  결재탭
 *      -상태 : 심사중 이후 부터 ( statCd : 01 이 아닌경우 )
 *  결과탭
 *      - 상태 : 심사완료 ( statCd : 03 ) && 종료일이 지난경우
 *  정비탭
 *  유형 : 정비인경우 ( MakTpCd : 03 )
 *      - 제조사 HOST_CD(01) :  공임 / 교환부품 / VIN
 *      - 딜러 HOST_CD(02)   : 정비항목 / 부품수령 / VIN
 */

    var   dlrCd = "<c:out value='${marketingCampaignVO.dlrCd}' />"
        , makCd = "<c:out value='${marketingCampaignVO.makCd}' />"
        , makTpCd = "<c:out value='${marketingCampaignVO.makTpCd}' />"
        , hostCd = "<c:out value='${marketingCampaignVO.hostCd}' />"
        , statCd = "<c:out value='${marketingCampaignVO.statCd}' />"
        , endDt = new Date("<c:out value='${marketingCampaignVO.endDt}' />")
        , sysDate = new Date("<c:out value='${sysDate}' />")
        , dateFormat = "<c:out value='${dateFormat}' />"
    ;

//     console.log("dlrCd : " + dlrCd);
//     console.log("makCd : " + makCd);
//     console.log("makTpCd : " + makTpCd);
//     console.log("hostCd : " + hostCd);
//     console.log("statCd : " + statCd);
//     console.log("endDt : ", endDt);
//     console.log("sysDate : " + sysDate);
//     console.log("endDt : " + kendo.parseDate(endDt, "<dms:configValue code='dateFormat' />"));
//     console.log("sysDate : " + kendo.parseDate(sysDate, "<dms:configValue code='dateFormat' />"));

    function membershipReportMainCall(){

        var fileNm;
        var campaignReportParam;
        var campaignReportUrl;

        if ( makTpCd !== "03" ) {

            if ( statCd !== "01" ) {

                if ( statCd === "03" && sysDate > endDt ) {
                    // 결재O / 결과O
                    fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint01.cpt' />"
                } else {
                    // 결재O / 결과X
                    fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint02.cpt' />"
                };

            } else {

                if ( statCd === "03" && sysDate > endDt ) {
                    // 결재X / 결과O
                    fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint03.cpt' />"
                } else {
                    // 결재X / 결과X
                    fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint04.cpt' />"
                };

            };

        } else if ( makTpCd === "03" ) {

            if ( hostCd === "01" ) {

                if ( statCd !== "01" ) {

                    if ( statCd === "03" && sysDate > endDt ) {
                        // 결재O / 결과O / 제조사정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint05.cpt' />"
                    } else {
                        // 결재O / 결과X / 제조사정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint06.cpt' />"
                    };

                } else {

                    if ( statCd === "03" && sysDate > endDt ) {
                        // 결재X / 결과O / 제조사정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint07.cpt' />"
                    } else {
                        // 결재X / 결과X / 제조사정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint08.cpt' />"
                    };

                };

            } else if ( hostCd === "02" ) {

                if ( statCd !== "01" ) {

                    if ( statCd === "03" && sysDate > endDt ) {
                        // 결재O / 결과O / 딜러정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint09.cpt' />"
                    } else {
                        // 결재O / 결과X / 딜러정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint10.cpt' />"
                    };

                } else {

                    if ( statCd === "03" && sysDate > endDt ) {
                        // 결재X / 결과O / 딜러정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint11.cpt' />"
                    } else {
                        // 결재X / 결과X / 딜러정비O
                        fileNm = "<c:url value='/ReportServer?reportlet=crm/campaignReport/selectMarketingCampaignMainPrint12.cpt' />"
                    };

                };

            };

        };

        campaignReportParam =  "&sDlrCdParam="+dlrCd+"&sMakCdParam="+makCd;
        campaignReportUrl = fileNm+campaignReportParam;
        $("#iframeTab").attr("src", campaignReportUrl);
    };

    $(document).ready(function() {
        membershipReportMainCall();
    });
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 탭메뉴 전체 영역 -->
    <div id="membershipStatReportTab" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.title.membershipROReport" /><!-- 정비회원 정비분석 리포트 --></li>
            <li id="Tab02"><spring:message code="crm.title.membershipRORateReport" /><!-- 회원정비 기여율 리포트 --></li>
            <li id="Tab03"><spring:message code="crm.title.membershipCarStatReport" /><!-- 회원차량 데이터 분석 --></li>
            <li id="Tab04"><spring:message code="crm.title.membershipExpansionReport" /><!-- 회원 확대 분석 --></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 정비회원 정비분석 리포트 -->
        <div class="mt0" >
            <div class="fsearch_area">

                <div class="header_area">
                    <div class="btn_right" style="margin-right:10px;">
                        <button type="button" class="btn_s btn_search" id="btnMembershipStatsReport01" name="btnMembershipStatsReport01"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnCustSearch" style="margin:0 10px 0 10px;">
                    <table>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.roTimeReport' /><!-- 정비시간 --></th>
                                <td>
                                     <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt01" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt01" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sCustNm" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                                <td>
                                    <input type="text" id="sCarRegNo" class="form_input">
                                </td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="table_info table_info_v1" style="margin:0 10px 0 10px;">
                <iframe id="iframeTab01" name="iframeTab01" src="" frameborder="0" scrolling="no" width="100%" height="570" class="report"></iframe>
            </div>
        </div>
        <!-- //정비회원 정비분석 리포트-->

        <!-- 회원정비 기여율 리포트 -->
        <div class="mt0" >
            <div class="fsearch_area">

                <div class="header_area">
                    <div class="btn_right" style="margin-right:10px;">
                        <button type="button" class="btn_s btn_search" id="btnMembershipStatsReport02" name="btnMembershipStatsReport02"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnCustSearch" style="margin:0 10px 0 10px;">
                    <table>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.roTimeReport' /><!-- 정비시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt02" name="sStartDt02" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt02" name="sEndDt02" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="table_info table_info_v1" style="margin:0 10px 0 10px;">
                <iframe id="iframeTab02" name="iframeTab02" src="" frameborder="0" scrolling="no" width="100%" height="570" class="report"></iframe>
            </div>
        </div>
        <!-- //회원정비 기여율 리포트 -->

        <!-- 회원차량 데이터 분석 -->
        <div class="mt0">
            <div class="fsearch_area">

                <div class="header_area">
                    <div class="btn_right" style="margin-right:10px;">
                        <button type="button" class="btn_s btn_search" id="btnMembershipStatsReport03" name="btnMembershipStatsReport03"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnCustSearch" style="margin:0 10px 0 10px;">
                    <table>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.membersihpRegDtReport' /><!-- 가입시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt03" name="sStartDt03" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt03" name="sEndDt03" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="table_info table_info_v1" style="margin:0 10px 0 10px;">
                <iframe id="iframeTab03" name="iframeTab03" src="" frameborder="0" scrolling="no" width="100%" height="570" class="report"></iframe>
            </div>
        </div>
        <!-- //회원차량 데이터 분석 -->

        <!-- 회원 확대 분석 -->
        <div class="mt0">
            <div class="fsearch_area">

                <div class="header_area">
                    <div class="btn_right" style="margin-right:10px;">
                        <button type="button" class="btn_s btn_search" id="btnMembershipStatsReport04" name="btnMembershipStatsReport04"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnCustSearch" style="margin:0 10px 0 10px;">
                    <table>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:18%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.membersihpRegDtReport' /><!-- 가입시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt04" name="sStartDt04" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt04" name="sEndDt04" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="table_info table_info_v1" style="margin:0 10px 0 10px;">
                <iframe id="iframeTab04" name="iframeTab04" src="" frameborder="0" scrolling="no" width="100%" height="570" class="report"></iframe>
            </div>
        </div>
        <!-- //회원 확대 분석 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->

<!-- script -->
<script type="text/javascript">

    function membershipStatReportCall(selectTabId){
        var iframeUrl
            , strParam
        ;

        if ( dms.string.isEmpty(selectTabId) ) {
            selectTabId = "Tab01";
        };

        if (selectTabId == "Tab01") {
            strParam = "&sCustNm="+$("#sCustNm").val();
            strParam += "&sCarRegNo="+$("#sCarRegNo").val();
            iframeUrl = "<c:url value='/ReportServer?reportlet=crm/membership/membershipStatsReport01.cpt' />&op=view";

        } else if (selectTabId == "Tab02") {
            iframeUrl = "<c:url value='/ReportServer?reportlet=crm/membership/membershipStatsReport02.cpt' />&op=view";

        } else if (selectTabId == "Tab03") {
            iframeUrl = "<c:url value='/ReportServer?reportlet=crm/membership/membershipStatsReport03.cpt' />&op=view";

        } else if (selectTabId == "Tab04") {
            iframeUrl = "<c:url value='/ReportServer?reportlet=crm/membership/membershipStatsReport04.cpt' />&op=view";
        };
        if( dms.string.isEmpty( $("#sStartDt"+selectTabId.replace("Tab", "")).val() )
                || dms.string.isEmpty( $("#sEndDt"+selectTabId.replace("Tab", "")).val() ) ){
            dms.notification.warning("<spring:message code='global.lbl.date' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
            return;
        } else {
            reportParam =  "&sDlrCdParam="+"<c:out value='${sDlrCd}' />";
            reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
            reportParam += "&sMembershipStan="+"<c:out value='${sMembershipStan}' />";
            reportParam += "&sRoDtFr="+$("#sStartDt"+selectTabId.replace("Tab", "")).val();
            reportParam += "&sRoDtTo="+$("#sEndDt"+selectTabId.replace("Tab", "")).val();
            if(strParam){
                reportParam += strParam;
            }
            iframeUrl = iframeUrl + reportParam;
        };
        $("#iframe"+selectTabId).attr("src", iframeUrl);
    };
    $(document).ready(function() {
        $("#membershipStatReportTab").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                membershipStatReportCall(e.item.id);
            }
        });

        $("#btnMembershipStatsReport01").kendoButton({
            click:function(e) {
                membershipStatReportCall("Tab01");
            }
        });
        $("#btnMembershipStatsReport02").kendoButton({
            click:function(e) {
                membershipStatReportCall("Tab02");
            }
        });
        $("#btnMembershipStatsReport03").kendoButton({
            click:function(e) {
                membershipStatReportCall("Tab03");
            }
        });
        $("#btnMembershipStatsReport04").kendoButton({
            click:function(e) {
                membershipStatReportCall("Tab04");
            }
        });

        $("#sStartDt01").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegStartDt}' />"
        });
        $("#sEndDt01").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegEndDt}' />"
        });

        $("#sStartDt02").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegStartDt}' />"
        });
        $("#sEndDt02").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegEndDt}' />"
        });

        $("#sStartDt03").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegStartDt}' />"
        });
        $("#sEndDt03").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegEndDt}' />"
        });

        $("#sStartDt04").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegStartDt}' />"
        });
        $("#sEndDt04").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sRegEndDt}' />"
        });
        membershipStatReportCall("");
    });
</script>
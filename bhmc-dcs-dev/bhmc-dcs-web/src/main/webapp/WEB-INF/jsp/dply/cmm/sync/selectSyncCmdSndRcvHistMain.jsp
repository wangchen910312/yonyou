<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript" src="<c:url value='/resources/js/dms/comerstone.js' />"></script>
<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>

//Notification Type:COM033
var notificationTpList = [];

<c:forEach var="obj" items="${notificationTpDS}">
    notificationTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var notificationTpArray = [];
$.each(notificationTpList, function(idx, obj){
    notificationTpArray[obj.cmmCd] = obj.cmmCdNm;
});

// Sync Command Send Receive Type:COM046
var sndRecvTpList = [];

<c:forEach var="obj" items="${sndRecvTpDS}">
    sndRecvTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var sndRecvTpArray = [];
$.each(sndRecvTpList, function(idx, obj){
    sndRecvTpArray[obj.cmmCd] = obj.cmmCdNm;
});


//Message Code
var messageCodeList = [];
<c:forEach var="obj" items="${mesgCdDS}">
messageCodeList.push({cmmCdNm:"${obj.mesgNm}", cmmCd:"${obj.mesgCd}"});
</c:forEach>

var messageCodeArray = [];
$.each(messageCodeList, function(idx, obj){
    messageCodeArray[obj.cmmCd] = obj.cmmCdNm;
});


//REPOSITORY
// var repositoryList = [];
// <c:forEach var="obj" items="${repositoryDS}">
// repositoryList.push({cmmCdNm:"${obj.repoUrlCont}", cmmCd:"${obj.repoUrlNm}"});
// </c:forEach>

// var repositoryArray = [];
// $.each(repositoryList, function(idx, obj){
//     repositoryArray[obj.cmmCd] = obj.cmmCdNm;
// });

//DEPLOY서비스작업명령어코드:COM035
var operCmdTpList = [];
<c:forEach var="obj" items="${operCmdTpDS}">
    operCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var operCmdTpArray = [];
$.each(operCmdTpList, function(idx, obj){
    operCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//PROPERTY파일타입코드:COM038
var prtyFileTpList = [];
<c:forEach var="obj" items="${prtyFileTpDS}">
prtyFileTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var prtyFileTpArray = [];
$.each(prtyFileTpList, function(idx, obj){
    prtyFileTpArray[obj.cmmCd] = obj.cmmCdNm;
});
prtyFileTpArray[null] = "";

//REPOSITORY 작업명령어코드:COM042
// var repositoryOperCmdTpList = [];
// <c:forEach var="obj" items="${repositoryOperCmdTpDS}">
// repositoryOperCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
// </c:forEach>

// var repositoryOperCmdTpArray = [];
// $.each(repositoryOperCmdTpList, function(idx, obj){
//     repositoryOperCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
// });


</script>


<form id="syncCommandSendReceiveHistoryForm" name="syncCommandSendReceiveHistoryForm" method="POST" onsubmit="return false;">
<!-- Sync Command Send Receive History List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic"><spring:message code='cmm.title.execRespetiveDeploy' /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12320" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:19%;">
                <col style="width:10%;">
                <col style="width:30%;">
                <col style="width:12%;">
                <col style="width:19%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.sendRecvType' /></th>
                    <td>
                        <input id="sFlag" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.messageCd' /></th>
                    <td>
                        <input id="sCmdCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.sendRecvTransId' /></th>
                    <td>
                        <input id="sSendReceiveTrxId" type="text" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                    <td>
                        <input id="sDlrCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.sendRecvTime' /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartTrxDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndTrxDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <td colspan="2"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="syncCommandSendReceiveHistoryGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active"><spring:message code='global.title.deployHistoryDetail' /></li>
            <li><spring:message code='global.title.appDeploy' /></li>
            <li><spring:message code='global.title.sqlDeploy' /></li>
            <li><spring:message code='global.title.fileDeploy' /></li>
            <li><spring:message code='global.title.propertyDeploy' /></li>
<%--             <li><spring:message code='global.title.repositoryDeploy' /></li> --%>
            <li><spring:message code='global.title.commandDeploy' /></li>
        </ul>

        <!-- 배포이력상세 시작 -->
        <div>
            <div class="table_form" id="tab01">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:9%;">
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col style="width:20%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.sendRecvTransId' /></th>
                            <td>
                                <input id="sendReceiveTrxId" name="sendReceiveTrxId" class="form_input" data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.sendRecvType' /></th>
                            <td>
                                <input id="flag" name="flag" class="form_comboBox" data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.messageCd' /></th>
                            <td>
                                <input id="cmdCd" name="cmdCd" class="form_input" data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.sendRecvTime' /></th>
                            <td>
                                <input id="eventDt" data-json-obj="true" class="form_datetimepicker">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.dlrNm' /></th>
                            <td>
                                <input id="dlrNm" name="dlrNm" class="form_input" data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.resProcRsltCd' /></th>
                            <td>
                                <input id="resProcRsltCd" name="resProcRsltCd" class="form_input" data-json-obj="true" >
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.message' /></th>
                            <td colspan="7">
                                <textarea id="cmdTcXmlBodyCont" name="cmdTcXmlBodyCont" rows="10" placeholder="" class="form_textarea" data-json-obj="true" style="height:210px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 배포이력상세 끝 -->

        <!-- App배포 시작 -->
        <div>
            <div class="table_form" id="tab02">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:11%;">
                        <col style="width:23%;">
                        <col style="width:6%;">
                        <col style="width:12%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="form_left" style="width:40%;">
                                        <div class="form_search">
                                            <input id="sDlrCdService" class="form_input" />
                                            <a href="javascript:searchDMSPopup('#sDlrCdService', '#sDlrNmService');"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:60%;">
                                        <input id="sDlrNmService" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
<%--                              <th scope="row"><spring:message code='global.lbl.repositorySelect' /></th> --%>
<!--                             <td> -->
<!--                                 <input id="serviceRepository" class="form_comboBox"> -->
<!--                             </td>  -->
                             <td class="ar">
                                <dms:access viewId="VIEW-I-12319" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button aria-disabled="false" role="button" data-role="button" class="btn_s k-button"  id="btnAppSearch" style="display: inline-block; float:left;" ><spring:message code='dply.btn.appSearch' /></button><!-- App 조회 -->
                                </dms:access>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.operCmdNm'/></th>
                            <td>
                                <input id="serviceOperCmdNm" name="serviceOperCmdNm" data-json-obj="true" class="form_comboBox">
                            </td>
                            <td class="ar">

                            </td>
                            <td class="ar">
                                <dms:access viewId="VIEW-I-12318" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button class="btn_s" id="btnSyncService" ><spring:message code='global.btn.deployExec' /></button><!-- 배포실행 -->
                                </dms:access>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>

            <div class="clfix">
                <section class="left_areaStyle">
                    <!-- <div class="header_area">
                        <h2 class="title_basic">App정보</h2>
                    </div> -->
                    <div class="table_grid mt10">
                        <div id="serviceGrid" class="grid"></div>
                    </div>
                </section>
                <section class="right_areaStyle">
                    <div class="table_form mt10">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:20%;">
                                <col style="width:80%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.propertyRequestXml' /></th>
                                    <td>
                                        <textarea id="serviceRequestXml" name="serviceRequestXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:105px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.propertyResponseXml' /></th>
                                    <td>
                                        <textarea id="serviceResponseXml" name="serviceResponseXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:105px;"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
        <!-- App배포 끝 -->


        <!-- SQL배포 시작 -->
        <div>
            <div class="table_form" id="tab03">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:30%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:40%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="form_left" style="width:40%;">
                                        <div class="form_search">
                                            <input id="sDlrCdSql" class="form_input" />
                                            <a href="javascript:searchDMSPopup('#sDlrCdSql', '#sDlrNmSql');"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:60%;">
                                        <input id="sDlrNmSql" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                            <td class="ar">
                                <dms:access viewId="VIEW-I-12317" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button class="btn_s" id="btnSyncSql" ><spring:message code='global.btn.deployExec' /></button><!-- 배포실행 -->
                                </dms:access>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.sqlInfo' /></th>
                            <td colspan="2" rowspan="2">
                                <textarea id="sqlCommand" name="sqlCommand" rows="14" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:232px;"></textarea>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.propertyRequestXml' /></th>
                            <td>
                                <textarea id="sqlRequestXml" name="sqlRequestXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.propertyResponseXml' /></th>
                            <td>
                                <textarea id="sqlResponseXml" name="sqlResponseXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- SQL배포 끝 -->


        <!-- FILE배포 시작 -->
        <div>
            <div class="table_form" id="tab03">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:30%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:40%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="form_left" style="width:40%;">
                                        <div class="form_search">
                                            <input id="sDlrCdFile" class="form_input" />
                                            <a href="javascript:searchDMSPopup('#sDlrCdFile', '#sDlrNmFile');"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:60%;">
                                        <input id="sDlrNmFile" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                            <td class="ar">
                                <dms:access viewId="VIEW-I-12316" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button class="btn_s" id="btnSyncFile" ><spring:message code='global.btn.deployExec' /></button><!-- 배포실행 -->
                                </dms:access>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.srcFileUrl' /></th>
                            <td colspan="2">
                                <textarea id="srcFileUrl" name="srcFileUrl" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.propertyRequestXml' /></th>
                            <td>
                                <textarea id="fileRequestXml" name="fileRequestXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.trgtFilePath' /></th>
                            <td colspan="2">
                                <textarea id="trgtFilePath" name="trgtFilePath" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.propertyResponseXml' /></th>
                            <td>
                                <textarea id="fileResponseXml" name="fileResponseXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- FILE배포 끝 -->


        <!-- Property배포 시작 -->
        <div>
            <div class="table_form" id="tab03">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:28%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:40%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="form_left" style="width:40%;">
                                        <div class="form_search">
                                            <input id="sDlrCdProperty" class="form_input" />
                                            <a href="javascript:searchDMSPopup('#sDlrCdProperty', '#sDlrNmProperty');"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:60%;">
                                        <input id="sDlrNmProperty" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                            <td class="ar">
                                <dms:access viewId="VIEW-I-12315" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button class="btn_s" id="btnSyncProperty" ><spring:message code='global.btn.deployExec' /></button><!-- 배포실행 -->
                                </dms:access>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.propertyFilePath' /></th>
                            <td colspan="2">
                                <input id="propertyFilePath" name="propertyFilePath" class="form_input" data-json-obj="true" >
                            </td>
                            <th scope="row" rowspan="3"><spring:message code='global.lbl.propertyRequestXml' /></th>
                            <td rowspan="3">
                                <textarea id="propertyRequestXml" name="propertyRequestXml" rows="" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:64px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.propertyKeyNm' /></th>
                            <td colspan="2">
                                <input id="keyNm" name="keyNm" class="form_input" data-json-obj="true" >
                            </td>
                        </tr>
                        <tr>
                             <th scope="row"><spring:message code='global.lbl.prtyFileTpNm'/></th>
                            <td colspan="2">
                                <input id="fileType" name="fileType" data-json-obj="true" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.propertyKeyVal' /></th>
                            <td colspan="2">
                                <textarea id="keyVal" name="keyVal" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.propertyResponseXml' /></th>
                            <td>
                                <textarea id="propertyResponseXml" name="propertyResponseXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Property배포 끝 -->


        <!-- Repository배포 시작 -->
        <%--  <div>
            <div class="table_form" id="tab03">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:11%;">
                        <col style="width:23%;">
                        <col style="width:6%;">
                        <col style="width:10%;">
                        <col style="width:11%;">
                        <col style="width:24%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="form_left" style="width:40%;">
                                        <div class="form_search">
                                            <input id="sDlrCdRepository" class="form_input" />
                                            <a href="javascript:searchDMSPopup('#sDlrCdRepository', '#sDlrNmRepository');"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:60%;">
                                        <input id="sDlrNmRepository" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.operCmdNm' /></th>
                            <td>
                                <input id="repositoryOperCmdNm" name="repositoryOperCmdNm" data-json-obj="true" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.repositorySelect' /></th>
                            <td>
                                <input id="repository" name="repository" data-json-obj="true"  class="form_comboBox">
                            </td>
                            <td class="ar">
                                <button class="btn_s" id="btnSyncRepository" ><spring:message code='global.btn.deployExec' /></button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.repoUrlNm'/></th>
                            <td colspan="3" rowspan="2">
                                <textarea id="repoUrlNm" name="repoUrlNm" rows="14" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:232px;"></textarea>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.propertyRequestXml' /></th>
                            <td colspan="2">
                                <textarea id="repositoryRequestXml" name="repositoryRequestXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.propertyResponseXml' /></th>
                            <td colspan="2">
                                <textarea id="repositoryResponseXml" name="repositoryResponseXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:115px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div> --%>
        <!-- Property배포 끝 -->

        <!-- Command배포 시작 -->
        <div>
            <div class="table_form" id="tab03">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:28%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:40%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="form_left" style="width:40%;">
                                        <div class="form_search">
                                            <input id="sDlrCdCommand" class="form_input" />
                                            <a href="javascript:searchDMSPopup('#sDlrCdCommand', '#sDlrNmCommand');"><spring:message code="global.btn.search" /></a>    <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right" style="width:60%;">
                                        <input id="sDlrNmCommand" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                            <td class="ar">
                                <dms:access viewId="VIEW-I-12314" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button class="btn_s" id="btnSyncCommand" ><spring:message code='global.btn.deployExec' /></button><!-- 배포실행 -->
                                </dms:access>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.operCmdNm'/></th>
                            <td colspan="2">
                                <input id="commandOperCmdNm" name="commandOperCmdNm" class="form_input" data-json-obj="true" >
                            </td>
                            <th scope="row" rowspan="4"><spring:message code='global.lbl.propertyRequestXml' /></th>
                            <td rowspan="4">
                                <textarea id="commandRequestXml" name="commandRequestXml" rows="" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:86px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.operDirNm'/></th>
                            <td colspan="2">
                                <input id="commandOperDirNm" name="commandOperDirNm" class="form_input" data-json-obj="true" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.successDecisionStr'/></th>
                            <td colspan="2">
                                <input id="commandSuccessDecisionStr" name="commandSuccessDecisionStr" class="form_input" data-json-obj="true" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.failDecisionStr'/></th>
                            <td colspan="2">
                                <input id="commandFailDecisionStr" name="commandFailDecisionStr" class="form_input" data-json-obj="true" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.operCmdEnvCont'/></th>
                            <td colspan="2">
                                <textarea id="commandOperCmdEnvCont" name="commandOperCmdEnvCont" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:93px;"></textarea>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.propertyResponseXml' /></th>
                            <td>
                                <textarea id="commandResponseXml" name="commandResponseXml" rows="7" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:93px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Property배포 끝 -->


    </div>
    <!-- TabStrip 끝 -->


</section>
</form>


<script type="text/javascript">


/******************************************
 * 함수영역 - start
 ******************************************/

var gv_syncCommandSendReceiveHistoryGridModel_currUid = null;

function initDetail() {
    $('#sendReceiveTrxId').val(null);
    $('#flag').val(null);
    $('#eventDt').data("kendoDateTimePicker").value(null);
    $('#cmdCd').val(null);
    $('#dlrNm').val(null);
    $('#resProcRsltCd').val(null);
    $('#cmdTcXmlBodyCont').val(null);

}

var searchDMSPopupWin;

function searchDMSPopup(dlrCdBox, dlrNmBox) {
    searchDMSPopupWin = dms.window.popup({
        windowId:"searchDMSPopupWin"
        ,title:"<spring:message code='global.title.dmsSearch' />"   // DMS 조회
        ,width:800
        ,content:{
            url:"<c:url value='/dply/cmm/dms/selectDmsCmmPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"callbackFunc":function(data) {
//                     alert(JSON.stringify(data));
                    if(data.length >= 1) {
                        $(dlrCdBox).val(data[0].dlrCd);
                        $(dlrNmBox).val(data[0].dlrNm);
                    }
                }

            }
        }
    });
}


var searchSrcAppPopupWin;
function searchSrcAppPopup() {

    searchSrcAppPopupWin = dms.window.popup({
        windowId:"searchSrcAppPopupWin"
        ,title:"App Search"   // Repository 조회
        ,width:800
        ,height:500
        ,content:{
            url:"<c:url value='/dply/spec/specMng/selectSrcAppPopup.do'/>"
            ,data:{
                 "autoBind":true
                ,"callbackFunc":function(param) {
                    var grid = $('#serviceGrid').data('kendoExtGrid');
                    grid.dataSource.insert(0,param);
                        if(param != null){
                            var row = grid.tbody.find("tr:eq(0)");
                            grid.select(row);
                        }

                }
            }
        }

    });
}

/******************************************
 * 함수영역 - end
 ******************************************/

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var idx = $(e.item).index();

            if(idx == 0) {  // 기본정보

            }
        }
    });

    // 작업명령어명
    $("#serviceOperCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:operCmdTpList
    });



    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - App조회
    $("#btnAppSearch").kendoButton({
        click:function(e) {
            searchSrcAppPopup();
        }
    });



    //그리드 설정
    $("#syncCommandSendReceiveHistoryGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/sync/selectSyncCommandSendReceiveHistory.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sFlag"]             = $("#sFlag").data("kendoExtDropDownList").value();
                        params["sDlrCd"]            = $("#sDlrCd").val();
                        params["sCmdCd"]            = $("#sCmdCd").val();
                        params["sSendReceiveTrxId"] = $("#sSendReceiveTrxId").val();
                        params["sStartTrxDt"]       = $("#sStartTrxDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndTrxDt"]         = $("#sEndTrxDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                        flag                 :{type:'string'}
                        ,sendReceiveTrxId    :{type:'string'}
                        ,eventDt             :{type:'date'}
                        ,cmdCd               :{type:'string'}
                        ,dlrCd               :{type:'string'}
                        ,dlrNm               :{type:'string'}
                        ,cmdTcXmlBodyCont    :{type:'string'}
                        ,resTcXmlBodyCont    :{type:'string'}
                        ,resProcRsltCd       :{type:'string'}
                        ,resProcRsltMesgCont :{type:'string'}
                    }
                }
            }
            ,requestEnd:function(e) {
                $("#syncCommandSendReceiveHistoryGrid").data("kendoExtGrid").dataSource.data([]);
                initDetail();
            }
        }
        ,height:242
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,filterable:false
        ,columns:[
            {field:"sendReceiveTrxId", title:"<spring:message code='global.lbl.sendRecvTransId' />", width:140, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"flag", title:"<spring:message code='global.lbl.sendRecvType' />", width:80
                ,template:"#=sndRecvTpArray[flag]#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"eventDt", title:"<spring:message code='global.lbl.sendRecvTime' />", width:140, sortable:false
                ,attributes:{"class":"ac"}
                ,format:"{0:"+vDtyyyyMMddHHmmss+"}"
            }
            ,{field:"cmdCd", title:"<spring:message code='global.lbl.messageCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"cmdCd", title:"<spring:message code='global.lbl.messageNm' />", width:240
                ,template:"#=messageCodeArray[cmdCd]#"
            }
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:110
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrIpAddrNm", title:"IP", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrPortNo", title:"PORT", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"resProcRsltCd", title:"<spring:message code='global.lbl.resProcRsltCd' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{title:""}
        ]
        ,change:function(e) {
//          if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

//                 gv_notificationHistoryGridModel_currUid = selectedVal.uid;

                $('#sendReceiveTrxId').val(selectedVal.sendReceiveTrxId);
                $('#flag').data('kendoExtDropDownList').value(selectedVal.flag);
                $('#eventDt').data("kendoDateTimePicker").value(selectedVal.eventDt);
                $('#cmdCd').val(selectedVal.cmdCd);
                $('#dlrNm').val(selectedVal.dlrNm);
                $('#resProcRsltCd').val(selectedVal.resProcRsltCd);

//                 if(selectedVal.flag == 'SEND') {
//                     $('#cmdTcXmlBodyCont').val(selectedVal.cmdTcXmlBodyCont);
//                 } else if(selectedVal.flag == 'RECEIVE') {
//                     $('#cmdTcXmlBodyCont').val(selectedVal.resTcXmlBodyCont);
//                 }

                var xmlMessage = null;
                if(selectedVal.flag == 'SEND') {
                    xmlMessage = selectedVal.cmdTcXmlBodyCont;
                } else if(selectedVal.flag == 'RECEIVE') {
                    xmlMessage = selectedVal.resTcXmlBodyCont;
                }

                if(xmlMessage != null) {
                    xmlMessage = xmlMessage.replace(/></g, ">\r\n<");
                }

                $('#cmdTcXmlBodyCont').val(xmlMessage);

            } else {
                initDetail();
            }


        }
        ,dataBinding:function(e) {

        }

    });

    // Type
    $("#sFlag").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:sndRecvTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });


    //
    $("#sCmdCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:messageCodeList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });


    // Event Date
    $("#sStartTrxDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:processDate(toDay, cmmPrtyListObj['defaultDate.syncCmdSndRcvHist.startTrxDt'], vDtyyyyMMdd)
    });

    // Event Date
    $("#sEndTrxDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:processDate(toDay, cmmPrtyListObj['defaultDate.syncCmdSndRcvHist.endTrxDt'], vDtyyyyMMdd)
    });

    // Event Date
    $("#eventDt").kendoDateTimePicker({
        format:"{0:"+vDtyyyyMMddHHmmss+"}"
    });

    // Type
    $("#flag").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:sndRecvTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });





    $("#serviceGrid").kendoExtGrid({
         dataSource : {
            data : []
        }
       /*  dataSource : {
            transport : {
                read : {
                   url : "<c:url value='/dply/cmm/mng/selectAppInfo.do' />"
               }
               ,parameterMap : function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema : {
               model : {
                   id : "symbolicNm"
                   ,fields : {
                	   symbolicNm    : {type : "string"}
                       ,bundleNm  : {type : "string"}
                       ,bundleVerNo  : {type : "string"}
                       ,targFilePathNm    : {type : 'string'}    //DMS_WAS_APP_HOME_DIR
                       ,srcFilePathNm     : {type : 'string'}    //DCS_APP_DEPLOY_HOME_URL
                   }
               }
           }
       } */
        ,multiSelectWithCheckbox:true
        ,height:224
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"single, row"
        ,editable:false
        ,filterable:false
        ,sortable:false
        ,columns:[
            {field : "symbolicNm", title : "<spring:message code='global.lbl.symbolicNm' />", width : 220
            }
            ,{field : "bundleVerNo", title : "<spring:message code='global.lbl.bundleVerNo' />", width : 100
                ,attributes : {"class" : "ac"}
            }
            ,{field : "bundleNm", title : "<spring:message code='global.lbl.bundleNm' />", width : 220
            }
            ,{field : "targFilePathNm", width : 100, hidden: true
            }
            ,{field : "srcFilePathNm", width : 100, hidden: true
            }
//             ,{field:"size", title:"<spring:message code='global.lbl.appSize' />", width:80
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"uri", title:"<spring:message code='global.lbl.appUrl' />", width:500
//             }

            ,{title:""}
        ]

    });

    /*  $("#serviceRepository").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:repositoryList
    }); */

    /*  $("#serviceRepository").on("change", function() {
        searchService();
    }); */


    function searchService() {
        var params = {};

        params["mesgCd"]      = '30015';       // OSGi Bundle Repository Resource Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
//        params["repository"]  = $('#serviceRepository').data('kendoExtDropDownList').value();

        /* if(dms.string.isEmpty($('#serviceRepository').data('kendoExtDropDownList').value())) {
            return;
        } */

//         params["repository"]  = '<![CDATA[file:///D:\\develop\\ControlServer\\repository\\repository.xml]]>';

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                postProcSearchService(jqXHR, params);
//                 processRsltOfSyncCmd(jqXHR, params);
            }
        });

    }

    function postProcSearchService(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         console.log(JSON.stringify(objJson));

//         $('#serviceGrid').data("kendoExtGrid").dataSource.data(objJson.resource);

        if(objJson.result == 'OK') {
            $('#serviceGrid').data("kendoExtGrid").dataSource.data(objJson.resource);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }

    }


    $("#btnSyncService").kendoButton({
        click:function(e) {
            var params = {};

            params["mesgCd"]      = '30004';       //
            params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
            params["reqBodyNeed"] = 'Y';

            var grid = $('#serviceGrid').data("kendoExtGrid");
            var dataItem = grid.dataItem(grid.select());

            if(dataItem == null) {
                dms.notification.info("<spring:message code='cmm.info.selectAppInfo' />");      // App정보를 선택해주세요
                return false;
            }

            if(dms.string.isEmpty($('#sDlrCdService').val())) {
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                return false;
            }

            // 진행하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            params["dlrCd"]        = $('#sDlrCdService').val();
            params["operType"]     = $('#serviceOperCmdNm').data('kendoExtDropDownList').value();
//            params["repository"]   = $('#serviceRepository').data('kendoExtDropDownList').value();
//             params["repository"]   = '<![CDATA[file:///D:\\develop\\ControlServer\\repository\\repository.xml]]>';
            params["symbolicName"] = dataItem.symbolicNm;
            params["version"]      = dataItem.bundleVerNo;
            params["targFilePathNm"] = dataItem.targFilePathNm;
            params["srcFilePathNm"]  = dataItem.srcFilePathNm;

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    alert(error);

                },
                success:function(jqXHR, textStatus) {
                    postSyncService(jqXHR, params);
                }
            });

        }
    });

    function postSyncService(jqXHR, params) {
//         alert(jqXHR);
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#serviceRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         alert(objJson.deploy[1].result);
//         alert(objJson.deploy[1].result_msg);
/*
        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#serviceResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/
        if(objJson.deploy[1].result == 'OK') {
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#serviceResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        } else if(objJson.deploy[1].result == 'NOK') {
            dms.notification.error(objJson.deploy[1].result_msg);
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#serviceResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        }

    }


    $("#btnSyncSql").kendoButton({
        click:function(e) {
            var params = {};

            params["mesgCd"]      = '30005';       //
            params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
            params["reqBodyNeed"] = 'Y';

            if(dms.string.isEmpty($('#sDlrCdSql').val())) {
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                return false;
            }

            // 진행하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            params["dlrCd"]        = $('#sDlrCdSql').val();
            params["sql"]          = $('#sqlCommand').val();

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    alert(error);

                },
                success:function(jqXHR, textStatus) {
                    postSyncSql(jqXHR, params);
                }
            });

        }
    });

    function postSyncSql(jqXHR, params) {
//         alert(jqXHR);
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#sqlRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         alert(objJson.deploy[1].result);
//         alert(objJson.deploy[1].result_msg);
/*
        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#sqlResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/
        if(objJson.deploy[1].result == 'OK') {
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#sqlResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        } else if(objJson.deploy[1].result == 'NOK') {
            dms.notification.error(objJson.deploy[1].result_msg);
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#sqlResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }

    }



    $("#btnSyncFile").kendoButton({
        click:function(e) {
            var params = {};

            params["mesgCd"]      = '30009';       // Immediately File Deploy Request Sync Message
            params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
            params["reqBodyNeed"] = 'Y';

            if(dms.string.isEmpty($('#sDlrCdFile').val())) {
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                return false;
            }

            // 진행하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            params["dlrCd"]        = $('#sDlrCdFile').val();
            params["srcFileUrl"]   = $('#srcFileUrl').val();
            params["trgtFilePath"] = $('#trgtFilePath').val();

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    alert(error);

                },
                success:function(jqXHR, textStatus) {
                    postSyncFile(jqXHR, params);
                }
            });

        }
    });

    function postSyncFile(jqXHR, params) {
//         alert(jqXHR);
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#fileRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         alert(objJson.deploy[1].result);
//         alert(objJson.deploy[1].result_msg);
/*
        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#fileResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/

        if(objJson.deploy[1].result == 'OK') {
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#fileResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        } else if(objJson.deploy[1].result == 'NOK') {
            dms.notification.error(objJson.deploy[1].result_msg);
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#fileResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }

    }



    // PROPERTY 파일타입명
    $("#fileType").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:prtyFileTpList
        ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });


    $("#btnSyncProperty").kendoButton({
        click:function(e) {
            var params = {};

            params["mesgCd"]      = '30006';       // Immediately Property Deploy Request Sync Message
            params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
            params["reqBodyNeed"] = 'Y';

            if(dms.string.isEmpty($('#sDlrCdProperty').val())) {
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                return false;
            }

            // 진행하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            params["dlrCd"]            = $('#sDlrCdProperty').val();
            params["propertyFilePath"] = $('#propertyFilePath').val();
            params["keyNm"]            = $('#keyNm').val();
            params["keyVal"]           = $('#keyVal').val();
            params["fileType"]         = $('#fileType').data('kendoExtDropDownList').value();

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    alert(error);

                },
                success:function(jqXHR, textStatus) {
                    postSyncProperty(jqXHR, params);
                }
            });

        }
    });

    function postSyncProperty(jqXHR, params) {
//         alert(jqXHR);
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#propertyRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         alert(objJson.deploy[1].result);
//         alert(objJson.deploy[1].result_msg);
/*
        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#propertyResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/

        if(objJson.deploy[1].result == 'OK') {
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#propertyResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        } else if(objJson.deploy[1].result == 'NOK') {
            dms.notification.error(objJson.deploy[1].result_msg);
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#propertyResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }

    }

    // repository 작업명령어명
//     $("#repositoryOperCmdNm").kendoExtDropDownList({
//         dataTextField :"cmmCdNm"
//        ,dataValueField:"cmmCd"
//        ,dataSource:repositoryOperCmdTpList
//        ,optionLabel:{cmmCdNm:'', cmmCd:''}
//     });

//     $("#repository").kendoExtDropDownList({
//         dataTextField :"cmmCdNm"
//        ,dataValueField:"cmmCd"
//        ,dataSource:repositoryList
//     });

//     $("#repository").on("change", function() {
//         displayRepository();
//     });

//     function displayRepository() {
//         $("#repoUrlNm").val( $("#repository").data('kendoExtDropDownList').value() );
//     }


    /* $("#btnSyncRepository").kendoButton({
        click:function(e) {
            var params = {};

            params["mesgCd"]      = '30012';       // DMS Deploy Server Repository Deploy
            params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
            params["reqBodyNeed"] = 'Y';

            if(dms.string.isEmpty($('#sDlrCdRepository').val())) {
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                return false;
            }

            // 진행하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            params["dlrCd"]        = $('#sDlrCdRepository').val();
            params["operCmdNm"]     = $('#repositoryOperCmdNm').data('kendoExtDropDownList').value();
            params["repository"]   = $('#repository').data('kendoExtDropDownList').value();

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    alert(error);

                },
                success:function(jqXHR, textStatus) {
                    postSyncRepository(jqXHR, params);
                }
            });

        }
    }); */

    /* function postSyncRepository(jqXHR, params) {
//         alert(jqXHR);
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#repositoryRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         alert(objJson.deploy[1].result);
//         alert(objJson.deploy[1].result_msg);
/*
        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#repositoryResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/
/*       if(objJson.deploy[1].result == 'OK') {
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#repositoryResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        } else if(objJson.deploy[1].result == 'NOK') {
            dms.notification.error(objJson.deploy[1].result_msg);
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#repositoryResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }

    } */






    $("#btnSyncCommand").kendoButton({
        click:function(e) {
            var params = {};

            params["mesgCd"]      = '30013';       // DMS Deploy Server Command Deploy
            params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
            params["reqBodyNeed"] = 'Y';

            if(dms.string.isEmpty($('#sDlrCdCommand').val())) {
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                return false;
            }

            // 진행하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            params["dlrCd"             ] = $('#sDlrCdCommand'             ).val();
            params["operCmdNm"         ] = $('#commandOperCmdNm'          ).val();
            params["operDirNm"         ] = $('#commandOperDirNm'          ).val();
            params["operCmdEnvCont"    ] = $('#commandOperCmdEnvCont'     ).val();
            params["successDecisionStr"] = $('#commandSuccessDecisionStr' ).val();
            params["failDecisionStr"   ] = $('#commandFailDecisionStr'    ).val();

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    alert(error);

                },
                success:function(jqXHR, textStatus) {
                    postSyncCommand(jqXHR, params);
                }
            });

        }
    });

    function postSyncCommand(jqXHR, params) {
//         alert(jqXHR);
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#commandRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

//         alert(objJson.deploy[1].result);
//         alert(objJson.deploy[1].result_msg);
/*
        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#commandResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/

        if(objJson.deploy[1].result == 'OK') {
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#commandResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);

        } else if(objJson.deploy[1].result == 'NOK') {
            dms.notification.error(objJson.deploy[1].result_msg);
            var reponseMessage = "";
            reponseMessage += "<spring:message code='cmm.info.result' />:" + objJson.deploy[1].result;
            reponseMessage += "\n\n";
            reponseMessage += "<spring:message code='cmm.info.resultMsg' />:\n" + objJson.deploy[1].result_msg;

            $("#commandResponseXml").val(reponseMessage);
            $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }

    }



//     searchService();
//     displayRepository();


});





</script>








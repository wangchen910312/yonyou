<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- <style>
*{
-webkit-touch-callout : none;
-webkit-user-select : none;
}
</style> -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- content -->
<section id="content">
    <!-- content_popup -->
    <section class="lay_pop full_screen" id="lay_01">
        <div class="lay_title">
            <h1><spring:message code='global.title.scIdAssign' /></h1>
            <div class="btnClose">
                <span class="sbtn" onclick="layerClose('.lay_pop')"><spring:message code='global.btn.close' /></span>
            </div>
        </div>
        <div class="lay_cont4 scrollbox">
            <div class="content_title"></div>
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:35%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.handler' /><!-- 조작인 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" value="${userNm}"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.prsNm' /></th><!-- 담당자 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sMngScIdPopup"/>
                                </div>
                            </td>
                        </tr>
                        <tr class="trPassword">
                            <th scope="row"><spring:message code='global.lbl.usrPw' /><!--비밀번호 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="password" id="usrPw" value="">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="con_btnarea btncount2">
                <dms:access viewId="VIEW-D-12752" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" onclick="layerClose('.lay_pop')"><spring:message code='global.lbl.cancel' /><!-- 취소 --></span></div>
                </dms:access>
                <dms:access viewId="VIEW-D-12751" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btnAssign"><spring:message code='global.btn.assign' /><!-- 배정 分配--></span></div>
                </dms:access>
            </div>
        </div>
    </section>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.title.salesOpptSearchCondition" /><!-- 판매기회 조회조건  --></h2>
        </div>
       <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sCustNm" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 이동전화-->
                            <td>
                                <div class="f_text">
                                    <input type="text" class="numberic" id="sHpNo" class="numberic" maxlength="11" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.prsNm' /></th><!-- 담당자 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sMngScId" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.infoType' /></th><!-- 리드유형 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sInfoTpList" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.approchLocation' /></th><!-- 정보경로 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sInfoPathCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.leadStat' /></th><!-- 리드상태 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sLeadStatCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><span id ="submitDt"><spring:message code='crm.lbl.submitDt' /></span></th><!-- 등록일 -->
                            <td class="f_term">
                                <div class="f_item01 " style = "width:82%">
                                    <input type="search" id="sRegDtFrom" value="" data-json-obj="true" style="width:150px"  />
                                    <%-- <img src="<c:url value='/resources/img/mob/btn_skeydelete.png' />" class="btn_skeydelete" /> --%>
                                    <span class="date" onclick="calpicker('sRegDtFrom')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01 " style = "width:82%">
                                    <input type="search" id="sRegDtTo" value="" data-json-obj="true" style="width:150px"  />
                                    <span class="date" onclick="calpicker('sRegDtTo')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.intentionCarline' /></th><!-- 의향차종 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sIntrCarlineCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.intentionVariant' /></th><!-- 의향차관 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sIntrFscpModtpCd" data-json-obj="true" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.activeGrade' /></th><!-- 추적등급 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sTraceGradeCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr id = "sNewDtRow">
                            <th scope="row"><span id ="newDt"><spring:message code='global.lbl.newRegDt' /></span></th><!-- 신규날짜 -->
                            <td class="f_term">
                                <div class="f_item01 " style = "width:82%">
                                    <input type="search" id="sNewDtFrom" value="" data-json-obj="true" style="width:150px"  />
                                    <%-- <img src="<c:url value='/resources/img/mob/btn_skeydelete.png' />" class="btn_skeydelete" /> --%>
                                    <span class="date" onclick="calpicker('sNewDtFrom')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01 " style = "width:82%">
                                    <input type="search" id="sNewDtTo" value="" data-json-obj="true" style="width:150px"  />
                                    <span class="date" onclick="calpicker('sNewDtTo')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12750" hasPermission="${dms:getPermissionMask('READ')}">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
    </section>
    <!-- //content_seach -->



    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.menu.opportunityMng" /><!-- 판매기회관리 --></h2>
            <div class="title_btn">
                <dms:access viewId="VIEW-D-12749" hasPermission="${dms:getPermissionMask('READ')}">
                <span class="tbtn" id="btnAdd"><spring:message code="global.btn.add" /><!-- 추가 --></span>
                </dms:access>
            </div>
        </div>

        <div class="tabarea2 removeArea_ifr">
            <ul class="tabmenu tabmenu_v1">
            <dms:access viewId="VIEW-D-12748" hasPermission="${dms:getPermissionMask('READ')}">
                <li id="btnStep00" name="btnStepClick" param="btnStep00" ><span><spring:message code='crm.lbl.displayAll' /><!-- 전부표시 全部显示--></span></li>
            </dms:access>
            </ul>
            <ul class="tabmenu">
                <dms:access viewId="VIEW-D-12747" hasPermission="${dms:getPermissionMask('READ')}">
                    <li id="btnStep01" name="btnStepClick" class="on"><span  param="btnStep01" ><spring:message code='crm.lbl.uploadAdd' /><!-- 업로드|집객 --></span></li>
                </dms:access>
                <dms:access viewId="VIEW-D-12746" hasPermission="${dms:getPermissionMask('READ')}">
                    <li id="btnStep02" name="btnStepClick"><span  param="btnStep02" ><spring:message code='crm.lbl.activeAppointment' /><!-- 추출|예약 --></span></li>
                </dms:access>
                <dms:access viewId="VIEW-D-12745" hasPermission="${dms:getPermissionMask('READ')}">
                    <li id="btnStep03" name="btnStepClick"><span  param="btnStep03" ><spring:message code='crm.lbl.visitCounsel' /><!-- 방문|면담 到店|洽谈 --></span></li>
                </dms:access>
                <dms:access viewId="VIEW-D-12744" hasPermission="${dms:getPermissionMask('READ')}">
                    <li id="btnStep04" name="btnStepClick"sLeadStatCd><span  param="btnStep04" ><spring:message code='crm.lbl.activeProcessing' /><!-- 추적|추진  跟踪|促成 --></span></li>
                </dms:access>
            </ul>
            <ul class="tabmenu tabmenu_v1">
            <dms:access viewId="VIEW-D-12743" hasPermission="${dms:getPermissionMask('READ')}">
                <li id="btnStep99" name="btnStepClick"><span  param="btnStep99"><spring:message code='crm.lbl.visitCustMng' /><!-- 전시장 흐름 展厅流量 --></span></li>
            </dms:access>
            </ul>
        </div>

        <div class="listarea" id="salesOpptProgGrid">
            <div id="listhead" class="listhead dlistitem">
                <!--<span class="check">
                    <input type="checkbox" id="check01" name="check01" class="f_check" /><label for="check01"></label>
                </span> -->
                <span style="width:30%"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></span>
                <span style="width:40%"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span>
                <span style="width:30%"><spring:message code='global.lbl.hpNo' /><!-- 전화번호 --></span>
                <span class="clboth" style="width:30%"><spring:message code='crm.lbl.infoType' /><!-- 리드유형 --></span>
                <span style="width:40%"><spring:message code='crm.lbl.validCheck' /><!-- 유효성판단--></span>
                <span style="width:30%"><spring:message code='crm.lbl.activeGrade' /><!-- 추적등급 --></span>
            </div>
            <iframe src="" id="mainList" name="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="checkitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>

        <div class="listarea" id="salesOpptShowRoomGrid" style="display:none">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code='crm.lbl.visitDt' /><!-- 방문시간 --></span>
                <span style="width:50%"><spring:message code='par.lbl.custNm' /><!-- 고객명 --></span>
                <span style="width:50%" class="clboth"><spring:message code='crm.lbl.goOutTime' /><!-- 떠난시간 --></span>
                <span style="width:50%"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></span>
                <!--  <span style="width:100%"><spring:message code='crm.lbl.traceDt' /></span>--><!-- 추적시간 -->
            </div>
            <iframe src="" id="salesOpptShowRoomGrid" name="salesOpptShowRoomGrid" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="checkitem bgNone" style="display:none;" id="listarea_noData9"><span></span></div>

        </div>
        <div class="btnfixed txtarea">
                <div class="dlistitem bgNone" style="text-align: left;">
                    <span style="width:25%"><spring:message code='crm.lbl.visitingCustCnt' />:<!-- 매장내수 --></span>
                    <span style="width:10%" id="visitingCustCnt"></span>
                    <span style="width:20%"><spring:message code='crm.lbl.visitLeaveCnt' />:<!-- 떠난수 --></span>
                    <span style="width:10%" id="visitLeaveCnt"></span>
                    <span style="width:20%"><spring:message code='crm.lbl.total' />:<!-- 총수 --></span>
                    <span style="width:10%" id="totalSum"></span>
                </div>
        </div>

        <div class="btnfixed btnarea">
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12742" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btnOpenAssign"><spring:message code='global.btn.assign' /><!-- 배정 分配--></span></div>
                </dms:access>
            </div>
        </div>
    </section>
    <!-- //content_list -->


    <!-- content_detail -->
    <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h1><spring:message code='global.lbl.salesOpptDetlInfo' /><!-- 판매기회 상세정보    --></h1>
                    <div class="title_btn">
                    <dms:access viewId="VIEW-D-12741" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="tbtn" id="addActive"><spring:message code="mob.crm.lbl.trace" /><!-- 추적 --></span>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12740" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="tbtn" id="btnUpdate"><spring:message code="par.btn.update" /><!-- 수정 --></span>
                    </dms:access>
                    </div>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea1" >
                        <table class="flist01">
                            <caption><spring:message code='global.lbl.salesOpptDetlInfo' /><!-- 판매기회 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody  >
                                <tr id="trLeadStat">
                                    <th scope="row"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></th>
                                    <td>
                                        <div class="tabarea2 tabarea2_v2">
                                            <ul class="tabmenu">
                                                <li id="leadStatPrevProcess"><span>◁</span></li>
                                                <li id="leadStatFail" class="child2"><span><spring:message code='crm.btn.trans' /></span></li><!--전출  -->
                                                <li class="child3 on"><span id="leadStatNow"><spring:message code='crm.lbl.visitCounsel' /></span></li><!-- 방문|면담 -->
                                                <li id="leadStatNextProcess"><span>▷</span></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="trCustNmC">
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="custNm" name="custNm" data-json-obj="true" disabled="disabled" />
                                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code='crm.lbl.corpPurcMng' /><!-- 구매담당자명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="relCustNm" name="relCustNm" data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 이동전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic" id="relCustHpNo" name="relCustHpNo" data-json-obj="true" disabled="disabled" style="width: 55%"/><img src="<c:url value='/resources/img/mob/btn_popphone2.png' />" style="width: 40%" usemap="#001" class="mapImg">
                                            <map name="001">
                                                <dms:access viewId="VIEW-D-12739" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="0,0,38,38" href="#" id="mapTelc" class="mapTel" />
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12738" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="44,0,82,38" id="mapSMS" />
                                                </dms:access>
                                            </map>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic" id="hpNo" name="hpNo" data-json-obj="true" disabled="disabled" style="width: 55%"/><img src="<c:url value='/resources/img/mob/btn_popphone2.png' />" style="width: 40%" usemap="#001" class="mapImg">
                                            <map name="001">
                                                <dms:access viewId="VIEW-D-12737" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="0,0,38,38" href="#" id="mapTel" class="mapTel" />
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12736" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="44,0,82,38" id="mapSMS" />
                                                </dms:access>
                                            </map>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" ><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mathDocTp" name="mathDocTp" data-json-obj="true" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                                    <td>
                                        <div class="f_text"><input id="ssnCrnNoC" type="text" value="" class="form_input numberandalpha"  disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="bizcondCdC" data-json-obj="true" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionCarline' /><!-- 의향차종 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intrCarlineNm" name="intrCarlineNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.submitDt' /><!-- 제출일 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="submitDtFormat" name="submitDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <th scope="row"><spring:message code='crm.lbl.infoType' /><!-- 리드유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="infoTpNm" name="infoTpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="infoTp" name="infoTp"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.bhmcLeadyn' /></th><!-- BHMC 리드 여부 -->

                                    <td>
                                        <div class="form_left" style="width:16%">
                                            <input  id="bhmcYn" name="bhmcYn" type="checkbox" class="f_check" onClick="return false;"/><label for="bhmcYn"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.leadSrc' /><!-- 리드출처 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <!-- <input type="text" id="infoPathNm" name="infoPathNm"  data-json-obj="true" disabled="disabled"/> -->
                                            <input type="text" id="holdTpNm" name="holdTpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="holdTp" name="holdTp"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="holdDetlTpSeq" name="holdDetlTpSeq"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.validCheck' /><!-- 유효성판단 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="validGradeNm" name="validGradeNm" data-json-obj="true" disabled="disabled" >
                                            <input type="hidden" id="validGradeCd" name="validGradeCd">
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sex' /><!-- 성별 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="sexNm" name="sexNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custTp' /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="custTpNm" name="custTpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="custTp" name="custTp"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.prsNm' /><!-- 책임자 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="mngScId" name="mngScId"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 유선전화 --></th>
                                    <td>
                                        <div class="f_text"><input id="officeTelNoC" type="number" class="form_input numberic"  data-type="tel" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code='global.lbl.telNo' /><!-- 집전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic" id="telNo" name="telNo"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionVariant' /><!-- 의향차관 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intrFscpModtpNm" name="intrFscpModtpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="intrFscpModtpCd" name="intrFscpModtpCd"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향색상 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intrColorNm" name="intrColorNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.wechat' /><!-- 위쳇 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="wechatId" name="wechatId"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.visitAppointDt' /><!-- 방문예약시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitResvDt" name="vsitResvDt"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.visitDt' /><!-- 방문시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitDt" name="vsitDt" data-json-obj="true" disabled="disabled"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.visitCount' /><!-- 방문인원수 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitPrsnCnt" name="vsitPrsnCnt" data-json-obj="true" disabled="disabled"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.revisitYn' /><!-- 재방문여부 --></th>
                                    <td>
                                         <div class="f_text f_disabled">
                                            <input type="text" id="rvsitYn" name="rvsitYn" data-json-obj="true" disabled="disabled"  >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.tdrvYn' /><!-- 시승여부 --></th>
                                    <td>
                                         <div class="f_text f_disabled">
                                            <input type="text" id="testDrvYn" name="testDrvYn" data-json-obj="true" disabled="disabled"  >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.goOutTime' /><!-- 떠난시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitEndDt" name="vsitEndDt" data-json-obj="true" disabled="disabled"  >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.payMethod' /><!-- 지불방식 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="payTpNm" name="payTpNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expcPurcDateTime' /><!-- 예상구매시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcPurcHmNm" name="expcPurcHmNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.plateNum' /><!-- 현지번호판예정 --></th>
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left" style="width:16%" >
                                                <input id="localCarRegNoYn" name="localCarRegNoYn" type="checkbox" class="f_check" onClick="return false;"/><label for="localCarRegNoYn"></label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.estimateInfo' /><!-- 견정정보 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input id="estimateCont" type="text" name="estimateCont" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.promotionCont' /><!-- 판촉내용 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="salesCont" name="salesCont" data-json-obj="true" disabled="disabled" >
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.activeGrade' /><!-- 추적등급 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="traceGradeNm" name="traceGradeNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.invalidReason' /><!-- 무효원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="hidden" id="invalidCauCd" name="invalidCauNm" >
                                            <input type="text" id="invalidCauNm" name="invalidCauNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.failReason' /><!-- 전패원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="failCauNm" name="failCauNm" data-json-obj="true" disabled="disabled" >
                                            <input type="hidden" id="failCauCd" name="failCauCd" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.failReasonAly' /><!-- 전패원인분석 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="failCauReasonCont" name="failCauReasonCont" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.purchaSelCarline' /><!-- 구매선택차종 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="purcSelCarlineNm" name="purcSelCarlineNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.purchaSelVariant' /><!-- 구매선택차관 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="purcFscpModtpNm" name="purcFscpModtpNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expcPurcDt' /><!-- 예상구매일 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcPurcDt" name="expcPurcDt" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expcBpPrice' /><!-- 예상거래가격 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcDealPrc" name="expcDealPrc" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>

                                <!-- 추적시간 -->
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.traceDt' /><!-- 추적시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="traceDtFormat" name="traceDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <!-- 다음추적시간 -->
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.nextTraceDt' /><!-- 다음추적시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="nextTraceDtFormat" name="nextTraceDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <!-- 신규날짜 -->
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.newRegDt' /><!-- 신규날짜--></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="regDtFormat" name="regDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.remark' /><!-- 비고설명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="remark" name="remark" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>

                                <!-- 수정일 -->
                                <%-- <tr>
                                    <th scope="row"><spring:message code='global.lbl.updtDt' /><!-- 수정일 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="updtDtFormat" name="updtDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr> --%>
                            </tbody>
                        </table>

                        <input type="hidden" id="seq" name="seq" data-json-obj="true" />
                        <iframe id="addressList" class="addressList" border="0" frameborder="0" style="display:none;"></iframe>
                    </div>

                </div>
            </div>
            <!-- 버튼 set -->
            <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12753" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btnClose"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </dms:access>
            </div>

            <input type="hidden" id="leadStatCd" value="" />
            <input type="hidden" id="custMngScId" value="" />

            <!-- <input type="hidden" id="emailNm" value="" />
            <input type="hidden" id="intrCarlineCd" value="" />
            <input type="hidden" id="intrColorCd" value="" />
            <input type="hidden" id="intrModelCd" value="" />
            <input type="hidden" id="payTp" value="" />
            <input type="hidden" id="sexCd" value="" />
            <input type="hidden" id="trsfTp" value="" />
            <input type="hidden" id="exhvFlakSeq" value="" /> -->


        </section>

        <!-- <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
                    <input type="hidden" id="btnCustSearch" />
                    <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
                    <input type="hidden" id="custSearch" name="custSearch"  class="custSearch" />
                    <input type="hidden" id="exhvFlakSeq" name="exhvFlakSeq"  data-json-obj="true" />
                    <input type="hidden" id="onDutyYn" value="Y" /> -->
    </div>
    <!-- content_detail -->

</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>



<script type="text/javascript">
<!--

var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var toDt    = "${toDt}";
var fromDt    = "${fromDt}";
var fromDtNow = "${fromDtNow}";
var mngScIdCtrl = "${mngScIdCtrl}";

var pageMode = "insert"; //update

var fromTodoCustNo = "${custNo}";
var fromTodoLeadStatCd = "${leadStatCd}";
var salesOpptPwYn = "${salesOpptPwYn}";

var selectedItem = null;

var addrTpList = [];
var addrTpMap = [];
var chgBuyYnDS = [];
var chgBuyYnMap = [];
var carlineCdList = [];
var carlineCdMap = [];
var mngScIdList = [];
var mngScIdMap = [];
var infoPathCdList = [];
var infoPathCdMap = [];

var leadStatCdList = [];
var leadStatCdMap = [];
var modelCdList = [];
var modelCdMap = [];
var activeGradeCdList = [];
var activeGradeCdMap = [];

var infoTpList = [];

var rvsitYnMap = [];

var newCustPopupWindow;



var bizcondCdList   = [];
var mathDocTpList = [];

var saveList      = [],
userList      = [],
chkRow,
saveData;
var listCnt = 0;

var btnLeadStatCd="";
var cSeq="";


/*scanInfo*/
var scanCustNm="";
var scanDepartment="";
var scanCompany="";
var scanEmail="";
var scanZipCode="";
var scanHomepage="";
var scanFax="";
var scanCellPhone="";
var scanAddress="";
var scanPhone="";
var scanSex="";
var scanEthnicity="";
var scanDateofBirth="";
var scanDomicile="";
var scanIdentificationNumber="";
var scanDirverNumber="";

var leadFlag ="";

var btnStage="";

var gv_leadStatCd="";


<c:forEach var="obj" items="${mathDocTpList}">
   //<c:if test="${obj.remark1 == 'C'}">
       mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   //</c:if>
</c:forEach>

<c:forEach var="obj" items="${bizcondCdList}">
   bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${infoTpList}">
infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${leadStatCdList}">
<c:if test="${obj.cmmCd != '08' && obj.cmmCd != '09'}" >
    leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:if>
</c:forEach>

/*     <c:forEach var="obj" items="${modelCdList}">
    modelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    modelCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach> */

<c:forEach var="obj" items="${activeGradeCdList}">
    activeGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${infoPathCdList}">
    infoPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    infoPathCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${mngScIdList}">
    mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    mngScIdMap["${obj.usrId}"] = "${obj.usrNm}";
</c:forEach>

chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

<c:forEach var="obj" items="${addrTpList}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종조회
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

var usersRoleCrmR02 = [];
var usersRoleCrmR03 = [];
var usersRoleCrmR17 = [];
var usersRoleCrmR18 = [];

<c:forEach var="obj" items="${usersRoleCrmR02}">
    usersRoleCrmR02.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

<c:forEach var="obj" items="${usersRoleCrmR03}">
    usersRoleCrmR03.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

<c:forEach var="obj" items="${usersRoleCrmR17}">
    usersRoleCrmR17.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

<c:forEach var="obj" items="${usersRoleCrmR18}">
    usersRoleCrmR18.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

<c:forEach var="obj" items="${rvsitYnList}">
    rvsitYnMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    $("#btnAdd").hide();

    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location='bhmccp://SELECT?TABLE_NM=Lead_info&return_func=setItemList';
            //alert("A");
        }else
        {
            window.bhmccp.SELECT('Lead_info',"",'setItemList');
        }
    }catch(e){

    }

    //$("#btnStep00 > span").css("color","#303030");
    //$("#btnStep99 > span").css("color","#303030");

      $(".tabmenu").find("li[name^='btnStepClick']").click(function(){
        var btnStep = this.id;
        var leadStatCd = btnStep.substring(btnStep.length-2,btnStep.length);

        $("#sLeadStatCd").data("kendoExtDropDownList").value(leadStatCd);
        $("#leadStatCd").val(leadStatCd);

        $("[id^='btnStep']").attr("class", "");
        $("#"+btnStep).attr("class", "on");
        $("[id^=btnCtl]").hide();
        $("[class*="+btnStep+"]").show();

        $("#btnStep00 > span").css("background-color","#b4b6bc");
        $("#btnStep00 > span").css("border-color","#b4b6bc");
        $("#btnStep99 > span").css("background-color","#b4b6bc");
        $("#btnStep99 > span").css("border-color","#b4b6bc");

        btnLeadStatCd = leadStatCd;

        btnStage = btnStep;

        if (btnStep == "btnStep02" || btnStep == "btnStep03" || btnStep == "btnStep04"  ) {
            $("#btnAdd").hide();
            $("#sLeadStatCd").data("kendoExtDropDownList").enable(false);
            //$("#btnStep00 > span").css("color","#303030");

            $("#listhead").removeClass('checkitem');
            /* $("#listhead").addClass('deleteitem'); */
        }else if(btnStep == "btnStep00"){
            $("#sLeadStatCd").data("kendoExtDropDownList").enable(true);
            //$("#btnStep00 > span").css("color","#fff");
            $("#btnStep00 > span").css("background-color","#0052a6");
            $("#btnStep00 > span").css("border-color","#0052a6");
            $("#btnStep99 > span").css("background-color","#b4b6bc");
            $("#btnStep99 > span").css("border-color","#b4b6bc");
            //$("#btnStep99 > span").css("color","#303030");

            $("#btnAdd").hide();

            $("#listhead").removeClass('checkitem');
            /* $("#listhead").addClass('deleteitem') */
        }else if(btnStep == "btnStep01"){
            $("#btnAdd").show();

            /* $("#listhead").removeClass('deleteitem'); */
            $("#listhead").addClass('checkitem');
        }else{
            $("#sLeadStatCd").data("kendoExtDropDownList").enable(false);
            $("#btnAdd").show();
            $("#btnStep00 > span").css("border-color","#b4b6bc");
            $("#btnStep99 > span").css("background-color","#0052a6");
            $("#btnStep99 > span").css("border-color","#0052a6");
        }

     // 검색조건 책임자 변경
        if ( btnStep == "btnStep01"|| btnStep == "btnStep02" ) {
            $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
        } else if ( btnStep == "btnStep03"
            || btnStep == "btnStep04" ) {
            $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
        } else if ( btnStep == "btnStep99" ) {
            $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
        } else {
            $("#sMngScId").data("kendoExtDropDownList").setDataSource(mngScIdList);
        }

        if(btnStep == "btnStep99"){
            $("#submitDt").text("<spring:message code='crm.lbl.visitDate' />");
            $("#sRegDtFrom").val(chgServerDate2Str(fromDtNow));
            $("#sRegDtTo").val(chgServerDate2Str(toDt));

            $("#sNewDtRow").hide();
            $(".txtarea").show();
        }else{
            $("#submitDt").text("<spring:message code='crm.lbl.submitDt' />");
            $("#sRegDtFrom").val(chgServerDate2Str(fromDt));
            $("#sRegDtTo").val(chgServerDate2Str(toDt));

            $("#sNewDtRow").show();
            $(".txtarea").hide();
        }

        mob.loading.show();
        if (btnStep == "btnStep99") {
            //전시장판매
            $("#salesOpptProgGrid").hide();
            $("#salesOpptShowRoomGrid").show();
            //$("#btnStep00 > span").css("color","#303030");
            //$("#btnStep99 > span").css("color","#fff");

            //리드상태
            $("#trLeadStat").hide();

            //그리드 아이디 변경
            $("#salesOpptProgGrid").find("iframe").prop("id","mainList2");
            $("#salesOpptProgGrid").find("iframe").prop("name","mainList2");
            $("#salesOpptShowRoomGrid").find("iframe").prop("id","mainList");
            $("#salesOpptShowRoomGrid").find("iframe").prop("name","mainList");

            $("#mainList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomList.do' />");

            $("#leadStatCd").val("99");

        } else {
            $("#salesOpptProgGrid").show();
            $("#salesOpptShowRoomGrid").hide();

            //리드상태
            $("#trLeadStat").show();

            //그리드 아이디 변경
            $("#salesOpptProgGrid").find("iframe").prop("id","mainList");
            $("#salesOpptProgGrid").find("iframe").prop("name","mainList");
            $("#salesOpptShowRoomGrid").find("iframe").prop("id","mainList2");
            $("#salesOpptShowRoomGrid").find("iframe").prop("name","mainList2");

            $("#mainList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtList.do?btnLeadStatCd="+btnLeadStatCd+"' />");
            //  $("#btnCtlSearch").click();
        }

        //setSearchBox();
        if (btnStep == "btnStep01"){
            $(".btnarea").show();
            //$("#btnOpenAssign").data("kendoButton").enable(true);
        }else{
            $(".btnarea").hide();
            //$("#btnOpenAssign").data("kendoButton").enable(false);
        }
        setMainListHeight();
    });

    $("#sMngScId").kendoExtDropDownList({
        dataTextField:"usrNm"
       ,dataValueField:"usrId"
       ,dataSource:mngScIdList
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
       /* , filter:"contains"
       ,filtering:function(e){
           var filter = e.filter;
       } */
    });
    $("#sMngScIdPopup").kendoExtDropDownList({
        dataTextField:"usrNm"
       ,dataValueField:"usrId"
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
       ,dataSource:mngScIdList
       //,optionLabel:"<spring:message code='global.lbl.check'/>"
       , index:0
    });

    $("#sInfoPathCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:dms.data.cmmCdFilter(infoPathCdList)
        , index:0
         //, filter:"contains"
        , filtering:function(e){
            var filter = e.filter;
        }
    });

    $("#sLeadStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
        , dataSource:dms.data.cmmCdFilter(leadStatCdList)
        , index:0
    });
    $("#sLeadStatCd").data("kendoExtDropDownList").enable(false);

    /* $("#sBhmcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
        , dataSource:chgBuyYnDS
        , index:0
    }); */

    $("#sTraceGradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
        , dataSource:dms.data.cmmCdFilter(activeGradeCdList)
        //, index:0
    });

    $("#mathDocTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:mathDocTpList
        , index:0
        , enable:true
    });

    $("#bizcondCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:dms.data.cmmCdFilter(bizcondCdList)
        , index:0
        , enable:true
    });

    $("#sInfoTpList").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:infoTpList
        , index:0
        , enable:true
    });
/*
    $("#sRegDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }); */

    /**
     * 차종 콤보박스
     */
    $("#sIntrCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carlineCdList
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
       /* ,filter:"contains"
       ,filtering:function(e){
           var filter = e.filter;
       }  */
       ,select:onSelectSearchCarlineCd
    });

    /**
     * 모델 콤보박스
     */
     $("#sIntrFscpModtpCd").kendoExtDropDownList({
         dataTextField:"fscNm"
        ,dataValueField:"fscCd"
        //,filter:"contains"
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
     });
     $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(false);

     // 조회
     $("#btnCtlSearch").kendoButton({
         click:function(e) {
             $("#listarea_noData").hide();
             mob.loading.show();
             contentList();

         //    $("#salesOpptProgGrid").data("kendoExtGrid").dataSource.read();
         }
     });

     // 숫자
     var onlyNum = new RegExp("[^0-9]","i");
     $(".numberic").keyup(function(e)
     {
         var content = $(this).val();
         if(content.match(onlyNum)){
             $(this).val('');
         }
     });

     /********************************************************************************************************************************************************/

    // 타이틀
     $("#header_title").html("<spring:message code='crm.menu.opportunityMng' />"); //판매기회관리
     //$("#header_title").on("click", contentSearch);
     $("#header_title").on("click", moveSearch);
     $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

     // 목록 조회
     $("#btnStep00").click();

     var sStartRegDt = $("#sRegDtFrom");
     var sEndRegDt = $("#sRegDtTo");
     //if(sStartRegDt.val() != "" || sEndRegDt.val() != "") $("#search7Area span[name='searchStr']").html(sStartRegDt.val() + " ~</br> " + sEndRegDt.val());
     // if(sStartRegDt.val() != "" || sEndRegDt.val() != "") $("#search7Area span[name='searchStr']").text(sStartRegDt.val() + " ~ " + sEndRegDt.val());
     //setSearchBox();

     $("#mainList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtList.do?btnLeadStatCd="+btnLeadStatCd+"' />");


     // 버튼 - 조회
     $("#btnSearch").kendoButton({
         click:function(e) {


             var sCustNm     = $("#sCustNm").val();
             var sHpNo      = $("#sHpNo").val();
             var sMngScId      = $("#sMngScId").data("kendoExtDropDownList").value();
             var sInfoTpList       =$("#sInfoTpList").data("kendoExtDropDownList").value();
             var sInfoPathCd      = $("#sInfoPathCd").data("kendoExtDropDownList").value();
             var sLeadStatCd      = $("#sLeadStatCd").data("kendoExtDropDownList").value();
             /* var sBhmcYn      = $("#sBhmcYn").val(); */
             var sRegDtFrom      = $("#sRegDtFrom").val();
             var sRegDtTo      = $("#sRegDtTo").val();
             var sIntrCarlineCd      = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
             var sIntrFscpModtpCd      = $("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
             var sTraceGradeCd      = $("#sTraceGradeCd").data("kendoExtDropDownList").value();




             if(sCustNm != "")          $("#search1Area span[name='searchStr']").text(sCustNm);
             if(sHpNo != "")            $("#search2Area span[name='searchStr']").text(sHpNo);
             if(sMngScId != "")         $("#search3Area span[name='searchStr']").text($("#sMngScId").data("kendoExtDropDownList").text());
             if(sInfoTpList != "")      $("#search4Area span[name='searchStr']").text($("#sInfoTpList").data("kendoExtDropDownList").text());
             if(sInfoPathCd != "")      $("#search4Area span[name='searchStr']").text($("#sInfoPathCd").data("kendoExtDropDownList").text());
             if(sLeadStatCd != "")      $("#search5Area span[name='searchStr']").text($("#sLeadStatCd").data("kendoExtDropDownList").text());
             /* if(sBhmcYn != "")          $("#search6Area span[name='searchStr']").text($("#sBhmcYn").data("kendoExtDropDownList").text()); */
             if(sRegDtFrom != "")       $("#search7Area span[name='searchStr']").html(sRegDtFrom +"~<br/>"+ sRegDtTo);
             if(sIntrCarlineCd != "")   $("#search8Area span[name='searchStr']").text($("#sIntrCarlineCd").data("kendoExtDropDownList").text());
             if(sIntrFscpModtpCd != "")     $("#search9Area span[name='searchStr']").text($("#sIntrFscpModtpCd").data("kendoExtDropDownList").text());
             if(sTraceGradeCd != "")    $("#search10Area span[name='searchStr']").text($("#sTraceGradeCd").data("kendoExtDropDownList").text());

             if(chgDate($("#sRegDtFrom").val()) > chgDate($("#sRegDtTo").val())){
                 mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
                 $("#sRegDtTo").val("");
                 $("#sRegDtTo").focus();
                 return false;
             }

             if(chgDate($("#sNewDtFrom").val()) > chgDate($("#sNewDtTo").val())){
                 mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
                 $("#sNewDtTo").val("");
                 $("#sNewDtTo").focus();
                 return false;
             }

             if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                     (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
             ){
                mob.notification.warning("<spring:message code='crm.lbl.submitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                return false;
             }else{
               //setSearchBox();
                 contentList();
             }

         }
     });

     //신규 버튼
     //$("#btnAdd").bind("click", contentOpenNew);

     //주소리스트
        $("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");

     // 버튼 - 이전
     $("#docu_prev").bind("click", function()
     {
         if ($("#content_list").css("display") == "block") { goMain(); }
         else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
         else if ($("#content_detail").css("display") == "block") { contentListNonRefresh();
             $("#localCarRegNoYn").prop("checked",false);
             $("#bhmcYn").prop("checked",false);
         }
     });

     //버튼 - TOP
     $("#docu_top").bind("click", function()
     {
         $("body,html").animate({scrollTop:0}, 200);
     });

     //상단으로 이동
     $(window).scroll(function () {
         if ($(this).scrollTop() != 0)
         {
             //$("#docu_top").fadeIn();
         }
         else
         {
             $("#docu_top").fadeOut();
         }
     });

     /*********************************************************************************************************************************************/

        $("#btnOpenAssign").kendoButton({
             click:function(e){


                saveList      = [];
                userList      = [];
                listCnt = 0;
                $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
                    if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){

                        var gridData = {
                                seq             :$("#mainList").contents().find("input[name='seq']")[cnt].value,
                                custNo          :$("#mainList").contents().find("input[name='custNo']")[cnt].value,
                                leadStatCd      :"02"
                        };
                        saveList.push(gridData);
                        listCnt ++;
                    }
                });

                if(listCnt>0){
                    $("#lay_01").show();
                    $("#usrPw").val("");
                }else{
                    mob.notification.warning("<spring:message code='global.lbl.saleOppt' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                }
          }
        });

     // 배정저장
         $("#btnAssign").kendoButton({
             click:function(e){

                 if (mngScIdCtrl == "N") {
                     doAssign();
                 }else{
                     if(salesOpptPwYn == "N"){
                         doAssign();
                     }else{
                         var usrPw = $("#usrPw").val();
                         if (dms.string.isEmpty(usrPw)) {
                             mob.notification.info("<spring:message code='global.lbl.usrPw' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                             return false;
                         }
                         var pwParam = {};
                         pwParam["sPassword"] = hex_sha2(usrPw);

                         $.ajax({
                             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
                             ,data:JSON.stringify(pwParam)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,error:function(jqXHR,status,error){
                                 mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                             }
                             ,success:function(result){
                                 if (result === true) {
                                     doAssign();
                                 } else {
                                     mob.notification.success("<spring:message code='global.err.invalid.idpw'/>");
                                 }
                             }
                         });
                     }
                 }

             }
             //, enable:false
         });

     //버튼- 삭제
     $("#btnDel").click(function(){
         console.log("삭제");
     });

     //버튼-닫기
     $("#btnClose").click(function(){
         console.log("닫기");
         contentListNonRefresh();
     });

     //$("#trLeadStat li:nth-child(2)").click(function (){
     $("#leadStatFail").click(function (){
         /* var tempString=$(this).attr("class");
         if(tempString.indexOf("disabled")>-1){
             return;
         }else{
             confirmOpen("<spring:message code='sal.lbl.isContinueMsg' />",'doFailSend',y,n);
         } */

         if($(this).hasClass("disabled")){
             return;
         }

          var custNo = selectedItem.custNo
             , seq = selectedItem.seq
             , leadStatCd = selectedItem.leadStatCd
             , exhvFlakSeq = selectedItem.exhvFlakSeq
             , dataTable = selectedItem.dataTable;
          var url="<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextFailSalesOpptProcessPopup.do'/>";
          var title = "";

         editCustPopupWindow = mob.window.popup({
             windowId:"selectStep04NextFailSalesOpptProcessPopup"
           , content:{
               url:url
               , data:{
                   "autoBind":true
                   , "leadStatCd":leadStatCd
                   , "custNo":custNo
                   , "salesOpptSeq":seq
                   , "callbackFunc":function(data) {
                       console.log(data);
                       if (data[0] != "") {
                           //$("#btnCtlSearch").click();
                           $("#btnSearch").click();
                       }
                   }
               }
           }
         });
     });

     if (mngScIdCtrl == "N") {
         $("#sMngScIdPopup").data("kendoExtDropDownList").value(userId);
         $("#sMngScIdPopup").data("kendoExtDropDownList").enable(false);

         $("#sMngScId").data("kendoExtDropDownList").value(userId);
         $("#sMngScId").data("kendoExtDropDownList").enable(false);

         $(".trPassword").hide();
     }

     if(salesOpptPwYn == "N"){
         $(".trPassword").hide();
     }

     if ( dms.string.isNotEmpty(fromTodoCustNo)){
         /* var btnStep = "btnStep"+leadStatCd;
         console.log("btnStep ::: " + btnStep);
         onSelectBtnStepClick(btnStep); */
         fn_popuplink();
     }else{
         if(dms.string.isNotEmpty(fromTodoLeadStatCd)){//완성차입고todo
             $("#btnStep04").click();
         }
     }

   //추적이력 추가
     $("#addActive").click(function(){
         activeAddPop();
     });

     $("#mapSMS").click(function(){
         sendSMSPopup();
     });


   //상세 - 실패
   $("#leadStatPrevProcess").click(function(){
         console.log(">>>>>> leadStatPrevProcess kjlee <<<<<<");

         var intrCarlineNm = $("#intrCarlineNm").val();

         if ( dms.string.isEmpty(intrCarlineNm) ) {
             mob.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
             return false;
         };

         if($(this).attr("class")=="disabled"){
             return;
         }

          var custNo = selectedItem.custNo
             , seq = selectedItem.seq
             , leadStatCd = selectedItem.leadStatCd
             , exhvFlakSeq = selectedItem.exhvFlakSeq
             , dataTable = selectedItem.dataTable;

            var url;
            var title = "";

            console.log("leadStatCd : "  + leadStatCd);

//             return false;

         if (leadStatCd === "03") {
             url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep03PrevSalesOpptProcessPopup.do'/>";
         }else{
             url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStepPrevSalesOpptProcessPopup.do'/>";
         }

         if (dataTable === "SHOWROOM") {  // 전시장 데이터인 경우
             //url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptShowRoomPopup.do'/>";
             //heightVal = "470";

             // 방문객은 이전 프로세스가 없습니다.
             mob.notification.info("<spring:message code='crm.info.noPrevProcessVisit' />");
             return false;
         }


         editCustPopupWindow = mob.window.popup({
             windowId:"selectEditSalesOpptProcessPopup"
           , content:{
               url:url
               , data:{
                   "autoBind":true
                   , "leadStatCd":leadStatCd
                   , "custNo":custNo
                   , "salesOpptSeq":seq
                   , "callbackFunc":function(data) {
                       console.log(data);
                       if (data[0] != "") {
                           //$("#btnCtlSearch").click();
                           $("#btnSearch").click();
                       }
                   }
               }
           }
         });
     });

 //상세 - 변경
   $("#leadStatNextProcess").click(function(){
       console.log(">>>>>> leadStatNextProcess <<<<<<");
       if($(this).parent().attr("class")=="disabled"){
           return;
       }

      // document.getElementById("intrList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;

       var custNo = selectedItem.custNo
           , seq = selectedItem.seq
           , leadStatCd = selectedItem.leadStatCd
           , exhvFlakSeq = selectedItem.exhvFlakSeq
           , dataTable = selectedItem.dataTable
           , custMngScId = $("#custMngScId").val();

          var url;
          var heightVal = "400";
          var title = "";

          if (leadStatCd === "01") {
              url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup.do'/>";
              //title = "<spring:message code='crm.lbl.activeAppointmentSend' />";    //추출|예약으로 전달
          } else if (leadStatCd === "02") {
              if($("#validGradeCd").val() != "02" ){mob.notification.info("<spring:message code='crm.info.validCheckRequired'/>");return false;}
              else {url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup.do'/>"; heightVal = "470";}
              //title = "<spring:message code='crm.btn.visitReservation' />";    //방문|면담으로 전달
          } else if (leadStatCd === "03") {
              url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup.do'/>";
              //title = "<spring:message code='crm.btn.activeProcessSend' />";    // 추적|추진으로 제출
              heightVal = "495";
          } else if (leadStatCd === "04") {
              if(dms.string.isEmpty($("#ssnCrnNoC").val())){mob.notification.show("<spring:message code='crm.info.isEmptySsnCrnNo' />","callFunc:goCustomerInfo(\""+$('#custNo').val()+"\")"); return false;}
              else{ url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptProcessPopup.do'/>";heightVal = "470";}
              //title = "<spring:message code='crm.lbl.reservationDeal' />";    // 예약 거래로 제출
          } else {
              url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
          }

          //전시장흐름
           if(dataTable === "SHOWROOM"){
               url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptShowRoomPopup.do'/>";
           }

          editCustPopupWindow = mob.window.popup({
             windowId:"selectEditSalesOpptProcessPopup"
             , content:{
                 url:url
                 , data:{
                     "autoBind":true
                     , "leadStatCd":leadStatCd
                     , "custNo":custNo
                     , "salesOpptSeq":seq
                     , "showRoomSeq":seq
                     , "exhvFlakSeq":exhvFlakSeq
                     , "custMngScId":custMngScId
                     , "callbackFunc":function(data) {
                         console.log(data);
                         $("#btnSearch").click();
                         /*if (data[0] != "") {
                             $("#btnCtlSearch").click();
                         }*/
                     }
                 }
             }
         });

   });

});
    function doFailSend(){
        console.log("btnPrevStep Call !!");
        var custNo = $("#custNo").val();
        var mngScId = $("#sMngScId").data("kendoExtDropDownList").value();
        var beforeMngScId = $("#beforeMngScId").val();
        var custTp = $("#custTp").val();

        var infoTp = $("#infoTp").val();
        var holdTp = $("#holdTp").val();

        // 고객번호
        if ( dms.string.isEmpty(custNo) ) {
            mob.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            return false;
        };

        if ( dms.string.isEmpty(infoTp) ) {
            mob.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        };

        if ( dms.string.isEmpty(holdTp) ) {
            mob.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        };


        /* var salesOpptProcParam =
            $("#salesOpptProcForm").serializeObject(
                    $("#salesOpptProcForm").serializeObjectBySelector("[data-json-obj='true']")
            ); */
            var salesOpptProcParam ={};

        var addrParam = {};

        var dataSource = document.getElementById("addressList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
        var addrGridData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

        var total = addrGridData.deleteList.length + addrGridData.insertList.length + addrGridData.updateList.length;
        if (total != 0){
            $.each(addrGridData.insertList, function(idx, row){
                if(row.addrTp == ""){
                   // 선택하지 않은 주소요형이 있습니다.
                   mob.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                   //dataValidate = true;
                   return false;
                }
            });
        }

        // enable data Assign
        salesOpptProcParam["leadStatCd"] = "08";;
        salesOpptProcParam["trsfTp"] = "02";; // 전출유형 , 자동(01), 수동(02)
        salesOpptProcParam["evalCd"] = "01";; // 심사상태 , 심사대기(01), 불통과(02)
        salesOpptProcParam["custTp"] = custTp;;
        salesOpptProcParam["custNm"] = $("#custNm").val();;
        salesOpptProcParam["mngScId"] = mngScId;;
        salesOpptProcParam["failCauCd"] = $("#failCauCd").val();;
        salesOpptProcParam["submitDt"] = new Date();;
        salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").val();
        salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").val();;

        salesOpptProcParam["custNo"] = $("#custNo").val();;
        salesOpptProcParam["hpNo"] = $("#hpNo").val();;
        salesOpptProcParam["telNo"] = $("#telNo").val();;
        salesOpptProcParam["infoTp"] = $("#infoTp").val();;
        salesOpptProcParam["holdTp"] = $("#holdTp").val();;
        salesOpptProcParam["wechatId"] = $("#wechatId").val();;
        salesOpptProcParam["estimateCont"] = $("#estimateCont").val();;
        salesOpptProcParam["salesCont"] = $("#salesCont").val();;
        salesOpptProcParam["remark"] = $("#remark").val();;
        salesOpptProcParam["dlrCd"] = dlrCd;
        salesOpptProcParam["emailNm"] = $("#emailNm").val();;
        salesOpptProcParam["intrCarlineCd"] =$("#intrCarlineCd").val();;
        salesOpptProcParam["intrColorCd"] = $("#intrColorCd").val();;
        salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").val();;
        salesOpptProcParam["payTp"] = $("#payTp").val();;
        salesOpptProcParam["sexCd"] = $("#sexCd").val();;
        salesOpptProcParam["trsfTp"] = $("#trsfTp").val();;
        salesOpptProcParam["seq"] = $("#seq").val();;
        salesOpptProcParam["bhmcYn"] = "N";
        salesOpptProcParam["exhvFlakSeq"] = $("#exhvFlakSeq").val();



        if (custTp == "02"){
            salesOpptProcParam["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
            salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
            salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
            salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
            //salesOpptProcParam["wechatId"] = $("#wechatId").val();
            salesOpptProcParam["custNm"] = $("#custNm").val();
            salesOpptProcParam["relCustNm"] = $("#relCustNm").val();
            salesOpptProcParam["relCustHpNo"] = $("#relCustHpNo").val();

        }

        if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };;
        if ($("#bhmcYn").prop("checked")){ salesOpptProcParam["bhmcYn"] = "Y" } else { salesOpptProcParam["bhmcYn"] = "N" };;

        var saveData = $.extend(
            {"salesOpptProcessMgmtVO":salesOpptProcParam }
            , {"addressInfoVOList":addrGridData}
        );

        console.log("Saving of Request Info. !!");
        console.log(saveData);

        $.ajax({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
            ,data:JSON.stringify(saveData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                console.log("error !!!");
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result){
                console.log(result);
                console.log("success!!!!");
                mob.notification.success("<spring:message code='global.info.success'/>");

                /* var data = [];
                data.push(result);
                options.callbackFunc(data);
                parent.editCustPopupWindow.close(); */
                $("#btnSearch").click();
                contentListNonRefresh();
            }
        }).done(function(result) {
            console.log("Done!!!!");
        });
    }
    function doAssign(){
        /*
        var saveList      = [],
            //userList      = $("#sMngScIdPopup").data("kendoExtDropDownList").dataItem(),
            userList      = [],
            chkRow,
            saveData;

            userList[0]=$("#sMngScIdPopup").data("kendoExtDropDownList").dataItem();

            if(userList.length  == 0 ){
                // 배정담당자 / 을(를) 선택해주세요.
               //dms.mob.notification.warning("배정담당자을(를) 선택해주세요.");
                mob.notification.info("<spring:message code='global.lbl.assignPrsNm' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
               return false;
            }


            var listCnt = 0;

            $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
                if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){

                    var gridData = {
                            seq             :$("#mainList").contents().find("input[name='seq']")[cnt].value,
                            custNo          :$("#mainList").contents().find("input[name='custNo']")[cnt].value,
                            leadStatCd      :"02"
                    };
                    saveList.push(gridData);
                    listCnt ++;
                }
            });*/

            userList[0]=$("#sMngScIdPopup").data("kendoExtDropDownList").dataItem();

            if(saveList.length == 0 ){
            // 배정목록 / 을(를) 선택해주세요.
               //mob.notification.warning("배정목록을(를) 선택해주세요.");
               mob.notification.info("<spring:message code='global.btn.assignList' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
               return false;
            }

            if(saveList.length < userList.length ){
                // 선택된 목록보다 담당자가 많습니다.
                //mob.notification.warning("선택된 목록보다 담당자가 많습니다.");
                mob.notification.info("<spring:message code='global.info.assignChk' />");
                return false;
            }

            saveData ={
                    "assignList":saveList
                    ,"userList":userList
            };

            $.ajax({
                url:"<c:url value='/mob/crm/ass/assign/updateSalesOpptAssign.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    mob.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    //mob.notification.success("정상적으로 반영 되었습니다.");
                    mob.notification.info("<spring:message code='global.info.success' />");
                    $("#btnStep01").click();
                    $("#lay_01").hide();
                }
            });


    }
//end document ready
/** [조회조건 영역] ComboBox Select() **/
// 차종에 따른 모델검색
 function onSelectSearchCarlineCd(e){
    $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(true);

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do' />"
        ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
        ,async:false
    });
    $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
 }

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");
  $("#header_title span").attr("class","search_open");

  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침

    //setMainListHeight();
    setTimeout(function(){ setMainListHeight(); },200);
}
var isRefresh = false;
function activeHistoryReload(){
    isRefresh = true;
    //document.getElementById("activeHistoryList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
}

//검색페이지 보기
function contentSearch() {
   $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  //$("#sRegDtFrom").val(chgServerDate2Str(fromDt));
  //$("#sRegDtTo").val(chgServerDate2Str(toDt));


}

//상세페이지 보기
function contentDetail(dataItem) {
    //20170415
    cSeq = dataItem.cSeq;

    gv_leadStatCd = dataItem.leadStatCd;

    console.log("dataItem",dataItem);
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");

    $("#header_title span").removeAttr("class");

    console.log(dataItem);
    selectedItem = dataItem;

    mob.loading.show();
    //$("#leadStatCd").val(dataItem.leadStatCd);
    if(dataItem.leadStatCd == "05" || dataItem.leadStatCd == "06"){
        $("#trLeadStat").hide();
        //20170518 hg
        $("#addActive").hide();
        $("#btnUpdate").hide();
    }else{
        $("#trLeadStat").show();

        $("#addActive").show();
        $("#btnUpdate").show();
    }
    $("#leadStatNm").val(dataItem.leadStatNm);
    $("#custNm").val(dataItem.custNm);
    $("#custNo").val(dataItem.custNo);
    $("#hpNo").val(dataItem.hpNo);
    $("#custTpNm").val(dataItem.custTpNm);
    $("#custTp").val(dataItem.custTp);
    $("#mngScId").val(dataItem.mngScNm);
    $("#relCustNm").val(dataItem.purcMngNm);
    $("#relCustHpNo").val(dataItem.hpNo);
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            $(".mapTel").attr("href","telprompt://"+dataItem.hpNo);
        }else
        {
            $(".mapTel").attr("href","tel:"+dataItem.hpNo);
        }
    }catch(e){

    }
    $("#telNo").val(dataItem.telNo);
    $("#intrCarlineNm").val(dataItem.intrCarlineNm);
    $("#intrFscpModtpCd").val(dataItem.intrFscpModtpCd);
    $("#intrFscpModtpNm").val(dataItem.intrFscpModtpNm);
    $("#intrColorNm").val(dataItem.intrColorNm);
    $("#infoTpNm").val(dataItem.infoTpNm);
    $("#infoTp").val(dataItem.infoTp);

    //$("#infoPathNm").val(dataItem.infoPathNm);
    $("#holdTpNm").val(dataItem.holdTpNm);
    $("#holdDetlTpSeq").val(dataItem.holdDetlTpSeq);
    $("#holdTp").val(dataItem.holdTp);
    $("#sexNm").val(dataItem.sexNm);
    $("#wechatId").val(dataItem.wechatId);
    //$("#vsitResvDt").val(chgDate2Str(dataItem.vsitResvDt));
    //$("#vsitDt").val(chgDate2Str(dataItem.vsitDt));
    $("#vsitResvDt").val(kendo.toString(dataItem.vsitResvDt, '<dms:configValue code='dateFormat' /> HH:mm'));
    $("#vsitDt").val(kendo.toString(dataItem.vsitDt, '<dms:configValue code='dateFormat' /> HH:mm') );
    $("#vsitPrsnCnt").val(dataItem.vsitPrsnCnt);
    $("#rvsitYn").val(rvsitYnMap[dataItem.rvsitYn]);
    $("#testDrvYn").val(chgBuyYnMap[dataItem.testDrvYn]);
    //$("#vsitEndDt").val(chgDate2Str(dataItem.vsitEndDt));
    $("#vsitEndDt").val(kendo.toString(dataItem.vsitEndDt, '<dms:configValue code='dateFormat' /> HH:mm') );
    $("#payTpNm").val(dataItem.payTpNm);
    $("#expcPurcHmNm").val(dataItem.expcPurcHmNm);
    $("#natNofScheNo").val(dataItem.natNofScheNo);
    $("#estimateCont").val(dataItem.estimateCont);
    $("#salesCont").val(dataItem.salesCont);
    $("#remark").val(dataItem.remark);
    $("#traceGradeNm").val(dataItem.traceGradeNm);
    $("#validGradeNm").val(dataItem.validGradeNm);
    $("#validGradeCd").val(dataItem.validGradeCd);
    $("#invalidCauCd").val(dataItem.invalidCauCd);
    $("#invalidCauNm").val(dataItem.invalidCauNm);
    $("#failCauCd").val(dataItem.failCauCd);
    $("#failCauNm").val(dataItem.failCauNm);
    $("#failCauReasonCont").val(dataItem.failCauReasonCont);
    $("#purcSelCarlineNm").val(dataItem.purcSelCarlineNm);
    $("#purcFscpModtpNm").val(dataItem.purcFscpModtpNm);
    $("#expcPurcDt").val(kendo.toString(dataItem.expcPurcDt, '<dms:configValue code='dateFormat' />'));
    $("#expcDealPrc").val(dataItem.expcDealPrc);

    $("#emailNm").val(dataItem.emailNm);
    $("#intrCarlineCd").val(dataItem.intrCarlineCd);
    $("#intrColorCd").val(dataItem.intrColorCd);
    $("#intrFscpModtpCd").val(dataItem.intrFscpModtpCd);
    $("#payTp").val(dataItem.payTp);
    $("#sexCd").val(dataItem.sexCd);
    $("#trsfTp").val(dataItem.trsfTp);
    $("#exhvFlakSeq").val(dataItem.exhvFlakSeq);


    //추적시간, 다음추적시간, 등록일, 수정일
    //$("#traceDtFormat").val(chgDateFormat(dataItem.traceDt));
    $("#traceDtFormat").val(dataItem.vistPrdmm);
    $("#nextTraceDtFormat").val(chgDateFormat(dataItem.nextTraceDt));
    if(dataItem.leadStartDt != null && dataItem.leadStartDt != ""){
        $("#regDtFormat").val(chgDateFormat(dataItem.leadStartDt.substring(0,10)));
    }
    $("#submitDtFormat").val(chgDateFormat(dataItem.submitDt));
    /* $("#updtDtFormat").val(chgDateFormat(dataItem.updtDt)); */

    $("#seq").val(dataItem.seq);

    $("#mathDocTp").data("kendoExtDropDownList").value(dataItem.mathDocTp);
    $("#ssnCrnNoC").val(dataItem.ssnCrnNo);
    $("#bizcondCdC").data("kendoExtDropDownList").value(dataItem.bizcondCd);
    $("#officeTelNoC").val(dataItem.telNo);

    if (dataItem.localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true); };
    if (dataItem.bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true); };
    //$("#localCarRegNoYn").attr("disabled","disabled");

    //추적기록 리스트
    //$("#activeHistoryList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmtList.do' />");
    //최근통화기록 리스트
    //$("#leadStatusExchangeList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHistList.do' />");

    //var leadStatCd=$("#leadStatCd").val();
    var leadStatCd = dataItem.leadStatCd;

    if(leadStatCd =="01"){
        $("#leadStatPrevProcess").addClass("disabled");
        $("#leadStatFail").addClass("disabled");
        $("#leadStatNow").html("<spring:message code='crm.lbl.uploadAdd' />");
        $("#leadStatNextProcess").removeClass("disabled");
    }else if(leadStatCd =="02"){
        $("#leadStatPrevProcess").removeClass("disabled");
        $("#leadStatPrevProcess span").html("<spring:message code='mob.crm.lbl.failedCustomer' />");
        $("#leadStatFail").addClass("disabled");
        $("#leadStatNow").html("<spring:message code='crm.lbl.activeAppointment' />");
        $("#leadStatNextProcess").removeClass("disabled");
    }else if(leadStatCd =="03"){
        $("#leadStatPrevProcess").removeClass("disabled");
        $("#leadStatPrevProcess span").html("◁");
        $("#leadStatFail").addClass("disabled");
        $("#leadStatNow").html("<spring:message code='crm.lbl.visitCounsel' />");
        $("#leadStatNextProcess").removeClass("disabled");
    }else if(leadStatCd =="04"){
        $("#leadStatPrevProcess").removeClass("disabled");
        $("#leadStatPrevProcess span").html("<spring:message code='mob.crm.lbl.failedCustomer' />");
        $("#leadStatFail").removeClass("disabled");
        $("#leadStatNow").html("<spring:message code='crm.lbl.activeProcessing' />");
        $("#leadStatNextProcess").removeClass("disabled");

    }else if(leadStatCd =="05"){
        $("#leadStatPrevProcess").removeClass("disabled");
        $("#leadStatPrevProcess span").html("<spring:message code='crm.lbl.activeProcessing' />");
        $("#leadStatFail").removeClass("disabled");
        $("#leadStatNow").html("<spring:message code='crm.lbl.visitCustMng' />");
        $("#leadStatNextProcess").removeClass("disabled");
    }

    if ($("#custTp").val() == "01") {
        $(".crop").hide();
        $(".person").show();
        $('#trCustNmC > th').html('<spring:message code="global.lbl.custNm" />');
        $("#hpNo").parent().addClass("f_disabled");
        $("#hpNo" ).prop('readonly', true);
        /* $("#officeTelNo").parent().removeClass('f_disabled');
        $("#officeTelNo" ).prop('readonly', false); */
    } else {
        $(".crop").show();
        $(".person").hide();
        $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
        $("#officeTelNoC").parent().addClass("f_disabled");
        $("#officeTelNoC" ).prop('readonly', true);
        $("#hpNo").parent().removeClass('f_disabled');
        $("#hpNo" ).prop('readonly', false);
    }

    $(".mapImg").height($(".f_text").height()*0.9);
    $(".mapImg").width($(".f_text").height()*2.1);


    $("#custMngScId").val(dataItem.custMngScId);//판매고문

    mob.loading.hide();
    //20170427
    if(btnStage == "btnStep99"){
        $("#btnUpdate").click();
        leadFlag = "X";
    }else{
        leadFlag = "";
    }
}
chgDateFormat = function(val){
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm');
    }else{
        returnVal = '';
    }
    return returnVal;
}


function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
}

//주소팝업
var zipCodeSearchPopupWin ;
function zipcodeSearchPop(callbackAddr){
    zipCodeSearchPopupWin = mob.window.popup({
    windowId:"zipCodeSearchPopupMain"
    , content:{
        url:"<c:url value='/mob/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
        , data:{
                      "autoBind":false
                      ,"usrNm":""
                      , "callbackFunc":function(data){
                          //console.log(data);
                          if (data != null || data != 'undefined') {
                              //document.getElementById("addressList").contentWindow.addItemSubList1(data);
                              console.log(data);
                               callbackAddr(data);
                          }
                      }
                  }
              }
    });
}

//고객검색 팝업
var popupWindow;
function custSearchPop(callbackCust,custNm){
    popupWindow = mob.window.popup({
        windowId:"customerSearchPopupMain"
        , content:{
            url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
            , data:{
                "autoBind":false
                , "custNm":custNm
                , "type"  :null
                , "callbackFunc":function(data){
                    if (data != null) {
                        console.log("Popup Search Result111:::");
                        console.log(data);

                        callbackCust(data);
                    }
                }
            }
        }
    });
}

//버튼 - 신규
 $("#btnAdd").click(function(){
    pageMode = "insert";

    var leadStatCd = $("#leadStatCd").val();
    var url = "";
    if (leadStatCd === "99") {
        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptShowRoomPopup.do'/>";
    }else{
        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptProcessPopup.do'/>";
    }
          newCustPopupWindow = mob.window.popup({
              windowId:"newCustPopupWindow"
              ,content:{
                  url:url
                  , data:{
                      "autoBind":false
                      , "leadStatCd":$("#leadStatCd").val()
                      , "custNo":null
                      , "salesOpptSeq":null
                      , "callbackFunc":function(data) {
                          console.log(data);
                          $("#btnSearch").click();
                          /* if (data.length >= 1) {
                              console.log(data[0]);

                              newCustPopupWindow.close();
                          } */
                      }
                  }
              }
          });
    });
//버튼 삭제

 //버튼 - 수정
$("#btnUpdate").click(function(){
    pageMode = "update";

    var custNo = selectedItem.custNo
    , seq = selectedItem.seq
    , leadStatCd = selectedItem.leadStatCd

    , exhvFlakSeq = selectedItem.exhvFlakSeq
    , dataTable = selectedItem.dataTable;

    //var mainLeadStatCd = $("#leadStatCd").val();
    var mainLeadStatCd = btnLeadStatCd
    if (mainLeadStatCd === "99") {
        //전시장 흐름일때
        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptShowRoomPopup.do'/>";
    }else if(mainLeadStatCd === "04"){

        // 신규파일 수정으로 분기처리함.
        // TODO:/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectStep04EditSalesOpptShowRoomPopup.jsp 참조

        /* console.log("mainLeadStatCd:"+mainLeadStatCd);
        return false; */

        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";

    }else{
       url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
    }
    editCustPopupWindow = mob.window.popup({
        windowId:"selectEditSalesOpptProcessPopup"
      , content:{
          url:url
          , data:{
              "autoBind":true
              , "leadStatCd":leadStatCd
              , "custNo":custNo
              , "salesOpptSeq":seq
              , "showRoomSeq":seq
              , "exhvFlakSeq":exhvFlakSeq
              , "dataTable":dataTable
              , "userId":userId
              , "callbackFunc":function(data) {
              console.log("editCustPopupWindow callback");
                  console.log(data);
                  $("#btnSearch").click();
                  /*if (data[0] != "") {
                      $("#btnCtlSearch").click();
                  }*/
              }
          }
      }
    });
});
//todo 링크
function fn_popuplink(){
    var custNo = fromTodoCustNo
    , seq = "${salesOpptSeq}"
    , leadStatCd = fromTodoLeadStatCd
    , exhvFlakSeq = "${exhvFlakSeq}"
    //, dataTable = selectedItem.dataTable;

    var url;
    var heightVal = "400";
    var title = "";

    if (leadStatCd === "01") {
        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup.do'/>";
    } else if (leadStatCd === "02") {
        if($("#validGradeCd").val() != "02" ){
            var param = {};
            param["sCustNo"] = custNo;
            $.ajax({
                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
                , data:JSON.stringify(param)
                , type:'POST'
                , dataType:'json'
                , contentType:'application/json'
                , error:function(jqXHR,status,error){
                    mob.loading.hide();
                     console.log(jqXHR);

                     mob.notification.error("<spring:message code='global.err.mobSystemError'/>");

                }
            }).done(function(result) {
                setTimeout(function(){contentDetail(result.data[0]);},3000);
            });
            //mob.notification.info("<spring:message code='crm.info.validCheckRequired'/>");
            return false;
            }
        else {url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup.do'/>"; heightVal = "470";}
        //title = "<spring:message code='crm.btn.visitReservation' />";    //방문|면담으로 전달
    } else if (leadStatCd === "03") {
        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup.do'/>";
        //title = "<spring:message code='crm.btn.activeProcessSend' />";    // 추적|추진으로 제출
        heightVal = "495";
    } else if (leadStatCd === "04") {
        if(dms.string.isEmpty($("#ssnCrnNoC").val())){mob.notification.show("<spring:message code='crm.info.isEmptySsnCrnNo' />","callFunc:goCustomerInfo(\""+$('#custNo').val()+"\")"); return false;}
        else{ url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptProcessPopup.do'/>";heightVal = "470";}
        //title = "<spring:message code='crm.lbl.reservationDeal' />";    // 예약 거래로 제출
    } else {
        url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
    }

    editCustPopupWindow = mob.window.popup({
        windowId:"selectEditSalesOpptProcessPopup"
        , content:{
            url:url
            , data:{
                "autoBind":true
                , "leadStatCd":fromTodoLeadStatCd
                , "custNo":fromTodoCustNo
                , "salesOpptSeq":"${salesOpptSeq}"
                , "showRoomSeq":"${showRoomSeq}"
                , "exhvFlakSeq":"${exhvFlakSeq}"
                , "callbackFunc":function(data) {
                    $("#btnSearch").click();
                }
            }
        }
    });

}

function setScanInfo(obj){
    var result = JSON.parse(obj);

    /*공통*/
    if(typeof result.Name!="undefined")scanCustNm=result.Name;
    if(typeof result.Sex!="undefined")scanSex=result.Sex;

    /*신분증, 운전면허*/
    if(typeof result.Ethnicity!="undefined")scanEthnicity=result.Ethnicity;
    if(typeof result.DateofBirth!="undefined")scanDateofBirth=result.DateofBirth;
    if(typeof result.Domicile!="undefined")scanDomicile=result.Domicile;
    if(typeof result.IdentificationNumber!="undefined")scanIdentificationNumber=result.IdentificationNumber;
    if(typeof result.DirverNumber!="undefined")scanDirverNumber=result.DirverNumber;

    /*명함*/
    if(typeof result.Department!="undefined")scanDepartment=result.Department;
    if(typeof result.Company!="undefined")scanCompany=result.Company;
    if(typeof result.Email!="undefined")scanEmail=result.Email;
    if(typeof result.ZipCode!="undefined")scanZipCode=result.ZipCode;
    if(typeof result.Homepage!="undefined")scanHomepage=result.Homepage;
    if(typeof result.Fax!="undefined")scanFax=result.Fax;
    if(typeof result.CellPhone!="undefined")scanCellPhone=result.CellPhone;
    if(typeof result.Address!="undefined")scanAddress=result.Address;
    if(typeof result.Phone!="undefined")scanPhone=result.Phone;
}

function setItemList(obj){

    var result = JSON.parse(obj);
    var sendData=[];
    var base = {};
    var rowCount = result.data.length;
    $.each(result.data , function(i , row){
        baes={
                "dlrCd": dlrCd,
                "custNm": row.CUST_NM,
                "custTp":row.CUST_TP,
                "hpNo":row.CUST_HP,
                "infoTp":row.INFO_TP,
                "regUsrId":userId,
                "holdTp":row.HOLD_TP,
                "holdDetlTpSeq":row.HOLD_PATH,
                "custCd":"01"
        };
        sendData.push(baes);
        rowCount --;
    });

    if (sendData.length == 0){
        return;
    }

    $.ajax({
        url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/insertSalesOpptPorcessBatchUpload.do' />"
        //,data:JSON.stringify({"batchUploadList":sendData})
        ,data:JSON.stringify(sendData)
        //,data:obj
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            if(jqXHR.responseJSON.errors.length>0){
                //if(jqXHR.responseJSON.errors[0].errorMessage.search("이동전화 번호가 규칙에 맞지 않습니다.")>-1){
                   // mob.notification.error("<spring:message code='crm.info.regExpHpNo'/>");
                //}
                mob.notification.error("<spring:message code='crm.menu.custMngOffLine'/> <spring:message code='crm.btn.failed'/>");

            }else{
                mob.notification.error("<spring:message code='crm.menu.custMngOffLine'/> <spring:message code='crm.btn.failed'/>");
            }
        }
        ,success:function(jqXHR, textStatus) {
            mob.notification.error("<spring:message code='crm.menu.custMngOffLine'/> <spring:message code='global.btn.success'/>");
            /* try{
                var userAgent = navigator.userAgent.toLowerCase();
                if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                    || (userAgent.search("ipad") > -1))
                {
                    document.location='bhmccp://DELETE_ALL?TABLE_NM=Lead_info&WHERE=CUST_TP is not null&return_func=isDeleted';
                }else
                {
                    window.bhmccp.DELETE_ALL('Lead_info','CUST_TP is not null','isDeleted');
                }
            }catch(e){

            } */
        }
    });
}
function isDeleted(obj){
    //alert(obj);
}
//추적이력 팝업
var activeAddPopupWin;
function activeAddPop(){
console.log("addActive");
    var custNo = $("#custNo").val()
        , seq = $("#seq").val()
        //, leadStatCd = $("#leadStatCd").val();
        , leadStatCd = gv_leadStatCd;

        activeAddPopupWin = mob.window.popup({
            windowId:"activeAddPopupWin"
            ,width:"100%"
            ,height:"700px"
            ,content:{
                url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtActivePopup.do'/>"
                , data:{
                    "autoBind":true
                    ,"usrNm":""
                    , "leadStatCd":leadStatCd
                    , "salesOpptSeq":seq
                    , "custNo":custNo
                    , "traceGradeCd":$("#traceGradeNm").val().substring(0, 1)
                    , "cSeq":cSeq
                    , "validGradeCd":$("#validGradeCd").val()
                    , "invalidCauCd":$("#invalidCauCd").val()
                    ,"callbackFunc":function(data){
                        if (data.length >= 1) {
                            console.log("Return to User Popup");
                            $("#prsnId").val(data[0].usrId);
                            $("#prsnNm").val(data[0].usrNm);
                        }

                        //callbackActive();
                    }
                }
            }
        });
}

//SMS 팝업
var sendSMSPopupWin;
function sendSMSPopup(){
    var   smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
        , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
        , smsTmplUserList = []              // sms 전송 대상자 목록
        , refKeyNm = $("#seq").val()
        , refTableNm = "CR_0211T"
        , contactBizCd = "03" //업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07)
    ;

    var custNo = $("#custNo").val()
        , custNm = $("#custNm").val()
        , hpNo = $("#hpNo").val();

    sendSMSPopupWin = mob.window.popup({
            windowId:"sendSMSPopupWin"
            ,width:"100%"
            ,height:"700px"
            ,content:{
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSendSMSPopup.do'/>"
                , data:{
                    "custNo":custNo
                    ,"custNm":custNm
                    ,"hpNo":hpNo
                    ,"smsTmplUserGroup":smsTmplUserGroup
                    ,"smsTmplUserSeq":smsTmplUserSeq
                    ,"smsTmplUserList":smsTmplUserList
                    ,"refKeyNm":refKeyNm
                    ,"refTableNm":refTableNm
                    ,"contactBizCd":contactBizCd
                    ,"callbackFunc":function(data){
                        if (data.length >= 1) {
                            if(data == "FAIL"){
                                mob.notification.success("<spring:message code='global.lbl.send'/>"+"<spring:message code='crm.btn.failed'/>");
                            }else{
                                mob.notification.success("<spring:message code='global.info.success'/>");
                            }
                        }
                    }
                }
            }
        });
}

function callbackActive(){

    document.getElementById("mainList").contentWindow.document.location.reload();

    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_list").css("display","block");
    $("#header_title span").attr("class","search_open");

}
</script>

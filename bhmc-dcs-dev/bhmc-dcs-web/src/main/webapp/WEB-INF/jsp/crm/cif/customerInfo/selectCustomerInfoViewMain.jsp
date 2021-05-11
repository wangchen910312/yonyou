<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

      <!-- 기본정보 -->
<form id="customerForm" name="customerForm" onsubmit="return false;">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_save" id="btnCustSearch">조회 테스트</button>  <!-- 조회 -->
                    </div>
                </div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="custNoR" name="custNoR" type="text" value="" class="form_input" style="width:100%" />
                                    <input id="pageMode" name="pageMode" type="hidden" value="insertMode" readonly>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                                <td>
                                    <input id="custNmR" name="custNmR" type="text" value="" class="form_input form_readonly" style="width:100%" readOnly/>
                                    <input id="oldcustNmR" name="oldcustNmR" type="hidden" value="">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTpR" name="custTpR" class="form_select form_readonly" style="width:100%" readOnly/>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                                <td>
                                    <input id="custCdR" name="custCdR" class="form_select" style="width:100%" readOnly/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.sex" /></th> <!-- 성별 -->
                                <td>
                                    <input id="sexCdR" name="sexCdR" class="form_select form_readonly" style="width:100%" readOnly/>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 신분증유형 -->
                                <td>
                                    <input id="mathDocTpR" name="mathDocTpR" class="form_select form_readonly" style="width:100%" readOnly/>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 신분증번호 -->
                                <td>
                                    <input id="ssnCrnNoR" name="ssnCrnNoR" type="text" value="" class="form_input form_readonly numberandalpha" style="width:100%" />
                                    <span id="drivingNoRSpan" style="display:none;">
                                    <input id="drivingNoR" name="drivingNoR" type="text" value="" class="form_input form_readonly numberandalpha" style="width:100%" />
                                    </span>
                                    <span id="officeNoRSpan" style="display:none;">
                                    <input id="officeNoR" name="officeNoR" type="text" value="" class="form_input form_readonly numberandalpha" style="width:100%" />
                                    </span>
                                    <span id="passportNoRSpan" style="display:none;">
                                    <input id="passportNoR"  name="passportNoR" type="text" value="" class="form_input form_readonly numberandalpha" style="width:100%" />
                                    </span>
                                    <span id="otherNoRSpan" style="display:none;">
                                    <input id="otherNoR"  name="otherNoR" type="text" value="" class="form_input form_readonly numberandalpha" style="width:100%" />
                                    </span>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td>
                                    <label class="label_check ml5"><input id="bhmcYnR" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly></label>
                                    <input id="siebelRowIdR" name="siebelRowIdR" type="text" value="" class="form_input form_readonly" style="width:50%" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.prsnSC" /></th> <!-- 담당SC -->
                                <td class="readonly_area">
                                    <input id="mngScIdR" name="mngScIdR" type="text" value="" class="form_input" style="width:100%" readonly>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecIdR" name="mngTecIdR" type="text" value="" class="form_input form_readonly" style="width:100%" readonly>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custHoldTp" /></th> <!-- 정보출처 -->
                                <td colspan="3">
                                    <input id="custHoldTp1R" name="custHoldTp1R" class="form_select" style="width:30%" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /></th> <!-- 이동전화 -->
                                <td>
                                    <input id="hpNoR" name="hpNoR" type="text" value="" class="form_input form_readonly numberic" style="width:100%">
                                    <input id="oldhpNoR" name="oldhpNoR" type="hidden" value="">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                <td>
                                    <input id="telNoR" name="telNoR" type="text" value="" class="form_input form_readonly numberic" style="width:100%">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td>
                                    <input id="officetelNoR" name="officetelNoR" type="text" value="" class="form_input form_readonly numberic" style="width:100%">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNoR" name="officeFaxNoR" type="text" value="" class="form_input form_readonly numberic" style="width:100%">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td colspan="3">
                                    <input id="emailNm" name="emailNm" type="text" value="" class="form_input" style="width:50%">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                                <td>
                                    <input id="wechatIdR" name="wechatIdR" type="text" value="" class="form_input" style="width:100%">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.qq" /></th> <!-- QQ -->
                                <td>
                                    <input id="qqId" name="qqId" type="text" value="" class="form_input" style="width:100%">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.prefCommMthCd" /></th> <!-- 선호연락방법 -->
                                <td>
                                    <input id="prefCommMthCdR" name="prefCommMthCdR" class="form_select" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefCommNo" /></th> <!-- 선호연락처 -->
                                <td>
                                    <input id="prefCommNoR" name="prefCommNoR" class="form form_input form_readonly numberic" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefContactMthCd" /></th> <!-- 우선연락방식  SMS / EMAIL / DM -->
                                <td>
                                    <input id="prefContactMthCdR" name="prefContactMthCdR" class="form_select" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefContactTime" /></th> <!-- 우선연락시간 -->
                                <td>
                                    <input id="prefContactTimeCdR" name="prefContactTimeCdR" class="form_select" style="width:100%" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.homeaddr" /></th> <!-- 자택주소 -->
                                <td colspan="7">
                                    <input id="sungCdR" name="sungCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="cityCdR" name="cityCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="regionCdR" name="regionCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="regionCdReadR" name="regionCdReadR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="zipCdR" name="zipCdR" type="text" value="" class="form_input" style="width:8%">
                                    <div class="mt2">
                                         <input id="addr1R" name="addr1R" type="text" value="" class="form_input" style="width:30%">
                                         <input id="addr2R" name="addr2R" type="text" value="" class="form_input" style="width:51.5%">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.officeaddr" /></th> <!-- 직장 -->
                                <td colspan="7">
                                    <input id="officesungCdR" name="officesungCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="officecityCdR" name="officecityCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="officeregionCdR" name="officeregionCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="officeregionCdReadR" name="officeregionCdReadR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="officezipCdR" name="officezipCdR" type="text" value="" class="form_input" style="width:8%">
                                    <button class="btn_s" id="officeZipPop"><spring:message code="global.btn.zipCd" /></button> <!-- 우편번호 찾기 -->
                                    <div class="mt2">
                                         <input id="officeaddr1R" name="officeaddr1R" type="text" value="" class="form_input" style="width:30%">
                                         <input id="officeaddr2R" name="officeaddr2R" type="text" value="" class="form_input" style="width:51.5%">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.idAddress" /></th> <!-- 신분증주소  -->
                                <td colspan="7">
                                    <input id="idsungCdR" name="idsungCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="idcityCdR" name="idcityCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="idregionCdR" name="idregionCdR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="idregionCdReadR" name="idregionCdReadR" type="text" value="" class="form_input" style="width:8%" >
                                    <input id="idzipCdR" name="idzipCdR" type="text" value="" class="form_input" style="width:8%">
                                    <button class="btn_s" id="idZipPop"><spring:message code="global.btn.zipCd" /></button> <!-- 우편번호 찾기 -->
                                    <div class="mt2">
                                         <input id="idaddr1R" name="idaddr1R" type="text" value="" class="form_input" style="width:30%">
                                         <input id="idaddr2R" name="idaddr2R" type="text" value="" class="form_input" style="width:51.5%">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.rejectRecv' /></th> <!-- 수신거부  -->
                                <td colspan="7">
                                    <label class="label_check ml5"><input id="smsReceiveYnR" type="checkbox" class="form_check" unchecked> <spring:message code="global.lbl.hpNo" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="telReceiveYnR" name="telReceiveYnR" type="checkbox" class="form_check" unchecked> <spring:message code="global.lbl.homeTelNo" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="dmReceiveYnR" name="dmReceiveYnR" type="checkbox" class="form_check" unchecked> <spring:message code="global.lbl.dm" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="emailReceiveYnR" name="emailReceiveYnR" type="checkbox" class="form_check" unchecked> <spring:message code='global.lbl.email' /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="faxReceiveYnR" name="faxReceiveYnR" type="checkbox" class="form_check" unchecked> <spring:message code='global.lbl.fax' /></label>&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.infoAgreedocId" /></th> <!-- 개인정보활용동의서 -->
                                <td colspan="3">
                                    <label class="label_check ml5"><input id="perInfoAgreeYnR" type="checkbox" class="form_check" unchecked> <spring:message code="global.lbl.agree" /></label>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.infoUsrYn" /></th> <!-- 개인정보사용여부  -->
                                <td colspan="3">
                                    <label class="label_check ml5"><input id="perInfoUseYnR" type="checkbox" class="form_check" unchecked> <spring:message code="global.lbl.agree" /></label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.birthday" /></th> <!--  생일 -->
                              <td>
                                  <input id="birthDtR" name="birthDtR" class="form_datepicker" style="width:100%">
                              </td>
                              <th scope="row"><spring:message code="global.lbl.marryYn" /></th> <!-- 결혼여부 -->
                              <td>
                                  <input id="marryCdR" name="marryCdR" class="form_select" style="width:100%">
                              </td>
                              <th scope="row"><spring:message code="global.lbl.marryDt" /></th> <!-- 결혼기념일 -->
                              <td>
                                  <input id="marryDtR" name="marryDtR" class="form_datepicker" style="width:100%">
                              </td>
                              <th scope="row"><spring:message code="global.lbl.incomeLvlCd" /></th> <!-- 소득수준 -->
                              <td>
                                  <input id="incomeLvlCdR" name="incomeLvlCdR" class="form_select" style="width:100%" />
                              </td>
                            </tr>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.acCareerCd" /></th> <!-- 학력 -->
                              <td>
                                  <input id="acCareerCdR" name="acCareerCdR" class="form_select" style="width:100%" />
                              </td>
                              <th scope="row"><spring:message code="global.lbl.avgCarChg" /></th> <!-- 평균차량 교체시기 -->
                              <td>
                                  <input id="avgCarChgCdR" name="avgCarChgCdR" class="form_select" style="width:100%" />
                              </td>
                              <th scope="row"><spring:message code="global.lbl.driverTp" /></th> <!-- 주 운전자 -->
                              <td>
                                  <input id="driverTpR" name="driverTpR" class="form_select" style="width:100%" />
                              </td>
                              <th scope="row"><spring:message code="global.lbl.ageCd" /></th> <!-- 연령 -->
                              <td>
                                  <input id="ageCdR" name="ageCdR" class="form_select" style="width:100%" />
                              </td>
                            </tr>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                              <td colspan="7">
                                  <input id="groupTxt" name="groupTxt" type="text" value="" class="form_input form_readonly" style="width:60%" readOnly>
                              </td>
                            </tr>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                              <td colspan="7">
                                  <input id="tagTxt" name="tagTxt" type="text" value="" class="form_input form_readonly" style="width:60%" readOnly>
                              </td>
                            </tr>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.hobby" /></th> <!-- 취미 -->
                              <td colspan="7">
                                  <input id="hobbyCdR" name="hobbyCdR" class="form_select" style="width:100%" />
                              </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.officeNm" /></th> <!-- 직장명 -->
                              <td>
                                  <input id="officeNmR" name="officeNmR" type="text" value="" class="form_input" style="width:100%">
                              </td>
                              <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                              <td>
                                  <input id="bizcondCdR" name="bizcondCdR" class="form_select" style="width:100%" />
                              </td>
                              <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                              <td>
                                  <input id="cmpScaleContR" name="cmpScaleContR" class="form_select" style="width:100%" />
                              </td>
                              <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                              <td>
                                  <input id="cmpTpR" name="cmpTpR" class="form_select" style="width:100%" />
                              </td>
                            </tr>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.job" /></th> <!-- 직업 -->
                              <td>
                                  <input id="jobCdR" name="jobCdR" class="form_select" style="width:100%" />
                              </td>
                              <th scope="row"><spring:message code="global.lbl.deptNm" /></th> <!-- 부서 -->
                              <td>
                                  <input id="deptNmR" name="deptNmR" type="text" value="" class="form_input" style="width:100%">
                              </td>
                              <th scope="row"><spring:message code="global.lbl.psitNm" /></th> <!-- 직위 -->
                              <td colspan="3">
                                  <input id="psitNmR" name="psitNmR" type="text" value="" class="form_input" style="width:100%">
                              </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
</form>
            </section>
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

/*************************************************************
 데이터 셋업
*************************************************************/
    var popupWindow;
    var groupTxt;
    var tagTxt;
    var groupDS = [];
    var tagDS   = [];

    var loginDlrCd              = "${dlrCd}"
    var custTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    var custCdList              = [{"cmmCd":"", "cmmCdNm":""}];
    var custHoldTpList          = [{"cmmCd":"", "cmmCdNm":""}];
    var custHoldTp1List         = [{"cmmCd":"", "cmmCdNm":""}];
    var sexCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactMthCdR        = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactTimeCdR       = [{"cmmCd":"", "cmmCdNm":""}];
    var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var pconTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    var ageCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var driverTpList            = [{"cmmCd":"", "cmmCdNm":""}];
    var jobCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":""}];
    var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":""}];
    var cmpTpList               = [{"cmmCd":"", "cmmCdNm":""}];
    var hobbyCdList             = [{"cmmCd":"", "cmmCdNm":""}];
    var acCareerCdList          = [{"cmmCd":"", "cmmCdNm":""}];
    var marryYnList             = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":""}];
    var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":""}];
    var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":""}];

    var prefCommMthCdRMap        = [];
    var mathDocTpRMap            = [];
    var pconTpMap               = [];
    var prefContactMthCdRMap     = [];
    var prefContactTimeCdRMap    = [];

    var custNoR                  = "${custNo}";

    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.itemCd}" , "cmmCdNm":"${obj.itemNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.itemCd}" , "cmmCdNm":"${obj.itemNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefCommMthCdRMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTp1List}">
    custHoldTp1List.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCdR}">
    prefContactMthCdR.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCdR}">
    prefContactTimeCdR.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${incomeLvlCdList}">
    incomeLvlCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpRMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${pconTpList}">
    pconTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    pconTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${ageCdList}">
    ageCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${driverTpList}">
    driverTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${jobCdList}">
    jobCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpScaleContList}">
    cmpScaleContList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpTpList}">
    cmpTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${hobbyCdList}">
    hobbyCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${acCareerCdList}">
    acCareerCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${marryYnList}">
    marryYnList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefContactMthCdRMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefContactTimeCdRMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${avgCarChgCdList}">
    avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    function iframeCallBack(){
        //alert($("#customerForm").html())

        //var customerForm = $("#customerForm").html();
        //parent.callBackFunc(customerForm);
        //$("#tabstrip-1", parent.document).html(customerForm);

        //).html(customerForm);
    }

$(document).ready(function() {

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/
    $("#custNoR").val(custNoR);

    $("#custNoR").val($("#custNo", parent.document).val());

    $("#btnCustSearch").click();

// 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTpR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:1
    });
    $("#custTpR").data("kendoExtDropDownList").value("01");

 // 잠재/보유고객      custCdR              (CRM023)
    $("#custCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:1
        , change:function(){

            if (this.value() =="01"){
                $("#addr1R").parent().removeClass('required_area');
                $("#addr2R").parent().removeClass('required_area');
            }else{
                $("#addr1R").parent().addClass('required_area');
                $("#addr2R").parent().addClass('required_area');
            }
        }
        //,  value:"01"
    });
    $("#custCdR").data("kendoExtDropDownList").value("01");


 // 선호연락방법       prefCommMthCdR (CRM022)
     $("#prefCommMthCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefCommMthCdList
        , index:0
        , click:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#prefCommNoR").val($("#hpNoR"));
            } else {
                $("#prefCommNoR").val("");
            }
        }
    });

 // 신분증유형            mathDocTpR       (CRM024)
     $("#mathDocTpR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:mathDocTpList
        , index:1
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#ssnCrnNoR").show();
                $("#drivingNoRSpan").hide();
                $("#officeNoRSpan").hide();
                $("#passportNoRSpan").hide();
                $("#otherNoRSpan").hide();
            }else if (selcmmCd == "02"){
                $("#ssnCrnNoR").hide();
                $("#drivingNoRSpan").show();
                $("#officeNoRSpan").hide();
                $("#passportNoRSpan").hide();
                $("#otherNoRSpan").hide();
            }else if (selcmmCd == "03"){
                $("#ssnCrnNoR").hide();
                $("#drivingNoRSpan").hide();
                $("#officeNoRSpan").show();
                $("#passportNoRSpan").hide();
                $("#otherNoRSpan").hide();
            }else if (selcmmCd == "04"){
                $("#ssnCrnNoR").hide();
                $("#drivingNoRSpan").hide();
                $("#officeNoRSpan").hide();
                $("#passportNoRSpan").show();
                $("#otherNoRSpan").hide();
            }else{
                $("#ssnCrnNoR").hide();
                $("#drivingNoRSpan").hide();
                $("#officeNoRSpan").hide();
                $("#passportNoRSpan").hide();
                $("#otherNoRSpan").show();
            }
        }
     , bind:function(){
         $("#drivingNoR").hide();
         $("#officeNoR").hide();
         $("#passportNoR").hide();
         $("#otherNoR").hide();
     }
    });

 // 고객확보유형1      custHoldTp      (CRM008)
     $("#custHoldTp1R").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custHoldTp1List
        , index:0
    });

 // 고객확보유형2      custHoldTp1R   (CRM***)
     $("#custHoldTp2").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custHoldTp1List
        , index:0
    });

 // 직업군                  jocCd                   (CRM002)
     $("#jobCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:jobCdList
        , index:0
    });

 // 업종                  bizcondCdR
     $("#bizcondCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:bizcondCdList
        , index:0
    });

 // 회사규모                  cmpScaleContList       (CRM026)
     $("#cmpScaleContR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpScaleContList
        , index:0
    });

 // 회사유형                  cmpTpR
     $("#cmpTpR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpTpList
        , index:0
    });

 // 주 운전자                driverTpR            (CRM015)
     $("#driverTpR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:driverTpList
        , index:0
    });

 // 연령                       ageCdR                 (CRM014)
     $("#ageCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:ageCdList
        , index:0
    });

 // 학력                       acCareerCdR      (CRM012)
     $("#acCareerCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:acCareerCdList
        , index:0
    });

 // 소득수준             incomeLvlCdR     (CRM013)
     $("#incomeLvlCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:incomeLvlCdList
        , index:0
    });

 // 취미                       hobbyCdR             (CRM010)
     $("#hobbyCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:hobbyCdList
        , index:0
    });

 // 성별                       sexCdR                   (COM017)
     $("#sexCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:sexCdList
        , index:0
    });

 // 우선연락방식                       prefContactMthCdR    (CRM022)
     $("#prefContactMthCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefContactMthCdList
        , index:0
    });

 // 우선연락시간                       prefContactTimeCdR      (CRM027)
     $("#prefContactTimeCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefContactTimeCdList
        , index:0
    });

 // 결혼여부                       marryYnList          (CRM028)
     $("#marryCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:marryYnList
        , index:0
    });

 // 평균차량 교체 시기                       avgCarChgCdList    (CRM029)
     $("#avgCarChgCdR").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:avgCarChgCdList
        , index:0
    });


 // 결혼기념일
     $("#marryDtR").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

 // 생일
     $("#birthDtR").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

 // 숫자
     $(".numberic").kendoMaskedTextBox({
         mask:"00000000000000000000"
         , promptChar:" "
     });

 // 숫자와 알파벳
     $(".numberandalpha").kendoMaskedTextBox({
         mask:"AAAAAAAAAAAAAAAAAAAA"
         , promptChar:" "
     });

/*************************************************************
이벤트 정의
*************************************************************/

     $("#btnCustSearch").kendoButton({
         click:function(e) {

             // TODO [이교진] 메세지 등록
             // 필수
             if ($("#custNoR").val() ==""){
                 dms.notification.warning("고객 번호는 필수 입니다.");
                 $("#custNoR").focus();
                 return false;
             }
             $("#btnCustReset").click();

             // form 데이터
             var param = {};
             param["sCustNo"] = $("#custNoR").val();
             param["sSearchRange"] = "MY";

             console.log(param);
             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR);
                     //console.log(jqXHR.responseJSON);
                     //alert(jqXHR.responseJSON.errors[0].errorMessage);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {

                 console.log(result);

                 if (result.custInfoDS.length != 0 ){
                     $("#custNmR").val(result.custInfoDS[0].custNm);
                     $("#oldcustNmR").val(result.custInfoDS[0].custNm);
                     $("#custNoR").val(result.custInfoDS[0].custNo);
                     $("#custTpR").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                     $("#custCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                     $("#hpNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].hpNo);
                     $("#oldhpNoR").val(result.custInfoDS[0].hpNo);
                     $("#emailNoR").val(result.custInfoDS[0].emailNo);
                     $("#mngScIdR").val(result.custInfoDS[0].mngScId);
                     $("#mngTecIdR").val(result.custInfoDS[0].mngTecId);
                     $("#wechatIdR").val(result.custInfoDS[0].wechatId);
                     $("#telNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].telNo);
                     $("#sungCdR").val(result.custInfoDS[0].sungCd);
                     $("#cityCdR").val(result.custInfoDS[0].cityCd);
                     $("#regionCdR").val(result.custInfoDS[0].regionCd);
                     $("#regionCdReadR").val(result.custInfoDS[0].regionCdRead);
                     $("#zipCdR").val(result.custInfoDS[0].zipCd);
                     $("#addr1R").val(result.custInfoDS[0].addr1);
                     $("#addr2R").val(result.custInfoDS[0].addr2);
                     $("#officesungCdR").val(result.custInfoDS[0].officesungCd);
                     $("#officecityCdR").val(result.custInfoDS[0].officecityCd);
                     $("#officeregionCdR").val(result.custInfoDS[0].officeregionCd);
                     $("#officeregionCdReadR").val(result.custInfoDS[0].officeregionCdRead);
                     $("#officezipCdR").val(result.custInfoDS[0].officezipCd);
                     $("#officeaddr1R").val(result.custInfoDS[0].officeaddr1);
                     $("#officeaddr2R").val(result.custInfoDS[0].officeaddr2);
                     $("#idsungCdR").val(result.custInfoDS[0].idsungCd);
                     $("#idcityCdR").val(result.custInfoDS[0].idcityCd);
                     $("#idregionCdR").val(result.custInfoDS[0].idregionCd);
                     $("#idregionCdReadR").val(result.custInfoDS[0].idregionCdRead);
                     $("#idzipCdR").val(result.custInfoDS[0].idzipCd);
                     $("#idaddr1R").val(result.custInfoDS[0].idaddr1);
                     $("#idaddr2R").val(result.custInfoDS[0].idaddr2);
                     $("#prefCommMthCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].prefCommMthCd);
                     $("#custHoldTp1R").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp1);
                     $("#mathDocTpR").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                     $("#ssnCrnNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].ssnCrnNo);
                     $("#drivingNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].drivingNo);
                     $("#officeNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].officeNo);
                     $("#passportNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].passportNo);
                     $("#otherNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].otherNo);
                     $("#officeNmR").val(result.custInfoDS[0].officeNm);
                     $("#jobCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].jobCd);
                     $("#bizcondCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                     $("#cmpScaleContR").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpScaleCont);
                     $("#cmpTpR").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                     $("#deptNmR").val(result.custInfoDS[0].deptNm);
                     $("#psitNmR").val(result.custInfoDS[0].psitNm);
                     $("#officetelNoR").data("kendoMaskedTextBox").value(result.custInfoDS[0].officetelNo);
                     $("#officeFaxNoR").val(result.custInfoDS[0].officeFaxNo);
                     $("#driverTpR").data("kendoExtDropDownList").value(result.custInfoDS[0].driverTp);
                     $("#ageCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].ageCd);
                     $("#marryDtR").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].marryDt);      // 결혼기념일
                     $("#birthDtR").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].birthDt);      // 생일
                     $("#acCareerCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].acCareerCd);
                     $("#incomeLvlCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].incomeLvlCd);
                     $("#hobbyCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].hobbyCd);
                     $("#sexCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].sexCd);
                     $("#prefContactMthCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactMthCd);
                     $("#prefContactTimeCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactTimeCd);
                     $("#prefCommNoR").val(result.custInfoDS[0].prefCommNo);
                     $("#marryCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].marryCd);
                     $("#avgCarChgCdR").data("kendoExtDropDownList").value(result.custInfoDS[0].avgCarChgCd);
                     $("#siebelRowIdR").val(result.custInfoDS[0].siebelRowId);

                     // CheckBox
                     var bhmcYnR = result.custInfoDS[0].bhmcYn;
                     var smsReceiveYnR = result.custInfoDS[0].smsReceiveYn;
                     var telReceiveYnR = result.custInfoDS[0].telReceiveYn;
                     var dmReceiveYnR = result.custInfoDS[0].dmReceiveYn;
                     var emailReceiveYnR = result.custInfoDS[0].emailReceiveYn;
                     var faxReceiveYnR = result.custInfoDS[0].faxReceiveYn;
                     var perInfoAgreeYnR = result.custInfoDS[0].perInfoAgreeYn;
                     var perInfoUseYnR = result.custInfoDS[0].perInfoUseYn;

                     if (bhmcYnR == 'Y'){ $("#bhmcYnR").prop("checked", true) };
                     if (smsReceiveYnR == 'Y'){ $("#smsReceiveYnR").prop("checked", true) };
                     if (telReceiveYnR == 'Y'){ $("#telReceiveYnR").prop("checked", true) };
                     if (dmReceiveYnR == 'Y'){ $("#dmReceiveYnR").prop("checked", true) };
                     if (emailReceiveYnR == 'Y'){ $("#emailReceiveYnR").prop("checked", true) };
                     if (faxReceiveYnR == 'Y'){ $("#faxReceiveYnR").prop("checked", true) };
                     if (perInfoAgreeYnR == 'Y'){ $("#perInfoAgreeYnR").prop("checked", true) };
                     if (perInfoUseYnR == 'Y'){ $("#perInfoUseYnR").prop("checked", true) };

                 }

                 if (result.groupDS.length != 0 ){
                     groupDS = [];
                     groupTxt = "";
                     var groupDsItem;
                     for(i=0 ;  i < result.groupDS.length ; i++){
                         groupDsItem = result.groupDS[i];
                         if (i==0){
                             groupTxt = groupDsItem.grpNm;
                         }else{
                             groupTxt = groupTxt+", "+groupDsItem.grpNm;
                         }
                         groupDS.push({"grpSeq":groupDsItem.grpSeq,"grpTp":"001"});
                     }
                     $("#groupTxt").val(groupTxt);
                 }

                 if (result.tagDS.length != 0 ){
                     tagDS = [];
                     tagTxt = "";
                     var tagDsItem;
                     for(i=0 ;  i < result.tagDS.length ; i++){
                         tagDsItem = result.tagDS[i];
                         if (i==0){
                             tagTxt = tagDsItem.grpNm;
                         }else{
                             tagTxt = tagTxt+", "+tagDsItem.grpNm;
                         }
                         tagDS.push({"grpSeq":tagDsItem.grpSeq,"grpTp":"002"});
                     }
                     $("#tagTxt").val(tagTxt);
                 }
                     // Mode 변경
                     $("#pageMode").val("updateMode");

             });
         }


     });

     console.log("--- Cust No ----");
     console.log($("#custNoR").val());

/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

//iframeCallBack();

});


</script>









<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<section id="content">
    <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='crm.lbl.infoInput' /><!-- 정보입력 --></h2>
                <div class="title_btn">
                    <!-- <span class="co_open co_close"><span>상세내용 접기 </span></span> -->
                </div>
            </div>
            <div class="formarea" id="formarea" >
                <table class="flist01">
                    <caption><spring:message code="global.lbl.basicInfo" /><!-- 기본정보--></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="required" ><spring:message code="crm.lbl.visitDt" /><!-- 방문시간 /내방시간 --></th>
                            <td>
                                <div class="f_item01">
                                    <input type="datetime-local" id="vsitDt" name="vsitDt" style="background-color:#ffffff;" data-json-obj="true"  />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.goOutTime" /><!-- 떠난시간 --></th>
                            <td>
                                <div class="f_item01">
                                    <input type="datetime-local" id="vsitEndDt" name="vsitEndDt" style="background-color:#ffffff;" data-json-obj="true"  />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.visitCount' /><!-- 방문인원수/ --></th>
                            <td>
                                <div class="f_text"><input type="text" id="vsitPrsnCnt" name="vsitPrsnCnt"  maxlength="2" data-json-obj="true"  /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.revisitYn' /><!-- 재방문여부/ --></th>
                            <td>
                                <div class="con_btnarea btncount3">
                                    <div style="width:33%"><span id="rvsitYn01" class="btnd1" style="font-size:12px"><spring:message code='crm.lbl.firstVist' /></span></div>       <!-- 첫방문 -->
                                    <div style="width:40%"><span id="rvsitYn02" class="btnd1" style="font-size:12px"><spring:message code='crm.lbl.vistAgain' /></span></div>    <!-- 재방문 -->
                                    <div style="width:27%"><span id="rvsitYn03" class="btnd1" style="font-size:12px"><spring:message code='crm.lbl.visitEtc' /></span></div>       <!-- 기타 -->
                                </div>
                                <input id="rvsitYn" name="rvsitYn" type="hidden" class="form_index" value="01" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.tdrvYn' /><!-- 시승여부/ --></th>
                            <td>
                                <input type="checkbox" id="testDrvYn" name="testDrvYn" class="f_check" data-json-obj="true" /><label for="testDrvYn"></label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="co_group">
                <div class="content_title ">
                    <h1><spring:message code='global.title.basicInfo' /><!-- 기본정보 --></h1>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /><!-- 기본정보--></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody  >
                                <tr id="trCustNmC">
                                    <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --> </th>
                                    <td class="f_smulti">
                                        <div class="f_sbox" style="width:73%;">
                                            <div class="f_item01 f_required">
                                                <input id="custNmSearch" name="custNmSearch" type="text" value="" />
                                                <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                                <span class="search" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span>
                                            </div>
                                        </div>
                                        <div class="f_btn" style="width:27%;">
                                            <span class="btn_itemexe_on" id="btn_scan"><spring:message code="mob.lbl.scan" /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled   "><input type="text" id="custNo" name="custNo" data-json-obj="true" readonly="readonly" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custTp" name="custTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" class="numberic" id="hpNo" name="hpNo" maxlength="11" data-json-obj="true" class="getHpNoChkByKey" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" ><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mathDocTp" name="mathDocTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.homeTelNo" /><!-- 집전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="telNo" name="telNo" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                                    <td>
                                        <div class="f_text"><input id="ssnCrnNoC" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" maxlength="30" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="bizcondCdC" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="global.lbl.officeTelNo" /><!-- 회사전화 --></th>
                                    <td>
                                        <div class="f_text"><input id="officeTelNoC" type="number" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.wechatId" /><!-- Wechat ID --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="wechatId" name="wechatId" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sex' /><!-- 성별 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sexCd" name="sexCd" data-json-obj="true"  /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 이메일 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="emailNm" name="emailNm" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="addrNmTr">
                                    <th scope="row"><spring:message code='crm.lbl.addrNm' /><!-- 주소 --></th>
                                    <td>
                                        <p id="addrNm" name="addrNm" readonly="readonly" style="border-bottom: 1px solid #909090; min-height: 38px; box-sizing: border-box; padding: 8px" ></p>
                                    </td>
                                </tr>
                                <tr class="addrNmTr">
                                    <th scope="row"></th>
                                    <td>
                                        <p id="addrNmDetail" name="addrNmDetail" readonly="readonly" style="border-bottom: 1px solid #909090; min-height: 38px; box-sizing: border-box; padding: 8px" ></p>
                                    </td>
                                </tr>
                                <tr class="fromScanID fromScanDirver" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.birthday" /><!--생일 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="birthDt" name="birthDt" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="fromScanID" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.usrIdNo" /><!--주민번호 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="juminNo" name="juminNo" maxlength="40" /></div>
                                    </td>
                                </tr>
                                <tr class="fromScanDirver" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!--증서번호 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="ssnCrnNo" name="ssnCrnNo" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="fromScanNamecard" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.deptNm" /><!--부서 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="deptNm" name="deptNm" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="fromScanNamecard" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.cmpNm" /><!--회사 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="officeNm" name="officeNm" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!-- //co_group  -->

            <!-- 주소  -->
            <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoAddressList.jsp"></c:import>
            <!-- // 주소  -->

            <!-- 유입경로  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.expcPurcInfo" /></h2>
                    <div class="title_btn">
                        <!-- <span class="co_open co_close"><span>상세내용 접기 </span></span> -->
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /><!-- 기본정보--></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.infoType' /><!-- 정보유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="infoTp" name="infoTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.approchLocation' /><!-- 정보경로 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="holdTp" name="holdTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <div class="f_text">
                                        <input type="text" id="holdDetlTpSeq" name="holdDetlTpSeq" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.payMethod' /><!-- 지불방식 --></th>
                                    <td>
                                        <div class="f_text"><input type="text"  id="payTp" name="payTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expectPureTime' /><!-- 예상구매시간코드/예상구매시간 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="expcPurcHmCd" name="expcPurcHmCd" data-json-obj="true" /></div>
                                    </td>
                                </tr> --%>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.intentionCarline' /><!-- 의향차종/의향브랜드 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrCarlineCd" name="intrCarlineCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionVariant' /><!-- 의향차관 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrFscpModtpCd" name="intrFscpModtpCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향색상 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrColorCd" name="intrColorCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.plateNum' /><!-- 현지번호판예정 --></th>
                                    <!-- <td>
                                        <div class="f_text"><input type="text" id="natNofScheNo" name="natNofScheNo" data-json-obj="true"  /></div>
                                    </td> -->
                                    <td>
                                                <div class="form_float">
                                                    <div class="form_left" style="width:16%" >
                                                        <input id="localCarRegNoYn" name="localCarRegNoYn" type="checkbox" class="f_check" /><label for="localCarRegNoYn"></label>
                                                    </div>
                                                </div>
                                            </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 유입경로  -->

            <!-- 기타정보  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.estimateInfo' /><!-- 견적정보 --></h2>
                    <div class="title_btn">
                        <!-- <span class="co_open co_close"><span>상세내용 접기 </span></span> -->
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /><!-- 기본정보--></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.estimateInfo' /><!-- 견적정보 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="estimateCont" name="estimateCont" maxlength="50" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.promotionCont' /><!-- 판촉내용 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id=salesCont name="salesCont" maxlength="100" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.remark' /><!-- 비고설명 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="remark" name="remark" maxlength="100" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 기타정보  -->

            <!-- 리드상태  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.btn.etc" /><spring:message code="global.lbl.infoData" /></h2>
                    <div class="title_btn">
                        <!-- <span class="co_open co_close"><span>상세내용 접기 </span></span> -->
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /><!-- 기본정보--></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.prsn' /><!-- 담당자 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mngScId" name="mngScId" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 기타정보  -->

            <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
            <input type="hidden" id="btnCustSearch" />
            <input type="hidden" id="dlrCd" name="dlrCd"  data-json-obj="true" />
            <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
            <!-- <input type="hidden" id="custSearch" name="custSearch"  class="custSearch" /-->

            <input type="hidden" id="leadStatCd" name="leadStatCd" data-json-obj="true"  />
            <input type="hidden" id="btnNextStep" />
        </section>
    </div><!--  salesOpptProcForm End  -->

    <!-- 버튼 3개  -->
    <div class="con_btnarea btncount3">
        <div style="width:64%"><span class="btnd1" id="btnNextStepBefore"><spring:message code='crm.btn.activeProcessSend' /><!-- 추적|추진으로 제출 --></span></div>
        <div style="width:18%"><span class="btnd1" id="btnSave"><spring:message code='global.btn.confirm' /><!-- 확인 --></span></div>
        <div style="width:18%"><span class="btnd1" id="btnCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
    </div>
    <!-- //버튼  -->

</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>

<!-- 신분증종류 팝업  -->
    <section class="lay_pop" id="lay_01" style="display:none;">
        <div class="lay_title">
            <h1><spring:message code='sal.lbl.ssnCrnTp' /></h1>
        </div>
        <div class="lay_cont5">
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:100%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="pl5">
                                <div><input type="radio" id="radio01" name="radio" class="f_radio" checked value="1" /><label for="radio01"><spring:message code='crm.lbl.radio.identification' /></label></div>
                                <%-- <div><input type="radio" id="radio02" name="radio" class="f_radio" value="1" /><label for="radio02" ><spring:message code='crm.lbl.radio.identification_02_front' /><!-- 이대신분증(앞면) --></label></div>
                                <div><input type="radio" id="radio03" name="radio" class="f_radio" value="1" /><label for="radio03" ><spring:message code='crm.lbl.radio.identification_02_back' /><!-- 이대신분증(뒷면) --></label></div>
                                <div><input type="radio" id="radio04" name="radio" class="f_radio" value="1" /><label for="radio04" ><spring:message code='crm.lbl.radio.identification_temp' /><!-- 임시신분증 --></label></div> --%>
                                <div><input type="radio" id="radio05" name="radio" class="f_radio" value="2" /><label for="radio05" ><spring:message code='crm.lbl.radio.driverslicense' /><!-- 운전면허증 --></label></div>
                                <div><input type="radio" id="radio06" name="radio" class="f_radio" value="3" /><label for="radio06" ><spring:message code='crm.lbl.namecard' /><!-- 명함 --></label></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btnarea">
            <span class="btnd1t2" onclick="layerClose('.lay_pop')"><spring:message code='global.btn.cancel' /></span>
            <span class="btnd1" id="goToScan"><spring:message code='global.btn.confirm' /></span>
        </div>
    </section>
    <!--  //신분증종류 팝업  -->
    <%-- <!-- 명함정보 팝업  -->
    <section class="lay_pop" id="lay_02" style="display:none;top:40px">
        <div class="lay_title">
            <h1><spring:message code='crm.lbl.namecardinfo' /></h1>
        </div>
        <div class="lay_cont5">
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:35%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.name' /><!-- 이름 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                    <input type="text" id="popName" value="" name="" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.phoneNo' /><!-- 전화번호 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="popPhone" value="" name="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cmpNm' /><!-- 회사명 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                    <input type="text" id="popCompanyNm" value="" name="" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.officeTelNo' /><!-- 회사전화 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="popCompanyPhone" value="" name="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.addrNm' /><!-- 주소 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="popAddress" value="" name="">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btnarea">
            <span class="btnd1t2" onclick="layerClose('.lay_pop')"><spring:message code='global.btn.close' /><!-- 닫기 --></span>
            <!-- <span class="btnd1">저장</span> -->
        </div>
    </section>
    <!--  //명함정보 팝업  --> --%>


 <script type="text/javascript">
    var dateFormat =  '<dms:configValue code="dateFormat" />';

     var addrTpList = [];
     var addrTpMap = [];
     var chgBuyYnDS = [];
     var chgBuyYnMap = [];
     var carlineCdList = [];
     var carlineCdMap = [];
     var colorCdList = [];
     var colorCdMap = [];
     var mngScIdList = [];
     var mngScIdMap = [];
     var infoPathCdList = [];
     var infoPathCdMap = [];

     var holdTpList = [];
     var holdTpMap = [];
     var holdDetlTpSeqList = [];
     var holdDetlTpSeqMap = [];

     var leadStatCdList = [];
     var leadStatCdMap = [];
     var sexCdList = [];
     var sexCdMap = [];
     var modelCdList = [];
     var modelCdMap = [];
     var activeGradeCdList = [];
     var activeGradeCdMap = [];

     var custTpList = [];
     var custTpMap = [];
     var infoTpList = [];
     var payTpList = [];
     var expcPurcHmCdList = [];

     var bizcondCdList   = [];
     var mathDocTpList = [];
     var mathDocTpListScan = [];

     <c:forEach var="obj" items="${mathDocTpList}">
      <%-- <c:if test="${obj.remark1 == 'C'}"> --%>
         mathDocTpListScan.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         <%-- </c:if> --%>
  </c:forEach>

  <c:forEach var="obj" items="${mathDocTpList}">
  <c:if test="${obj.remark1 == 'C'}">
     mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
  </c:forEach>


  <c:forEach var="obj" items="${bizcondCdList}">
     bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:forEach>

     <c:forEach var="obj" items="${holdTpList}">
         holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${holdDetlTpSeqList}">
         holdDetlTpSeqList.push({"cmmCd":"${obj.holdSeq}" , "cmmCdNm":"${obj.holdDetlTpNm}", "useYn":"${obj.delYn}"});
         holdDetlTpSeqMap["${obj.holdSeq}"] = "${obj.holdDetlTpNm}";
     </c:forEach>

     <c:forEach var="obj" items="${expcPurcHmCdList}">
         expcPurcHmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${payTpList}">
         payTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${infoTpList}">
         infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${custTpList}">
         custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${leadStatCdList}">
         leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${sexCdList}">
         sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

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

     //색상조회
     <c:forEach var="obj" items="${colorCdList}">
         colorCdList.push({extColorNm:"${obj.extColorNm}", extColorCd:"${obj.extColorCd}"});
         colorCdMap["${obj.extColorCd}"] = "${obj.extColorNm}";
     </c:forEach>


    $(document).ready(function() {
        $("#vsitDt").val(chgServerDate2Str(new Date()) + "T"+ chgDate2TimeStr(new Date()));

        $("#rvsitYn01").kendoButton({
            click:function(e) {
                $("#rvsitYn01").css("background-color","#0052a6");
                $("#rvsitYn01").css("border-color","#0052a6");
            }
        });

        $("#rvsitYn01").click();

        // 고객확보유형1      holdTp      (CRM008)
        $("#holdTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , dataSource:holdTpList
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           /* , filter:"contains"
           , filtering:function(e){
               var filter = e.filter;
           } */
           ,select:onSelectSearchHoldTp
       });

// 고객확보유형2      holdDetlTpSeq   (CRM***)
        $("#holdDetlTpSeq").kendoExtDropDownList({
           dataTextField:"holdDetlTpNm"
           , dataValueField:"holdSeq"
           //, filter:"contains"
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           , enable:false
        });

        $("#infoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:infoTpList
            , index:0
        });

        $("#infoTp").data("kendoExtDropDownList").value("01");
        $("#infoTp").data("kendoExtDropDownList").enable(false);

        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:custTpList
            , index:0
        });

        $("#payTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:payTpList
            , index:0
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
            , dataSource:bizcondCdList
            , index:0
            , enable:true
        });

        /* $("#expcPurcHmCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:expcPurcHmCdList
            , index:0
        }); */

        /**
         * 차종 콤보박스
         */
        $("#intrCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:"<spring:message code='global.lbl.check'/>"
           /* , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           } */
           ,select:onSelectSearchCarlineCd
        });

        /**
         * 모델 콤보박스
         */
         $("#intrFscpModtpCd").kendoExtDropDownList({
             dataTextField:"fscNm"
            ,dataValueField:"fscCd"
            //,filter:"contains"
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
         });
         $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);

        $("#intrColorCd").kendoExtDropDownList({
            dataTextField:"extColorNm"
            , dataValueField:"extColorCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:colorCdList
            , index:0
        });

        $("#mngScId").kendoExtDropDownList({
            dataTextField:"usrNm"
            , dataValueField:"usrId"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:mngScIdList
            , index:0
            /* , filter:"contains"
            , filtering:function(e){
                var filter = e.filter;
            } */
        });

//         $("#leadStatCd").kendoExtDropDownList({
//             dataTextField:"cmmCdNm"
//             , dataValueField:"cmmCd"
//             , optionLabel:" "
//             , dataSource:leadStatCdList
//             , index:0
//         });

        $("#sexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:sexCdList
            , index:0
        });

        // 첫방문
        $("#rvsitYn01").click(function(){
           $("#rvsitYn").val("01");

           $("#rvsitYn01").css("background-color","#0052a6");
           $("#rvsitYn01").css("border-color","#0052a6");

           $("#rvsitYn02").css("background-color","#1b8deb");
           $("#rvsitYn02").css("border-color","#1b8deb");

           $("#rvsitYn03").css("background-color","#1b8deb");
           $("#rvsitYn03").css("border-color","#1b8deb");
        });

        // 재방문
        $("#rvsitYn02").click(function(){
           $("#rvsitYn").val("02");

           $("#rvsitYn01").css("background-color","#1b8deb");
           $("#rvsitYn01").css("border-color","#1b8deb");

           $("#rvsitYn02").css("background-color","#0052a6");
           $("#rvsitYn02").css("border-color","#0052a6");

           $("#rvsitYn03").css("background-color","#1b8deb");
           $("#rvsitYn03").css("border-color","#1b8deb");
        });

        // 기타
        $("#rvsitYn03").click(function(){
           $("#rvsitYn").val("03");

           $("#rvsitYn01").css("background-color","#1b8deb");
           $("#rvsitYn01").css("border-color","#1b8deb");

           $("#rvsitYn02").css("background-color","#1b8deb");
           $("#rvsitYn02").css("border-color","#1b8deb");

           $("#rvsitYn03").css("background-color","#0052a6");
           $("#rvsitYn03").css("border-color","#0052a6");
        });


     // 휴대전화 판매기회에 있는지 확인
        $(".getHpNoChkByKey").focusout(function(){
            var idValue = $(this).context.id;
            getHpNoChkByKey(idValue);
        });

        // 숫자
        var onlyNum = new RegExp("[^0-9]","i");
        $(".numberic").keyup(function(e)
        {
            var content = $(this).val();

            if(content.match(onlyNum)){
                //console.log($(this).val());
                $(this).val('');
            }
        });

        // 숫자와 알파벳
        var onlyNumAlpha = new RegExp("[^A-Z0-9]");
        $(".numberandalpha").keyup(function(e)
        {

            var contents = $(this).val();
            //console.log(contents);
            //console.log(onlyNumAlpha.test(contents));
            if(onlyNumAlpha.test(contents)){

                $(this).val('');
            }
        });

     // 이메일   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
        //var onlyEmail = new RegExp("^[a-zA-Z0-9]{2,15}@[a-zA-Z0-9]{1,10}(\.[a-zA-Z]{2,3}){1,2}$");
        //var onlyEmail = new RegExp("^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$");
       $(".form_email").keyup(function(e)
       {
           var onlyEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

           var contents = $(this).val();
           //console.log(contents);
           //console.log(onlyEmail.test(contents));
           if(onlyEmail.test(contents)){
               //$(this).val('');
           }
       });

       // 고객명에서 ObKeyDown
       $(".onKey_down").keydown(function(e){
           if (e.keyCode == 13) {
               if($(this).val() != "") {
                   $(".custSearch").click();
               }
           }
       });

        // 버튼 - 이전
       $("#docu_prev").bind("click", function()
       {
           parent.$("#formarea").show();
           if ($("#content_detail").css("display") == "block") { goMain(); }
           //else if ($("#content_pop_search").css("display") == "block") { contentList(); }
           //else if ($("#content_detail").css("display") == "block") { contentList(); }
       });

       $('#custTp').change(function(){
           if($("#custTp").data("kendoExtDropDownList").value() == "01"){
               $('.person').show();
               $('.crop').hide();
               $('#trCustNmC > th').html('<spring:message code="global.lbl.custNm" />');
           }else{
               $('.crop').show();
               $('.person').hide();
               $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
           }
       });


       $("#btnCustSearch").click(function(){
           var param = {};
           param["sCustNo"] = $("#custNo").val();

           console.log("btnCustSearch Call !!");
           console.log(param);

            mob.loading.show();
           $.ajax({
               url:"<c:url value='/crm/cif/customerRegistPresent/customerListSearch.do' />"
               , data:JSON.stringify(param)
               , type:'POST'
               , dataType:'json'
               , contentType:'application/json'
               , error:function(jqXHR,status,error){
                   //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   console.log("error !!!");

                    mob.loading.hide();
                    console.log(jqXHR);

                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
               }
           }).done(function(result) {
                mob.loading.hide();

               console.log(result);
               $("#dlrCd").val(result.data[0].dlrCd);

               $("#custNm").val(result.data[0].custNm);
               $("#custNmSearch").val(result.data[0].custNm);
               $("#custNo").val(result.data[0].custNo);
               $("#custTp").val(result.data[0].custTp);
               $("#custTp").data("kendoExtDropDownList").value(result.data[0].custTp);
               $("#custTp").data("kendoExtDropDownList").enable(false);
               $("#hpNo").val(result.data[0].hpNo);
               $("#telNo").val(result.data[0].telNo);
               $("#officeTelNo").val(result.data[0].officeTelNo);
               $("#wechatId").val(result.data[0].wechatId);
               $("#emailNm").val(result.data[0].emailNm);
               $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);
               $("#holdTp").data("kendoExtDropDownList").value(result.data[0].holdTp);
               $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([{holdSeq:result.data[0].holdDetlTpSeq, holdDetlTpNm:trimNull(result.data[0].holdDetlTpSeqNm)}]);
               $("#holdDetlTpSeq").data("kendoExtDropDownList").value(result.data[0].holdDetlTpSeq);
               $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
               $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{modelNm:result.data[0].intrFscpModtpNm, modelCd:result.data[0].intrFscpModtpCd}]);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);
               $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
               $("#natNofScheNo").val(result.data[0].natNofScheNo);
               $("#estimateCont").val(result.data[0].estimateCont);
               $("#salesCont").val(result.data[0].salesCont);
               $("#remark").val(result.data[0].remark);
               $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
               $("#beforeMngScId").val(result.data[0].mngScId);
               //$("#leadStatCd").data("kendoExtDropDownList").value(result.data[0].leadStatCd);
               $("#leadStatCd").val(result.data[0].leadStatCd);
               $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
               $("#seq").val(result.data[0].seq);
               $("#vsitPrsnCnt").val(result.data[0].vsitPrsnCnt);

               $("#vsitDt").val(result.data[0].vsitDt);              //내방일
               //$("#vsitTime").val(chgDate2TimeStr(result.data[0].vsitDt));        //내방시간
               $("#vsitEndDt").val(result.data[0].vsitEndDt);        //떠난일
               //$("#vsitEndTime").val(chgDate2TimeStr(result.data[0].vsitEndDt));  //떠난시간


               //if (result.data[0].rvsitYn == 'Y'){ $("#rvsitYn").prop("checked", true) };
               if (result.data[0].testDrvYn == 'Y'){ $("#testDrvYn").prop("checked", true) };


               if ( dms.string.isEmpty(result.data[0].vsitEndDt) ) {
                   runTime(result.data[0].vsitDt, result.data[0].vsitEndDt);
               } else {
                    $("#btnNextStepBefore").data("kendoButton").enable(false);
                    $("#btnSave").data("kendoButton").enable(false);
               }

               $("#mathDocTp").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
               $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
               $("#bizcondCdC").data("kendoExtDropDownList").value(result.data[0].bizcondCd);
               $("#officeTelNoC").val(result.data[0].officeTelNo);




               //$("#custTp").data("kendoExtDropDownList").value();

               if (result.data[0].custTp == "01") {
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
/*
               if (dms.string.isNotEmpty(result.data[0].custNo)) {
                   if (result.data[0].custTp == "01") {
                       $("#hpNo").parent().addClass('f_disabled');
                       $("#hpNo" ).prop('readonly', true);
                       $("#officeTelNo").parent().removeClass('f_disabled');
                       $("#officeTelNo" ).prop('readonly', false);
                   } else {
                       $("#officeTelNo").parent().addClass('f_disabled');
                       $("#officeTelNo" ).prop('readonly', true);
                       $("#hpNo").parent().removeClass('f_disabled');
                       $("#hpNo" ).prop('readonly', false);
                   }
                   $("#custTp").data("kendoExtDropDownList").enable(false);
               }
*/
               //$("#addrGrid").data("kendoExtGrid").dataSource.read();

           });
        });

       // 고객조회
       //var custSearch = function() {
        $("#custSearch").click(function(){

            /* var custTp = $("#custTp").data("kendoExtDropDownList").value();
            var custNm = $("#custNmSearch").val();

            popupWindow = dms.window.popup({
                windowId:"customerSearchPopupMain"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "custNm":custNm
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Popup Search Result111:::");
                                console.log(data[0]);

                                if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                    $("#custNo").val(data[0].custNo);
                                }
                                popupWindow.close();
                                $("#btnCustSearch").click();
                            }
                        }
                    }
                }
            }) */
            var custTp = $("#custTp").data("kendoExtDropDownList").value();
            var custNm = $("#custNmSearch").val();
            if (custTp == "02") {
                custNm = $("#custNmSearchC").val();
            }

            parent.custSearchPop(callbackCust,custNm);
        });

       var options = parent.newCustPopupWindow.options.content.data;

       //$("#leadStatCd").data("kendoExtDropDownList").value(options.leadStatCd);
       $("#leadStatCd").val(options.leadStatCd);

       //$("#popName").val(result.Name);

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.$("#formarea").show();
                parent.newCustPopupWindow.close();
            }

        });

        $("#btnNextStepBefore").kendoButton({
            click:function(e) {
                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var beforeMngScId = $("#beforeMngScId").val();
                var vsitDt = $("#vsitDt").val();
                var hpNo = $("#hpNo").val();
                var custNmSearch = $("#custNmSearch").val();
                var holdTp = $("#holdTp").val();
                var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

                var infoTp = $("#infoTp").data("kendoExtDropDownList").value();

              //방문인원수
                var vsitPrsnCnt = $("#vsitPrsnCnt").val();

                if (vsitPrsnCnt=="") {
                    $("#vsitPrsnCnt").val("1");
                }

                // 방문시간
                if ( dms.string.isEmpty(vsitDt)) {
                    mob.notification.info("<spring:message code='crm.lbl.visitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                    return false;
                };

                vsitDt = chgDateTimeStamphhMM($("#vsitDt").val());
                var vsitEndDt = chgDateTimeStamphhMM($("#vsitEndDt").val());

                if ($("#vsitEndDt").val()!="" && vsitDt > vsitEndDt) {
                    mob.notification.warning("<spring:message code='crm.lbl.goOutTime' var='returnMsg'/><spring:message code='crm.lbl.visitDt' var='returnMsg2'/><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}'/>");
                    return false;
                }

                // 담당자
                if ( dms.string.isEmpty(mngScId) ) {
                    mob.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // 이동전화
                if ( dms.string.isEmpty(hpNo) ) {
                    mob.notification.info("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // 고객명
                if ( dms.string.isEmpty(custNmSearch) ) {
                    mob.notification.info("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // 리드출처
                if ( dms.string.isEmpty(holdTp) ) {
                    mob.notification.info("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // 리드유형
                if ( dms.string.isEmpty(infoTp) ) {
                    mob.notification.info("<spring:message code='crm.lbl.leadTp' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                //의향차종
                if ( dms.string.isEmpty(intrCarlineCd) ) {
                    mob.notification.info("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };




                $("#btnNextStep").click();
            }
        });

        // 다음 스탭으로 저장 버튼.
        $("#btnNextStep").kendoButton({
            click:function(e){
                console.log("btnNextStep Call !!");
                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();

                var salesOpptProcParam =
                    $("#salesOpptProcForm").serializeObject(
                            $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
                    );

                var addrParam = {};

               var dataSource = $("#subListView").data("kendoListView").dataSource;//document.getElementById("addressList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
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
                salesOpptProcParam["leadStatCd"] = "04";
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["vsitDt"] =  chgDateTimeStamphhMM($("#vsitDt").val()); // $("#vsitDt").data("kendoDateTimePicker").value();
                //salesOpptProcParam["vsitEndDt"] = chgDateTimeStamphhMM($("#vsitEndDt").val() + " " + $("#vsitEndTime").val());    //$("#vsitEndDt").data("kendoDateTimePicker").value();
                salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();

                if (custTp == "02"){
                    salesOpptProcParam["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
                    salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                    salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                    salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
                    salesOpptProcParam["wechatId"] = $("#wechatId").val();
                    salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                }
                var sVsitEndDt = $("#vsitEndDt").val();
                if(dms.string.isEmpty(sVsitEndDt)){
                    salesOpptProcParam["vsitEndDt"] = null;
                }else{
                    salesOpptProcParam["vsitEndDt"] = $("#vsitEndDt").val();//chgDateTimeStamphhMM($("#vsitEndDt").val() + " " + $("#vsitEndTime").val());
                }

                //if ($("#rvsitYn").prop("checked")){ salesOpptProcParam["rvsitYn"] = "Y" } else { salesOpptProcParam["rvsitYn"] = "N" };
                salesOpptProcParam["rvsitYn"] = $("#rvsitYn").val();

                if ($("#testDrvYn").prop("checked")){ salesOpptProcParam["testDrvYn"] = "Y" } else { salesOpptProcParam["testDrvYn"] = "N" };

                if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };


                var saveData = $.extend(
                    {"salesOpptShowRoomMgmtVO":salesOpptProcParam }
                    , {"addressInfoVOList":addrGridData}
                );

                console.log("Saving of Request Info. !!");
                console.log(saveData);

                mob.loading.show();
                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptShowRoom.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        console.log("error !!!");

                        mob.loading.hide();
                        console.log("error",jqXHR);
                        var responseText = JSON.parse(jqXHR.responseText);
                        mob.notification.error(responseText.errors[0].errorMessage);
                    },
                    success:function(result){
                        mob.loading.hide();

                        console.log(result);
                        console.log("success!!!!");
                        mob.notification.success("<spring:message code='global.info.success'/>");

                        var data = [];
                        //data.push(result);
                        //options.callbackFunc(data);
                        options.callbackFunc(data);
                        //parent.contentListNonRefresh();
                        parent.newCustPopupWindow.close();
                    }
                }).done(function(result) {
                    console.log("Done!!!!");
                    parent.$("#formarea").show();
                });


            }
        });

        // 저장 버튼.
        $("#btnSave").kendoButton({
            click:function(e){

                var vsitDt = $("#vsitDt").val();

                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();

                // 방문시간
                if ( dms.string.isEmpty(vsitDt)) {
                    mob.notification.info("<spring:message code='crm.lbl.visitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                    return false;
                };

                // 담당자
                if ( dms.string.isEmpty(mngScId) ) {
                    mob.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                /*
                var hpPattern=/^1[34578][0-9]{9}$/;
                if(!hpPattern.test($("#hpNo").val())){
                    mob.notification.info("<spring:message code='crm.info.regExpHpNo' />");
                    return false;
                }
                */

                /* var phonePattern1=/^0[1-9][0-9][1-9][0-9]{7}$/;
                var phonePattern2=/^0[1-9][0-9][1-9][0-9]{6}$/;
                var phonePattern3=/^0[1-9][0-9]{2}[1-9][0-9]{7}$/;
                var phonePattern4=/^0[1-9][0-9]{2}[1-9][0-9]{6}$/;
                var phonePattern5=/^[1-9][0-9]{7}$/;
                var phonePattern6=/^[1-9][0-9]{6}$/;
                var phonePatternBool = false;
                phonePatternBool=phonePattern1($("#telNo").val());
                phonePatternBool=phonePattern2($("#telNo").val());
                phonePatternBool=phonePattern3($("#telNo").val());
                phonePatternBool=phonePattern4($("#telNo").val());
                phonePatternBool=phonePattern5($("#telNo").val());
                phonePatternBool=phonePattern6($("#telNo").val());
                if(!phonePatternBool){
                    mob.notification.info("<spring:message code='crm.info.regExpTelNo' />");
                    return false;
                } */

                var salesOpptProcParam =
                    $("#salesOpptProcForm").serializeObject(
                            $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
                    );

                var addrParam = {};

                var dataSource = $("#subListView").data("kendoListView").dataSource;//document.getElementById("addressList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
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

                var sVsitEndDt = $("#vsitEndDt").val();//chgDateTimeStamphhMM($("#vsitEndDt").val() + " " + $("#vsitEndTime").val());
                salesOpptProcParam["leadStatCd"] = "99";
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                salesOpptProcParam["vsitDt"] =  chgDateTimeStamphhMM($("#vsitDt").val()); // $("#vsitDt").data("kendoDateTimePicker").value();
                salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();

                if (custTp == "02"){
                    salesOpptProcParam["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
                    salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                    salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                    salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
                    salesOpptProcParam["wechatId"] = $("#wechatId").val();
                    salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                }

                if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };


                 var sVsitEndDt = $("#vsitEndDt").val();
                if(dms.string.isEmpty(sVsitEndDt)){
                    salesOpptProcParam["vsitEndDt"] = null;
                }else{
                    salesOpptProcParam["vsitEndDt"] = $("#vsitEndDt").val();//chgDateTimeStamphhMM($("#vsitEndDt").val() + " " + $("#vsitEndTime").val());
                }

                //if ($("#rvsitYn").prop("checked")){ salesOpptProcParam["rvsitYn"] = "Y" } else { salesOpptProcParam["rvsitYn"] = "N" };
                salesOpptProcParam["rvsitYn"] = $("#rvsitYn").val();
                if ($("#testDrvYn").prop("checked")){ salesOpptProcParam["testDrvYn"] = "Y" } else { salesOpptProcParam["testDrvYn"] = "N" };

                var saveData = $.extend(
                    {"salesOpptShowRoomMgmtVO":salesOpptProcParam }
                    , {"addressInfoVOList":addrGridData}
                );


                //20170411 hg
                if($("#vsitPrsnCnt").val() == "" || $("#vsitPrsnCnt").val() == 0 ){
                    salesOpptProcParam["vsitPrsnCnt"] = 1;
                }
                salesOpptProcParam["infoTp"] = "01"
                //20170411 hg

                console.log("전시장관리 btnSave Saving of Request Info. !!");
                console.log("salesOpptProcParam",salesOpptProcParam);
                console.log("saveData",saveData);

                mob.loading.show();
                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptShowRoom.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        var responseText = JSON.parse(jqXHR.responseText);
                        console.log(responseText.errors[0].errorMessage);

                        mob.loading.hide();
                        console.log(jqXHR);

                        if(responseText.errors.length>0){
                            if(responseText.errors[0].errorMessage.search("이동전화 번호가 규칙에 맞지 않습니다.")>-1){
                                mob.notification.error("<spring:message code='crm.info.regExpHpNo'/>");
                            }else if(responseText.errors[0].errorMessage.search("전화번호가 규칙에 맞지 않습니다.")>-1){
                                mob.notification.error("<spring:message code='crm.info.regExpTelNo'/>");
                            }

                        }else{
                            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        }

                    },
                    success:function(result){
                        mob.loading.hide();

                        console.log(result);
                        console.log("success!!!!");
                        parent.$("#formarea").show();
                        mob.notification.success("<spring:message code='global.info.success'/>");

                        var data = [];
                        //data.push(result);
                        options.callbackFunc(data);
                        parent.newCustPopupWindow.close();
                    }
                }).done(function(result) {
                    console.log("Done!!!!");
                    parent.$("#formarea").show();
                });
            }
        });

        $("#btn_scan").click(function (){
            var w=$("body").width();
            var gap=w*0.1;
            var pw=w*0.8;

            $("#lay_01").width(pw);
            $("#lay_01").css("margin",gap+"px");
            $("#lay_01").css("top","10%");

            //var win = $("#lay_01").data("kendoWindow").center().open();

            $("#lay_01").show();
            $("body").append("<div class='blind' onclick='layerClose()'></div>");
            $(".blind").show().animate({opacity:'0.4'},500);

        });

        $("#goToScan").click(function (){
            //$("#lay_01").hide();
            layerClose('.lay_pop');
            var scanGubun=$('input[name="radio"]:checked').val();

            $(".fromScanID").hide();
            $(".fromScanDirver").hide();
            $(".fromScanNamecard").hide();
            $(".addrNmTr").hide();

            if(scanGubun=="1"){
                $(".fromScanID").show();
                $("#mathDocTp").val("01");
            }else if(scanGubun=="2"){
                $(".fromScanDirver").show();
                $("#mathDocTp").val("06");
            }else if(scanGubun=="3"){
                $(".fromScanNamecard").show();
                $("#mathDocTp").val("06");
            }

            try{
                var userAgent = navigator.userAgent.toLowerCase();
                if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                    || (userAgent.search("ipad") > -1))
                {
                    document.location='bhmccp://openCameraForScanner?type='+scanGubun+'&return_func=setScanInfo';
                }else
                {
                    window.bhmccp.openCameraForScanner(scanGubun,'setScanInfo');
                }
            }catch(e){
               /* var jsonData="{\"Name\":\"刘静\",\"Sex\":\"男\",\"Ethnicity\":\"汉\",\"Date of Birth\":\"1981-10-05\",\"Domicile\":\"河北省保定市清苑县育红街育英胡同1号楼3单元101号\",\"Identification Number\":\"130622198110058032\"}";
                setScanInfo(jsonData); */
            }

            var getRoopScanInfo=setInterval(
                    function(){
                        console.log("parent.scanCustNm :: "+parent.scanCustNm);
                        if(parent.scanCustNm!=""){
                            $("#custNmSearch").val(parent.scanCustNm);

                            console.log("scanCellPhone : "+parent.scanCellPhone);

                            if(parent.scanCellPhone.length>0){
                                $("#hpNo").val(parent.scanCellPhone.replace(/-/gi,""));
                            }else{
                                $("#hpNo").val("");
                            }
                            $("#emailNm").val(parent.scanEmail);

                            $("#deptNm").val(parent.scanDepartment);
                            $("#officeNm").val(parent.scanCompany);
                            //$("#telNo").val(parent.scanPhone.replace(/-/gi,""));

                            $("#birthDt").val(parent.scanDateofBirth);
                            $("#juminNo").val(parent.scanIdentificationNumber);
                            if(parent.scanIdentificationNumber==""){
                                $("#ssnCrnNo").val(parent.scanIdentificationNumber);
                            }
                            $("#ssnCrnNo").val(parent.scanDirverNumber);
                            if(parent.scanPhone.length>0){
                                $("#telNo").val(parent.scanPhone.replace(/-/gi,""));
                            }else{
                                $("#telNo").val("");
                            }
                            if(parent.scanSex=="男"){
                                $("#sexCd").data("kendoExtDropDownList").value("M");
                            }else if(parent.scanSex=="女"){
                                $("#sexCd").data("kendoExtDropDownList").value("F");
                            }
                            $("#custTp").addClass("disabled");
                            //$("#addrFull").val(parent.scanDomicile);
                            parent.scanCustNm="";
                            parent.scanDepartment="";
                            parent.scanCompany="";
                            parent.scanEmail="";
                            parent.scanZipCode="";
                            parent.scanHomepage="";
                            parent.scanFax="";
                            parent.scanCellPhone="";
                            parent.scanAddress="";
                            parent.scanPhone="";
                            parent.scanSex="";
                            parent.scanEthnicity="";
                            parent.scanDateofBirth="";
                            parent.scanDomicile="";
                            parent.scanIdentificationNumber="";
                            parent.scanDirverNumber="";

                            clearInterval(getRoopScanInfo);
                        }
                    },1000);
        });

        $("#infoCheck").click(function (){
            var w=$("body").width();
            var gap=w*0.1;
            var pw=w*0.8;

            $("#lay_02").width(pw);
            $("#lay_02").css("margin",gap+"px");

            $("#lay_02").show();
            $("body").append("<div class='blind' onclick='layerClose()'></div>");
            $(".blind").show().animate({opacity:'0.4'},500);

        });






        //주소리스트
        //$("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
        //주소리스트
        $("#btnAddrSearch").click(function(){
            //$("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
            //document.getElementById("addressList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
        });

        //버튼 - 주소  추가
        // 고객상세 주소 그리드
        $("#btnAddAddress").click(function(){
            parent.zipcodeSearchPop(callbackAddr);
        });

        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }
        subListData.read();

        parent.$("#formarea").hide();

    });

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
     function onSelectSearchCarlineCd(e){
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(true);

        var dataItem = this.dataItem(e.item);
        if(dataItem.carlineCd == ""){
            $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do' />"
            ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
            ,async:false
        });
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

    /** [조회조건 영역] ComboBox Select() **/
     // 정보경로에 따른 상세경로 조회
     function onSelectSearchHoldTp(e){
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
         $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

         var dataItem = this.dataItem(e.item);
         console.log("dataItem onSelectSearchHoldTp:::::::::::::::::::");
         console.log(dataItem);
         if(dataItem.cmmCd == ""){
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
             ,async:false
         });
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);

     }

    function runTime(startDt,endDt) {
        var periodTime;
        var startTime = new Date(startDt);
        var startMsec = startTime.getMilliseconds();
        startTime.setTime(endDt);
        var elapsed = (startTime.getTime() - startMsec) / 1000;
        console.log("run Time:" + elapsed);

        return elapsed;
    }

    //주소추가 팝업 callback
    function callbackAddr(data){
        //document.getElementById("addressList").contentWindow.addItemSubList1(data);
        addrAddItemSubList1(data);
     }

     //addressList change Event Callback
    function saveAddressList(){
        //nothing
    }

    //고객검색 팝업 callback
    function callbackCust(data){
        console.log(">>>> callbackCust <<<<");
        $("#custNo").val(data.custNo);
         $("#btnCustSearch").click();
    }

    function goMain(){
        parent.newCustPopupWindow.close();
    }

    function getHpNoChkByKey(idVal){
        console.log("getHpNoChkByKey!!!!");
        var custTp = $("#custTp").data("kendoExtDropDownList").value();
        var hpNo = $("#hpNo").val();
        var chkContinued = false;

        if (hpNo.length > 10 ) {
            chkContinued = true;
        }

        if (chkContinued){

            var param = {};
            param["sCustTp"]       = custTp;    // 개인 , 법인

            param["sHpNo"]         = hpNo;

            console.log("getHpNoChkByKey : ");
            console.log(param);

            $.ajax({
                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtsByConditionCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    //console.log(jqXHR.responseJSON);
                    var responseText = jqXHR.responseText;
                    mob.notification.info(responseText.errors[0].errorMessage);
                },
                success:function(result){

                    var salesOpptCnt = result.salesOpptCnt;
                    var custInfoCnt = result.custInfoCnt;

                    if ( salesOpptCnt == 1 ) {
                        dms.notification.warning("<spring:message code='crm.info.processingSaOpMsg' arguments='"+result.salesOpptVO.leadStatNm+","+result.salesOpptVO.custNm+","+result.salesOpptVO.custCdNm+"' />");
                    } else if ( salesOpptCnt >= 2 ) {
                        dms.notification.warning("<spring:message code='crm.info.processingLeadAndCnt' arguments='"+salesOpptCnt+"' />");
                    };

                    if ( custInfoCnt > 0 ) {
                        dms.notification.warning("<spring:message code='crm.info.hpNodupMsg' />");  // 핸드폰번호 존재함
                    };

                }
            });
        }
    }

 </script>


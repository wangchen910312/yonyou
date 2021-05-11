<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


    <section id="content">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
        </div>
        <!-- 개인 기본정보  -->
        <div id="customerForm" name="customerForm" onsubmit="return false;">
        <div id="personalDiv">
        <div class="co_group">
            <div class="formarea">
                <table class="flist01">
                    <caption>고객 기본정보입니다. </caption>
                    <colgroup>
                        <col style="width:34%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                            <td>
                                <div class="f_text f_required"><input type="text" class="form_comboBox" id="custTp" name="custTp" data-json-obj="true"/></div>
                                <input type="hidden" id="custCd" name="custCd" data-json-obj="true" value="01" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="custNm" name="custNm" maxlength="30"  data-json-obj="true" />
                                    <input id="custNo" name="custNo" type="hidden" value="" class="form_input" readonly data-json-obj="true" />
                                    <input id="pageMode" name="pageMode" type="hidden" value="insertMode" readonly data-json-obj="true" />
                                    <input type="hidden" id="docId" name="docId" data-json-obj="true" />

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.sex' /><!-- 성별 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" class="form_comboBox" id="sexCd" name="sexCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.ssnCrnTp" /><!-- 신분증유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" class="form_comboBox" id="mathDocTp" name="mathDocTp" data-json-obj="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.perPapaerNo" /><!-- 신분증번호 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="ssnCrnNo" name="ssnCrnNo" placeholder=" " data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC 여부 --></th>
                            <td>
                                <input type="checkbox" id="bhmcYn" name="bhmcYn" class="f_check" /><label for="bhmcYn"></label>
                                <input id="siebelRowId" name="siebelRowId" type="hidden" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.custHoldTp" /><!-- 정보출처 --></th>
                            <td>
                                <div class="f_text f_required"><input type="text" class="form_comboBox" id="custHoldTp" name="custHoldTp" data-json-obj="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td>
                                <div class="f_text"><input type="text" class="form_comboBox" id="custHoldTpDtl" name="custHoldTpDtl" data-json-obj="true" readonly /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"  class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --><!-- <span class="btn_plusitem">항목추가</span>  --></th>
                            <td>
                                <div class="f_itemexe01">
                                    <div class="f_text f_required">
                                        <input type="number" class="numberic" id="hpNo" name="hpNo" maxlength="20" data-json-obj="true">
                                    </div>
                                    <span class="btn_itemexe_off" id="smsReceiveYn" name="smsReceiveYn"><spring:message code='global.lbl.reject' /><!-- 거부 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"  class="required"><spring:message code="global.lbl.homeTelNo" /><!-- 집전화 --></th>
                            <td>
                                <div class="f_itemexe01">
                                    <div class="f_text f_required">
                                        <input type="text" value="" id="telNo" name="telNo" maxlength="20" data-json-obj="true">
                                    </div>
                                    <span class="btn_itemexe_off" id="telReceiveYn" name="telReceiveYn"><spring:message code='global.lbl.reject' /><!-- 거부 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 직장전화 --></th>
                            <td>
                                <div class="f_itemexe01">
                                    <div class="f_text">
                                        <input type="number" class="numberic" value="" id="officeTelNo" name="officeTelNo" maxlength="20" data-json-obj="true" >
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"  class="required"><spring:message code="global.lbl.fax" /><!-- FAX --></th>
                            <td>
                                <div class="f_itemexe01">
                                    <div class="f_text f_required">
                                        <input type="text" value="" id="officeFaxNo" name="officeFaxNo" maxlength="20" data-json-obj="true">
                                    </div>
                                    <span class="btn_itemexe_off" id="faxReceiveYn" name="faxReceiveYn" ><spring:message code='global.lbl.reject' /><!-- 거부 --></span>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"  class="required"></th>
                            <td>
                                <input type="checkbox" id="hpNoInvldYn" name="hpNoInvldYn" class="f_check" /><label for="hpNoInvldYn"><spring:message code="global.lbl.hpNoInvld" /><!-- 휴대폰번호 무효 --></label>
                                <input type="checkbox" id="hpNoAddImposYn" name="hpNoAddImposYn" class="f_check" /><label for="hpNoAddImposYn"><spring:message code="global.lbl.hpNoAddImpos" /><!-- 휴대폰번호 수정불가 --></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.email" /><!-- E-Mail --></th>
                            <td>
                                <div class="f_itemexe01">
                                    <div class="f_text">
                                        <input id="emailNm" name="emailNm" type="email" maxlength="40" data-json-obj="true">
                                    </div>
                                    <span class="btn_itemexe_off" id="emailReceiveYn" name="emailReceiveYn" ><spring:message code='global.lbl.reject' /><!-- 거부 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.wechatId" /><!-- We-Chat ID --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="wechatId" name="wechatId" maxlength="20" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.qq" /><!-- QQ --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="qqId" name="qqId" maxlength="20" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.prefCommMthCd" /><!-- 선호연락방법 --></th>
                            <td>
                                <div class="f_text f_required"><input type="text" id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox f_required" data-json-obj="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.prefCommNo" /><!-- 선호연락처 --></th>
                            <td>
                                <div class="f_text f_required">
                                    <input type="text" id="prefCommNo" name="prefCommNo" maxlength="20" placeholder="" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.prefContactMthCd" /><!-- 우선연락방식 --></th>
                            <td>
                                <div class="f_text"><input type="text" class="form_comboBox" id="prefContactMthCd" name="prefContactMthCd" data-json-obj="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.prefContactTime" /><!-- 우선연락시간 --></th>
                            <td>
                                <div class="f_text"><input type="text" class="form_comboBox" id="prefContactTimeCd" name="prefContactTimeCd" data-json-obj="true" /></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
        <!-- // 개인 기본정보  -->

        <!-- 법인 개본정보 -->
        <div id="corporateDiv"  style="display:none">
        <div class="co_group">
            <div class="formarea">
                <table class="flist01">
                    <caption>고객 기본정보 </caption>
                    <colgroup>
                        <col style="width:34%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="custTpC" name="custTpC" class="form_comboBox"  data-json-obj="true"/>
                                </div>
                                <input type="hidden" id="custCdC" name="custCdC" data-json-obj="true" value="01" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <div class="f_text f_required">
                                    <input type="text" id="custNmC" name="custNmC" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="custNoC" name="custNoC" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ownRgstNm" /><!-- 대표자명 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="ownRgstNm" name="ownRgstNm" maxlength="30" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                            <td>
                                <div class="f_text">
                                    <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                            <td>
                                <div class="f_text">
                                    <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value=""  maxlength="30" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC 여부 --></th>
                            <td>
                                <input type="checkbox" id="bhmcYnC" name="bhmcYnC" class="f_check" data-json-obj="true" /><label for="bhmcYnC"></label>
                                <input id="siebelRowIdC" name="siebelRowIdC" type="hidden" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required" ><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                            <td>
                                <div class="f_text f_required">
                                    <input id="mngScNmC" name="mngScNmC" type="text" value="" class="form_input"  />
                                    <input id="mngScIdC" name="mngScIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.prsnSA" /><!-- 담당SA --></th>
                            <td>
                                <div class="f_text">
                                    <input id="mngTecNmC" name="mngTecNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecIdC" name="mngTecIdC" type="hidden" value="" class="form_input form_readonly"  data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custHoldTp" /><!-- 정보출처 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" class="form_comboBox" id="custHoldTpC" name="custHoldTpC" data-json-obj="true" data-json-obj="true"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" class="form_comboBox" id="custHoldTpDtlC" name="custHoldTpDtlC" disabled />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.officeTelNo" /><!-- 대표전화 --></th>
                            <td>
                                <div class="f_text f_required">
                                    <input type="number" class="numberic" id="officeTelNoC" name="officeTelNoC" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.fax" /><!-- FAX --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="officeFaxNoC" name="officeFaxNoC" data-json-obj="true"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 대표 E-MAIL --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="emailNmC" name="emailNmC" data-json-obj="true"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" class="form_comboBox" id="bizcondCdC" name="bizcondCdC" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmpScale" /><!-- 회사규모 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="cmpScaleContC" name="cmpScaleContC" data-json-obj="true"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmpTp" /><!-- 회사유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" class="form_comboBox" id="cmpTpC" name="cmpTpC" data-json-obj="true"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.group" /><!-- 그룹  --></th>
                            <td>
                                <div class="f_item01">
                                    <input type="text" id="custGroupsC" name="custGroupsC" >
                                    <span class="search" id="btnAddGroupsC" >검색</span>
                                    <input type="hidden" id="custGroupsCSeq" name="custGroupsCSeq"  />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.tag" /><!-- 태그 --> </th>
                            <td>
                                <div class="f_item01">
                                    <input type="text" id="custTagsC" name="custTagsC" >
                                    <span class="search" id="btnAddTagsC">검색</span>
                                    <input type="hidden" id="custTagsCSeq" name="custTagsCSeq" />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
        <!-- //법인 개본정보 -->


        <!-- 상세정보  -->
        <div id="personalDetailDiv">
        <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보 --></h2>
                <div class="title_btn">
                    <span class="co_open"><span>상세내용 접기 </span></span>
                    <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
                </div>
            </div>
            <div class="co_view">
                <div class="formarea">
                    <div class="agreement">
                        <input type="checkbox" id="perInfoAgreeYn" name="perInfoAgreeYn" class="f_check" /><label for="perInfoAgreeYn"><spring:message code="global.lbl.infoAgreedocId" /><!-- 정보활동 동의서 동의 --></label>
                        <input type="checkbox" id="perInfoUseYn" name="perInfoUseYn" class="f_check" /><label for="perInfoUseYn"><spring:message code="global.lbl.infoUsrYn" /><!-- 정보 사용 동의 --></label>
                    </div>
                    <table class="flist01">
                        <caption>고객 상세정보 </caption>
                        <colgroup>
                            <col style="width:34%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.buyAddCnt' /><!-- 추가구매 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="buyCnt" name="buyCnt" maxlength="10" data-json-obj="true" placeholder="" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.chgBuy' /><!-- 교환구매 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="chgBuyYn" name="chgBuyYn" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="purcCarBrandCd" name="purcCarBrandCd" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text"  placeholder="" id="purcCarModelNm" name="purcCarModelNm" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.birthday" /><!-- 생일 --></th>
                                <td>
                                    <div class="f_item01">
                                        <input type="search" id="birthDt" name="birthDt" value="" data-json-obj="true">
                                        <span class="date" onclick="calpicker('birthDt')">날짜선택</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.age" /><!-- 나이 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text"  placeholder="" id="ageDtl" name="ageDtl" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.chinaZodiacSign" /><!-- 띠 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="chinaZodiacSignCd" name="chinaZodiacSignCd" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.zodiacSign" /><!-- 별자리 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="zodiacSignCd" name="zodiacSignCd"  data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bloodTp" /><!-- 혈액형 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="bloodTp" name="bloodTp" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.marryYn" /><!-- 결혼여부 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="marryCd" name="marryCd" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.marryDt" /><!-- 결혼기념일 --></th>
                                <td>
                                    <div class="f_item01">
                                        <input type="search" id="marryDt" name="marryDt" >
                                        <span class="date" onclick="calpicker('marryDt')">날짜선택</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.childrenCnt" /><!-- 자녀수 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="childrenCnt" name="childrenCnt" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.group" /><!-- 그룹 --></th>
                                <td>
                                    <div class="f_item01">
                                        <input type="text" id="custGroups" name="custGroups" value="" class="">
                                        <span class="search" id="btnAddGroups">검색</span>
                                        <input type="hidden" id="custGroupsSeq" name="custGroupsSeq" />

                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.tag" /><!-- 태그  --></th>
                                <td>
                                    <div class="f_item01">
                                        <input type="text" id="custTags" name="custTags"  value="" class="form_comboBox">
                                        <span class="search" id="btnAddTags">검색</span>
                                        <input type="hidden" id="custTagsSeq" name="custTagsSeq"  />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.officeNm" /><!-- 직장명 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="officeNm" name="officeNm" maxlength="20" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="bizcondCd" name="bizcondCd" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.cmpScale" /><!-- 회사규모 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="cmpScaleCont" name="cmpScaleCont" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.cmpTp" /><!-- 회사유형 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" class="form_comboBox" id="cmpTp" name="cmpTp" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.job" /><!-- 직업군 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="jobCd" name="jobCd" data-json-obj="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.deptNm" /><!-- 부서 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="deptNm" name="deptNm" maxlength="20" data-json-obj="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.jobNm" /><!-- 직무명 --></th>
                                <td>
                                    <div class="f_text"><input type="text" class="form_comboBox" id="dutyCd" name="dutyCd" data-json-obj="true" /></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <!-- // 상세정보  -->
        </div>
        <!-- //customerForm -->

        <!-- 주소  -->
        <div class="co_group">
            <div class="content_title ">
                <h2><spring:message code='global.lbl.addr' /><!-- 주소 --></h2>
                <div class="title_btn">
                    <span class="tbtn" id="btnAddAddress" ><spring:message code='global.lbl.add' /><!-- 추가 --></span>
                    <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                </div>
            </div>
            <div class="co_view" style="display:none;">
                <ul>
                    <li>
                        <div class="deleteitem listhead">
                            <span style="width:35%"><spring:message code='global.lbl.selectAddr' /><!-- 우편주소 --></span>
                            <span style="width:35%"><spring:message code='global.lbl.type' /><!-- 유형 --></span>
                            <span style="width:100%"><spring:message code='crm.lbl.addr1' /><!-- 소재지 주소 --></span>
                            <span class="clboth" style="width:100%"><spring:message code='global.lbl.detlAddr' /><!-- 상세주소 --></span>
                        </div>
                    </li>
                </ul>
                <iframe id="addressList" border="0" frameborder="0" width="100%" height="300"></iframe>
            </div>
        </div>
        <!-- // 주소  -->

        <!-- 연계인  -->
        <div class="co_group">
            <div class="content_title">
                <h2><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></h2>
                <div class="title_btn">
                    <span class="tbtn" id="btnCustSearch"><spring:message code='global.lbl.add' /><!-- 추가 --></span>
                    <span class="co_open co_close" id="btnRelSearch"><span>상세내용 접기 </span></span>
                </div>
            </div>
            <div class="co_view" style="display:none;">
                <ul>
                    <li>
                        <div class="deleteitem listhead">
                            <span style="width:35%"><spring:message code='global.lbl.type' /><!-- 유형 --></span>
                            <span style="width:40%"><spring:message code='global.lbl.custNm' /><!-- 이름 --></span>
                            <span style="width:25%"><spring:message code='global.lbl.hpNo' /><!-- 휴대폰번호 --></span>
                            <span class="clboth" style="width:35%"><spring:message code='global.lbl.ssnCrnNo' /><!-- 신분증번호 --></span>
                            <span style="width:65%"><spring:message code='global.lbl.emailNm' /><!-- 이메일 --></span>
                            <span class="clboth" style="width:35%"><spring:message code='global.lbl.prefCommMthCd' /><!-- 선호연락방법 --></span>
                            <span style="width:65%"><spring:message code='global.lbl.prefCommNo' /><!-- 선호연락처 --></span>
                            <span class="clboth" style="width:35%"><spring:message code='global.lbl.prefContactMthCd' /><!-- 우선연락방식 --></span>
                            <span style="width:65%"><spring:message code='global.lbl.prefContactTime' /><!-- 우선연락시간 --></span>
                        </div>
                    </li>
                    <iframe id="relList" border="0" frameborder="0" width="100%" height="300"></iframe>
                </ul>
            </div>
        </div>
        <!-- // 연계인  -->

        <!-- 버튼 2개  -->
        <div class="con_btnarea btncount2">
            <div><span class="btnd1t2"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
            <div><span class="btnd1" id="btnCustSave"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
        </div>
    </section>

    <!-- 그룹/태그  -->
    <section class="lay_pop" id="lay_05" >
        <div class="lay_title">
            <h1>그룹선택</h1>
        </div>
        <div class="lay_cont">
            <ul class="grouplist">
            </ul>
        </div>
        <div class="btnarea">
            <span class="btnd1t2" onclick="layerClose('#lay_05')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>
            <span class="btnd1" id="btnSetGroups"><spring:message code='global.btn.save' /><!-- 저장 --></span>
        </div>
    </section>
    <!--  // 그룹/태그  -->


    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>




<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

//현재일자
var toDate = new Date();

/**/

var popupWindow;
var groupTxt;
var tagTxt;
var groupDS = [];
var hobbyDS = [];
var tagDS   = [];
var custGroups = [];
var custTags = [];
var custHobbys = [];
var custGroupsC = [];
var custTagsC = [];
var pointCdListMap = [];

var getParamChk             = "${getParamChk}";
var loginDlrCd              = "${dlrCd}";
var custNo                  = "${custNo}";
var custTpList              = [];
var custTpMap         = [];
var cardTpCdList              = [];
var cardTpCdMap         = [];
var custCdList              = [];
var custCdMap = [];
var custHoldTpList          = [];
var custHoldTpDtlList       = [];
var sexCdList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var mathDocTpList           = [];
var mbrGradeCdList          = [];
var mathDocTpListC          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var pconTpList              = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var addrTpList              = [];
var ageCdList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var driverTpList            = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var jobCdList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var cmpTpList               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var acCareerCdList          = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var marryYnList             = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var prefCommMthCdList       = [];
var chgBuyYnDS              = [];
var chgBuyYnMap             = [];
var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var purcCarBrandCdMap       = [];
var chinaZodiacSignCdDS     = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var zodiacSignCdDS          = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var bloodTpDS               = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];
var dutyCdDS                = [{"cmmCd":"", "cmmCdNm":"<spring:message code='global.lbl.check' />"}];


var prefCommMthCdMap        = [];
var mathDocTpMap            = [];
var mathDocTpMapC            = [];
var pconTpMap               = [];
var addrTpMap               = [];
var prefContactMthCdMap     = [];
var prefContactTimeCdMap    = [];



//교환구매 브랜드
<c:forEach var="obj" items="${purcCarBrandCdDS}">
purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
purcCarBrandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//띠
<c:forEach var="obj" items="${chinaZodiacSignCdDS}">
chinaZodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//별자리
<c:forEach var="obj" items="${zodiacSignCdDS}">
zodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//혈액형
<c:forEach var="obj" items="${bloodTpDS}">
bloodTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//직무
<c:forEach var="obj" items="${dutyCdDS}">
dutyCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객유형
<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


<c:forEach var="obj" items="${custCdList}">
custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//선호연락방법
<c:forEach var="obj" items="${prefCommMthCdList}">
prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//고객확보유형
<c:forEach var="obj" items="${custHoldTpList}">
custHoldTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객확보유형2
<c:forEach var="obj" items="${custHoldTpDtlList}">
custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
</c:forEach>

 //성별
<c:forEach var="obj" items="${sexCdList}">
sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//신분증유형
 <c:forEach var="obj" items="${mathDocTpList}">
    <c:if test="${obj.remark1 == 'P'}">
        mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>

    <c:if test="${obj.remark1 == 'C'}">
          mathDocTpListC.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
          mathDocTpMapC["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
 </c:forEach>


//연령
<c:forEach var="obj" items="${ageCdList}">
ageCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//주운전자
<c:forEach var="obj" items="${driverTpList}">
driverTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//직업군
<c:forEach var="obj" items="${jobCdList}">
jobCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//업종
<c:forEach var="obj" items="${bizcondCdList}">
bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사규모
<c:forEach var="obj" items="${cmpScaleContList}">
cmpScaleContList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사유형
<c:forEach var="obj" items="${cmpTpList}">
cmpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${acCareerCdList}">
acCareerCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//결혼여부
<c:forEach var="obj" items="${marryYnList}">
marryYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//우선연락방식
<c:forEach var="obj" items="${prefContactMthCdList}">
prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//우선연락시간
<c:forEach var="obj" items="${prefContactTimeCdList}">
prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//평균차량교체시기
<c:forEach var="obj" items="${avgCarChgCdList}">
avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//그룹
var custGroupsMap = [];
<c:forEach var="obj" items="${custGroups}">
custGroups.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
custGroupsMap["${obj.grpSeq}"] = "${obj.grpNm}";
</c:forEach>

//태그
var custTagsMap = [];
<c:forEach var="obj" items="${custTags}">
custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
custTagsMap["${obj.grpSeq}"] = "${obj.grpNm}";
</c:forEach>

/**/





var searchAddr = false;
var searchRel = false;
$(document).ready(function() {

    /*************************************************************
    드랍다운 리스트 셋팅
    *************************************************************/

    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
            } else {
                $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                $("#personalDiv").hide();
                $("#personalDetailDiv").hide();

                $("#corporateDiv").show();
            }
        }
    });

    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:1
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                $("#personalDiv").show();
                $("#personalDetailDiv").show();
                $("#corporateDiv").hide();
            } else {
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
            }
        }
    });

    // 성별 드랍다운 리스트.
    $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.check' />"   // 전체
        , dataSource:sexCdList
        , index:0
    });

/*

 // 잠재/보유고객      custCd              (CRM023)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:custCdList
        , index:0
        //,  value:"01"
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
        }
    });
    $("#custCd").data("kendoExtDropDownList").value("01");

    // 잠재/보유고객      custCdC              (CRM023)
    $("#custCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:custCdList
        , index:0
        , value:"01"
    });
    $("#custCdC").data("kendoExtDropDownList").value("01");
 */

 // 선호연락방법       prefCommMthCd (CRM022)
     $("#prefCommMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:prefCommMthCdList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#prefCommNo").val($("#hpNo").val());
            } else if (selcmmCd == "02") {
                $("#prefCommNo").val($("#telNo").val());
            } else {
                $("#prefCommNo").val($("#officeTelNo").val());
            }
        }
    });

    // 신분증유형            mathDocTp       (CRM024)
    $("#mathDocTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:mathDocTpList
       , index:0
   });

    // 신분증유형            mathDocTpC       (CRM024)
    $("#mathDocTpC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:mathDocTpListC
       , index:0
   });
 // 고객확보유형1      custHoldTp      (CRM008)
    $("#custHoldTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:custHoldTpList
       , index:1
       , change:function(){
           var selcmmCd = this.dataItem(this.select()).cmmCd;
           var custHoldTpDtl = $("#custHoldTpDtl").data("kendoExtDropDownList");
           if (selcmmCd == "01"){
               custHoldTpDtl.enable(true);
           } else {
               custHoldTpDtl.value("");
               custHoldTpDtl.enable(false);
           }
       }
   });

// 고객확보유형2      custHoldTpDtl   (CRM***)
    $("#custHoldTpDtl").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:custHoldTpDtlList
       , index:0
       , enable:false
   });

    // 고객확보유형1      custHoldTpC      (CRM008)
    $("#custHoldTpC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:custHoldTpList
       , index:1
       , change:function(){
           var selcmmCd = this.dataItem(this.select()).cmmCd;
           var custHoldTpDtl = $("#custHoldTpDtlC").data("kendoExtDropDownList");
           if (selcmmCd == "01"){
               custHoldTpDtl.enable(true);
           } else {
               custHoldTpDtl.value("");
               custHoldTpDtl.enable(false);
           }
       }
   });

// 고객확보유형2      custHoldTpDtlC   (CRM***)
    $("#custHoldTpDtlC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:custHoldTpDtlList
       , index:1
       , enable:false
   });

// 직업군                  jocCd                   (CRM002)
    $("#jobCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //   , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:jobCdList
       , index:0
   });

// 업종                  bizcondCd
    $("#bizcondCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:bizcondCdList
       , index:0
   });

// 회사규모                  cmpScaleContList       (CRM026)
    $("#cmpScaleCont").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"-"
       , dataSource:cmpScaleContList
       , index:0
   });

// 회사유형                  cmpTp
    $("#cmpTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:cmpTpList
       , index:0
   });

// 업종                  bizcondCdC
    $("#bizcondCdC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:bizcondCdList
       , index:0
   });

// 회사규모                  cmpScaleContListC       (CRM026)
    $("#cmpScaleContC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:cmpScaleContList
       , index:0
   });

// 회사유형                  cmpTpC
    $("#cmpTpC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:cmpTpList
       , index:0
   });


// 주 운전자                driverTp            (CRM015)
    $("#driverTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:driverTpList
       , index:0
   });

// 연령                       ageCd                 (CRM014)
    $("#ageCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:ageCdList
       , index:0
   });

// 학력                       acCareerCd      (CRM012)
    $("#acCareerCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:acCareerCdList
       , index:0
   });

// 소득수준             incomeLvlCd     (CRM013)
    $("#incomeLvlCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:incomeLvlCdList
       , index:0
   });

 // 우선연락방식                       prefContactMthCd    (CRM038)
    $("#prefContactMthCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:prefContactMthCdList
       , index:0
   });

// 우선연락시간                       prefContactTimeCd      (CRM027)
    $("#prefContactTimeCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:prefContactTimeCdList
       , index:0
   });

// 결혼여부                       marryYnList          (CRM028)
    $("#marryCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:marryYnList
       , index:0
   });

// 평균차량 교체 시기                       avgCarChgCdList    (CRM029)
    $("#avgCarChgCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:avgCarChgCdList
       , index:0
   });

    //교환구매여부
    $("#chgBuyYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:chgBuyYnDS
        , index:0
    });
//교환구매 브랜드
    $("#purcCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:purcCarBrandCdDS
        , index:0
    });
    //띠
    $("#chinaZodiacSignCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:chinaZodiacSignCdDS
        , index:0
    });

    //별자리
    $("#zodiacSignCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:zodiacSignCdDS
        , index:0
    });

    //혈액형
    $("#bloodTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:bloodTpDS
        , index:0
    });

    //직무명
    $("#dutyCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.check' />"
        , dataSource:dutyCdDS
        , index:0
    });
/*
 // 딜러멤버십 등급
    $("#gradeCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:"<spring:message code='global.lbl.check' />"
       , dataSource:mbrGradeCdList
       , index:0
       , enable:false
   });

    //메모 유형
    $("#memoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:memoTpDS
        , index:0
    });
 */
    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#customerForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();


    //e-mail 수신거부
    $("#emailReceiveYn, #faxReceiveYn, #smsReceiveYn, #telReceiveYn").click(function(){

        changeClass(this);
    });

    //수신거부 선택 클래스 변경
    function changeClass(obj){
        var className = $(obj).attr("class");

        var newClassNm = "";
        if(className.indexOf("off") > -1){
            newClassNm = "btn_itemexe_on";
            $(obj).val("Y");
            $(obj).text("<spring:message code='global.lbl.recv' />");
            //
        }else{
            newClassNm = "btn_itemexe_off";
            $(obj).val("N");
            $(obj).text("<spring:message code='global.lbl.reject' />");
        }
        $(obj).attr("class", newClassNm);
    }


    //주소정보 iframe
    $("#btnAddrSearch").click(function(){
        if(!searchAddr){
            searchAddressList();
            searchAddr = true;
        }
    });

    //연계인(추가기능) gridRel
    $("#btnRelSearch").click(function(){
        if(!searchRel){
            searchRelList();
            searchRel = true;
        }
    });

    //주소
    function searchAddressList(){
        $("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
    }
    //연계인
    function searchRelList(){
        $("#relList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectcustomerRelSearchList.do' />");
    }

    //버튼 - 주소  추가
    var zipCodeSearchPopupWin;
    $("#btnAddAddress").click(function(){

      if(searchAddr){
          zipCodeSearchPopupWin = mob.window.popup({
              windowId:"zipCodeSearchPopupMain"
              , content:{
                  url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                  , data:{
                      "autoBind":false
                      ,"usrNm":""
                      , "callbackFunc":function(data){
                          //console.log(data);
                          if (data != null || data != 'undefined') {
                              document.getElementById("addressList").contentWindow.addItemSubList1(data);
                          }
                      }
                  }
              }
          })
      }
    });

    //address 저장
    function saveAddressList(){
        // 주소 정보 필수 확인
        var dataSource = document.getElementById("addressList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;

        var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

        var total = saveData.deleteList.length + saveData.insertList.length + saveData.updateList.length;
        if (total == 0){
            dms.notification.info("<spring:message code='global.info.required.change' />");
            return;
        }

        //console.log(saveData);

       /*  $.ajax({
            url:"<c:url value='/crm/cmm/addressInfo/multiAddressInfo.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                console.log("failed!!");
            },
            success:function(jqXHR, textStatus){
                dms.notification.info("<spring:message code='global.info.success' />");

                searchAddressList();
            }
        }); */

    }


    // 고객 검색 팝업
    var popupWindow  ;
    $("#btnCustSearch").click(function(){
        if(searchRel ){
            popupWindow = mob.window.popup({
                windowId:"customerSearchPopupMain"
                , content:{
                    url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if ( dms.string.isNotEmpty(data.custNo) ) {
                                //연계인list 추가
                                document.getElementById("relList").contentWindow.addItemSubList1(data);
                            }
                        }
                    }
                }
            })
        }
    });

    //relList 저장
    function saveRelList(){
        var dataSource = document.getElementById("relList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;

        var saveData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

        var total = saveData.deleteList.length + saveData.insertList.length + saveData.updateList.length;
        if (total == 0){
            dms.notification.info("<spring:message code='global.info.required.change' />");
            return;
        }

        console.log(">>>> saveRelList 저장합니다! <<<<")
        //console.log(saveData);

        //if (grid.gridValidation()){
         /*    $.ajax({
                url:"<c:url value='/mob/crm/cif/customerInfo/multiCustomerRelChg.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    console.log("failed!!");
                },
                success:function(jqXHR, textStatus){

                    dms.notification.info("<spring:message code='global.info.success' />");

                    searchRelList();
                }
            }); */
        /* }else{
            globalNotification.show("<spring:message code='global.info.check.input' />", "error");
        } */
    }



    //저장
    $("#btnCustSave").kendoButton({
        click:function(e) {

            var custTpVal = $("#custTp").data("kendoExtDropDownList").value();

            if (custTpVal == "01") {
                // 개인 필수 항목 체크
                //고객명
                if ( dms.string.isEmpty($("#custNm").val())) {
                    dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custNm").focus();
                    return false;
                }

                //휴대폰번호
                if ( dms.string.isEmpty($("#hpNo").val())) {
                    dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#hpNo").focus();
                    return false;
                }

                //선호연락방법
                if ( dms.string.isEmpty($("#prefCommMthCd").data("kendoExtDropDownList").value())) {
                    dms.notification.warning("<spring:message code='global.lbl.prefCommMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#prefCommMthCd").focus();
                    return false;
                }

                //선호연락처
                if ( dms.string.isEmpty($("#prefCommNo").val())) {
                    dms.notification.warning("<spring:message code='global.lbl.prefCommNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#prefCommNo").focus();
                    return false;
                }

            } else {
                // 법인 필수 항목 체크
                //법인명
                if ( dms.string.isEmpty($("#custNmC").val())) {
                    dms.notification.warning("<spring:message code='crm.lbl.corpNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custNmC").focus();
                    return false;
                }
                //회사전화
                if ( dms.string.isEmpty($("#officeTelNoC").val())) {
                    dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#officeTelNoC").focus();
                    return false;
                }

            }

            // 주소 정보 필수 확인
/*             var grid = $("#addrList").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (grid.cudDataLength != 0){
                if ((saveData.insertList.length != 0) || (saveData.updateList.length != 0)) {
                    if($("input.flagYn:checked", "#addrGrid").length != 1 ){
                        dms.notification.warning("<spring:message code='global.lbl.selectAddr' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                        return false;
                    }
                }
            } */

            // form 데이터
            var param =
                $("#customerForm").serializeObject(
                    $("#customerForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" } else { param["bhmcYn"] = "N" };

          //수신여부
            if($("#smsReceiveYn").hasClass("btn_itemexe_on")){param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
            if($("#telReceiveYn").hasClass("btn_itemexe_on")){param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
            if($("#emailReceiveYn").hasClass("btn_itemexe_on")){param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
            if($("#faxReceiveYn").hasClass("btn_itemexe_on")){param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };

            /* if ($("#smsReceiveYn").prop("checked")){ param["smsReceiveYn"] = "Y" } else { param["smsReceiveYn"] = "N" };
            if ($("#telReceiveYn").prop("checked")){ param["telReceiveYn"] = "Y" } else { param["telReceiveYn"] = "N" };
            if ($("#dmReceiveYn").prop("checked")){ param["dmReceiveYn"] = "Y" } else { param["dmReceiveYn"] = "N" };
            if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" } else { param["emailReceiveYn"] = "N" };
            if ($("#faxReceiveYn").prop("checked")){ param["faxReceiveYn"] = "Y" } else { param["faxReceiveYn"] = "N" };
             */

            if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" } else { param["perInfoAgreeYn"] = "N" };
            if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" } else { param["perInfoUseYn"] = "N" };

            if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
                param["chgBuyYn"] = "N";
            }
            param["birthDt"] = $("#birthDt").val();
            param["marryDt"] = $("#marryDt").val();
            param["custTp"] = $("#custTp").data("kendoExtDropDownList").value();       //고객유형
            param["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
            param["custHoldTp"] = $("#custHoldTp").data("kendoExtDropDownList").value();
            param["custHoldTpDtl"] = $("#custHoldTpDtl").data("kendoExtDropDownList").value();
            param["ssnCrnNo"] = $("#ssnCrnNo").val();
            param["childrenCnt"] = $("#childrenCnt").val();     //자녀수
            param["ageDtl"] = $("#ageDtl").val();

            param.marryDt = chgDateTimeStamp(param.marryDt);

            var selectedGroups = $("#custGroupsSeq").val().split(", ");
            makeGroupObj(selectedGroups, groupDS);

            var selectedTags = $("#custTagsSeq").val().split(", ");
            makeGroupObj(selectedTags, tagDS);

            //법인인 경우 ID 재 정의
            if (custTpVal == "02") {
                param["custTp"] = $("#custTpC").data("kendoExtDropDownList").value();
                param["custNm"] = $("#custNmC").val();
                param["custNo"] = $("#custNoC").val();
                param["custCd"] = $("#custCdC").val();
                param["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                param["ssnCrnNo"] = $("#ssnCrnNoC").val();
                if ($("#bhmcYnC").prop("checked")){ param["bhmcYn"] = "Y" };
                param["mngScId"] = $("#mngScIdC").val();
                param["mngTecId"] = $("#mngTecIdC").val();
                param["custHoldTp"] = $("#custHoldTpC").data("kendoExtDropDownList").value();
                param["custHoldTpDtl"] = $("#custHoldTpDtlC").data("kendoExtDropDownList").value();
                param["officeTelNo"] = $("#officeTelNoC").val();
                param["officeFaxNo"] = $("#officeFaxNoC").val();
                param["emailNm"] = $("#emailNmC").val();
                param["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                param["cmpScaleCont"] = $("#cmpScaleContC").data("kendoExtDropDownList").value();
                param["cmpTp"] = $("#cmpTpC").data("kendoExtDropDownList").value();
                param["siebelRowId"] = $("#siebelRowIdC").val();

                var selectedGroups = $("#custGroupsCSeq").val().split(", ");
                makeGroupObj(selectedGroups, groupDS);

                var selectedTags = $("#custTagsCSeq").val().split(", ");
                makeGroupObj(selectedTags, tagDS);
            }

            var url = "<c:url value='/crm/cif/customerInfo/insertCustomer.do' />";
            /* var pageMode = "insertMode";
            if (pageMode == "insertMode"){
                // 신규등록 URL
                url = "<c:url value='/crm/cif/customerInfo/insertCustomer.do' />";
            } else {
                // 업데이트 URL
                url = "<c:url value='/crm/cif/customerInfo/updateCustomer.do' />";
            } */

            //

            param["groupDS"] = groupDS;
            param["tagDS"] = tagDS;

            console.log("-btnCustSave-----------------");
            //console.log(param);

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    console.log("success!!!!");
                    //console.log(result);
                    //console.log(result["custNo"]);
                    if (result["custNo"] != ""){
                        console.log("success!!!!");
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#custNo").val(result["custNo"]);
                        /* if (grid.cudDataLength != 0){
                            console.log("address save!!");
                            btnSaveAddress(result["custNo"]);
                        } else {
                            console.log("address UnSave!!");
                            $("#btnCustSearch").click();
                        } */
                    }

                }
            }).done(function(result) {
                console.log("btnCustSave Done!!!!");
            });

        }
    });

  //그룹선택 팝업
    var id = this.id;
   $("#btnAddGroups, #btnAddTags, #btnAddGroupsC, #btnAddTagsC").click(function(){
       pushLayer('#lay_05');

       id = this.id;
       if(id == "btnAddGroups" || id == "btnAddGroupsC"){

           $("#lay_05 > div > h1").text("그룹선택");/* 태그선택 */

           var txt = "" ;
           var grpSeq = "";
           var classTag = "\'on\'";

           $.each(custGroups, function(index, data){
               $.each(groupDS, function(i, ds){
                   grpSeq = ds.grpSeq;
                   if(grpSeq == data.grpSeq){
                       txt += "<li><span class="+classTag+" value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";

                       return false;
                   }
               });
               if(grpSeq != data.grpSeq){
                   txt += "<li><span value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";
               }
           });
       }else if(id == "btnAddTags" || id == "btnAddTagsC"){

           $("#lay_05 > div > h1").text("태그선택");

           var txt = "" ;
           var grpSeq = "";
           var classTag = "\'on\'";

           $.each(custTags, function(index, data){
               $.each(tagDS, function(i, ds){
                   grpSeq = ds.grpSeq;
                   if(grpSeq == data.grpSeq){
                       txt += "<li><span class="+classTag+" value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";

                       return false;
                   }
               });
               if(grpSeq != data.grpSeq){
                   txt += "<li><span value=\'" + data.grpSeq +"\'>"+ data.grpNm +"</span></li>";
               }
           });

       }

       $("#lay_05 > .lay_cont > .grouplist > li").remove();
       $("#lay_05 > .lay_cont > .grouplist").html(txt);

       $(".grouplist li span").click(function(){
           $(this).toggleClass("on");
       });

   });

   //
   $("#btnSetGroups").click(function(){
       var popGroupTxt = "";
       var popGroupSeq = "";
       $("#lay_05 > .lay_cont > .grouplist > li > span").each(function(){
           if($(this).hasClass("on")  == true){
               if(popGroupTxt == ""){
                   popGroupSeq += $(this).attr("value");
                   popGroupTxt += $(this).text();
               }else{
                   popGroupSeq += ", " + $(this).attr("value");
                   popGroupTxt += ", " + $(this).text();
               }
           }
       });

       if(id == "btnAddGroups"){
           $("#custGroups").val(popGroupTxt);
           $("#custGroupsSeq").val(popGroupSeq);
       }else if(id == "btnAddTags"){
           $("#custTags").val(popGroupTxt);
           $("#custTagsSeq").val(popGroupSeq);
       }else if(id == "btnAddGroupsC"){
           $("#custGroupsC").val(popGroupTxt);
           $("#custGroupsCSeq").val(popGroupSeq);
       }else if(id == "btnAddTagsC"){
           $("#custTagsC").val(popGroupTxt);
           $("#custTagsCSeq").val(popGroupSeq);
       }

       layerClose('#lay_05');

   });

///////////////// common Event Start//////////////////////////////

    // 타이틀
    $("#header_title").html("<spring:message code='crm.menu.custReg' />(<spring:message code='global.lbl.personal' />)"); //개인정보 등록(개인)
    //$("#header_title").on("click", contentSearch);


    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        window.open("<c:url value='/mob/crm/cif/customerInfo/selectCustomerInfoMain.do'/>", "_self");

        /* if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); } */
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


});

//
function makeGroupObj(obj, ds){

    if(obj[0] != ""){
        $.each(obj, function(index, data){
            ds.push({"grpSeq":data,"grpTp":"001"});
        });
    }
}

//form data 초기화
function initForm(){

    $("#saleOpptNo").val("");
    $("#leadNo").val("");
    $("#vsitNo").val("");
    $("#custNo").val("");
    $("#custNm").val("");
    $("#hpNo").val("");
    $("#remark").val("");
    $("#saleOpptStepCd").data("kendoExtDropDownList").value("");
    $("#trsfStatCd").data("kendoExtDropDownList").value("");
    $("#expcSaleDt").val("");
    $("#succPrbCd").val("");
    $("#scId").data("kendoExtDropDownList").value("");
    $("#saleOpptSrcCd").val();
    $("#regUsrId").val("");
    $("#regDt").val("");

}


//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {

}

//검색페이지 보기
function contentSearch() {
}

//상세페이지 보기
function contentDetail(dataItem) {

  }


</script>
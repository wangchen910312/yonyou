<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 서비스예약 -->
<div id="resizableContainer">
    <div id="kendoCarCheckForm" class="content">
        <form id="carChkForm">
            <!-- 차량정보, 운전자정보 공통 페이지 -->
            <jsp:include page="/WEB-INF/jsp/ser/cmm/custCarInfo/selectCustCarInfoMain.jsp"></jsp:include>
            <!-- 차량정보, 운전자정보 공통 페이지 -->


            <!-- 차량점검번호 -->
            <section class="group">
                <div class="table_form form_width_100per mt5">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carChkDocNo" /></th><!-- 차량점검번호 -->
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="carChkDocNo" name="carChkDocNo" class="form_input" data-json-obj="true">
                                        <a href="javascript:goCarChkStatus();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.chkTp" /></th><!-- 점검유형 -->
                                <td>
                                    <input id="chkTp" name="chkTp" value="02" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.carChkStat" /></th><!-- 차량점검상태 -->
                                <td class="readonly_area">
                                    <input id="carChkStatCd" name="carChkStatCd" class="form_comboBox" readonly>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.carChkUsrNm" /></th><!-- 차량점검확인자 -->
                                <td class="readonly_area">
                                    <input id="regUsrNm" name="regUsrNm" class="form_input" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.roDocNo" /><!-- RO번호--></th>
                                <td class="keyNumber">
                                    <div class="form_search">
                                        <input type="text" id="roDocNo" name="roDocNo" class="form_input" data-json-obj="true" >
                                        <a href="javascript:roSearchPopupWindow();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                                <td class="readonly_area">
                                    <input id="roTp" name="roTp" class="form_comboBox" data-json-obj="true" readonly />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.roDt' /><!-- RO일자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="roDt" name="roDt" class="form_datetimepicker" readonly />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roWrtrNm" /></th><!-- 발행자 -->
                                <td class="readonly_area">
                                    <input id="roRegUsrNm" name="roRegUsrNm" readonly class="form_input" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form form_width_100per mt10" style="display:none;">
                <table>
                    <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.title.resvDocNo" /><!-- 예약번호--></th>
                                <td class="readonly_area">
                                    <input type="text" id="resvDocNo" name="resvDocNo" class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.preInsNo' /><!-- 사전점검번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="diagDocNo" name="diagDocNo" class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.incReqNo' /><!-- 보험신청번호 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="incReqNo" name="incReqNo" class="form_input form_readonly" data-name="<spring:message code='ser.lbl.incReqNo'/>" readonly />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.origRorcptNo' /><!-- 원RO번호 --></th>
                                <td>
                                    <input type="text" id="baseRoNo" name="baseRoNo" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip01" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="SER507" class="k-state-active">${pdiChk507Nm}</li><!-- 내/외부 미리점검 육안점검 -->
                        <li id="SER508">${pdiChk508Nm}</span></li><!-- 엔진룸 내 육안점검 -->
                        <li id="SER509">${pdiChk509Nm}</span></li><!-- 하부 부분 -->
                        <li id="SER510">${pdiChk510Nm}</span></li><!-- 차내조작과 컨트롤 -->
                        <li id="SER511">${pdiChk511Nm}</span></li><!-- 도로 테스트 -->
                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 전체선택/해제 -->
                    <span class="btn_right_absolute2">
                        <button type="button" id="checkedAll" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.allConfirm" /></button>
                        <button type="button" id="removeAll" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.allCancel" /></button>
                    </span>

                    <!-- 내/외부 미리점검 육안점검 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <colgroup>
                                    <col style="width:50%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:forEach var="pdiChkList507" items="${pdiChkList507}" varStatus="status">
                                    <tr>
                                        <td><label class="label_check ml5"><input name="SER507" type="checkbox" value="${pdiChkList507.cmmCd}" class="form_check" /> ${pdiChkList507.cmmCdNm}</label></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 엔진룸 내 육안점검 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList508" items="${pdiChkList508}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER508" type="checkbox" value="${pdiChkList508.cmmCd}" class="form_check" /> ${pdiChkList508.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 하부 부분 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList509" items="${pdiChkList509}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER509" type="checkbox" value="${pdiChkList509.cmmCd}" class="form_check" /> ${pdiChkList509.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 차내조작과 컨트롤 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList510" items="${pdiChkList510}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER510" type="checkbox" value="${pdiChkList510.cmmCd}" class="form_check" /> ${pdiChkList510.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 도로 테스트 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList511" items="${pdiChkList511}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER511" type="checkbox" value="${pdiChkList511.cmmCd}" class="form_check" /> ${pdiChkList511.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="tabstrip02" class="tab_area" style="display:none;">
                    <ul>
                        <li id="SER512" class="k-state-active">${pdiChk512Nm}</li><!-- 30일 -->
                        <li id="SER513">${pdiChk513Nm}</li><!-- 60일 -->
                        <li id="SER514">${pdiChk514Nm}</li><!-- 90일 -->
                        <li id="SER515">${pdiChk515Nm}</li><!-- 120일 -->
                        <li id="SER516">${pdiChk516Nm}</li><!-- 150일 -->
                        <li id="SER517">${pdiChk517Nm}</li><!-- 180일 -->
                    </ul>

                    <!-- 전체선택/해제 -->
                    <%-- <span class="btn_right_absolute2">
                        <button type="button" id="checkedAll" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.allConfirm" /></button>
                        <button type="button" id="removeAll" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.allCancel" /></button>
                    </span> --%>

                    <!-- 30일 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:set var="ser512Cnt" value="1" />
                                    <tr>
                                    <c:forEach var="pdiChkList512" items="${pdiChkList512}" varStatus="loop">
                                        <th scope="row">${pdiChkList512.cmmCdNm}</th>
                                        <td>
                                            <label class="label_check ml5"><input name="SER512" value="${ser512Cnt}"     type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.changeItem" /></label>
                                            <label class="label_check ml5"><input name="SER512" value="${ser512Cnt + 1}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.checkItem" /></label>
                                            <label class="label_check ml5"><input name="SER512" value="${ser512Cnt + 2}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.repairControll" /></label>
                                        </td>
                                        <c:set var="ser512Cnt" value="${ser512Cnt + 3}" />
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 60일 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:set var="ser513Cnt" value="1" />
                                    <tr>
                                    <c:forEach var="pdiChkList512" items="${pdiChkList512}" varStatus="loop">
                                        <th scope="row">${pdiChkList512.cmmCdNm}</th>
                                        <td>
                                            <label class="label_check ml5"><input name="SER513" value="${ser513Cnt}"     type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.changeItem" /></label>
                                            <label class="label_check ml5"><input name="SER513" value="${ser513Cnt + 1}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.checkItem" /></label>
                                            <label class="label_check ml5"><input name="SER513" value="${ser513Cnt + 2}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.repairControll" /></label>
                                        </td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                        <c:set var="ser513Cnt" value="${ser513Cnt + 3}" />
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 90일 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:set var="ser514Cnt" value="1" />
                                    <tr>
                                    <c:forEach var="pdiChkList512" items="${pdiChkList512}" varStatus="loop">
                                        <th scope="row">${pdiChkList512.cmmCdNm}</th>
                                        <td>
                                            <label class="label_check ml5"><input name="SER514" value="${ser514Cnt}"     type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.changeItem" /></label>
                                            <label class="label_check ml5"><input name="SER514" value="${ser514Cnt + 1}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.checkItem" /></label>
                                            <label class="label_check ml5"><input name="SER514" value="${ser514Cnt + 2}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.repairControll" /></label>
                                        </td>
                                        <c:set var="ser514Cnt" value="${ser514Cnt + 3}" />
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 120일 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:set var="ser515Cnt" value="1" />
                                    <tr>
                                    <c:forEach var="pdiChkList512" items="${pdiChkList512}" varStatus="loop">
                                        <th scope="row">${pdiChkList512.cmmCdNm}</th>
                                        <td>
                                            <label class="label_check ml5"><input name="SER515" value="${ser515Cnt}"     type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.changeItem" /></label>
                                            <label class="label_check ml5"><input name="SER515" value="${ser515Cnt + 1}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.checkItem" /></label>
                                            <label class="label_check ml5"><input name="SER515" value="${ser515Cnt + 2}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.repairControll" /></label>
                                        </td>
                                        <c:set var="ser515Cnt" value="${ser515Cnt + 3}" />
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 150일 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:set var="ser516Cnt" value="1" />
                                    <tr>
                                    <c:forEach var="pdiChkList512" items="${pdiChkList512}" varStatus="loop">
                                        <th scope="row">${pdiChkList512.cmmCdNm}</th>
                                        <td>
                                            <label class="label_check ml5"><input name="SER516" value="${ser516Cnt}"     type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.changeItem" /></label>
                                            <label class="label_check ml5"><input name="SER516" value="${ser516Cnt + 1}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.checkItem" /></label>
                                            <label class="label_check ml5"><input name="SER516" value="${ser516Cnt + 2}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.repairControll" /></label>
                                        </td>
                                        <c:set var="ser516Cnt" value="${ser516Cnt + 3}" />
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 180일 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col style="width:10%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:set var="ser517Cnt" value="1" />
                                    <tr>
                                    <c:forEach var="pdiChkList512" items="${pdiChkList512}" varStatus="loop">
                                        <th scope="row">${pdiChkList512.cmmCdNm}</th>
                                        <td>
                                            <label class="label_check ml5"><input name="SER517" value="${ser517Cnt}"     type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.changeItem" /></label>
                                            <label class="label_check ml5"><input name="SER517" value="${ser517Cnt + 1}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.checkItem" /></label>
                                            <label class="label_check ml5"><input name="SER517" value="${ser517Cnt + 2}" type="checkbox" class="form_check" unchecked /> <spring:message code="ser.lbl.repairControll" /></label>
                                        </td>
                                        <c:set var="ser517Cnt" value="${ser517Cnt + 3}" />
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr>
                                                <tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="tabstrip03" class="tab_area" style="display:none;">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="SER501" class="k-state-active">${pdiChk501Nm}</li><!-- 외부 -->
                        <li id="SER502">${pdiChk502Nm}</li><!-- 내부 -->
                        <li id="SER503">${pdiChk503Nm}</li><!-- 엔진룸 -->
                        <li id="SER504">${pdiChk504Nm}</li><!-- 하부 -->
                        <li id="SER505">${pdiChk505Nm}</li><!-- 도로테스트 -->
                        <li id="SER506">${pdiChk506Nm}</li><!-- 최종 준비 -->
                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 전체선택/해제 -->
                    <span class="btn_right_absolute2">
                        <button type="button" id="checkedAll03" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.allConfirm" /></button>
                        <button type="button" id="removeAll03" class="btn_m btn_m_normal btn_active"><spring:message code="ser.btn.allCancel" /></button>
                    </span>

                    <!-- 외부 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList501" items="${pdiChkList501}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER501" type="checkbox" class="form_check" value="${pdiChkList501.cmmCd}"/> ${pdiChkList501.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr><tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 내부 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList502" items="${pdiChkList502}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER502" type="checkbox" class="form_check" value="${pdiChkList502.cmmCd}"/> ${pdiChkList502.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr><tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 엔진룸 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList503" items="${pdiChkList503}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER503" type="checkbox" class="form_check" value="${pdiChkList503.cmmCd}" /> ${pdiChkList503.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr><tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 하부 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList504" items="${pdiChkList504}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER504" type="checkbox" class="form_check" value="${pdiChkList504.cmmCd}" /> ${pdiChkList504.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr><tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 도로테스트 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col style="width:28%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                    <c:forEach var="pdiChkList505" items="${pdiChkList505}" varStatus="loop">
                                        <td><label class="label_check ml5"><input name="SER505" type="checkbox" class="form_check" value="${pdiChkList505.cmmCd}" /> ${pdiChkList505.cmmCdNm}</label></td>
                                        <c:choose>
                                            <c:when test="${(loop.index+1)%3==0 }">
                                                </tr><tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 최종 준비 -->
                    <div style="min-height:205px;">
                        <div class="table_form table_form_btn">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:50%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <c:forEach var="pdiChkList506" items="${pdiChkList506}" varStatus="loop">
                                    <tr>
                                        <td><label class="label_check ml5"><input name="SER506" type="checkbox" class="form_check" value="${pdiChkList506.cmmCd}" /> ${pdiChkList506.cmmCdNm}</label></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="table_form form_width_100per mt5">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:22%;">
                            <col style="width:10%;">
                            <col style="width:22%;">
                            <col style="width:10%;">
                            <col style="width:22%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carChkRemark" /><!-- 차량점검비고 --></th>
                                <td colspan="4"><input type="text" id="carChkRemark" name="carChkRemark" class="form_input" data-json-obj="true"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="workProgress_manage">
                    <div class="top_area">
                        <ul class="txt_input">
                            <li>
                                <span class="bu_required"><spring:message code="ser.lbl.carChkNm" /></span><!-- 배정자 -->
                                <div class="required_area">
                                    <div class="form_search">
                                        <input id="carChkEmpNm" name="carChkEmpNm" type="text" data-json-obj="true" class="form_input">
                                        <a href="javascript:techmanPopup();"></a>
                                    </div>
                                    <input id="carChkEmpCd" name="carChkEmpCd" type="hidden" data-json-obj="true" />
                                </div>
                            </li>
                        </ul>
                        <div class="btn_right mt5">
                            <%-- <dms:access viewId="VIEW-D-12968" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                                <button type="button" id="startCarChk" class="btn_s btn_s_v2"><spring:message code="ser.btn.carChkStart" /></button><!-- 차량점검시작 -->
                            <%-- </dms:access> --%>
                            <%-- <dms:access viewId="VIEW-D-12967" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                                <button type="button" id="endCarChk" class="btn_s btn_s_v2"><spring:message code="ser.btn.carChkEnd" /></button><!-- 차량점검완료 -->
                            <%-- </dms:access> --%>
                            <%-- <dms:access viewId="VIEW-D-12965" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                                <button type="button" id="qirLink" class="btn_s btn_s_v2"><spring:message code="ser.btn.qtInfoReport" /></button><!-- QIR -->
                            <%-- </dms:access> --%>
                            <%-- <dms:access viewId="VIEW-D-11688" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" id="preInsReg" class="btn_s btn_s_v2"><spring:message code="ser.btn.preInsReg" /></button><!-- 사전점검등록 -->
                            </dms:access> --%>
                        </div>
                    </div>
                </div>

            </section>
            <input type="hidden" id="roGrpNo" name="roGrpNo" data-json-obj="true" />
            <input type="hidden" id="diagDocNo" name="diagDocNo" />
        </form>
        <!-- //사전점검번호 -->
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- //서비스예약 -->
<form name="qirForm" method="post">
    <input type="hidden" id="sendParam" name="sendParam">
</form>

<!-- script -->
<script type="text/javascript">


var isTablet="${isTablet}";
var _width=920;//web
var _height=650;//web
if(isTablet == "true"){
    _width=950;//tablet
    _height=550;//web
}

var repairOrderSearchPopup;
var tecSearchPopup;
var carChkCancelPopup;
var selectedTabId = "SER507";

//공통코드:차량점검유형
var carChkTpCdList = [];
<c:forEach var="obj" items="${carChkTpCdList}">
<c:if test="${obj.useYn eq 'Y'}">
carChkTpCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:if>
</c:forEach>

//공통코드:RO 상태
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

//공통코드:차량점검상태
var carChkStatCdList = [];
<c:forEach var="obj" items="${carChkStatCdList}">
carChkStatCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

// RO유형
$("#roTp").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
    ,dataValueField:"cmmCd"
    ,dataSource:roTpCdList
    ,optionLabel:" "
});

// 차량점검유형
$("#chkTp").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
    ,dataValueField:"cmmCd"
    ,dataSource:carChkTpCdList
    ,change : function(e){
        var selectedVal = this.value();
        if(selectedVal == "02"){
            $("#tabstrip01").show();
            $("#tabstrip02").hide();
            $("#tabstrip03").hide();
            $("#tabstrip01").data("kendoExtTabStrip").activateTab($("#SER507"));
            selectedTabId = "SER507";
        } else if(selectedVal == "03") {
            $("#tabstrip01").hide();
            $("#tabstrip02").show();
            $("#tabstrip03").hide();
            $("#tabstrip02").data("kendoExtTabStrip").activateTab($("#SER512"));
            selectedTabId = "SER512";
        } else {
            $("#tabstrip01").hide();
            $("#tabstrip02").hide();
            $("#tabstrip03").show();
            $("#tabstrip03").data("kendoExtTabStrip").activateTab($("#SER501"));
            selectedTabId = "SER501";
        }
    }
    ,index:0
});

//차량점검상태
$("#carChkStatCd").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
    ,dataValueField:"cmmCd"
    ,dataSource:carChkStatCdList
    ,optionLabel:" "
});


// RO일자
$("#roDt").kendoExtMaskedDatePicker({
    format:"<dms:configValue code='dateFormat' /> HH:mm"
    ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    ,enable:false
});

goCarChkStatus = function(){
    parent._createOrReloadTabMenu("<spring:message code='ser.menu.carChkList'/>", "<c:url value='/ser/ro/carCheck/selectCarCheckListMain.do'/>", "VIEW-D-10346"); // 차량점검현황
}


/****************** 버튼 이벤트 ***********************/

$(document).ready(function() {

    $("#tabstrip01, #tabstrip02, #tabstrip03").kendoExtTabStrip({
        animation:false
        ,select:function(e){
            selectedTabId = e.item.id;
        }
    });

    $("#checkedAll").kendoButton({
        click:function(e){
            $("input:checkbox[name="+selectedTabId+"]").prop("checked", true);
        }
        ,enable:false
    });

    $("#removeAll").kendoButton({
        click:function(e){
            $("input:checkbox[name="+selectedTabId+"]").prop("checked", false);
        }
       ,enable:false
    });

    $("#checkedAll03").kendoButton({
        click:function(e){
            $("input:checkbox[name="+selectedTabId+"]").prop("checked", true);
        }
        ,enable:false
    });

    $("#removeAll03").kendoButton({
        click:function(e){
            $("input:checkbox[name="+selectedTabId+"]").prop("checked", false);
        }
       ,enable:false
    });

    /** 확인 **/
    $("#btnModify").kendoButton({
        click:function(e){
            var carChkStatCd = dms.string.isEmpty($("#carChkStatCd").val()) ? "01" : $("#carChkStatCd").val();
            saveCarChk(carChkStatCd);
        }
        ,enable:false
    });

    /** 시작 **/
    $("#startCarChk").kendoButton({
        click:function(e){
            saveCarChk("02");
        }
        ,enable:false
    });

    /** 완료 **/
    $("#endCarChk").kendoButton({
        click:function(e){
            saveCarChk("03");
        }
       ,enable:false
    });

    /** 취소 **/
    $("#btnCancel").kendoButton({
        click:function(e){
            saveCarChk("04");
        }
       ,enable:false
    });


 // 취소
    $("#btnCancel").kendoButton({
        click:function(e) {

            carChkCancelPopup = dms.window.popup({
                windowId:"carChkCancelPopup"
                , title:"<spring:message code='ser.lbl.carCheckCancel'/>"   // 예약취소
                , width:400
                , height:200
                , content:{
                    url:"<c:url value='/ser/ro/carCheck/selectCarCheckCancelPopup.do'/>"
                    ,data:{
                        "carChkDocNo":$("#carChkDocNo").val()
                        ,"callbackFunc":function(data){

                            var params = {
                                    carChkDocNo           : $("#carChkDocNo").val()
                                   ,carChkCancReasonCd    : data.cancReasonCd
                                   ,carChkCancReasonCont  : data.cancReasonCont
                                   ,carChkStatCd          : "04"
                            };

                            if(data != null){
                                $.ajax({
                                    url:"<c:url value='/ser/ro/carCheck/updateCarCheckCancel.do' />"
                                    ,data:JSON.stringify(params)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result, textStatus){

                                        dms.notification.success("<spring:message code='ser.menu.carCheck' var='carCheck' /><spring:message code='global.info.cancelSuccessParam' arguments='${carCheck}' />");
                                        //$("#btnSearch").click();
                                        initAll();
                                        btnControll("");

                                    }
                                    ,beforeSend:function(xhr){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(xhr,status){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });
                            }

                            //saveCarChk("04");

                        }
                    }
                }
            });
        }
        ,enable:false
    });



    /** 프린터 **/
    $("#btnPrint").kendoButton({
        click:function(e){
            var param = {
                carChkDocNo : $("#carChkDocNo").val()
               ,dlrCd : "${dlrCd}"
            }
            $.ajax({
                url:"<c:url value='/ser/ro/carCheck/updateCarCheckPrint.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    if($("#chkTp").val() == "01"){    // 정기점검
                        //parent._createOrReloadTabMenu("<spring:message code='ser.title.carChkPrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectCarCheck01Print.cpt'/>&sCarChkDocNo="+$("#carChkDocNo").val()+"&sDlrCd=${dlrCd}");
                    }else if($("#chkTp").val() == "02"){    // 입고점검
                        parent._createOrReloadTabMenu("<spring:message code='ser.title.carChkPrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectCarCheck02Print.cpt'/>&sCarChkDocNo="+$("#carChkDocNo").val()+"&sDlrCd=${dlrCd}");
                    }else if($("#chkTp").val() == "03"){    // 재고점검
                        parent._createOrReloadTabMenu("<spring:message code='ser.title.carChkPrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectCarCheck03Print.cpt'/>&sCarChkDocNo="+$("#carChkDocNo").val()+"&sDlrCd=${dlrCd}");
                    }else if($("#chkTp").val() == "04"){    // 출고점검
                        parent._createOrReloadTabMenu("<spring:message code='ser.title.carChkPrintDoc' />", "<c:url value='/ReportServer?reportlet=ser/selectCarCheck04Print.cpt'/>&sCarChkDocNo="+$("#carChkDocNo").val()+"&sDlrCd=${dlrCd}");
                    }
                }
            });
        }
       ,enable:false
    });

    // QIR
    $("#qirLink").kendoButton({
        click:function(e) {
            var f = document.qirForm;
            var pop = window.open;
            window.open("", "popup", "toolbar='no'");
            f.target = "popup";
            f.action = "http://gqis.hyundai-motor.com/xui/LoginH.jsp";
            f.submit();
        }
        ,enable:false
    });

    // 사전점검등록
    /* $("#preInsReg").kendoButton({
        click:function(e) {
            var param = "?infoType=CH&vinNo="+$("#vinNo").val()+"&diagDocNo="+$("#diagDocNo").val();
            parent._createOrReloadTabMenu('<spring:message code="ser.menu.preCheckCreate" />', "<c:url value='/ser/ro/preCheck/selectPreCheckMain.do"+param+"'/>", "VIEW-D-10333");
        }
    ,enable:false
    });
 */
    $("#carChkDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#carChkDocNo").val()) != ""){
            e.preventDefault();
            var data = {"carChkDocNo":$("#carChkDocNo").val()}
            detailSet(data, false, "CH");
        }
    });

    $("#roDocNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#roDocNo").val()) != ""){
            e.preventDefault();
            var data = {"roDocNo":$("#roDocNo").val()}
            detailSet(data, false, "RO");
        }
    });


    /** 전체 필드 초기화 **/
    initAll = function(){
        $("#carChkForm").get(0).reset();
        $("#tabstrip01").show();
        $("#tabstrip02").hide();
        $("#tabstrip03").hide();
        $("#tabstrip01").data("kendoExtTabStrip").activateTab($("#SER507"));
        selectedTabId = "SER507";

        for(var i=1; i < 18; i++){
            var tabNm = "SER50"
            if(i < 10){
                tabNm = "SER50"+String(i);
            } else {
                tabNm = "SER5"+String(i);
            }
            $("input:checkbox[name="+tabNm+"]").prop("checked", false);
            $("input:checkbox[name="+tabNm+"]").attr("disabled","disabled");
            //$("input:checkbox[name="+tabNm+"]").removeAttr("disabled");
        }

        btnControll("");
    };


    /* 사전 점검 정보 */
    detailSet = function(data, slide, infoType){
        var params = [];
        if(infoType == "CH"){
            //initAll();
            $.ajax({
                url:"<c:url value='/ser/ro/carCheck/selectCarCheckByKey.do' />"
                ,data:JSON.stringify({sCarChkDocNo:data.carChkDocNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    if(dms.string.strNvl(result.carChkDocNo) == "" && infoType == "CH"){
                        dms.notification.info("<spring:message code='ser.lbl.preChkInfo' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                    } else {

                        // 예약현황보드 슬라이드 닫기
                        /* if(slide){
                            slidePlay();
                        } */
                        getCustInfo(result, "N");                    // 고객정보:공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                        getCarCheckInfoSet(result);
                        getCarCheckDetailInfo(result);
                    }
                }
            });
        }else if(infoType == "RO"){
            $("#roDocNo").val(dms.string.strNvl(data.roDocNo));
            $("#roTp").data("kendoExtDropDownList").value(data.roTp);
            $("#roDt").data("kendoExtMaskedDatePicker").value(data.roDt);
            $("#roRegUsrNm").val(data.regUsrNm);

            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderByKey.do' />"
                ,data:JSON.stringify({sRoDocNo:data.roDocNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    getCustInfo(result, "N");                    // 고객정보:공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
                }
            });
        }else{
            $("#roDocNo").val(dms.string.strNvl(data.roDocNo));
            $("#roTp").data("kendoExtDropDownList").value(data.roTp);
            $("#roDt").data("kendoExtMaskedDatePicker").value(data.roDt);
            $("#roRegUsrNm").val(data.regUsrNm);
        }
    };

    /* 예약 사전점검 정보 세팅*/
    getCarCheckInfoSet = function(result){

        $("#carChkDocNo").val(dms.string.strNvl(result.carChkDocNo));
        $("#carChkRemark").val(dms.string.strNvl(result.carChkRemark));
        $("#carChkEmpCd").val(dms.string.strNvl(result.carChkEmpCd));
        $("#carChkEmpNm").val(dms.string.strNvl(result.carChkEmpNm));
        $("#roDocNo").val(dms.string.strNvl(result.roDocNo));
        $("#diagDocNo").val(dms.string.strNvl(result.diagDocNo));
        $("#roTp").data("kendoExtDropDownList").value(result.roTp);
        $("#roGrpNo").val(dms.string.strNvl(result.roGrpNo));
        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
        $("#chkTp").data("kendoExtDropDownList").value(dms.string.strNvl(result.chkTp));
        $("#carChkStatCd").data("kendoExtDropDownList").value(dms.string.strNvl(result.carChkStatCd));
        $("#regUsrNm").val(result.regUsrNm);


        btnControll(result.carChkStatCd);
    };

    btnControll = function(stat){
        var carChkStatCd = $("#carChkStatCd").val();

        if(dms.string.strNvl(carChkStatCd) == ""){
            if(stat == "U"){
                $("#btnModify").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#startCarChk").data("kendoButton").enable(false);
                $("#endCarChk").data("kendoButton").enable(false);
                //$("#cancelCarChk").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(false);
            } else {
                $("#btnModify").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#startCarChk").data("kendoButton").enable(false);
                $("#endCarChk").data("kendoButton").enable(false);
                //$("#cancelCarChk").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(false);
            }
        } else {
            if(carChkStatCd == "01"){//확인

                $("#btnModify").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#startCarChk").data("kendoButton").enable(true);
                $("#endCarChk").data("kendoButton").enable(false);
                //$("#cancelCarChk").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(false);

            } else if(carChkStatCd == "02"){//시작

                $("#btnModify").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#startCarChk").data("kendoButton").enable(false);
                $("#endCarChk").data("kendoButton").enable(true);
                //$("#cancelCarChk").data("kendoButton").enable(true);
                // 프린트는 정의되지 않아서 막아둔다.
                $("#btnPrint").data("kendoButton").enable(true);
                $("#qirLink").data("kendoButton").enable(true);
                $("#checkedAll").data("kendoButton").enable(true);
                $("#removeAll").data("kendoButton").enable(true);
                $("#checkedAll03").data("kendoButton").enable(true);
                $("#removeAll03").data("kendoButton").enable(true);
            } else if(carChkStatCd == "03"){//완료
                $("#btnModify").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#startCarChk").data("kendoButton").enable(false);
                $("#endCarChk").data("kendoButton").enable(false);
                //$("#cancelCarChk").data("kendoButton").enable(true);
                // 프린트는 정의되지 않아서 막아둔다.
                $("#btnPrint").data("kendoButton").enable(true);
                $("#qirLink").data("kendoButton").enable(true);

                $("#checkedAll").data("kendoButton").enable(false);
                $("#removeAll").data("kendoButton").enable(false);
                $("#checkedAll03").data("kendoButton").enable(false);
                $("#removeAll03").data("kendoButton").enable(false);

            } else if(carChkStatCd == "04"){//취소

                $("#btnModify").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#startCarChk").data("kendoButton").enable(false);
                $("#endCarChk").data("kendoButton").enable(false);
                //$("#cancelCarChk").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(false);
                $("#checkedAll").data("kendoButton").enable(false);
                $("#removeAll").data("kendoButton").enable(false);
                $("#checkedAll03").data("kendoButton").enable(false);
                $("#removeAll03").data("kendoButton").enable(false);

            } else {

                $("#btnModify").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#startCarChk").data("kendoButton").enable(false);
                $("#endCarChk").data("kendoButton").enable(false);
                //$("#cancelCarChk").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
                $("#qirLink").data("kendoButton").enable(false);
                $("#checkedAll").data("kendoButton").enable(false);
                $("#removeAll").data("kendoButton").enable(false);
                $("#checkedAll03").data("kendoButton").enable(false);
                $("#removeAll03").data("kendoButton").enable(false);

            }


            //if(carChkStatCd == "02" || carChkStatCd == "03"  ){
                for(var i=1; i < 18; i++){
                    var tabNm = "SER50"
                    if(i < 10){
                        tabNm = "SER50"+String(i);
                    } else {
                        tabNm = "SER5"+String(i);
                    }
                    if(carChkStatCd == "02"){
                        $("input:checkbox[name="+tabNm+"]").removeAttr("disabled");
                    }else{
                        $("input:checkbox[name="+tabNm+"]").attr("disabled","disabled");
                    }
                }
            //}
        }
    };


    /**************** 예약 사전 점검 정보 ********************/
    /* 예약 사전 점검 상세 정보 */
    getCarCheckDetailInfo = function(data){

        $.ajax({
            url:"<c:url value='/ser/ro/carCheck/selectCarCheckDetails.do' />"
            ,data:JSON.stringify({sCarChkDocNo:data.carChkDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(data.chkTp == "02"){
                    $("#tabstrip01").show();
                    $("#tabstrip02").hide();
                    $("#tabstrip03").hide();
                    $("#tabstrip01").data("kendoExtTabStrip").activateTab($("#SER507"));
                    selectedTabId = "SER507";
                } else if(data.chkTp == "03") {
                    $("#tabstrip01").hide();
                    $("#tabstrip02").show();
                    $("#tabstrip03").hide();
                    $("#tabstrip02").data("kendoExtTabStrip").activateTab($("#SER512"));
                    selectedTabId = "SER512";
                } else if(data.chkTp == "04") {
                    $("#tabstrip01").hide();
                    $("#tabstrip02").hide();
                    $("#tabstrip03").show();
                    $("#tabstrip03").data("kendoExtTabStrip").activateTab($("#SER501"));
                    selectedTabId = "SER501";
                }

                if(result.total > 0){
                    $.each(result.data, function(idx, data){
                        var splitData = data.rsltGradeCd.split("|");
                        for(var i=1; i < splitData.length; i++){
                            $("input:checkbox[name="+data.chkCd+"][value="+String(splitData[i])+"]").prop("checked", true);
                        }
                    });
                }
            }
        });
    };


    var validator = $("#kendoCarCheckForm").kendoExtValidator().data("kendoExtValidator");

    //RO검색 팝업
    roSearchPopupWindow = function(){
        repairOrderSearchPopup = dms.window.popup({
            windowId:"repairOrderSearchPopup"
            , width:_width //todo khskhs 사이즈변경 완료
            , height:_height
            , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "close" :"Y"
                    , "pdiYn" : "Y"
                    , "callbackFunc":function(data){
                        detailSet(data[0], false, "RO");
                    }
                }
            }
        });
    };

    techmanPopup = function() {
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {

                        if(jsonObj.length > 0) {
                                $("#carChkEmpCd").val(jsonObj[0].tecId);
                                $("#carChkEmpNm").val(jsonObj[0].tecNm);
                        }
                    }
                }
            }
        });
    }

    saveCarChk = function(carChkStatCd) {
        var carChkTpVal = $("#chkTp").data("kendoExtDropDownList").value();
        var pdiChkChkListParam = [];

        if( $("#vinNo").val() == "" ) {
            dms.notification.success("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='global.info.emptyParamInfo' arguments='${vinNo}' />");
            return false;
        }

        if(dms.string.isEmpty($("#carChkEmpNm").val())){
            dms.notification.success("<spring:message code='ser.lbl.carChkNm' var='carChkNm' /><spring:message code='global.info.emptyCheckParam' arguments='${carChkNm}' />");
            return;
        }


        if(carChkTpVal == "02"){
            var chkCnt = 0;
            for(var i=7; i < 12; i++){
                var saveParam = {};
                var carChkCdListVal="";
                var chkCd="";
                if(i < 10){
                    chkCd = "SER50"+String(i);
                } else {
                    chkCd = "SER5"+String(i);
                }
                var checkedCnt = $("input:checkbox[name="+chkCd+"]:checked").length;
                if(checkedCnt > 0){
                    $("input:checkbox[name="+chkCd+"]").each(function(i){
                        if(this.checked) {
                          carChkCdListVal += "|" + $(this).val();
                        }
                    });
                    saveParam = {
                        carChkDocNo:$("#carChkDocNo").val()
                        ,chkTp:carChkTpVal
                        ,chkCd:chkCd
                        ,rsltGradeCd:carChkCdListVal
                    }
                    pdiChkChkListParam.push(saveParam);
                }
            }
        } else if(carChkTpVal == "03"){
            var chkCnt = 0;
            for(var i=12; i < 18; i++){
                var saveParam = {};
                var carChkCdListVal="";
                var chkCd = "SER5"+String(i);

                var checkedCnt = $("input:checkbox[name="+chkCd+"]:checked").length;
                if(checkedCnt > 0){
                    $("input:checkbox[name="+chkCd+"]").each(function(i){
                        if(this.checked) {
                            carChkCdListVal += "|" + $(this).val();
                        }
                    });
                    saveParam = {
                        carChkDocNo:$("#carChkDocNo").val()
                        ,chkTp:carChkTpVal
                        ,chkCd:chkCd
                        ,rsltGradeCd:carChkCdListVal
                    }
                    pdiChkChkListParam.push(saveParam);
                }
            }
        } else if(carChkTpVal == "04"){
            var chkCnt = 0;
            for(var i=1; i < 7; i++){
                var saveParam = {};
                var carChkCdListVal="";
                var chkCd = "SER50"+String(i);

                var checkedCnt = $("input:checkbox[name="+chkCd+"]:checked").length;
                if(checkedCnt > 0){
                    $("input:checkbox[name="+chkCd+"]").each(function(i){
                        if(this.checked) {
                            carChkCdListVal += "|" + $(this).val();
                        }
                    });
                    saveParam = {
                        carChkDocNo:$("#carChkDocNo").val()
                        ,chkTp:carChkTpVal
                        ,chkCd:chkCd
                        ,rsltGradeCd:carChkCdListVal
                    }
                    pdiChkChkListParam.push(saveParam);
                }
            }
        }

        var formSaveData = $("#carChkForm").serializeObject($("#carChkForm").serializeArrayInSelector("[data-json-obj='true']"));
        formSaveData.chkTp = $("#chkTp").data("kendoExtDropDownList").value();
        formSaveData.carChkStatCd = carChkStatCd;
        formSaveData.carChkEmpCd  = $("#carChkEmpCd").val();
        formSaveData.carChkEmpNm  = $("#carChkEmpNm").val();

        var param = $.extend(
            {"carCheckVO":formSaveData}
            ,{"carCheckDetailVO":pdiChkChkListParam}
        );

        $.ajax({
             url:"<c:url value='/ser/ro/carCheck/multiCarChecks.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result , textStatus){
                var data = {"carChkDocNo":result};
                detailSet(data, false, "CH");
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    }

    /** 사전점검 번호가 있을경우 자동 조회**/
    <c:if test="${carChkDocNo ne '' or sVinNo ne ''}">
        var data = {"carChkDocNo":"${carChkDocNo}", "vinNo":"${sVinNo}"};
        detailSet(data, false, "CH");
    </c:if>
    $("#carChkEmpCd").val("${usrId}");
    $("#carChkEmpNm").val("${usrNm}");
});

</script>
<!-- //script -->







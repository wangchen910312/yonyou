<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 설문 미리보기 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_m btn_print"><spring:message code='global.btn.print'/></button> <!-- 인쇄 -->
            </div>
        </div>

        <!-- 탭메뉴 전체 영역 -->
        <div class="tab_area mt0">
            <!-- 탭메뉴 -->
            <!-- <ul>
                <li class="k-state-active">설문</li>
            </ul> -->
            <!-- //탭메뉴 -->

            <!-- 설문 -->
            <div>
                <div class="survey">
                    <h2><c:out value='${tmpl.subyTmplNm}'/></h2>
                    <div class="survey_content" style="overflow-y:hidden;">
                        <ul>
                            <!-- <li>
                                <p class="txt_thanks">설문에 응해주셔서 감사합니다.</p>
                            </li> -->
                            <c:forEach items="${questinList}" var="qlist" varStatus="status">

                            <c:set value="${qlist.subyTmplSeq}" var="subyTmplSeq"/>
                            <c:set value="${qlist.subyTmplQestSeq}" var="subyTmplQestSeq"/>
                                <li>
                                    <h3><c:out value="${status.index +1}"/>. <c:out value="${qlist.qestCont}"/></h3>
                                    <div class="answer_area">
                                        <c:forEach items="${answerList}" var="alist" varStatus="status">
                                            <c:choose>
                                                <c:when test="${qlist.qestTpCd eq '01' }">
                                                    <!-- 1.객관식 단답형 -->
                                                    <c:if test="${subyTmplSeq == alist.subyTmplSeq && subyTmplQestSeq == alist.subyTmplQestSeq}">
                                                        <p><label class="label_check"><input type="radio" name="rad_${alist.subyTmplSeq}_${alist.subyTmplQestSeq}" id="rad_${alist.subyTmplSeq}_${alist.subyTmplQestSeq}_${alist.itemSeq}" class="form_check"> ${alist.answCont}</label></p>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${qlist.qestTpCd eq '02' }">
                                                    <!-- 2.객관식 다답형 -->
                                                    <c:if test="${subyTmplSeq == alist.subyTmplSeq && subyTmplQestSeq == alist.subyTmplQestSeq}">
                                                        <p><label class="label_check"><input type="checkbox" name="chk_${alist.subyTmplSeq}_${alist.subyTmplQestSeq}_${alist.itemSeq}" class="form_check"> ${alist.answCont}</label></p>
                                                    </c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- 3.주관식 -->
                                                    <c:if test="${subyTmplSeq == alist.subyTmplSeq && subyTmplQestSeq == alist.subyTmplQestSeq}">
                                                        <textarea rows="3" cols="" id="txt_${alist.subyTmplSeq}_${alist.subyTmplQestSeq}" class="form_textarea"></textarea>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div> <!-- end div -->
                                </li> <!-- end li -->
                            </c:forEach> <!-- end questionList -->
                            <c:if test="${questinList.size() ne 0}">
                                <li>
                                    <h3>* <spring:message code='crm.lbl.cmplReasonCont'/></h3> <!-- 불만족원인 -->
                                    <textarea rows="3" cols="" id="txt_" class="form_textarea"></textarea>
                                </li>
                            </c:if>
                        </ul> <!-- end ul -->
                    </div>
                </div>
            </div>
            <!-- //설문 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //설문조사 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {
    });

 </script>


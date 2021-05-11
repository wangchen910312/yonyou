<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
            <div id="calendarArea">
            <!-- content_list -->
                <div class="content_title conttitlePrev caldayheader" id="header_day" style="display:none;">
                    <h2>
                        <span class="weekprev" id="prev_week" onclick="onclickPrevWeek();return false;">이전</span><span id='curr_Month'>${SysYM}</span><span class="weeknext" id="next_week" onclick="onclickNextWeek();return false;">다음</span>
                    </h2>
                </div>
                <div class="content_title conttitlePrev calmonthheader" id="header_month">
                    <h2><input type="text" id="sDatepicker" value="${SysYM}" style="display:inline;font-size:20px;width:90px;"><span class="btn_hcaldate" onclick="datepickerCallBack('sDatepicker',datepickerCalllBack);return false;"><spring:message code='global.lbl.date' /></span></h2>
                </div>

                <!-- // SchedulerTp:01(내방) / 02(시승) / 03(영업자 스케줄) -->
                <div class="calitem" id="schedulerTp">
                    <c:forEach var="obj" items="${schedulerTpList}" varStatus="status">
                        <span class="on" id="calitem_span_${obj.cmmCd}" onclick="schedulerTpClick('${obj.cmmCd}',this);return false;"  >
                            <span class="w${status.count}" >
                                <span class="title"><input type="checkbox" id="schedulerTp_${obj.cmmCd}" name="schedulerTp_${obj.cmmCd}" class="f_check" value="${obj.cmmCd}" checked readonly/><label for="schedulerTp_${obj.cmmCd}">${obj.cmmCd}_${obj.cmmCdNm}</label> <span class="num" id="SchedulerTp${obj.cmmCd}_cnt"></span></span>
                            </span>
                        </span>
                    </c:forEach>
                </div>

                <div class="calweekly" style="display:none;">
                    <ul>
                        <li>
                            <span class="weekly"><spring:message code='global.lbl.sunday' /><!-- 일 --></span>
                            <span class="day" id="week_0" onclick="setCurDate('sWeek_0');return false;"></span>
                        </li>
                        <li>
                            <span class="weekly"><spring:message code='global.lbl.monday' /><!-- 월 --></span>
                            <span class="day" id="week_1" onclick="setCurDate('sWeek_1');return false;"></span>
                        </li>
                        <li>
                            <span class="weekly"><spring:message code='global.lbl.tuesday' /><!-- 화 --></span>
                            <span class="day" id="week_2" onclick="setCurDate('sWeek_2');return false;"></span>
                        </li>
                        <li class="choice">
                            <span class="weekly"><spring:message code='global.lbl.wednesday' /><!-- 수 --></span>
                            <span class="day" id="week_3" onclick="setCurDate('sWeek_3');return false;"></span>
                        </li>
                        <li>
                            <span class="weekly"><spring:message code='global.lbl.thursday' /><!-- 목 --></span>
                            <span class="day" id="week_4" onclick="setCurDate('sWeek_4');return false;"></span>
                        </li>
                        <li>
                            <span class="weekly"><spring:message code='global.lbl.friday' /><!-- 금 --></span>
                            <span class="day" id="week_5" onclick="setCurDate('sWeek_5');return false;"></span>
                        </li>
                        <li>
                            <span class="weekly"><spring:message code='global.lbl.saturday' /><!-- 토 --></span>
                            <span class="day" id="week_6" onclick="setCurDate('sWeek_6');return false;"></span>
                        </li>
                        <input type="hidden" id='sWeek_0'/>
                        <input type="hidden" id='sWeek_1'/>
                        <input type="hidden" id='sWeek_2'/>
                        <input type="hidden" id='sWeek_3'/>
                        <input type="hidden" id='sWeek_4'/>
                        <input type="hidden" id='sWeek_5'/>
                        <input type="hidden" id='sWeek_6'/>
                    </ul>
                </div>

                <div class="m_calendar" id="itemForm">
                    <div id="scheduler"></div>
                </div>
                    <input type="hidden" id="sActiveDt" name="sActiveDt" />
                <!-- //스케쥴 상세 -->
            </div> <!-- calendarArea -->



            <!-- content_detail -->


<!-- salesActiveArea [START]-->
<!-- salesActiveArea [START]-->

            <!-- 영업활동 상세정보 selectSalesActiveMgmtMain.jsp -->
            <div class="content_right" id="salesActiveArea" style="display:none">
                <section class="content_detail" >
                    <div class="content_title conttitlePrev">
                        <h2><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></h2>
                    </div>
                    <div class="formarea">
                        <table class="flist01">
                            <caption><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody id="salesActiveMgmtForm">
                                 <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <input type="hidden" id="salesActiveNo" name="salesActiveNo" data-json-obj="true" />
                                        <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                        <div class="f_item01">
                                            <input type="text" id="custNm" name="custNm" value="" readOnly>
                                            <span class="search" id="custSearch"><spring:message code='global.lbl.custSearch' /><!-- 검색 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.commMthCd' /><!-- 연락방식 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="commMthCd" name="commMthCd" class="form_comboBox" data-json-obj="true" required placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.prefCommNo' /><!-- 선호연락처 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="prefCommNo" name="prefCommNo" data-json-obj="true" required maxlength="14" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="2"><spring:message code='crm.lbl.planStartDt' /><!-- 계획시작일자  --></th>
                                    <td>
                                         <div class="f_item01">
                                            <input type="search" id="planStartDt" name="planStartDt" value="" required readOnly data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('planStartDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="f_item01">
                                            <input type="text" id="planStartDtTime" name="planStartDtTime" value="" required class="" readOnly>
                                            <span class="time" onclick="timepicker2('planStartDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="2"><spring:message code='crm.lbl.planEndDt' /><!-- 계획종료일자  --></th>
                                    <td>
                                         <div class="f_item01">
                                            <input type="search" id="planEndDt" name="planEndDt" value="" readOnly required data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('planEndDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="f_item01">
                                            <input type="text" id="planEndDtTime" name="planEndDtTime" value="" required class="" readOnly>
                                            <span class="time" onclick="timepicker2('planEndDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.salesActiveTpCd' /><!-- 영업활동유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="salesActiveTpCd" name="salesActiveTpCd" data-json-obj="true" required class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.salesActiveStatCd' /><!-- 영업활동상태 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="salesActiveStatCd" name="salesActiveStatCd" data-json-obj="true" required class="f_text" placeholder="" disabled="disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></th>
                                    <td>
                                         <div class="f_text f_disabled"><input type="text" id="pconCustNm" name="pconCustNm" class="f_text" placeholder="" disabled="disabled"></div>
                                        <input type="hidden" id="pconCustNo" name="pconCustNo" data-json-obj="true" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.pconPrefCommNo' /><!-- 연계인선호연락번호 --></th>
                                    <td>
                                         <div class="f_text f_disabled"><input type="text" id="pconPrefCommNo" name="pconPrefCommNo" data-json-obj="true" class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="2"><spring:message code='crm.lbl.realActiveStart' /><!-- 실제진행시작   --></th>
                                    <td>
                                         <div class="f_item01">
                                            <input type="search" id="activeStartDt" name="activeStartDt" value="" readOnly data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('activeStartDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="f_item01">
                                            <div class="f_text"><input type="text" id="activeStartDtTime" name="activeStartDtTime" value="" class="" readOnly></div>
                                            <span class="time" onclick="timepicker2('activeStartDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="2"><spring:message code='crm.lbl.realActiveEnd' /><!-- 실제진행종료   --></th>
                                    <td>
                                         <div class="f_item01">
                                            <input type="search" id="activeEndDt" name="activeEndDt" value="" readOnly data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('activeEndDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="f_item01">
                                            <input type="text" id="activeEndDtTime" name="activeEndDtTime" value="" class="" readOnly>
                                            <span class="time" onclick="timepicker2('activeEndDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="regUsrNm" name="regUsrNm" class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                    <td>
                                        <input type="hidden" id="scId" name="scId" data-json-obj="true">
                                        <div class="f_text f_disabled"><input type="text" id="scNm" name="scNm" required class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="remark" name="remark" class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.activeCont' /><!-- 활동내용 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="activeCont" name="activeCont" data-json-obj="true" required maxlength="1000" class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.activeRsltCont' /><!-- 활동결과 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="activeRsltCont" name="activeRsltCont" maxlength="1000" data-json-obj="true" class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.guideCmmtCont' /><!-- 지도평어내용 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="guideCmmtCont" name="guideCmmtCont" maxlength="1000" data-json-obj="true" class="f_text" placeholder="" disabled="disabled"></div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="con_btnarea btncount2">
                        <div><span class="btnd1" id="btnSave_salesActiveArea"><spring:message code='global.btn.save' /></span></div>
                        <div><span class="btnd1" id="btnSave_salesActiveArea_close"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                    </div>
                </section>
            </div><!-- salesActiveArea -->



<!-- salesActiveArea [END]-->
<!-- salesActiveArea [END]-->




<!-- testDriveArea [START]-->
<!-- testDriveArea [START]-->






        <!-- content_detail -->
            <!-- 내방 -->
            <div class="content_right" id="visitCustomerArea"  style="display:none">
                <section class="content_detail" >
                    <div class="content_title conttitlePrev">
                        <h2><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></h2>
                    </div>
                    <div class="formarea">
                        <table class="flist01">
                            <caption><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody id="visitCustomerMgmtForm">
                                 <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="visitCustomer_custNm" name="custNm" data-json-obj="true" class="" placeholder="" disabled />
                                            <input type="hidden" id="visitCustomer_custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNo" />
                                            <input type="hidden" id="visitCustomer_vsitNo" name="vsitNo" data-json-obj="true" />
                                            <input type="hidden" id="visitCustomer_leadNo" name="leadNo" data-json-obj="true" />

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text ">
                                            <input type="number" class="numberic"  id="visitCustomer_hpNo" name="hpNo"  data-json-obj="true" required maxlength="14" class="" placeholder="" />
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                    <td>
                                        <input type="hidden" id="visitCustomer_scId" name="scId" data-json-obj="true">
                                        <div class="f_text "><input type="text" id="visitCustomer_scNm" name="scNm" required class="f_text" placeholder="" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="2"><spring:message code="global.lbl.resvDt" /><!-- 예약일시 --></th>
                                    <td>
                                         <div class="f_item01 ">
                                            <input type="search" id="visitCustomer_resvDt" name="resvDt" value="" required data-json-obj="true"/>
                                            <span class="date" onclick="calpicker('visitCustomer_resvDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="f_item01 ">
                                            <input type="text" id="visitCustomer_resvDtTime" name="resvDtTime" value="" required class="" >
                                            <span class="time" onclick="timepicker2('visitCustomer_resvDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='global.lbl.csltTmCd' /><!-- 상담시간  --></th>
                                    <td>
                                        <div class="f_text ">
                                        <input type="text" id="visitCustomer_csltTmCd" name=csltTmCd class="form_comboBox" data-json-obj="true"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code="global.lbl.visitPathCd" /><!-- 내방출처 --></th>
                                    <td>
                                        <div class="f_text ">
                                        <input type="text" id="visitCustomer_vsitSrcCd" name="vsitSrcCd" class="form_comboBox" data-json-obj="true"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code="global.lbl.visitPathCd" />2<!-- 내방출처2 --></th>
                                    <td>
                                        <div class="f_text ">
                                        <input type="text" id="visitCustomer_vsitSrcDetlCont" name="vsitSrcDetlCont" class="form_comboBox" data-json-obj="true"  />
                                        </div>
                                    </td>
                                </tr>



                                <tr>
                                    <th scope="row" ><spring:message code="global.lbl.visitStatCd" /><!-- 내방상태 --></th>
                                    <td>
                                        <div class="f_text ">
                                        <input type="text" id="visitCustomer_vsitStatCd" name="vsitStatCd" class="form_comboBox" data-json-obj="true"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="visitCustomer_regUsrNm" name="regUsrNm" data-json-obj="true"  placeholder="" disabled/>
                                            <input type="hidden" id="visitCustomer_regUsrId" name="regUsrId" data-json-obj="true" required />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='global.lbl.regDt' /><!-- 등록일   --></th>
                                    <td>
                                         <div class="f_text f_disabled">
                                            <input type="text" id="visitCustomer_regDt" name="regDt" class="form_input" disabled />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.memo' /><!-- 메모 --></th>
                                    <td>
                                        <textarea rows="3" cols="" id="visitCustomer_remark" name="remark" class="f_textarea" data-json-obj="true" maxlength="1000"  ></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="con_btnarea">
                         <div style="display:none;"><span class="btnd1" id="btnSave_visitCustomerArea"><spring:message code='global.btn.save' /></span></div><!-- ToDo 향후 저장로직 추가 여부 확인 -->
                        <div><span class="btnd1" id="btnSave_visitCustomerArea_close"><spring:message code='global.btn.confirm' /></span></div>
                    </div>
                    <!--
                    <div class="con_btnarea btncount2">
                        <div><span class="btnd1" id="btnSave_visitCustomerArea"><spring:message code='global.btn.save' /></span></div>
                        <div><span class="btnd1" id="btnSave_visitCustomerArea_close"><spring:message code='global.btn.confirm' /></span></div>
                    </div>
                    -->
                </section>
            </div><!-- visitCustomerArea -->

<!-- visitCustomerArea [END]-->
<!-- visitCustomerArea [END]-->






<!-- testDriveArea [START]-->
<!-- testDriveArea [START]-->





            <!-- content_detail -->
            <!-- 시승상세정보 selectTestDriveMgmtMain.jsp -->
            <div class="content_right" id="testDriveArea" style="display:none">
                <section class="content_detail">
                    <div class="co_group">
                        <div class="content_title conttitlePrev">
                            <h2><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></h2>
                        </div>
                        <div class="co_view">
                            <div class="formarea" id="formarea" >
                                <table class="flist01">
                                    <caption><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></caption>
                                    <colgroup>
                                        <col style="width:30%;">
                                        <col style="">
                                    </colgroup>
                                    <tbody id="testDriveAreaForm">
                                         <tr>
                                            <th scope="row"><spring:message code='crm.lbl.carId' /><!-- 시승모델 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_modelNm" name="modelNm" data-json-obj="true" placeholder="" disabled />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_custNm" name="custNm" data-json-obj="true" class="" placeholder="" disabled />
                                                    <input type="hidden" id="testDrive_custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                                    <input type="hidden" id="testDrive_tdrvStatCd" name="tdrvStatCd" data-json-obj="true" />

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="number" class="numberic"  id="testDrive_hpNo" name="hpNo"  data-json-obj="true" required maxlength="14" class="" placeholder="" disabled/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" ><spring:message code='global.lbl.tdrvDt' /><!-- 시승예약일자/시승일시  --></th>
                                            <td>
                                                 <div class="f_item01">
                                                    <input type="text" id="testDrive_resvDt" name="resvDt" value="" required  data-json-obj="true" disabled />
                                                    <%-- <span class="date" onclick="calpicker('testDrive_resvDt')"><spring:message code='global.lbl.tdrvDt'  /></span> --%>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" ><spring:message code='crm.lbl.tdrvHmCd' /><!-- 시승시간  --></th>
                                            <td>
                                                <div class="f_text">
                                                <input type="text" id="testDrive_tdrvHmCd" name="tdrvHmCd" class="form_comboBox" data-json-obj="true"  disabled/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" ><spring:message code='crm.lbl.tdrvClineCd' /><!-- 시승노선  --></th>
                                            <td>
                                                <div class="f_text">
                                                <input type="text"  id="testDrive_tdrvClineCd" name="tdrvClineCd"  class="form_comboBox" data-json-obj="true" placeholder="" disabled />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.tdrvPathCd' /><!-- 시승출처 --></th>
                                            <td>
                                                <div class="f_text">
                                                <input type="text" id="testDrive_tdrvPathCd" name="tdrvPathCd" class="form_comboBox" data-json-obj="true"  placeholder="" disabled />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.prsnSC' /><!-- 담당SC --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_scNm" name="scNm" data-json-obj="true"  placeholder="" disabled/>
                                                    <input type="hidden" id="testDrive_scId" name="scId" data-json-obj="true" required />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.tdrvTpCd' /><!-- 시승타입 --></th>
                                            <td>
                                                <ul class="tridetype">
                                                <c:forEach var="obj" items="${tdrvTpCdList}" varStatus="status" >
                                                    <li><span id="testDrive_tdrvTpCd_<c:out value='${obj.cmmCd}' />" name="tdrvTpCd" data-json-obj="true"><c:out value='${obj.cmmCdNm}' /></span></li>
                                                </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.memo' /><!-- 메모 --></th>
                                            <td>
                                                <textarea rows="3" cols="" id="testDrive_remark" name="remark" class="f_textarea" data-json-obj="true" maxlength="4000" disabled readonly></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" ><spring:message code='global.lbl.regDt' /><!-- 등록일   --></th>
                                            <td>
                                                 <div class="f_text">
                                                    <input type="text" id="testDrive_regDt" name="regDt" class="form_input" disabled />
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- 시승일지 -->
                     <div class="co_group">
                        <div class="content_title">
                            <h1><spring:message code='global.title.tdrvLog' /><!-- 시승일지    --></h1>
                            <div class="title_btn">
                                <span class="co_open co_close"><span>상세내용 보기 </span></span>
                            </div>
                        </div>
                        <div class="co_view" style="display:none;">
                            <div class="formarea" id="formarea" >
                                <table class="flist01">
                                    <caption>시승 상세정보</caption>
                                    <colgroup>
                                        <col style="width:30%;">
                                        <col style="">
                                    </colgroup>
                                    <tbody id="tdrvMgmtInputForm">
                                         <tr>
                                            <th scope="row"><spring:message code='crm.lbl.custStsfCd' /><!-- 고객만족도 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="hidden" id="testDrive_tdrvSeq" name="tdrvSeq"  data-json-obj="true" />
                                                <input type="hidden" id="testDrive_tdrvVinNo" name="tdrvVinNo"  data-json-obj="true" />
                                                <input type="hidden" id="testDrive_tdrvContractDocNo" name="tdrvContractDocNo" data-json-obj="true" >
                                                <input id="testDrive_custStsfCd" name="custStsfCd" class="form_comboBox"  data-json-obj="true" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.saleFcstCd' /><!-- 판매전망 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_saleFcstCd" name="saleFcstCd" data-json-obj="true"   placeholder="" >

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.befRunDistVal' /><!-- 이전 주행거리 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_befRunDistVal" name="befRunDistVal" data-json-obj="true"   placeholder="" >

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.aftRunDistVal' /><!-- 이후 주행거리 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_aftRunDistVal" name="aftRunDistVal" data-json-obj="true"   placeholder="" >

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.befRfuelQty' /><!-- 이전 주유량 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_befRfuelQty" name="befRfuelQty" data-json-obj="true"   placeholder="" >

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.aftRunDistVal' /><!-- 이후 주유량 --></th>
                                            <td>
                                                <div class="f_text">
                                                    <input type="text" id="testDrive_aftRfuelQty" name="aftRfuelQty" data-json-obj="true"   placeholder="" >

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.intPblmYn" /><!-- 내장 이상유무 --></th>
                                            <td>
                                                <input type="radio" id="testDrive_intPblmYn_Y" name="intPblmYn" class="f_radio" value="Y" /><label for="intPblmYn_Y"><spring:message code="crm.lbl.problemY" /></label><!-- 있음 -->
                                                <input type="radio" id="testDrive_intPblmYn_N" name="intPblmYn" class="f_radio" value="N" checked /><label for="intPblmYn_N"><spring:message code="crm.lbl.problemN" /></label><!-- 없음 -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.extPblmYn" /><!-- 외장 이상유무 --></th>
                                            <td>
                                                <input type="radio" id="testDrive_extPblmYn_Y" name="extPblmYn" class="f_radio" value="Y" data-json-obj="true"  ><label for="extPblmYn_Y"> <spring:message code="crm.lbl.problemY" /></label><!-- 있음 -->
                                                <input type="radio" id="testDrive_extPblmYn_N" name="extPblmYn" class="f_radio" value="N" data-json-obj="true"  checked > <label for="extPblmYn_N"><spring:message code="crm.lbl.problemN" /></label><!-- 없음 -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.memo' /><!-- 메모 --></th>
                                            <td>
                                                <textarea rows="3" cols="" id="testDrive_remark2" name="remark" data-json-obj="true" class="f_textarea" maxlength="1000"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="con_btnarea btncount2">
                        <div><span class="btnd1" id="btnSave_testDriveArea"><spring:message code='global.btn.save' /></span></div>
                        <div><span class="btnd1" id="btnSave_testDriveArea_close"><spring:message code='global.btn.confirm' /><!-- 확인 --></span></div>
                    </div>
                </section>
            </div>
            <!-- testDriveArea -->

<!-- testDriveArea [END]-->
<!-- testDriveArea [END]-->



        </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- 스케쥴러에 나타나는 내방 예약 정보 -->
<script id="activeInfoView" type="text/x-kendo-template">

    # var schedulerTpNm ;#
    # var schedulerColor ;#

    #if(schedulerTp === '01') {#

        #if(schedulerStat === '01') {#
            #schedulerTpNm = '<spring:message code='global.lbl.visitResv' />'#      <!-- 내방예약 -->
        #} else if(schedulerStat === '03'){#
            #schedulerTpNm = '<spring:message code='global.lbl.visit' />'#          <!-- 내방 -->
        #}#
        #schedulerColor = 'scheduler_color01';#

    #} else if(schedulerTp === '02'){#

        #if(schedulerStat === '01') {#
            #schedulerTpNm = '<spring:message code='global.lbl.tdrvResv' />'#       <!-- 시승예약 -->
        #} else if(schedulerStat === '03'){#
            #schedulerTpNm = '<spring:message code='global.lbl.tdrv' />'#           <!-- 시승 -->
        #}#
        #schedulerColor = 'scheduler_color02';#

    #} else if(schedulerTp === '03'){#

        #schedulerTpNm = salesActiveTpCdArrVal(salesActiveTpCd) #               <!-- 영업활동유형 -->
        #schedulerColor = 'scheduler_color03';#

    #}#

    # var scNm ;#
    #if(scNm == null) {#
        #scNm = '<spring:message code='global.lbl.unsettled' />' #        <!-- 미정 -->
    #} else if(scNm != ''){#
        #scNm = scNm #
    #}#

    <div class="scheduler_padding #= schedulerColor #">
        <span>
            [#= schedulerTpNm #] #= custNm #<br>
        </span>
        <span>
            #= scNm #
        </span>
    </div>
</script>





<!-- //영업스케줄 팝업 -->

<script type="text/javascript">

var popupWindow
    , popupUrl
    , popupWindowId
    , popupTitle
    , sStartDt          // 달력 검색을 위한 변수

;

// 판매기회단계 상태
var saleOpptStepCdDs = [];
<c:forEach var="obj" items="${saleOpptStepCdList}">
    saleOpptStepCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

// 스케줄타입
var schedulerTpDs = [];
<c:forEach var="obj" items="${schedulerTpList}">
    //schedulerTpDs.push({color:"${obj.remark1}", value:"${obj.cmmCd}"});
</c:forEach>
    schedulerTpDs.push({color:"#1aa816", value:"01"});
    schedulerTpDs.push({color:"#ff4e00", value:"02"});
    schedulerTpDs.push({color:"#1b8deb", value:"03"});

// 영업활동유형 DS
var salesActiveTpCdDs = [];
var salesActiveTpCdArr = [];
<c:forEach var="obj" items="${salesActiveTpCdList}">
    salesActiveTpCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
salesActiveTpCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = salesActiveTpCdArr[val];
    }
    return returnVal;
};


// 담당자 목록
var usersDS = [];
<c:forEach var="obj" items="${users}">
    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

// dateFormat:yyyy-MM-dd 는 오류남.
var sysDate = new Date("<c:out value='${sysDate}' />");  //초기 화면 호출 및 월변경시 데이터 취득

//var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
//var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";

function drawSchedule(curDate, monFl, dayFl){

    sysDate = new Date(curDate);
    //startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    //endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";

    var schedulerDs = new kendo.data.SchedulerDataSource({
        batch:true

        ,transport:{
            read:{
                url:"<c:url value='/mob/crm/cso/salesActive/selectSalesActiveCalendars.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    params["sStartDt"] = sysDate;

                    console.log("scheduler param:"+kendo.stringify(params));

                    return kendo.stringify(params);

                } else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }

        ,schema:{
            data:"data",
            total:"total",
             model:{
                id:"totalSchedulerSeq",
                fields:{
                         totalSchedulerSeq:{ type:"string"}
                        ,schedulerSeq:{ type:"string"}
                        ,schedulerTp:{ type:"string"}
                        ,title:{ type:"string"}
                        ,schedulerStat:{ type:"string"}
                        ,scId:{ type:"string"}
                        ,start:{ type:"date"}
                        ,end:{ type:"date"}
                        ,custNm:{ type:"string"}
                }
            }
        }
    });
    $("#scheduler").text("");
    $("#scheduler").kendoScheduler({
        date:sysDate
        //,startTime:new Date(startTime)
        //,endTime:new Date(endTime)
        ,views:[
            //,"week"
            ,{ type:"day",  selected:dayFl, allDaySlot:false}
            ,{ type:"month", selected:monFl, eventHeight:38}
        ]
        ,showWorkHours:false
        ,dataSource:schedulerDs
        //,selectable:true  중문에서 날짜클릭시 에러 대응[일별 날짜 변경시]
        ,selectable:false
        //,height:760
        ,footer:false
        ,eventTemplate:$("#activeInfoView").html()
        ,navigate:function(e){

            // 달력 날짜 클릭시 클릭된 날짜 가져오기
            sStartDt = JSON.parse(JSON.stringify(e.date));
            $("#scheduler").data("kendoScheduler").dataSource.read();

        }
        ,dataBound:function(e){
            // 스케줄러 x 표시 삭제
            $(".k-event-actions .k-event-delete").remove();

            initVisibleFalse(this._selectedViewName);

            if(this._selectedViewName =="day"){
                $("#itemForm")[0].className = "m_calday";
                $(".calweekly").attr('style','display:block;');

                $("#header_month").attr('style','display:none;');
                $("#header_day").attr('style','display:block;');

                //일 달력에서 선택한 날짜에 해당하는 주차 표시
              //setWeekHeader(e.sender._model.formattedShortDate);
                setWeekHeader(chgServerDate2Str(e.sender._model.selectedDate));
            } else {
                $("#itemForm")[0].className = "m_calendar";
                $(".calweekly").attr('style','display:none;');

                $("#header_month").attr('style','display:block;');
                $("#header_day").attr('style','display:none;');
            }
            //달력조회후 데이터 취득
            //sStartDt = e.sender._model.selectedDate;

            //내방,시승,영업 건수 취득 jquery실행
            // param (month/day)선택  및 현재 날짜
            getSalesActiveCalendarsCnt(this._selectedViewName,e.sender._model.selectedDate);
        }
        ,resources:[
                    {
                         field:"schedulerTp"       // CRM362 01(내방) / 02(시승) / 03(활동)
                        ,dataSource:schedulerTpDs
                    }
                    ,{
                         field:"scId"
                        ,title:"<spring:message code='crm.lbl.scId' />"       // 판매고문
                        ,dataSource:usersDS
                    }
        ]
        ,editable:false
    });
    if(monFl) {
        initVisibleFalse('month');
        var scheduler = $("#scheduler").data("kendoScheduler");  //일단력에서 월단력으로 이동시 화면이 비표시 되는 문제로 인하여 스케줄 달력 refresh 호출
        scheduler.refresh();
        $("#sDatepicker").val(curDate.substring(0,7));
    }else {
        initVisibleFalse('day');
    }
}

//k-more-events k-button

//scheduler_padding scheduler_color01
//scheduler_padding scheduler_color03

//scheduler_padding scheduler_color01 일단력
// 더블클릭 이벤트
$("#scheduler").on("click", '.k-scheduler-table td, .k-event', function(e) {

        var schedulerTp
        , schedulerSeq
        , start
        , scheduler
        , element
        , event
    ;

    scheduler = $("#scheduler").getKendoScheduler();
    element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
    event = scheduler.occurrenceByUid(element.data("uid"));

    if ( event ) {      // 수정

        schedulerTp = event.schedulerTp
        start = event.start
        schedulerSeq = event.schedulerSeq


    } else {            // 신규
        alert('신규 ');
        return;

/*         schedulerTp = "03";
        start = scheduler._selection.start;

        if( dms.string.isEmpty($("#sCustNo").val()) ){
            // 고객 / 을(를) 선택해주세요.
            dms.notification.info("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
            return;
        } */

    }
    if(schedulerTp === "01"){

        // 내방 팝업 호출
        /*
        popupUrl = "<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerPopup.do'/>";
        popupWindowId = "visitCustomerPopup"
        popupTitle = "<spring:message code='crm.title.visitCustomer' />" //내방예약
        */
        contentDetail_visitCustomerArea(schedulerSeq);
    }else if(schedulerTp === "02"){
        // 시승 팝업 호출
        //popupUrl = "<c:url value='/mob/crm/cso/testDrive/selectTestDriveMgmtMain.do'/>";
        //popupWindowId = "tdrvResvPopup"
        //popupTitle = "<spring:message code='crm.title.tdrvResv' />" //시승예약

        contentDetail_testDriveArea(schedulerSeq);
    }else {
        // 영업활동 시행내역 호출
        //popupUrl = "<c:url value='/mob/crm/cso/salesActive/selectSalesActiveMgmtMain.do'/>"
        //popupWindowId = "salesActivePopup"
        //popupTitle =  "<spring:message code='crm.menu.salesActivePlan' />"  // 영업활동 시행내역

        contentDetail_SalesActiveArea(schedulerSeq);
    }

});



//각 주차 날짜 클릭시
function setCurDate(obj){
    var DateObj = chgDate($("#"+obj).val());

    //주차 헤더 세팅시 해당월 세팅
    $("#curr_Month").text(chgServerDate2Str(DateObj).substring(0, 7));

    var dayOfWeek = DateObj.getDay();
    var scheduler = $("#scheduler").data("kendoScheduler");
    setWeekClassSelect(dayOfWeek)
    //curDate, monFl, dayFl
    drawSchedule(chgServerDate2Str(DateObj),false,true); //일단력 표시
}


//전주 주차 클릭
function onclickPrevWeek(){
    var DateObj = chgDate($("#sWeek_0").val());
    DateObj.setDate(DateObj.getDate() -1);  //전일 세팅

    //setWeekHeader(chgServerDate2Str(DateObj));
    var scheduler = $("#scheduler").data("kendoScheduler");
    //curDate, monFl, dayFl
    drawSchedule(chgServerDate2Str(DateObj),false,true); //일단력 표시
}

//차주 주차 클릭
function onclickNextWeek(){
    var DateObj = chgDate($("#sWeek_6").val());
    DateObj.setDate(DateObj.getDate() +1);  //전일 세팅

    //curDate, monFl, dayFl
    drawSchedule(chgServerDate2Str(DateObj),false,true); //일단력 표시
}

//주차 헤더 세팅
function setWeekHeader(dateStr){
    var date = chgDate(dateStr);
    //주차 헤더 세팅시 해당월 세팅
    $("#curr_Month").text(chgServerDate2Str(date).substring(0, 7));

    var dayOfWeek = date.getDay();
    date.setDate(date.getDate()-dayOfWeek);

    setWeekClassSelect(dayOfWeek); // 주차 class선택 세팅 호출
    for (var cidx = 0; cidx < 7; cidx++) {

        $("#week_"+cidx).text((date.getDate())+"");

        //hidden 요일 날짜 세팅
        $("#sWeek_"+cidx).val(chgServerDate2Str(date));
        date.setDate(date.getDate()+1);
    }
}

//주차 class선택 세팅
function setWeekClassSelect(dayOfWeek){
    //class추가 선택시
    var orgClassName ;
    for (var cidx = 0; cidx < 7; cidx++) {
        orgClassName = $("#week_"+cidx)[0].parentNode.className;
        if(dayOfWeek == cidx){
            $("#week_"+cidx)[0].parentNode.className = orgClassName + " choice";
        }else{
            $("#week_"+cidx)[0].parentNode.className = orgClassName.replace(/choice/gi,"");
        }
    }
    return false;
}

function datepickerCalllBack(dt_curr){
    goSelectMonth(dt_curr+"-01");
}

//내발,시승,스케줄 선택시
function schedulerTpClick(val,obj){

    //내발,시승,스케
    if($("#calitem_span_"+val).attr("class") == 'on'){
        $("#calitem_span_"+val).attr("class","");
        $("#schedulerTp_"+val).prop("checked", false);
    } else {
        $("#calitem_span_"+val).attr("class","on");
        $("#schedulerTp_"+val).prop("checked", true);
    }

    var checked = $.map($("#schedulerTp :checked"), function(checkbox){
        return $(checkbox).val();
    });

    var scheduler = $("#scheduler").data("kendoScheduler");

    scheduler.dataSource.filter({
        operator:function(task){
            return $.inArray(task.schedulerTp, checked) >= 0;
        }
    });
    return false;
}

//내방,시승,영업 건수 취득 jquery실행
function getSalesActiveCalendarsCnt(dateFl, curDate){
    var pageIndex = 0, pageSize = 100;
    var rowIndex = 0, rowTotal = 1000;
    var params = {};

    //params["recordCountPerPage"] = pageSize;
    //params["pageIndex"] = pageIndex;
    //params["firstIndex"] = (pageIndex - 1) * pageSize;
    //params["lastIndex"] = pageIndex * pageSize;
    params["sStartDt"] = curDate;

    console.log("scheduler param:"+kendo.stringify(params));
    $.ajax({
          url:"<c:url value='/mob/crm/cso/salesActive/selectSalesActiveCalendarsCnt.do' />"+"?dateFl="+dateFl
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);

              //app.hideLoading();
          }
          ,success:function(result) {
            //result.data.resMap.SchedulerTp01;
              if(result.data[0].SchedulerTp01 !=null){
                $("#SchedulerTp01_cnt").text(result.data[0].SchedulerTp01);
              }
              if(result.data[0].SchedulerTp02 !=null){
                $("#SchedulerTp02_cnt").text(result.data[0].SchedulerTp02);
              }
              if(result.data[0].SchedulerTp03 !=null){
                $("#SchedulerTp03_cnt").text(result.data[0].SchedulerTp03);
              }
              //app.hideLoading();
          }
      });
      return false;
}
// 월,일 단력에 따른 헤더값 표시 비표시 실행
function initVisibleFalse(param){
    //테스트용 주석 처리 kendo스케줄러에서 제공하는 캘린더 헤더 및 날짜선택 비표시 [S]
    $('.k-scheduler .k-scheduler-toolbar').attr('style','display:none;'); //kendo스케줄러에서 제공하는 캘린더 헤더 및 날짜선택 비표시
    $('.k-scheduler .k-scheduler-layout > tbody')[0].firstChild.style.display = "none"; //kendo스케줄러에서 제공하는 요일 비표시
    /*
    if(param =='month'){
        $('.k-scheduler .k-scheduler-layout > tbody')[0].firstChild.style.display = "none"; //kendo스케줄러에서 제공하는 요일 비표시
    } else {
        // 일달력에서 allday 영역이외 비표시
        $('.k-scheduler-times .k-scheduler-table  > tbody')[0].firstChild.style.display = "none"; //kendo스케줄러에서 제공하는 요일 비표시
        $('.k-scheduler-header-wrap .k-scheduler-table  > tbody')[0].firstChild.style.display = "none"; //kendo스케줄러에서 제공하는 요일 비표시
    }
    */
    //테스트용 주석 처리 kendo스케줄러에서 제공하는 캘린더 헤더 및 날짜선택 비표시 [E]
}

//일단력에서 이전버튼 클릭시
function goMonth(){
    var day = $('.calweekly .choice .day').text();
    if(day.length < 2){
        day = "-0"+day;
    }else{
        day = "-"+day;
    }
    var curdate = $("#curr_Month").text()+day;





    goSelectMonth(curdate);  //일단력에서 이전버튼 클릭후 월달력 호출 시 에러 대응
    //window.open("<c:url value='/mob/crm/cso/salesActive/selectSalesActiveCalendarMain.do' />"+"?curdate="+curdate, "_self");
    return false;
}

// 조회에 해당하는 달의 달력표시
function goSelectMonth(searchDate){
    //window.open("<c:url value='/mob/crm/cso/salesActive/selectSalesActiveCalendarMain.do' />"+"?searchDate="+searchDate, "_self");
    //curDate, monFl, dayFl
    drawSchedule(searchDate,true,false);
    return false;
}
</script>


<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDate,
    gCrud;




$(document).ready(function() {
  //현재일자
    /* var toDay = "${toDay}";
    var lastDay = "${lastDay}"; */

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        //$(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code="crm.menu.salesActiveScheduler" />"); //<!-- 영업활동 스케줄 -->

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#header_day").css("display") == "block") { goMonth(); }
        else if($("#header_month").css("display") == "block") { goMonth(); }
        //else if ($("#content_detail").css("display") == "block") { goMain(); }
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

    //initVisibleFalse('month');

    //curDate, monFl, dayFl
    drawSchedule("<c:out value='${sysDate}' />",true,false);
});

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//영업  활동 스케줄[Start]
//영업  활동 스케줄[Start]
//영업  활동 스케줄[Start]
//영업  활동 스케줄[Start]
//영업  활동 스케줄[Start]
//영업  활동 스케줄[Start]

//연락방식 DS
var commMthCdDs = [];
var commMthCdArr = [];
<c:forEach var="obj" items="${commMthCdList}">
    commMthCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    commMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
commMthCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = commMthCdArr[val];
    }
    return returnVal;
};

// 영업활동상태 DS
var salesActiveStatCdDs = [];
var salesActiveStatCdArr = [];
<c:forEach var="obj" items="${salesActiveStatCdList}">
    salesActiveStatCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 연락방식
$("#commMthCd").kendoExtDropDownList({
    dataSource:commMthCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.all'/>"
    , index:0
});

// 영업활동상태
$("#salesActiveStatCd").kendoExtDropDownList({
    dataSource:salesActiveStatCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.all'/>"
    , index:0
});

// 영업활동유형
$("#salesActiveTpCd").kendoExtDropDownList({
    dataSource:salesActiveTpCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.all'/>"
    , index:0
});


//상세페이지 보기
//selectSalesActiveMgmtMain.jsp 페이지 상세 기능 사용
function contentDetail_SalesActiveArea(salesActiveNo) {
  $("#calendarArea").css("display","none");
  $("#salesActiveArea").css("display","block");

  //if( dataItem.salesActiveNo != null && dataItem.salesActiveNo != 'undefined'){
  //    var param = {"sSalesActiveNo":dataItem.salesActiveNo};
  if( salesActiveNo != null && salesActiveNo != 'undefined'){
      var param = {"sSalesActiveNo":salesActiveNo};
      mob.loading.show();
      $.ajax({
          //url:"<c:url value='/mob/par/pmm/itemMaster/selectMobileItemMasterByKey.do' />",
          url:"<c:url value='/mob/crm/cso/salesActive/selectSalesActiveMgmtByKey.do' />",
          data:JSON.stringify(param),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
            mob.loading.hide();
              mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
          }

      }).done(function(body) {
          mob.loading.hide();
          //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
          //if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
          //    return false;
          //}

          //입력폼 초기화
          initForm_SalesActiveArea();

          $("#salesActiveNo").val(body.salesActiveNo);
          $("#custNo").val(body.custNo);
          $("#custNm").val(body.custNm);
          $("#commMthCd").data("kendoExtDropDownList").value(body.commMthCd);
          $("#prefCommNo").val(body.prefCommNo);
          $("#planStartDt").val(chgDate2Str(body.planStartDt));
          $("#planStartDtTime").val(chgDate2TimeStr(body.planStartDt));
          $("#planEndDt").val(chgDate2Str(body.planEndDt));
          $("#planEndDtTime").val(chgDate2TimeStr(body.planEndDt));
          $("#salesActiveTpCd").data("kendoExtDropDownList").value(body.salesActiveTpCd);
          $("#pconCustNm").val(body.pconCustNm);
          $("#pconCustNo").val(body.pconCustNo);
          $("#activeStartDt").val(chgDate2Str(body.activeStartDt));
          $("#activeStartDtTime").val(chgDate2TimeStr(body.activeStartDt));
          $("#activeEndDt").val(chgDate2Str(body.activeEndDt));
          $("#activeEndDtTime").val(chgDate2TimeStr(body.activeEndDt));
          $("#salesActiveStatCd").data("kendoExtDropDownList").value(body.salesActiveStatCd);
          $("#pconPrefCommNo").val(body.pconPrefCommNo);
          $("#regUsrNm").val(body.regUsrNm);
          $("#scId").val(body.scId);
          $("#scNm").val(body.scNm);
          $("#remark").val(body.remark);
          $("#activeCont").val(body.activeCont);
          $("#activeRsltCont").val(body.activeRsltCont);
          $("#guideCmmtCont").val(body.guideCmmtCont);

          // 상태가 종료이면 읽기전용
          if ( body.salesActiveStatCd == "03" ) {

              $("#commMthCd").data("kendoExtDropDownList").enable(false);
              $("#prefCommNo").attr("disabled", true);
              $("#planStartDt").attr("disabled", true);
              $("#planStartDtTime").attr("disabled", true);
              $("#planEndDt").attr("disabled", true);
              $("#planEndDtTime").attr("disabled", true);
              $("#salesActiveTpCd").data("kendoExtDropDownList").enable(false);
              $("#pconCustNm").attr("disabled", true);
              $("#activeStartDt").attr("disabled", true);
              $("#activeStartDtTime").attr("disabled", true);
              $("#activeEndDt").attr("disabled", true);
              $("#activeEndDtTime").attr("disabled", true);
              $("#salesActiveStatCd").data("kendoExtDropDownList").enable(false);
              $("#pconPrefCommNo").attr("disabled", true);
              $("#activeCont").attr("disabled", true);
              $("#activeRsltCont").attr("disabled", true);
              $("#guideCmmtCont").attr("disabled", true);

              $("#btnSave_salesActiveArea").data("kendoButton").enable(false);
              checkInputFormDisabled();
          }
          //partsJs.validate.groupObjAllDataSet(body);
      });
  }
}

//폼 초기화
//function initForm(){  selectSalesActiveMgmtMain.jsp 페이지 상세 기능 사용
function initForm_SalesActiveArea(){
    $("#salesActiveNo").val("");
    $("#custNo").val("");
    $("#custNm").val("");
    $("#commMthCd").data("kendoExtDropDownList").value("");
    $("#prefCommNo").val("");
    $("#planStartDt").val("");
    $("#planStartDtTime").val("");
    $("#planEndDt").val("");
    $("#planEndDtTime").val("");
    $("#salesActiveTpCd").data("kendoExtDropDownList").value("");
    $("#pconCustNm").val("");
    $("#pconCustNo").val("");
    $("#activeStartDt").val("");
    $("#activeStartDtTime").val("");
    $("#activeEndDt").val("");
    $("#activeEndDtTime").val("");
    $("#salesActiveStatCd").data("kendoExtDropDownList").value("");
    $("#pconPrefCommNo").val("");
    $("#regUsrNm").val("");
    $("#scId").val("");
    $("#scNm").val("");
    $("#remark").val("");
    $("#activeCont").val("");
    $("#activeRsltCont").val("");
    $("#guideCmmtCont").val("");

    $("#commMthCd").data("kendoExtDropDownList").enable(true);
    $("#prefCommNo").attr("disabled", false);
    $("#planStartDt").attr("disabled", false);
    $("#planStartDtTime").attr("disabled", false);
    $("#planEndDt").attr("disabled", false);
    $("#planEndDtTime").attr("disabled", false);
    $("#salesActiveTpCd").data("kendoExtDropDownList").enable(true);
    $("#pconCustNm").attr("disabled", true);
    $("#activeStartDt").attr("disabled", false);
    $("#activeStartDtTime").attr("disabled", false);
    $("#activeEndDt").attr("disabled", false);
    $("#activeEndDtTime").attr("disabled", false);
    $("#salesActiveStatCd").data("kendoExtDropDownList").enable(true);
    $("#pconPrefCommNo").attr("disabled", false);
    $("#activeCont").attr("disabled", false);
    $("#activeRsltCont").attr("disabled", false);
    $("#guideCmmtCont").attr("disabled", false);

    $("#btnSave_salesActiveArea").data("kendoButton").enable(true);
    checkInputFormDisabled();
}

//버튼 - 영업활동상세 닫기
$("#btnSave_salesActiveArea_close").kendoButton({
    click:function(e){
    $("#calendarArea").css("display","block");
    $("#salesActiveArea").css("display","none");
    }
});

//버튼 - 영업활동상세 표시
$("#btnSave_salesActiveArea").kendoButton({
    click:function(e){
        //var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");
        var validator = $("#salesActiveMgmtForm").kendoExtMobValidator().data("kendoExtMobValidator");

        if (!validator.validate()) {
            return false;
        }
        var planStartDt = $("#planStartDt").val() +" "+ $("#planStartDtTime").val();
        var planEndDt = $("#planEndDt").val() +" "+ $("#planEndDtTime").val();


        if( planStartDt > planEndDt){
            // 계획일자 / 을(를) 확인하여 주세요.
            mob.notification.warning("<spring:message code='crm.lbl.planDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }

        var activeStartDt = $("#activeStartDt").val() +" "+ $("#activeStartDtTime").val()
            , activeEndDt = $("#activeEndDt").val() +" "+ $("#activeEndDtTime").val()
            , salesActiveStatCd = $("#salesActiveStatCd").data("kendoExtDropDownList").value()
            , dataValidate = false
        ;

        if ( dms.string.isNotEmpty(activeStartDt) || dms.string.isNotEmpty(activeEndDt) || salesActiveStatCd === "02" ) {

            if( dms.string.isEmpty(activeStartDt) ){
               dataValidate = true;
            }

            if( dms.string.isEmpty(activeEndDt) ){
               dataValidate = true;
            }

            if ( activeEndDt < activeStartDt ){
                dataValidate = true;
            }

            if (dataValidate) {
                // 실제진행일 을(를) 확인하여 주세요.
                mob.notification.warning("<spring:message code='crm.lbl.salesActiveDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return false;

            }

            if ( salesActiveStatCd !== "02" ) {
                // 영업활동상태 을(를) 확인하여 주세요.
                mob.notification.warning("<spring:message code='crm.lbl.salesActiveStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return false;

            }

        }

        var saveData = $("#salesActiveMgmtForm").serializeObject($("#salesActiveMgmtForm").serializeArrayInSelector("[data-json-obj='true']"));

        saveData.planStartDt = chgDateTimeStamphhMM($("#planStartDt").val() +" "+ $("#planStartDtTime").val());
        saveData.planEndDt = chgDateTimeStamphhMM($("#planEndDt").val() +" "+ $("#planEndDtTime").val());
        saveData.activeStartDt = chgDateTimeStamphhMM($("#activeStartDt").val() +" "+ $("#activeStartDtTime").val());
        saveData.activeEndDt = chgDateTimeStamphhMM($("#activeEndDt").val() +" "+ $("#activeEndDtTime").val());

        mob.loading.show();
        $.ajax({
             url:"<c:url value='/mob/crm/cso/salesActive/multiSalesActiveMgmts.do' />"
            ,data:JSON.stringify(saveData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            /* ,success:function(jqXHR, textStatus) {

                console.log("jqXHR:" ,jqXHR)
                console.log("textStatus:" ,textStatus)
                // 저장완료일경우 해당 데이터를 다시 조회한다.
                if(textStatus == "success" && jqXHR > 0 ){

 */
            // 저장완료일경우 해당 데이터를 다시 조회한다.
            ,success:function(result) {
                mob.loading.hide();
                if(result > 0 ){
                    // 저장 / 이 완료 되었습니다.
                    mob.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                    contentList();

                }else{
                    // 저장정보 / 을(를) 확인하여 주세요.
                    mob.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                }

            }
            ,error:function(jqXHR,status,error) {
                mob.loading.hide();
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            }
        });
    }
});


//영업  활동 스케줄[End]
//영업  활동 스케줄[End]
//영업  활동 스케줄[End]
//영업  활동 스케줄[End]
//영업  활동 스케줄[End]
//영업  활동 스케줄[End]
//영업  활동 스케줄[End]

//시승 관리 스케줄[Start]
//시승 관리 스케줄[Start]
//시승 관리 스케줄[Start]
//시승 관리 스케줄[Start]
//시승 관리 스케줄[Start]
//시승 관리 스케줄[Start]

//고객만족도
var custStsfCdDs = [];
var custStsfCdArr = [];
<c:forEach var="obj" items="${custStsfCdList}">
    custStsfCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    custStsfCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 판매전망
var saleFcstCdDs = [];
<c:forEach var="obj" items="${saleFcstCdList}">
    saleFcstCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

//시승상세정보 - 시승시간
var tdrvHmCdDs = [];
var tdrvHmCdArr = [];
<c:forEach var="obj" items="${tdrvHmCdList}">
   tdrvHmCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
   tdrvHmCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//시승상세정보 - 시승노선
var tdrvClineCdDs = [];
<c:forEach var="obj" items="${tdrvClineCdList}">
    tdrvClineCdDs.push({text:"${obj.clineNm}", value:"${obj.clineSeq}", fileDocNo:"${obj.fileDocNo}" , fileNo:"${obj.fileNo}"});
</c:forEach>

//시승상세정보 - 시승출처
var tdrvPathCdDs = [];
<c:forEach var="obj" items="${tdrvPathCdList}">
    tdrvPathCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객만족도
$("#testDrive_custStsfCd").kendoExtDropDownList({
    dataSource:custStsfCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.check'/>"
    , index:0
});

// 판매전망
$("#testDrive_saleFcstCd").kendoExtDropDownList({
    dataSource:saleFcstCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.check'/>"
    , index:0
});


//상세페이지 보기 selectTestDriveMgmtMain.jsp  페이지 상세 기능 사용
//function contentDetail(dataItem) {
function contentDetail_testDriveArea(tdrvSeq) {
  $("#calendarArea").css("display","none");
  $("#testDriveArea").css("display","block");

  var param =   {
          "sTdrvSeq":tdrvSeq
  };
    //  var param = {"sTdrvSeq":dataItem.salesActiveNo};
      mob.loading.show();
      $.ajax({
          url:"<c:url value='/mob/crm/cso/testDrive/selectTestDriveResvByKey.do' />",
          data:JSON.stringify(param),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
            mob.loading.hide();
            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
          }

      }).done(function(body) {
          mob.loading.hide();
          //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
          //if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
          //    return false;
          //}

          $("span[name='tdrvTpCd']").each(function(){
              $(this).removeClass("on");
          });

          //시승 상세정보
          $("#testDrive_modelNm").val(body.modelNm);
          $("#testDrive_modelNm").prop("disable",true);

          $("#testDrive_tdrvSeq").val(body.tdrvSeq);
          $("#testDrive_tdrvStatCd").val(body.tdrvStatCd);
          $("#testDrive_custNm").val(body.custNm);
          $("#testDrive_custNm").prop("disable",true);
          $("#testDrive_custNo").val(body.custNo);
          $("#testDrive_hpNo").val(body.hpNo);
          $("#testDrive_hpNo").prop("disable",true);
          $("#testDrive_resvDt").val(body.resvDt);
          $("#testDrive_resvDt").prop("disable",true);
          $("#testDrive_tdrvHmCd").val(body.tdrvHmCd);        //시승시간

          $("#testDrive_tdrvVinNo").val(body.tdrvVinNo);
          $("#testDrive_tdrvClineCd").val(body.tdrvClineCd);      //시승노선
          $("#testDrive_tdrvPathCd").val(body.tdrvPathCd);        //시승출처
          //$("#testDrive_tdrvClineCd").val(body.tdrvClineCd);
          //$("#testDrive_tdrvPathCd").val(body.tdrvPathCd);
          $("#testDrive_scId").val(body.scId);
          $("#testDrive_scNm").val(body.scNm);
          $("#testDrive_tdrvTpCd_"+body.tdrvTpCd).addClass("on");
          //$("input:radio[id='tdrvTpCd_"+body.tdrvTpCd+"']").prop("checked", true);
          $("#testDrive_remark").val(body.remark);
          $("#testDrive_regDt").val(body.regDt);

          //시승일지
          //입력폼 초기화
          initFormTestDriveArea("rvlog");

          $("#testDrive_tdrvSeq").val(body.tdrvSeq);
          $("#testDrive_tdrvVinNo").val(body.tdrvVinNo);
          $("#testDrive_tdrvContractDocNo").val(body.tdrvContractDocNo);

          $("#testDrive_custStsfCd").data("kendoExtDropDownList").value(body.custStsfCd);
          $("#testDrive_saleFcstCd").data("kendoExtDropDownList").value(body.saleFcstCd);

          $("#testDrive_befRunDistVal").val(body.befRunDistVal);
          $("#testDrive_aftRunDistVal").val(body.aftRunDistVal);
          $("#testDrive_befRfuelQty").val(body.befRfuelQty);
          $("#testDrive_aftRfuelQty").val(body.aftRfuelQty);

          $("input:radio[id='testDrive_intPblmYn_"+body.intPblmYn+"']").prop("checked", true);
          $("input:radio[id='testDrive_extPblmYn_"+body.extPblmYn+"']").prop("checked", true);

          $("#testDrive_remark2").val(body.remark);

          //시승 상세정보 class변경(f_disabled 추가)
          $(".f_text>input, .f_item01>input, .f_item01>span, .form_comboBox").each(function(index, item){
              if(item.isDisabled){
                  item.parentNode.className += " f_disabled";
              }else{
                  item.parentNode.className.replace("f_disabled","");
              }
              });
      });
}

//버튼 - 영업활동상세 닫기
$("#btnSave_testDriveArea_close").kendoButton({
    click:function(e){
    $("#calendarArea").css("display","block");
    $("#testDriveArea").css("display","none");
    }
});



//버튼 - 시승일지 저장
$("#btnSave_testDriveArea").kendoButton({
    click:function(e){
        var befRunDistVal = $("#testDrive_befRunDistVal").val();
        var aftRunDistVal = $("#testDrive_aftRunDistVal").val();

        if ( aftRunDistVal <= befRunDistVal ) {
            // 주행거리 / 을(를) 확인하여 주세요.
            dms.notification.info("<spring:message code='global.lbl.runDist' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }

        var saveData = $("#visitCustomerArea").serializeObject(
                $("#tdrvMgmtInputForm").serializeArrayInSelector("[data-json-obj='true']")
                );

        //내/외장 이상유무
        if($("input:radio[name='intPblmYn']:checked").attr("id") == "intPblmYn_Y"){
            saveData.intPblmYn = "Y";
        }else {
            saveData.intPblmYn = "N";
        }
        if($("input:radio[name='extPblmYn']:checked").attr("id") == "extPblmYn_Y"){
            saveData.extPblmYn = "Y";
        }else{
            saveData.extPblmYn = "N";
        }

        var id = ""
        $("span[name='tdrvTpCd']").each(function(){
            if($(this).hasClass("on")){
                id = this.id;
            }
        });
        var tdrvTpCdVal = id.replace("tdrvTpCd_","");
        saveData.tdrvTpCd = tdrvTpCdVal;

        console.log("saveData:" + saveData);
        mob.loading.show();
        $.ajax({
            url:"<c:url value='/mob/crm/cso/testDrive/updateTestDriveMgmt.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                mob.loading.hide();
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },

            success:function(result) {
                mob.loading.hide();
                if (result === 1) {
                    // 저장 / 이 완료 되었습니다.
                    mob.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                    // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                    /* $("#tdrvMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                    isGridReload = true;
                    tdrvMgmtSeq = tdrvSeq; */

                    //contentList();

                } else {
                    // 저장 / 에 실패 하였습니다.
                    options.callbackFunc("FAIL");
                }

            }
        });


    }
});


//폼 초기화
function initFormTestDriveArea(val){

    //시승일지
    if(val){
        $("#testDrive_tdrvSeq").val("");
        $("#testDrive_tdrvVinNo").val("");
        $("#testDrive_tdrvContractDocNo").val("");
        $("#testDrive_custStsfCd").data("kendoExtDropDownList").value("");
        $("#testDrive_custStsfCd").data("kendoExtDropDownList").enable(true);
        $("#testDrive_saleFcstCd").data("kendoExtDropDownList").value("");
        $("#testDrive_saleFcstCd").data("kendoExtDropDownList").enable(true);

        $("#testDrive_befRunDistVal").val();
        $("#testDrive_befRunDistVal").prop("disable",true);
        $("#testDrive_aftRunDistVal").val();
        $("#testDrive_aftRunDistVal").prop("disable",true);
        $("#testDrive_befRfuelQty").val();
        $("#testDrive_befRfuelQty").prop("disable",true);
        $("#testDrive_aftRfuelQty").val();
        $("#testDrive_aftRfuelQty").prop("disable",true);
        $("input:radio").attr("disabled", false);
        $("#testDrive_intPblmYn_N").prop("checked", true);
        $("#testDrive_extPblmYn_N").prop("checked", true);
        $("#testDrive_remark").val("").attr("disabled", false).removeClass('form_readonly');


    }else{}
}

//시승 관리 스케줄[End]
//시승 관리 스케줄[End]
//시승 관리 스케줄[End]
//시승 관리 스케줄[End]
//시승 관리 스케줄[End]
//시승 관리 스케줄[End]
//시승 관리 스케줄[End]

//내방 스케줄[Start]
//내방 스케줄[Start]
//내방 스케줄[Start]
//내방 스케줄[Start]
//내방 스케줄[Start]
//내방 스케줄[Start]

// 상담 시간
var csltTmDs = [];
<c:forEach var="obj" items="${csltTmCdList}">
    csltTmDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

// 내방 출처
var vsitSrcCdDs = [];
<c:forEach var="obj" items="${vsitSrcCdList}">
    vsitSrcCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

// 내방출처 상세
var vsitSrcDetlContDs = [];
<c:forEach var="obj" items="${vsitSrcDetlContList}">
    vsitSrcDetlContDs.push({text:"${obj.makNm}", value:"${obj.makCd}"});
</c:forEach>

// 내방상태
var vsitStatCdDs = [];
<c:forEach var="obj" items="${vsitStatCdList}">
    vsitStatCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

// 상담시간
$("#visitCustomer_csltTmCd").kendoExtDropDownList({
    dataSource:csltTmDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.btn.select' />"
    , index:0
});

//내방출처
$("#visitCustomer_vsitSrcCd").kendoExtDropDownList({
    dataSource:vsitSrcCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.btn.select' />"
    , index:0
    , select:function(e) {

        var dataItem = this.dataItem(e.item);
        var vsitSrcDetlCont = $("#visitCustomer_vsitSrcDetlCont").data("kendoExtDropDownList");

        // 내방출처가 캠페인인경우 내방출처 상세 DS set
        if(dataItem.value == "01"){
            vsitSrcDetlCont.setDataSource(vsitSrcDetlContDs);
            vsitSrcDetlCont.enable(true);
        }else{
            vsitSrcDetlCont.setDataSource([]);
            vsitSrcDetlCont.enable(false);
        }

    }
});

// 내방출처 상세
$("#visitCustomer_vsitSrcDetlCont").kendoExtDropDownList({
    //dataSource:vsitSrcCdDs
      dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
    //, index:0
    , enable:false
});


// 내방상태
$("#visitCustomer_vsitStatCd").kendoExtDropDownList({
    dataSource:vsitStatCdDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
    , index:0
});

//상세페이지 보기
//selectVisitCustomerPopup.jsp 페이지 상세 기능 사용
function contentDetail_visitCustomerArea(vsitNo) {
    $("#calendarArea").css("display","none");
    $("#visitCustomerArea").css("display","block");

    if( vsitNo != null && vsitNo != 'undefined'){
        var param = {
                "sVsitNo":vsitNo
                };

        mob.loading.show();
        $.ajax({
                url:"<c:url value='/mob/crm/cso/salesActive/selectVisitCustomerMgmtByKey.do' />"
                ,data:JSON.stringify(param)      //파라미터
                ,type:'POST'                        //조회요청
                ,dataType:'json'                  //json 응답
                ,contentType:'application/json'   //문자열 파라미터
                ,error:function(jqXHR,status,error){
                    mob.loading.hide();
                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                }
        }).done(function(body) {
            mob.loading.hide();
            console.log(body);

            $("#visitCustomer_vsitNo").val(body.vsitNo);
            $("#visitCustomer_leadNo").val(body.leadNo);
            $("#visitCustomer_custNm").val(body.custNm);
            $("#visitCustomer_custNo").val(body.custNo);
            $("#visitCustomer_hpNo").val(body.hpNo);
            $("#visitCustomer_resvDt").val(chgDate2Str(body.resvDt));
            $("#visitCustomer_resvDtTime").val(chgDate2TimeStr(body.resvDt));  //예약시간 모바일에서 별도 표시


            $("#visitCustomer_csltTmCd").data("kendoExtDropDownList").value(body.csltTmCd);

            $("#visitCustomer_vsitSrcCd").data("kendoExtDropDownList").value(body.vsitSrcCd);
            var vsitSrcDetlCont = $("#visitCustomer_vsitSrcDetlCont").data("kendoExtDropDownList");
            // 내방출처가 캠페인인경우 내방출처 상세 정보 set

            if(body.vsitSrcCd == "01"){

                vsitSrcDetlCont.setDataSource(vsitSrcDetlContDs);

                    // 내방출처 상세.. 영업활동에서 팝업 오픈한경우는 readonly
                    if ( options.salesActiveYn === "Y"  ) {
                        vsitSrcDetlCont.enable(false);
                    } else {
                        vsitSrcDetlCont.enable(true);
                    }

                    vsitSrcDetlCont.value(body.vsitSrcDetlCont);
            }else{
                vsitSrcDetlCont.setDataSource([]);
                vsitSrcDetlCont.enable(false);
            }

            $("#visitCustomer_scId").val(body.scId);
            $("#visitCustomer_scNm").val(body.scNm);


            $("#visitCustomer_vsitStatCd").data("kendoExtDropDownList").value(body.vsitStatCd);
            $("#visitCustomer_regUsrId").val(body.regUsrNm);
            $("#visitCustomer_regDt").val(chgDate2Str(body.regDt));

            $("#visitCustomer_remark").val(body.remark);

            // 내방상태가 방문이면 팝업은 readonly
            if(body.vsitStatCd == "03"){
                readonlyForm_visitCustomer();
            }else{
                $("#btnSave_visitCustomerArea").data("kendoButton").enable(true);
                checkInputFormDisabled();
            }

        });
    }
}

//버튼 - 영업활동상세 닫기

$("#btnSave_visitCustomerArea_close").kendoButton({
    click:function(e){
    $("#calendarArea").css("display","block");
    $("#visitCustomerArea").css("display","none");
    }
});

//영업활동에서 팝업을 오픈한경우는 readonly
function readonlyForm_visitCustomer(){

    $("#visitCustomer_custNm").attr("readonly", true);
    //$("#visitCustomer_hpNo").data("kendoMaskedTextBox").readonly();
    //$("#visitCustomer_hpNo").addClass("form_readonly");
    $("#visitCustomer_hpNo").attr("readonly", true);
    //$("#visitCustomer_resvDt").data("kendoExtMaskedDateTimePicker").enable(false);
    $("#visitCustomer_resvDt").attr("disabled", true)
    $("#visitCustomer_resvDtTime").attr("disabled", true);

    $("#visitCustomer_csltTmCd").data("kendoExtDropDownList").enable(false);
    $("#visitCustomer_vsitSrcCd").data("kendoExtDropDownList").enable(false);
    $("#visitCustomer_vsitSrcDetlCont").data("kendoExtDropDownList").enable(false);
    $("#visitCustomer_vsitStatCd").data("kendoExtDropDownList").enable(false);

    $("#visitCustomer_remark").attr("disabled", true);
    $("#btnSave_visitCustomerArea").data("kendoButton").enable(false);
    checkInputFormDisabled();
}

//방문 예약 저장
$("#btnSave_visitCustomerArea").kendoButton({
    click:function(e){

        if (validator.validate()) {

            if( $("#visitCustomer_vsitSrcCd").val() === "01" ){
                if( dms.string.isEmpty($("#visitCustomer_vsitSrcDetlCont").val()) ){
                    // 내방출처 상세 / 을(를) 선택해주세요.
                    mob.notification.warning("<spring:message code='global.lbl.vsitSrcDetlCd' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                    return;
                }
            }

            if($("#visitCustomer_vsitStatCd").data("kendoExtDropDownList").value() === "03" ){
                // 내방상태를 방문으로 등록 할 수 없습니다.
                mob.notification.warning("<spring:message code='crm.err.visitStatNOTvisit' />");
                return;
            }

            if($("#visitCustomer_vsitNo").val() == 0 && $("#visitCustomer_vsitStatCd").data("kendoExtDropDownList").value() === "02" ){
                // 내방상태를 취소로 등록 할 수 없습니다.
                mob.notification.warning("<spring:message code='crm.err.visitStatNOTcancel' />");
                return;
            }

            var saveData =
                $("#visitCustomerMgmtForm").serializeObject(
                    $("#visitCustomerMgmtForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            // 스케쥴러에서는 name이 무조건 start/end. vo값으로 json 가공함. kendoExtMaskedDateTimePicker 에서는 YYYY-MM-DD HH:MM 으로 보여주고 전송시 :SS 붙임.
            //saveData.resvDt = $("#visitCustomer_resvDt").data("kendoExtMaskedDateTimePicker").value();
            saveData.resvDt = chgDateTimeStamp($("#visitCustomer_resvDt").val()+" "+$("#visitCustomer_resvDtTime").val());
            saveData.custNm = $("#visitCustomer_custNm").val();
            delete saveData.start;
            console.log("saveData:" + JSON.stringify(saveData));
            //return;
            mob.loading.show();
            $.ajax({
                //url:"<c:url value='/crm/cfw/visitCustomer/multiVisitCustomers.do' />",
                url:"<c:url value='/crm/cfw/visitCustomer/multiVisitCustomers.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    mob.loading.hide();
                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                },
                success:function(jqXHR, textStatus) {
                mob.loading.hide();
                    // TODO 등록 / 수정 / 취소 구분
                    options.callbackFunc("SUCCESS");
                    //parent.popupWindow.close();
                }
            });
        }

    }

});

//내방 스케줄[End]
//내방 스케줄[End]
//내방 스케줄[End]
//내방 스케줄[End]
//내방 스케줄[End]
//내방 스케줄[End]
//내방 스케줄[End]
</script>



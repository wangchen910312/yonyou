<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
    <section id="content">
    <!-- Barcode 목록  [Start] -->
    <!-- Barcode 목록  [Start] -->
    <!-- Barcode 목록  [Start] -->
        <!-- content_list -->
<!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="crm.title.vocProc" /><spring:message code="global.btn.searchCondition" /></h2>
            </div>
            <div class="formarea">
                <input type="hidden" id="sDrlCd" name="sDrlCd" />
                <input type="hidden" id="sPltCd" name="sPltCd" />
                <input type="hidden" id="sVocNo" name="sVocNo" />

                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                     <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.gubun" /><!-- 구분 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="gubun" name="gubun" class="form_combo" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinSts" /><!-- 구분 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sVinmStatus" name="sVinmStatus" class="form_combo" /></div>
                            </td>
                        </tr>
                        <%-- <tr>
                            <th scope="row"><spring:message code="global.lbl.vinSts" /><!-- 차량상태 --></th>
                            <td>
                                <input type="radio" id="sVinmStatus60" name="sVinmStatus" class="f_radio" value="50" checked /><label for="sVinmStatus60"><spring:message code="global.lbl.notReceive" /></label><!-- 미입고 -->
                                <input type="radio" id="sVinmStatus50" name="sVinmStatus" class="f_radio" value="60" /><label for="sVinmStatus50"><spring:message code="par.lbl.receive" /></label><!-- 입고 -->
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ordTp" /><!-- 오더유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sOrdTp" name="sOrdTp" class="form_combo" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sVinNo" name="sVinNo" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sCarlineCd" name="sCarlineCd" class="form_combo" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.modelNm" /><!-- 차관 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sModelCd" name="sModelCd" class="form_combo" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" id="orderRegNm"><spring:message code='global.lbl.orderRegDt' /><!-- 주문등록일--></th>
                            <td class="f_term">
                                <div class="f_item01" style="width:91%">
                                    <input type="search" id="sOrdDtS" style="width:140px" class=""  value="${toDay}" />
                                    <span class="date" onclick="calpicker('sOrdDtS')" ><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext" style="padding:0px; margin-top:10px;"> ∼</span>
                                <div class="f_item01" style = "width:91%">
                                    <input type="search" id="sOrdDtE" style="width:140px" class=""  value="${toDay}" />
                                    <span class="date" onclick="calpicker('sOrdDtE');"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12619" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <section id="content_list_1">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='global.lbl.barcodeList' /></h2>
                <div class="title_btn">
                    <dms:access viewId="VIEW-D-12618" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="tbtn01" id="selAll"><spring:message code='global.btn.toggleSelectAll' /></span><!-- 전체선택 -->
                    </dms:access>
                </div>
            </div>
            <div class="listarea">
                <div class="listhead checkitem bgNone">
                    <span style="width:40%;"><spring:message code='mob.lbl.barcode' /></span>
                    <span style="width:40%;"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
                    <span style="width:20%;"><spring:message code='global.title.result' /><!-- 결과 --></span>
                </div>
                <iframe id="mainList2" border="0" frameborder="0" width="100%" height=""></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
            <div class="btnfixed">
                <div class="con_btnarea btncount2">
                    <dms:access viewId="VIEW-D-12617" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1" id="btn_scan"><spring:message code='mob.lbl.scan' /></span></div><!-- 스캔 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12616" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1" id="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제--></span></div>
                    </dms:access>
                </div>
                <div class="con_btnarea">
                    <dms:access viewId="VIEW-D-12615" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span class="btnd1"><span class="search" id="btn_wearingSearch"><spring:message code='global.lbl.grForSearch' /><!-- 입고대상조회  --></span></span></div>
                    </dms:access>
                </div>
            </div>
        </section>
        <section id="content_list_2" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='global.lbl.selectCar' /><!-- 중복차량체크  --></h2>
            </div>
            <div id="duplConfirmWearingListArea"></div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12614" hasPermission="${dms:getPermissionMask('READ')}">
                    <span class="btnd1" id="btn_wearingDuplChk"><spring:message code='global.lbl.check' /><!-- 선택  --></span>
                </dms:access>
            </div>
        </section>
        <section id="content_list_3" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='global.lbl.grForList' /><!-- 입고대상목록  --></h2>
            </div>

            <div class="listarea">
                <div class="listhead checkitem">
                    <span style="width:60%;"><spring:message code='global.lbl.vinNum' /></span>
                    <span style="width:40%;"><spring:message code='mob.lbl.barcode' /><!-- 바코드 --></span>
                    <span style="width:60%;" class="clboth"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
                    <span style="width:40%;"><spring:message code='global.lbl.extColor' />/<spring:message code='global.lbl.intColor' /><!-- 외장색/내장색 --></span>
                    <span style="width:60%;" class="clboth"><spring:message code="global.lbl.model" /><!-- 모델 --></span>
                    <span style="width:40%;" ><spring:message code="global.label.evalInfoYn" /><!-- 물류평가여부 --></span>
                    <span style="width:100%;" class="clboth"><spring:message code="global.lbl.ocn" /><!-- OCN --></span>
                </div>
                <iframe id="confirmWearingList" border="0" frameborder="0" width="100%" height="300px"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData9"><span></span></div>
            </div>
            <!--
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnReceiveCnfrm"><spring:message code="par.btn.receiveCnfm" /></span></div>
                <div><span class="btnd1" id="btnReceiveCncl"><spring:message code="global.btn.receiveCncl" /></span></div>
            </div>
             -->
             <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12613" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="btnReceiveCnfrm"><spring:message code="par.btn.receiveCnfm" /></span></div><!-- 입고확정 -->
                </dms:access>
            </div>
        </section>
        <section id="content_list_4" style="display:none;">
            <%@include file="/WEB-INF/jsp/mob/sal/lom/evalSearchEdit/selectEvalSearchEditMain_Include.jsp" %>
        </section>

        <!-- 전체입고대상 목록  [Start] -->
        <!-- 전체입고대상 목록  [Start] -->
        <!-- 전체입고대상 목록  [Start] -->
        <section id="content_list_5" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='sal.title.confirmWearingVehicle' /><!-- 완성차 입고확정 --></h2>
            </div>
            <div class="listarea">
                <div class="listhead dlistitem">
                    <span style="width:50%;"><spring:message code='global.lbl.vinNum' /></span>
                    <span style="width:50%;"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
                    <span style="width:50%;" class="clboth"><spring:message code="global.lbl.model" /><!-- 모델 --></span>
                    <span style="width:50%;" ><spring:message code="global.lbl.ocn" /><!-- OCN --></span>
                    <span style="width:50%;" class="clboth"><spring:message code='global.lbl.extColor' />/<spring:message code='global.lbl.intColor' /><!-- 외장색/내장색 --></span>
                    <span style="width:50%;" ><spring:message code="sal.lbl.grDts" /><!-- 입고일자 --></span>
                </div>
                <iframe id="confirmWearingTotalList" border="0" frameborder="0" width="100%" height="350"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData5"><span></span></div>
            </div>
        </section>
        <!-- 전체입고대상 목록  [End] -->
        <!-- 전체입고대상 목록  [End] -->
        <!-- 전체입고대상 목록  [End] -->

        <!-- content_detail -->

        <section id="content_detail_2" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.lbl.grForList" /> <spring:message code="global.lbl.dtlInfo" /></h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody class="detialListData">
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.logisticsCmpn" /><!-- 물류회사 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="dstbCmpNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.licensePlt" /><!-- 번호판 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="carRegNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ordNo" /><!-- 주문번호 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="ordNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.vinNo" /><!-- VIN 번호 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="vinNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.yard" /><!-- 하치장 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="carDumpCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carlineCd" /><!-- 차종코드 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="carlineCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carlineNm" /><!-- 차종명 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="carlineNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.model" /><!-- 차관 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="modelNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ocnCode" /><!-- OCN코드 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="ocnCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="ocnNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.extColorCd" /><!-- 외장색 코드 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="extColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.extColorNm" /><!-- 외장색 명 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="extColorNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.intColorCd" /><!-- 내장색 코드 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="intColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.rfid" /><!-- RFID --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="rfidNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="ordTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.creDt" /><!-- 생산일자 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="manufactYyMmDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.corporationRealseDt" /><!-- 법인출고일일 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="asdy2" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.grDt" /><!-- 입고일 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="grDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.engnNo" /><!-- 엔진번호 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="enginNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vehicleWarrant" /><!-- 차량합격증 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="certNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.retlPrcUse" /><!-- 사용자금 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="usedAmtTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.bank" /><!-- 은행 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="bankNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.chrgCd" /><!-- 주문자 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="regNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.masdyDt" /><!-- 물류회사인도일자 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="asdy" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
            </div>
        </section>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var sysDate="${sysDate}";

var gubunList = [];
gubunList.push({cmmCdNm:"<spring:message code='mob.lbl.barcode' />", cmmCd:"1"});
gubunList.push({cmmCdNm:"<spring:message code='global.lbl.car' />", cmmCd:"2"});

var oneDay = "${oneDay}";
var toDay = "${toDay}";

var vinmStatusList = [];
var vinmStatusObj = {};
vinmStatusList.push({cmmCdNm:"<spring:message code='global.lbl.notReceive' />", cmmCd:"60"});
vinmStatusList.push({cmmCdNm:"<spring:message code='par.lbl.receive' />", cmmCd:"50"});
vinmStatusObj["60"] = "<spring:message code='global.lbl.notReceive' />";
vinmStatusObj["50"] = "<spring:message code='par.lbl.receive' />";
/************* 주문유형 SELECT BOX [SAL138]  *******************/
var ordTpList = [];
<c:forEach var="obj" items="${ordTpInfo}">
var cmmCdNm = "[" + "${obj.cmmCd}" + "]" + "${obj.cmmCdNm}";
ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":cmmCdNm, "useYn":"${obj.useYn}"});
</c:forEach>

var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});
/************* 주문유형 SELECT BOX  *******************/

//하치장 Array[SAL152]
var carDumpCdList = [];
<c:forEach var="obj" items="${carDumpCdInfo}">
carDumpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//하치장 Map
var carDumpCdArr = dms.data.arrayToMap(carDumpCdList, function(obj){ return obj.cmmCd; });

/************* 차량상태(입고확정상태) SELECT BOX [SAL001] *******************/
var carStatCdList = [];
<c:forEach var="obj" items="${carStatCdInfo}">
carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd});

//사용자금종류 Array[SAL152]
var usedAmtTypeList = [];
<c:forEach var="obj" items="${usedAmtTypeInfo}">
  usedAmtTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//하치장 Map
var usedAmtTypeObj = dms.data.arrayToMap(usedAmtTypeList, function(obj){ return obj.cmmCd; });

/**
* 차종 콤보
*/
var carLineCdList = [];
var carLineCdArr = [];
<c:forEach var="obj" items="${carLineCdInfo}">
 carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 carLineCdArr["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>
var modelCdList = [];
var modelCdArr;
var ocnCdList = [];

var carNameMap ={};
var carNameList = [];

var duplCheck = false;
var currentContent_list=1;
$(document).ready(function() {

    /* function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        //$(".skeyarea").hide();
    }

    initPage(); */

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.confirmWearingVehicle' />"); //완성차입고확정

    $("#header_title").on("click", function (){moveSearch2(currentContent_list);});
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    //$("#confirmWearingTotalList").attr("src", "<c:url value='/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleTotalList.do' />");
    $("#mainList2").attr("src", "<c:url value='/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleList.do' />");
    currentContent_list=1;
    var mainList2Height=$("#mwrap").height()-$("#header").height()-$(".content_title:eq(1)").height()-$("#content_list_1 .listhead").height()*3-$(".btnfixed").height();
    $("#mainList2").height(mainList2Height);
    var confirmWearingTotalListHeight=$("#mwrap").height()-$("#header").height()-$(".content_title:eq(1)").height()-$("#selAll").height()*8;
    $("#confirmWearingTotalList").height(confirmWearingTotalListHeight);
    $("#listarea_noData").height(confirmWearingTotalListHeight);


    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var custNm = $("#custNm").val();
            var custHp = $("#custHp").val();
            var custSourceTxt = $("#custSource").data("kendoExtDropDownList").text();
            var custSourceVal = $("#custSource").data("kendoExtDropDownList").value();

            document.getElementById("mainList2").contentWindow.addItemList(custNm, custHp, custSourceTxt, custSourceVal);
        }
    });

    // 버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#custNm").val("");
            $("#custHp").val("");
            $("#custSource").data("kendoExtDropDownList").value("");
        }
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list_1").css("display") == "block"||$("#content_list_5").css("display") == "block") {
            goMain();
        } else if ($("#content_list_2").css("display") == "block") {
            $("#content_list_2").hide();
            $("#content_list_1").show();
        } else if ($("#content_list_3").css("display") == "block") {
            if(duplCheck){//중복체크 여부
                $("#content_list_2").show();
            }else{
                $("#content_list_1").show();
            }
            $("#content_list_3").hide();
        } else if ($("#content_list_4").css("display") == "block") {
            $("#content_list_4").hide();
            $("#content_list_3").show();
        } else if ($("#content_search").css("display") == "block") {
            $("#content_search").css("display","none");
            $("#content_detail").css("display","none");
            $("#content_detail_2").css("display","none");
            $("#content_list_1").css("display","none");
            $("#content_list_2").css("display","none");
            $("#content_list_3").css("display","none");
            $("#content_list_5").css("display","none");
            $("#header_title span").attr("class","search_open");
            $("#content_list_"+currentContent_list).css("display","block");
        } else if ($("#content_detail_2").css("display") == "block") {
            $("#content_detail_2").hide();
            $("#content_list_5").show();
        }
    });

    //닫기 버튼
    $("#detailConfirmBtn").bind("click", function()
    {
        $("#content_detail_2").hide();
        $("#content_list_5").show();
    });

    $("#gubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:gubunList
        , index:0
        , change:function(){
            if($("#gubun").data("kendoExtDropDownList").value()=="1"){

                init();

            }else{
                $("#sVinmStatus").data("kendoExtDropDownList").enable(true);
                $("#sOrdTp").data("kendoExtDropDownList").enable(true);
                $("#sCarlineCd").data("kendoExtDropDownList").enable(true);
                $("#sVinNo").removeClass("f_disabled");
                $("#sVinNo" ).prop('readonly', false);
                $(".f_item01").removeClass("f_disabled");
            }
        }
    });

    $("#sVinmStatus").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vinmStatusList
        , index:0
        , change:function(e){
            if(e.sender.selectedIndex==0)
                $("#orderRegNm").html("<spring:message code='global.lbl.orderRegDt'/>");
            else
                $("#orderRegNm").html("<spring:message code='sal.lbl.grDts'/>");
        }
    });

    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:ordTpList
        , index:0
        , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
    });

    /**
     * 차종 콤보박스
     */
     $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
        ,select:function(e){
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(true);

            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sModelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/sti/confirmWearingVehicle/selectModel.do' />"
                ,data :JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async :false
            });
            $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

        }
     });

     /**
     * 모델 콤보박스
     */
     $("#sModelCd").kendoExtDropDownList({
         dataTextField:"modelNm"
        ,dataValueField:"modelCd"
        ,optionLabel:" "
     });
     $("#sModelCd").data("kendoExtDropDownList").enable(false);

     // 버튼 - 조회
     $("#btnSearch").kendoButton({
         click:function(e) {

             contentList();
         }
     });

    init();
});
function init(){
    /* $("#sAgingCntRange").data("kendoExtDropDownList").value("");
    $("#sConfirmYn").data("kendoExtDropDownList").value("");
    $("#sVinNo").val("");
    $("#sStockDt").val("");*/
    //$("input[name='sVinmStatus']").addClass("f_disabled");
    $("#sVinmStatus").data("kendoExtDropDownList").enable(false);
    $("#sOrdTp").data("kendoExtDropDownList").enable(false);
    $("#sCarlineCd").data("kendoExtDropDownList").enable(false);
    $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sModelCd").data("kendoExtDropDownList").enable(false);
    $("#sVinNo").addClass("f_disabled");
    $("#sVinNo" ).prop('readonly', true);
    $(".f_item01").addClass("f_disabled");
}
//검색페이지 보기
function contentSearch() {
    $("#content_list_1").css("display", "none");
    $("#content_list_2").css("display", "none");
    $("#content_list_3").css("display", "none");
    $("#content_list_4").css("display", "none");
    $("#content_list_5").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#content_detail_2").css("display", "none");
    $("#content_search").css("display", "block");
}
//상세페이지 보기
function contentDetail(obj) {
    $("#content_list_1").css("display", "none");
    $("#content_list_2").css("display", "none");
    $("#content_list_3").css("display", "none");
    $("#content_list_4").css("display", "none");
    $("#content_list_5").css("display", "none");
    $("#content_search").css("display", "none");
    $("#content_detail_2").css("display", "block");//$("#header_title span").removeAttr("class");

    setDetailData(obj.dataItem, ".detialListData input[id]");
}


function getItemListInit(initFl){
    //네이티브연동 불가시 임시 테스트
    //네이티브 연동테스트 사용
    //테스트 결과 네이티브에서는 return함수를 메인에서 사용함
    //적용시 수정 필요

    var userAgent = navigator.userAgent.toLowerCase();

     try{
         if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                 || (userAgent.search("ipad") > -1))
         {
             document.location='bhmccp://SELECT?TABLE_NM=Vehicle_Settlement&return_func=setItemList';
         }else
         {
             window.bhmccp.SELECT('Vehicle_Settlement','','setItemList');
         }
      }catch(e){
               var resultList;

              if(initFl) {
                  resultList = "{\"data\":[{\"VEHICLE_CD\":\"80329190\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"},"
                                           +"{\"VEHICLE_CD\":\"80329188\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"},"
                                           +"{\"VEHICLE_CD\":\"11751891\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"},"
                                           +"{\"VEHICLE_CD\":\"97086414\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"}]}";
              } else { //저장후 reload
                  resultList = "{\"data\":[{\"VEHICLE_CD\":\"96194394\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"1\"},"
                      +"{\"VEHICLE_CD\":\"96195177\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"1\"},"
                      +"{\"VEHICLE_CD\":\"96201528\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"1\"}]}";
              }


              setItemList(resultList); //데이터 취득 그리드 생성후 데이터 조회를 위하여 timeout 설정
      }
}


function setItemList(param){

    carNameMap ={};
    carNameList = [];
    var _result = JSON.parse(param);

    /* for(var n=0; n<_result.data.length; n++){
        _result.data[n]["ret"] = "1"; //1:노말 2:입고확정성공 9:입고확정실패
    } */

    var rowCount = _result.data.length;

    if(rowCount > 0){
        $.each(_result.data , function(i , row){

            /* var barcodeListForName      = [];
            barcodeListForName.push(row.VEHICLE_CD);
            var searchData = {barcodeList:barcodeListForName}; */
            $.ajax({
                url:"<c:url value='/sal/sti/confirmWearingVehicle/getCarNameByBarcode.do' />"
                ,data:JSON.stringify(row.VEHICLE_CD)
                //,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    //parent.mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    //parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                    //app.hideLoading();
                }
                ,success:function(result) {
                    if(result.data.length > 0){
                        carNameList.push({carlineNm:result.data[0].carlineNm, barcodeNo:row.VEHICLE_CD});
                        carNameMap[row.VEHICLE_CD] = result.data[0].carlineNm;
                    }else{//차량이름에 없는 바코드
                        carNameList.push({carlineNm:"", barcodeNo:row.VEHICLE_CD});
                        carNameMap[row.VEHICLE_CD] = "";
                    }

                    rowCount --;
                    if(rowCount == 0) document.getElementById("mainList2").contentWindow.getItemList(param);
                }
            });

        });
    }
}

/* function setItemList(param){
    document.getElementById("mainList").contentWindow.getItemList(param);
} */

</script>

<script>
//메인화면 가기
var isSelAll=false;

function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
    $("#content_search").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#content_detail_2").css("display", "none");
    $("#content_list_1").css("display", "none");
    $("#content_list_2").css("display", "none");
    $("#content_list_3").css("display", "none");
    $("#content_list_4").css("display", "none");
    $("#content_list_5").css("display", "none");

    if($("#gubun").data("kendoExtDropDownList").value()=="1"){
        $("#content_list_1").css("display","block");
        $("#header_title span").attr("class","search_open");
        document.getElementById("mainList2").contentWindow.document.location.reload();
    }else{
        $("#content_list_5").css("display","block");
        $("#header_title span").attr("class","search_open");
        $("#confirmWearingTotalList").attr("src", "<c:url value='/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleTotalList.do' />");
    }

}

//버튼 - 전체선택
$("#selAll").bind("click", function()
{
    if(isSelAll){
        $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
            $("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked = false;
        });
        isSelAll=false;
    }else{
        $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
            $("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked = true;
        });
        isSelAll=true;
    }


});


//입고대상조회
var selList      = [];

$("#btn_wearingSearch").bind("click", function()
{
    var listCnt = 0;
    var checkFlag = true;
    selList=[];
    $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
        if($("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked == true){
            selList.push($("#mainList2").contents().find("input[name='barcodeNo']")[cnt].value);
            listCnt ++;
        }
    });
    var searchData = {barcodeList:selList};
    var resultDataList = [];
    if(listCnt == 0){
        mob.notification.info("<spring:message code='global.info.unselected' />");
    //체크건수가 존재하는경우
    } else {
        var data = [];
        var rowIndex = 0;
        var duplRowNum = [];
        mob.loading.show();
        $.ajax({
            url:"<c:url value='/sal/sti/confirmWearingVehicle/retVehicleInfo.do' />"
            ,data:JSON.stringify(searchData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.loading.hide();
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result) {
                mob.loading.hide();
                if(result.data!=null){
                    rowTotal = result.data.length;

                    var prevBarcodeNo = "";

                    $.each(result.data , function(i , row){

                        resultDataList.push({rowIdx:rowIndex,
                            dstbCmpNm   :row.dstbCmpNm,
                            carRegNo    :row.carRegNo,
                            ordNo       :row.ordNo,
                            vinNo       :row.vinNo,
                            carDumpCd   :row.carDumpCd,
                            carlineCd   :row.carlineCd,
                            carlineNm   :row.carlineNm,
                            modelCd     :row.modelCd,
                            modelNm     :row.modelNm,
                            ocnCd       :row.ocnCd,
                            ocnNm       :row.ocnNm,
                            extColorCd  :row.extColorCd,
                            extColorNm  :row.extColorNm,
                            intColorCd  :row.intColorCd,
                            intColorNm  :row.intColorNm,
                            ordTp       :row.ordTp,
                            manufactYyMmDt:row.manufactYyMmDt,
                            asdy        :row.asdy,
                            vinNo1      :row.vinNo1,
                            vinNo2      :row.vinNo2,
                            carId       :row.carId,
                            prty        :row.prty,
                            grDt        :row.grDt,
                            enginNo     :row.enginNo,
                            certNo      :row.certNo,
                            chrgCd      :row.chrgCd,
                            updtUsrId   :row.updtUsrId,
                            updtUsrNm   :row.updtUsrNm,
                            carStatCd   :row.carStatCd,
                            chgCarStatCd:row.chgCarStatCd,
                            evalYn:row.evalYn,
                            barcodeNo   :row.barcodeNo
                         });
                         rowIndex++;
                        if(row.barcodeNo == prevBarcodeNo) {
                            duplCheck = true;
                            duplRowNum.push(i-1); //이전데이터 중복항목추가
                            duplRowNum.push(i);   //현데이터 중복항목추가
                        }
                        prevBarcodeNo = row.barcodeNo;
                    });
                    duplRowNum.removeDup();//중복데이터 row에 데이터 정리

                    if(duplCheck){ //중복데이터 존재
                        drawConfirmWearingVehicleDupl(resultDataList,duplRowNum);
                    } else { //중복데이터 미존재
                        drawConfirmWearingVehicle(resultDataList,[]);
                    }
                } // if(result.data!=null){
            }// success:function(result) {
        });
        listCnt = 0;
    }//if(listCnt >0){
});

$("#btn_delete").bind("click", function()
{
    var checkFlag = true;
    selList=[];

    $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
        if($("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked == true){
            selList.push($("#mainList2").contents().find("input[name='barcodeNo']")[cnt].value);
        }
    });

    if(selList.length == 0){
        mob.notification.info("<spring:message code='global.info.unselected' />");

    } else {//체크건수가 존재하는경우
        var _sqlHost="";
        for(var i=0; i<selList.length; i++){
            if(i==0){
                _sqlHost+=selList[i];
            }else{
                _sqlHost+=","+selList[i];
            }
        }

        try{
            var userAgent = navigator.userAgent.toLowerCase();
            if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
            {
                document.location="bhmccp://DELETE_IN?TABLE_NM=Vehicle_Settlement&WHERE=VEHICLE_CD&IN="+_sqlHost+"&return_func=isDeleted";
            }else
            {
                window.bhmccp.DELETE_IN("Vehicle_Settlement","VEHICLE_CD",_sqlHost,"isDeleted");
            }
        }catch(e){

        }finally{
            //$("#docu_prev").click();
        }


      document.getElementById("mainList2").contentWindow.document.location.reload();

      //오프라인 바코드 데이타 삭제
    }
});
$("#btn_scan").bind("click", function()
{
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location="bhmccp://openBarcodeReader?type=settlement&isOnline=Y&return_func=resultOpenBarcode";
        }else
        {
            window.bhmccp.openBarcodeReader("settlement","Y","resultOpenBarcode");
        }
    }catch(e){

    }finally{
        //$("#docu_prev").click();
    }
});

function resultOpenBarcode(retval){
    if(retval == "Y"){
        //getItemListInit(false);
    document.getElementById("mainList2").contentWindow.document.location.reload();
    }else{
        mob.notification.error("<spring:message code='mob.lbl.scan' /><spring:message code='global.btn.failed' />");
    }
}
function rowDuplChk(duplLowArr,i){
    for(var j = 0 ; j < duplLowArr.length;j++){
        if(i == duplLowArr[j]){
            return true;
            break;
        }
    }
    return false;
}
var resultDataListAll;
function drawConfirmWearingVehicleDupl(resultDataList,duplLowArr){
    var txt = '';
    var prevBarcodeNo = '';
    var firstChk = false;
    resultDataListAll = resultDataList;
    $.each(resultDataList , function(i , row){
        if(rowDuplChk(duplLowArr,i)){ //현재 row가 중복데이터 여부 확인
            if(prevBarcodeNo != row.barcodeNo) {
                //첫번째루프가 아니면 이전 화면 에서 오는 바코드 데이터가 틀린경우 이전목록div(listarea01과 영역 분리
                if(firstChk){
                    txt +='</div>';  //
                    txt +='<div class="pb10"></div>';
                } else {
                    firstChk = true;
                }
                txt +='<div class="listarea01">';
                txt +='  <div class="dlistitem listhead">';
                txt +='      <span><spring:message code='mob.lbl.barcode' />:'+row.barcodeNo+'</span>';
                txt +='  </div>';

            }
            txt +='  <div class="checkitem bgNone">';
            txt +='      <span class="check">';
            txt +='       <input type="checkbox" id="check_'+i+'" name="check_dupl_'+row.barcodeNo+'" class="f_check" onclick="checkBoxClickDupl(this);"/><label for="check_'+i+'"></label>';
            txt +='       <input type="hidden" name="hidden_dupl_row" value="'+row.rowIdx+'"/>';
            txt +='      </span>';
            txt +='      <span style="">'+row.vinNo+'</span>';
            txt +='      <span class="clboth" style="width:60%;">'+row.carlineNm+'</span>';
            txt +='      <span style="width:40%;">'+row.extColorNm+'/'+row.intColorNm+'</span>';
            txt +='      <span class="clboth">'+row.modelNm+'</span>';
            txt +='      <span class="clboth">'+row.ocnNm+'</span>';
            txt +='  </div>';
            prevBarcodeNo = row.barcodeNo;
        }

    });

    txt +='</div>'; // 마지막 div(listarea01) 닫기
    $("#duplConfirmWearingListArea").html(txt);
    $("#content_list_2").show();
    $("#content_list_1").hide();
}

//입고대상 목록 표시
var resultDataListForSub = [] ;
var duplDelArrForSub  = [] ;
var lastWearingData = [];
function drawConfirmWearingVehicle(resultDataList,duplDelArr){
    resultDataListForSub = resultDataList;
    duplDelArrForSub = duplDelArr;
    $("#confirmWearingList").attr("src", "<c:url value='/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleSelList.do' />");

    //document.getElementById("confirmWearingList").contentWindow.getItemList(resultDataList,duplDelArr);
    $("#content_list_3").show();
    $("#content_list_2").hide();
    $("#content_list_1").hide();
}


//중복차량 체크 선택
$("#btn_wearingDuplChk").bind("click", function(){
    var duplDelArr = [];

    $(":checkbox[name ^='check_dupl_']").each(function(index){
         if($("input[name ^='check_dupl_']")[index].checked == false){
             duplDelArr.push($("input[name='hidden_dupl_row']")[index].value);
         }
    });
    drawConfirmWearingVehicle(resultDataListAll,duplDelArr);
});
//입고취소
$("#btnReceiveCncl").kendoButton({
    click:function(e) {
        save(null, "50", "C");

    }
});

$("#btnReceiveCnfrm").bind("click", function(){

    var confirmWearingArr = [];

    confirmWearingArr = document.getElementById("confirmWearingList").contentWindow.getConfirmWearingArr();

    var row = {};
    var strVinNo = "";
    var strCarStatCd = "";

    //입고 확정 대상 데이터로 입고 확정 처리함
    if(confirmWearingArr.length > 1){
        //selectConfirmWearingPopupWindow(strVinNo);
        drawUpdateEvalList(confirmWearingArr);
        showContetList4();
        $("#content_list_3").hide();
    } else if( confirmWearingArr.length == 1){
        row = confirmWearingArr[0];
        strVinNo = row.vinNo;
        strCarStatCd = row.carStatCd;

        /* if( strCarStatCd == "50" ){
            // 입고확정 처리를 하시겠습니까?
            if( !confirm("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.cnfrmMessage' arguments='${confirm},' />")){
                return;
            }
            save(null, "60", "D",confirmWearingArr);
        } else {
            //selectConfirmWearingPopupWindow(strVinNo);
            drawUpdateEvalList(confirmWearingArr);
            showContetList4();
            $("#content_list_3").hide();
        } */

        drawUpdateEvalList(confirmWearingArr);
        showContetList4();
        $("#content_list_3").hide();
    }

});


// ToDo 저장데이터 확인
// dlrEvalDt, carId 저장데이터 없음
// carId ==> 입고확정.:딜러입고정보수신 프로시저 (procDlrArrival), 입고확정.:딜러인수보고수신 프로시져 (procDlrArrival2)
// dlrEvalDt ==> 입고확정.:딜러평가결과수신 프로시져(procDlrEvalResult)

var _sqlHostFromSave="";
var totalOneArrayResultCount=0;
var nativeDeleteArray=[];
var nativeUpdateArray=[];
save = function(cnfrmInfo, carStatCd, prty) {
    //var saveData;
    var saveFlag = true;

    var arrSave = [];
    var confirmWearingArr = document.getElementById("confirmWearingList").contentWindow.getConfirmWearingArr();
    if(confirmWearingArr.length  == 0 ){
        //차량을 선택해주세요.
        mob.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
        return false;
    }else{
        $.each(confirmWearingArr , function(index , dataItem){
            arrSave.push(dataItem);
        });
    }

    if( saveFlag ){

        mob.loading.show();
        totalOneArrayResultCount=arrSave.length;

        $.each(arrSave , function(i , row){

            var saveData = {};
            var oneArrSave=[];
            oneArrSave.push(arrSave[i]);
            if( cnfrmInfo != null ){
                saveData = { "carStatCd":carStatCd
                            ,"prty":prty
                            ,"updateList":oneArrSave
                            ,"popupVO":cnfrmInfo};
            }else{
                saveData = { "carStatCd":carStatCd
                            ,"prty":prty
                            ,"updateList":oneArrSave};
            }

            $.ajax({
                url:"<c:url value='/sal/sti/confirmWearingVehicle/updateConfirmWearingVehicle.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                async:false,
                error:function(jqXHR,status,error){
                    mob.loading.hide();

                    /* var wheres={"VEHICLE_CD":arrSave[i].barcodeNo};
                    var wheresJSON=JSON.stringify(wheres);
                    var fields={"RET":"9"};
                    var fieldsJSON=JSON.stringify(fields); */
                    nativeUpdateArray.push(arrSave[i].barcodeNo);
                },
                success:function(jqXHR, textStatus){
                    mob.loading.hide();

                    /* var wheres={"VEHICLE_CD":arrSave[i].barcodeNo};
                    var wheresJSON=JSON.stringify(wheres); */
                    nativeDeleteArray.push(arrSave[i].barcodeNo);
                }
            }).always(function (){
                totalOneArrayResultCount--;
                if(totalOneArrayResultCount==0){
                    resultOneArray();
                }
            });

        });

    }
}
function resultOneArray(){

    console.log(nativeDeleteArray);
    console.log(nativeUpdateArray);


    if(nativeDeleteArray.length>0){
        _sqlHostFromSave=[];
        for(var i=0; i<nativeDeleteArray.length; i++){
            if(i==0){
                _sqlHostFromSave+=nativeDeleteArray[i];
            }else{
                _sqlHostFromSave+=","+nativeDeleteArray[i];
            }
        }
        try{
            var userAgent = navigator.userAgent.toLowerCase();
            if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
            {
                document.location="bhmccp://DELETE_IN?TABLE_NM=Vehicle_Settlement&WHERE=VEHICLE_CD&IN="+_sqlHostFromSave+"&return_func=isDeletedFromSave";
            }else
            {
                window.bhmccp.DELETE_IN("Vehicle_Settlement","VEHICLE_CD",_sqlHostFromSave,"isDeletedFromSave");
            }
        }catch(e){
            isDeletedFromSave("");
        }finally{

        }
    }else{
        _sqlHostFromSave=[];
        for(var i=0; i<nativeUpdateArray.length; i++){
            if(i==0){
                _sqlHostFromSave+=nativeUpdateArray[i];
            }else{
                _sqlHostFromSave+=","+nativeUpdateArray[i];
            }
        }
        try{
            var userAgent = navigator.userAgent.toLowerCase();
            if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
            {
                document.location="bhmccp://UPDATE_IN?TABLE_NM=Vehicle_Settlement&WHERE=VEHICLE_CD&IN="+_sqlHostFromSave+"&FIELD=RET&VALUE=9&return_func=isUpdateFromSave";
            }else
            {
                window.bhmccp.UPDATE_IN("Vehicle_Settlement","VEHICLE_CD",_sqlHostFromSave,"RET","9","isUpdateFromSave");
            }
        }catch(e){

        }finally{
        }
    }
}
function isDeletedFromSave(obj){
    _sqlHostFromSave=[];
    for(var i=0; i<nativeUpdateArray.length; i++){
        if(i==0){
            _sqlHostFromSave+=nativeUpdateArray[i];
        }else{
            _sqlHostFromSave+=","+nativeUpdateArray[i];
        }
    }
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location="bhmccp://UPDATE_IN?TABLE_NM=Vehicle_Settlement&WHERE=VEHICLE_CD&IN="+_sqlHostFromSave+"&FIELD=RET&VALUE=9&return_func=isUpdateFromSave";
        }else
        {
            window.bhmccp.UPDATE_IN("Vehicle_Settlement","VEHICLE_CD",_sqlHostFromSave,"RET","9","isUpdateFromSave");
        }
    }catch(e){
        isUpdateFromSave("");
    }finally{
    }

}
function isUpdateFromSave(obj){
    _sqlHostFromSave=[];
    mob.notification.success("<spring:message code='global.info.success'/>");
    window.open("<c:url value='/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleMain.do'/>", "_self");
    //document.getElementById("mainList2").contentWindow.document.location.reload();
}
function isDeleted(obj){
    console.log("isDeleted : "+obj);
}
function showContetList4(){
    $("#content_list_4").show();
    makingEvalEditReset(); //데이터 초기화

    makingUpdateEvalList(); //입고확정데이터 담기


}

function makingUpdateEvalList(){
    var saveList = [];
    // 입고확정 대상 데이터 arr로 담기
    $(":checkbox[name ^='hidden_confirm_vinNo']").each(function(index){
        if($("input[name ^='hidden_confirm_vinNo']")[index].checked == true){
            obj = {};
            obj["vinNo"] = $("input[name='hidden_confirm_vinNo']")[index].value;
            saveList.push(obj);
         }
    });

    saveList.forEach(function(saveData){
        textUpdateEvalList = "";
        textUpdateEvalList = textUpdateEvalList+'<li>';
        textUpdateEvalList = textUpdateEvalList+'    <div class="dlistitem bgNone">';
        textUpdateEvalList = textUpdateEvalList+'        <span class="">'+saveData.vinNo+'</span>';
        textUpdateEvalList = textUpdateEvalList+'    </div>';
        textUpdateEvalList = textUpdateEvalList+'</li>';

        $("#updateEvalList").append(textUpdateEvalList);
    });
}


//중복차량 체크 단건 선택
function checkBoxClickDupl(obj){
    $(":checkbox[name = '"+obj.name+"']").each(function(index){
        if(this.id != obj.id)
        this.checked = false;
    });
}


//배열 중복 제거
Array.prototype.valueIndex = function(pval){
    var idx = -1;
    if(this == null || this == undefined || pval == null ||pval == undefined){
    } else {
        for(var i = 0 ; i < this.length;i++){
            if(this[i] == pval){
                idx = i;
                break;
            }
        }
    }
    return idx;
}

Array.prototype.removeDup = function(){
    var resultArray =[];
    if(this == null || this == undefined){
    }else{
        for(var i = 0 ; i < this.length;i++){
            var el = this[i];
            if(resultArray.valueIndex(el) == -1)
                resultArray.push(el);
        }
    }
    return resultArray;
 }
</script>
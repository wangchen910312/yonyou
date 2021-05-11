<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->

<c:set value="01" var="membershipStan" /> <!-- 고객 -->
<%-- <c:set value="02" var="membershipStan" /> --%> <!-- 자동차 -->


<section class="group">
    <div class="header_area">
    <h1 class="title_basic"> <spring:message code="crm.menu.membershipMng"/> </h1><!-- 멤버십 관리 -->
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="specialPoint"><spring:message code="global.btn.specialPointReq" /></button>  <!-- 특별 포인트 신청 -->
            <button type="button" class="btn_m btn_save" id="btnTransferMembership"><spring:message code="global.btn.applicationForTransfer" /></button>  <!-- 양도신청 -->
            <button type="button" class="btn_m btn_add" id="btnInit"><spring:message code="global.btn.init" /></button>  <!-- 초기화 -->
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>  <!-- 저장 -->
        </div>
    </div>

    <!-- 조회조건 영역 시작 -->
    <div  class="table_form form_width_75per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm'/></span></th><!-- 고객명 -->
                    <td class="required_area">
                        <div class="form_search">
                            <input id="sCustNm" disabled="disabled" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" /><!-- // 고객조회 -->
                            <a href="javascript:;"  id="sCustSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                            <input type="hidden" id="sCustNo" name="sCustNo" >
                            <!-- <input type="text" id="sCustNm" name="sCustNm" class="form_input" style="width:60%"  readonly /> -->
                        </div>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.vinNo'/></span></th><!-- vinNo -->
                    <td>
                        <input type="text" id="sVinNo" name="sVinNo" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.regDt" /></th> <!-- 등록일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartDt" name="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회조건 영역 종료 -->

    <div id="membershipForm" name="membershipForm" onsubmit="return false;">
        <!-- 멤버십가입 목록 그리드 시작 -->
        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->
        <div class="table_grid">
            <div id="membershipGrid"></div>
        </div>
        <!-- 멤버십가입 목록 그리드 종료 -->


        <div class="header_area">
            <h2 class="title_basic"> <spring:message code="global.title.membershipInfo" /> </h2><!-- 멤버십 정보 -->
        </div>
        <div class="table_form form_width_70per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm'/> </span></th> <!-- 고객명 -->
                        <td class="required_area">
                            <input type="hidden" id="stan" name="stan" value="${membershipStan}"/>
                            <div class="form_search">
                                <input id="custNm" class="form_input" disabled="disabled" placeholder="<spring:message code='global.lbl.custSearch' />" /><!-- // 고객조회 -->
                                <a href="javascript:;" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                <input type="hidden" id="custNo" name="custNo" data-json-obj="true" >
                                <input type="hidden" id="fileDocNo" name="fileDocNo"  data-json-obj="true"/>
                                <input type="hidden" id="befGradeCd" name="befGradeCd"  data-json-obj="true"/>
                                <!-- <input type="text" id="sCustNm" name="sCustNm" class="form_input" style="width:60%"  readonly /> -->
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.membershipNo'/></th> <!-- 멤버십번호 -->
                        <td>
                            <input type="text" id="membershipNo" name="membershipNo" class="form_input form_readonly" style="width:100%" readOnly />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 -->
                        <td>
                            <input id="custTp" name="custTp" class="form_comboBox form_readonly" style="width:100%" readOnly />
                        </td>
                        <%-- <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                        <td>
                            <input id="custCd" name="custCd" class="form_comboBox form_readonly" style="width:100%" readOnly />
                        </td> --%>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.hpNo" /></th> <!-- 휴대전화 -->
                        <td>
                            <input id="hpNo" name="hpNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                        <td>
                            <input id="telNo" name="telNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.prefCommMthCd" /></th> <!-- 선호연락방법 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <input id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox form_readonly" readOnly />
                                </div>
                                <div class="form_right">
                                    <input id="prefCommNo" name="prefCommNo" value="" readonly="readonly" class="form_input form_readonly" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                        <td>
                            <input id="emailNm" name="emailNm" readonly="readonly" class="form_input form_readonly" >
                        </td>
                        <th scope="row"><spring:message code="global.lbl.addr" /></th> <!-- 주소 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" >
                                    <input id="addr1" name="addr1" value="" readonly="readonly" class="form_input form_readonly">
                                </div>
                                <div class="form_right">
                                    <input id="addr2" name="addr2" value="" readonly="readonly" class="form_input form_readonly">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                        <td>
                            <input id="mathDocTp" name="mathDocTp" class="form_select" style="width:100%" readonly="readonly" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                        <td>
                            <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input form_readonly" readonly="readonly" />
                        </td>
                        <th scope="row"><%-- <spring:message code=''/> --%>  </th> <!--  -->
                        <td>
                        </td>
                    </tr>
                    <c:if test="${membershipStan eq 02}">
                        <tr>
                            <th scope="row"> <span class="bu_required"><spring:message code='global.lbl.vinNo'/></span></th> <!-- VIN번호 -->
                            <td class="required_area">
                                <input id="vinNo" name="vinNo" class="form_comboBox form_readonly" style="width:100%" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carNo" /> </th> <!-- 차량번호 -->
                            <td>
                                <input type="text" id="carRegNo" name="carRegNo" value="" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carlineNm" />/<spring:message code="global.lbl.modelNm" /></th> <!-- 차종명/모델명 -->
                            <td>
                                <input type="text" id="modelNm" name="modelNm" value="" class="form_input" />
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.gradeCd'/> </th> <!-- 등급  -->
                        <td>
                            <!-- <input type="text" value="" id="gradeNm" name="gradeNm" class="form_input" />
                            <input type="hidden" value="02" id="gradeCd" name="gradeCd" class="form_input" data-json-obj="true"/> -->
                            <input id="gradeCd" name="gradeCd" class="form_comboBox" data-json-obj='true'/>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.pointCardNo'/> </th> <!-- 포인트 카드번호 -->
                        <!-- <td>
                            <input type="text" value="" id="cardNo" name="cardNo" class="form_input" data-json-obj="true"/>
                        </td> -->
                        <td class="required_area">
                            <div class="form_search">
                                <input id="cardNo" name="cardNo" class="form_input" readonly="readonly" placeholder="<spring:message code='crm.title.porintCardSearch'/>" data-json-obj="true" /><!-- // 포인트카드 조회 -->
                                <a href="javascript:;" id="pointCardSearch"><spring:message code="crm.title.porintCardSearch"/><!-- 포인트카드 조회 --></a>
                                <input type="hidden" id="cardTpCd" name="cardTpCd" data-json-obj="true" >
                                <!-- <input type="text" id="sCustNm" name="sCustNm" class="form_input" style="width:60%"  readonly /> -->
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.savePoint'/>(<spring:message code='global.lbl.avlbStock'/>)</th> <!-- 적립 포인트(가용) -->
                        <td>
                            <input value="" id="lastPointVal" name="lastPointVal" class="form_numeric ar form_readonly" readonly="readonly" pattern="\d" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
            <div class="btn_right">
                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
            </div>
        </div>

        <div class="table_grid">
            <div id="fileGrid">
            </div>
        </div>
        <%-- <div class="clfix">
            <section class="left_areaStyle">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
                    <div class="btn_right">
                        <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                        <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                    </div>
                </div>

                <div class="table_grid">
                    <div id="fileGrid">
                    </div>
                </div>
            </section>

            <section class="right_areaStyle">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.lbl.membershipProgram" /></h2> <!-- 멤버십 프로그램 -->
                </div>
                <div class="table_form form_width_50per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:20%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <label class="label_check"><input type="checkbox" value="" id="rechargeYn" name="rechargeYn" value="" class="form_check"> <spring:message code='global.lbl.rechargeYn' /></label> <!-- 충전식 -->
                                </td>
                                <td>
                                    <label class="label_check"><input type="checkbox" value="" id="pointYn" name="pointYn" value="" class="form_check"> <spring:message code='global.lbl.pointYn' /></label> <!-- 포인트식 -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div> --%>
        <!-- //가입신청서, 멤버십 프로그램 -->
    </div>

    <div class="header_area">
    <h2 class="title_basic"> <spring:message code="global.title.rechargeCardList"/></h2><!-- 충전카드목록 -->
        <div class="btn_right">
            <button type="button" class="btn_s" id="btnRchg"><spring:message code="crm.btn.rchg" /></button><!-- 충전 -->
            <button type="button" class="btn_s" id="btnRchgReg"><spring:message code="crm.btn.rchgCardReg" /></button><!-- 충전카드등록 -->
        </div>
    </div>

    <!-- 충전카드 목록 그리드 시작 -->
    <div class="table_grid">
        <div id="cardListGrid"></div>
    </div>
    <!-- 충전카드 목록 그리드 종료 -->

    <div class="header_area">
    <h2 class="title_basic"> <spring:message code="crm.title.packageCouponList"/></h2><!-- 패키지 쿠폰 목록 -->
        <div class="btn_right">
            <button type="button" class="btn_s" id="btnPackageCouponAdd"><spring:message code="crm.title.packageCouponReg" /></button><!-- 패키지 쿠폰등록 -->
        </div>
    </div>

    <!-- 패키지 쿠폰 목록 그리드 시작 -->
    <div class="table_grid">
        <div id="packageCouponHisGrid"></div>
    </div>
    <!-- 패키지 쿠폰 목록 그리드 종료 -->

    <!-- // 탭 시작 -->
    <div id="tabstrip" class="tab_area">
        <ul>
            <li id ="tabPoint" class="k-state-active"><spring:message code="global.lbl.pointHistory" /><!-- 포인트 이력 --></li>
            <li id ="tabCardList"><spring:message code="global.lbl.rechargeCardHistory" /><!-- 충전카드 이력 --></li>
            <li id ="tabGrade"><spring:message code="global.lbl.gradeHistory" /><!-- 등급변경 이력 --></li>
        </ul>
        <!-- 포인트 이력 탭 영역 -->
        <div>
            <div class="btn_right_absolute"></div>
            <div class="table_grid">
                <!-- 포인트 그리드 -->
                <div id="tabPointHisGrid" ></div>
                <!-- 포인트 그리드 -->
            </div>

        </div>

        <!--충전 카드 이력 탭 영역 -->
        <div>
            <div class="btn_right_absolute"></div>
            <div class="table_grid">
                <!-- 충전 카드 이력 그리드 -->
                <div id="tabCardListGrid" ></div>
                <!-- 충전 카드 이력 그리드 -->
            </div>
        </div>

        <!--등급변경 이력 탭 영역 -->
        <div>
            <div class="btn_right_absolute"></div>
            <div class="table_grid">
                <!-- 등급변경이력 그리드 -->
                <div id="tabGradeGrid" ></div>
                <!-- 등급변경이력 그리드 -->
            </div>
        </div>
    </div>
    <!-- // 탭 종료 -->
</section>





<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     * 데이터 셋업 영역
     *************************************************************/

    var popupWindow;
    var membershipCardSearch;
    var specalPopupWindow;
    var loginDlrCd              = "${dlrCd}";

    //카드종류구분 Array
    var cardTpList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${cardTpCdList}">
    cardTpList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>
    //카드종류구분 Map
    var cardTpMap = [];
    $.each(cardTpList, function(idx, obj){
        cardTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //고객유형 설정
    var custTpList              = [];
    var custTpMap = [];
    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //잠재/보유 고객 설정
    var custCdList              = [];
    var custCdMap = [];
    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //선호연락방법설정
    var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":""}];
    var prefCommMthCdMap        = [];
    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //신분증 유형(주요인증문서유형) 설정
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpMap            = [];
    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //차대번호 설정

    //등급 설정
    var gradeCodeList = [];
    <c:forEach var="obj" items="${gradeCodeList}">
    gradeCodeList.push({
     "gradeSeq":"${obj.gradeSeq}"
     ,"gradeNm":"${obj.gradeNm}"
     });
    </c:forEach>
    var gradeCodeListMap = dms.data.arrayToMap(gradeCodeList, function(obj){ return obj.gradeSeq; });

    // 숫자
    /* $(".numberic").kendoMaskedTextBox({
        mask:"000000000000000000"
        , promptChar:" "
    }); */

    // 숫자와 알파벳
    /* $(".numberandalpha").kendoMaskedTextBox({
        mask:"AAAAAAAAAAAAAAAAAAAA"
        , promptChar:" "
    }); */

    /* $(".numberic").focusout(function(){
        $(this).val($.trim($(this).val()));
    }); */

    /* $(".numberandalpha").focusout(function(){
        $(this).val($.trim($(this).val()));
    }); */



    var vinNoList = [{"vinNo":""         // 차대번호(VIN)
                      ,"vinNoNm":""         // 차대번호명
                      ,"carRegNo":""         // 차량번호
                      ,"carlineNm":""
                      ,"modelNm":""
    }];

    stan = '<c:out value="${membershipStan}"/>';

    /* <c:forEach var="obj" items="${mathDocTpList}">
    vinNoList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    vinNoMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach> */

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

    //적립포인트(가용)
    $("#lastPointVal").kendoExtNumericTextBox({
        format:"n0"
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //시간 template
    $(".form_datepicker").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 탭영역 지정
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    $("#gradeCd").kendoExtDropDownList({
        dataSource:gradeCodeList
        //,template:"[#:data.gradeSeq#] #:data.gradeNm#"
        ,dataValueField:"gradeSeq"
        ,dataTextField:"gradeNm"
        , optionLabel:" "
    });

    //조회조건-등록일일 선택
   /*  $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }); */

  //특별포인트 신청
    $("#specialPoint").kendoButton({
        click:function(e){
            // 그리드에서 선택된 멤버가 있는지 확인
            var grid = $('#membershipGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var membershipNo="";
            var cardNo="";
            var cardTpCd="";
            if(selectedItem == null){
                //특별포인트를 지급하고자 하는 고객을 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.specialPoint'/>");
                return;
            }else{
                membershipNo = selectedItem.membershipNo;
                cardNo = selectedItem.cardNo;
                cardTpCd = selectedItem.cardTpCd;
            }

            specalPopupWindow = dms.window.popup({
                windowId:"specialPointPopup"
                , title:"<spring:message code='global.title.specialPointReq'/>"   // 특별 포인트 신청
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectSpecialPointPopup.do?membershipNo="+membershipNo+"&cardNo="+cardNo+"&cardTpCd="+cardTpCd+"'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            //포인트 이력 그리드 데이터 조회
                            $("#tabPointHisGrid").data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });


    $("#btnSave").kendoButton({
        click:function(e){
         // form 데이터
            var param =
                $("#membershipForm").serializeObject(
                    $("#membershipForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            if ($("#rechargeYn").prop("checked")){
                param["rechargeYn"] = "Y";
            }else{
                param["rechargeYn"] = "N";
            };
            if ($("#pointYn").prop("checked")){
                param["pointYn"] = "Y";
            }else{
                param["pointYn"] = "N";
            }
            param["stan"] = stan;

            var url = "";
            if( dms.string.isNotEmpty($("#membershipNo").val()) ){
                url = "<c:url value='/crm/dmm/membership/updateMembership.do' />";
                param["membershipNo"] = $("#membershipNo").val();
                param["gradeCd"] = $("#gradeCd").val();
                param["befGradeCd"] = $("#befGradeCd").val();
            }else{
                url = "<c:url value='/crm/dmm/membership/insertMembership.do' />";
            }



            /* if($("#membershipNo").val() != ""){
                //초기화을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.btn.init' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                return;
            } */

            if($("#custNo").val() == ""){
                dms.notification.info("<spring:message code='global.lbl.custNm' var='custNm' /><spring:message code='global.info.validation.required' arguments='${custNm}' />");
                return;
            }

            if($("#cardNo").val() == ""){
                dms.notification.info("<spring:message code='global.lbl.pointCardNo' var='pointCardNo' /><spring:message code='global.info.validation.required' arguments='${pointCardNo}' />");
                return;
            }

            if(stan == 02){// 01.고객, 02.자동차
                if($("#vinNo").val() == ""){
                    dms.notification.info("<spring:message code='global.lbl.vinNo' var='vinNo' /><spring:message code='global.info.validation.required' arguments='${vinNo}' />");
                    return;
                }
            }

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    //console.log(result);
                    /* if (result["custNo"] != ""){
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#custNo").val(result["custNo"]);
                        resetDefaultForm();
                        $("#btnCustSearch").click();
                    } */

                    if (result > 0){
                        dms.notification.success("<spring:message code='global.info.already'/>");
                    }else if(result = -1 ){
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        resetDefaultForm();
                    }
                    $('#membershipGrid').data('kendoExtGrid').dataSource.page(1);
                }
            }).done(function(result) {
                console.log("btnCustSave Done!!!!");
            });

        }
    });

    $("#btnTransferMembership").kendoButton({
        click:function(e){
            var sCustExtrTermNo = "";
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.membershipTransReg' />", "<c:url value='/crm/dmm/membershipTrans/selectMembershipTransMain.do' />", "VIEW-I-10244"); //멤버십 양도신청 화면으로 이동
        }
    });

    $("#btnInit").kendoButton({
        click:function(e){
            resetDefaultForm();
            resetDefaultSearchForm();
        }
    });

    $("#btnSearch").kendoButton({
        click:function(e){
            resetDefaultForm();
            $('#membershipGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 패키지쿠폰 등록
    $("#btnPackageCouponAdd").kendoButton({
        click:function(e){
            // 그리드에서 선택된 멤버가 있는지 확인
            var grid = $('#membershipGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var dlrCd="";
            var membershipNo="";
            if(selectedItem == null){
                //패키지 쿠폰 등록을 하고자 하는 고객을 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.packageCouponCustSelect'/>");
                return;
            }else{
                dlrCd = selectedItem.dlrCd;
                membershipNo = selectedItem.membershipNo;
            }

            popupWindow = dms.window.popup({
                windowId:"packageCouponHisPopup"
                , title:"<spring:message code='crm.title.packageCoupon'/>"   // 패키지쿠폰
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectPackageCouponPopup.do?membershipNo="+membershipNo+"&dlrCd="+dlrCd+"'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            //패키지 쿠폰 이력 그리드 데이터 조회
                            $("#packageCouponHisGrid").data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });

  //버튼 - 충전카드등록
    $("#btnRchgReg").kendoButton({
        click:function(e){
            // 그리드에서 선택된 멤버가 있는지 확인
            var grid = $('#membershipGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var dlrCd="";
            var membershipNo="";
            if(selectedItem == null){
                //충전카드 등록을 하고자 하는 고객을 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.rchgCardNoCust'/>");
                return;
            }else{
                dlrCd = selectedItem.dlrCd;
                membershipNo = selectedItem.membershipNo;
            }

            membershipCardSearch = dms.window.popup({
                windowId:"rechargeCardPopup"
                , title:"<spring:message code='crm.title.rchgCardReg'/>"   // 충전카드 등록
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipRechargeCardPopup.do?dlrCd="+dlrCd+"&membershipNo="+membershipNo+"'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            //패키지 쿠폰 이력 그리드 데이터 조회
                            $("#packageCouponHisGrid").data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });

    //버튼 - 충전
    $("#btnRchg").kendoButton({
        click:function(e){
            // 그리드에서 선택된 멤버가 있는지 확인
            var grid = $('#membershipGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var dlrCd="";
            var membershipNo="";
            if(selectedItem == null){
                //충전카드 등록을 하고자 하는 고객을 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.rchgCardNoCust'/>");
                return;
            }else{
                dlrCd = selectedItem.dlrCd;
                membershipNo = selectedItem.membershipNo;
            }

            var rchgCardGrid = $("#cardListGrid").data('kendoExtGrid');
            var selectedItem2 = rchgCardGrid.dataItem(rchgCardGrid.select());

            var cardNo="";
            var cardTpCd="";
            if(selectedItem2 == null){
                //충전하고자 하는 카드를 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.rchgCardNoSelect'/>");
                return;
            }else{
                cardNo = selectedItem2.cardNo;
                cardTpCd = selectedItem2.cardTpCd;
            }

            membershipCardSearch = dms.window.popup({
                windowId:"rechargeCardPopup"
                , title:"<spring:message code='crm.title.cardRchgReg'/>"   // 카드충전
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipRechargePopup.do?dlrCd="+dlrCd+"&membershipNo="+membershipNo+"&cardNo="+cardNo+"&cardTpCd="+cardTpCd+"'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            //패키지 쿠폰 이력 그리드 데이터 조회
                            $("#cardListGrid").data('kendoExtGrid').dataSource.read();
                            $("#tabCardListGrid").data('kendoExtGrid').dataSource.page(1);
                        }
                    }
                }
            });
        }
    });




    /*************************************************************
     * 멤버십 그리드
     *************************************************************/
     $("#membershipGrid").kendoExtGrid({
         dataSource:{
              transport:{
                 read:{
                     url:"<c:url value='/crm/dmm/membership/selectMemberships.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCustNo"] = $("#sCustNo").val();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);

                     } else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"membershipNo"
                     ,fields:{
                         rnum:{type:"string", editable:false}
                         ,dlrCd:{type:"string", validation:{required:false}}
                         ,membershipNo:{type:"string", validation:{required:false}}
                         ,cardTpCd:{type:"string", validation:{required:false}}
                         ,custNm:{type:"string", validation:{required:true}}
                         ,gradeCd:{type:"string", validation:{required:true}}
                         ,vinNo:{type:"string", validation:{required:true}}
                         ,carRegNo:{type:"string", validation:{required:true}}
                         ,carlineNm:{type:"string", validation:{required:true}}
                         ,modelNm:{type:"string", validation:{required:true}}
                         ,custTp:{type:"string", validation:{required:true}}
                         ,custCd:{type:"string", validation:{required:true}}
                         ,hpNo:{type:"string", validation:{required:true}}
                         ,telNo:{type:"string", validation:{required:true}}
                         ,regDt:{type:"date", validation:{required:false}}
                         ,lastPointVal:{type:"number", validation:{required:false}}
                     }
                 }
             }
         }
         ,height:200
         ,autoBind:false
         ,pageable:false
         ,editable:false
         ,multiSelectWithCheckbox:true
         /* ,editableOnlyNew:true
         ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"] */
         ,columns:[
             {field:"rnum", title:"<spring:message code='global.lbl.no' />",hidden:true, width:60, sortable:false, attributes:{"class":"ac"}}
             ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100,attributes:{"class":"ac"}} // 딜러코드
             ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", hidden:true, width:100,attributes:{"class":"ac"}} //멥머십 번호
             ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>", hidden:true, width:100,attributes:{"class":"ac"}} //카드번호 일련번호
             ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"ac"}} //고객명
             ,{field:"gradeCd", title:"<spring:message code='global.lbl.gradeCd'/>", width:100
                 ,attributes:{"class":"ac"}
                 ,editor:function(container, options) {
                     $('<input required name="gradeCd" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         dataTextField:"gradeNm"
                         ,dataValueField:"gradeSeq"
                         ,dataSource:gradeCodeList
                         , change:function(e){

                         }
                     });
                     $('<span class="k-invalid-msg" data-for="gradeCd"></span>').appendTo(container);
                 }
                 ,template:"# if(gradeCodeListMap[gradeCd] != null) { # #= gradeCodeListMap[gradeCd].gradeNm# # }#"

             }//등급

             ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo'/>", width:100,attributes:{"class":"ac"}}//VIN번호
             ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo'/>", width:100,attributes:{"class":"ac"}}//차량번호
             ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm'/>", width:100,attributes:{"class":"ac"}}//차종명
             ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm'/>", width:100,attributes:{"class":"ac"}}//모델명
             ,{field:"custTp", title:"<spring:message code='global.lbl.custTp' />", width:100,attributes:{"class":"ac"}
                 , template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
                 , editor:function(container, options){
                     $('<input data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                         , dataValueField:"cmmCd"
                         , dataSource:custTpList
                     });
                     $('<span class="k-invalid-msg" data-for="custTp"></span>').appendTo(container);
                 }
             }
             ,{field:"custCd", title:"<spring:message code='global.lbl.custCd' />", width:100,attributes:{"class":"ac"}
             , template:'#if (custCd !== ""){# #= custCdMap[custCd]# #}#'
             , editor:function(container, options){
                 $('<input data-bind="value:' + options.field + '"  />')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     dataTextField:"cmmCdNm"
                     , dataValueField:"cmmCd"
                     , dataSource:custCdList
                 });
                 $('<span class="k-invalid-msg" data-for="custCd"></span>').appendTo(container);
             }
         }
             ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", width:100,attributes:{"class":"ac"}} //휴대전화
             ,{field:"telNo", title:"<spring:message code='global.lbl.telNo'/>", width:100,attributes:{"class":"ac"}}//전화번호
             ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>", width:100,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }//등록일
             ,{field:"lastPointVal", title:"", width:100, hidden:true
                 ,attributes:{"class":"ar"}
                 ,format:"{0:n0}"
                 ,decimal:0
             }//등록일
             ,{title:""}
         ]
         ,change:function(e){
             var dataItem = this.dataItem(this.select());

             resetDefaultForm();
             $("#fileGrid").data("kendoExtGrid").dataSource.read();  //충전카드목록
             $("#cardListGrid").data("kendoExtGrid").dataSource.read();  //충전카드목록
             $("#packageCouponHisGrid").data("kendoExtGrid").dataSource.page(1);  //등급변경이력
             $("#custNo").val(dataItem.custNo);
             $("#custNm").val(dataItem.custNm);
             $("#mngScId").val(dataItem.mngScId);//담당영업자
             $("#membershipNo").val(dataItem.membershipNo);//멤버십 번호
             $("#cardNo").val(dataItem.cardNo);//포인트 카드 번호
             $("#cardTpCd").val(dataItem.cardTpCd);//포인트 카드 유형
             $("#custTp").data("kendoExtDropDownList").value(dataItem.custTp);//고객유형
             $("#addr1").val(dataItem.addr1);//주소1
             $("#addr2").val(dataItem.addr2);//주소2
             $("#telNo").val(dataItem.telNo);//집전화
             $("#prefCommMthCd").data("kendoExtDropDownList").value(dataItem.custTp);//선호연락방법
             $("#prefCommNo").val(dataItem.prefCommNo);//선호연락방법
             $("#hpNo").val(dataItem.hpNo);//핸드폰번호
             $("#emailNm").val(dataItem.emailNm);//이메일명
             $("#fileDocNo").val(dataItem.fileDocNo);//파일 일련번호
             $("#befGradeCd").val(dataItem.gradeCd);//이전등급
             $("#mathDocTp").data("kendoExtDropDownList").value(dataItem.mathDocTp);//신분증 유형(주요인증문서유형)
             $("#ssnCrnNo").val(dataItem.ssnCrnNo);//주민사업자등록번호
             $("#gradeCd").data("kendoExtDropDownList").value(dataItem.gradeCd);//고객등급코드
             $("#modelNm").val(dataItem.carlineNm+"/"+dataItem.modelNm);//차종명/모델명
             $("#carRegNo").val(dataItem.carRegNo);//차량번호
             $("#lastPointVal").data("kendoExtNumericTextBox").value(dataItem.lastPointVal);//적립포인트(가용)

             if (dataItem.rechargeYn == 'Y'){ $("#rechargeYn").prop("checked", true) };//충전식
             if (dataItem.pointYn == 'Y'){ $("#pointYn").prop("checked", true) };//포인트식
             //가입신청서


            /*
             * VIN번호 setting 시작
             */

            //[TODO] 고객 팝업에서 조회를 했을때 차대번호 및 차량 소유목록을 ajax에서 가지고 와서 setting해야함
            //  /sal/veh/vehicleMaster/selectVehicleMaster.do 에서 호출할것
            if(stan == 02){// 01.고객, 02.자동차
                var param = {};
                param["sDlrCd"] = dataItem.dlrCd
                param["sCustNo"] = dataItem.custNo
                url = "<c:url value='/crm/dmm/membership/selectVINDropDownList.do' />";

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
                        //console.log(result);
                        if (result["vinList"] != ""){
                            var vinList = result["vinList"];
                            var vinNo = "";
                            for(var i=0;i < vinList.length;i++){
                                vinNo = vinList[i].vinNo;
                                vinNoList.push({"vinNo":vinList[i].vinNo
                                                 ,"vinNoNm":vinList[i].vinNo
                                                 , "carRegNo":vinList[i].carRegNo
                                                 , "modelNm":vinList[i].modelNm
                                                 , "carlineNm":vinList[i].carlineNm
                                                 });
                            }
                            $("#vinNo").data("kendoExtDropDownList").setDataSource(vinNoList);
                            $("#vinNo").data("kendoExtDropDownList").value(dataItem.vinNo);
                        }
                    }
                });
            }
            //포인트 이력 그리드 데이터 조회
            $('#tabPointHisGrid').data('kendoExtGrid').dataSource.read();

            //멤버십 충전카드이력 데이터 조회
            $('#tabCardListGrid').data('kendoExtGrid').dataSource.read();

            //멤버십 등급이력  그리드 데이터 조회
            $('#tabGradeGrid').data('kendoExtGrid').dataSource.read();
          }

     });





    /*************************************************************
    * 충전카드목록 그리드
    *************************************************************/
    $("#cardListGrid").kendoExtGrid({
       dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/crm/dmm/membership/selectRechargeCardList.do' />"
               }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var grid = $('#membershipGrid').data('kendoExtGrid');
                        var selectedItem = grid.dataItem(grid.select());

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]  = selectedItem.sDlrCd;
                        params["sMembershipNo"] = selectedItem.membershipNo;

                        //params["sVinNo"]  = selectedItem.vinNo;

                        return kendo.stringify(params);

                    } /* else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    } */
                }
           }
           ,schema:{
               model:{
                   id:"membershipNo"
                   ,fields:{
                       rnum:{type:"string", editable:false}
                       ,dlrCd:{type:"string", validation:{required:true}}
                       ,membershipNo:{type:"string", validation:{required:true}}
                       ,cardTpCd:{type:"string", validation:{required:true}}
                       ,cardNo:{type:"string", validation:{required:true}}
                       ,realTotAmt:{type:"int", validation:{required:false}}
                       ,regDt:{type:"date", validation:{required:false}}
                   }
               }
           }
       }
       ,height:80
       ,autoBind:false
       ,pageable:false
       ,multiSelectWithCheckbox:false
       ,editable:false
       /* ,editableOnlyNew:true
       ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"] */
       ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
           ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", width:250,attributes:{"class":"ac"},hidden:true} //딜러코드
           ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", width:300,attributes:{"class":"ac"},hidden:true} //멤버십 일련번호
           ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo'/>", width:200, attributes:{"class":"ac"}}//카드번호
           ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.usePoint'/>", width:200, attributes:{"class":"ac"}}//가용금액
           ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>" //카드종류
               ,attributes:{"class":"ac"}
               ,width:120
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardTpList
                   });
                }
               ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
           }// 카드종류
           ,{field:"regDt", title:"<spring:message code='crm.lbl.issueDate'/>", width:200, attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
           }//발급일
           ,{title:""}
       ]
       ,change:function(e){

           //alert("Here");

           /* var dataItem = this.dataItem(this.select());

           if (dataItem.cmmGrpCd !== lastSelectedroleId) {
               lastSelectedroleId = dataItem.roleId;
               if (dataItem.isNew()) {
                   $("#targetUserGrid").data("kendoExtGrid").dataSource.data([]);
                   $("#targetResourceGrid").data("kendoExtGrid").dataSource.data([]);
               } else {
                   $("#targetUserGrid").data("kendoExtGrid").dataSource.read();
                   $("#targetResourceGrid").data("kendoExtGrid").dataSource.read();
               }
           } */
        }
    });



    /*************************************************************
     * Tab 포인트 이력 그리드
     *************************************************************/
    //Tab01 그리드 설정
    $("#tabPointHisGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipPointHiss.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var grid = $('#membershipGrid').data('kendoExtGrid');
                        var selectedItem = grid.dataItem(grid.select());

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCustNo"]  = selectedItem.custNo;
                        params["sMembershipNo"] = selectedItem.membershipNo;
                        params["sCardTpCd"] = "01";
                        params["sVinNo"]  = selectedItem.vinNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,membershipNo:{type:"string", validation:{required:true}, editable:false}
                        ,membershipTp:{type:"string", validation:{required:true}, editable:false}
                        ,cardNo:{type:"string", validation:{required:false}, editable:false}
                        ,pointCd:{type:"string", validation:{required:false}, editable:false}
                        ,pointTp:{type:"string", validation:{required:false}, editable:false}
                        ,occrPointVal:{type:"string", validation:{required:false}, editable:false}
                        ,occrPointVal2:{type:"string", validation:{required:false}, editable:false}
                        ,deptNm:{type:"string", validation:{required:false}, editable:false}
                        ,prsnId:{type:"string", validation:{required:false}, editable:false}
                        ,occrDt:{type:"string", validation:{required:false}, editable:false}
                    }
                }
            }
        }
        ,autoBind:false
        ,height:150
        ,multiSelectWithCheckbox:false
        /* ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"] */
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //딜러코드
            ,{field:"membershipNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 번호
            ,{field:"membershipTp", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 타입
            ,{field:"cardNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //카드번호
            ,{field:"pointCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //포인트 코드
            ,{field:"pointTp", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //발생포인트
            ,{field:"occrPointVal", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"},hidden:true } //발생포인트
            ,{field:"occrPointVal2", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //발생포인트-부호포함
            ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm'/>", width:100,attributes:{"class":"ac"} } //담당부서
            ,{field:"prsnId", title:"<spring:message code='global.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //담당자
            ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            } //발생일(현재 부서로 되어 있어서 추후 변경해야함)
            ,{title:""}
        ]

    });


    /*************************************************************
     * Tab 충전카드 이력 그리드
     *************************************************************/
    //Tab02 tabCardList그리드 설정
    $("#tabCardListGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipPointHiss.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var grid = $('#membershipGrid').data('kendoExtGrid');
                        var selectedItem = grid.dataItem(grid.select());

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCustNo"]  = selectedItem.custNo;
                        params["sCardTpCd"] = "02";
                        params["sMembershipNo"] = selectedItem.membershipNo;
                        params["sVinNo"]  = selectedItem.vinNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,membershipNo:{type:"string", validation:{required:true}, editable:false}
                        ,membershipTp:{type:"string", validation:{required:true}, editable:false}
                        ,cardNo:{type:"string", validation:{required:false}, editable:false}
                        ,pointCd:{type:"string", validation:{required:false}, editable:false}
                        ,pointTp:{type:"string", validation:{required:false}, editable:false}
                        ,occrPointVal:{type:"string", validation:{required:false}, editable:false}
                        ,occrPointVal2:{type:"string", validation:{required:false}, editable:false}
                        ,deptNm:{type:"string", validation:{required:false}, editable:false}
                        ,prsnId:{type:"string", validation:{required:false}, editable:false}
                        ,occrDt:{type:"string", validation:{required:false}, editable:false}
                    }
                }
            }
        }
        ,autoBind:false
        ,height:150
        ,multiSelectWithCheckbox:false
        /* ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"] */
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //딜러코드
            ,{field:"membershipNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 번호
            ,{field:"membershipTp", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //멤버십 타입
            ,{field:"cardNo", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //카드번호
            ,{field:"pointCd", title:"<spring:message code='global.lbl.pointCont'/>",attributes:{"class":"ac"},hidden:true } //포인트 코드
            ,{field:"pointTp", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //발생포인트
            ,{field:"occrPointVal", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"},hidden:true } //발생포인트
            ,{field:"occrPointVal2", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ac"} } //발생포인트-부호포함
            ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm'/>", width:100,attributes:{"class":"ac"} } //담당부서
            ,{field:"prsnId", title:"<spring:message code='global.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //담당자
            ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            } //발생일(현재 부서로 되어 있어서 추후 변경해야함)
            ,{title:""}
        ]

    });



    /*************************************************************
     * Tab 등급변경 이력 그리드
     *************************************************************/
    //Tab03 tabGrade그리드 설정
    $("#tabGradeGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipGradeHiss.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var grid = $('#membershipGrid').data('kendoExtGrid');
                        var selectedItem = grid.dataItem(grid.select());

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCustNo"]  = selectedItem.custNo;
                        params["sMembershipNo"] = selectedItem.membershipNo;
                        params["sVinNo"]  = selectedItem.vinNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"gradeChgHisSeq"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,membershipNo:{type:"string", validation:{required:true}, editable:false}
                        ,gradeChgHisSeq:{type:"string", validation:{required:false}, editable:false}
                        ,useYn:{type:"string", validation:{required:false}, editable:false}
                        ,befGradeCd:{type:"string", validation:{required:false}, editable:false}
                        ,aftGradeCd:{type:"string", validation:{required:false}, editable:false}
                        ,gradeChgDt:{type:"date", validation:{required:false}, editable:false}
                    }
                }
            }
        }
        ,autoBind:false
        ,height:150
        ,multiSelectWithCheckbox:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"]
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:100,attributes:{"class":"ac"}, hidden:true } //딜러코드
            ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo' />", width:150,attributes:{"class":"ac"}, hidden:true} //멤버십 번호
            ,{field:"gradeChgHisSeq", title:"<spring:message code='global.lbl.seq' />", width:200, attributes:{"class":"ac"}, hidden:true} //등급변경 일련번호
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:200, attributes:{"class":"ac"}, hidden:true} // 여부
            ,{field:"befGradeCd", title:"<spring:message code='crm.lbl.befGradeCd' />", width:200, attributes:{"class":"ac"}
                ,validation:{required:true}
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="befGradeCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"gradeNm"
                        ,dataValueField:"gradeSeq"
                        ,dataSource:gradeCodeList
                        , change:function(e){

                        }
                    });
                    $('<span class="k-invalid-msg" data-for="befGradeCd"></span>').appendTo(container);
                }
                ,template:"# if(gradeCodeListMap[befGradeCd] != null) { # #= gradeCodeListMap[befGradeCd].gradeNm# # }#"
            } //이전등급
            ,{field:"aftGradeCd", title:"<spring:message code='crm.lbl.aftGradeCd' />", width:200, attributes:{"class":"ac"}
                ,validation:{required:true}
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="aftGradeCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"gradeNm"
                        ,dataValueField:"gradeSeq"
                        ,dataSource:gradeCodeList
                        , change:function(e){

                        }
                    });
                    $('<span class="k-invalid-msg" data-for="aftGradeCd"></span>').appendTo(container);
                }
                ,template:"# if(gradeCodeListMap[aftGradeCd] != null) { # #= gradeCodeListMap[aftGradeCd].gradeNm# # }#"
            } //이후등급
            ,{field:"gradeChgDt", title:"<spring:message code='crm.lbl.gradeChgDt' />", width:200
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            } //등급변경일
            ,{title:""}
        ]

    });



    /*************************************************************
     * 패키지 쿠폰 그리드
     *************************************************************/
    //packageCouponHisGrid그리드 설정
    $("#packageCouponHisGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/dmm/membership/selectPackageCouponHiss.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var grid = $('#membershipGrid').data('kendoExtGrid');
                        var selectedItem = grid.dataItem(grid.select());

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]  = selectedItem.dlrCd;
                        params["sMembershipNo"] = selectedItem.membershipNo;

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
                        rnum:{type:"string", editable:false}
                         ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,membershipNo:{type:"string", validation:{required:true}, editable:false}
                        ,seq:{type:"number", validation:{required:true}, editable:false}
                        ,pkgSeq:{type:"number", validation:{required:true}, editable:false}
                        ,pkgNm:{type:"string", validation:{required:true}, editable:false}
                        ,pkgAmt:{type:"number", validation:{required:true}, editable:false}
                        ,pkgCont:{type:"string", validation:{required:true}, editable:false}
                        ,cupnSeq:{type:"number", validation:{required:true}, editable:false}
                        ,cupnNm:{type:"string", validation:{required:true}, editable:false}
                        ,cupnNo:{type:"string", validation:{required:true}, editable:false}
                        ,cupnCont:{type:"number", validation:{required:true}, editable:false}
                        ,cupnDestDt:{type:"date", validation:{required:true}, editable:false}
                        ,cupnUseYn:{type:"string", validation:{required:true}, editable:false}
                        ,cupnUseDt:{type:"date", validation:{required:true}, editable:false}
                        ,useDeptNm:{type:"string", validation:{required:true}, editable:false}
                        ,usePrsnId:{type:"string", validation:{required:true}, editable:false}
                        ,regDt:{type:"date", validation:{required:true}, editable:false}
                        /*,gradeChgHisSeq:{type:"string", validation:{required:false}, editable:false}
                        ,useYn:{type:"string", validation:{required:false}, editable:false}
                        ,befGradeCd:{type:"string", validation:{required:false}, editable:false}
                        ,aftGradeCd:{type:"string", validation:{required:false}, editable:false}
                        ,gradeChgDt:{type:"date", validation:{required:false}, editable:false} */
                    }
                }
            }
        }
        ,autoBind:false
        ,height:150
        ,multiSelectWithCheckbox:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["roleNm","roleDetlCont"]
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:100,attributes:{"class":"ac"}, hidden:true } //딜러코드
            ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo' />", width:150,attributes:{"class":"ac"}, hidden:true} //멤버십 번호
            ,{field:"seq", title:"일련번호", width:150,attributes:{"class":"ac"}, hidden:true} //일련번호
            ,{field:"pkgSeq", title:"패키지일련번호", width:150,attributes:{"class":"ac"}, hidden:true} //패키지일련번호
            ,{field:"pkgNm", title:"<spring:message code='crm.lbl.pkgNm'/>", width:150,attributes:{"class":"ac"}} //패키지명
            ,{field:"pkgAmt", title:"패키지금액", width:150,attributes:{"class":"ac"}, hidden:true} //패키지금액
            ,{field:"pkgCont", title:"패키지내용", width:150,attributes:{"class":"ac"}, hidden:true} //패키지내용
            ,{field:"cupnSeq", title:"쿠폰일련번호", width:150,attributes:{"class":"ac"}, hidden:true} //쿠폰일련번호
            ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", width:150,attributes:{"class":"ac"}} //쿠폰명
            ,{field:"cupnNo", title:"<spring:message code='crm.lbl.cupnNo'/>", width:150,attributes:{"class":"ac"}} //쿠폰번호
            ,{field:"cupnCont", title:"<spring:message code='crm.lbl.cupnCont'/>", width:150,attributes:{"class":"ac"}, hidden:true} //쿠폰설명
            ,{field:"cupnDestDt", title:"<spring:message code='crm.lbl.cupnDestDt'/>", width:150,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            } //쿠폰소멸일자
            ,{field:"cupnUseYn", title:"<spring:message code='crm.lbl.cupnUseYn'/>", width:150,attributes:{"class":"ac"}} //쿠폰사용여부
            ,{field:"cupnUseDt", title:"<spring:message code='crm.lbl.cupnUseDt'/>", width:150,attributes:{"class":"ac"} //쿠폰소멸일
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            } //쿠폰사용일자
            ,{field:"useDeptNm", title:"사용부서명", width:150,attributes:{"class":"ac"}, hidden:true} //사용부서명
            ,{field:"usePrsnId", title:"사용담당자ID", width:150,attributes:{"class":"ac"}, hidden:true} //사용담당자ID
            ,{field:"regDt", title:"<spring:message code='crm.lbl.issueDate'/>", width:150,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            } //발급일
            ,{title:""}
        ]

    });



    /*****************************************************************************
     **************************파일업로드3:파일 다운로드  ****************************
     *******************************************************************************/
     $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#fileGrid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());

        if(dms.string.isNotEmpty(dataItem)){
            dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
        }
     });
    /*****************************************************************************
     **************************파일업로드3:파일 다운로드  ****************************
     *******************************************************************************/

     /* *************************************************************************
      **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
      ***************************************************************************/
          // 파일 그리드 시작 //
          $("#fileGrid").kendoExtGrid({
              dataSource:{
                  transport:{
                      read:{
                          url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                      },
                      parameterMap:function(options, operation) {
                          if (operation === "read") {

                              var params = {};

                              // 내방 리스트 그리드의 선택된 CUST_NO
                              var membershipGrid = $("#membershipGrid").data("kendoExtGrid");
                              var selectedItem = membershipGrid.dataItem(membershipGrid.select());
                              if ( dms.string.isNotEmpty(selectedItem) ) {
                                  params["sFileDocNo"] = selectedItem.fileDocNo;
                              } else {
                                  return;
                              }

                              console.log("fileGrid:"+kendo.stringify(params));
                              return kendo.stringify(params);

                          }else if (operation !== "read" && options.models) {
                              return kendo.stringify(options.models);
                          }
                      }
                  }
                  ,schema:{
                      model:{
                          fields:{
                              fileDocNo:{type:"string"}
                              ,fileNo:{type:"number"}
                              ,fileNm:{type:"string"}
                              ,fileSize:{type:"number"}
                          }
                      }
                  }
              }
             ,autoBind:false
             ,editable:false
             ,height:135
             ,multiSelectWithCheckbox:true
             ,navigatable:false
             ,pageable:false
             ,sortable:false
             ,selectable:"multiple"
             ,columns:[
                 {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
                ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
                ,{title:""}

             ]
         });
         // 파일 그리드 종료 //
      /* *************************************************************************
      **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
      ***************************************************************************/

      /* *************************************************************************
       **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
       ***************************************************************************/
       //========파일삭제
       $("#fileDelete").click(function(){
           var grid = $("#fileGrid").data("kendoExtGrid");
           var rows = grid.select();

           if (rows.length < 1) {
               //목록을 선택하여 주십시오.
               dms.notification.info("<spring:message code='global.info.required.select'/>");
               return;
           }

           var deleteList = [];
           rows.each(function(index, row) {
               var dataItem = grid.dataItem(row);
               deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
           });

           $.ajax({
               url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
               ,data:JSON.stringify(deleteList)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,error:function(jqXHR, status, error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               }
               ,success:function(jqXHR, textStatus) {

                   grid.dataSource._destroyed = [];
                   grid.dataSource.read();

                   //정상적으로 반영 되었습니다.
                   dms.notification.success("<spring:message code='global.info.success'/>");
               }
           });
       });

       /* *************************************************************************
        **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
        ***************************************************************************/














    ////버튼 - 고객등록이동
    $("#btnMove").kendoButton({
        click:function(e){
            location.href = "<c:url value='crm/cif/customerInfo/selectCustomerInfoMain.do'/>";
        }
    });


    /*************************************************************
     * 고객검색팝업
     *************************************************************/
    $("#custSearch").click(function(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            //[TODO] 고객 팝업에서 조회를 했을때 차대번호 및 차량 소유목록을 ajax에서 가지고 와서 setting해야함
                            //  /sal/veh/vehicleMaster/selectVehicleMaster.do 에서 호출할것


                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#mngScId").val(data[0].mngScId);//담당영업자
                            //$("#custCd").data("kendoExtDropDownList").value(data[0].custCd)//잠재/보유고객
                            //$("#custCd").val(data[0].custCd);
                            $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);//고객유형
                            //$("#custTp").val(data[0].custTp);
                            $("#addr1").val(data[0].addr1);//주소1
                            $("#addr2").val(data[0].addr2);//주소2
                            $("#telNo").val(data[0].telNo);//집전화
                            $("#prefCommMthCd").data("kendoExtDropDownList").value(data[0].custTp);//선호연락방법
                            //$("#prefCommMthCd").val(data[0].prefCommMthCd);
                            $("#prefCommNo").val(data[0].prefCommNo);//선호연락방법

                            $("#hpNo").val(data[0].hpNo);//핸드폰번호
                            $("#emailNm").val(data[0].emailNm);//이메일명
                            $("#mathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp);//신분증 유형(주요인증문서유형)

                            $("#ssnCrnNo").val(data[0].ssnCrnNo);//주민사업자등록번호

                            //[TODO] 고객 팝업에서 조회를 했을때 차대번호 및 차량 소유목록을 ajax에서 가지고 와서 setting해야함
                            //  /sal/veh/vehicleMaster/selectVehicleMaster.do 에서 호출할것
                            if(stan == '02'){
                                var param = {};
                                param["sDlrCd"] = data[0].dlrCd
                                param["sCustNo"] = data[0].custNo
                                url = "<c:url value='/crm/dmm/membership/selectVINDropDownList.do' />";

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
                                        //console.log(result);
                                        if (result["vinList"] != ""){
                                            var vinList = result["vinList"];
                                            var vinNo = "";
                                            for(var i=0;i < vinList.length;i++){
                                                vinNo = vinList[i].vinNo;
                                                vinNoList.push({"vinNo":vinList[i].vinNo
                                                                 ,"vinNoNm":vinList[i].vinNo
                                                                 , "carRegNo":vinList[i].carRegNo
                                                                 , "modelNm":vinList[i].modelNm
                                                                 , "carlineNm":vinList[i].carlineNm
                                                                 });
                                            }
                                            $("#vinNo").data("kendoExtDropDownList").setDataSource(vinNoList);
                                        }
                                    }
                                });
                            }

                            $("#custGradeCd").val(data[0].custGradeCd);//고객등급코드
                            if (data[0].rechargeYn == 'Y'){ $("#rechargeYn").prop("checked", true) };//충전식
                            if (data[0].pointYn == 'Y'){ $("#pointYn").prop("checked", true) };//포인트식
                            //가입신청서

                            //[TODO] 고객번호로 첨부파일, 충전카드목록, 포인트이력,충전카드이력, 등급변경이력 list들을 조회해와서 Setting필요
                            //var custNo = data[0].custNo;
                            //최초 팝업으로 고객 조회시 포인트 이력 탭 Data조회
//$("#tabPointGrid").data("kendoExtGrid").dataSource.read();

                            /*
                            var param = {};
                            param["custNo"] = data[0].custNo

                            if (selectTabId == "custInfoTab") {
                                callUrl = custInfoTabUrl + $("#custNo").val();
                            } else if (selectTabId == "haveModelTab"){
                                callUrl = "";
                            } else if (selectTabId == "lbrHistoryTab") {
                                callUrl = "";
                            } else if (selectTabId == "saleOtpyTab") {
                                callUrl = "";
                            } else if (selectTabId == "leadListTab") {
                                callUrl = "";
                            }
                            console.log(callUrl);
                            $.ajax({
                                url:callUrl
                                ,type:'GET'
                                ,dataType:'html'
                                ,contentType:'application/html'
                                ,error:function(jqXHR, status, error) {
                                    console.log("실패.....");
                                }
                                ,success:function(result) {
                                    console.log("성공.....");
                                    console.log(result);
                                    console.log($(result).find("#customerForm"));
                                    var customerForm = $(result).find("#customerForm");
                                    $("#tabstrip-1").html(customerForm);
                                }
                            });
                            */

                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    });


    /*************************************************************
     * 포인트카드 검색팝업
     *************************************************************/
    $("#pointCardSearch").click(function(){

        membershipCardSearch = dms.window.popup({
            windowId:"membershipCardSearchPopup"
            , title:"<spring:message code='crm.title.porintCardSearch'/>"   // 포인트 카드 조회
            , content:{
                url:"<c:url value='/crm/dmm/membershipCard/selectMembershipCardSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            if(data[0].cardTpCd == "01"){
                                $("#cardNo").val(data[0].cardNo);
                                $("#cardTpCd").val(data[0].cardTpCd);
                            }else{
                                dms.notification.info("<spring:message code='crm.info.selectCardTpCd'/>");
                            }
                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    });

    //검색부 고객명 조회
    $("#sCustSearch").click(function(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sCustNo").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);
                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    });

    /* $("#print").kendoButton({
        click:function(e){
            alert("print준비중...1");
        }
    }); */

    $("#print").click(function(){
        //alert("print준비중...2");
    });



    /*************************************************************
    *드랍다운 리스트 셋팅
    *************************************************************/

    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:custTpList
            , index:0
            , enable:false
        });
        //$("#custTp").data("kendoExtDropDownList").value("01");

     // 잠재/보유고객      custCd              (CRM023)
        $("#custCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:custCdList
            , index:0
            , change:function(){

                if (this.value() =="01"){
                    /* $("#addr1").parent().removeClass('required_area');
                    $("#addr2").parent().removeClass('required_area'); */
                }else{
                    /* $("#addr1").parent().addClass('required_area');
                    $("#addr2").parent().addClass('required_area'); */
                }
            }
            //,  value:"01"
        });
        //$("#custCd").data("kendoExtDropDownList").value("01");

        // vinNoList 차대번호              (CRM023)
        $("#vinNo").kendoExtDropDownList({
            dataTextField:"vinNoNm"
            , dataValueField:"vinNo"
            //, optionLabel:" "
            , dataSource:vinNoList
            , index:0
            , change:function(){
                for(var i=0;i < vinNoList.length;i++){
                    if(vinNoList[i].vinNo == this.value()){
                        $("#carRegNo").val("");
                        $("#modelNm").val("");
                        $("#carRegNo").val(vinNoList[i].carRegNo);
                        $("#modelNm").val(vinNoList[i].carlineNm+" / "+vinNoList[i].modelNm);
                        /* $("#carRegNo").data("kendoMaskedTextBox").value(vinNoList[i].carRegNo);*/
                    };
                }
            }
        });
        //$("#custCd").data("kendoExtDropDownList").value("01");


     // 선호연락방법       prefCommMthCd (CRM022)
         $("#prefCommMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:prefCommMthCdList
            , index:0
            , enable:false
            , click:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#prefCommNo").val($("#hpNo"));
                } else {
                    $("#prefCommNo").val("");
                }
            }
        });

     // 신분증유형            mathDocTp       (CRM024)
         $("#mathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:mathDocTpList
            , index:0
            , enable:false
        });

});

    /* *************************************************************************
     **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
     ***************************************************************************/
     //================================
     var r = new Resumable({
         target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize:1 * 1024 * 1024
         ,simultaneousUploads:4
         ,testChunks:true
         ,throttleProgressCallbacks:1
         ,method:"octet"
     });
     r.assignBrowse($('#fileSelect')[0]);

     //파일추가 이벤트
     r.on('fileAdded', function(file) {

         $("#progressWindow").kendoWindow({
             width:"600px"
             ,height:"300px"
             ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
             ,animation:false
             ,draggable:false
             ,visible:false
             ,resizable:false
             ,modal:true
         }).data("kendoWindow").center().open();


         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();

         //파일목록 출력
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         r.upload();

     });
     r.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     r.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#fileDocNo").val())) {
             $.ajax({
                 url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType:"json",
                 type:"get",
                 async:false,
                 cache:false,
                 success:function(id) {
                     _that.opt["query"]["resumableSessionId"] = id;
                     $("#fileDocNo").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 fileDocNo 를 변경해준다
//alert(id);
//console.log(id);
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();   // 파일업로드8:기존꺼에 추가할경우 fileDocNo 설정
         }

         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     r.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

         console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

         $("#progressWindow").data("kendoWindow").close();
         r.files = [];
         $(".resumable-list").html("");
     });
     r.on('fileSuccess', function(file, message) {
         console.log("===============");
         console.log(message);

         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo:result.fileDocNo
                 ,fileNo:result.fileNo
                 ,fileNm:result.fileNm
                 ,fileSize:dms.string.formatFileSize(result.fileSize)
             });
             //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
         }


     });
     r.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
     });
     r.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
     });
     /* *************************************************************************
     **************************파일업로드4:스크립트 추가 $(document).ready 밖 *****
     ***************************************************************************/



/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   초기화(Reset)
*************************************************************/
    function resetDefaultSearchForm(){
        $("#sCustNo").val("");
        $("#sCustNm").val("");
        $("#sVinNo").val("");
        $("#sStartDt").data("kendoExtMaskedDatePicker").value();
        $("#sEndDt").data("kendoExtMaskedDatePicker").value();
    }

    function resetDefaultForm(){
        $("#custNo").val("");
        $("#custNm").val("");
        $("#membershipNo").val("");//멤버십 번호
        $("#mngScId").val("");//담당영업자
        //$("#custCd").data("kendoExtDropDownList").select(0);//잠재/보유고객
        //$("#custCd").val(data[0].custCd);
        //$("#custTp").data("kendoExtDropDownList").select(0);//고객유형
        $("#custTp").data("kendoExtDropDownList").value("")//고객유형
        $("#gradeCd").data("kendoExtDropDownList").value("")//고객등급
        //$("#custTp").val(data[0].custTp);
        $("#addr1").val("");//주소1
        $("#addr2").val("");//주소2
        $("#telNo").val("");//집전화
        $("#prefCommMthCd").data("kendoExtDropDownList").select(0);//선호연락방법
        //$("#prefCommMthCd").val(data[0].prefCommMthCd);
        $("#prefCommNo").val("");//선호연락방법
        $("#hpNo").val("");//핸드폰번호
        $("#emailNm").val("");//이메일명
        $("#mathDocTp").data("kendoExtDropDownList").select(0);//신분증 유형(주요인증문서유형)
        $("#ssnCrnNo").val("");//주민사업자등록번호

        if(stan == '02'){
            vinNoList = [];
            $("#vinNo").data("kendoExtDropDownList").setDataSource([]); //VIN번호
            $("#carRegNo").val(""); // 차량번호
            $("#modelNm").val(""); //차종명/모델명
        }

        $("#cardNo").val("");//포인트 카드번호
        $("#cardTpCd").val("");//포인트 카드 일련번호
        $("#fileDocNo").val("");//첨부파일 초기화
        $("#custGradeCd").val("");//고객등급코드
        $("#befGradeCd").val("");// 이전등급
        $("#rechargeYn").prop("checked", false);
        $("#pointYn").prop("checked", false);
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  //파일
        $("#tabPointHisGrid").data("kendoExtGrid").dataSource.data([]);  //포인트이력
        $("#tabCardListGrid").data("kendoExtGrid").dataSource.data([]);  //충전카드이력
        $("#tabGradeGrid").data("kendoExtGrid").dataSource.data([]);  //등급변경이력
        $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);  //충전카드목록
        $("#packageCouponHisGrid").data("kendoExtGrid").dataSource.data([]);  //등급변경이력
        $("#lastPointVal").data("kendoExtNumericTextBox").value(0);
    }
</script>
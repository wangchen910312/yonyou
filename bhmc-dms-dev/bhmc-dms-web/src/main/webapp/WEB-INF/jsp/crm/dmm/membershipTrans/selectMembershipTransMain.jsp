<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

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

<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
        <h1 class="title_basic"><spring:message code='crm.menu.membershipTransMng'/></h1><!-- 멤버십 양도관리 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11333" hasPermission="${dms:getPermissionMask('READ')}">
              <button type="button" class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11334" hasPermission="${dms:getPermissionMask('READ')}">
              <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11335" hasPermission="${dms:getPermissionMask('READ')}">
              <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:16%;">
                    <col style="width:8%;">
                    <col style="width:20%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"> <spring:message code='crm.lbl.trsfCust'/> / <spring:message code='crm.lbl.receiveCust'/><!-- 양도자/양수자 --></th>
                        <td>
                            <input type="text" id="sCustNm" name="sCustNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.requestDt'/><!-- 신청일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartDt" name="sStartDt" class="form_datepicker ac" data-type="maskDate" >
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndDt" name="sEndDt" class="form_datepicker ac" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.evalStatus'/><!-- 심사상태 --></th>
                        <td>
                            <input id="sSignStatCd" name="sSignStatCd" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div> <!-- end table -->

        <!-- 양도정보 그리드 Start -->
        <div class="table_grid mt10">
            <div id="transGrid" class="resizable_grid"></div>
        </div>
        <!-- 양도정보 그리드 End -->
    </section>
</div>

<!-- stansWindowPopup start -->
<section id="transWindow" class="pop_wrap">

    <!-- 탭메뉴 전체 영역 -->
    <div  id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="transInfo" class="k-state-active"><spring:message code='global.title.info'/><!-- 정보 --></li>
            <li id="signInfo"><spring:message code='crm.title.sign'/><!-- 결재 --></li>
        </ul>
        <!-- //탭메뉴 -->

        <span class="btn_right_absolute2">
        <dms:access viewId="VIEW-D-11336" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m" id="btnTransSave"><spring:message code='global.btn.save'/><!-- 저장 --></button>
        </dms:access>
        </span>

        <!-- 탭내용1 -->
        <div style="padding:9px 10px 0px 10px;"><!-- 탭안의 내용이 타이틀이나 버튼부터 시작하면 class="mt0" 추가 -->
            <section class="group">
                <div class="clfix">
                    <section class="left_areaStyle">
                        <div class="header_area pt0">
                            <h2 class="title_basic"><spring:message code="crm.lbl.trsfCust"/><!-- 양도자 --></h2>
                        </div>

                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:20%;">
                                    <col style="width:30%;">
                                    <col style="width:20%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.membershipNo'/><!-- 멤버십 번호 --></th>
                                        <td>
                                            <div class="form_search">
                                                <input id="trsfMembershipNo" name="trsfMembershipNo" class="form_input" placeholder="<spring:message code='crm.lbl.trsfMembershipSeq'/>" data-json-obj='true' disabled="disabled">
                                                <a href="javascript:;"  id="trsfMembershipSearch" ><spring:message code='crm.lbl.trsfMembershipSeq'/></a>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.gradeCd'/><!-- 등급 --></th>
                                        <td>
                                            <input id="gradeCd" name="gradeCd" class="form_comboBox" disabled="disabled" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.hpNo'/><!-- 이동전화 --></th>
                                        <td>
                                            <input id="hpNo" name="hpNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증서번호 --></th>
                                        <td>
                                            <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.custNm'/><!-- 고객명 --></th>
                                        <td>
                                            <input id="custNm" name="custNm" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.vinNum'/><!-- VIN NO --></th>
                                        <td>
                                            <input id="vinNo" name="vinNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='crm.lbl.usePoint'/><!-- 가용포인트 --></th>
                                        <td>
                                            <input  id="usePoint" name="usePoint" class="form_numeric ar" disabled="disabled" maxlength="12" >
                                            <input  type="hidden" id="fileDocNo" name="fileDocNo" class="form_input" data-json-obj="true">
                                            <input  type="hidden" id="signDocNo" name="signDocNo" >
                                            <input  type="hidden" id="dlrCd" name="dlrCd" class="form_input" data-json-obj="true">
                                            <input  type="hidden" id="trsfReceiveSeq" name="trsfReceiveSeq" class="form_input" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='crm.lbl.realTotAmt'/><!-- 가용금액 --></th>
                                        <td>
                                            <input id="realTotAmt" name="realTotAmt" class="form_numeric ar" disabled="disabled" maxlength="12" >
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- 양도자 충전카드 목록 -->
                        <section class="group mt10">
                            <div class="table_grid">
                                <div id="realAmtCardGrid">
                                </div>
                            </div>
                        </section>
                        <!-- 양도자 충전카드 목록 -->
                    </section>

                    <section class="right_areaStyle">
                        <div class="header_area pt0">
                            <h2 class="title_basic"><spring:message code="crm.lbl.receiveCust"/><!-- 양수자 --></h2>
                        </div>
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:30%;">
                                    <col style="width:15%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.membershipNo'/><!-- 멤버십번호 --></th>
                                        <td>
                                            <div class="form_search">
                                                <input type="text" id="receiveMembershipNo" name="receiveMembershipNo" class="form_input" data-json-obj='true' placeholder="<spring:message code='crm.lbl.receiveMembershipNo'/>" disabled="disabled">
                                                <a href="javascript:;"  id="receiveMembership" ><spring:message code='crm.lbl.receiveMembershipNo'/></a>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.gradeCd'/><!-- 등급 --></th>
                                        <td>
                                            <input id="receiveGradeCd" name="receiveGradeCd" disabled="disabled" class="form_comboBox" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.hpNo'/><!-- 이동전화 --></th>
                                        <td>
                                            <input type="number" id="receiveHpNo" name="receiveHpNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증서번호 --></th>
                                        <td>
                                            <input id="receiveSsnCrnNo" name="receiveSsnCrnNo" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.custNm'/><!-- 고객명 --></th>
                                        <td>
                                            <input type="text" id="receiveCustNm" name="receiveCustNm" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.vinNum'/><!-- VIN NO --></th>
                                        <td>
                                            <input type="text" id="receiveVinNo" name="receiveVinNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='crm.lbl.usePoint'/><!-- 가용포인트 --></th>
                                        <td>
                                            <input  id="receiveUsePoint" name="receiveUsePoint" class="form_numeric ar" disabled="disabled" maxlength="12" >
                                        </td>
                                        <th scope="row"><spring:message code='crm.lbl.realTotAmt'/><!-- 가용금액 --></th>
                                        <td>
                                            <input  id="receiveRealTotAmt" name="receiveRealTotAmt" class="form_numeric ar" disabled="disabled" maxlength="12" >
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="table_form mt10">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:30%;">
                                    <col style="width:15%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.trsfReasonCd'/></span><!-- 양도양수 사유 --></th>
                                        <td>
                                            <input id="trsfReasonCd" name="trsfReasonCd"  class="form_comboBox"  data-json-obj="true" />
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.trsfReceiveRelCd'/></th><!-- 관계 --></span>
                                        <td>
                                            <input id="trsfReceiveRelCd" name="trsfReceiveRelCd"  class="form_comboBox" data-json-obj="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="crm.lbl.transReceivePointVal"/><!-- 양수 포인트 --></th>
                                        <td>
                                            <input id="transReceivePointVal" name="transReceivePointVal" class="form_numeric ar" data-json-obj="true" maxlength="10">
                                        </td>
                                        <th scope="row"></th><!-- 관계 -->
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='crm.lbl.trsfReceiveCardAmt'/><!-- 양수금액 --></th>
                                        <td>
                                            <input id="trsfReceiveCardAmt" name="trsfReceiveCardAmt" class="form_numeric ar form_readonly" readonly="readonly" data-json-obj="true" maxlength="10">
                                        </td>
                                        <th scope="row"><spring:message code='crm.lbl.trsfCardNo'/><!-- 양수 카드번호 --></th>
                                        <td>
                                            <input id="trsfCardNo" name="trsfCardNo" class="form_comboBox">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- 신청서 -->
                        <section class="group">
                            <div class="header_area">
                                <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
                                <div class="btn_right">
                                <dms:access viewId="VIEW-D-11337" hasPermission="${dms:getPermissionMask('READ')}">
                                    <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                                </dms:access>
                                <dms:access viewId="VIEW-D-11338" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                                </dms:access>
                                </div>
                            </div>

                            <div class="table_grid">
                                <div id="fileGrid">
                                </div>
                            </div>

                        </section>
                        <!-- //신청서  -->
                    </section>
                </div>
            </section>
        </div>
        <!-- //탭내용1 -->

        <!-- 탭내용2 -->
        <div style="padding:0px 10px 0px 10px;">
            <!-- 결재정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.signInfo" /><!-- 결재정보 --></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11339" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s" id="btnApproval"><spring:message code='global.btn.approval' /></button><!-- 승인 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11340" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s" id="btnRollback"><spring:message code='global.btn.appRollback' /></button><!-- 반려 -->
                    </dms:access>
                    </div>
                </div>

                <div class="table_grid">
                    <div id="signLineGrid">
                    </div>
                </div>

            </section>
            <!-- //결재정보  -->
        </div>
        <!-- //탭내용2 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->

</section>
<!-- stansWindowPopup end -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">


    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#transGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
        ;

        viewDetail(selectedItem.trsfReceiveSeq);

    });

    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
     //카드종류구분 Array
     var cardTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     <c:forEach var="obj" items="${cardTpCdList}">
          cardTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     //카드종류구분 Map
     var cardTpMap = [];
     $.each(cardTpList, function(idx, obj){
         cardTpMap[obj.cmmCd] = obj.cmmCdNm;
     });

     //카드형태구분 Array
     var cardFormList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     <c:forEach var="obj" items="${cardFormCdList}">
          cardFormList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     //카드형태구분 Map
     var cardFormMap = [];
     $.each(cardFormList, function(idx, obj){
         cardFormMap[obj.cmmCd] = obj.cmmCdNm;
     });

     var gradeCodeList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     var gradeCodeMap = [];
     <c:forEach var="obj" items="${gradeCodeList}">
         gradeCodeList.push({"cmmCd":"${obj.gradeSeq}" , "cmmCdNm":"${obj.gradeNm}"});
         gradeCodeMap["${obj.gradeSeq}"] = "${obj.gradeNm}";
     </c:forEach>

     var trsfReasonCdList = [];
     var trsfReasonCdMap = [];
     <c:forEach var="obj" items="${trsfReasonCdList}">
         trsfReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         trsfReasonCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     var trsfReceiveRelCdList = [];
     var trsfReceiveRelCdMap = [];
     <c:forEach var="obj" items="${trsfReceiveRelCdList}">
         trsfReceiveRelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         trsfReceiveRelCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     //결재유형  Array
     var arrSignTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     <c:forEach var="obj" items="${arrSignTp}">
          arrSignTp.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
     </c:forEach>
     var arrSignTpMap = dms.data.arrayToMap(arrSignTp, function(obj){ return obj.cmmCd; });

     //결재진행상태  Array
     var arrSignStatCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     <c:forEach var="obj" items="${arrSignStatCd}">
          arrSignStatCd.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
     </c:forEach>
     var arrSignStatCdMap = dms.data.arrayToMap(arrSignStatCd, function(obj){ return obj.cmmCd; });

     //결재처리코드  Array
     var arrSignProcCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     <c:forEach var="obj" items="${arrSignProcCd}">
          arrSignProcCd.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
     </c:forEach>
     var arrSignProcCdMap = dms.data.arrayToMap(arrSignProcCd, function(obj){ return obj.cmmCd; });


     var toDt = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateFormat' />");
     var year = toDt.getFullYear();
     var month = toDt.getMonth();

     //양수카드번호 Setting
     function onSelectTarnsCardList(dlrCd,membershipNo){

         $("#trsfCardNo").data("kendoExtDropDownList").setDataSource([]);
         $("#trsfCardNo").data("kendoExtDropDownList").enable(true);

         var responseJson = dms.ajax.getJson({
             url:_contextPath + "/crm/dmm/membershipTrans/selectTrsfCardNoByCondition.do"
             ,data:JSON.stringify({"sDlrCd":dlrCd, "sMembershipNo":membershipNo, "sCardTpCd":"02"})
             ,async:false
         })
         $("#trsfCardNo").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

     //직무명 조회
     function fn_getTaskNm(usrId) {

         var responseRlt;
         var param = {};
         param["sUsrId"] = usrId;

         $.ajax({
             url:"<c:url value='/crm/mcm/marketingCampaign/selectUsersForTaskName.do' />"
            ,data:kendo.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,success:function(result) {
                responseRlt = result;
            }
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        });

          return responseRlt;

    };

    // 팝업 종료 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function closePopup(){
        var win = $("#transWindow").data("kendoWindow");
        win.close();
    }

    // 상세조회 후 팝업오픈
    function viewDetail(trsfReceiveSeq){

        var win = $("#transWindow").data("kendoWindow");
        win.center();
        win.open();

        if( dms.string.isNotEmpty(trsfReceiveSeq) ){

            $.ajax({
                url:"<c:url value='/crm/dmm/membershipTrans/selectMembershipTransMngByKey.do' />"
                ,data:JSON.stringify({"sTrsfReceiveSeq":trsfReceiveSeq})      //파라미터
                ,type:'POST'                        //조회요청
                ,dataType:'json'                  //json 응답
                ,contentType:'application/json'   //문자열 파라미터
                ,async:false
                ,error:function(jqXHR,status,error){
                    win.close();
                    // {양도정보}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='crm.title.transInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }
            }).done(function(body) {

                if ( dms.string.isNotEmpty(body.trsfReceiveSeq) ) {

                    $("#btnTransSave").hide();//저장버튼 숨김
                    $("#fileSelect").hide();  // 파일찾기
                    $("#fileDelete").hide();  // 파일삭제

                    var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
                    tabStrip.select(0);
                    tabStrip.enable(tabStrip.tabGroup.children(),true);

                    var trsfMembershipNo = body.trsfMembershipNo;
                    var receiveMembershipNo = body.receiveMembershipNo;
                    var dlrCd = body.dlrCd;

                    $("#dlrCd").val(dlrCd);//딜러코드
                    $("#fileDocNo").val(body.fileDocNo);//첨부파일 번호
                    $("#trsfMembershipNo").val(trsfMembershipNo);//양도자멤버십 번호
                    $("#receiveMembershipNo").val(receiveMembershipNo);//양수자 넴버십 번호
                    $("#trsfReceiveSeq").val(body.trsfReceiveSeq);//양도.양수일련번호
                    $("#signDocNo").val(body.signDocNo);//양도.양수일련번호
                    $("#trsfReasonCd").data("kendoExtDropDownList").value(body.trsfReasonCd);//양도사유
                    $("#trsfReceiveRelCd").data("kendoExtDropDownList").value(body.trsfReceiveRelCd);//관계
                    $("#transReceivePointVal").data("kendoExtNumericTextBox").value(body.pointVal);//양도신청포인트
                    $("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").value(body.trsfReceiveCardAmt);//양수자 양수포인트
                    onSelectTarnsCardList(dlrCd, receiveMembershipNo); // 양수자 카드번호
                    $("#trsfReasonCd").data("kendoExtDropDownList").enable(false);
                    $("#trsfReceiveRelCd").data("kendoExtDropDownList").enable(false);
                    $("#transReceivePointVal").data("kendoExtNumericTextBox").enable(false);
                    $("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").enable(false);
                    $("#trsfCardNo").data("kendoExtDropDownList").enable(false);
                    $("#trsfCardNo").data("kendoExtDropDownList").value(body.receiveCardNo);

                    // 양도자 & 양수자 정보 set
                    var param = {};
                    param["sTrsfMembershipNo"] = trsfMembershipNo
                    param["sReceiveMembershipNo"] = receiveMembershipNo
                    param["sDlrCd"] = dlrCd
                    param["sCardTpCd"] = "01"; //(01:포인트,02:충전)

                    $.ajax({
                        url:"<c:url value='/crm/dmm/membershipTrans/selectMembershipCustInfo.do' />"
                        ,data:JSON.stringify(param)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            //console.log(jqXHR);
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        },
                        success:function(result){

                            //양도자 영역 셋팅
                            $("#gradeCd").data("kendoExtDropDownList").value(result.trsfMember.gradeCd);
                            $("#hpNo").val(result.trsfCustInfo[0].hpNo);//휴대전화
                            $("#ssnCrnNo").val(result.trsfCustInfo[0].ssnCrnNo);//주민사업자등록번호
                            $("#custNm").val(result.trsfCustInfo[0].custNm);
                            $("#vinNo").val(result.trsfMember.vinNo);
                            $("#usePoint").data("kendoExtNumericTextBox").value(result.trsfLastPointVal); //가용포인트
                            $("#realTotAmt").data("kendoExtNumericTextBox").value(result.trsfRealTotAmt); //가용금액

                            //양수자 영역 셋팅
                            $("#receiveGradeCd").data("kendoExtDropDownList").value(result.receiveMember.gradeCd);
                            $("#receiveHpNo").val(result.receiveCustInfo[0].hpNo);//휴대전화
                            $("#receiveSsnCrnNo").val(result.receiveCustInfo[0].ssnCrnNo);//주민사업자등록번호
                            $("#receiveCustNm").val(result.receiveCustInfo[0].custNm);
                            $("#receiveVinNo").val(result.receiveMember.vinNo);
                            $("#receiveUsePoint").data("kendoExtNumericTextBox").value(result.receiveLastPointVal); //가용포인트
                            $("#receiveRealTotAmt").data("kendoExtNumericTextBox").value(result.receiveRealTotAmt); //가용금액

                        }
                    });

                    $("#realAmtCardGrid").data("kendoExtGrid").dataSource.read();
                    $("#signLineGrid").data("kendoExtGrid").dataSource.read();
                    $("#fileGrid").data("kendoExtGrid").dataSource.read();

                    if ( dms.string.isNotEmpty(body.trsfReceiveSeq)){
                        $("#btnDetail").data("kendoButton").enable(true);
                    }

                } else {

                    win.close();
                    // {양도정보}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='crm.title.transInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;

                };

            });

        }

    };

    //양수금액  합계 계산
    function receiveGridSum() {
        var receiveGridRealAmtSum = 0;
        var gridDataList = $("#realAmtCardGrid").data("kendoExtGrid").dataSource.data();
        $(gridDataList).each(function(idx, item){
            receiveGridRealAmtSum += item.trsfRealAmtVal;
        });
        $("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").value(receiveGridRealAmtSum);

    }

    //양도자 멤버십 조회
    $("#trsfMembershipSearch").click(function(){

        if ( dms.string.isEmpty($("#trsfReceiveSeq").val()) ) {

            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , width:800
                , height:400
                , title:"<spring:message code='crm.title.trsfMembershipNoSearch'/>"   // 양도자 멤버십 번호조회
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                if(data[0].membershipNo != $("#receiveMembershipNo").val()){

                                    $("#trsfMembershipNo").val(dms.string.strNvl(data[0].membershipNo));//멤버십 일련번호
                                    $("#gradeCd").data("kendoExtDropDownList").value(data[0].gradeCd);//등급
                                    $("#hpNo").val(dms.string.strNvl(data[0].hpNo));//핸드폰 번호
                                    $("#ssnCrnNo").val(dms.string.strNvl(data[0].ssnCrnNo));//증서번호
                                    $("#custNm").val(dms.string.strNvl(data[0].custNm));//고객명
                                    $("#vinNo").val(dms.string.strNvl(data[0].vinNo));//차대번호
                                    $("#usePoint").data("kendoExtNumericTextBox").value(data[0].lastPointVal); //양도자 가용포인트
                                    $("#realTotAmt").data("kendoExtNumericTextBox").value(data[0].realTotAmt); //양도자 충전가용금액
                                    $("#realAmtCardGrid").data("kendoExtGrid").dataSource.read();

                                }else{
                                    // 동일한 멤버십 번호에 양도/양수를 할 수 없습니다.
                                    dms.notification.warning("<spring:message code='crm.info.sameMembershipNo'/>");
                                }

                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });

        }


    });

    //양수자 멤버십 조회
    $("#receiveMembership").click(function(){

        if ( dms.string.isEmpty($("#trsfReceiveSeq").val()) ) {

            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , width:800
                , height:400
                , title:"<spring:message code='crm.title.receiveMembershipNoSearch'/>"   // 양수자 멤버십 번호조회
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {

                                if(data[0].membershipNo != $("#trsfMembershipNo").val()){

                                    $("#receiveMembershipNo").val(dms.string.strNvl(data[0].membershipNo));//멤버십 일련번호
                                    $("#receiveGradeCd").data("kendoExtDropDownList").value(data[0].gradeCd);//등급
                                    $("#receiveHpNo").val(dms.string.strNvl(data[0].hpNo));//핸드폰 번호
                                    $("#receiveSsnCrnNo").val(dms.string.strNvl(data[0].ssnCrnNo));//주민사업자등록번호
                                    $("#receiveCustNm").val(dms.string.strNvl(data[0].custNm));//고객명
                                    $("#receiveVinNo").val(dms.string.strNvl(data[0].vinNo));//차대번호
                                    $("#receiveUsePoint").data("kendoExtNumericTextBox").value(dms.string.strNvl(data[0].lastPointVal));//양수자 가용포인트
                                    $("#receiveRealTotAmt").data("kendoExtNumericTextBox").value(data[0].realTotAmt);//양수자 충전가용금액
                                    onSelectTarnsCardList(data[0].dlrCd, data[0].membershipNo);

                                }else{
                                    // 동일한 멤버십 번호에 양도/양수를 할 수 없습니다.
                                    dms.notification.warning("<spring:message code='crm.info.sameMembershipNo'/>");
                                }
                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });

        };

    });

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
        $("#transWindow").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.menu.membershipTransMng' />"      // 멤버십 양도관리
            ,width:"950px"
            ,height:"460px"
        }).data("kendoWindow");
        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************

        $("#tabstrip").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;

                if(selectTabId == "transInfo"){
                }else{
                }
            }
        });

        //가용포인트
        $("#usePoint").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //양수자 가용포인트
        $("#receiveUsePoint").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //양도자 충전가용금액
        $("#realTotAmt").kendoExtNumericTextBox({
            format:"n2"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //양수자 충전가용금액
        $("#receiveRealTotAmt").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //양수포인트
        $("#transReceivePointVal").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //양수금액
        $("#trsfReceiveCardAmt").kendoExtNumericTextBox({
            format:"n2"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //양수카드번호
        $("#trsfCardNo").kendoExtDropDownList({
            dataTextField:"cardNo"
            , dataValueField:"cardNo"
            , optionLabel:" "  // 전체
            , index:0
        });

        // 심사상태
        $("#sSignStatCd").kendoExtDropDownList({
            dataSource:arrSignStatCd
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
        });

        //양수자 고객등급(gradeCd)
        $("#gradeCd").kendoExtDropDownList({
            dataSource:gradeCodeList
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            ,optionLabel:" "
        });

        //양수자 고객등급(gradeCd)
        $("#receiveGradeCd").kendoExtDropDownList({
            dataSource:gradeCodeList
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            , optionLabel:" "
        });

        //양도사유코드.   trsfReasonCdList
        $("#trsfReasonCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:trsfReasonCdList
        });

        //양도양수관계코드.   trsfReceiveRelCd
        $("#trsfReceiveRelCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:trsfReceiveRelCdList
        });

        $("#sCardTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:cardTpList
            , index:0
        });

        //조회조건-소멸일 선택
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,value:new Date(year,month,'01')
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,value:new Date()
        });

        //버튼 - 상세
        $("#btnDetail").kendoButton({
            click:function(e){
                var grid = $("#transGrid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());

                if ( dms.string.isNotEmpty(selectedItem) ){
                    viewDetail(selectedItem.trsfReceiveSeq);
                } else {
                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }

            }
            ,enable:false
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e){

                var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
                tabStrip.select(0);

                // 초기화
                // 양도자 정보
                $("#trsfMembershipNo").val("");//멤버십 일련번호
                $("#gradeCd").data("kendoExtDropDownList").value("");//등급
                $("#hpNo").val("");//이동전화
                $("#ssnCrnNo").val("");//증서번호
                $("#custNm").val("");//고객명
                $("#vinNo").val("");//차대번호
                $("#usePoint").data("kendoExtNumericTextBox").value(0);//양도자 가용포인트
                $("#realTotAmt").data("kendoExtNumericTextBox").value(0);//양도자 충전가용금액
                // 양수자 정보
                $("#receiveMembershipNo").val("");//멤버십 일련번호
                $("#receiveGradeCd").data("kendoExtDropDownList").value("");//등급
                $("#receiveHpNo").val("");//이동전화
                $("#receiveSsnCrnNo").val("");//증서번호
                $("#receiveCustNm").val("");//고객명
                $("#receiveVinNo").val("");//차대번호
                $("#receiveUsePoint").data("kendoExtNumericTextBox").value(0);//양수자 가용포인트
                $("#receiveRealTotAmt").data("kendoExtNumericTextBox").value(0);//양수자 충전가용금액
                // 양도 & 양수 정보
                $("#trsfReceiveSeq").val("");//양도양수 일련번호
                $("#signDocNo").val("");//결재문서번호
                $("#trsfReasonCd").data("kendoExtDropDownList").value("");//양도사유
                $("#trsfReceiveRelCd").data("kendoExtDropDownList").value("");//관계
                $("#transReceivePointVal").data("kendoExtNumericTextBox").value(0);//양수자 양수포인트
                $("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").value(0);//양수자 양수포인트
                $("#trsfCardNo").data("kendoExtDropDownList").setDataSource([]);

                $("#trsfReasonCd").data("kendoExtDropDownList").enable(true);
                $("#trsfReceiveRelCd").data("kendoExtDropDownList").enable(true);
                $("#transReceivePointVal").data("kendoExtNumericTextBox").enable(true);
                $("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").enable(true);
                $("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").readonly(true);
                $("#trsfCardNo").data("kendoExtDropDownList").enable(true);

                $("#fileDocNo").val("");//첨부파일
                $("#fileGrid").data("kendoExtGrid").dataSource.data([]);//첨부파일 그리드 초기화
                $("#realAmtCardGrid").data("kendoExtGrid").dataSource.data([]);//충전카드 그리드 초기화
                $("#signLineGrid").data("kendoExtGrid").dataSource.data([]);// 결재 그리드 초기화

                $("#btnTransSave").show();
                $("#fileSelect").show();  // 파일찾기
                $("#fileDelete").show();  // 파일삭제

                viewDetail();
            }
        });

        //조회
        $("#btnSearch").kendoButton({
            click:function(e){

                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }

                $("#transGrid").data("kendoExtGrid").dataSource.page(1);
                $("#signLineGrid").data("kendoExtGrid").dataSource.data([]);
            }
        });

        //저장
        $("#btnTransSave").kendoButton({
            click:function(e){

                var flag = true;
                var params = {};

                params["sSignDocId"] = "CRM-0002";

                $.ajax({
                    url:"<c:url value='/cmm/apr/doc/selectDocLines.do' />"
                  , data:JSON.stringify(params)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(result) {
                        //정상적으로 반영 되었습니다.
                         if(result.total === 0){
                            dms.notification.info("<spring:message code='crm.info.plsCheckSIgnLine'/>");
                            flag = false;
                            return;
                        }
                    }
                });

                if(!flag){
                    return;
                }

                if(dms.string.isEmpty($("#trsfMembershipNo").val())){
                    // 양도자의 멤버십 번호를 선택해 주세요.
                    dms.notification.info("<spring:message code='crm.info.noTrsfMembershipNo'/>");
                    return;
                }

                if(dms.string.isEmpty($("#receiveMembershipNo").val())){
                    // 양수자의 멤버십 번호를 선택해 주세요.
                    dms.notification.info("<spring:message code='crm.info.noReceiveMembershipNo'/>");
                    return;
                }

                if($("#receiveMembershipNo").val() == $("#trsfMembershipNo").val()){
                 // 동일한 멤버십 번호에 양도/양수를 할 수 없습니다.
                    dms.notification.warning("<spring:message code='crm.info.sameMembershipNo'/>");
                    return;
                }

                if( dms.string.isEmpty($("#trsfReasonCd").val())){
                    // 양도사유을(를) 선택하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.trsfReasonCd' var='arguMsg' /><spring:message code='global.info.validation.select' arguments='${arguMsg}'/>");
                    return;
                }

                if( dms.string.isEmpty($("#trsfReceiveRelCd").val())){
                    // 관계(를) 선택하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.trsfReceiveRelCd' var='arguMsg' /><spring:message code='global.info.validation.select' arguments='${arguMsg}'/>");
                    return;
                }

                // form 데이터
                 var grid = $("#realAmtCardGrid").data("kendoExtGrid");
                 var rows = grid.tbody.find("tr");

                 //충전카드 양수Data Setting
                 var insertCardIssue = [];
                 //[TODO] 쿠폰사용이 N인것만 양도가능
                 rows.each(function(index, row) {
                     var dataItem = grid.dataItem(row);
                     if(!dms.string.isEmpty(dataItem.trsfRealAmtVal) && dataItem.trsfRealAmtVal > 0){
                         insertCardIssue.push({"dlrCd":dataItem.dlrCd
                             ,"trsfMembershipNo":dataItem.membershipNo
                             ,"trsfCardTpCd":"02"
                             ,"trsfCardNo":dataItem.cardNo
                             ,"trsfReceiveCardAmt":dataItem.trsfRealAmtVal
                           });
                     }
                 });

                 //[TODO] 양수.양도 금액이 있을경우 양수카드번호 체그해야함
                 if(insertCardIssue.length > 0 && dms.string.isEmpty($("#trsfCardNo").data("kendoExtDropDownList").value())){
                     // 양수카드번호을(를) 선택하여 주십시오.crm.info.membershipTransAllCheck
                     dms.notification.warning("<spring:message code='crm.lbl.trsfCardNo' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                     return;
                 }

                 if(0 == dms.string.defaultString($("#transReceivePointVal").data("kendoExtNumericTextBox").value(),0)
                         && 0 == dms.string.defaultString($("#trsfReceiveCardAmt").data("kendoExtNumericTextBox").value(),0)
                         ){

                     //멤버십 양도,양수는 양수포인트, 양수금액, 쿠폰 세가지중 한가지는 반드시 입력하여야 합니다.
                     dms.notification.warning("<spring:message code='crm.info.membershipTransAllCheck'/>");
                     return;
                 }

                var params = [];

                params.push(insertCardIssue);

                $.ajax({
                    url:"<c:url value='/crm/dmm/membershipTrans/insertMembershipTransTemp.do' />"
                    ,data:JSON.stringify({"insertCardIssue":insertCardIssue
                        ,"trsfMembershipNo":$("#trsfMembershipNo").val()
                        ,"receiveMembershipNo":$("#receiveMembershipNo").val()
                        ,"receiveMembershipNo":$("#receiveMembershipNo").val()
                        ,"pointVal":$("#transReceivePointVal").data("kendoExtNumericTextBox").value()
                        ,"trsfReasonCd":$("#trsfReasonCd").data("kendoExtDropDownList").value()
                        ,"trsfReceiveRelCd":$("#trsfReceiveRelCd").data("kendoExtDropDownList").value()
                        ,"receiveCardNo":$("#trsfCardNo").data("kendoExtDropDownList").text() //양수카드번호
                        ,"fileDocNo":$("#fileDocNo").val()
                        ,"signDocId":'CRM-0002'
                        ,"useYn":"Y"
                        })

                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        //console.log(jqXHR);
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(result){
                        //console.log(result);
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#transGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#transGrid").data("kendoExtGrid").dataSource.page(1);
                        closePopup();
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                }).done(function(result) {
                    //console.log("membershipTransPointVal Save Done!!!!");
                });
            }
        });

        //버튼 - 승인
        $("#btnApproval").kendoButton({
            click:function(e) {
                var tempUrl     = "";
                var saveData    = "";

                var lineGrid = $("#signLineGrid").data("kendoExtGrid");
                var selectedItem = lineGrid.dataItem(lineGrid.select());
                var signDocNo = selectedItem.signDocNo;

                if(selectedItem == null) {
                    // 결재선을(를) 선택하여 주십시오.
                    dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(selectedItem.signCont)){
                    // 화면 필수 체크(결재의견)
                    dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(signDocNo)){
                    // 화면 필수 체크(문서번호)
                    dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                var params = {};
                params["signDocNo"] = signDocNo;
                params["signCont"] = selectedItem.signCont;
                params["signDocId"] = selectedItem.signDocId;
                params["signDocLineNo"] = selectedItem.signDocLineNo;
                params["signStatCd"] = "03";
                params["signRsltCd"] = "04";
                params["lastSignYn"] = selectedItem.lastSignYn;
                //console.log("param : ",JSON.stringify(params));

                $.ajax({
                    url:"<c:url value='/crm/dmm/membershipTrans/updateSignLineEx.do' />"
                  , data:JSON.stringify(params)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                        $("#transGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#transGrid").data("kendoExtGrid").dataSource.page(1);
                        closePopup();

                    }
                  ,beforeSend:function(xhr) {
                      dms.loading.show($("#transWindow"));
                  }
                  ,complete:function(xhr, status) {
                      dms.loading.hide($("#transWindow"));
                  }
                });
            }
        });

        //버튼 - 반려
        $("#btnRollback").kendoButton({
            click:function(e) {

                var lineGrid = $("#signLineGrid").data("kendoExtGrid");
                var selectedItem = lineGrid.dataItem(lineGrid.select());
                var signDocNo = selectedItem.signDocNo;

                if(selectedItem == null) {
                    // 결재선을(를) 선택하여 주십시오.
                    dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(selectedItem.signCont)){
                    // 화면 필수 체크(결재의견)
                    dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(signDocNo)){
                    // 화면 필수 체크(문서번호)
                    dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                var params = {};

                params["signDocNo"] = signDocNo;
                params["signCont"] = selectedItem.signCont;
                params["signDocId"] = selectedItem.signDocId;
                params["signDocLineNo"] = selectedItem.signDocLineNo;
                params["signStatCd"] = "04";
                params["signRsltCd"] = "02";

                $.ajax({
                    url:"<c:url value='/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
                  , data:JSON.stringify(params)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                        $("#transGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#transGrid").data("kendoExtGrid").dataSource.page(1);
                        closePopup();
                    }
                  ,beforeSend:function(xhr) {
                      dms.loading.show($("#transWindow"));
                  }
                  ,complete:function(xhr, status) {
                      dms.loading.hide($("#transWindow"));
                  }
                });
            }
        });

        //양도/양수 그리드 설정
        $("#transGrid").kendoExtGrid({
            gridId:"G-CRM-0725-085506"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipTrans/selectMembershipTransMngs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCustNm"]       = $("#sCustNm").val();
                            params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sSignStatCd"]   = $("#sSignStatCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"trsfReceiveSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                ,trsfReceiveSeq:{type:"string"}
                                ,custNo:{type:"string"}
                                ,trsfMembershipNo:{type:"string"}
                                ,trsfCustNm:{type:"string"}
                                ,receiveMembershipNo:{type:"string"}
                                ,receiveCustNm:{type:"string"}
                                ,pointVal:{type:"number", validation:{required:true}} //양도 신청금액
                                ,trsfReceiveCardAmt:{type:"number", validation:{required:true}} //양수금액
                                //,val1:{type:"string"}
                                ,reqDt:{type:"date"}//심사신청일
                                ,signEndDt:{type:"date"} //심사완료일
                                ,reqUsrNm:{type:"string"} //신청자
                                ,signStatCd:{type:"string"} //심사상태
                                ,trsfReasonCd:{type:"string", validation:{required:true}} // 양도사유
                                ,trsfReceiveRelCd:{type:"string",  validation:{required:true}} // 관계
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,sortable:true
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,editable:false
            ,change:function(e){

                var selectedItem = this.dataItem(this.select());
                if( dms.string.isNotEmpty(selectedItem) ){
                    $("#btnDetail").data("kendoButton").enable(true);
                };

            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,sortable:true,attributes:{"class":"ac"}}//번호
               ,{field:"trsfCustNm", width:120,sortable:true, title:"<spring:message code='crm.lbl.trsfCust'/>"}             //양도회원
               ,{field:"receiveCustNm", width:120,sortable:true, title:"<spring:message code='crm.lbl.receiveCust'/>"}       //양수회원
               ,{field:"pointVal", title:"<spring:message code='crm.lbl.transReceivePointVal'/>"    //양수 포인트
                   ,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   ,decimal:0
                   ,width:80
                   ,sortable:true

               }
               ,{field:"trsfReceiveCardAmt", title:"<spring:message code='crm.lbl.trsfReceiveCardAmt'/>"    //양수금액
                   ,attributes:{"class":"ar"}
                   ,format:"{0:n2}"
                   ,decimal:0
                   ,width:80
                   ,sortable:true
               }
               ,{field:"trsfReasonCd", title:"<spring:message code='crm.lbl.trsfReasonCd'/>"                //양도양수 사유
                   ,width:120
                   ,sortable:true
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:trsfReasonCdList
                       });
                    }
                   ,template:'#if(trsfReasonCd !== ""){# #= trsfReasonCdMap[trsfReasonCd]# #}#'
               }
               ,{field:"trsfReceiveRelCd", title:"<spring:message code='crm.lbl.trsfReceiveRelCd'/>"        //관계
                   ,width:80
                   ,sortable:true
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:trsfReceiveRelCdList
                       });
                    }
                   ,template:'#if(trsfReceiveRelCd !== ""){# #= trsfReceiveRelCdMap[trsfReceiveRelCd]# #}#'
               }
               ,{field:"reqDt", title:"<spring:message code='crm.lbl.evalRequestDt'/>"                      //심사신청일
                   ,width:100
                   ,sortable:true
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"signStatCd", title:"<spring:message code='crm.lbl.evalStatus'/>"                    //심사상태
                   ,attributes:{"class":"ac"}
                   ,width:100
                   ,sortable:true
                   ,template:"# if(arrSignStatCdMap[signStatCd] != null) { # #= arrSignStatCdMap[signStatCd].cmmCdNm# # }#"
                       ,editor:function(container, options) {
                            $('<input required name="signStatCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:arrSignStatCd
                            });
                            $('<span class="k-invalid-msg" data-for="signStatCd"></span>').appendTo(container);
                       }
               }
               ,{field:"reqUsrNm", title:"<spring:message code='crm.lbl.requestUsrNm'/>",sortable:true,width:100}               //신청자
               ,{field:"signEndDt", title:"<spring:message code='crm.lbl.evalRequestEndDt'/>"           //심사완료일
                   ,attributes:{"class":"ac"}
                   ,width:100
                   ,sortable:true
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
            ]
        });

        //양도자 충전카드 그리드 설정
        $("#realAmtCardGrid").kendoExtGrid({
            gridId:"G-CRM-0803-195233"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipTrans/selectTransCards.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sMembershipNo"]    = $("#trsfMembershipNo").val();
                            params["sTrsfReceiveSeq"]    = $("#trsfReceiveSeq").val();

                            //console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"trsfReceiveSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}//딜러코드
                                ,membershipNo:{type:"string",editable:false}//멤버십 번호
                                ,cardTpCd:{type:"string",editable:false}//01:포인트, 02:충전
                                ,cardNo:{type:"string",editable:false}//카드번호
                                ,realTotAmt:{type:"number",editable:false} //실제 금액(가용포인트)
                                ,regDt:{type:"date",editable:false} //발급일 (카드등록일)
                                ,occrPointVal:{type:"string"}//충전금액
                                ,trsfRealAmtVal:{type:"number"} //양도금액
                            }
                        }
                }
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,pageable:false
            ,filterable:false
            ,height:258
            ,autoBind:false
            ,scrollable: {
                virtual: true
            }
            ,selectable:"row"
            ,edit:function(e){

                if (0 >= e.model.realTotAmt || dms.string.isNotEmpty($("#trsfReceiveSeq").val()) ) {
                    this.closeCell();   //충전카드의 가용금액이 없거나 상세조회인경우
                };

            }
            ,dataBound:function(e) {
                receiveGridSum();//양수자의  양수금액 셋팅
            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// no
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", hidden:true}// 멤버십번호
               ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>", hidden:true}//카드종류
               ,{field:"cardNo",width:120 , title:"<spring:message code='global.lbl.cardNo'/>"}//카드번호
               ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.realTotAmt'/>" //가용금액
                   ,attributes:{"class":"ar"}
                   ,format:"{0:n2}"
                   ,decimal:0
               }
               ,{field:"regDt", title:"<spring:message code='crm.lbl.occrDt'/>"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//발급일 (카드등록일)
               ,{field:"occrPointVal", title:"<spring:message code='crm.lbl.occrPointVal'/>", hidden:true}//충전금액
               ,{field:"trsfRealAmtVal", title:"<spring:message code='crm.lbl.trsfRealAmtVal'/>"//양도금액
                   ,attributes:{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"{0:n2}"
                           ,min:0
                           ,decimal:0
                           ,spinners:false
                           ,change:function(){

                               var grid = $("#realAmtCardGrid").data("kendoExtGrid"),
                               model = grid.dataItem(this.element.closest("tr"));

                               var realTotAmt = model.get("realTotAmt");
                               var trsfAmt = this.value();

                               if ( trsfAmt > realTotAmt ) {
                                   model.set("trsfRealAmtVal",0);
                               }else{
                                   model.set("trsfRealAmtVal",trsfAmt);
                               };

                               receiveGridSum();


                           }
                       });
                   }
               }
            ]
        });

        //그리드 설정
        $("#signLineGrid").kendoExtGrid({
            gridId:"G-CRM-0725-092202"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipTrans/selectSignLineExs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};
                            params["sSignDocNo"] = $("#signDocNo").val();
                            params["sSignDocId"] = "CRM-0002";
                            //console.log("aaa : ",kendo.stringify(params))
                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"signDocLineNo"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,signDocId:{type:"string", validation:{required:true}}
                            ,signDocLineNo:{type:"string",editable:false}
                            ,signTp:{type:"string", validation:{required:true}}
                            ,signUsrId:{type:"string", validation:{required:true}}
                            ,signUsrNm:{type:"string", validation:{required:true}}
                            ,signPstiCd:{type:"string", validation:{required:true}}
                            ,signPstiNm:{type:"string", validation:{required:true}}
                            ,signDeptCd:{type:"string", validation:{required:true}}
                            ,signDeptNm:{type:"string", validation:{required:true}}
                            ,signStatCd:{type:"string", editable:false}
                            ,signRsltCd:{type:"string", editable:false}
                            ,signDt    :{type:"date", editable:false}
                            ,signCont  :{type:"string"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,edit:function(e) { //그리드에서 수정하려고 들어가는 시점에서 화면 컨트롤
                var data = e.model;

                if ((data.signUsrId != "${userId}" || data.signStatCd != "02") &&
                    e.sender.columns[e.container.index()].field == "signCont") {
                    this.closeCell();
                }

                e.container.find("input[name=signCont]").keyup(function(){
                    $("#signCont").val($(this).val());
                });
            }
            ,change:function(e){
                var evalDs = this.dataSource;
                var iRowCnt = evalDs.total();
                var selectedItem = this.dataItem(this.select());

                for(var i = 0; i < iRowCnt; i++){
                    if(selectedItem.signUsrId == "${userId}" && selectedItem.signStatCd == "02"){
                        $("#btnApproval").data("kendoButton").enable(true);
                        $("#btnRollback").data("kendoButton").enable(true);
                        break;
                    }else{
                        $("#btnApproval").data("kendoButton").enable(false);
                        $("#btnRollback").data("kendoButton").enable(false);
                    }
                }
            }
            ,dataBound:function (e) { //그리드가 로딩된 후 화면컨트롤 할때 해야 하는 부분

                $("#btnApproval").data("kendoButton").enable(false);
                $("#btnRollback").data("kendoButton").enable(false);

            }
            ,multiSelectWithCheckbox:false
            ,editableOnlyNew:true
            ,editableOnlyNewExcludeColumns:["signCont"]
            ,height:365
            ,columns:[
                {field:"signDocId", hidden:true}
                ,{field:"signDocLineNo", title:"<spring:message code='crm.lbl.abbreviationForNumber' />", attributes:{"class":"ac"}}
                ,{field:"signRsltCd", title:"<spring:message code='global.lbl.result' />", attributes:{"class":"ac"}
                    ,template:"# if(arrSignProcCdMap[signRsltCd] != null) { # #= arrSignProcCdMap[signRsltCd].cmmCdNm# # }#"
                }
                ,{field:"signUsrNm", title:"<spring:message code='crm.lbl.prsNm' />", attributes:{"class":"ac"}
                }
                ,{field:"signCont", title:"<spring:message code='crm.lbl.cont' />", width:300 ,attributes:{"class":"al"}}
                ,{field:"taskNm", title:"<spring:message code='global.lbl.task' />", width:100, attributes:{"class":"ac"}
                    ,template:'#= fn_getTaskNm(signUsrId)#'
                }
                ,{field:"signDt", title:"<spring:message code='global.lbl.dateTime' />", width:125
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                }
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
             gridId:"G-CRM-0519-134802"
             ,dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                     },
                     parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["sFileDocNo"] = $("#fileDocNo").val();
                             //console.log("fileGrid:"+kendo.stringify(params));
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
            ,height:130
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,navigatable:false
            ,pageable:false
            ,sortable:false
            ,selectable:"multiple"
            ,filterable:false
            ,columns:[
                      {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                          ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                      }
                      ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                          ,attributes:{"class":"ar"}
                          ,template:"#= dms.string.formatFileSize(fileSize) #"
                      }
            ]
        });
        // 파일 그리드 종료 //
        /**************************************************************************
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


        // 결재목록에서 참조문서보기 클릭해서 파라미터가지고 페이지 조회한경우 상세조회 팝업을 열어준다
        <c:if test="${trsfReceiveSeq > 0}">
            viewDetail("${trsfReceiveSeq}");
        </c:if>

    }); /* end ready */


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
             ,draggable:true
             ,visible:false
             ,resizable:false
             ,modal:false
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

         //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

         $("#progressWindow").data("kendoWindow").close();
         r.files = [];
         $(".resumable-list").html("");
     });
     r.on('fileSuccess', function(file, message) {
         //console.log("===============");
         //console.log(message);

         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo:result.fileDocNo
                 ,fileNo:result.fileNo
                 ,fileNm:result.fileNm
                 ,fileSize:result.fileSize
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
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
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
**************************파일업로드1********************************************
***************************************************************************-->


<!-- 금융관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.fincInfoMng' /></h1>    <!-- 금융관리 -->
        <div class="btn_right">
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
            <button type="button" id="btnSearch" type="button"class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.requestStat' /></th><!-- 신청상태 -->
                    <td>
                        <input id="sFincStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th><!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartFincReqDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndFincReqDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fincCmp' />/<spring:message code='sal.lbl.bank' /></th><!-- 금융사/은행 -->
                    <td>
                        <input id="sFincCmpCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>   <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</section>
<!-- // 금융관리 -->

<!-- 贷款申请信息 -->
<section id="callFincInfoMngWindow" class="pop_wrap">
<form id="fincForm" name="fincForm" method="POST">

<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.fincAskInfo' /></h2><!-- 대출신청정보 -->
        <div class="btn_right">
            <button type="button" id="btnSave" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>  <!-- 저장 -->
        </div>
    </div>
    <div class="table_form">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.requestInfo' /></th><!-- 신청번호 -->
                    <td>
                        <input id="fincNo" name="fincNo" type="text" readonly class="form_input form_disabled" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th><!-- 신청일자 -->
                    <td>
                        <input id="fincReqDt" readonly class="form_datepicker form_disabled">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.requestStat' /></th><!-- 신청상태 -->
                    <td>
                        <input id="fincStatCd" readonly class="form_comboBox form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                    <td>
                        <input id="contractNo" type="text" readonly class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.regUsrId' /></th><!-- 등록자 -->
                    <td>
                        <input id="regUsrId" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.regDt' /></th><!-- 등록일 -->
                    <td>
                        <input id="regDt" disabled class="form_datepicker form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.updtUsrId' /></th><!-- 수정자 -->
                    <td>
                        <input id="updtUsrId" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.updtDt' /></th><!-- 수정일 -->
                    <td>
                        <input id="updtDt" disabled class="form_datepicker form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 贷款申请信息(대출신청정보)  -->

<!-- 车辆信息(차량정보) -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2><!-- 차량정보 -->
    </div>
    <div class="table_form">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="vinNo" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="carlineNm" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="modelNm" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>   <!-- OCN -->
                    <td>
                        <input id="ocnNm" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="extColorNm" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="intColorNm" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="carRegNo" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                    <td>
                        <input id="contractNo2" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.enginNo' /></th><!-- 엔진번호 -->
                    <td>
                        <input id="enginNo" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.certNo' /></th><!-- 합격증번호 -->
                    <td>
                        <input id="certNo" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 车辆信息  -->

<!-- 车主信息 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.carOwnInfo' /></h2><!-- 차량소유자정보 -->
    </div>
    <div class="table_form">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.publNm' /></th><!-- 영수증발행명 -->
                    <td>
                        <input id="publNm" name="publNm" type="text" class="form_input" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.telNo' /></th><!-- 전화번호 -->
                    <td>
                        <input id="telNo1" name="telNo1" type="text" class="form_input" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th><!-- 신분증유형 -->
                    <td id="custTp_01">
                        <input id="mathDocTp_01" readonly class="form_comboBox form_disabled">
                    </td>
                    <td id="custTp_02" style="display:none">
                        <input id="mathDocTp_02" readonly class="form_comboBox form_disabled">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.perPapaerNo' /></th><!-- 신분증번호 -->
                    <td>
                        <input id="ssnCrnNo" type="text" readonly class="form_input form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 车主信息(차량소유주정보)  -->

<!-- 贷款申请信息(대출신청정보) -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.fincAskInfo' /></h2><!-- 대출신청정보 -->
    </div>
    <div class="table_form">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.fincReqAmt' /></th><!-- 대출금액 -->
                    <td>
                        <input id="fincReqAmt" readonly class="form_numeric form_disabled" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fincRpayPrids' /></th><!-- 대출기간 -->
                    <td>
                        <input id="fincRpayPrid" type="text" readonly class="form_input form_disabled" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fincLoanFeeAmt' /></th><!-- 대출서비스수수료 -->
                    <td>
                        <input id="fincLoanFeeAmt" readonly class="form_numeric" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.fincItemKindCd" /></th>   <!-- 상품관리유형 -->
                    <td>
                        <input id="fincItemKindCd" readonly type="text" class="form_comboBox form_disabled"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fincCmp' />/<spring:message code='sal.lbl.bank' /></th><!-- 금융사/은행 -->
                    <td>
                        <input id="fincCmpCd" readonly class="form_comboBox form_disabled" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincItem' /></th><!-- 금융상품 -->
                    <td colspan="4">
                        <input id="fincItemCd" type="text" readonly class="form_comboBox form_disabled" style="width:36%;">
                        <button type="button" class="btn_xs" onclick="bf_clickEstimate()"><spring:message code='ser.lbl.estimate' /></button>   <!-- 견적 -->
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 贷款申请信息  -->

<!-- 贷款办理进度(대출처리진척) -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.fincResult' /></h2><!-- 대출처리진척 -->
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.reqDataCollcEndYn' /></th><!-- 신청자료 제출여부 -->
                    <td>
                        <input id="reqDataCollcEndYn" type="checkbox" value="N" class="form_check">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.cltrLoanStatCd' /></th><!-- 대출심사결과대기중 -->
                    <td>
                        <input id="cltrLoanStatCd" type="checkbox" value="N" class="form_check">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.loanAgreeStatCd' /></th><!-- 은행에서 돈 송금통지함 -->
                    <td>
                        <input id="loanAgreeStatCd" type="checkbox" value="N" class="form_check">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.loanYn' /></th><!-- 차량인도 -->
                    <td>
                        <input id="loanYn" type="checkbox" value="N" class="form_check">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 贷款办理进度  -->

<!-- 附件 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.lbl.attachedFile' /></h2><!-- 첨부파일 -->
        <div class="btn_right">
            <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
            <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="fileGrid"></div>
    </div>
</section>
<!-- // 附件  -->

<!-- hidden값  -->
<span style="display:none">
    <!-- 고객유형 -->
    <input id="custTp" />

    <!-- 파일업로드 -->
    <input type="hidden" id="fileDocId" name="fileDocId" data-json-obj="true" />

    <!-- 저장 후 선택될 금융관리번호 -->
    <input id="savedfincNo" />

    <!-- 대출비율 -->
    <input id="fincLoanRate" />

</span>

</form>
</section>


<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

//금융신청상태:SAL042
var fincStatList = [];
var fincStatObj = {};
<c:forEach var="obj" items="${fincStatCdDS}">
    fincStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    fincStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//금융사:SAL055
var fincCmpList = [];
var fincCmpObj = {};
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    fincCmpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//금융상품:SA_0117T
var fincItemObj = {};
<c:forEach var="obj" items="${fincItemDS}">
    if(fincItemObj.hasOwnProperty("${obj.fincCmpCd}")){
        fincItemObj["${obj.fincCmpCd}"].push({cmmCd:"${obj.fincItemCd}", cmmCdNm:"${obj.fincItemNm}"});
    }else{
        fincItemObj["${obj.fincCmpCd}"] = [];
        fincItemObj["${obj.fincCmpCd}"].push({cmmCd:"${obj.fincItemCd}", cmmCdNm:"${obj.fincItemNm}"});
    }
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//주요인증문서유형(신분증유형):CRM024
var ssnCrnTpPList = [];        // remark1 - P:개인
var ssnCrnTpCList = [];        // remark1 - C:법인
<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//금융상품관리유형 SAL160
var fincItemKindCdList = [];
<c:forEach var="obj" items="${fincItemKindCdDS}">
  fincItemKindCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>


var popupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callFincInfoMngWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.fincProductMngt' />"      // 금융상품관리
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");

    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                fn_GridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            if( ($("#sStartFincReqDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndFincReqDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sEndFincReqDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartFincReqDt").data("kendoExtMaskedDatePicker").value() == null)){
                //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
              }

              $('#grid').data('kendoExtGrid').dataSource.read();
              refreshAll();
              fn_btnState();  // 버튼상태

        }
    });
    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){
            //저장 하시겠습니까?
            if(confirm("<spring:message code='cmm.info.saveYn' />")){
                save();
            }
        }
    });

    //버튼 - 파일삭제
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

   // 신청상태
   $("#sFincStatCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincStatList
      ,optionLabel:" "
   });


   // 신청일자 시작일
   $("#sStartFincReqDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });

   // 신청일자 종료일
   $("#sEndFincReqDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:lastDay
   });

   // 신청 시작일은 신청 종료일보다 클수가 없다.
   $("#sStartFincReqDt").on('change', {from:$("#sStartFincReqDt"), to:$("#sEndFincReqDt")}, fnChkSearchDate);
   $("#sEndFincReqDt").on('change', {from:$("#sStartFincReqDt"), to:$("#sEndFincReqDt")}, fnChkSearchDate);

   // 금융사/은행
   $("#sFincCmpCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincCmpList
      ,optionLabel:" "
   });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/fim/fincInfoMng/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/fim/fincInfoMng/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/fim/fincInfoMng/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/fim/fincInfoMng/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 신청일자
    $("#fincReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
    });
    $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(false);

    // 신청상태
   $("#fincStatCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincStatList
      ,optionLabel:" "
   });
   $("#fincStatCd").data("kendoExtDropDownList").enable(false);

   // 등록일자
   $("#regDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#regDt").data("kendoExtMaskedDatePicker").enable(false);

   // 수정일자
   $("#updtDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#updtDt").data("kendoExtMaskedDatePicker").enable(false);

   // 개인:신분증유형
   $("#mathDocTp_01").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ssnCrnTpPList
      ,optionLabel:" "
   });
   $("#mathDocTp_01").data("kendoExtDropDownList").enable(false);

   // 법인:법인유형
   $("#mathDocTp_02").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ssnCrnTpCList
      ,optionLabel:" "
   });
   $("#mathDocTp_02").data("kendoExtDropDownList").enable(false);

   // 대출금액
   $("#fincReqAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
    });
    $("#fincReqAmt").data("kendoExtNumericTextBox").enable(false);

    // 대출수수료
    $("#fincLoanFeeAmt").kendoExtNumericTextBox({
         format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        //,min:0.00
        ,value:0.00
        ,spinners:false             // 증,감 화살표
     });
    $("#fincLoanFeeAmt").data("kendoExtNumericTextBox").enable(false);

    // 금융상품종류
    $("#fincItemKindCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:fincItemKindCdList
       ,index:0
    });
    $("#fincItemKindCd").data("kendoExtDropDownList").enable(false);

    //금융사
    $("#fincCmpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:fincCmpList
       ,optionLabel:" "   // 전체
    });
    $("#fincCmpCd").data("kendoExtDropDownList").enable(false);

    // 금융상품
    $("#fincItemCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[]
       ,optionLabel:" "
    });
    $("#fincItemCd").data("kendoExtDropDownList").enable(false);

    // 금융사 change 이벤트
    $("#fincCmpCd").on("change", function (){
        if(!dms.string.isEmpty(fincItemObj[$(this).data("kendoExtDropDownList").value()])){
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[$(this).data("kendoExtDropDownList").value()]);
        }else{
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource([]);
        }
    });


    fn_btnState();

    // 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113336"        // 그리드 - 모듈명 - 월일 - 시분초
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/fim/fincInfoMng/selectFincInfoMngSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        // vin no
                        params["sVinNo"] = $("#sVinNo").val();
                        // 신청상태
                        params["sFincStatCd"] = $("#sFincStatCd").data("kendoExtDropDownList").value();
                        // 신청일자
                        params["sStartFincReqDt"] = $("#sStartFincReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndFincReqDt"]   = $("#sEndFincReqDt").data("kendoExtMaskedDatePicker").value();
                        //금융사
                        params["sFincCmpCd"] = $("#sFincCmpCd").data("kendoExtDropDownList").value();
                        // 차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        // 모델
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                        // OCN
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                        // 외장색
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                        // 내장색
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                        params["sFincNo"] = $("#savedfincNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"contractNo",
                    fields:{
                         dlrCd         :{type:"string", editable:false} // 딜러코드
                        ,regUsrNm      :{type:"string"}                 // 등록인
                        //담당자
                        ,fincStatCd    :{type:"string"}                 // 신청상태
                        ,publNm        :{type:"string"}                 // 발행명칭
                        ,vinNo         :{type:"string"}                 // VIN NO
                        ,fincCmpCd     :{type:"string"}                 // 금융사/은행
                        ,fincReqAmt    :{type:"number"}                 // 대출금액
                        ,fincRpayPrid  :{type:"number"}                 // 상환기간
                        ,fincNo        :{type:"string"}                 // 대출번호
                        ,fincReqDt     :{type:"date"}                   // 신청일자
                        ,updtDt        :{type:"date"}                   // 수정일자
                    }
                }
            }
        }
        ,dataBound:function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var saveFincNo = $("#savedfincNo").val();

            if(saveFincNo != ""){
                var rows = e.sender.tbody.children()
                  , grid = $("#grid").data("kendoExtGrid")
                  , selectRow;

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.fincNo == saveFincNo){
                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                        grid.select(selectRow);
                        //fn_GridDBclick(dataItem);
                    }
                });
            }
            $("#savedfincNo").val("");      // 초기화
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       //,pageable:false
       ,pageable:{
           refresh:true
           ,pageSize:20
           ,pageSizes:[ "20", "40", "80", "100"]
       }
       ,height:435
       ,editable   :false
       ,resizable:true
       ,autoBind:true
       ,selectable:"row"
       ,navigatable:true
       //,sortable:false
       //,edit:onEditMainCd
       ,columns:[
          {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
          ,{field:"regUsrNm", title:"<spring:message code='sal.lbl.regUsrNm' />", attributes:{"class":"ac"}, width:120}  //등록인
          ,{field:"user", title:"<spring:message code='global.lbl.prsNm' />", attributes:{"class":"ac"}, width:100}      //담당자:TOBE - 김은수부장 추후 알려준다고 함.
          ,{
              field:"fincStatCd", title:"<spring:message code='sal.lbl.requestStat' />", attributes:{"class":"ac"}, width:120
              , template:"#= dms.string.strNvl(fincStatObj[fincStatCd]) #"
          }                 //신청상태
          ,{field:"publNm", title:"<spring:message code='sal.lbl.publNm' />", attributes:{"class":"al"}, width:100}        //영수증발행명
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"ac"}, width:100}       // VIN NO
          ,{
              field:"fincCmpCd", title:"<spring:message code='global.lbl.fincCmp' />/<spring:message code='sal.lbl.bank' />", attributes:{"class":"al"}, width:100
              , template:"#= dms.string.strNvl(fincCmpObj[fincCmpCd]) #"
          }                 //금융사/은행
          ,{
              field:"fincReqAmt", title:"<spring:message code='sal.lbl.fincReqAmt' />", attributes:{"class":"ar"}, width:100
              , format:"{0:n2}"
          }  //대출금액

          ,{
              field:"fincRpayPrid", title:"<spring:message code='sal.lbl.fincRpayPrid' />", attributes:{"class":"ar"}, width:100
              , format:"{0:n0}"
          }                 //상환기간
          ,{field:"fincNo", title:"<spring:message code='sal.lbl.fincNo' />", attributes:{"class":"al"}, width:130}   //대출번호
          ,{
              field:"fincReqDt", title:"<spring:message code='sal.lbl.reqDt' />", attributes:{"class":"ac"}, width:80
              , format:"{0:"+vDtyyyyMMdd+"}"
          }                 //신청일자
          ,{
              field:"updtDt", title:"<spring:message code='global.lbl.updtDt' />", attributes:{"class":"ac"}, width:80
              , format:"{0:"+vDtyyyyMMdd+"}"
          }                 //수정일자
       ]
   });

   // 그리드 더블클릭.
   $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       fn_GridDBclick(selectedItem);
       viewDetailPopup();
   });

   // 그리드 더블클릭.
   fn_GridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){
           $("#fincNo").val(selectedItem.fincNo);
           $("#fincReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincReqDt);
           $("#fincStatCd").data("kendoExtDropDownList").value(selectedItem.fincStatCd);
           fn_btnState(selectedItem.fincStatCd);
           $("#contractNo").val(selectedItem.contractNo);
           $("#regUsrId").val(selectedItem.regUsrId);
           $("#regDt").data("kendoExtMaskedDatePicker").value(selectedItem.regDt);
           $("#updtUsrId").val(selectedItem.updtUsrId);
           $("#updtDt").data("kendoExtMaskedDatePicker").value(selectedItem.updtDt);
           $("#vinNo").val(selectedItem.vinNo);
           $("#carlineNm").val(selectedItem.carlineNm);
           $("#modelNm").val(selectedItem.modelNm);
           $("#ocnNm").val(selectedItem.ocnNm);
           $("#extColorNm").val(selectedItem.extColorNm);
           $("#intColorNm").val(selectedItem.intColorNm);
           $("#carRegNo").val(selectedItem.carRegNo);
           $("#contractNo2").val(selectedItem.contractNo);
           $("#enginNo").val(selectedItem.enginNo);
           $("#certNo").val(selectedItem.certNo);
           $("#publNm").val(selectedItem.publNm);
           $("#telNo1").val(selectedItem.telNo1);

           $("#custTp").val(selectedItem.custTp);
           if(selectedItem.custTp == "02"){
               $("#custTp_01").hide();
               $("#custTp_02").show();
               $("#mathDocTp_02").data("kendoExtDropDownList").value(selectedItem.mathDocTp);
               $("#mathDocTp_01").data("kendoExtDropDownList").value('');
           }else{
               $("#custTp_01").show();
               $("#custTp_02").hide();
               $("#mathDocTp_01").data("kendoExtDropDownList").value(selectedItem.mathDocTp);
               $("#mathDocTp_02").data("kendoExtDropDownList").value('');
           }
           $("#ssnCrnNo").val(selectedItem.ssnCrnNo);
           $("#fincReqAmt").data("kendoExtNumericTextBox").value(selectedItem.fincReqAmt);
           $("#fincRpayPrid").val(selectedItem.fincRpayPrid);
           $("#fincLoanFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.fincLoanFeeAmt);
           $("#fincItemKindCd").data("kendoExtDropDownList").value(selectedItem.fincItemKindCd != null ? selectedItem.fincItemKindCd:"01");
           $("#fincCmpCd").data("kendoExtDropDownList").value(selectedItem.fincCmpCd);
           $("#fincCmpCd").change();
           $("#fincItemCd").data("kendoExtDropDownList").value(selectedItem.fincItemCd);
           $("#fincLoanRate").val(Number(selectedItem.fincLoanRate));
           $("#reqDataCollcEndYn").prop('checked', selectedItem.reqDataCollcEndYn == "Y" ? true:false);
           $("#loanAgreeStatCd").prop('checked', selectedItem.loanAgreeStatCd == "Y" ? true:false);
           $("#loanYn").prop('checked', selectedItem.loanYn == "Y" ? true:false);
           $("#cltrLoanStatCd").prop('checked', selectedItem.cltrLoanStatCd == "Y" ? true:false);
           /* 첨부파일 */
           $("#fileDocId").val(selectedItem.fileDocId);    // 파일 문서 번호
           $("#fileGrid").data("kendoExtGrid").dataSource.read();
       }
   }

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
                       params["sFileDocNo"] = $("#fileDocId").val();

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
      ,change:function(e){
          var dataItem = this.dataItem(this.select());

          if(dms.string.isNotEmpty(dataItem)){
              dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
          }
      }
      ,autoBind:false
      ,editable:false
      ,height:80
      ,multiSelectWithCheckbox:true
      ,navigatable:false
      ,pageable:false
      ,resizable:false
      ,sortable:false
      //,selectable:"row"
      ,columns:[
          {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
         ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
         ,{title:""}

      ]
   });
   // 파일 그리드 종료 //

});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
* 함수영역 - start
******************************************/

//상세내용 팝업 호출
function viewDetailPopup(){
    var win = $("#callFincInfoMngWindow").data("kendoWindow").center().open();
}


//초기화
function refreshAll() {

    $("#fincNo").val('');
    $("#fincReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#fincStatCd").data("kendoExtDropDownList").value('');
    $("#contractNo").val('');
    $("#regUsrId").val('');
    $("#regDt").data("kendoExtMaskedDatePicker").value('');
    $("#updtUsrId").val('');
    $("#updtDt").data("kendoExtMaskedDatePicker").value('');
    $("#vinNo").val('');
    $("#carlineNm").val('');
    $("#modelNm").val('');
    $("#ocnNm").val('');
    $("#extColorNm").val('');
    $("#intColorNm").val('');
    $("#carRegNo").val('');
    $("#contractNo2").val('');
    $("#enginNo").val('');
    $("#certNo").val('');
    $("#publNm").val('');
    $("#telNo1").val('');

    $("#custTp").val('');
    $("#custTp_01").show();
    $("#custTp_02").hide();
    $("#mathDocTp_01").data("kendoExtDropDownList").value('');
    $("#mathDocTp_02").data("kendoExtDropDownList").value('');

    $("#ssnCrnNo").val('');
    $("#fincReqAmt").data("kendoExtNumericTextBox").value(0);
    $("#fincRpayPrid").val('');
    $("#fincLoanFeeAmt").data("kendoExtNumericTextBox").value(0);
    $("#fincItemKindCd").data("kendoExtDropDownList").select(0);
    $("#fincCmpCd").data("kendoExtDropDownList").value('');
    $("#fincCmpCd").change();
    $("#fincItemCd").data("kendoExtDropDownList").value('');
    $("#fincLoanRate").val('0');
    $("#reqDataCollcEndYn").prop('checked', false);
    $("#loanAgreeStatCd").prop('checked', false);
    $("#loanYn").prop('checked', false);
    $("#cltrLoanStatCd").prop('checked', false);

    /* 첨부파일 */
    $("#fileDocId").val('');    // 파일 문서 번호
    $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
}

//검색조건
function reSearch(FincNo){
    $("#sVinNo").val('');
    $("#sFincStatCd").data("kendoExtDropDownList").value('');
    $("#sStartFincReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#sEndFincReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#sFincCmpCd").data("kendoExtDropDownList").value('');
    $("#sCarlineCd").data("kendoExtDropDownList").value('');
    $("#sModelCd").data("kendoExtDropDownList").value('');
    $("#sOcnCd").data("kendoExtDropDownList").value('');
    $("#sExtColorCd").data("kendoExtDropDownList").value('');
    $("#sIntColorCd").data("kendoExtDropDownList").value('');

    if(typeof(FincNo) != "undefined"){
        $("#savedfincNo").val(FincNo);
    }else{
        $("#savedfincNo").val("");
    }
}

/**
 * 버튼 상태관리
 */
function fn_btnState(state){
    if(state == ""){ state = "01"; }
    switch(state){
        case '01':
            $("#btnSave").data("kendoButton").enable(true);

            $("#fileSelect").show();
            $("#fileDelete").show();
            break;
        default :
            $("#btnSave").data("kendoButton").enable(false);

            $("#fileSelect").hide();
            $("#fileDelete").hide();
            break;
    }
}


/** 무결성 검사 **/
function save_Validate(){

    if($("#fincNo").val() == "" ){
        // 신청번호를 선택하여 주세요.
        dms.notification.warning("<spring:message code='global.lbl.applNumber' var='globalLblApplNumber' /><spring:message code='global.info.check.field' arguments='${globalLblApplNumber}' />");
        return false;
    }

    if( $("#publNm").val() == ""){
        // {영수증발행명}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.publNm' var='salLblPublNm' /><spring:message code='global.info.check.field' arguments='${salLblPublNm}' />");
        return false;
    }

    if( $("#telNo1").val() == ""){
        // {전화번호}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.telNo' var='globalLblTelNo' /><spring:message code='global.info.check.field' arguments='${globalLblTelNo}' />");
        return false;
    }

    return true;
}

/*********
 * 저장
 *********/
function save(){

    /** 무결성 검사 **/
    if( !save_Validate() ){
       return false;
    }

    var param = $("#fincForm").serializeObject($("#fincForm").serializeArrayInSelector("[data-json-obj='true']"));
    param.reqDataCollcEndYn = $("#reqDataCollcEndYn").prop('checked') == true ? "Y":"N";
    param.loanAgreeStatCd   = $("#loanAgreeStatCd").prop('checked') == true ? "Y":"N";
    param.loanYn            = $("#loanYn").prop('checked') == true ? "Y":"N";
    param.cltrLoanStatCd    = $("#cltrLoanStatCd").prop('checked') == true ? "Y":"N";

    $.ajax({
        url:"<c:url value='/sal/fim/fincInfoMng/multiFincInfo.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success:function(jqXHR, textStatus) {
            var grid = $("#grid").data("kendoExtGrid");
            refreshAll();
            reSearch(jqXHR);                    // 조회조건 세팅
            grid.dataSource.read();
            $("#callFincInfoMngWindow").data("kendoWindow").close();

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });

}

//검색조건:신청일자의 시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    //if(dms.string.isEmpty($(this).val())){return;}
    if(dms.string.isEmpty(e.data.from.val())){return;}
    if(dms.string.isEmpty(e.data.to.val())){return;}

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}


// 견적 버튼 클릭
bf_clickEstimate = function (){

    if($("#fincNo").val() == "" ){
        // 신청번호를 선택하여 주세요.
        dms.notification.warning("<spring:message code='global.lbl.applNumber' var='globalLblApplNumber' /><spring:message code='global.info.check.field' arguments='${globalLblApplNumber}' />");
        return false;
    }

    /*
    // 인터페이스완성되면, 해당 주석만 풀어서 사용할것.
    popupWindow = dms.window.popup({
        windowId:"fincInfoItemPopup"
        , title:"<spring:message code='sal.title.fincEstimate' />"   // 금융상품 견적
        , content:{
            url:"<c:url value='/sal/fim/fincInfoMng/selectfincEstimatePopup.do' />"
            , data:{
                "autoBind":false
                , "type"  :null
                , "fincNo":$("#fincNo").val()
                , "fincItemNm":$("#fincItemCd").data("kendoExtDropDownList").text()        // 상품
                , "fincReqAmt":$("#fincReqAmt").data("kendoExtNumericTextBox").value()       // 대출금액
                , "fincRpayPrid":$("#fincRpayPrid").val()                                 // 대출기간
                , "fincLoanRate":$("#fincLoanRate").val()                                 // 대출비율
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        //console.log(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
    */

    // 임시 화면
    popupWindow = dms.window.popup({
        windowId:"fincInfoItemPopup"
        , title:"<spring:message code='sal.title.fincEstimate' />"   // 금융상품 견적
        , height:600
        , content:{
            url:"https://m.bhaf-bhmc.com.cn/buy/calculator"
        }
    });

}


/* *************************************************************************
**************************파일업로드3********************************************
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

    if (dms.string.isEmpty($("#fileDocId").val())) {
        $.ajax({
            url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
            dataType:"json",
            type:"get",
            async:false,
            cache:false,
            success:function(id) {
                _that.opt["query"]["resumableSessionId"] = id;
                $("#fileDocId").val(id);
            }
        });
    } else {
        _that.opt["query"]["resumableSessionId"] = $("#fileDocId").val();
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
**************************파일업로드3****************************************
***************************************************************************/

/******************************************
* 함수영역 - end
******************************************/

//-->
</script>
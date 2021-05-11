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

<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.membershipTransReg"/></h1><!-- 멤버십 양도신청 등록  -->
        <div class="btn_right">

        </div>
    </div>
<div id="transForm" name="transForm" onsubmit="return false;">
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.trsfCust"/></h2> <!-- 양도자 -->
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
                            <th scope="row"><spring:message code='global.lbl.membershipNo'/></th><!-- 멤버십번호 -->
                            <td>
                                <div class="form_search">
                                    <input id="membershipNo" name="membershipNo" class="form_input" placeholder="<spring:message code='crm.lbl.trsfMembershipSeq'/>" data-json-obj='true' disabled="disabled">
                                    <a href="javascript:;"  id="membershipSearch" ><spring:message code='crm.lbl.trsfMembershipSeq'/></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.gradeCd'/></th><!-- 등급 -->
                            <td class="readonly_area">
                                <input id="gradeCd" name="gradeCd" class="form_comboBox" readonly="readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                            <td>
                                <input type="text" id="custNm" name="custNm" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.vinNum'/></th><!-- VINNO -->
                            <td>
                                <input type="text" id="vinNo" name="vinNo" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                        </tr>
                        <tr>

                            <th scope="row"><spring:message code='global.lbl.hpNo'/></th><!-- 휴대전화 -->
                            <td>
                                <input type="text" id="hpNo" name="hpNo" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.homeTelNo'/></th><!-- 집전화 -->
                            <td>
                                <input type="text" id="telNo" name="telNo" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th><!-- 신분증 유형 -->
                            <td class="readonly_area">
                                <input id="mathDocTp" name="mathDocTp" class="form_comboBox" readonly="readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th><!-- 신분증 번호 -->
                            <td>
                                <input id="ssnCrnNo" name="ssnCrnNo"  readonly="readonly" class="form_input form_readonly" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </section>


    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.receiveCust"/></h2> <!-- 양수자 -->
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
                            <th scope="row"><spring:message code='crm.lbl.receiveMembershipNo'/></th><!-- 양수 멤버십번호 -->
                            <td>
                                <div class="form_search">
                                    <input type="text" id="receiveMembershipNo" name="receiveMembershipNo" class="form_input" data-json-obj='true' placeholder="<spring:message code='crm.lbl.receiveMembershipNo'/>" disabled="disabled">
                                    <a href="javascript:;"  id="receiveMembership" ><spring:message code='crm.lbl.receiveMembershipNo'/></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.gradeCd'/></th><!-- 등급 -->
                            <td class="readonly_area">
                                <input id="receiveGradeCd" name="receiveGradeCd" readonly="readonly" class="form_comboBox"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                            <td>
                                <input type="text" id="receiveCustNm" name="receiveCustNm" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.vinNum'/></th><!-- VIN -->
                            <td>
                                <input type="text" id="receiveVinNo" name="receiveVinNo" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.hpNo'/></th><!-- 휴대전화 -->
                            <td>
                                <input type="text" id="receiveHpNo" name="receiveHpNo" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.homeTelNo'/></th><!-- 집전화 -->
                            <td>
                                <input type="text" id="receiveTelNo" name="receiveTelNo" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th><!-- 신분증 유형 -->
                            <td class="readonly_area">
                                <input id="receiveMathDocTp" name="receiveMathDocTp" class="form_comboBox" readonly="readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th><!-- 신분증 번호 -->
                            <td>
                                <input id="receiveSsnCrnNo" name="receiveSsnCrnNo" type="text" class="form_input form_readonly" readonly="readonly"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </section>

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.title.transInfo"/></h2> <!-- 양도 정보 -->
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
                            <th scope="row"><spring:message code='crm.lbl.usePoint'/></th><!-- 가용포인트 -->
                            <td>
                                <input  id="usePoint" name="usePoint" class="form_numeric ar form_readonly" readonly="readonly">
                                <input  type="hidden" id="cardNo" name="cardNo" class="form_input" data-json-obj="true">
                                <input  type="hidden" id="fileDocNo" name="fileDocNo" class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.pointVal'/></span></th><!-- 양도신청포인트 -->
                            <td>
                                <input type="text" id="pointVal" name="pointVal" class="form_numeric ar" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.trsfReasonCd'/></span></th><!-- 양도사유 -->
                            <td>
                                <input id="trsfReasonCd" name="trsfReasonCd"  class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.trsfReceiveRelCd'/></span></th><!-- 관계 -->
                            <td>
                                <input id="trsfReceiveRelCd" name="trsfReceiveRelCd"  class="form_comboBox" data-json-obj="true" />
                            </td>
                        </tr>
                        <%-- <tr>

                            <th scope="row"><span class="bu_required"><spring:message code='global.title.signInfo'/></span></th><!-- 결재선택(결재정보) -->
                            <td colspan="3">
                                <input id="signDocNo" name="signDocNo" class="form_input" style="width:85%" data-json-obj="true">
                                <span class="btn_file"><spring:message code='global.title.signLine'/> </span> <!-- 결재선 -->
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='global.title.document'/>(<spring:message code='global.title.reqFormPrint'/>)</span></th><!-- 문서(신청서프린트) -->
                            <td colspan="3">
                                <input id="fileDocNo" name="fileDocNo" class="form_input" data-json-obj="true">
                            </td>
                        </tr> --%>
                    </tbody>
                </table>
            </div>
    </section>

    <!-- *************************************************************************
**************************파일업로드2:그리드 추가 html 추가 *********************
***************************************************************************-->
            <!-- 첨부파일 -->
            <section class="group">
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h3>
                    <div class="btn_right">
                        <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                        <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                    </div>
                </div>

                <div class="table_grid">
                    <div id="fileGrid">
                    </div>
                </div>

            </section>
            <!-- //첨부파일 -->
<!-- *************************************************************************
**************************파일업로드2:그리드 추가 html 추가 *********************
***************************************************************************-->

    </div>
</section>



<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    //1.등급적용기준 콤보 DataSource
    /* var gradeCodeList = [{"gradeSeq":"", "gradeNm":""}];
    <c:forEach var="obj" items="${gradeCodeList}">
    gradeCodeList.push({
     "gradeSeq":"${obj.gradeSeq}"
     ,"gradeNm":"${obj.gradeNm}"
     });
    </c:forEach>
    var gradeCodeListMap = dms.data.arrayToMap(gradeCodeList, function(obj){ return obj.gradeSeq; }); */

    var gradeCodeList           = [{"cmmCd":"", "cmmCdNm":""}];
    var gradeCodeMap            = [];
    <c:forEach var="obj" items="${gradeCodeList}">
    gradeCodeList.push({"cmmCd":"${obj.gradeSeq}" , "cmmCdNm":"${obj.gradeNm}"});
    gradeCodeMap["${obj.gradeSeq}"] = "${obj.gradeNm}";
    </c:forEach>

    //신분증 유형(주요인증문서유형) 설정
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpMap            = [];
    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    var trsfReasonCdList     = [];
    <c:forEach var="obj" items="${trsfReasonCdList}">
        trsfReasonCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    var trsfReceiveRelCdList     = [];
    <c:forEach var="obj" items="${trsfReceiveRelCdList}">
        trsfReceiveRelCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>



    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {
        //양도자 고객등급(gradeCd)
        $("#gradeCd").kendoExtDropDownList({
            dataSource:gradeCodeList
            //,template:"[#:data.gradeSeq#] #:data.gradeSeqNm#"
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            , optionLabel:" "
        });

        //양수자 고객등급(gradeCd)
        $("#receiveGradeCd").kendoExtDropDownList({
            dataSource:gradeCodeList
            //,template:"[#:data.gradeSeq#] #:data.gradeSeqNm#"
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            , optionLabel:" "
        });

        // 양도자 신분증유형            mathDocTp       (CRM024)
        $("#mathDocTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           //, optionLabel:" "
           , dataSource:mathDocTpList
           , index:0
           , change:function(){}
       });

        // 양수자 신분증유형            mathDocTp       (CRM024)
        $("#receiveMathDocTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           //, optionLabel:" "
           , dataSource:mathDocTpList
           , index:0
           , change:function(){
           }
        , bind:function(){
        }
       });

        //양도사유코드.   trsfReasonCdList
        $("#trsfReasonCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:trsfReasonCdList
            //, select:onSelectHostCdSearch
        });

        //양도양수관계코드.   trsfReceiveRelCd
        $("#trsfReceiveRelCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:trsfReceiveRelCdList
            //, select:onSelectHostCdSearch
        });

        // 가용포인트
        $("#usePoint").kendoExtNumericTextBox({
            format:"n0"
           ,min:0
           ,value:0
           ,spinners:false             // 증,감 화살표
        });

        // 양도신청 포인트
        $("#pointVal").kendoExtNumericTextBox({
            format:"n0"
           ,min:0
           ,value:0
           ,spinners:false             // 증,감 화살표
        });

        /*************************************************************
         * 데이터 셋업 영역 membershipSearch
         *************************************************************/
         $("#btnMembershipSave").click(function(){

             // 화면 필수 체크
             if ( dms.string.isEmpty($("#membershipNo").val())) {
                 dms.notification.warning("<spring:message code='global.lbl.membershipNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 //$("#custNm").focus();
                 return false;
             }
             if ( dms.string.isEmpty($("#receiveMembershipNo").val())) {
                 dms.notification.warning("<spring:message code='crm.lbl.receiveMembershipNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 //$("#custNm").focus();
                 return false;
             }
             if ( $("#membershipNo").val() == $("#receiveMembershipNo").val() ) {
                 //동일한 멤버십 번호에 양도/양수를 할 수 없습니다.
                 dms.notification.warning("<spring:message code='crm.info.sameMembershipNo' />");
                 return false;
             }

             //양도신청포인트
             //$("#usePoint").data("kendoExtNumericTextBox").value();
             if ( dms.string.isEmpty($("#pointVal").val())) {
                 dms.notification.warning("<spring:message code='crm.lbl.pointVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return false;
             }

             // 포인트 비교
             if ( $("#pointVal").data("kendoExtNumericTextBox").value() > $("#usePoint").data("kendoExtNumericTextBox").value() ) {
                 //양도신청포인트는 가용포인트보다 클 수 없습니다.
                 dms.notification.warning("<spring:message code='crm.lbl.pointVal' var='returnMsg' /><spring:message code='crm.lbl.usePoint' var='returnMsg2' /><spring:message code='global.err.chkGreateParam' arguments='${returnMsg},${returnMsg2}' />");
                 return false;
             }

             /* //결재정보
             if ( dms.string.isEmpty($("#signDocNo").val())) {
                 dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#signDocNo").focus();
                 return false;
             }*/

             //양도사유
             if ( dms.string.isEmpty($("#trsfReasonCd").val())) {
                 dms.notification.warning("<spring:message code='crm.lbl.trsfReasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#trsfReasonCd").data("kendoExtDropDownList").value("");
                 return false;
             }

             //관계
             if ( dms.string.isEmpty($("#trsfReceiveRelCd").val())) {
                 dms.notification.warning("<spring:message code='crm.lbl.trsfReceiveRelCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#trsfReceiveRelCd").data("kendoExtDropDownList").value("");
                 return false;
             }

             // form 데이터
             var param =
                 $("#transForm").serializeObject(
                     $("#transForm").serializeArrayInSelector("[data-json-obj='true']")
                 );

             param["trsfMembershipNo"] = $("#membershipNo").val();
             param["receiveMembershipNo"] = $("#receiveMembershipNo").val();
             //param["dlrCd"] = $("#dlrCd").val();
             //param["trsfReceiveSeq"] = $("#trsfReceiveSeq").val();
             param["pointVal"] = $("#pointVal").data("kendoExtNumericTextBox").value();
             param["trsfReasonCd"] = $("#trsfReasonCd").val();
             param["trsfReceiveRelCd"] = $("#trsfReceiveRelCd").val();
             param["fileDocNo"] = $("#fileDocNo").val();
             param["signDocId"] = 'CRM-0002';
             param["useYn"] = "Y";

             var url = "<c:url value='/crm/cmm/membershipTrans/insertMembershipTrans.do' />";

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
                     dms.notification.success("<spring:message code='global.info.success'/>");
                     initData();
                     /* console.log("success!!!!");
                     console.log(result);
                     console.log(result["custNo"]);
                     if (result["custNo"] != ""){
                         console.log("success!!!!");

                         $("#custNo").val(result["custNo"]);
                         btnSaveAddress(result["custNo"]);
                     } */

                 }
             }).done(function(result) {
                 console.log("btnCustSave Done!!!!");
             });
         });

        $("#membershipSearch").click(function(){
            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , title:"<spring:message code='crm.title.trsfMembershipNoSearch'/>"   // 양도자 멤버십 번호조회
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                endorseInfoSet(data[0]);
                                //searchPointInfo(); 멤버심 마스터 테이블에 있는 LAST_POINT_VAL로 사용함
                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });
        });

        $("#receiveMembership").click(function(){
            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , title:"<spring:message code='crm.title.receiveMembershipNoSearch'/>"   // 양수자 멤버십 번호조회
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                receiveInfoSet(data[0]);
                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });
        });

        //양도자 정보 setting
        endorseInfoSet = function(data){
            $("#membershipNo").val(dms.string.strNvl(data.membershipNo));//멤버십 일련번호
            $("#gradeCd").data("kendoExtDropDownList").value(data.gradeCd);//등급
            $("#vinNo").val(dms.string.strNvl(data.vinNo));//차대번호
            $("#custNo").val(dms.string.strNvl(data.custNo));//고객번호
            $("#custNm").val(dms.string.strNvl(data.custNm));//고객명
            $("#hpNo").val(dms.string.strNvl(data.hpNo));//핸드폰 번호
            $("#telNo").val(dms.string.strNvl(data.telNo));//집전화
            $("#mathDocTp").data("kendoExtDropDownList").value(data.mathDocTp);//신분증 유형(주요인증문서유형)
            $("#usePoint").data("kendoExtNumericTextBox").value(data.lastPointVal); //가용포인트

            $("#ssnCrnNo").val(dms.string.strNvl(data.ssnCrnNo));//주민사업자등록번호
            $("#idCardNo").val(dms.string.strNvl(data.idCardNo));//ID 카드번호

            /* $("#carNo").val(dms.string.strNvl(data.carNo));
            $("#carRegNo").val(dms.string.strNvl(data.carRegNo)); */
        };

        //양수자 정보 setting
        receiveInfoSet = function(data){
            $("#receiveMembershipNo").val(dms.string.strNvl(data.membershipNo));//멤버십 일련번호
            $("#receiveGradeCd").data("kendoExtDropDownList").value(data.gradeCd);//등급
            $("#receiveVinNo").val(dms.string.strNvl(data.vinNo));//차대번호
            $("#receiveCustNo").val(dms.string.strNvl(data.custNo));//고객번호
            $("#receiveCustNm").val(dms.string.strNvl(data.custNm));//고객명
            $("#receiveHpNo").val(dms.string.strNvl(data.hpNo));//핸드폰 번호
            $("#receiveTelNo").val(dms.string.strNvl(data.telNo));//집전화
            $("#receiveMathDocTp").data("kendoExtDropDownList").value(data.mathDocTp);//신분증 유형(주요인증문서유형)

            $("#receiveSsnCrnNo").val(dms.string.strNvl(data.ssnCrnNo));//주민사업자등록번호
            $("#receiveIdCardNo").val(dms.string.strNvl(data.idCardNo));//ID 카드번호

            /* $("#carNo").val(dms.string.strNvl(data.carNo));
            $("#carRegNo").val(dms.string.strNvl(data.carRegNo)); */
        };

        initData = function(){
            $("#membershipNo").val("");//멤버십 일련번호
            $("#gradeCd").data("kendoExtDropDownList").value("");//등급
            $("#vinNo").val("");//차대번호
            $("#custNo").val("");//고객번호
            $("#custNm").val("");//고객명
            $("#hpNo").val("");//핸드폰 번호
            $("#telNo").val("");//집전화
            $("#mathDocTp").data("kendoExtDropDownList").value("");//신분증 유형(주요인증문서유형)

            $("#ssnCrnNo").val("");//주민사업자등록번호
            $("#idCardNo").val("");//ID 카드번호

            $("#receiveMembershipNo").val("");//멤버십 일련번호
            $("#receiveGradeCd").data("kendoExtDropDownList").value("");//등급
            $("#receiveVinNo").val("");//차대번호
            $("#receiveCustNo").val("");//고객번호
            $("#receiveCustNm").val("");//고객명
            $("#receiveHpNo").val("");//핸드폰 번호
            $("#receiveTelNo").val("");//집전화
            $("#receiveMathDocTp").data("kendoExtDropDownList").value("");//신분증 유형(주요인증문서유형)

            $("#receiveSsnCrnNo").val("");//주민사업자등록번호
            $("#receiveIdCardNo").val("");//ID 카드번호
            $("#receiveOfficdNo").val("");//관증번호


            //$("#usePoint").val("0");//가용포인트
            $("#usePoint").data("kendoExtNumericTextBox").value(0);
            //$("#pointVal").val("0");//양도신청포인트
            $("#pointVal").data("kendoExtNumericTextBox").value(0);
            $("#signDocNo").val("");//결재선택(결재정보)
            $("#trsfReasonCd").data("kendoExtDropDownList").value("");//양도사유
            $("#trsfReceiveRelCd").data("kendoExtDropDownList").value("");//관계
            $("#fileDocNo").val("");//첨부파일

            $("#fileGrid").data("kendoExtGrid").dataSource.read();
            //$("#btnDelete").data("kendoButton").enable(false);
        };




        /* *************************************************************************
         **************************파일업로드3:그리드 kendo 스크립트 추가 ***************
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
                                 /* var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                                 var dataItem = grid.dataItem(grid.select()); */

                                 params["sFileDocNo"] = $("#fileDocNo").val();
//                                 console.log("fileGrid:"+kendo.stringify(params));

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
//                 ,change:function(e){
//                     var dataItem = this.dataItem(this.select());

//                     if(dms.string.isNotEmpty(dataItem)){
//                         dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
//                     }
//                 }
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
         **************************파일업로드3:그리드 kendo 스크립트 추가 ***************
         ***************************************************************************/


         /* *************************************************************************
          **************************파일업로드4:스크립트 추가 $(document).ready 안쪽*****
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
               **************************파일업로드4:스크립트 추가 $(document).ready 안쪽*****
               ***************************************************************************/



    });

    function searchPointInfo(){
     // form 데이터
        var param = {};

        param["sMembershipNo"] = $("#membershipNo").val();
        param["sCardTpCd"] = "01"; //(01:포인트,02:충전)

        console.log("param"+ param);

        var url = "<c:url value='/crm/cmm/membershipTrans/selectPointInfosCondition.do' />";

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
                $("#usePoint").data("kendoExtNumericTextBox").value(result.pointInfoList[0].usePoint);
            }
        }).done(function(result) {
            console.log("btnCustSave Done!!!!");
        });
    }



    /* *************************************************************************
     **************************파일업로드5:스크립트 추가 $(document).ready 밖 *****
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
                     $("#fileDocNo").val(id);                                    // 파일업로드6:업로드 완료후  마스터 테이블의 fileDocNo를 변경해준다
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();   // 파일업로드7:기존꺼에 추가할경우 fileDocNo 설정
         }

//          if (_that.opt["query"] == null) {
//              _that.opt["query"] = {};
//          }

//          if (_that.opt["query"]["resumableSessionId"] == null) {
//              $.ajax({
//                  url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
//                  dataType:"json",
//                  type:"get",
//                  async:false,
//                  cache:false,
//                  success:function(id) {
//                      _that.opt["query"]["resumableSessionId"] = id;
//                      $("#fileDocNo").val(id);
//                  }
//              });
//          }

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
     **************************파일업로드5:스크립트 추가 $(document).ready 밖 *****
     ***************************************************************************/






</script>
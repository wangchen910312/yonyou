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

<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='crm.menu.membershipTransMng'/> </h1><!-- 멤버십 양도관리 -->
                    <div class="btn_right">
                      <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </div>
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
                                <th scope="row"><spring:message code='crm.lbl.requestDt'/></th> <!-- 신청일 -->
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
                                <th scope="row"><spring:message code='crm.lbl.evalStatus'/></th> <!-- 심사상태 -->
                                <td>
                                    <input id="sSignStatCd" name="sSignStatCd" class="form_comboBox">
                                </td>
                                <th scope="row"> <spring:message code='crm.lbl.trsfCust'/> / <spring:message code='crm.lbl.receiveCust'/> </th> <!-- 양도자/양수자 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- end table -->

                <div class="table_grid mt10">
                    <div id="transGrid"></div>
                </div>


                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.transInfo"/></h2> <!-- 양도 정보 -->
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="transUpdate"><spring:message code='global.btn.update'/></button> <!-- 수정 -->
                    </div>
                </div>
<div id="transForm">
                    <!-- 양도정보 시작 -->
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
                                        <input  id="usePoint" name="usePoint" class="form_numeric ar" readonly maxlength="12" >
                                        <input  type="hidden" id="cardNo" name="cardNo" class="form_input" data-json-obj="true">
                                        <input  type="hidden" id="fileDocNo" name="fileDocNo" class="form_input" data-json-obj="true">
                                        <input  type="hidden" id="dlrCd" name="dlrCd" class="form_input" data-json-obj="true">
                                        <input  type="hidden" id="trsfReceiveSeq" name="trsfReceiveSeq" class="form_input" data-json-obj="true">
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.pointVal'/></span></th><!-- 양도신청포인트 -->
                                    <td>
                                        <input id="pointVal" name="pointVal" class="form_numeric ar" data-json-obj="true" maxlength="10">
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
                            </tbody>
                        </table>
                    </div>
                    <!-- 양도정보 종료  -->

                    <!-- 양도자 시작 -->
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
                                            <input id="trsfMembershipNo" name="trsfMembershipNo" class="form_input" placeholder="<spring:message code='crm.lbl.trsfMembershipSeq'/>" data-json-obj='true' readonly="readonly"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.gradeCd'/></th><!-- 등급 -->
                                        <td>
                                            <input id="gradeCd" name="gradeCd" class="form_comboBox" disabled="disabled" >
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                                        <td>
                                            <input id="custNm" name="custNm" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.vinNum'/></th><!-- VINNO -->
                                        <td>
                                            <input id="vinNo" name="vinNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th scope="row"><spring:message code='global.lbl.hpNo'/></th><!-- 휴대전화 -->
                                        <td>
                                            <input id="hpNo" name="hpNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.homeTelNo'/></th><!-- 집전화 -->
                                        <td>
                                            <input id="telNo" name="telNo" value="" class="form_input" disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th><!-- 신분증 유형 -->
                                        <td>
                                            <input id="mathDocTp" name="mathDocTp" class="form_comboBox"  disabled="disabled"/>
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th><!-- 신분증 번호 -->
                                        <td>
                                            <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" disabled="disabled"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 양도자 종료 -->

                        <!-- 양수자 시작 -->
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
                                                <input type="text" id="receiveMembershipNo" name="receiveMembershipNo" class="form_input" data-json-obj='true' placeholder="<spring:message code='crm.lbl.receiveMembershipNo'/>" readonly="readonly"/>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.gradeCd'/></th><!-- 등급 -->
                                            <td>
                                                <input id="receiveGradeCd" name="receiveGradeCd" disabled="disabled" class="form_comboBox" disabled="disabled"/>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                                            <td>
                                                <input type="text" id="receiveCustNm" name="receiveCustNm" value="" class="form_input" disabled="disabled"/>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.vinNum'/></th><!-- VIN -->
                                            <td>
                                                <input type="text" id="receiveVinNo" name="receiveVinNo" value="" class="form_input" disabled="disabled"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.hpNo'/></th><!-- 휴대전화 -->
                                            <td>
                                                <input type="number" id="receiveHpNo" name="receiveHpNo" value="" class="form_input" disabled="disabled"/>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.homeTelNo'/></th><!-- 집전화 -->
                                            <td>
                                                <input type="number" id="receiveTelNo" name="receiveTelNo" value="" class="form_input" disabled="disabled"/>
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th><!-- 신분증 유형 -->
                                            <td>
                                                <input id="receiveMathDocTp" name="receiveMathDocTp" class="form_comboBox"  disabled="disabled" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th><!-- 신분증 번호 -->
                                            <td>
                                                <input id="receiveSsnCrnNo" name="receiveSsnCrnNo" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" disabled="disabled"/>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        <!-- 양수자 종료 -->
</div>

                        <!-- 신청서 -->
                        <section class="group">
                            <div class="header_area">
                                <h2 class="title_basic"><spring:message code="global.title.signInfo" /><!-- 결재정보 --></h2>
                                <div class="btn_right">
                                    <button class="btn_s" id="btnApproval"><spring:message code='global.btn.approval' /></button><!-- 승인 -->
                                    <button class="btn_s" id="btnRollback"><spring:message code='global.btn.appRollback' /></button><!-- 반려 -->
                                </div>
                            </div>

                            <div class="table_grid">
                                <input id="signCont" name="signCont" type="hidden"><!-- 결재의견 -->
                                <div id="signLineGrid">
                                </div>
                            </div>

                        </section>
                        <!-- //신청서  -->

                        <!-- *************************************************************************
                        **************************파일업로드2:그리드 추가 html 추가 *********************
                        ***************************************************************************-->
                        <!-- 신청서 -->
                        <section class="group">
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
                        <!-- //신청서  -->
                        <!-- *************************************************************************
                        **************************파일업로드2:그리드 추가 html 추가 *********************
                        ***************************************************************************-->

            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
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

     //카드형태구분 Array
     var cardFormList = [{"cmmCd":"", "cmmCdNm":""}];
     <c:forEach var="obj" items="${cardFormCdList}">
     cardFormList.push({
         "cmmCd":"${obj.cmmCd}"
         , "cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>
     //카드형태구분 Map
     var cardFormMap = [];
     $.each(cardFormList, function(idx, obj){
         cardFormMap[obj.cmmCd] = obj.cmmCdNm;
     });

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
     var trsfReasonCdMap     = [];
     <c:forEach var="obj" items="${trsfReasonCdList}">
         trsfReasonCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         trsfReasonCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     var trsfReceiveRelCdList     = [];
     var trsfReceiveRelCdMap     = [];
     <c:forEach var="obj" items="${trsfReceiveRelCdList}">
         trsfReceiveRelCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         trsfReceiveRelCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     //결재유형  Array
     var arrSignTp = [{"cmmCd":"", "cmmCdNm":""}];
     <c:forEach var="obj" items="${arrSignTp}">
     arrSignTp.push({
         "cmmCd":"${obj.cmmCd}"
         ,"cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>

     var arrSignTpMap = dms.data.arrayToMap(arrSignTp, function(obj){ return obj.cmmCd; });

     //결재진행상태  Array
     var arrSignStatCd = [{"cmmCd":"", "cmmCdNm":""}];
     <c:forEach var="obj" items="${arrSignStatCd}">
     arrSignStatCd.push({
         "cmmCd":"${obj.cmmCd}"
         ,"cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>

     var arrSignStatCdMap = dms.data.arrayToMap(arrSignStatCd, function(obj){ return obj.cmmCd; });

     //결재처리코드  Array
     var arrSignProcCd = [{"cmmCd":"", "cmmCdNm":""}];
     <c:forEach var="obj" items="${arrSignProcCd}">
     arrSignProcCd.push({
         "cmmCd":"${obj.cmmCd}"
         ,"cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>

     var arrSignProcCdMap = dms.data.arrayToMap(arrSignProcCd, function(obj){ return obj.cmmCd; });


     var membershipCardUploadPopupWin;

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {
        $("#btnApproval").hide();
        $("#btnRollback").hide();

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
                                  var transGrid = $("#transGrid").data("kendoExtGrid");
                                  var selectedItem = transGrid.dataItem(transGrid.select());
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

        //가용포인트
        $("#usePoint").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //가용포인트
        $("#pointVal").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        // 심사상태
        $("#sSignStatCd").kendoExtDropDownList({
            dataSource:arrSignStatCd
            //,template:"[#:data.gradeSeq#] #:data.gradeSeqNm#"
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
        });

        //양수자 고객등급(gradeCd)
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
       });

        // 양수자 신분증유형            mathDocTp       (CRM024)
        $("#receiveMathDocTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           //, optionLabel:" "
           , dataSource:mathDocTpList
           , index:0
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


        $("#sCardTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:cardTpList
            , index:0
        });

        //시간 template
        /* $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */
        //조회조건-소멸일 선택
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        /*************************************************************
         * 버튼 영역
         *************************************************************/
        //버튼 - 고객등록이동
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#transGrid").data("kendoExtGrid").dataSource._destroyed = [];
                $("#transGrid").data("kendoExtGrid").dataSource.page(1);
                $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                $("#signLineGrid").data("kendoExtGrid").dataSource.data([]);
            }
        });

        ////버튼 - 수정
        $("#transUpdate").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#trsfMembershipNo").val())){
                    // 양도신청포인트을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='crm.menu.membershipTransMng' var='arguMsg' /><spring:message code='global.info.check.field' arguments='${arguMsg}'/>");
                    return;
                }

                //if(dms.string.isEmpty($("#usePoint").data("kendoExtNumericTextBox").value()) == 0){
                if(0 >= dms.string.defaultString($("#usePoint").data("kendoExtNumericTextBox").value(),0)){
                    // 가용포인트 을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='crm.lbl.usePoint' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    $("#usePoint").data("kendoExtNumericTextBox").focus();
                    return;
                }

                if(dms.string.isEmpty($("#pointVal").data("kendoExtNumericTextBox").value())){
                    // 양도신청포인트을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='crm.lbl.pointVal' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    $("#pointVal").data("kendoExtNumericTextBox").focus();
                    return;
                }

                if( $("#pointVal").data("kendoExtNumericTextBox").value() > $("#usePoint").data("kendoExtNumericTextBox").value() ){
                    // 양도신청 포인트는 가용포인트보다 클 수 없습니다.
                    dms.notification.info("<spring:message code='crm.lbl.pointVal' var='arguMsg' /><spring:message code='crm.lbl.usePoint' var='arguMsg2' /><spring:message code='global.err.chkGreateParam' arguments='${arguMsg},${arguMsg2}'/>");
                    $("#pointVal").data("kendoExtNumericTextBox").value(0);
                    $("#pointVal").data("kendoExtNumericTextBox").focus();
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

                if(0 >= dms.string.defaultString($("#pointVal").data("kendoExtNumericTextBox").value(),0)){
                    // 양도신청포인트을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='crm.lbl.pointVal' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    $("#pointVal").data("kendoExtNumericTextBox").focus();
                    return;
                }

                // form 데이터
                var param =
                    $("#transForm").serializeObject(
                        $("#transForm").serializeArrayInSelector("[data-json-obj='true']")
                    );
                var url = "<c:url value='/crm/dmm/membershipTransMng/updateMembershipTransPointVal.do' />";

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
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $('#transGrid').data('kendoExtGrid').dataSource.page(1);
                    }
                }).done(function(result) {
                    console.log("membershipTransPointVal Save Done!!!!");
                });
            }
        });

        //버튼 - 승인
        $("#btnApproval").kendoButton({
            click:function(e) {
                var tempUrl     = "";
                var saveData    = "";

                /* if($("#signCont").val()=="") {
                    // 화면 필수 체크(결재의견)
                    dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                } */


                var lineGrid = $("#signLineGrid").data("kendoExtGrid");
                var selectedItem = lineGrid.dataItem(lineGrid.select());

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

                var params = {};

                params["signDocNo"] = selectedItem.signDocNo;
                params["signCont"] = selectedItem.signCont;
                params["signStatCd"] = "03";
                params["signRsltCd"] = "04";
                params["lastSignYn"] = selectedItem.lastSignYn;

                $.ajax({
                    url:"<c:url value='/crm/dmm/membershipTransMng/updateSignLineEx.do' />"
                  , data:JSON.stringify(params)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        //버튼 - 반려
        $("#btnRollback").kendoButton({
            click:function(e) {

                var lineGrid = $("#signLineGrid").data("kendoExtGrid");
                var selectedItem = lineGrid.dataItem(lineGrid.select());

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

                var params = {};

                params["signDocNo"] = selectedItem.signDocNo;
                params["signCont"] = selectedItem.signCont;
                params["signStatCd"] = "04";
                params["signRsltCd"] = "04";

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
                        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        /*************************************************************
         *  양도/양수 그리드 셋팅
        *************************************************************/
        //양도/양수 그리드 설정
        $("#transGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipTransMng/selectMembershipTransMngs.do' />"
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

//                            console.log(params);
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
                                ,pointVal:{type:"string", validation:{required:true}} //양도 신청금액
                                //,val1:{tyype:"string"}
                                ,reqDt:{tyype:"date"}//심사신청일
                                ,signEndDt:{tyype:"date"} //심사완료일
                                ,reqUsrNm:{tyype:"string"} //신청자
                                ,signStatCd:{tyype:"string"} //심사상태
                                ,trsfReasonCd:{type:"string", validation:{required:true}} // 양도사유
                                ,trsfReceiveRelCd:{type:"string",  validation:{required:true}} // 관계
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,height:150
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            ,editable:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());
                var trsfMembershipNo = selectedItem.trsfMembershipNo;
                var receiveMembershipNo = selectedItem.receiveMembershipNo;
                $("#trsfMembershipNo").val(trsfMembershipNo);//양도자멤버십 번호
                $("#fileDocNo").val(selectedItem.fileDocNo);//첨부파일 번호
                $("#trsfReceiveSeq").val(selectedItem.trsfReceiveSeq);//양도.양수일련번호
                $("#receiveMembershipNo").val(receiveMembershipNo);//양수자 넴버십 번호
                $("#trsfReasonCd").data("kendoExtDropDownList").value(selectedItem.trsfReasonCd);//양도사유
                $("#trsfReceiveRelCd").data("kendoExtDropDownList").value(selectedItem.trsfReceiveRelCd);//관계
                $("#pointVal").data("kendoExtNumericTextBox").value(selectedItem.pointVal);//양도신청포인트
                $("#dlrCd").val(selectedItem.dlrCd);//딜러코드

                custInfo(trsfMembershipNo, receiveMembershipNo, selectedItem.dlrCd);
                //$("#pointVal").val(dms.string.addThousandSeparatorCommas(selectedItem.pointVal));
                if(selectedItem.signStatCd == "01"){
                    $("#transUpdate").show();
                    /* $("#usePoint").attr("readOnly", true);
                    $("#usePoint").data("kendoExtNumericTextBox").readonly(); */
                    $("#usePoint").data("kendoExtNumericTextBox").enable(false);
                    $("#pointVal").data("kendoExtNumericTextBox").enable(true);
                    $("#trsfReasonCd").data("kendoExtDropDownList").enable(true);
                    $("#trsfReceiveRelCd").data("kendoExtDropDownList").enable(true);
                }else{
                    $("#transUpdate").hide();
                    //$("#usePoint").data("kendoExtNumericTextBox").enable(false);

                    $("#usePoint").data("kendoExtNumericTextBox").enable(false);
                    $("#pointVal").data("kendoExtNumericTextBox").enable(false);
                    $("#trsfReasonCd").data("kendoExtDropDownList").enable(false);
                    $("#trsfReceiveRelCd").data("kendoExtDropDownList").enable(false);
                }

                $("#signLineGrid").data("kendoExtGrid").dataSource.read();
                $("#fileGrid").data("kendoExtGrid").dataSource.read();

            }
            ,columns:[
               {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"trsfReceiveSeq", title:"양도일련번호", hidden:true}// 사업장코드
               ,{field:"trsfMembershipNo", title:"양도자멤버십번호", hidden:true}//
               ,{field:"trsfCustNm", title:"<spring:message code='crm.lbl.trsfCust'/>"}//
               ,{field:"receiveMembershipNo", title:"양수자멤버십번호", hidden:true}//
               ,{field:"receiveCustNm", title:"<spring:message code='crm.lbl.receiveCust'/>"}//
               ,{field:"pointVal", title:"<spring:message code='crm.lbl.pointVal'/>"
                   ,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   ,decimal:0
               }//양도신청금액
               //,{field:"val1", title:"<spring:message code='crm.lbl.applicationForm'/>"}//신청서
               ,{field:"reqDt", title:"<spring:message code='crm.lbl.evalRequestDt'/>"
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//심사신청일
               ,{field:"signEndDt", title:"<spring:message code='crm.lbl.evalRequestEndDt'/>"
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//심사완료일
               ,{field:"reqUsrNm", title:"<spring:message code='crm.lbl.requestUsrNm'/>"}//신청자
               ,{field:"signStatCd", title:"<spring:message code='crm.lbl.evalStatus'/>"
                   ,attributes:{"class":"ac"}
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
               }//심사상태
               ,{field:"trsfReasonCd", title:"<spring:message code='crm.lbl.trsfReasonCd'/>"//양도사유
                   ,width:120
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
               ,{field:"trsfReceiveRelCd", title:"<spring:message code='crm.lbl.trsfReceiveRelCd'/>" //관계
                   ,width:120
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
            ]
        });


        /*************************************************************
         *  결재라인 그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#signLineGrid").kendoExtGrid({
         dataSource:{
              transport:{
                 read:{
                     url:"<c:url value='/crm/dmm/membershipTransMng/selectSignLineExs.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var transGrid = $("#transGrid").data("kendoExtGrid");
                         var selectedItem = transGrid.dataItem(transGrid.select());

                         var params = {};

                         params["sSignDocId"] = selectedItem.signDocId;
                         params["sSignDocNo"] = selectedItem.signDocNo;

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
                     $("#btnApproval").show();
                     $("#btnRollback").show();
                     break;
                 }else{
                     $("#btnApproval").hide();
                     $("#btnRollback").hide();
                 }
             }
         }
         ,dataBound:function (e) { //그리드가 로딩된 후 화면컨트롤 할때 해야 하는 부분

             $("#btnApproval").hide();
             $("#btnRollback").hide();

         }
         ,multiSelectWithCheckbox:false
         ,editableOnlyNew:true
         ,editableOnlyNewExcludeColumns:["signUsrNm", "signCont"]
         ,height:305
         ,columns:[
             {field:"signDocId", hidden:true}
             ,{field:"signDocLineNo", title:"<spring:message code='global.lbl.signDocLineNo' />", width:100 ,attributes:{"class":"ac"}}
             ,{field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:100 ,attributes:{"class":"ac"}
                 ,editor:function(container, options) {
                     $('<input required name="lastSignYn" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:true
                         ,dataSource:['Y','N']
                         ,index:0
                     });
                     $('<span class="k-invalid-msg" data-for="lastSignYn"></span>').appendTo(container);
                 }
              }//최종결정권자
             ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:100
                 ,template:"# if(arrSignTpMap[signTp] != null) { # #= arrSignTpMap[signTp].cmmCdNm# # }#"
                 ,editor:function(container, options) {
                      $('<input required name="signTp" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:arrSignTp
                      });
                      $('<span class="k-invalid-msg" data-for="signTp"></span>').appendTo(container);
                 }
              }//구분
             ,{field:"signUsrNm", title:"<spring:message code='global.lbl.prsNm' />", width:200
                 ,editor:function(container, options) {
                     $('<div class="form_search"><input id="signUserNm" type="text" data-bind="value:' + options.field + '" class="form_input" /><a id="btnUserSearch" href="javascript:userSearchPopup();">검색</a></div>')
                     .kendoAutoComplete({
                             minLength:2
                             ,template:"[#:data.usrId#]#:data.usrNm#"
                             ,dataTextField:"usrId"
                             ,dataSource:{
                                 serverFiltering:true
                                 ,transport:{
                                     read:{
                                          url:"<c:url value='/cmm/sci/user/selectUsersForSuggest.do' />"
                                          ,dataType:"json"
                                          ,type:"POST"
                                          ,contentType:"application/json"
                                     }
                                     ,parameterMap:function(options, operation)
                                     {
                                         if (operation === "read") {
                                             return kendo.stringify({
                                                 "sText":$("#signUsrNm").data("kendoAutoComplete").value()
                                                 ,"recordCountPerPage":10
                                             });
                                         }
                                     }
                                 }
                                 ,schema:{
                                     data:"data"
                                     ,total:"total"
                                 }
                             }
                         })

                     .appendTo(container)
                     $('<span class="k-invalid-msg" data-for="signUsrNm"></span>').appendTo(container);



                 }

             }
             ,{field:"signStatCd", title:"<spring:message code='global.lbl.statNm' />", width:100
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
             ,{field:"signRsltCd", title:"<spring:message code='global.lbl.result' />", width:100
                 ,template:"# if(arrSignProcCdMap[signRsltCd] != null) { # #= arrSignProcCdMap[signRsltCd].cmmCdNm# # }#"
                     ,editor:function(container, options) {
                          $('<input required name="signRsltCd" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:arrSignProcCd
                          });
                          $('<span class="k-invalid-msg" data-for="signRsltCd"></span>').appendTo(container);
                     }
             }
             ,{field:"signDt", title:"<spring:message code='global.lbl.dateTime' />", width:200
                 ,attributes:{"class":"ac tooltip-disabled"}
                 ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
             }
             ,{field:"signCont", title:"<spring:message code='crm.lbl.cont' />", width:600 ,attributes:{"class":"al"}}
             ,{title:""}
         ]

    });

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

function custInfo(trsfMembershipNo,receiveMembershipNo,dlrCd){
        var param = {};
        param["sTrsfMembershipNo"] = trsfMembershipNo
        param["sReceiveMembershipNo"] = receiveMembershipNo
        param["sDlrCd"] = dlrCd
        param["sCardTpCd"] = "01"; //(01:포인트,02:충전)
        var url = "<c:url value='/crm/dmm/membershipTransMng/selectMembershipCustInfo.do' />";

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
                console.log(result);
                //양도자 영역 셋팅
                $("#gradeCd").data("kendoExtDropDownList").value(result.trsfMember.gradeCd);
                $("#vinNo").val(result.trsfMember.vinNo);
                $("#custNm").val(result.trsfCustInfo[0].custNm);
                $("#mathDocTp").data("kendoExtDropDownList").value(result.trsfCustInfo[0].mathDocTp)//신분증 유형(주요인증문서유형)
                $("#ssnCrnNo").val(result.trsfCustInfo[0].ssnCrnNo);//주민사업자등록번호
                $("#hpNo").val(result.trsfCustInfo[0].hpNo);//휴대전화
                $("#telNo").val(result.trsfCustInfo[0].telNo);//집전화
                $("#usePoint").data("kendoExtNumericTextBox").value(result.pointInfoList[0].usePoint); //가용포인트

                //양수자 영역 셋팅
                $("#receiveGradeCd").data("kendoExtDropDownList").value(result.receiveMember.gradeCd);
                $("#receiveVinNo").val(result.receiveMember.vinNo);
                $("#receiveCustNm").val(result.receiveCustInfo[0].custNm);
                $("#receiveMathDocTp").data("kendoExtDropDownList").value(result.receiveCustInfo[0].mathDocTp)//신분증 유형(주요인증문서유형)
                $("#receiveSsnCrnNo").val(result.receiveCustInfo[0].ssnCrnNo);//주민사업자등록번호
                $("#receiveHpNo").val(result.receiveCustInfo[0].hpNo);//휴대전화
                $("#receiveTelNo").val(result.receiveCustInfo[0].telNo);//집전화

            }
        });
    }

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //등록시작일
          if(id === 'sStartDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sEndDt'){//등록종료일
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
    }

</script>
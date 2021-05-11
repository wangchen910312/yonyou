<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <h2 class="title_basic">사용자 정의 승인/반려 화면</h2>
        <div class="btn_right">
            <button id="btnPopupApproval" class="btn_m"><spring:message code="global.btn.approval" /></button>
            <button id="btnPopupRollBack" class="btn_m"><spring:message code="global.btn.appRollback" /></button>
        </div>
    </div>

    <form id="searchForm">
        <input type="hidden" id="sUsrDefReqDocId" name="sUsrDefReqDocId" />
        <input type="hidden" id="sDlrCd" name="sDlrCd" />
        <input type="hidden" id="sAtcNo" name="sAtcNo" />
    </form>

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
                    <th scope="row"><spring:message code="global.lbl.docId" /></th>
                    <td>
                        <input type="text" id="usrDefReqDocId" name="usrDefReqDocId" class="form_input form_disabled" disabled="disabled" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.docNm" /></th>
                    <td>
                        <input type="text" id="usrDefReqDocNm" name="usrDefReqDocNm" class="form_input form_disabled" disabled="disabled" />
                    </td>
                    <th scope="row">작성자</th>
                    <td>
                        <input type="text" id="writer" name="writer" class="form_input form_disabled" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th scope="row">승인상태</th>
                    <td>
                        <input type="text" id="approveStatCd" name="approveStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row">승인자</th>
                    <td>
                        <input type="text" id="approveUsrNm" name="approveUsrNm" class="form_input form_disabled" disabled="disabled" />
                    </td>
                    <th scope="row">승인일시</th>
                    <td>
                        <input type="text" id="approveDt" name="approveDt" class="form_input form_disabled" disabled="disabled" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic">상세정보</h2>
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
                    <th scope="row">딜러코드</th>
                    <td>
                        <input type="text" id="dlrCd" name="dlrCd" class="form_input form_disabled" disabled="disabled" />
                    </td>
                    <th scope="row">딜러명</th>
                    <td>
                        <input type="text" id="dlrNm" name="dlrNm" class="form_input form_disabled" disabled="disabled" />
                    </td>
                    <th scope="row">작성자</th>
                    <td>
                        <input type="text" id="usrNm" name="usrNm" class="form_input form_disabled" disabled="disabled" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="survey mt10" role="search" data-btnid="btnSearch">
        <div class="survey_content" style="height:215px;">
            <ul id="survey"></ul>
        </div>
    </div>
</section>

<script type="text/javascript">
    // 승인 여부  Array
    var arrPaymentStateTp = [];
    <c:forEach var="obj" items="${arrPaymentStateTp}">
        arrPaymentStateTp.push({
            "cmmCd":"${obj.cmmCd}"
          , "cmmCdNm":"${obj.cmmCdNm}"
        });
    </c:forEach>

    fnPopupInit = function() {
        var searchData = "";
        var tag = "";
        var loop_1 = 0;
        var loop_2 = 0;

        // 승인 유형 DropDownList
        $("#approveStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
          , dataValueField:"cmmCd"
          , dataSource:arrPaymentStateTp
        });

        searchData = $("#searchForm").serializeObject();

        $.ajax({
            url:"<c:url value='/cmm/sci/userDefined/selectSurveyAnswerMasterByCondition.do' />"
          , data:JSON.stringify(searchData)
          , type:'POST'
          , dataType:'json'
          , async:false
          , contentType:'application/json'
          , error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
          , success:function(jqXHR, textStatus) {
               var dropDownlist = $("#approveStatCd").data("kendoExtDropDownList");
               dropDownlist.enable(false);

               $.each(jqXHR, function(index, value) {
                   $("#usrDefReqDocId").val(value.usrDefReqDocId);
                   $("#usrDefReqDocNm").val(value.usrDefReqDocNm);
                   $("#writer").val(value.writer);
                   dropDownlist.value(value.approveStatCd);
                   $("#approveUsrNm").val(value.approveUsrNm);
                   $("#approveDt").val(value.approveDt);

                   $("#dlrCd").val(value.dlrCd);
                   $("#dlrNm").val(value.dlrNm);
                   $("#usrNm").val(value.usrNm);
               });
            }
        });

        $.ajax({
            url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedSurvey.do' />"
          , data:JSON.stringify(searchData)
          , type:'POST'
          , dataType:'json'
          , async:false
          , contentType:'application/json'
          , error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
          , success:function(jqXHR, textStatus) {
                $("#survey").empty();

                $.each(jqXHR.data, function(index, value) {
                    $("#sAtcNo").val(value.atcNo);

                    searchData = $("#searchForm").serializeObject();

                    tag += "<li><h3>" + value.atcNo + ". " + value.atcNm + "</h3>";
                    tag += "<div class='answer_area'>";

                    $.ajax({
                        url:"<c:url value='/cmm/sci/userDefined/selectSurveyAnswerSubByKey.do' />"
                      , data:JSON.stringify(searchData)
                      , type:'POST'
                      , dataType:'json'
                      , async:false
                      , contentType:'application/json'
                      , error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                      , success:function(jqXHR, textStatus) {
                          switch (value.atcTp) {
                              case "01":
                                  // 단일 선택
                                  for (var i = 0; i < value.atcListCont.split("|").length; i++) {
                                      tag += "    <p>";

                                      if ((i + 1) == parseInt(jqXHR.atcRsltInsCont)) {
                                          tag += "        <label class='label_check'><input type='radio' id='' name='' checked='checked' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                      }
                                      else {
                                          tag += "        <label class='label_check'><input type='radio' id='' name='' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                      }

                                      tag += "    </p>";
                                  }

                                  if (value.etcInsUseYn == "Y") {
                                      tag += "    <p>";

                                      if (jqXHR.atcEtcInsCont != null && jqXHR.atcEtcInsCont != "") {
                                          tag += "        <label class='label_check'><input type='radio' id='' name='' checked='checked' class='form_check' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='' name='' value='" + jqXHR.atcEtcInsCont + "' class='form_input' style='width:44%;' />";
                                      }
                                      else {
                                          tag += "        <label class='label_check'><input type='radio' id='' name='' class='form_check' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='' name='' value='' class='form_input' style='width:44%;' />";
                                      }

                                      tag += "    </p>";
                                  }

                                  break;
                              case "02":
                                  // 복수 선택
                                  for (var i = 0; i < value.atcListCont.split("|").length; i++) {
                                      tag += "    <p>";

                                      for (var j = 0 + loop_1; j < jqXHR.atcRsltInsCont.split("|").length; j++) {
                                          if ((i + 1) == parseInt(jqXHR.atcRsltInsCont.split("|")[j])) {
                                              tag += "        <label class='label_check'><input type='checkbox' id='' name='' checked='checked' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";

                                              loop_1++;
                                              loop_2++;

                                              break;
                                          }
                                          else {
                                              tag += "        <label class='label_check'><input type='checkbox' id='' name='' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";

                                              loop_2++;

                                              break;
                                          }
                                      }

                                      if (i >= parseInt(jqXHR.atcRsltInsCont.split("|")[jqXHR.atcRsltInsCont.split("|").length - 1])) {
                                          tag += "        <label class='label_check'><input type='checkbox' id='' name='' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                      }

                                      tag += "    </p>";
                                  }

                                  if (value.etcInsUseYn == "Y") {
                                      tag += "    <p>";

                                      if (jqXHR.atcEtcInsCont != null && jqXHR.atcEtcInsCont != "") {
                                          tag += "        <label class='label_check'><input type='checkbox' id='' name='' checked='checked' class='form_check' /> <spring:message code='global.lbl.other' /></label> <input type='text id='' name='' value='" + jqXHR.atcEtcInsCont + "' class='form_input' style='width:44%;' />";
                                      }
                                      else {
                                          tag += "        <label class='label_check'><input type='checkbox' id='' name='' class='form_check' /> <spring:message code='global.lbl.other' /></label> <input type='text id='' name='' value='' class='form_input' style='width:44%;' />";
                                      }

                                      tag += "    </p>";
                                  }

                                  break;
                              case "03":
                                  // 단답형
                                  tag += "    <p>";
                                  tag += "        <input type='text' id='' name='' value='" + jqXHR.atcRsltInsCont + "' class='form_input' style='width:50%;' />";
                                  tag += "    </p>";

                                  break;
                              default:
                                  // 서술형
                                  tag += "    <p>";
                                  tag += "        <textarea rows='3' cols='' id='' name='' class='form_textarea'>" + jqXHR.atcRsltInsCont + "</textarea>";
                                  tag += "    </p>";

                                  break;
                          }
                        }
                    });

                    tag += "</div></li>";
                });

                $("#survey").append(tag);
            }
        });
    }

    $(document).ready(function() {
        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.surveyAnswerDetailPopupWin.options.content.data;

         $("#sUsrDefReqDocId").val(options.sUsrDefReqDocId);
         $("#sDlrCd").val(options.sDlrCd);

         fnPopupInit();

         // 승인 버튼.
         $("#btnPopupApproval").kendoButton({
             click:function(e){
                 //

                 $.ajax({
                     url:"<c:url value='/cmm/sci/userDefinedApply/updateUserDefinedApplyState.do' />"
                   , data:JSON.stringify({"usrDefReqDocId":$("#sUsrDefReqDocId").val(), "dlrCd":$("#sDlrCd").val(), "approveStatCd":"02"})
                   , type:'POST'
                   , dataType:'json'
                   , async:false
                   , contentType:'application/json'
                   , error:function(jqXHR, status, error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                   , success:function(jqXHR, textStatus) {
                       parent.surveyAnswerDetailPopupWin.close();

                       options.callbackFunc("<spring:message code='global.info.success'/>");
                     }
                 });
             }
         });

         // 버튼 - 반려
         $("#btnPopupRollBack").kendoButton({
             click:function(e) {
                 $.ajax({
                     url:"<c:url value='/cmm/sci/userDefinedApply/updateUserDefinedApplyState.do' />"
                   , data:JSON.stringify({"usrDefReqDocId":$("#sUsrDefReqDocId").val(), "dlrCd":$("#sDlrCd").val(), "approveStatCd":"03"})
                   , type:'POST'
                   , dataType:'json'
                   , async:false
                   , contentType:'application/json'
                   , error:function(jqXHR, status, error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                   , success:function(jqXHR, textStatus) {
                       parent.surveyAnswerDetailPopupWin.close();

                       options.callbackFunc("<spring:message code='global.info.success'/>");
                     }
                 });
             }
         });
    });
</script>
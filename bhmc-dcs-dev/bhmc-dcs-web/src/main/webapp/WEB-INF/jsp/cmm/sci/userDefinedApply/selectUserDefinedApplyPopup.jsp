<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <form id="searchForm">
        <input type="hidden" id="sUsrDefReqDocId" name="sUsrDefReqDocId" />
        <input type="hidden" id="sDlrCd" name="sDlrCd" />
        <input type="hidden" id="sAtcNo" name="sAtcNo" />
    </form>

    <input type="hidden" id="totalCnt" name="totalCnt" />

    <div class="header_area">
        <div class="btn_right">
            <button id="btnPopupSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button>
            <%-- <button id="btnPopupClose" class="btn_m btn_close"><spring:message code="global.btn.close" /></button> --%>
        </div>
    </div>

    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.docNm" /></th>
                    <td>
                        <input type="text" id="usrDefReqDocNm" name="usrDefReqDocNm" class="form_input" readonly="readonly" disabled="disabled" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.docCont" /></th>
                    <td>
                        <input type="text" id="usrDefReqCont" name="usrDefReqCont" class="form_input" readonly="readonly" disabled="disabled" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="survey mt10" role="search" data-btnid="btnSearch">
        <div class="survey_content" style="height:303px;">
            <ul id="survey"></ul>
        </div>
    </div>
</section>

<script type="text/javascript">
    fnPopupInit = function(options) {
        var tag = "";
        var loop = 0;
        var loop_1 = 0;
        var loop_2 = 0;

        $("#sUsrDefReqDocId").val(options.sUsrDefReqDocId);
        $("#sDlrCd").val(options.sDlrCd);
        $("#usrDefReqDocNm").val(options.usrDefReqDocNm);
        $("#usrDefReqCont").val(options.usrDefReqCont);

        var searchData = $("#searchForm").serializeObject();

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
                $("#totalCnt").val(jqXHR.total);

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
                            if (index == 0) {
                                if (jqXHR.approveStatCd == "02") {
                                    $("#btnPopupSave").hide();
                                    $("#btnPopupClose").hide();
                                }
                                else {
                                    $("#btnPopupSave").show();
                                    $("#btnPopupClose").show();
                                }
                            }

                            if (jqXHR.status == 200) {
                                switch (value.atcTp) {
                                    case "01":
                                        // 단일 선택
                                        loop = 0;

                                        for (var i = 0; i < value.atcListCont.split("|").length; i++) {
                                            tag += "    <p>";
                                            tag += "        <label class='label_check'><input type='radio' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                            tag += "    </p>";

                                            loop++;
                                        }

                                        if (value.etcInsUseYn == "Y") {
                                            tag += "    <p>";
                                            tag += "        <label class='label_check'><input type='radio' id='atcRsltInsCont_" + (index + 1) + "_" + (loop + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='etc_" + (index + 1) + " form_check' value='" + (loop + 1) + "' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='atcEtcInsCont_" + (index + 1) + "' name='atcEtcInsCont_" + (index + 1) + "' value='' style='width:44%' class='form_input' />";
                                            tag += "    </p>";
                                        }

                                        break;
                                    case "02":
                                        // 복수 선택
                                        loop = 0;

                                        for (var i = 0; i < value.atcListCont.split("|").length; i++) {
                                            tag += "    <p>";
                                            tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                            tag += "    </p>";

                                            loop++;
                                        }

                                        if (value.etcInsUseYn == "Y") {
                                            tag += "    <p>";
                                            tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (loop + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='etc_" + (index + 1) + " form_check' value='" + (loop + 1) + "' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='atcEtcInsCont_" + (index + 1) + "' name='atcEtcInsCont_" + (index + 1) + "' value='' style='width:44%' class='form_input' />";
                                            tag += "    </p>";
                                        }

                                        break;
                                    case "03":
                                        // 단답형
                                        tag += "    <p>";
                                        tag += "        <input type='text' id='atcRsltInsCont_" + (index + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='' style='width:50%' class='form_input' />";
                                        tag += "    </p>";

                                        break;
                                    default:
                                        // 서술형
                                        tag += "    <p>";
                                        tag += "        <textarea rows='3' cols='' id='atcRsltInsCont_" + (index + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='form_textarea'></textarea>";
                                        tag += "    </p>";

                                        break;
                                }
                            }
                        }
                      , success:function(jqXHR, textStatus) {
                          if (index == 0) {
                              if (jqXHR.approveStatCd == "02") {
                                  $("#btnPopupSave").hide();
                                  $("#btnPopupClose").hide();
                              }
                              else {
                                  $("#btnPopupSave").show();
                                  $("#btnPopupClose").show();
                              }
                          }

                          switch (value.atcTp) {
                              case "01":
                                  // 단일 선택
                                  loop = 0;

                                  for (var i = 0; i < value.atcListCont.split("|").length; i++) {
                                      tag += "    <p>";

                                      if ((i + 1) == parseInt(jqXHR.atcRsltInsCont)) {
                                          tag += "        <label class='label_check'><input type='radio' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' checked='checked' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                      }
                                      else {
                                          tag += "        <label class='label_check'><input type='radio' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                      }

                                      tag += "    </p>";

                                      loop++;
                                  }

                                  if (value.etcInsUseYn == "Y") {
                                      tag += "    <p>";

                                      if (jqXHR.atcEtcInsCont != null && jqXHR.atcEtcInsCont != "") {
                                          tag += "        <label class='label_check'><input type='radio' id='atcRsltInsCont_" + (index + 1) + "_" + (loop + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='etc_" + (index + 1) + " form_check' value='" + (loop + 1) + "' checked='checked' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='atcEtcInsCont_" + (index + 1) + "' name='atcEtcInsCont_" + (index + 1) + "' value='" + jqXHR.atcEtcInsCont + "' style='width:44%' class='form_input' />";
                                      }
                                      else {
                                          tag += "        <label class='label_check'><input type='radio' id='atcRsltInsCont_" + (index + 1) + "_" + (loop + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='etc_" + (index + 1) + " form_check' value='" + (loop + 1) + "' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='atcEtcInsCont_" + (index + 1) + "' name='atcEtcInsCont_" + (index + 1) + "' value='' style='width:44%' class='form_input' />";
                                      }

                                      tag += "    </p>";
                                  }

                                  break;
                              case "02":
                                  // 복수 선택
                                  loop = 0;

                                  for (var i = 0; i < value.atcListCont.split("|").length; i++) {
                                      tag += "    <p>";

                                      for (var j = 0 + loop_1; j < jqXHR.atcRsltInsCont.split("|").length; j++) {
                                          if ((i + 1) == parseInt(jqXHR.atcRsltInsCont.split("|")[j])) {
                                              tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' checked='checked' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";

                                              loop_1++;
                                              loop_2++;

                                              break;
                                          }
                                          else {
                                              tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";

                                              loop_2++;

                                              break;
                                          }
                                      }

                                      if (i >= parseInt(jqXHR.atcRsltInsCont.split("|")[jqXHR.atcRsltInsCont.split("|").length - 1])) {
                                          tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (i + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + (i + 1) + "' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                      }

                                      tag += "    </p>";

                                      loop++;
                                  }

                                  if (value.etcInsUseYn == "Y") {
                                      tag += "    <p>";

                                      if (jqXHR.atcEtcInsCont != null && jqXHR.atcEtcInsCont != "") {
                                          tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (loop + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='etc_" + (index + 1) + " form_check' checked='checked' value='" + (loop + 1) + "' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='atcEtcInsCont_" + (index + 1) + "' name='atcEtcInsCont_" + (index + 1) + "' value='" + jqXHR.atcEtcInsCont + "' class='form_input' style='width:44%' />";
                                      }
                                      else {
                                          tag += "        <label class='label_check'><input type='checkbox' id='atcRsltInsCont_" + (index + 1) + "_" + (loop + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='etc_" + (index + 1) + " form_check' value='" + (loop + 1) + "' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='atcEtcInsCont_" + (index + 1) + "' name='atcEtcInsCont_" + (index + 1) + "' value='' class='form_input' style='width:44%' />";
                                      }

                                      tag += "    </p>";
                                  }

                                  break;
                              case "03":
                                  // 단답형
                                  tag += "    <p>";
                                  tag += "        <input type='text' id='atcRsltInsCont_" + (index + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' value='" + jqXHR.atcRsltInsCont + "' style='width:50%' class='form_input' />";
                                  tag += "    </p>";

                                  break;
                              default:
                                  // 서술형
                                  tag += "    <p>";
                                  tag += "        <textarea rows='3' cols='' id='atcRsltInsCont_" + (index + 1) + "' name='atcRsltInsCont_" + (index + 1) + "' class='form_textarea'>" + jqXHR.atcRsltInsCont + "</textarea>";
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
        var options = parent.surveyApplyPopupWin.options.content.data;

        fnPopupInit(options);

        // 버튼 - 저장
        $("#btnPopupSave").kendoButton({
            click:function(e) {
                var json = "";
                var result = true;

                for (var i = 0; i < $("#totalCnt").val(); i++) {
                    if (i > 0) {
                        json += ",";
                    }
                    else{
                        json += "{\"usrDefReqDocId\":\"" + $("#sUsrDefReqDocId").val() + "\", \"insertList\":[";
                    }

                    switch ($("[name='atcRsltInsCont_" + (i + 1)+ "']").attr("type")) {
                        case "radio":
                            if ($("input:radio[name='atcRsltInsCont_" + (i + 1) + "']:checked").val() == undefined) {
                                dms.notification.info((i + 1) + "<spring:message code='global.info.item.input' />");
                                result = false;

                                break;
                            }

                            if ($(".etc_" + (i + 1)).is(":checked")) {
                                if ($("#atcEtcInsCont_" + (i + 1)).val() == "") {
                                    dms.notification.info("<spring:message code='global.info.etc.input' />");
                                    $("#atcEtcInsCont_" + (i + 1)).focus();
                                    result = false;

                                    break;
                                }
                            }

                            json += "{";
                            json += "\"atcNo\":\"" + (i + 1) + "\"";
                            json += ",\"atcRsltInsCont\":\"" + $("input:radio[name='atcRsltInsCont_" + (i + 1) + "']:checked").val() + "\"";
                            json += ",\"atcEtcInsCont\":\"" + $("#atcEtcInsCont_" + (i + 1)).val() + "\"";
                            json += "}";

                            break;
                        case "checkbox":
                            var checkValue = "";

                            $("input:checkbox[name='atcRsltInsCont_" + (i + 1) + "']:checked").each(function() {
                                if (checkValue == "") {
                                    checkValue = $(this).val();
                                }
                                else {
                                    checkValue += "|" + $(this).val();
                                }
                            });

                            if (checkValue == "") {
                                dms.notification.info((i + 1) + "<spring:message code='global.info.item.input' />");
                                result = false;

                                break;
                            }

                            if ($(".etc_" + (i + 1)).is(":checked")) {
                                if ($("#atcEtcInsCont_" + (i + 1)).val() == "") {
                                    dms.notification.info("<spring:message code='global.info.etc.input' />");
                                    $("#atcEtcInsCont_" + (i + 1)).focus();
                                    result = false;

                                    break;
                                }
                            }

                            json += "{";
                            json += "\"atcNo\":\"" + (i + 1) + "\"";
                            json += ",\"atcRsltInsCont\":\"" + checkValue + "\"";
                            json += ",\"atcEtcInsCont\":\"" + $("#atcEtcInsCont_" + (i + 1)).val() + "\"";
                            json += "}";

                            break;
                        case "text":
                            if ($("#atcRsltInsCont_" + (i + 1)).val() == "") {
                                dms.notification.info((i + 1) + "<spring:message code='global.info.item.input' />");
                                result = false;

                                break;
                            }

                            json += "{";
                            json += "\"atcNo\":\"" + (i + 1) + "\"";
                            json += ",\"atcRsltInsCont\":\"" + $("#atcRsltInsCont_" + (i + 1)).val() + "\"";
                            json += ",\"atcEtcInsCont\":\"\"";
                            json += "}";

                            break;
                        default:
                            if ($("#atcRsltInsCont_" + (i + 1)).val() == "") {
                                dms.notification.info((i + 1) + "<spring:message code='global.info.item.input' />");
                                result = false;

                                break;
                            }

                            json += "{";
                            json += "\"atcNo\":\"" + (i + 1) + "\"";
                            json += ",\"atcRsltInsCont\":\"" + $("#atcRsltInsCont_" + (i + 1)).val() + "\"";
                            json += ",\"atcEtcInsCont\":\"\"";
                            json += "}";

                            break;
                    }
                }

                json += "]}";

                if (result) {
                    $.ajax({
                        url:"<c:url value='/cmm/sci/userDefinedApply/multiUserDefinedApply.do' />"
                      , data:json
                      , type:'POST'
                      , dataType:'json'
                      , async:false
                      , contentType:'application/json'
                      , error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                      , success:function(jqXHR, textStatus) {
                            parent.surveyApplyPopupWin.close();

                            // 정상적으로 반영 되었습니다.
                            options.callbackFunc("<spring:message code='global.info.success'/>");
                        }
                    });
                }
            }
        });

        // 버튼 - 닫기
        $("#btnPopupClose").kendoButton({
            click:function(e) {
                parent.surveyApplyPopupWin.close();
            }
        });
    });
</script>
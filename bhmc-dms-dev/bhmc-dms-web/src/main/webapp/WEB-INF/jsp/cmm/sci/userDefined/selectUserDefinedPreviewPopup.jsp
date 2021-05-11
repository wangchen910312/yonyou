<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <form id="searchForm">
        <input type="hidden" id="sUsrDefReqDocId" name="sUsrDefReqDocId" />
    </form>

    <div class="survey mt10" role="search" data-btnid="btnSearch">
        <div class="survey_content" style="height:376px;">
            <ul id="survey"></ul>
        </div>
    </div>
</section>

<script type="text/javascript">
    fnPopupInit = function(usrDefReqDocId) {
        var tag = "";

        $("#sUsrDefReqDocId").val(usrDefReqDocId);

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

                $.each(jqXHR.data, function(index, value) {
                    tag += "<li><h3>" + (index + 1) + ". " + value.atcNm + "</h3>";
                    tag += "<div class='answer_area'>";

                    switch (value.atcTp) {
                        case "01":
                            // 단일 선택
                            for ( var i = 0; i < value.atcListCont.split("|").length; i++) {
                                tag += "    <p>";
                                tag += "        <label class='label_check'><input type='radio' id='' name='' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                tag += "    </p>";
                            }

                            if (value.etcInsUseYn == "Y") {
                                tag += "    <p>";
                                tag += "        <label class='label_check'><input type='radio' id='' name='' class='form_check' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='' name='' class='form_input' style='width:44%;' />";
                                tag += "    </p>";
                            }

                            break;
                        case "02":
                            // 복수 선택
                            for ( var i = 0; i < value.atcListCont.split("|").length; i++) {
                                tag += "    <p>";
                                tag += "        <label class='label_check'><input type='checkbox' id='' name='' class='form_check' /> " + value.atcListCont.split("|")[i] + "</label>";
                                tag += "    </p>";
                            }

                            if (value.etcInsUseYn == "Y") {
                                tag += "    <p>";
                                tag += "        <label class='label_check'><input type='checkbox' id='' name='' class='form_check' /> <spring:message code='global.lbl.other' /></label> <input type='text' id='' name='' class='form_input' style='width:44%;' />";
                                tag += "    </p>";
                            }

                            break;
                        case "03":
                            // 단답형
                            tag += "    <p>";
                            tag += "        <input type='text' id='' name='' class='form_input' style='width:50%;' />";
                            tag += "    </p>";

                            break;
                        default:
                            // 서술형
                            tag += "    <p>";
                            tag += "        <textarea rows='3' cols='' id='' name='' class='form_textarea'></textarea>";
                            tag += "    </p>";

                            break;
                    }

                    tag += "</div></li>";
                });

                $("#survey").append(tag);
            }
        });
    }

    $(document).ready(function() {
        var options = parent.userDefinedPreviewPopupWin.options.content.data;

        fnPopupInit(options.usrDefReqDocId);
    });
</script>
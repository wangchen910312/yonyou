<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 설문 미리보기 팝업 -->
    <section id="window" class="pop_wrap">

        <div class="header_area">
            <div class="btn_right">
                <button id="btnClose" class="btn_m"><spring:message code="global.btn.close" /></button>
            </div>
        </div>

        <!-- 탭메뉴 전체 영역 -->
        <div class="tab_area mt0">

            <!-- 설문 -->
            <div>
                <div class="survey">
                    <h2><c:out value='${tmpl.subyTmplNm}'/></h2>
                    <div id="survey_content01" class="survey_content">
                        <ul>

                        </ul> <!-- end ul -->
                    </div>
                </div>
            </div>
            <!-- //설문 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //설문조사 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

//        $("#survey_content01 > ul").empty();
        var sSeq = "${stsfIvstSeq}";
        var sMakCd = "${makCd}";
        var sEmpId = "${empId}";
        var sIvstTp = "${ivstTp}";

        $.ajax({
            url:"<c:url value='/crm/mcm/marketingCampaign/selectSurveyPopups.do'/>",
            data:JSON.stringify({"sSeq":sSeq, "sMakCd":sMakCd, "sEmpId":sEmpId, "sIvstTp":sIvstTp}),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
        }).done(function(result) {

            //console.log("selectSurveyPopups.do result::::::::::");
            //console.log(result);

            var questionList = result["questionList"];
            var answerList = result["answerList"];

            var template = "";
            var result = "";
            var cmplReasonCont = "";
            var stsfIvstYn = "";

            var data = [];
            var lastIdx;

            // 시작헤드
            var headTmpl = '<li><h3>#:index #. #:qestCont # #:answSelCntCont #</h3><div class="answer_area">';

            // 라디오(객관식 단일)
            var singleTmpl = '<p><label class="label_check"><input type="radio" id="rad01_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                              'class="form_check"'+
                              'name="rad01_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                              'value="#:itemSeq #"'+
                              'onclick="return false;"'+
                              '#if(checkFlag === "Y"){#checked=checked#}#'+
                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#" data-score="#:answScoreVal#" /> #:answCont #</label></p>';

            // 체크박스(객관식 다중)
            var multiTmpl = '<p><label class="label_check"><input type="checkbox" id="chk01_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                              'class="form_check"'+
                              'name="chk01_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                              'value="#:itemSeq #"'+
                              'onclick="return false;"'+
                              '#if(checkFlag === "Y"){#checked=checked#}#'+
                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#" data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#"/>#:answCont #</label></p>';

            // 주관식
            var shortTmpl = '<textarea rows="4" cols="" id="txt01_#:subyTmplSeq #_#:subyTmplQestSeq #" maxlength="1333" '+
                              'class="form_textarea form_readonly" readonly'+
                              'name="txt01_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#" style="width:100%;">#:checkFlag #</textarea>';

            // 종료
            var tailTmpl = '</div></li>';

            //만족여부
            var stsfIvstYnTmpl = '<li style="border-top:1px solid black;"><h3><spring:message code="crm.lbl.stsfIvstYn"/></h3><div class="answer_area"><p>'
                               + '<label class="label_check"><input type="radio" id="stsfIvstY" name="stsfIvstYn" value="Y" class="form_check" onclick="return false;" '+'#if(stsfIvstYn === "Y"){#checked=checked#}#'+'/>&nbsp;<spring:message code="crm.lbl.satisfaction"/></label>&nbsp;&nbsp;'
                               + '<label class="label_check"><input type="radio" id="stsfIvstN" name="stsfIvstYn" value="N" class="form_check" onclick="return false;" '+'#if(stsfIvstYn === "N"){#checked=checked#}#'+'/>&nbsp;<spring:message code="crm.lbl.dissatisfied"/></label>'
                               + '</p></div></li>';

            // 총결
            var cmplReasonContTmpl = '<li><h3><spring:message code="crm.lbl.cmplReasonCont"/></h3><div class="answer_area">'+
                                      '<textarea rows="4" cols="" id="txt01_cmplReasonCont" maxlength="1333" '+
                                        'class="form_textarea form_readonly" readonly'+
                                        'name="txt01_cmplReasonCont'+
                                        'style="width:100%;">#:cmplReasonCont #</textarea></div></li>';

            //문제 for
            for(var i=0;i < questionList.length;i++){
                var subyTmplSeq = questionList[i].subyTmplSeq;
                var subyTmplQestSeq = questionList[i].subyTmplQestSeq;
                //체크박스의 경우 선택할수 있는  갯수가 정해져 있을경우 문제옆에 선택가능한 갯수를 표현해 준다.
                var answSelCntCont = "";
                if ( questionList[i].qestTpCd == "02" && questionList[i].answSelCnt > 0 ) {
                    answSelCntCont = '( <spring:message code="crm.lbl.selected" arguments="'+questionList[i].answSelCnt+'" /> )';
                };

                template = kendo.template(headTmpl);
                data = {
                        index:(i+1)
                        ,qestCont:questionList[i].qestCont
                        ,answSelCntCont:answSelCntCont
                }
                result += template(data);
                lastIdx = (data.index)+1;
                //답변 for
                for(var j=0;j < answerList.length;j++){
                    if(questionList[i].qestTpCd == "01"){
                        //객관식 단답형
                        if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                            template = kendo.template(singleTmpl);
                            data = {subyTmplSeq:answerList[j].subyTmplSeq
                                    ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                    , itemSeq:answerList[j].itemSeq
                                    , answCont:answerList[j].answCont
                                    , answScoreVal:answerList[j].answScoreVal
                                    , qestWgtVal:questionList[i].qestWgtVal
                                    , qestTpCd:questionList[i].qestTpCd
                                    , checkFlag:answerList[j].itemSeq == answerList[j].answSeq ? "Y":"N"
                            }
                            result += template(data);
                        }
                    }else if(questionList[i].qestTpCd == "02"){
                        //객관식 다답형
                        if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                            template = kendo.template(multiTmpl);
                            data = {subyTmplSeq:answerList[j].subyTmplSeq
                                    ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                    , itemSeq:answerList[j].itemSeq
                                    , answCont:answerList[j].answCont
                                    , answScoreVal:answerList[j].answScoreVal
                                    , qestWgtVal:questionList[i].qestWgtVal
                                    , qestTpCd:questionList[i].qestTpCd
                                    , checkFlag:answerList[j].itemSeq == answerList[j].answSeq ? "Y":"N"
                            }
                            result += template(data)
                        }
                    }else{
                        //주관식
                        if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                            template = kendo.template(shortTmpl);
                            data = {subyTmplSeq:answerList[j].subyTmplSeq
                                    ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                    , itemSeq:answerList[j].itemSeq
                                    , answScoreVal:answerList[j].answScoreVal
                                    , qestWgtVal:questionList[i].qestWgtVal
                                    , qestTpCd:questionList[i].qestTpCd
                                    , checkFlag:answerList[j].sbjvAnswCont != null ? answerList[j].sbjvAnswCont:""
                            }
                            result += template(data);
                        }
                    }

                    if(answerList[j].stsfIvstYn != "" && answerList[j].stsfIvstYn != null){
                        stsfIvstYn = answerList[j].stsfIvstYn;
                    }
                    if(answerList[j].cmplReasonCont != "" && answerList[j].cmplReasonCont != null){
                        cmplReasonCont = answerList[j].cmplReasonCont;
                    }
                }
            }

            //만족여부 추가
            template = kendo.template(stsfIvstYnTmpl);
            data = {stsfIvstYn:stsfIvstYn}
            result += template(data);//만족여부 추가

            template = kendo.template(cmplReasonContTmpl);
            data = {cmplReasonCont:cmplReasonCont}
            result += template(data);//총결

            result += tailTmpl;
            $("#survey_content01 > ul").append(result);
        });

        // 닫기 버튼.
        $("#btnClose").kendoButton({
            click:function(e){
                parent.marketingCampaignServeyPopup.close();
            }
        });

    });

 </script>
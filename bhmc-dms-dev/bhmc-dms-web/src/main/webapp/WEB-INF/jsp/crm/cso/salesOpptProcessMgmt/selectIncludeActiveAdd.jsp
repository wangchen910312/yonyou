<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

                <section class="group">
                    <div class="table_form form_width_100per"> <!-- 추적 시작-->
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
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.traceMth" /></span></th> <!-- 추적방식 -->
                                    <td>
                                        <input id="traceMthCd" name="traceMthCd" type="text" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.traceDt" /></span></th> <!-- 추적시간 -->
                                    <td colspan="2">
                                        <input id="traceDt" name="traceDt" type="text" class="form_datetimepicker"  data-json-obj="true" />
                                    </td>
                                    <th scope="row" id="callStartDtTh" ><span class="bu_required"><spring:message code="crm.lbl.callStartDt" /></span></th> <!-- 통화시작시간 -->
                                    <td colspan="2" id="callStartDtTd" >
                                        <input id="callStartDt" name="callStartDt" class="form_datetimepicker form_readonly"  data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.nextTraceMthCd" /></th> <!-- 다음추적방식 -->
                                    <td>
                                        <input id="nextTraceMthCd" name="nextTraceMthCd" type="text" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.nextTraceDt" /></th> <!-- 다음추적시간 -->
                                    <td colspan="2">
                                        <input id="nextTraceDt" name="nextTraceDt" type="text" class="form_datetimepicker"  data-json-obj="true" />
                                        <input id="callHisSeq" name="callHisSeq" type="text" style="display:none" data-json-obj="true" />
                                        <input id="callDialNum" name="callDialNum" type="text" style="display:none" data-json-obj="true" />
                                        <input id="recFileId" name="recFileId" type="text" style="display:none" data-json-obj="true" />
                                    </td>
                                    <th scope="row" id="callEndDtTh" ><span class="bu_required"><spring:message code="crm.lbl.currencyStartDt" /></span></th> <!-- 통화종료시간 -->
                                    <td colspan="2" id="callEndDtTd" >
                                        <input id="callEndDt" name="callEndDt" class="form_datetimepicker form_readonly"  data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.traceCont" /></span></th> <!-- 추적상황 -->
                                    <td colspan="7">
                                        <textarea id="traceCont" name="traceCont" rows="5" class="form_textarea" maxlength="500" data-json-obj="true" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.activeGrade" /></span></th> <!-- 추적등급 -->
                                    <td>
                                        <input id="traceGradeCd" name="traceGradeCd" type="text" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                    <th scope="row"><div class="btnStep02 btnStep09 btnStep08" style="display:none;"><span class="bu_required"><spring:message code="crm.lbl.validCheck" /></span></div></th> <!-- 유효성판단 -->
                                    <td>
                                        <div class="btnStep02 btnStep09 btnStep08" style="display:none;"><input id="validGradeCd" name="validGradeCd" type="text" class="form_comboBox"  data-json-obj="true" /></div>
                                    </td>
                                    <th scope="row"><div class="btnStep02 btnStep09 btnStep08" style="display:none;"><spring:message code="crm.lbl.invalidReason" /></div></th> <!-- 무효원인 -->
                                    <td>
                                        <div class="btnStep02 btnStep09 btnStep08" style="display:none;"><input id="invalidCauCd" name="invalidCauCd" type="text" class="form_comboBox"  data-json-obj="true" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 추적 끝-->
                    <!-- 고객 정보 (읽기전용) 시작 -->
                    <div class="table_form form_width_100per mt5"> <!-- 고객정보 시작-->
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
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr class="personalTrR">
                                    <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                    <td>
                                        <input id="custTpR" name="custTpR" class="form_input form_readonly"  readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                                    <td>
                                        <input id="custNmSearchR" name="custNmSearchR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.hpNo" /></th> <!-- 이동전화 -->
                                    <td>
                                        <input id="hpNoR" name="hpNoR" type="text" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                    <td>
                                        <input id="telNoR" name="telNoR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                                <tr class="personalTrR">
                                    <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                                    <td>
                                        <input id="wechatIdR" name="wechatIdR" type="text" value="" class="form_input form_readonly" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.sex' /></th> <!-- 성별 -->
                                    <td>
                                        <input id="sexCdR" name="sexCdR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                    <td>
                                        <input id="emailNmR" name="emailNmR" type="email" value="" class="form_input form_readonly" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                    <td>
                                        <input id="custNoR" name="custNoR" type="text" class="form_input form_readonly" readonly  />
                                    </td>
                                </tr>
                                <tr class="corporateTrR" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                    <td>
                                        <input id="custTpCR" name="custTpCR" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.corporation" /></th> <!-- 법인명 -->
                                    <td>
                                        <input id="custNmSearchCR" name="custNmSearchCR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                                    <td>
                                        <input id="mathDocTpCR" name="mathDocTpCR" class="form_input form_readonly" readonly   />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                    <td>
                                        <input id="ssnCrnNoCR" name="ssnCrnNoCR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                                <tr class="corporateTrR" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                    <td>
                                      <input id="bizcondCdCR" name="bizcondCdCR" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                    <td>
                                        <input id="officeTelNoCR" name="officeTelNoCR" type="text" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                                    <td>
                                        <input id="wechatIdCR" name="wechatIdCR" type="text"  class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                    <td>
                                        <input id="custNoCR" name="custNoCR" type="text" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.addrNm" /></th> <!-- 주소 -->
                                    <td colspan="6">
                                        <input id="addrFullR" name="addrFullR" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div> <!-- 고객정보 끝-->

                    <div class="table_form form_width_100per mt5"> <!-- 정보유형 영역 시작 -->
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
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                      <th scope="row"><spring:message code='crm.lbl.infoType' /></th> <!-- 정보유형 -->
                                      <td>
                                        <input id="infoTpR" name="infoTpR" type="text" class="form_input form_readonly" readonly />
                                      </td>
                                      <th scope="row"><spring:message code='crm.lbl.approchLocation' /></th> <!-- 정보경로 -->
                                      <td>
                                          <input id="holdTpR" name="holdTpR" class="form_input form_readonly" readonly />
                                      </td>
                                      <td colspan="2">
                                          <input id="holdDetlTpSeqR" name="holdDetlTpSeqR" class="form_input form_readonly" readonly />
                                      </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.payMethod' /></th> <!-- 지불방식 -->
                                    <td>
                                        <input id="payTpR" name="payTpR" type="text" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.plateNum' /></th> <!-- 현지번호판예정 -->
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left" style="width:16%" >
                                                <label class="label_check ml5"><input id="localCarRegNoYnR" type="checkbox" class="form_check" unchecked disabled /></label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionCarline' /></th> <!-- 의향차종 -->
                                    <td>
                                        <input id="intrCarlineCdR" name="intrCarlineCdR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.intentionModel' /></th> <!-- 의향모델 -->
                                    <td colspan="3">
                                        <input id="intrModelCdR" name="intrModelCdR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /></th> <!-- 의향색상 -->
                                    <td>
                                        <input id="intrColorCdR" name="intrColorCdR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 정보유형 영역 끝 -->
                    <div class="table_form form_width_100per mt5"> <!-- 견적정보 영역 시작 -->
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
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.estimateInfo' /></th> <!-- 견적정보 -->
                                    <td>
                                        <input id="estimateContR" name="estimateContR" type="text" class="form_input form_readonly" readonly  />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.promotionCont' /></th> <!-- 판촉내용 -->
                                    <td colspan="5">
                                        <input id="salesContR" name="salesContR" type="text" value="" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.remark' /></th> <!-- 비고 -->
                                    <td colspan="7">
                                        <input id="remarkR" name="remarkR" type="text" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 견적정보 영역 끝 -->

                    <!-- 고객 정보 (읽기전용) 끝 -->
                </section>
                <input type="hidden" id="btnCustSearchR" />

 <script type="text/javascript">

    $(document).ready(function() {

        $("#traceMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(traceMthCdList)
            , index:0
        });

        $("#traceDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            , minTime:"08:00"
            , maxTime:"24:00"
            ,change:function(){
                var value = this.value();
                var nextTraceDt = $("#nextTraceDt").data("kendoExtMaskedDateTimePicker").value();
                if ((value != null) && (nextTraceDt != null)) {
                    if (nextTraceDt < value){
                       dms.notification.warning("<spring:message code='crm.lbl.nextTraceDt' var='returnMsg' /><spring:message code='crm.lbl.traceDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
                       this.value(' ');
                    }
                }
            }
        });
        $("#traceDt").data("kendoExtMaskedDateTimePicker").value(new Date());

        $("#nextTraceMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(traceMthCdList)
            , index:0
        });

        $("#nextTraceDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            , minTime:"08:00"
            , maxTime:"24:00"
            ,change:function(){
                var value = this.value();
                var traceDt = $("#traceDt").data("kendoExtMaskedDateTimePicker").value();
                if ((value != null) && (traceDt != null)) {
                    if (traceDt > value){
                       dms.notification.warning("<spring:message code='crm.lbl.nextTraceDt' var='returnMsg' /><spring:message code='crm.lbl.traceDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
                       this.value(' ');

                    }
                }
            }
        });

        $("#callStartDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            , minTime:"08:00"
            , maxTime:"24:00"
        });
        $("#callStartDt").data("kendoExtMaskedDateTimePicker").readonly(true);
        $("#callEndDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            , minTime:"08:00"
            , maxTime:"24:00"
        });
        $("#callEndDt").data("kendoExtMaskedDateTimePicker").readonly(true);

        $("#traceGradeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(traceGradeCdList)
            , index:0
            , change:function(){
                var nextTraceDtTimePicker = $("#nextTraceDt").data("kendoExtMaskedDateTimePicker");
                var nextTraceDt = nextTraceDtTimePicker.value();

                if ( dms.string.isEmpty(nextTraceDt)){
                    var traceGradeCd = this.value();
                    nextTraceDtTimePicker.value(fn_nextTraceDtTimePicker(traceGradeCd));
                    if (dms.string.isEmpty($("#nextTraceMthCd").data("kendoExtDropDownList").value())){
                        $("#nextTraceMthCd").data("kendoExtDropDownList").value("03");
                    }
                }
            }
        });

        $("#validGradeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(validGradeCdList)
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                console.log(selcmmCd);
                if (selcmmCd == "03"){
                    $("#invalidCauCd").data("kendoExtDropDownList").enable(true);
                } else {
                    $("#invalidCauCd").data("kendoExtDropDownList").value(" ");
                    $("#invalidCauCd").data("kendoExtDropDownList").enable(false);
                }
            }
        });

        $("#invalidCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(invalidCauCdList)
            , index:0
        });
        $("#invalidCauCd").data("kendoExtDropDownList").enable(false);

        $("#obCallPopupWindow").parent().find(".k-window-actions").on("click", function(){

            console.log("x 아이콘 클릭");
            dms.window.confirm({
                message:"<spring:message code='crm.info.callDialCloseConfirm'/>"            // 통화 정보가 저장되지 않습니다. 닫으시겠습니까? [번역]
                ,callback:function(result){

                    console.log("닫을까? : ",result)

                    if(result){
                        console.log("창닫기")
                        obCallPopupWindow.close();
                    }else{
                    console.log("안닫음")
                        return false;
                    }
                    return false;

                }
            });

            return false;

        });

        // 전화걸기
        $("#btnCtlKeyPadCall").kendoButton({
            click:function(e){

                var hpNo = $("#hpNo").val();
                var custNo = $("#custNo").val();

                callDeviceInit();   // 전화걸기시 디바이스 상태를 초기화해줌.

                obCallPopupWindow = dms.window.popup({
                    windowId:"obCallPopupWindow"
                    , title:"<spring:message code='crm.title.OBcall' />"        //전화걸기
                    , width:"250px"
                    , height:"410px"
                    , content:{
                        url:"<c:url value='/crm/cmm/dialPad/selectDialPadPopup.do'/>"
                        , data:{
                            "autoBind":false
                            , "custNo" : custNo
                            , "hpNo" : hpNo
                            , "callbackFunc" : function(data){
                                callDeviceInit();   // 전화걸기시 디바이스 상태를 초기화해줌.
                                if( data !== null){
                                    //vocActiveInsert(data.callHisSeq, data.recFileId, data.callStartDt, data.callEndDt);
                                    //$("body").scrollTop($(document).height());      // 하단 활동 그리드로 위치
                                    // 전송 / 이 완료 되었습니다.
                                    //dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                    $("#callHisSeq").val(data.callHisSeq);
                                    $("#callDialNum").val(data.callDialNum);
                                    $("#recFileId").val(data.callFileNm);
                                    $("#callStartDt").data("kendoExtMaskedDateTimePicker").value(data.callStartDt);
                                    $("#callEndDt").data("kendoExtMaskedDateTimePicker").value(data.callEndDt);

                                    if (data.callEndDt != null) {
                                        $("#traceMthCd").data("kendoExtDropDownList").value("03");
                                        $("#traceDt").data("kendoExtMaskedDateTimePicker").value(data.callStartDt);
                                    }
                                };
                                obCallPopupWindow.close();
                            }
                        }
                    }
                });

                $("#obCallPopupWindow").parent().find(".k-window-actions").on("click", function(){

                    dms.window.confirm({
                        message:"<spring:message code='crm.info.callDialCloseConfirm'/>"            // 통화 정보가 저장되지 않습니다. 닫으시겠습니까? [번역]
                        ,callback:function(result){

                            if(result){
                                obCallPopupWindow.close();
                            }else{
                                return false;
                            }
                            return false;

                        }
                    });

                    return false;

                });

            }
        });
        // 추적저장 버튼.
        $("#btnCtlSaveTrace").kendoButton({
            click:function(e){

                var traceMthCd = $("#traceMthCd").data("kendoExtDropDownList").value();
                var traceDt = $("#traceDt").data("kendoExtMaskedDateTimePicker").value();
                var traceCont = $("#traceCont").val();
                var traceGradeCd = $("#traceGradeCd").data("kendoExtDropDownList").value();
                var nextTraceDt = $("#nextTraceDt").data("kendoExtMaskedDateTimePicker").value();
                var nextTraceMthCd = $("#nextTraceMthCd").data("kendoExtDropDownList").value();
                var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();
                var mngScIdCtrl = "${mngScIdCtrl}";
                //liuxueying add 线索邀约线索有效性判断 start
                var validGradeCd = $("#validGradeCd").data("kendoExtDropDownList").value();
                //liuxueying add 线索邀约线索有效性判断end
                if ( dms.string.isEmpty(traceMthCd)){
                    dms.notification.warning("<spring:message code='crm.lbl.traceMth' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
                if ( dms.string.isEmpty(traceDt)){
                    dms.notification.warning("<spring:message code='crm.lbl.traceDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
                if ( dms.string.isEmpty(traceCont)){
                    dms.notification.warning("<spring:message code='crm.lbl.traceCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
                if ( leadStatCd == "02" && dms.string.isEmpty(validGradeCd)){
                    dms.notification.warning("<spring:message code='crm.lbl.validCheck' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
                /*
                * '실패' 단계에서는 '추적저장'을 할 수 없음.
                */
                if (leadStatCd == "09") {
                    if (mngScIdCtrl == "N") {
                       // 권한이 없습니다.
                       dms.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                       return false;
                   }
                }

                /*
                * 전시장을 통해 등록 된 곡개의 경우 추적등급이 없음.
                * '잠재고객DB'단계에서는 추적등급을 필수 체크 하지 않는다.
                */
                if (leadStatCd != "09" && leadStatCd != "08") {
                    if ( dms.string.isEmpty(traceGradeCd)){
                        dms.notification.warning("<spring:message code='crm.lbl.activeGrade' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                if ( dms.string.isNotEmpty(nextTraceDt)){
                    if (dms.string.isEmpty(nextTraceMthCd)) {
                        dms.notification.warning("<spring:message code='crm.lbl.nextTraceMthCd' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                        return false;
                    }

                    if (traceDt > nextTraceDt){
                        dms.notification.warning("<spring:message code='crm.lbl.nextTraceDt' var='returnMsg' /><spring:message code='crm.lbl.traceDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
                        return false;
                    }
                }

                if ( dms.string.isNotEmpty(nextTraceMthCd)){
                    if (dms.string.isEmpty(nextTraceDt)) {
                        dms.notification.warning("<spring:message code='crm.lbl.nextTraceDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                        return false;
                    }

                    if (traceDt > nextTraceDt){
                        dms.notification.warning("<spring:message code='crm.lbl.nextTraceDt' var='returnMsg' /><spring:message code='crm.lbl.traceDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
                        return false;
                    }
                }

                var salesOpptTraceParam =
                    $("#activeAddTabDiv").serializeObject(
                            $("#activeAddTabDiv").serializeArrayInSelector("[data-json-obj='true']")
                    );

                salesOpptTraceParam["saleOpptSeq"] = $("#seq").val();
                salesOpptTraceParam["cSeq"] = $("#cSeq").val();
                salesOpptTraceParam["traceMthCd"] = traceMthCd;
                salesOpptTraceParam["traceDt"] = traceDt;
                salesOpptTraceParam["nextTraceMthCd"] = $("#nextTraceMthCd").data("kendoExtDropDownList").value();
                salesOpptTraceParam["nextTraceDt"] = $("#nextTraceDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptTraceParam["traceGradeCd"] = $("#traceGradeCd").data("kendoExtDropDownList").value();
                salesOpptTraceParam["validGradeCd"] = $("#validGradeCd").data("kendoExtDropDownList").value();
                salesOpptTraceParam["invalidCauCd"] = $("#invalidCauCd").data("kendoExtDropDownList").value();
                salesOpptTraceParam["traceCont"] = traceCont;
                salesOpptTraceParam["leadStatCd"] = leadStatCd;
                salesOpptTraceParam["callHisSeq"] = $("#callHisSeq").val();
                salesOpptTraceParam["callDialNum"] = $("#callDialNum").val();
                salesOpptTraceParam["recFileId"] = $("#recFileId").val();
                salesOpptTraceParam["callStartDt"] = $("#callStartDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptTraceParam["callEndDt"] = $("#callEndDt").data("kendoExtMaskedDateTimePicker").value();
//                 salesOpptTraceParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                salesOpptTraceParam["mngScId"] = $("#beforeMngScId").val();

                console.log("btnCtlSaveTrace Saving of Request Info. !!");
                console.log(salesOpptTraceParam);

                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptTraceMgmts.do' />"
                    ,data:JSON.stringify(salesOpptTraceParam)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        console.log("error !!!");
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(result){
                        console.log(result);
                        console.log("success!!!!");
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        $("#traceMthCd").data("kendoExtDropDownList").value("");
                        $("#traceDt").data("kendoExtMaskedDateTimePicker").value("");
                        $("#traceCont").val("");
                        //$("#traceGradeCd").data("kendoExtDropDownList").value("");
                        //$("#validGradeCd").data("kendoExtDropDownList").value("");
                        //$("#invalidCauCd").data("kendoExtDropDownList").value("");
                        $("#nextTraceMthCd").data("kendoExtDropDownList").value("");
                        $("#nextTraceDt").data("kendoExtMaskedDateTimePicker").value("");

                    }
                    ,beforeSend:function(xhr) {
                       dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                       dms.loading.hide();
                    }
                }).done(function(result) {
                    console.log("Done!!!!");
                });

            }
        });

        $("#btnCustSearchR").click(function(){
            var param = {};
            param["sCustNo"] = $("#custNo").val();

            console.log("btnCustSearchR Call !!");
            console.log(param);

            $.ajax({
                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
                , data:JSON.stringify(param)
                , type:'POST'
                , dataType:'json'
                , contentType:'application/json'
                , error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result) {
                console.log("btnCustSearchR !!");
                console.log(result);

                //var leadStatCd = result.data[0].leadStatCd;

                $("#custNmSearchR").val(result.data[0].custNm);
                $("#hpNoR").val(result.data[0].hpNo);
                $("#telNoR").val(result.data[0].telNo);
                $("#officeTelNoR").val(result.data[0].officeTelNo);
                $("#wechatIdR").val(result.data[0].wechatId);
                $("#emailNmR").val(result.data[0].emailNm);
                $("#addrFullR").val(result.data[0].addrFull);
                $("#infoTpR").val(result.data[0].infoTpNm);
                $("#holdTpR").val(result.data[0].holdTpNm);
                if (result.data[0].holdDetlTpSeq != 0) {
                    $("#holdDetlTpSeqR").val(result.data[0].holdDetlTpSeqNm);
                }
                $("#payTpR").val(result.data[0].payTpNm);
                $("#intrCarlineCdR").val(result.data[0].intrCarlineNm);
                $("#intrModelCdR").val(result.data[0].intrModelNm);
                $("#intrColorCdR").val(result.data[0].intrColorNm);

                $("#estimateContR").val(result.data[0].estimateCont);
                $("#salesContR").val(result.data[0].salesCont);
                $("#remarkR").val(result.data[0].remark);
                $("#sexCdR").val(result.data[0].sexNm);
                if (result.data[0].localCarRegNoYn == 'Y'){ $("#localCarRegNoYnR").prop("checked", true) };

                $("#custTpR").val(result.data[0].custTpNm);
                $("#custTpCR").val(result.data[0].custTpNm);
                $("#custNoR").val(result.data[0].custNo);

                if (result.data[0].custTp == "01") {
                    $(".personalTrR").show();
                    $(".corporateTrR").hide();
                } else {
                    $("#custNmSearchCR").val(result.data[0].custNm);
                    $("#mathDocTpCR").val(result.data[0].mathDocTpNm);
                    $("#ssnCrnNoCR").val(result.data[0].ssnCrnNo);
                    $("#bizcondCdCR").val(result.data[0].bizcondNm);
                    $("#officeTelNoCR").val(result.data[0].officeTelNo);
                    $("#wechatIdCR").val(result.data[0].wechatId);
                    $("#custNoCR").val(result.data[0].custNo);

                    $(".personalTrR").hide();
                    $(".corporateTrR").show();
                }

            });
         });


    });



    /*****************************************************************************
     ******************************* 콜센터 상태호출 *********************************
     *****************************************************************************/
    var XMLHttpReqOB;
    var _callDeviceIpNo = "";
    var _isCallPcOB = "";
    var _userId = "";
    var _callStatCd = "";

    // 디바이스 상태를 대기 상태로 초기화한다.
    function callDeviceInit() {

        $("#callStartDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#callEndDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#callHisSeq").val("");
        $("#callDialNum").val("");
        $("#recFileId").val("");

        var params = "event_type=8&line=1&ibseq=&obseq=&device_id=&device_ip=&caller=&RingCnt=&device_port=&duration=&TimeLong=&FilePath=&date=&userId="+_userId;

        $.ajax({
            url:"<c:url value='/crm/cal/callCenter/callReceive.do' />?"+params
            ,type:'GET'                        //조회요청
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors);
            }
        }).done(function(jqXHR, textStatus) {
        });

    };

    function createXMLHttpRequestOB() {
        if(window.XMLHttpRequest) { //Mozilla
            XMLHttpReqOB = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { //IE
            try {
                XMLHttpReqOB = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReqOB = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }

    // 서버에 상태 호출.
    function sendRequestOB() {
        createXMLHttpRequestOB();
        var url = "<c:url value='/crm/cal/callCenter/callStatus.do' />";
        XMLHttpReqOB.open("POST", url, true);
        XMLHttpReqOB.onreadystatechange = processResponseOB;
        XMLHttpReqOB.send(null);
    };

    // 1초마다 호출.
    function processResponseOB() {
        if (XMLHttpReqOB.readyState == 4) {
            if (XMLHttpReqOB.status == 200) {

                var callStatus = JSON.parse(XMLHttpReqOB.responseText);

                var loginUsrId = "${loginUsrId}";
                var bfMngScId = $("#beforeMngScId").val();
                console.log("OPPT OB:",callStatus.callDevicePc+" | userId:"+_userId+" | Status:"+_callStatCd);

                // 콜센터 PC 인경우 전화걸기 버튼 보여주기
                if ( callStatus.callDevicePc && (loginUsrId == bfMngScId)) {

                    _isCallPcOB = callStatus.callDevicePc;    // 초기화 번수선언
                    _userId = callStatus.userId;
                    _callStatCd = callStatus.callStatCd;
                    $("#btnCtlKeyPadCall").removeClass("hidden");
                    $("#callStartDtTh").removeClass("hidden");
                    $("#callStartDtTd").removeClass("hidden");
                    $("#callEndDtTh").removeClass("hidden");
                    $("#callEndDtTd").removeClass("hidden");

                    setTimeout("sendRequestOB()", 1000);

                } else {

                    $("#callStartDtTh").addClass("hidden");
                    $("#callStartDtTd").addClass("hidden");
                    $("#callEndDtTh").addClass("hidden");
                    $("#callEndDtTd").addClass("hidden");

                    $("#btnCtlKeyPadCall").addClass("hidden");

                };

            } else {
                // error
            }
        }
    };

    sendRequestOB();    // 콜상태 호출
    /*****************************************************************************
     ******************************* 콜센터 상태호출 *********************************
     *****************************************************************************/

     /*****************************************************************************
      ******************************* 기타 function *****************************
      *****************************************************************************/
    function fn_nextTraceDtTimePicker(traceGradeCd) {
        var today = new Date();
        var nextDt = 0;
        today.setDate(today.getDate() + parseInt(nextDt));
        if ( dms.string.isNotEmpty(traceGrdMap[traceGradeCd])){
            nextDt = traceGrdMap[traceGradeCd];
            today.setDate(today.getDate() + parseInt(nextDt));
        }
        return today;
    }


</script>
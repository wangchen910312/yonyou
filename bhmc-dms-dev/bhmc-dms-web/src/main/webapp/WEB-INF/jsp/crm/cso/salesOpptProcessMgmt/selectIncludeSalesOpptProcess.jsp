<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

                <div id="salesOpptProcForm">   <!--  salesOpptProcForm Start -->
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
                                <tr class="personalTr">
                                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custTp" /></span></th> <!-- 고객유형 개인/법인-->
                                    <td>
                                        <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                    <td>
                                        <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input" maxlength="30"  />
                                        <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hpNo" /></span></th> <!-- 이동전화 -->
                                    <td>
                                        <input id="hpNo" name="hpNo" type="text" class="form_input numberic getCustDupByKey"  maxlength="11" data-type="mobile" pattern="\d" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                    <td>
                                        <input id="telNo" name="telNo" type="text" value="" class="form_input numberic" maxlength="20" data-type="tel"  data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                                    <td>
                                        <input id="wechatId" name="wechatId" type="text" value="" class="form_input" maxlength="20" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.sex' /></th> <!-- 성별 -->
                                    <td>
                                        <input id="sexCd" name="sexCd" type="text" value="" class="form_comboBox" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                    <td>
                                        <input id="emailNm" name="emailNm" type="email" value="" class="form_input form_email" maxlength="40" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                    <td>
                                        <input id="custNo" name="custNo" type="text" class="form_input form_readonly" readonly data-json-obj="true" />
                                        <input id="custCd" name="custCd" type="hidden"/>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custTp" /></span></th> <!-- 고객유형 개인/법인-->
                                    <td>
                                        <input id="custTpC" name="custTpC" class="form_comboBox" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corporation" /></span></th> <!-- 법인명 -->
                                    <td>
                                        <input id="custNmSearchC" name="custNmSearchC" type="text" value="" class="form_input" maxlength="30"  />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMng" /></span></th> <!-- 연계인이름 -->
                                    <td>
                                        <%--
                                            <input id="relCustNmSearch" name="relCustNmSearch" type="text" value="" class="form_input onKey_down_relCust"  maxlength="30" /> <!--  onKey_down -->
                                            <input id="relCustNo" name="relCustNo" type="hidden" value="" class="form_input" data-json-obj="true" />
                                            <input id="relSeq" name="relSeq" type="hidden" value="" class="form_input" data-json-obj="true" />
                                            <input id="relBefCustNo" name="relBefCustNo" type="hidden" value="" class="form_input" data-json-obj="true" />
                                            <a href="#;" class="relCustSearch"><spring:message code="global.lbl.custSearch" /></a>
                                            --%>
                                            <input id="relCustNm" name="relCustNm" type="text" value="" class="form_input" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMngHpno" /></span></th> <!-- 연계인이동전화 -->
                                    <td>
                                        <input id="relCustHpNo" name="relCustHpNo" type="text" class="form_input numberic getCustDupByKey" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                    <td>
                                      <input id="bizcondCdC" name="bizcondCdC" class="form_comboBox"  />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                                    <td>
                                        <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"   />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                    <td>
                                        <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input corpNumChk getCustMathDocDupByKey"  maxlength="30" style="text-transform: uppercase"/>
                                        <input id="mathDocTp" name="mathDocTp" type="hidden" value="" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                    <td>
                                        <input id="custNoC" name="custNoC" type="text" class="form_input form_readonly" readonly />
                                    </td>
<%--                                     <th scope="row"><span class="bu_required"><spring:message code="global.lbl.officeTelNo" /></span></th> <!-- 회사전화 --> --%>
<!--                                     <td> -->
<!--                                         <input id="officeTelNoC" name="officeTelNoC" type="text" class="form_input numberic getCustDupByKey"  data-type="tel" maxlength="20" pattern="\d" /> -->
<!--                                     </td> -->
<%--                                     <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id --> --%>
<!--                                     <td> -->
<!--                                         <input id="wechatIdC" name="wechatIdC" type="text"  class="form_input" maxlength="20"  /> -->
<!--                                     </td> -->
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.addrNm" /></th> <!-- 주소 -->
                                    <td colspan="6">
                                        <input id="addrFull" name="addrFull" class="form_input form_readonly"/>
                                    </td>
                                    <td colspan="2">
                                        <button type="button" id="btnAddrHidden" class="btn_xs2 btn_detail"><spring:message code="crm.lbl.more" /></button>
                                        <button type="button" id="btnAddAddress" class="btn_xs2 btn_add"><spring:message code="global.btn.add" /></button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div> <!-- 고객정보 끝-->

                    <section class="group" id="hiddenAddrTable" style="display:none;"> <!-- 주소정보 시작 -->
<!--                     <div class="header_area"> -->
<%--                         <h2 class="title_basic"><spring:message code='global.title.addr' /></h2> --%>
<!--                         <div class="btn_right"> -->
<%--                             <button class="btn_s btn_save" id="btnCtlSaveAddress" ><spring:message code="global.btn.save" /></button> <!-- 주소저장 --> --%>
<%--                             <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 --> --%>
<%--                             <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 --> --%>
<!--                         </div> -->
<!--                     </div> -->
                    <div class="mt5">
                        <div class="table_grid">
                            <div id="addrGrid"></div>
                        </div>
                    </div>
                    </section> <!-- //주소정보 끝 -->

                    <!-- 예상구매정보 -->
                    <div class="header_area"> <!-- 예상구매정보 타이틀 시작 -->
                        <h2 class="title_basic"><spring:message code='crm.lbl.expcPurcInfo' /></h2> <!-- 예상구매정보 -->
                    </div> <!-- 예상구매정보 타이틀 끝 -->
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
                                      <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.infoType' /></span></th> <!-- 정보유형 -->
                                      <td>
                                        <input id="infoTp" name="infoTp" type="text" class="form_comboBox"  data-json-obj="true" />
                                      </td>
                                      <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.approchLocation' /></span></th> <!-- 정보경로 -->
                                      <td>
                                          <input id="holdTp" name="holdTp" class="form_comboBox" data-json-obj="true" />
                                      </td>
                                      <td colspan="2">
                                          <input id="holdDetlTpSeq" name="holdDetlTpSeq" class="form_comboBox" data-json-obj="true" />
                                      </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.payMethod' /></th> <!-- 지불방식 -->
                                    <td>
                                        <input id="payTp" name="payTp" type="text" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.plateNum' /></th> <!-- 현지번호판예정 -->
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left" style="width:16%" >
                                                <label class="label_check ml5"><input id="localCarRegNoYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /></label>
                                            </div>
                                        </div>
                                    </td>
<%--                                     <th scope="row"><spring:message code='crm.lbl.expectPureTime' /></th> <!-- 예상구매시간코드 -->
                                    <td>
                                        <input id="expcPurcHmCd" name="expcPurcHmCd" type="text" class="form_comboBox"  data-json-obj="true" />
                                    </td> --%>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.intentionCarline' /></span></th> <!-- 의향차종 -->
                                    <td>
                                        <input id="intrCarlineCd" name="intrCarlineCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.intentionVariant' /></th> <!-- 의향차관 -->
                                    <td colspan="3">
                                        <input id="intrFscpModtpCd" name="intrFscpModtpCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /></th> <!-- 의향색상 -->
                                    <td>
                                        <input id="intrColorCd" name="intrColorCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 정보유형 영역 끝 -->

                    <!-- 협의정보 -->
                    <div class="header_area"> <!-- 협의정보 타이틀 시작 -->
                        <h2 class="title_basic"><spring:message code='crm.lbl.agrmntInfo' /></h2> <!-- 협의정보 -->
                    </div> <!-- 협의정보 타이틀 끝 -->
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
                                        <input id="estimateCont" name="estimateCont" type="text" class="form_input" maxlength="50" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.promotionCont' /></th> <!-- 판촉내용 -->
                                    <td colspan="5">
                                        <input id="salesCont" name="salesCont" type="text" value="" class="form_input" maxlength="100" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.remark' /></th> <!-- 비고 -->
                                    <td colspan="7">
                                        <input id="remark" name="remark" type="text" class="form_input"  maxlength="100" data-json-obj="true" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 견적정보 영역 끝 -->

                    <div class="table_form form_width_100per mt5"> <!-- 리드소유인 영역 시작 -->
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
                                    <th scope="row"><spring:message code='crm.lbl.prsn' /></th> <!-- 담당자 -->
                                    <td>
                                        <input id="mngScId" name="mngScId" type="text" class="form_comboBox"  data-json-obj="true" />
                                        <input id="beforeMngScId" name="beforeMngScId" type="hidden" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.leadStat' /></th> <!-- 리드상태 -->
                                    <td>
                                        <input id="leadStatCd" name="leadStatCd" type="text" value="" class="form_comboBox" data-json-obj="true" />
                                        <input id="befLeadStatCd" name="befLeadStatCd" type="hidden" />
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.channelType' /></th> <!-- 판매채널 -->
                                    <td>
                                        <input id="dstbChnNm" name="dstbChnNm" type="text" class="form_input form_readonly" readonly />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 리드소유인 영역 끝 -->
                    <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
                    <input type="hidden" id="btnCustSearch" />
                    <input type="hidden" id="dlrCd" name="dlrCd"  data-json-obj="true" />
                    <input type="hidden" id="custMngScId" name="custMngScId"  />
                    <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
                    <input type="hidden" id="cSeq" name="cSeq"  data-json-obj="true" />
                    <input type="hidden" id="custSearch" name="custSearch"  class="custSearch" />
                    <input type="hidden" id="exhvFlakSeq" name="exhvFlakSeq" data-json-obj="true" />
<%--                     <input type="hidden" id="onDutyYn" value="${onDutyYn}" /> --%>

                </div> <!--  salesOpptProcForm End  -->

<!--  ************************** checkPwSaveBeforeDiv **************************** -->
        <section id="checkPwSaveBeforeDiv" class="pop_wrap"> <!-- checkPwDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnCheckPwdSaveBefore" class="btn_m"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                </div>
            </div>
            <div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="al"><spring:message code='global.lbl.handler' /><!-- 조작인 --></th>
                                <td>
                                    ${loginUsrNm} (${loginUsrId})
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="al"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td>
                                    <input id="usrPwSaveBefore" name="usrPwSaveBefore" type="password" class="form_input"  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** checkPwDiv **************************** -->

 <script type="text/javascript">

    $(document).ready(function() {

        // 숫자
        var onlyNum = new RegExp("[^0-9]","i");
        $(".numberic").keyup(function(e)
        {
            var content = $(this).val();

            if(content.match(onlyNum)){
                //console.log($(this).val());
                $(this).val('');
            }
        });

        // 숫자와 알파벳
        var onlyNumAlpha = new RegExp("[^a-zA-Z0-9]");
        $(".numberandalpha").keyup(function(e)
        {

            var contents = $(this).val();
            if(onlyNumAlpha.test(contents)){

                $(this).val('');
            }
        });

        // 조직기구코드
        //var corpNumChk = new RegExp("[^[0-9]{8}-[0-9]$]");
        //var corpNumChk = new RegExp("^[0-9]{8}-[0-9]");
        var corpNumChk = new RegExp("[^a-zA-Z0-9-]");
        $(".corpNumChk").keyup(function(e)
        {

            var contents = $(this).val();
//             console.log(contents);
            if(corpNumChk.test(contents)){
                $(this).val('');
            }
        });

        // 증거유형 + 증거번호 후 고객 체크 (자동)
        $(".getCustMathDocDupByKey").focusout(function(){
            var idValue = $(this).context.id;
            getCustMathDocDupByKey(idValue);
        });

     // 이메일   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
       $(".form_email").keyup(function(e)
       {
           var onlyEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

           var contents = $(this).val();
           if(onlyEmail.test(contents)){
               //$(this).val('');
           }
       });

       // 고객명에서 ObKeyDown
       $(".onKey_down").keydown(function(e){
           if (e.keyCode == 13) {
               if($(this).val() != "") {
                   $(".custSearch").click();
               }
           }
       });

       // 고객명에서 ObKeyDown 연계인 검색
       $(".onKey_down_relCust").keydown(function(e){
           if (e.keyCode == 13) {
               if($(this).val() != "") {
                   $(".relCustSearch").click();
               }
           }
       });

        // 업종                  bizcondCdC
        $("#bizcondCdC").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
          , dataValueField:"cmmCd"
          , optionLabel:" "
          , dataSource:dms.data.cmmCdFilter(bizcondCdList)
          , index:0
        });

        // 신분증유형            mathDocTpC       (CRM024)
        $("#mathDocTpC").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , optionLabel:" "
           , dataSource:mathDocTpList
           , dataSource:dms.data.cmmCdFilter(mathDocTpList)
           , index:0
           , change:function(){
               getCustMathDocDupByKey();
           }
        });

        // 고객확보유형1      holdTp      (CRM008)
        $("#holdTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , dataSource:holdTpList
           , dataSource:dms.data.cmmCdFilter(holdTpList)
           , optionLabel:" "
           , filter:"contains"
           , filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchHoldTp
       });

     // 고객확보유형2      holdDetlTpSeq   (CRM***)
        $("#holdDetlTpSeq").kendoExtDropDownList({
           dataTextField:"holdDetlTpNm"
           , dataValueField:"holdSeq"
           , filter:"contains"
           , optionLabel:" "
           , enable:false
           , open:function(){
               //console.log('testestetstes');
               onSelectSearchHoldTpSet("","N");
           }
        });

        $("#infoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(infoTpList)
            , index:1
        });

        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:custTpList
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                } else {
                    $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                    $(".personalTr").hide();
                    $(".corporateTr").show();
                }
            }
        });

        $("#custTpC").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dms.data.cmmCdFilter(custTpList)
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                    $(".personalTr").show();
                    $(".corporateTr").hide();
                } else {
                    $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                }
            }
        });

        $("#payTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(payTpList)
            , index:0
        });

//         $("#expcPurcHmCd").kendoExtDropDownList({
//             dataTextField:"cmmCdNm"
//             , dataValueField:"cmmCd"
//             , optionLabel:" "
//             , dataSource:expcPurcHmCdList
//             , index:0
//         });

        /**
         * 차종 콤보박스
         */
        $("#intrCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchVariant
        });

        /**
         * 차관 콤보박스
         */
         $("#intrFscpModtpCd").kendoExtDropDownList({
             dataTextField:"fscNm"
             ,dataValueField:"fscCd"
             ,height: 145
            ,filter:"contains"
            ,optionLabel:" "
         });
         $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);

        $("#intrColorCd").kendoExtDropDownList({
            dataTextField:"extColorNm"
            , dataValueField:"extColorCd"
            , optionLabel:" "
            , dataSource:colorCdList
            , index:0
        });

        $("#mngScId").kendoExtDropDownList({
            dataTextField:"usrNm"
            , dataValueField:"usrId"
            , optionLabel:" "
            , dataSource:mngScIdList
            , index:0
            , filter:"contains"
            , filtering:function(e){
                var filter = e.filter;
            }
        });
        $("#mngScId").data("kendoExtDropDownList").enable(false);

        $("#leadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dms.data.cmmCdFilter(leadStatCdList)
            , index:0
        });
        $("#leadStatCd").data("kendoExtDropDownList").enable(false);

        $("#sexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(sexCdList)
            , index:0
        });

        $("#checkPwSaveBeforeDiv").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
            ,width:"300px"
            ,height:"105px"
        }).data("kendoWindow");

        // 검색조건 show/hide
        $("#btnAddrHidden").kendoButton({
            click:function(e){
                $("#hiddenAddrTable").toggle();
                $("#btnAddrHidden").toggleClass("active");
            }
        });

        $("#btnCustSearch").click(function(){
            var param = {};
            param["sCustNo"] = $("#custNo").val();

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
                var leadStatCd = result.data[0].leadStatCd;
                var bhmcYn = result.data[0].bhmcYn;

                $("#seq").val(result.data[0].seq);
                $("#cSeq").val(result.data[0].cSeq);
                $("#exhvFlakSeq").val(result.data[0].exhvFlakSeq);

                $("#bhmcYn").val(result.data[0].bhmcYn);
                $("#dlrCd").val(result.data[0].dlrCd);
                $("#custMngScId").val(result.data[0].custMngScId);

                $("#custCd").val(result.data[0].custCd);
                $("#custNm").val(result.data[0].custNm);
                $("#custNmSearch").val(result.data[0].custNm);
                $("#hpNo").val(result.data[0].hpNo);
                $("#telNo").val(result.data[0].telNo);
                $("#officeTelNo").val(result.data[0].officeTelNo);
                $("#wechatId").val(result.data[0].wechatId);
                $("#emailNm").val(result.data[0].emailNm);
                $("#addrFull").val(result.data[0].addrFull);
                $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);

                $("#holdTp").data("kendoExtDropDownList").value(result.data[0].holdTp);
                if ( dms.string.isNotEmpty(result.data[0].holdDetlTpSeq) ) {
                    onSelectSearchHoldTpSet(result.data[0].holdTp);
                    //$("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([{holdSeq:result.data[0].holdDetlTpSeq, holdDetlTpNm:result.data[0].holdDetlTpSeqNm}]);
                    $("#holdDetlTpSeq").data("kendoExtDropDownList").value(result.data[0].holdDetlTpSeq);
                }
                $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
                //$("#expcPurcHmCd").data("kendoExtDropDownList").value(result.data[0].expcPurcHmCd);
                $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);

                onSelectSearchVariantSet(result.data[0].intrCarlineCd);
                $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);

                $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
                //$("#localCarRegNoYn").data("kendoExtDropDownList").value(result.data[0].localCarRegNoYn);
                $("#estimateCont").val(result.data[0].estimateCont);
                $("#salesCont").val(result.data[0].salesCont);
                $("#remark").val(result.data[0].remark);

                $("#beforeMngScId").val(result.data[0].mngScId);
                $("#leadStatCd").data("kendoExtDropDownList").value(leadStatCd);
                $("#befLeadStatCd").val(leadStatCd);
                $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
                $("#dstbChnNm").val(result.data[0].dstbChnNm);

                if (result.data[0].localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true) };

                $("#custTp").data("kendoExtDropDownList").value(result.data[0].custTp);
                $("#custTpC").data("kendoExtDropDownList").value(result.data[0].custTp);
                $("#custNmSearchC").val(result.data[0].custNm);
                $("#custNoC").val(result.data[0].custNo);

                if (result.data[0].custTp == "01") {
                    $(".personalTr").show();
                    $(".corporateTr").hide();
                    //$("#mathDocTpC").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
                    $("#mathDocTp").val(result.data[0].mathDocTp);
                    $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
                } else {
                    $("#mathDocTpC").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
                    $("#mathDocTp").val(result.data[0].mathDocTp);
                    $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
                    $("#bizcondCdC").data("kendoExtDropDownList").value(result.data[0].bizcondCd);
                    $("#officeTelNoC").val(result.data[0].officeTelNo);
                    $("#wechatIdC").val(result.data[0].wechatId);

                    // 연계인 정보 셋팅
                    //$("#relSeq").val(result.data[0].relSeq);
                    //$("#relCustNo").val(result.data[0].relCustNo);
                    //$("#relBefCustNo").val(result.data[0].relCustNo);
                    //$("#relCustNmSearch").val(result.data[0].relCustNm);
                    $("#relCustNm").val(result.data[0].purcMngNm);
                    $("#relCustHpNo").val(result.data[0].hpNo);

                    $(".personalTr").hide();
                    $(".corporateTr").show();
                }

                if (result.data[0].custCd == "02") {
                    $("#custTp").data("kendoExtDropDownList").enable(false);
                    $("#custTpC").data("kendoExtDropDownList").enable(false);
                }

                // 상태에 따른 처리
                if (leadStatCd == "00"
                    || leadStatCd =="01"
                    || leadStatCd =="02"
                    || leadStatCd =="03"
                    || leadStatCd =="04"
                    || leadStatCd =="05"
                    || leadStatCd =="06"
                    || leadStatCd =="08"
                    || leadStatCd =="09"
                ) {

//                     if (leadStatCd =="08") {
//                         $("#mngScId").data("kendoExtDropDownList").enable(false);
//                     }else{
//                         $("#mngScId").data("kendoExtDropDownList").enable(true);
//                     }

                    var loginUsrId = "${loginUsrId}";
                    var mngScIdCtrl = "${mngScIdCtrl}";

                    if ( leadStatCd == "01" || leadStatCd == "02" ) {
                        //OB실행 VIEW-D-10322
                        $("#mngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);

                    } else if ( leadStatCd == "03" || leadStatCd == "04"
                            || leadStatCd == "05"  || leadStatCd == "06"
                            ) {
                        // 판매고문
                        $("#mngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
                    } else {
                        $("#mngScId").data("kendoExtDropDownList").setDataSource(mngScIdList);
                    }

                    if (leadStatCd == "05"
                        || leadStatCd == "06"
                        || leadStatCd == "08"
                        || leadStatCd == "08"
                       ) {
                        $("#mngScId").data("kendoExtDropDownList").enable(false);
                    } else {
                        $("#mngScId").data("kendoExtDropDownList").enable(true);
                    }

                    if (leadStatCd == "04") {

                        if (mngScIdCtrl == "Y") {

                            if (leadStatCd =="08") {
                                $("#mngScId").data("kendoExtDropDownList").enable(false);
                            }else{
                                $("#mngScId").data("kendoExtDropDownList").enable(true);
                            }
                        } else {
                            $("#mngScId").data("kendoExtDropDownList").enable(false);
                        }
                    }

                    $("#mngScId").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });

                    $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);

                    processResponseOB();

                }

                $("#addrGrid").data("kendoExtGrid").dataSource.read();

                // 화면에따라 추가 항목이 다름.
                if ( $("#validGradeCd").length > 0 ) {

                    $("#validGradeCd").data("kendoExtDropDownList").value(result.data[0].validGradeCd);

                    if (result.data[0].validGradeCd == "03") {
//                         $("#validGradeCd").data("kendoExtDropDownList").enable(false);
                        $("#invalidCauCd").data("kendoExtDropDownList").enable(true);
                    }
                }
                if ( $("#invalidCauCd").length > 0 ) {
                    $("#invalidCauCd").data("kendoExtDropDownList").value(result.data[0].invalidCauCd);
                }

                if ( $("#vsitDt").length > 0 ) {
                    $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(result.data[0].vsitDt);
                }
                if ( $("#vsitEndDt").length > 0 ) {
                    $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(result.data[0].vsitEndDt);
                }
                if ( $("#vsitPrsnCnt").length > 0 ) {
                    $("#vsitPrsnCnt").val(result.data[0].vsitPrsnCnt);
                }

                if ( $("#rvsitYn").length > 0 ) {
                    if (result.data[0].rvsitYn == 'Y'){ $("#rvsitYn").prop("checked", true) };
                }

                if ( $("#purcSelCarlineCd").length > 0 ) {
                    $("#purcSelCarlineCd").data("kendoExtDropDownList").value(result.data[0].purcSelCarlineCd);
                }
                if ( $("#purcSelModelCd").length > 0 ) {
                    $("#purcSelModelCd").data("kendoExtDropDownList").setDataSource([{modelNm:result.data[0].purcSelModelNm, modelCd:result.data[0].purcSelModelCd}]);
                }
                if ( $("#purcSelModelCd").length > 0 ) {
                    $("#purcSelModelCd").data("kendoExtDropDownList").value(result.data[0].purcSelModelCd);
                }
                if ( $("#expcPurcDt").length > 0 ) {
                    $("#expcPurcDt").data("kendoExtMaskedDatePicker").value(result.data[0].expcPurcDt);
                }
                if ( $("#expcDealPrc").length > 0 ) {
                    $("#expcDealPrc").val(result.data[0].expcDealPrc);
                }

                if ( $("#failCauCd").length > 0 ) {
                    $("#failCauCd").data("kendoExtDropDownList").value(result.data[0].failCauCd);
                }
                if ( $("#otherBrandCd").length > 0 ) {
                    onSelectSearchFailOtherBrand();
                    $("#otherBrandCd").data("kendoExtDropDownList").value(result.data[0].otherBrandCd);
                }
                if ( $("#failCauReasonCont").length > 0 ) {
                    $("#failCauReasonCont").val(result.data[0].failCauReasonCont);
                }
                if ( $("#traceGradeCd").length > 0 ) {
                    $("#traceGradeCd").data("kendoExtDropDownList").value(result.data[0].traceGradeCd);
                    if ( dms.string.isNotEmpty(result.data[0].traceGradeCd) ) {
                        $("#nextTraceDt").data("kendoExtMaskedDateTimePicker").value(fn_nextTraceDtTimePicker(result.data[0].traceGradeCd));
                        if (dms.string.isNotEmpty($("#nextTraceDt").data("kendoExtMaskedDateTimePicker").value())){
                            if (dms.string.isEmpty($("#nextTraceMthCd").data("kendoExtDropDownList").value())){
                                $("#nextTraceMthCd").data("kendoExtDropDownList").value("03");
                            }
                        }
                    }

                    // 상태에 따른 처리
                    if (leadStatCd == "05"
                        || leadStatCd =="06"
                        || leadStatCd =="08"
                        || leadStatCd =="09"
                    ) {
                        $("#traceGradeCd").data("kendoExtDropDownList").enable(false);
                    } else {
                        $("#traceGradeCd").data("kendoExtDropDownList").enable(true);
                    }
                }

                // [20170609/이인문 수정 : 실패/전출인경우 유효성판단 비활성화.]
                if ( leadStatCd =="08" || leadStatCd =="09" ) {
                    $("#validGradeCd").data("kendoExtDropDownList").enable(false);
                };

            });
         });

        // 고객명, 휴대전화 입력 후 고객 체크 (자동)
        $(".getCustDupByKey").focusout(function(){
            var idValue = $(this).context.id;
            getCustDupByKey(idValue);
        });

        // 고객조회
        //var custSearch = function() {
         $(".custSearch").click(function(){

             var custTp = $("#custTp").data("kendoExtDropDownList").value();
             var custNm = $("#custNmSearch").val();
             if (custTp == "02") {
                 custNm = $("#custNmSearchC").val();
             }

             popupWindow = dms.window.popup({
                 windowId:"customerSearchPopupMain"
                 , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                     , data:{
                         "autoBind":true
                         , "custNm":custNm
                         , "type"  :null
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 //console.log("Popup Search Result111:::");
                                 //console.log(data[0]);

                                 if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                     $("#custNo").val(data[0].custNo);
                                 }
                                 popupWindow.close();
                                 $("#btnCustSearch").click();
                             }
                         }
                     }
                 }
             })
         });

         // 고객조회
         //var custSearch = function() {
          $(".relCustSearch").click(function(){

              var iframe = "selectEditSalesOpptProcessPopup";
              var autoBind = "Y";
              var type = "";
              var custTp = "01";  // 개인
              var custCd = "";
              var custNm = $("#relCustNmSearch").val();
              var dlrMbrYn = "";

              parent.fn_relCustSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn);

          });

          // 암호창
         $("#btnCtlSaveBefore").kendoButton({
             click:function(e) {
                 var custNo = $("#custNo").val();
                 var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                 var beforeMngScId = $("#beforeMngScId").val();
                 var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();
                 var loginUsrId = "${loginUsrId}";
                 var mngScIdCtrl = "${mngScIdCtrl}";

                 if (leadStatCd == "02"
                     || leadStatCd == "04"
                 ){
                     // 담당자 확인
                     if ( dms.string.isEmpty(mngScId)) {
                         dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                         return false;
                     };
                 }

                 if (leadStatCd == "09") {
                     if (mngScIdCtrl == "N") {
                        // 권한이 없습니다.
                        dms.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                        return false;
                    }
                 }

                 if (salesOpptPwYn == "Y"){
                     if ((beforeMngScId != '') && (mngScId != beforeMngScId)) {
                         // div 띄우기
                         var checkPwSaveBeforeDiv = $("#checkPwSaveBeforeDiv").data("kendoWindow");
                         checkPwSaveBeforeDiv.center();
                         checkPwSaveBeforeDiv.open();
                     } else {
                         $("#btnCtlSave").click();
                     }

                 } else {
                     $("#btnCtlSave").click();
                 }
             }
         });

         // 저장 버튼.
         $("#btnCtlSave").kendoButton({
             click:function(e){

                 var custNm = $("#custNmSearch").val();
                 var custNmC = $("#custNmSearchC").val();
                 var custTp = $("#custTp").data("kendoExtDropDownList").value();
                 var hpNo = $("#hpNo").val();
                 var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                 var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
                 var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();
                 //var officeTelNo = $("#officeTelNoC").val();

                 var mathDocTpCVal = $("#mathDocTpC").data("kendoExtDropDownList").value();
                 var ssnCrnNoCVal = $("#ssnCrnNoC").val();

                 // 법인연계인 (구매담당자)
                 var relCustNm = $("#relCustNm").val();
                 var relCustHpNo = $("#relCustHpNo").val();
                 var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

                 // 저장전 상태를 체크한다. 상태가 다른 경우 알람을 띄우고 화면을 닫는다.
                 var seq = $("#seq").val();
                 var custNo = $("#custNo").val();
                 //fn_LeadStatCdChk(seq,custNo);

                 if ( dms.string.isEmpty(infoTp) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if ( dms.string.isEmpty(holdTp) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if ( dms.string.isEmpty(intrCarlineCd) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if (custTp =="01") {
                     if ( dms.string.isEmpty(hpNo) ) {
                         dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     };
                 } else {

//                      if ( dms.string.isEmpty(officeTelNo) ) {
//                          dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                          return false;
//                      };
                     if ( dms.string.isEmpty(relCustNm) ) {
                         dms.notification.warning("<spring:message code='crm.lbl.corpPurcMng' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     };
                     if ( dms.string.isEmpty(relCustHpNo) ) {
                         dms.notification.warning("<spring:message code='crm.lbl.corpPurcMngHpno' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     };

                     if (mathDocTpCVal == "10") {
                         if (ssnCrnNoCVal.length != 18) {
                             dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.lengthCheckMsg' arguments='${returnMsg}' />");
                             $("#ssnCrnNoC").focus();
                             return false;
                         }
                     }

                 }

                 var salesOpptProcParam =
                     $("#salesOpptProcForm").serializeObject(
                             $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
                     );

                 var addrParam = {};

                 var grid = $("#addrGrid").data("kendoExtGrid");
                 var addrGridData = grid.getCUDData("insertList", "updateList", "deleteList");
                 var dataValidate = true;

                 if (grid.cudDataLength > 0) {
                     $.each(addrGridData.insertList, function(idx, row){
                        if(dms.string.isEmpty(row.addrTp)){
                            // 선택하지 않은 주소요형이 있습니다.
                            dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                            dataValidate = false;
                            return false;
                         }
                        if ( dms.string.isEmpty(row.addrDetlCont) ) { //주소 필수 값.
                            dms.notification.warning("<spring:message code='crm.lbl.addrDetlCont' var='init' /><spring:message code='global.info.check.field' arguments='${init}' />");
                            dataValidate = false;
                            return false;
                        }
                     });
                 }

                 if(!dataValidate){
                     return;
                 }

                 // enable data Assign
                 salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
                 salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                 salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                 salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                 salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
                 salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

                 if (custTp == "02"){
                     salesOpptProcParam["custTp"] = $("#custTpC").data("kendoExtDropDownList").value();
                     salesOpptProcParam["custNm"] = $("#custNmSearchC").val();
                     salesOpptProcParam["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                     salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                     salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                     //salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
                     salesOpptProcParam["wechatId"] = $("#wechatIdC").val();
                 }

                 if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };

                 var saveData = $.extend(
                     {"salesOpptProcessMgmtVO":salesOpptProcParam }
                     , {"addressInfoVOList":addrGridData}
                 );

                 console.log("saveData=====");
                 // console.log(saveData);

                 $.ajax({
                     url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
                     ,data:JSON.stringify(saveData)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error){
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                         //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     },
                     success:function(result){
                         dms.notification.success("<spring:message code='global.info.success'/>");

                         var data = [];
                         data.push(result);
                         var options = parent.editCustPopupWindow.options.content.data;
                         options.callbackFunc(data);
                         parent.editCustPopupWindow.close();
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

         $("#btnCheckPwdSaveBefore").kendoButton({
             click:function(e) {

                 var usrPw = hex_sha2($("#usrPwSaveBefore").val());

                 if (dms.string.isEmpty($("#usrPwSaveBefore").val())) {
                     dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                     return false;
                 }

                 var pwParam = {};

                 pwParam["sPassword"] = usrPw;

                 //console.log("pwParam !!! ");
                 //console.log(pwParam);

                 var checkPwSaveBeforeDiv = $("#checkPwSaveBeforeDiv").data("kendoWindow");
                 checkPwSaveBeforeDiv.close();

                 $.ajax({
                     url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
                     ,data:JSON.stringify(pwParam)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error){
                         //console.log("error !!!");
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     }
                     ,success:function(result){
                         //console.log(result);
                         //console.log("btnCheckPwdSaveBefore success!!!!");

                         if (result === true) {
                             //dms.notification.success("<spring:message code='global.info.success'/>");
                             //var checkPwSaveBeforeDiv = $("#checkPwSaveBeforeDiv").data("kendoWindow");
                             //checkPwSaveBeforeDiv.close();

                             $("#btnCtlSave").click();
                         } else {
                             dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                         }
                     }
                     ,beforeSend:function(xhr) {
                        dms.loading.show();
                     }
                     ,complete:function(xhr, status) {
                        dms.loading.hide();
                     }
                 });

             }
         });

         //버튼 - 주소  추가
         $("#btnAddAddress").kendoButton({
             click:function(e) {
                 parent.fn_callAddrPopUp("selectEditSalesOpptProcessPopup");
             }
         });

         // 주소 삭제 - addressGrid 행삭제
         $("#btnDelAddress").kendoButton({
            click:function(e) {
                var grid = $("#addrGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
         });

         // 고객상세 주소 그리드
         $("#addrGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             // 고객번호
                             if ( dms.string.isEmpty($("#custNo").val()) ) {
                                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                 return false;
                             };

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;
                             params["sRefTableNm"]           = "CR_0101T";
                             params["sRefKeyNm"]             = $("#custNo").val();

                             //console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     errors:"error"
                         ,data:"data"
                         ,total:"total"
                         ,model:{
                             id:"seq"
                             ,fields:{
                                 seq:{type:"string", editable:false}
                                 ,rnum  :{type:"number" , editable:false}
                                 ,addrTp:{type:"string", editable:true}
                                 ,zipCd:{type:"string", editable:false}
                                 ,sungCd:{type:"string", editable:false}
                                 ,cityCd:{type:"string", editable:false}
                                 ,distCd:{type:"string", editable:false}
                                 ,sungNm:{type:"string", editable:false}
                                 ,cityNm:{type:"string", editable:false}
                                 ,distNm:{type:"string", editable:false}
                                 ,addrNm:{type:"string", editable:true}
                                 ,addrDetlCont:{type:"string", editable:true}
                                 ,flagYn:{type:"string", editable:true}
                                 ,refTableNm:{type:"string", editable:false}
                                 ,refKeyNm:{type:"string", editable:true}
                                 ,useYn:{type:"string", editable:true}
                             }
                         }
                 }
             }
             ,filterable:false
             ,autoBind:false
             ,navigatable:false
             ,height:72
             ,pageable:false
             ,edit:function(e){
                 if ( e.model.addrTp === "02" ) {
                     this.closeCell();       // 주소타입이 02 이면 수정 불가능
                 };
             }
             ,columns:[
                //{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
                {_field:"chk", title:"<spring:message code='global.lbl.selectAddr' />", template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:60, attributes:{"class":"ac"}}
                ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}
                    , editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:dms.data.cmmCdFilter(addrTpList)
                        });
                    }
                    , template:'#if (addrTp !== ""){# #= addrTpMap[addrTp]# #}#'
                }       // 주소유형
                ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
                ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
                ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:70, attributes:{"class":"al"}}       // 지역
                ,{field:"addrNm", hidden:true}       // 주소
                ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:150, attributes:{"class":"al"}}       // 상세주소
                ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:70, attributes:{"class":"ac"}}       // 우편번호
                ,{field:"useYn", title:"<spring:message code='global.lbl.validYn' />", width:100, attributes:{"class":"ac"}
                    , editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:chgBuyYnDS
                        });
                    }
                    , template:'#if (useYn !== ""){# #= chgBuyYnMap[useYn]# #}#'
                }       // 사융유무
                ,{_field:"delIcon", title:"<spring:message code='global.btn.del' />", width:50, attributes:{"class":"ac"}
                    ,template:function(e){
                        var spanObj;
                        if ( e.addrTp === "02" ) {
                            spanObj = "<a href='javascript:;' ></a>";
                        } else {
                            spanObj = "<a href='javascript:;' onclick='javascript:fn_delAddrRow();' ><span class='icon_delete'></span></a>";
                        };
                        return spanObj;
                    }
                }       // 삭제
                ,{field:"sungCd", hidden:true}
                ,{field:"cityCd", hidden:true}
                ,{field:"distCd", hidden:true}
                ,{field:"refTableNm", hidden:true}
                ,{field:"refKeyNm", hidden:true}
             ]
         });

         $("#addrGrid").on("click", "input.flagYn", function(){

             var addrGrid = $("#addrGrid").data("kendoExtGrid");
             var uid = $(this).data("uid");

             $("input.flagYn", "#addrGrid").prop("checked", false);
             $(this).prop("checked", true);
             //console.log(uid);

             $.each(addrGrid.dataSource.view(), function(idx, dataItem){
                 dataItem.set("flagYn", "N");
             });

             addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");

         });

    });

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
     function onSelectSearchVariant(e){
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(true);

        var dataItem = this.dataItem(e.item);
        if(dataItem.carlineCd == ""){
            $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do' />"
            ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
            ,async:false
        });
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
     function onSelectSearchVariantSet(carlineCd){
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(true);

        if(carlineCd == ""){
            $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do' />"
            ,data:JSON.stringify({"sCarlineCd":carlineCd})
            ,async:false
        });
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

     /** [조회조건 영역] ComboBox Select() **/
     // 정보경로에 따른 상세경로 조회
     function onSelectSearchHoldTp(e){
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
         $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

         var dataItem = this.dataItem(e.item);

         if(dataItem.cmmCd == ""){
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd,"sSiebelHoldRowIdYn":"N"})
             ,async:false
         });
         if (responseJson.total == 0) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
         } else {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     }

     /** [조회조건 영역] ComboBox Select() **/
     // 정보경로에 따른 상세경로 조회
     function onSelectSearchHoldTpSet(holdTp,siebelHoldRowIdYn){
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
         $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

         var holdTpVal = $("#holdTp").data("kendoExtDropDownList").value();

         if ( dms.string.isEmpty(holdTpVal) ) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":holdTpVal,"sSiebelHoldRowIdYn":siebelHoldRowIdYn})
             ,async:false
         });

         if (responseJson.total == 0) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
         } else {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     }

     function fn_relCustSearchRlt(data) {
         if (data.length >= 1) {
             //console.log("Popup Search fn_custSearchRlt:::");
             //console.log(data[0]);
             //console.log(data[0].custNo);
             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                 //$("#relCustNo").val(data[0].custNo);
                 $("#relCustNm").val(data[0].custNm);
                 //$("#relCustNmSearch").val(data[0].custNm);
                 $("#relCustHpNo").val(data[0].hpNo);
             }

         }
     }

     function fn_delAddrRow(){
         var grid = $("#addrGrid").data("kendoExtGrid");
         var rows = grid.select();

         rows.each(function(index, row) {
             grid.removeRow(row);
         });
     }

     // 주소추가 - addressGridas
     function insertAddressItemAdd(data){
         var custNo = $("#custNo").val();
         var addrGrid = $("#addrGrid").data("kendoExtGrid");
         var detalAddressData = data.addrDetl;
         var addrTp = data.addrTp;

         $.each(addrGrid.dataSource.view(), function(idx, dataItem){
             dataItem.set("flagYn", "N");
         });

         $.each(data, function(idx, row){
             $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "flagYn"            :"Y"
                 , "addrTp"          :addrTp
                 , "zipCd"           :row.zipCd
                 , "sungNm"          :row.sungNm
                 , "cityNm"          :row.cityNm
                 , "distNm"          :row.distNm
                 , "addrNm"          :""

                 , "addrDetlCont"    :detalAddressData
                 , "useYn"           :"Y"
                 , "sungCd"          :row.sungCd
                 , "cityCd"          :row.cityCd
                 , "distCd"          :row.distCd
                 , "refTableNm"      :"CR_0101T"                  //참조테이블
                 , "refKeyNm"        :custNo                     // 참조 키
             });
         });
         $("#hiddenAddrTable").show();
         //$("#hiddenAddrTable").toggle();
         //$("#btnAddrHidden").toggleClass("active");
     };

     function getCustDupByKey(idVal){
         //console.log("getCustDupByKey!!!!");
         var custTp = $("#custTp").data("kendoExtDropDownList").value();

         var custNm = $("#custNmSearch").val();
         var custNo = $("#custNo").val();
         var custCd = $("#custCd").val();
         var hpNo = $("#hpNo").val();
         var mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         var ssnCrnNo = $("#ssnCrnNoC").val();
         var officeTelNo = $("#officeTelNoC").val();
         var oldCustNm = "";
         var oldHpNo = "";
         var oldMathDocTp = "";
         var oldSsnCrnNo = "";
         var chkContinued = false;

         // 법인연계인 (구매담당자)
         var relCustNm = $("#relCustNm").val();
         var relCustHpNo = $("#relCustHpNo").val();

         if ( dms.string.isEmpty(custCd) ) {
             custCd = "01";
         }

         if (custTp == "02") {
             custNm = $("#custNmC").val();
             mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
             ssnCrnNo = $("#ssnCrnNoC").val();
             if (relCustHpNo.length > 1 ) {
                 hpNo = relCustHpNo;
                 chkContinued = true;
             }
         } else {
             if (hpNo.length > 1 ) {
                 chkContinued = true;
             }
         }

         if (chkContinued){

             var param = {};
             param["sCustNo"]       = custNo;
             param["sCustCd"]       = custCd;   // 잠재
             param["sCustTp"]       = custTp;
             param["sCustNm"]       = custNm;

             param["sHpNo"]         = hpNo;
             param["sOfficeTelNo"]         = officeTelNo;
             param["sMathDocTp"]         = mathDocTp;
             param["sSsnCrnNo"]         = ssnCrnNo;
             param["sOldCustNm"]         = oldCustNm;
             param["sOldHpNo"]         = oldHpNo;
             param["sOldMathDocTp"]         = oldMathDocTp;
             param["sOldSsnCrnNo"]         = oldSsnCrnNo;
             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectCustDupScreenByKey.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     dms.notification.info(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     if (result.total == 0 ){
                         dms.notification.info("<spring:message code='global.info.ableToDo' />");
                     } else {

                         // 이미 존재합니다. 확인 하시겠습니까?
                         var custNo = result.data[0].custNo;
                         var msg = "<spring:message code='crm.info.hpNoDupCustConfirm' />";
                         dms.window.confirm({
                             message:msg
                             ,title :"<spring:message code='global.lbl.info' />"
                             ,callback:function(result){
                                 if(result){
                                     parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+custNo, "VIEW-D-10272"); // CUST NO
                                 }else{
                                     return false;
                                 }
                             }
                         });
                     }
                 }
             });
         }
     }

     // 증거유형 증거번호 체크
     function getCustMathDocDupByKey(idVal){

         var custTp = $("#custTp").data("kendoExtDropDownList").value();
         var custCd = $("#custCd").val();
         var custNm = $("#custNm").val();
         var custNo = $("#custNo").val();
         var hpNo = $("#hpNo").val();
         var mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         var ssnCrnNo = $("#ssnCrnNoC").val();
         var officeTelNo = "";
         var oldCustNm = $("#oldCustNm").val();
         var oldHpNo = $("#oldHpNo").val();
         var oldMathDocTp = $("#oldMathDocTp").val();
         var oldSsnCrnNo = $("#oldSsnCrnNo").val();
         var chkContinued = false;

         if (custTp == "02") {
             custNm = $("#custNmC").val();
             mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
             ssnCrnNo = $("#ssnCrnNoC").val();
         }

         if (dms.string.isNotEmpty(mathDocTp) && dms.string.isNotEmpty(ssnCrnNo)){

             var param = {};
             param["sCustNo"]        = custNo;
             param["sCustCd"]        = custCd;
             param["sCustTp"]        = custTp;
             param["sCustNm"]        = custNm;
             param["sHpNo"]          = hpNo;
             param["sOfficeTelNo"]   = officeTelNo;
             param["sMathDocTp"]     = mathDocTp;
             param["sSsnCrnNo"]      = ssnCrnNo;
             param["sOldCustNm"]     = oldCustNm;
             param["sOldHpNo"]       = oldHpNo;
             param["sOldMathDocTp"]  = oldMathDocTp;
             param["sOldSsnCrnNo"]   = oldSsnCrnNo;
             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectCustMathDocDupByKey.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     if (result.total == 0 ){
                         dms.notification.info("<spring:message code='global.info.ableToDo' />");
                     } else {
                         dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                     }
                 }
             }).done(function(result) {
                 console.log("done!!!!");
             });
         }
     }

     function fn_LeadStatCdChk(seq,custNo){
         var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();
         var param = {};
         param["sLeadStatCd"]       = leadStatCd;
         param["sSeq"]       = seq;
         param["sCustNo"]       = custNo;
             $.ajax({
                 url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     dms.notification.info(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                      console.log("fn_LeadStatCdChk!!!");
                 }
             }).done(function(result) {
                    if (leadStatCd != result.data[0].leadStatCd) {
//                   판매기회 상태가 다릅니다.
                        var msg = "<spring:message code='crm.lbl.leadStatChangePlzChk' />";
                        dms.window.confirm({
                             message:msg
                             ,title :"<spring:message code='global.lbl.info' />"
                             ,displayCancelBtn:false
                             ,callback:function(result){
                                 if(result){
                                     var data = [];
                                     var options = parent.editCustPopupWindow.options.content.data;
                                     options.callbackFunc(data);
                                     parent.editCustPopupWindow.close();
                                 }else{
                                     return false;
                                 }
                             }
                        });
                    }
//                  if (result.total == 0 ){
//                      dms.notification.info("<spring:message code='global.info.ableToDo' />");
//                  } else {

//                     이미 존재합니다. 확인 하시겠습니까?
//                      var custNo = result.data[0].custNo;
//                      var msg = "<spring:message code='crm.info.hpNoDupCustConfirm' />";
//                      dms.window.confirm({
//                          message:msg
//                          ,title :"<spring:message code='global.lbl.info' />"
//                          ,callback:function(result){
//                              if(result){
//                                  parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+custNo, "VIEW-D-10272"); // CUST NO
//                              }else{
//                                  return false;
//                              }
//                          }
//                      });
//                  }

             });
     }

    </script>
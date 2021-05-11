<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div id="salesOpptProcForm">   <!--  salesOpptProcForm Start -->
            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2> <!-- 기본정보 -->
                <div class="btn_right">
                    <button type="button" id="btnNextStep" class="btn_m"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    <button type="button" id="btnSave" class="btn_m" style="display:none;"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    <button type="button" id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
                </div>
            </div>
            <!--  정보입력여역 시작 -->
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
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                            <td>
                                <div class="form_search">
                                    <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input onKey_down"  maxlength="30" />
                                    <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                    <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                            <td>
                                <input id="custNo" name="custNo" type="text" class="form_input form_readonly" readonly data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                            <td>
                                <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.hpNo" /></th> <!-- 이동전화 -->
                            <td>
                                <input id="hpNo" name="hpNo" type="text" class="form_input numberic"  maxlength="11" data-type="mobile" pattern="\d" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                            <td>
                                <input id="telNo" name="telNo" type="text" value="" class="form_input numberic" maxlength="20" data-type="tel"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                            <td>
                                <input id="officeTelNo" name="officeTelNo" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                            <td>
                                <input id="wechatId" name="wechatId" type="text" value="" class="form_input" maxlength="20" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                            <td>
                                <input id="emailNm" name="emailNm" type="email" value="" class="form_input form_email" maxlength="40" data-json-obj="true" />
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div> <!-- 고객정보 끝-->
            <section class="group"> <!-- 주소정보 시작 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.addr' /></h2>
                <div class="btn_right">
                    <%-- <button class="btn_s btn_save" id="btnSaveAddress" ><spring:message code="global.btn.save" /></button> <!-- 주소저장 --> --%>
                    <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 -->
                    <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 -->
                </div>
            </div>
            <div class="mt5">
                <div class="table_grid">
                    <div id="addrGrid"></div>
                </div>
            </div>
            </section> <!-- //주소정보 끝 -->

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
                            <th scope="row"><spring:message code='crm.lbl.infoType' /><!-- 리드유형 --></th>
                            <td>
                                <input id="infoTp" name="infoTp" type="text" class="form_comboBox"  data-json-obj="true" />
                            </td>
                              <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.approchLocation' /><!-- 리드출처 --></span></th>
                              <td>
                                  <input id="holdTp" name="holdTp" class="form_comboBox" data-json-obj="true" />
                              </td>
                              <td colspan="2">
                                  <input id="holdDetlTpSeq" name="holdDetlTpSeq" class="form_comboBox" data-json-obj="true" />
                              </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.payMethod' /><!-- 예정지불방식 --></th>
                            <td>
                                <input id="payTp" name="payTp" type="text" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.expectPureTime' /><!-- 예상구매시간코드 --></th>
                            <td>
                                <input id="expcPurcHmCd" name="expcPurcHmCd" type="text" class="form_comboBox"  data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.intentionCarline' /><!-- 의향차종 --></th>
                            <td>
                                <input id="intrCarlineCd" name="intrCarlineCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.intentionModel' /><!-- 의향모델 --></th>
                            <td>
                                <input id="intrFscpModtpCd" name="intrFscpModtpCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향색상 --></th>
                            <td>
                                <input id="intrColorCd" name="intrColorCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.plateNum' /><!-- 현지번호판예정 --></th>
                            <td>
                                <input id="localCarRegNoYn" name="localCarRegNoYn" type="text" value="" class="form_comboBox" data-json-obj="true" />
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
                            <th scope="row"><spring:message code='crm.lbl.estimateInfo' /><!-- 견적정보 --></th>
                            <td>
                                <input id="estimateCont" name="estimateCont" type="text" class="form_input" maxlength="50" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.promotionCont' /><!-- 판촉내용 --></th>
                            <td colspan="5">
                                <input id="salesCont" name="salesCont" type="text" value="" class="form_input" maxlength="100" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.remark' /><!-- 비고 --></th>
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
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.leadStat' /></th> <!-- 리드상태 -->
                            <td>
                                <input id="leadStatCd" name="leadStatCd" type="text" value="" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.sex' /></th> <!-- 성별 -->
                            <td>
                                <input id="sexCd" name="sexCd" type="text" value="" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <td colspan="2"></td>
                        </tr>
                    </tbody>
                </table>
            </div> <!-- 리드소유인 영역 끝 -->
            <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
            <input type="hidden" id="btnCustSearch" />
            <input type="hidden" id="dlrCd" name="dlrCd"  data-json-obj="true" />
            <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
        </div> <!--  salesOpptProcForm End  -->
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">

     var addrTpList = [];
     var addrTpMap = [];
     var chgBuyYnDS = [];
     var chgBuyYnMap = [];
     var carlineCdList = [];
     var carlineCdMap = [];
     var colorCdList = [];
     var colorCdMap = [];
     var mngScIdList = [];
     var mngScIdMap = [];
     var infoPathCdList = [];
     var infoPathCdMap = [];

     var custHoldTpList = [];
     var custHoldTpMap = [];
     var custHoldTpDtlList = [];
     var custHoldTpDtlMap = [];

     var leadStatCdList = [];
     var leadStatCdMap = [];
     var sexCdList = [];
     var sexCdMap = [];
     var modelCdList = [];
     var modelCdMap = [];
     var activeGradeCdList = [];
     var activeGradeCdMap = [];

     var custTpList = [];
     var custTpMap = [];
     var infoTpList = [];
     var payTpList = [];
     var expcPurcHmCdList = [];

     <c:forEach var="obj" items="${custHoldTpList}">
         custHoldTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         custHoldTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${custHoldTpDtlList}">
         custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
         custHoldTpDtlMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${expcPurcHmCdList}">
         expcPurcHmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${payTpList}">
         payTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${infoTpList}">
         infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${custTpList}">
         custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${leadStatCdList}">
         leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${sexCdList}">
         sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${activeGradeCdList}">
         activeGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${infoPathCdList}">
         infoPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         infoPathCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${mngScIdList}">
         mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
         mngScIdMap["${obj.usrId}"] = "${obj.usrNm}";
     </c:forEach>

     chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
     chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
     chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
     chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

     <c:forEach var="obj" items="${addrTpList}">
         <c:if test="${obj.remark1 ne 'SA'}">
              addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:if>
         addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     //차종조회
     <c:forEach var="obj" items="${carlineCdList}">
         carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
         carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
     </c:forEach>

     //색상조회
     <c:forEach var="obj" items="${colorCdList}">
         colorCdList.push({extColorNm:"${obj.extColorNm}", extColorCd:"${obj.extColorCd}"});
         colorCdMap["${obj.extColorCd}"] = "${obj.extColorNm}";
     </c:forEach>

    $(document).ready(function() {

        // 고객확보유형1      custHoldTp      (CRM008)
        $("#custHoldTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , optionLabel:" "
           , dataSource:dms.data.cmmCdFilter(custHoldTpList)
           , index:0
           , change:function(){
               var selcmmCd = this.dataItem(this.select()).cmmCd;
               var custHoldTpDtl = $("#custHoldTpDtl").data("kendoExtDropDownList");
               if (selcmmCd == "01"){
                   custHoldTpDtl.enable(true);
               } else {
                   custHoldTpDtl.value("");
                   custHoldTpDtl.enable(false);
               }
           }
       });

        // 고객확보유형2      custHoldTpDtl   (CRM***)
        $("#custHoldTpDtl").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , optionLabel:" "
           , dataSource:custHoldTpDtlList
           , index:0
           , enable:false
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
            , dataSource:dms.data.cmmCdFilter(custTpList)
            , index:0
        });

        $("#custHoldTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(custHoldTpList)
            , index:0
        });

        $("#payTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(payTpList)
            , index:0
        });

        $("#expcPurcHmCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(expcPurcHmCdList)
            , index:0
        });

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
           ,select:onSelectSearchCarlineCd
        });

        /**
         * 모델 콤보박스
         */
         $("#intrFscpModtpCd").kendoExtDropDownList({
             dataTextField:"modelNm"
            ,dataValueField:"modelCd"
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

        $("#leadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:leadStatCdList
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

        $("#localCarRegNoYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:chgBuyYnDS
            , index:0
        });

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
        var onlyNumAlpha = new RegExp("[^A-Z0-9]");
        $(".numberandalpha").keyup(function(e)
        {

            var contents = $(this).val();
            //console.log(contents);
            //console.log(onlyNumAlpha.test(contents));
            if(onlyNumAlpha.test(contents)){

                $(this).val('');
            }
        });

     // 이메일   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
        //var onlyEmail = new RegExp("^[a-zA-Z0-9]{2,15}@[a-zA-Z0-9]{1,10}(\.[a-zA-Z]{2,3}){1,2}$");
        //var onlyEmail = new RegExp("^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$");
       $(".form_email").keyup(function(e)
       {
           var onlyEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

           var contents = $(this).val();
           //console.log(contents);
           //console.log(onlyEmail.test(contents));
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

       $("#btnCustSearch").click(function(){
           var param = {};
           param["sCustNo"] = $("#custNo").val();

           console.log("btnCustSearch Call !!");
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
               console.log(result);
               $("#dlrCd").val(result.data[0].dlrCd);

               $("#custNm").val(result.data[0].custNm);
               $("#custNmSearch").val(result.data[0].custNm);
               $("#custTp").data("kendoExtDropDownList").enable(false);
               $("#hpNo").val(result.data[0].hpNo);
               $("#telNo").val(result.data[0].telNo);
               $("#officeTelNo").val(result.data[0].officeTelNo);
               $("#wechatId").val(result.data[0].wechatId);
               $("#emailNm").val(result.data[0].emailNm);
               $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);
               $("#custHoldTp").data("kendoExtDropDownList").value(result.data[0].custHoldTp);
               $("#custHoldTpDtl").data("kendoExtDropDownList").value(result.data[0].custHoldTpDtl);
               $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
               $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{modelNm:result.data[0].intrModelNm, modelCd:result.data[0].intrFscpModtpCd}]);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);
               $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
               $("#localCarRegNoYn").data("kendoExtDropDownList").value(result.data[0].localCarRegNoYn);
               $("#estimateCont").val(result.data[0].estimateCont);
               $("#salesCont").val(result.data[0].salesCont);
               $("#remark").val(result.data[0].remark);
               $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
               $("#leadStatCd").data("kendoExtDropDownList").value(result.data[0].leadStatCd);
               $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
               $("#seq").val(result.data[0].seq);

               $("#custTp").data("kendoExtDropDownList").value();

               if (result.data[0].custTp == "01") {
                   $("#hpNo").addClass('form_readonly');
                   $("#hpNo" ).prop('readonly', true);
                   $("#officeTelNo").removeClass('form_readonly');
                   $("#officeTelNo" ).prop('readonly', false);
               } else {
                   $("#officeTelNo").addClass('form_readonly');
                   $("#officeTelNo" ).prop('readonly', true);
                   $("#hpNo").removeClass('form_readonly');
                   $("#hpNo" ).prop('readonly', false);
               }

               $("#addrGrid").data("kendoExtGrid").dataSource.read();

           });
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
                                console.log("Popup Search Result111:::");
                                console.log(data[0]);

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

       var options = parent.newCustPopupWindow.options.content.data;

       $("#leadStatCd").data("kendoExtDropDownList").value(options.leadStatCd);

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.newCustPopupWindow.close();
            }
        });

        // 저장 버튼.
        $("#btnSave").kendoButton({
            click:function(e){
                // TODO [kjlee] 저장 시 필수 입력사항 체크 필요
                var salesOpptProcParam =
                    $("#salesOpptProcForm").serializeObject(
                            $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
                    );

                var addrParam = {};

                var grid = $("#addrGrid").data("kendoExtGrid");
                var addrGridData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength > 0) {
                    $.each(addrGridData.insertList, function(idx, row){
                        if(row.addrTp == ""){
                           // 선택하지 않은 주소요형이 있습니다.
                           dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                           //dataValidate = true;
                           return false;
                        }
                    });
                }

                // enable data Assign
                salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
                salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

                var saveData = $.extend(
                    {"salesOpptProcessMgmtVO":salesOpptProcParam }
                    , {"addressInfoVOList":addrGridData}
                );

                console.log("Saving of Request Info. !!");
                console.log(saveData);

                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
                    ,data:JSON.stringify(saveData)
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

                        var data = [];
                        data.push(result);
                        options.callbackFunc(data);
                        parent.newCustPopupWindow.close();
                    }
                }).done(function(result) {
                    console.log("Done!!!!");
                });

            }
        });

        // 저장 버튼.
        $("#btnNextStep").kendoButton({
            click:function(e){
                // TODO [kjlee] 저장 시 필수 입력사항 체크 필요
                var salesOpptProcParam =
                    $("#salesOpptProcForm").serializeObject(
                            $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
                    );

                var addrParam = {};

                var grid = $("#addrGrid").data("kendoExtGrid");
                var addrGridData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength > 0) {
                    $.each(addrGridData.insertList, function(idx, row){
                        if(row.addrTp == ""){
                           // 선택하지 않은 주소요형이 있습니다.
                           dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                           //dataValidate = true;
                           return false;
                        }
                    });
                }

                // enable data Assign
                salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
                salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

                var saveData = $.extend(
                    {"salesOpptProcessMgmtVO":salesOpptProcParam }
                    , {"addressInfoVOList":addrGridData}
                );

                console.log("Saving of Request Info. !!");
                console.log(saveData);

                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
                    ,data:JSON.stringify(saveData)
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

                        var data = [];
                        data.push(result);
                        options.callbackFunc(data);
                        parent.newCustPopupWindow.close();
                    }
                }).done(function(result) {
                    console.log("Done!!!!");
                });

            }
        });

        //버튼 - 주소  추가
        $("#btnAddAddress").kendoButton({
            click:function(e) {
                zipCodeSearchPopupWin = dms.window.popup({
                    windowId:"zipCodeSearchPopupWin"
                    , width:"700"
                    , height:"400"
                    , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
                    , content:{
                        url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                        , data:{
                            "autoBind":false
                            ,"usrNm":""
                            , "callbackFunc":function(data){
                                if (data.length >= 1) {
                                    console.log(data);
                                    insertAddressItemAdd(data);
                                }
                            }
                        }
                    }
                })
            }
        });

        // 주소추가 - addressGrid
        function insertAddressItemAdd(data){
            var custNo = $("#custNo").val();
            $.each(data, function(idx, row){
                $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                    "flagYn"            :"N"
                    , "addrTp"          :"02"
                    , "zipCd"           :row.zipCd
                    , "sungNm"          :row.sungNm
                    , "cityNm"          :row.cityNm
                    , "distNm"          :row.distNm
                    , "addrNm"          :""
                    , "addrDetlCont"    :""
                    , "useYn"           :"Y"
                    , "sungCd"          :row.sungCd
                    , "cityCd"          :row.cityCd
                    , "distCd"          :row.distCd
                    , "refTableNm"      :"CR_0101T"                  //참조테이블
                    , "refKeyNm"        :custNo                     // 참조 키
                });
            });
            $("#hiddenAddrTable").show();
        }

        // 주소 삭제 - addressGrid
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

                            console.log(params);
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
            console.log(uid);

            $.each(addrGrid.dataSource.view(), function(idx, dataItem){
                dataItem.set("flagYn", "N");
            });

            addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");

        });

    });

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
     function onSelectSearchCarlineCd(e){
        $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(true);

        var dataItem = this.dataItem(e.item);
        if(dataItem.carlineCd == ""){
            $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
            ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
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
         console.log("dataItem onSelectSearchHoldTp:::::::::::::::::::");
         console.log(dataItem);
         if(dataItem.cmmCd == ""){
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
             ,async:false
         });
         console.log("onSelectSearchHoldTp");
         console.log(responseJson.total);
         if (responseJson.total == 0) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
         } else {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     }

 </script>


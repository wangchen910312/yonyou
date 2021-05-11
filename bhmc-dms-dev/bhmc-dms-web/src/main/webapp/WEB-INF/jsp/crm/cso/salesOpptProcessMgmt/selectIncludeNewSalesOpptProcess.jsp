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
                                <div class="form_search">
                                    <input id="custNmSearch" name="custNmSearch" type="text"  class="form_input onKey_down" />
                                    <input id="custNm" name="custNm" type="hidden" class="form_input" maxlength="30" data-json-obj="true" />
                                    <input id="custCd" name="custCd" type="hidden" class="form_input" />
                                    <a href="#;" class="custSearchPopup"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
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
                            </td>
                        </tr>
                        <tr class="corporateTr" style="display:none;">
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custTp" /></span></th> <!-- 고객유형 개인/법인-->
                            <td>
                                <input id="custTpC" name="custTpC" class="form_comboBox" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corporation" /></span></th> <!-- 법인명 -->
                            <td>
                                <div class="form_search">
                                    <input id="custNmSearchC" name="custNmSearchC" type="text" value="" class="form_input onKey_down" />
                                    <a href="#;" class="custSearchPopup"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
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
                                <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                            <td>
                                <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input getCustMathDocDupByKey"  maxlength="30" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                            <td>
                                <input id="custNoC" name="custNoC" type="text" class="form_input form_readonly" readonly />
                            </td>
<%--                             <th scope="row"><span class="bu_required"><spring:message code="global.lbl.officeTelNo" /></span></th> <!-- 회사전화 --> --%>
<!--                             <td> -->
<!--                                 <input id="officeTelNoC" name="officeTelNoC" type="text" class="form_input numberic getCustDupByKey"  data-type="tel" maxlength="20" pattern="\d" /> -->
<!--                             </td> -->
<%--                             <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id --> --%>
<!--                             <td> -->
<!--                                 <input id="wechatIdC" name="wechatIdC" type="text"  class="form_input" maxlength="20" /> -->
<!--                             </td> -->
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
<!--             <div class="header_area"> -->
<%--                 <h2 class="title_basic"><spring:message code='global.title.addr' /></h2> --%>
<!--                 <div class="btn_right"> -->
<%--                     <button class="btn_s btn_save" id="btnSaveAddress" ><spring:message code="global.btn.save" /></button> <!-- 주소저장 --> --%>
<%--                     <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 --> --%>
<%--                     <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 --> --%>
<!--                 </div> -->
<!--             </div> -->
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
                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.infoType' /><!-- 리드유형 --></span></th>
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
                            <th scope="row"><spring:message code='crm.lbl.plateNum' /><!-- 현지번호판예정 --></th>
                            <td>
                                <div class="form_float">
                                        <div class="form_left" style="width:16%" >
                                            <label class="label_check ml5"><input id="localCarRegNoYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /></label>
                                        </div>
                                 </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.intentionCarline' /><!-- 의향차종 --></span></th>
                            <td>
                                <input id="intrCarlineCd" name="intrCarlineCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.intentionVariant' /><!-- 의향차관 --></th>
                            <td colspan="3">
                                <input id="intrFscpModtpCd" name="intrFscpModtpCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향색상 --></th>
                            <td>
                                <input id="intrColorCd" name="intrColorCd" type="text" value="" class="form_comboBox"  data-json-obj="true" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div> <!-- 정보유형 영역 끝 -->

            <!-- 협의정보 -->
            <div class="header_area"> <!-- 협의정보 타이틀 시작 -->
                <h2 class="title_basic"><spring:message code='crm.lbl.agrmntInfo' /><!-- 협의정보 --></h2>
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
                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.leadStat' /></span></th> <!-- 리드상태 -->
                            <td>
                                <input id="leadStatCd" name="leadStatCd" type="text" value="" class="form_comboBox" data-json-obj="true" />
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
            <input type="hidden" id="custSearch" name="custSearch"  class="custSearch" />
            <input type="hidden" id="exhvFlakSeq" name="exhvFlakSeq"  data-json-obj="true" />
        </div> <!--  salesOpptProcForm End  -->

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
            //console.log(contents);
            //console.log(onlyNumAlpha.test(contents));
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
            console.log(contents);
            if(corpNumChk.test(contents)){
                $(this).val('');
            }
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
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
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
                    $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
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

        $("#leadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dms.data.cmmCdFilter(leadStatCdList)
            , index:0
        });
        $("#leadStatCd").data("kendoExtDropDownList").enable(false);

        $("#mngScId").kendoExtDropDownList({
            dataTextField:"usrNm"
            , dataValueField:"usrId"
            , optionLabel:" "
            , dataSource:usersRoleCrmR18
            , index:0
            , filter:"contains"
            , filtering:function(e){
                var filter = e.filter;
            }
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).usrId;
                if (selcmmCd != ""){
                    $("#leadStatCd").data("kendoExtDropDownList").value("02");
                } else {
                    $("#leadStatCd").data("kendoExtDropDownList").value("01");
                }
            }

        });
        $("#mngScId").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });

        console.log("mngScIdCtrl:::" + "${mngScIdCtrl}" );
        var mngScIdCtrl = "${mngScIdCtrl}";
        if (mngScIdCtrl == "N") {
            $("#mngScId").data("kendoExtDropDownList").value("${loginUsrId}");
            $("#mngScId").data("kendoExtDropDownList").enable(false);
            $("#leadStatCd").data("kendoExtDropDownList").value("02");
        }

        $("#sexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(sexCdList)
            , index:0
        });

        // 주소정보 show/hide
        $("#btnAddrHidden").kendoButton({
            click:function(e){
                $("#hiddenAddrTable").toggle();
                $("#btnAddrHidden").toggleClass("active");
            }
        });

        // 고객명 조회 돋보기
        $(".custSearchPopup").click(function(){
            $(".custSearch").click();
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

                var leadStatCd = result.data[0].leadStatCd;

                $("#dlrCd").val(result.data[0].dlrCd);

                $("#custNm").val(result.data[0].custNm);
                $("#custCd").val(result.data[0].custCd);
                $("#custNmSearch").val(result.data[0].custNm);
                $("#custNmSearchC").val(result.data[0].custNm);
                $("#custTp").data("kendoExtDropDownList").enable(false);
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
                    $("#holdDetlTpSeq").data("kendoExtDropDownList").value(result.data[0].holdDetlTpSeq);
                }
                $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
                $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
                onSelectSearchVariantSet(result.data[0].intrCarlineCd);
                $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);

                //$("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{fscNm:result.data[0].fscNm, fscCd:result.data[0].intrFscpModtpCd}]);
                $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd);
                //$("#localCarRegNoYn").data("kendoExtDropDownList").value(result.data[0].localCarRegNoYn);
                $("#estimateCont").val(result.data[0].estimateCont);
                $("#salesCont").val(result.data[0].salesCont);
                $("#remark").val(result.data[0].remark);
                //$("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
                $("#beforeMngScId").val(result.data[0].mngScId);
                $("#leadStatCd").data("kendoExtDropDownList").value(leadStatCd);
                $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
                $("#seq").val(result.data[0].seq);
                $("#exhvFlakSeq").val(result.data[0].exhvFlakSeq);
                if (result.data[0].localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true) };

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

        // 고객명, 휴대전화 입력 후 고객 체크 (자동)
        $(".getCustDupByKey").focusout(function(){
            var idValue = $(this).context.id;
            console.log("getCustDupByKey focusout !!!");
            getCustDupByKey(idValue);
        });

     // 증거유형 + 증거번호 후 고객 체크 (자동)
        $(".getCustMathDocDupByKey").focusout(function(){
            var idValue = $(this).context.id;
            getCustMathDocDupByKey(idValue);
        });

        // 고객조회
        //var custSearch = function() {
         $(".custSearch").click(function(){

             var iframe = "selectNewSalesOpptProcessPopup";
             var autoBind = "Y";
             var type = "";
             var custTp = $("#custTp").data("kendoExtDropDownList").value();
             var custCd = "";
             var custNm = $("#custNmSearch").val();
             var dlrMbrYn = "";

             if (custTp == "02") {
                 custNm = $("#custNmSearchC").val();
             }
             console.log("parent.fn_custSearchPopUp :  " + custNm);
             parent.fn_custSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn);

         });

        // 고객조회
        //var custSearch = function() {
         $(".relCustSearch").click(function(){

             var iframe = "selectNewSalesOpptProcessPopup";
             var autoBind = "Y";
             var type = "";
             var custTp = "01";  // 개인
             var custCd = "";
             var custNm = $("#relCustNmSearch").val();
             var dlrMbrYn = "";

             parent.fn_relCustSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn);

         });

         //버튼 - 주소  추가
         $("#btnAddAddress").kendoButton({
             click:function(e) {
                 parent.fn_callAddrPopUp("selectNewSalesOpptProcessPopup");
             }
         })

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

                 var custNm = $("#custNmSearch").val();
                 var custNmC = $("#custNmSearchC").val();
                 var custTp = $("#custTp").data("kendoExtDropDownList").value();
                 var hpNo = $("#hpNo").val();
                 var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                 var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
                 var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();
                 var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                 //var officeTelNo = $("#officeTelNoC").val();
                 var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

                 var mathDocTpCVal = $("#mathDocTpC").data("kendoExtDropDownList").value();
                 var ssnCrnNoCVal = $("#ssnCrnNoC").val();

                 // 법인연계인 (구매담당자)
                 var relCustNm = $("#relCustNm").val();
                 var relCustHpNo = $("#relCustHpNo").val();

                 var custNo = $("#custNo").val();

                 if ( dms.string.isNotEmpty(custNo) ) {
                     if (fn_leadSearch(custNo)) {
                         dms.notification.warning("<spring:message code='crm.info.processingLead' />");
                         return false;
                     } else {
                         $("#addrGrid").data("kendoExtGrid").dataSource.read();
                     }
                 };

                 if ( dms.string.isEmpty(custNm) && dms.string.isEmpty(custNmC)) {
                     dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };
                 if ( dms.string.isEmpty(custTp) ) {
                     dms.notification.warning("<spring:message code='global.lbl.custTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if (custTp =="01") {
                     if ( dms.string.isEmpty(hpNo) ) {
                         dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     };

                     // 전화번호
                     if (hpNo.length <= 10) {
                         dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
                         $("#hpNo").focus();
                         return false;
                      }

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

                 if ( dms.string.isEmpty(intrCarlineCd) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if ( dms.string.isEmpty(infoTp) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if ( dms.string.isEmpty(holdTp) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

                 if ( dms.string.isEmpty(leadStatCd) ) {
                     dms.notification.warning("<spring:message code='crm.lbl.leadStat' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 };

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
                 salesOpptProcParam["mngScId"] = mngScId;

                 if (custTp == "02"){
                     salesOpptProcParam["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                     salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                     salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                     //salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
                     salesOpptProcParam["wechatId"] = $("#wechatIdC").val();
                     salesOpptProcParam["custNm"] = $("#custNmSearchC").val();
                 }

                 if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };

                 var saveData = $.extend(
                     {"salesOpptProcessMgmtVO":salesOpptProcParam }
                     , {"addressInfoVOList":addrGridData}
                 );

                 if (mngScId != "") {
                     salesOpptProcParam["leadStatCd"] = "02";
                 } else {
                     salesOpptProcParam["leadStatCd"] = "01";
                 }

                 salesOpptProcParam["reviveOppt"] = "Y";    // 판매기회 되살림
                 salesOpptProcParam["reSetYn"] = "Y";       // 진행중이 아닌 판매기회를 신규 등록 시 데이터 리셋.

                 console.log("Saving of Request Info. btnSave !!");
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
                         var options = parent.newCustPopupWindow.options.content.data;
                         options.callbackFunc(data);
                         parent.newCustPopupWindow.close();
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
             console.log(uid);

             $.each(addrGrid.dataSource.view(), function(idx, dataItem){
                 dataItem.set("flagYn", "N");
             });

             addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");

         });



    });

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 차관검색
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

     function fn_leadSearch(custNo){

         var dupChk = false;
         var param = {};
         param["sCustNo"] = custNo;

         console.log("fn_leadSearch Call !!");

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtIng.do' />"
             ,data:JSON.stringify(param)
             ,async:false
         });
         console.log("+++++responseJson+++++");
         console.log(responseJson);

         $("#btnSave").data("kendoButton").enable(true);

         if (responseJson.data != null) {
                //dupChk = true;
             if (responseJson.data[0].leadStatCd =="01"
                     || responseJson.data[0].leadStatCd =="02"
                     || responseJson.data[0].leadStatCd =="03"
                     || responseJson.data[0].leadStatCd =="04"
                     || responseJson.data[0].leadStatCd =="05"
             )
             {
                 dupChk = true;
                 $("#btnSave").data("kendoButton").enable(false);
                 $("#leadStatCd").data("kendoExtDropDownList").value(responseJson.data[0].leadStatCd);
                 $("#seq").val(responseJson.data[0].seq);
                 $("#custNo").val(responseJson.data[0].custNo);
             } else {
                 $("#custNo").val(responseJson.data[0].custNo);
                 $("#leadStatCd").data("kendoExtDropDownList").value(responseJson.data[0].leadStatCd);
                 $("#seq").val(responseJson.data[0].seq);
                 $("#btnCustSearch").click();
             }
         }

         return dupChk;

     }

     // 주소추가 - addressGrid
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
     }

     function fn_custSearchRlt(data) {
         if (data.length >= 1) {
             console.log("Popup Search fn_custSearchRlt:::");
             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                 $("#custNo").val(data[0].custNo);
                 $("#custNm").val(data[0].custNm);
                 $("#custNmSearch").val(data[0].custNm);
                 $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);
                 $("#custTp").data("kendoExtDropDownList").enable(false);
                 $("#hpNo").val(data[0].hpNo);
                 $("#telNo").val(data[0].telNo);
                 $("#officeTelNo").val(data[0].officeTelNo);
                 $("#wechatId").val(data[0].wechatId);
                 $("#emailNm").val(data[0].emailNm);
                 $("#sexCd").data("kendoExtDropDownList").value(data[0].sexCd);
                 $("#addrFull").val(data[0].addrFull);

                 $("#custNmSearchC").val(data[0].custNm);
                 $("#custTpC").data("kendoExtDropDownList").value(data[0].custTp);
                 $("#custTpC").data("kendoExtDropDownList").enable(false);
                 $("#mathDocTpC").data("kendoExtDropDownList").value(data[0].mathDocTp);
                 $("#ssnCrnNoC").val(data[0].ssnCrnNo);
                 $("#bizcondCdC").data("kendoExtDropDownList").value(data[0].bizcondCd);
                 //$("#officeTelNoC").val(data[0].officeTelNo);
                 $("#wechatIdC").val(data[0].wechatId);
                 $("#custNoC").val(data[0].custNo);

                 // 법인연계인 (구매담당자)
                 $("#relCustNm").val(data[0].purcMngNm);
                 $("#relCustHpNo").val(data[0].hpNo);

             }

             if (data[0].custTp == "01") {
                $(".personalTr").show();
                $(".corporateTr").hide();
             } else {
                $(".personalTr").hide();
                $(".corporateTr").show();
             }

             if (fn_leadSearch(data[0].custNo)) {
                 dms.notification.warning("<spring:message code='crm.info.processingLead' />");
                 return false;
             } else {
                 $("#addrGrid").data("kendoExtGrid").dataSource.read();
             }
         }
     }

     function fn_relCustSearchRlt(data) {
         if (data.length >= 1) {
             console.log("Popup Search fn_custSearchRlt:::");
//              console.log(data[0]);
//              console.log(data[0].custNo);
             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                 //$("#relCustNo").val(data[0].custNo);
                 //$("#relCustNmSearch").val(data[0].custNm);
                 $("#relCustNm").val(data[0].custNm);
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

     function getCustDupByKey(idVal){
         console.log("getCustDupByKey!!!!");
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
             custNm = $("#custNmSearchC").val();
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

             console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectCustDupScreenByKey.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log(jqXHR);
                     //console.log(jqXHR.responseJSON);
                     dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
//                      console.log("Dup Check. result!!!");
//                      console.log(result);

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

         var custNm = $("#custNm").val();
         var custNo = $("#custNo").val();
         var hpNo = $("#hpNo").val();
         var mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         var ssnCrnNo = $("#ssnCrnNoC").val();
         var officeTelNo = "";
         var oldCustNm = "";
         var oldHpNo = "";
         var oldMathDocTp = "";
         var oldSsnCrnNo = "";
         var chkContinued = false;

         if (custTp == "02") {
             custNm = $("#custNmC").val();
             mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
             ssnCrnNo = $("#ssnCrnNoC").val();
         }

         if (dms.string.isNotEmpty(mathDocTp) && dms.string.isNotEmpty(ssnCrnNo)){

             var param = {};
             param["sCustNo"]        = custNo;
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

//              console.log(param);

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
                     console.log("getCustMathDocDupByKey !!! ");

                     if (result.total == 0 ){
                         dms.notification.warning("<spring:message code='global.info.ableToDo' />");
                     } else {
                         dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                     }
                 }
             }).done(function(result) {
                 console.log("done!!!!");
             });
         }
     }

    </script>
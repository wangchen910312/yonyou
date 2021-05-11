<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 합격증신청 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.certReq" /> --%></h1><!-- 합격증 신청 -->
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_save" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

<div  id="transForm">
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCd" /></span></th><!-- 딜러코드 -->
                        <td class="required_area">
                            <input id="dlrCd" name="dlrCd" class="form_input form_readonly" readonly data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dlrNm" /></th><!-- 딜러명칭 -->
                        <td>
                            <input id="dlrNm" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span></th><!-- 합격증유형 -->
                        <td class="required_area">
                            <input id="certTp" name="certTp" class="form_comboBox" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ordNo" /></th><!-- 오더번호 -->
                        <td>
                            <input id="certNo" class="form_input form_readonly" readonly >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.requestUsr" /></th><!-- 신청인 -->
                        <td>
                            <div class="form_search">
                                <input id="custNo" name="custNo" class="form_input form_readonly hidden" readonly data-json-obj="true" />
                                <input id="custNm" name="custNm" class="form_input form_readonly" readonly data-json-obj="true" />
                                <a id="searchCustNo" class="form_readonly" readonly><!--신청인 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th><!-- 전화 -->
                        <td>
                            <input id="telNo" name="telNo" class="form_input numberic form_readonly" readonly type="text" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="global.lbl.hpNo" /></th><!-- 핸드폰 -->
                        <td>
                            <input id="hpNo" name="hpNo" class="form_input numberic form_readonly" readonly type="text" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.requestTm" /></th><!-- 신청시간 -->
                        <td>
                            <input id="regDt" name="regDt" type="text" class="form_datepicker"  >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.baseVinNo" /></span><!-- 차량VIN --></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="baseVinNo" name="baseVinNo" class="form_input form_readonly" data-json-obj="true" data-name="<spring:message code="par.lbl.baseVinNo" />" required readonly/>
                                <a id="searchVinNo"><!--VIN & 고객 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd"  /></th><!-- 부품번호 -->
                        <td>
                            <div class="form_search">
                                <input id="itemCd" name="itemCd" class="form_input form_readonly hidden" readonly data-json-obj="true" >
                                <input id="itemNm" name="itemNm" class="form_input form_readonly" data-json-obj="true" >
                                <a id="searchItemCd"><!--부품번호 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.detlCont" /></th><!-- 상세설명 -->
                        <td colspan="3">
                            <input id="detlCont" name="detlCont" class="form_input" data-json-obj="true" >
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.engine" /></h2><!-- 엔진 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.oldEnginCylPhotoNm" /></th><!-- 구 엔진실린더사진 -->
                        <td class="required_area">
                            <input id="oldEnginCylPhotoNm" name="oldEnginCylPhotoNm" class="form_input" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.oldEnginCylNo" /></th><!-- 구 엔진실린더번호 -->
                        <td>
                            <input id="oldEnginCylNo" name="oldEnginCylNo" class="form_input" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.newEnginCylPhotoNm" /></th><!-- 신 엔진실린더사진 -->
                        <td>
                            <input id="newEnginCylPhotoNm" name="newEnginCylPhotoNm" class="form_input" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.newEnginCylNo" /></th><!-- 신 엔진실린더번호 -->
                        <td>
                            <input id="newEnginCylNo" name="newEnginCylNo" class="form_input" data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.fileDocNo" /></th><!-- 기타첨부파일 -->
                        <td>
                            <input id="fileDocNo" name="fileDocNo" class="form_input " data-json-obj="true" >
                        </td>
                        <td colspan="3"></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.carBody" /></h2><!-- 바디 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.newVinNo" /></th><!-- 신차 VIN NO -->
                        <td>
                            <input id="newVinNo" name="newVinNo" class="form_input numberandalpha" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carBodyVinNo" /></th><!-- 차체 VIN NO -->
                        <td>
                            <input id="carBodyVinNo" name="carBodyVinNo" class="form_input numberandalpha" data-json-obj="true" >
                        </td>
                        <td colspan="4"></td>
                    </tr>
                </tbody>
            </table>
        </div>

</div><!--  end transForm -->

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.evalCond" /></h2><!-- 심사상황 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:41%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.evalRslt" /></th><!-- 심사결과 -->
                        <td>
                            <input id="evalRsltNm" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.evalComment" /></th><!-- 심사의견 -->
                        <td>
                            <input id="evalOpnCont" class="form_input form_readonly" readonly>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.procRsltCont" /></h2><!-- 처리결과 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.certZipCd" /></th><!-- 합격증우편번호 -->
                        <td>
                            <input id="zipCd" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.trsfCmpCd" /></th><!-- 택배사 -->
                        <td>
                            <input id="trsfCmpCd" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.certzipSendDt" /></th><!-- 합격증우편발송시간 -->
                        <td>
                            <input id="zipSendDt" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.detlCont" /></th><!-- 상세설명 -->
                        <td colspan="5">
                            <input id="procRsltDetlCont" class="form_input form_readonly" readonly>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //합격증신청 -->



    <!-- script -->
    <script>

    var sessionDlrCd         = "${dlrInfo.dlrCd}"
       ,sessionDlrNm         = "${dlrInfo.dlrNm}"
       ,toDt                 = "${toDt}"
       ,pCertNo              = "${pCertNo}"
       ,searchItemPopupWindow
       ,vehOfCustInfoSearchPopup
       ,popupWindow;


    $(document).ready(function() {

        $("#baseVinNo").keypress(function(e){
            if(e.keyCode === 13){
                e.preventDefault();
                custPopupWindow();
            }
         });

         // 집전화
        $("#telNo").kendoMaskedTextBox({
            mask:"000-0000-0000"
           ,promptChar:" "
        });

        // 휴대전화
        $("#hpNo").kendoMaskedTextBox({
            mask:"000-0000-0000"
           ,promptChar:" "
        });

        // 신청시간
         $("#regDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });


         //조회조건-유형
         $("#certTp").kendoExtDropDownList({
            dataSource:[
                          {"cmmCd":"01", "cmmCdNm":"发动机"} //Engin
                         ,{"cmmCd":"02", "cmmCdNm":"车身"} //Body
                    ]
           ,dataTextField :"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,optionLabel   :" "
         });

        // 심사결과
        $("#evalRsltNm").kendoExtDropDownList({
            dataSource:[
                          {"cmmCd":"Y", "cmmCdNm":"是"} //예
                         ,{"cmmCd":"N", "cmmCdNm":"否"} //아니요
                    ]
           ,dataTextField :"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,optionLabel   :" "
        });
        $("#evalRsltNm").data("kendoExtDropDownList").enable(false);
        /* $("#searchCustNo").on('click', selectCustSearchPopupWindow); */
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchVinNo").on('click', custPopupWindow);


        $("#certTp").on("change", btnView);

        // 초기화
        $("#btnInit").kendoButton({
            click:function(e){
                pCertNo = ''; //합격증 조회 화면에서 넘어온 합격증 번호 삭제.
                initPage();
            }
        });

        // 저장
        $("#btnSave").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#certTp").val())){
                    // 합격증 유형을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='global.lbl.type' var='arguMsg' /><spring:message code='global.info.check.field' arguments='${arguMsg}'/>");
                    return;
                }


                if(dms.string.isEmpty($("#baseVinNo").val())){
                    // 원 VINNO을(를) 입력하여 주십시오.
                    dms.notification.info("<spring:message code='par.lbl.baseVinNo' var='arguMsg' /><spring:message code='global.info.validation.required' arguments='${arguMsg}'/>");
                    return;
               }

/*                 if(dms.string.isEmpty($("#custNo").val())){
                    // 신청자을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='sal.lbl.requestUsr' var='arguMsg' /><spring:message code='global.info.check.field' arguments='${arguMsg}'/>");
                    return;
                } */

                // form 데이터
                var param =
                    $("#transForm").serializeObject(
                        $("#transForm").serializeArrayInSelector("[data-json-obj='true']")
                    );
                console.log('param:',JSON.stringify(param));
                var url = "<c:url value='/par/pmm/certification/insertCertReq.do' />";

                $.ajax({
                      url:url
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        console.log(jqXHR,"error");
                        //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(result){

                        if (result.resultYn == true) {
                            dms.notification.success("<spring:message code='global.lbl.ordNo' var='certNo' /><spring:message code='global.info.regSuccessParam' arguments='${certNo}'/>");
                            //dms.notification.success("<spring:message code='global.info.success'/>");

                            certNo = result.certNo;
                            $("#certNo").val(certNo);

                        } else {
                            console.log('errorResult:',result);
                            if(result === 0){
                                dms.notification.error("<spring:message code='global.lbl.ordNo' var='certNo' /><spring:message code='global.err.regFailedParam' arguments='${certNo}'/>");
                            }
                        }
                    }
                }).done(function(result) {
                    console.log("Certification Save Done!!!!");
                });
            }
        });

        initPage();

    });



    // 초기화
    function initPage(){
        //딜러 기본셋팅
        $("#dlrCd").val(sessionDlrCd);
        $("#dlrNm").val(sessionDlrNm);

        console.log("pCertNo",pCertNo);

         //합격증 조회에서 넘어온경우
         if(!dms.string.isEmpty(pCertNo)){

            $.ajax({
                url:"<c:url value='/par/pmm/certification/selectCertReqByKey.do' />"
               ,data:JSON.stringify({ sCertNo:pCertNo})
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,async:false
               ,success:function(result) {
                   console.log("result :", result);

                   if (!dms.string.isEmpty(result)) {

                       //수정해야 할 부분
                       $("#telNo").data("kendoMaskedTextBox").value(result.telNo);
                       $("#hpNo").data("kendoMaskedTextBox").value(result.hpNo);
                       //$("#certTp").val(result.certTp);
                       $("#certTp").data("kendoExtDropDownList").value(result.certTp);
                       $("#custNo").val(result.custNo);
                       $("#custNm").val(result.custNm);
                       $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
                       $("#certNo").val(result.certNo);
                       $("#itemCd").val(result.itemCd);
                       $("#itemNm").val(result.itemNm);
                       $("#baseVinNo").val(result.baseVinNo);
                       $("#newVinNo").val(result.newVinNo);
                       $("#carBodyVinNo").val(result.carBodyVinNo);
                       $("#detlCont").val(result.detlCont);
                       $("#evalRsltNm").val(result.evalRsltNm);
                       $("#evalOpnCont").val(result.evalOpnCont);
                       $("#zipCd").val(result.zipCd);
                       $("#trsfCmpCd").val(result.trsfCmpCd);
                       $("#procRsltDetlCont").val(result.procRsltDetlCont);
                       $("#evalRsltNm").val(result.evalRsltNm);
                       $("#evalOpnCont").val(result.evalOpnCont);
                       $("#trsfCmpCd").val(result.trsfCmpCd);
                       $("#zipSendDt").val(result.zipSendDt);
                       $("#procRsltDetlCont").val(result.procRsltDetlCont);
                       $("#fileDocNo").val(result.fileDocNo);
                       $("#oldEnginCylPhotoNm").val(result.oldEnginCylPhotoNm);
                       $("#oldEnginCylNo").val(result.oldEnginCylNo);
                       $("#newEnginCylPhotoNm").val(result.newEnginCylPhotoNm);
                       $("#newEnginCylNo").val(result.newEnginCylNo);
                   } else {
                       console.log('errorResult:',result);
                       if(result === 0){
                           dms.notification.error("<spring:message code='global.lbl.ordNo' var='certNo' /><spring:message code='global.err.modifyFailedParam' arguments='${certNo}'/>");
                       }
                   }
               }
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }

           });
            btnView(); // 버튼 구성

       }else{

        $("#certTp").data("kendoExtDropDownList").value('');
        $("#telNo").val("");
        $("#hpNo").val("");
        $("#custNo").val("");
        $("#custNm").val("");
        $("#regDt").data("kendoExtMaskedDatePicker").value(toDt);
        $("#certNo").val("");
        $("#itemCd").val("");
        $("#itemNm").val("");
        $("#baseVinNo").val("");
        $("#newVinNo").val("");
        $("#carBodyVinNo").val("");
        $("#detlCont").val("");
        $("#evalRsltNm").val("");
        $("#evalOpnCont").val("");
        $("#zipCd").val("");
        $("#trsfCmpCd").val("");
        $("#zipSendDt").val("");
        $("#procRsltDetlCont").val("");
        $("#fileDocNo").val("");
        $("#oldEnginCylPhotoNm").val("");
        $("#oldEnginCylNo").val("");
        $("#newEnginCylPhotoNm").val("");
        $("#newEnginCylNo").val("");

        btnView(); // 버튼 구성
       }
    }

    //버튼 구성
    function btnView(){

        var pStat = $("#certTp").data("kendoExtDropDownList").value();

        //합격증 조회에서 넘어온경우 버튼 구성
        if(!dms.string.isEmpty(pCertNo)){
        $("#hpNo").data("kendoMaskedTextBox").enable(false);
        $("#telNo").data("kendoMaskedTextBox").enable(false);
        $("#certTp").data("kendoExtDropDownList").enable(false);
        $("#regDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#itemCd").addClass("form_disabled form_readonly ");
        $("#itemCd").attr("readonly", true);
        $("#detlCont").addClass("form_disabled form_readonly");
        $("#detlCont").attr("readonly", true);
        $("#newVinNo").addClass("form_disabled form_readonly");
        $("#newVinNo").attr("readonly", true);
        $("#fileDocNo").addClass("form_disabled form_readonly");
        $("#fileDocNo").attr("readonly", true);
        $("#baseVinNo").addClass("form_disabled form_readonly");
        $("#baseVinNo").attr("readonly", true);
        $("#searchItemCd").addClass("form_disabled form_readonly");
        $("#searchItemCd").attr("readonly", true);
        $("#searchCustNo").addClass("form_disabled form_readonly");
        $("#searchCustNo").attr("readonly", true);
        $("#carBodyVinNo").addClass("form_disabled form_readonly");
        $("#carBodyVinNo").attr("readonly", true);
        $("#oldEnginCylNo").addClass("form_disabled form_readonly");
        $("#oldEnginCylNo").attr("readonly", true);
        $("#newEnginCylNo").addClass("form_disabled form_readonly");
        $("#newEnginCylNo").attr("readonly", true);
        $("#newEnginCylPhotoNm").addClass("form_disabled form_readonly");
        $("#newEnginCylPhotoNm").attr("readonly", true);
        $("#oldEnginCylPhotoNm").addClass("form_disabled form_readonly");
        $("#oldEnginCylPhotoNm").attr("readonly", true);
        pCertNo = ''; //초기화

        }else{

        $("#hpNo").data("kendoMaskedTextBox").enable(true);
        $("#certTp").data("kendoExtDropDownList").enable(true);
        $("#telNo").data("kendoMaskedTextBox").enable(true);
        $("#regDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#searchItemCd").removeClass("form_disabled form_readonly");
        $("#searchItemCd").attr("readonly", false);
        $("#searchCustNo").removeClass("form_disabled form_readonly");
        $("#searchCustNo").attr("readonly", false);
        $("#baseVinNo").removeClass("form_disabled form_readonly");
        $("#baseVinNo").attr("readonly", false);
        $("#detlCont").removeClass("form_disabled form_readonly");
        $("#detlCont").attr("readonly", false);
        $("#itemCd").removeClass("form_disabled form_readonly");
        $("#itemCd").attr("readonly", false);


            //유형
            if(pStat === '01'){ //엔진인 경우
            $("#newVinNo").addClass("form_disabled form_readonly");
            $("#newVinNo").attr("readonly", true);
            $("#carBodyVinNo").addClass("form_disabled form_readonly");
            $("#carBodyVinNo").attr("readonly", true);
            $("#fileDocNo").removeClass("form_disabled form_readonly");
            $("#fileDocNo").attr("readonly", false);
            $("#oldEnginCylNo").removeClass("form_disabled form_readonly");
            $("#oldEnginCylNo").attr("readonly", false);
            $("#newEnginCylNo").removeClass("form_disabled form_readonly");
            $("#newEnginCylNo").attr("readonly", false);
            $("#newEnginCylPhotoNm").removeClass("form_disabled form_readonly");
            $("#newEnginCylPhotoNm").attr("readonly", false);
            $("#oldEnginCylPhotoNm").removeClass("form_disabled form_readonly");
            $("#oldEnginCylPhotoNm").attr("readonly", false);

            $("#carBodyVinNo").val("");
            $("#newVinNo").val("");

            }else if(pStat === '02'){//바디인 경우
            $("#newVinNo").removeClass("form_disabled form_readonly");
            $("#newVinNo").attr("readonly", false);
            $("#carBodyVinNo").removeClass("form_disabled form_readonly");
            $("#carBodyVinNo").attr("readonly", false);
            $("#fileDocNo").addClass("form_disabled form_readonly");
            $("#fileDocNo").attr("readonly", true);
            $("#oldEnginCylNo").addClass("form_disabled form_readonly");
            $("#oldEnginCylNo").attr("readonly", true);
            $("#newEnginCylNo").addClass("form_disabled form_readonly");
            $("#newEnginCylNo").attr("readonly", true);
            $("#newEnginCylPhotoNm").addClass("form_disabled form_readonly");
            $("#newEnginCylPhotoNm").attr("readonly", true);
            $("#oldEnginCylPhotoNm").addClass("form_disabled form_readonly");
            $("#oldEnginCylPhotoNm").attr("readonly", true);

            $("#fileDocNo").val("");
            $("#oldEnginCylPhotoNm").val("");
            $("#oldEnginCylNo").val("");
            $("#newEnginCylPhotoNm").val("");
            $("#newEnginCylNo").val("");

            }
        }

    }


    // 신청자 팝업
    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
           windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#telNo").data("kendoMaskedTextBox").value(data[0].telNo);
                            $("#hpNo").data("kendoMaskedTextBox").value(data[0].hpNo);

                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }


    //부품 팝업
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
           windowId:"ItemMasterPopup"
           ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
           ,content:{
               url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
              ,data:{
                  "type"        :""
                 ,"autoBind"    :true
                 ,"closeAfterSelect":true
                 ,"callbackFunc":function(data){
                        $("#itemCd").val(data[0].itemCd);
                        $("#itemNm").val(data[0].itemNm);

                        searchItemPopupWindow.close();
                 }

              }
           }
        });
    };


    //VIN NO 팝업
    function custPopupWindow(){

        vehOfCustInfoSearchPopup = dms.window.popup({
           windowId:"vehOfCustInfoSearchPopup"
           ,title  :"<spring:message code='ser.title.custSearch' />" // 고객 조회
           ,content:{
               url :"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
              ,data:{
                  "autoBind"    :true
                 , "type"       :null
                 ,"callbackFunc":function(data){
                     console.log("data",data);
                        $("#baseVinNo").val(data[0].vinNo);
                        $("#hpNo").val(data[0].carOwnerHpNo);
                        $("#telNo").val(data[0].carOwnerTelNo);
                        $("#custNo").val(data[0].carOwnerId);
                        $("#custNm").val(data[0].carOwnerNm);
                 }
              }
              }

        });
    };



    </script>
    <!-- //script -->
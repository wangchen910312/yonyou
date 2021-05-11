<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 딜러 One Click 회원가입 -->
<section id="custCareMgmtPopup" class="pop_wrap">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="crm.title.createMembership" /><!-- 딜러 One Click 회원가입 --></h2>
        <div class="btn_right">
            <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='crm.btn.register' /><!-- 가입 --></button>
        </div>
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                    <td>
                        <div>
                            <input type="text" id="custNm" name="custNm" class="form_input form_readonly" readonly="readonly"  placeholder="<spring:message code='global.lbl.custSearch' />" data-json-obj="true" />
                            <input type="hidden" id="custNo" name="custNo" >
                            <input type="hidden" id="blueMembershipNo" name="blueMembershipNo" >
                            <input type="hidden" id="dlrCd" name="dlrCd" >
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.custTp" /></th><!-- 고객유형 -->
                    <td class="readonly_area">
                        <input id="custTp" name="custTp" class="form_comboBox" readonly="readonly"  />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 휴대전화 -->
                    <td>
                        <input id="hpNo" name="hpNo" value="" readonly="readonly" class="form_input form_readonly"  />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.mathDocTp' /></th><!-- 증거 유형 -->
                    <td class="readonly_area">
                        <input id="mathDocTp" name="mathDocTp" class="form_comboBox" readonly="readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ssnCrnNo' /></th><!-- 증거 번호 -->
                    <td class="readonly_area">
                        <input id="ssnCrnNo" name="ssnCrnNo" value="" class="form_input" readonly="readonly" />
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.agree" /></th><!-- 지불여부 -->
                    <td>
                        <input id="agree" name="agree" class="form_comboBox"  />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.amount' /></th><!-- 지불금액 -->
                    <td>
                        <input id="amount" name="amount" class="form_comboBox"  />
                    </td>
                </tr>
                <tr id="createMembershipData" >
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN번호 -->
                    <td class="readonly_area">
                        <input id="vin" name="vin" class="form_input" readOnly="readOnly" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.haveModel' /></th><!-- 보유모델 -->
                    <td class="readonly_area">
                        <input id="modelNm" name="modelNm" value=""  readOnly="readOnly" class="form_input"  maxlength="100" />
                        <input type="hidden" id="modelCd" name="modelCd" />
                    </td>
                    <td colspan="4"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="agreeChk" style="display:" class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:50%;">
                <col style="">
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <label class="label_check ml5"><input type="checkbox" id="policyAgreeYn" name="policyAgreeYn" class="form_check" checked> <spring:message code="crm.lbl.blueMemUsrPolicyAgree"/><!-- Bluemembers 회원 정책 동의함(同意蓝缤会员政策) --></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- //딜러 One Click 회원가입 -->

<script type="text/javascript">

    /*************************************************************
     *드랍다운 리스트 셋팅 start
     *************************************************************/
    //고객유형 설정
    var custTpList              = [];
    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //신분증 유형(주요인증문서유형) 설정
    var mathDocTpList           = [];
    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //지불금액 설정
    var amountList           = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${amountList}">
    amountList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    /*************************************************************
    *드랍다운 리스트 셋팅 end
    *************************************************************/


    // 폼 초기화
    function initForm(){

        $("#custNm").val("");
        $("#custNo").val("");
        $("#blueMembershipNo").val("");
        $("#dlrCd").val("");
        $("#custTp").data("kendoExtDropDownList").value("");
        $("#hpNo").val("");
        $("#mathDocTp").data("kendoExtDropDownList").value("");
        $("#ssnCrnNo").val("");
        $("#agree").data("kendoExtDropDownList").value("");
        $("#amount").data("kendoExtDropDownList").value("");
        $("#vin").val("")
        $("#modelNm").val("");
        $("#modelCd").val("");

    };

    $(document).ready(function() {

        //지불여부
        $("#agree").kendoExtDropDownList({
            dataSource:["Y","N"]
            ,index:1
            //, enable:false
            ,change: function(e) {
                var value = this.value();
                if(value == "Y"){
                    var amount = $("#amount").data("kendoExtDropDownList");
                    amount.enable(true);
                    amount.value(50);
                }else{
                    var amount = $("#amount").data("kendoExtDropDownList");
                    amount.enable(false);
                    amount.value("");
                }
            }
        });

        //지불금액
        $("#amount").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
          , dataValueField:"cmmCd"
          , dataSource:amountList
          , index:0
          , enable:false
        });

        // 고객유형            custTp(CRM001)
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:custTpList
            , index:0
        });

        // 신분증유형            mathDocTp       (CRM024)
        $("#mathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:mathDocTpList
            , index:0
        });

        $('#policyAgreeYn').change(function(){
            if ($('#policyAgreeYn').prop('checked')==false) {
                var btnSave = $("#btnSave").data("kendoButton");
                btnSave.enable(false);
            }else{
                var btnSave = $("#btnSave").data("kendoButton");
                btnSave.enable(true);
            }
        });

        var options = parent.popupWindow.options.content.data;

        //console.log("options1 : ",options);

        $("#dlrCd").val(options.dlrCd);
        $("#custNo").val(options.custNo);
        $("#custNm").val(options.custNm);
        $("#custTp").data("kendoExtDropDownList").value(options.custTp);
        $("#hpNo").val(options.hpNo);
        $("#mathDocTp").data("kendoExtDropDownList").value(options.mathDocTp);
        $("#ssnCrnNo").val(options.ssnCrnNo);
        $("#vin").val(options.vinNo);
        $("#modelNm").val(options.modelNm);
        $("#modelCd").val(options.modelCd);


        function joinBlueMembership(params,url){

            //console.log("url:",url);
            //console.log("params:",JSON.stringify(params));

            $.ajax({
                url:url,
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    //정상적으로 반영 되었습니다.
                    //dms.notification.success("<spring:message code='global.info.success'/>");

                    //console.log("jqXHR : ",jqXHR)
                    //console.log("textStatus : ",textStatus)
                    var result = jqXHR.result;
                    var failMsg = jqXHR.failMsg;

                    if ( result === "SUCCESS" ) {
                        options.callbackFunc(result);
                    } else {
                        //{블루멤버십 가입} 에 실패하였습니다.
                        //dms.notification.error("<spring:message code='crm.menu.blueMembership' var='msg' /><spring:message code='global.info.failedMsg' arguments='${msg}' />");
                        dms.notification.error(failMsg);
                    }

                    //parent.popupWindow.close();
                    //console.log(textStatus);
                    //parent.$('#blueMemUsrGrid').data('kendoExtGrid').dataSource.page(1);
                    //parent.popupWindow.close();
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            });
        }

        // 딜러 One Click 회원가입 버튼.
        $("#btnSave").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#mathDocTp").data("kendoExtDropDownList").value())){
                    //증거유형을(를) 입력하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.mathDocTp' var='msg' /><spring:message code='global.info.validation.required' arguments='${msg}' />");
                    return;
                }
                if(dms.string.isEmpty($("#ssnCrnNo").val())){
                    //증거번호을(를) 입력하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.ssnCrnNo' var='msg' /><spring:message code='global.info.validation.required' arguments='${msg}' />");
                    return;
                }

                if(dms.string.isEmpty($("#agree").data("kendoExtDropDownList").value())){
                    //지불여부을 입력하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.agree' var='msg' /><spring:message code='global.info.validation.required' arguments='${msg}' />");
                    return;
                }
                if($("#agree").data("kendoExtDropDownList").value() == "Y" && $("#amount").data("kendoExtDropDownList").value() == ""){
                    //지불금액을 입력하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.amount' var='msg' /><spring:message code='global.info.validation.required' arguments='${msg}' />");
                    return;
                }

                if(dms.string.isEmpty($("#vin").val())){
                    //Vin번호을 입력하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.vinNo' var='msg' /><spring:message code='global.info.validation.required' arguments='${msg}' />");
                    return;
                }

                /*
                if(dms.string.isEmpty($("#modelNm").val())){
                    //모델명을 입력하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.modelNm' var='msg' /><spring:message code='global.info.validation.required' arguments='${msg}' />");
                    return;
                }
                 */

                var params = {};
                params["custNo"] = $("#custNo").val(); //고객번호
                params["custNm"] = $("#custNm").val(); //고객번호
                params["custTp"] = $("#custTp").data("kendoExtDropDownList").value(); //고객유형
                params["hpNo"] = $("#hpNo").val();//핸드폰 번호
                params["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();//증거유형
                params["ssnCrnNo"] = $("#ssnCrnNo").val(); //증거번호
                params["agree"] = $("#agree").data("kendoExtDropDownList").value(); //지불여부
                params["amount"] = $("#amount").data("kendoExtDropDownList").value(); //지불금액
                params["vin"] = $("#vin").val(); //VIN번호
                params["modelCd"] = $("#modelCd").val(); //모델CD
                //params["modelNm"] = $("#modelNm").val(); //모델명
                //params["blueMembershipNo"] = $("#blueMembershipNo").val();
                //params["joinApproveYn"] = "N"; //가입요청동의여부
                /* if ($("#joinReqAgreeYn").prop("checked")) {
                    params["joinReqAgreeYn"] = "Y";
                }else {
                    //가입신청 동의함을(를) 체크하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.blueMemJoinAgree' var='arguMsg' /><spring:message code='global.info.validation.check' arguments='${arguMsg}'/>");
                    return;
                } */

                if ($("#policyAgreeYn").prop("checked")) {
                    params["policyAgreeYn"] = "Y";
                }else {
                    //회원정책 동의함을(를) 체크하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.blueMemUsrPolicyAgree' var='arguMsg' /><spring:message code='global.info.validation.check' arguments='${arguMsg}'/>");
                    return;
                }


                // BM 가입 확인.
                var paramData = {};
                paramData["custNo"] = $("#custNo").val();
                $.ajax({
                    url:"<c:url value='/crm/dmm/blueMembershipJoin/selectMemberUserintegralInfo.do' />",
                    data:JSON.stringify(paramData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result) {
                        //console.log("가입확인 : ",result);
                         if(result.IsSuccess){
                             // 이미 가입 되어있습니다.
                             dms.notification.info("<spring:message code='crm.info.alreadyBMJoin' />");
                         }else{
                             var url = "<c:url value='/crm/dmm/blueMembershipJoin/insertCreateMembership.do' />";
                             joinBlueMembership(params,url);

                         };
                    }//end success
                })//end ajax



            }
        });

    }); //end ready

 </script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <section class="group">
                <div class="header_area">
                <h1 class="title_basic">crm.menu.membershipReg</h1><!-- 멤버십 등록(고객) -->
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnMove2">고객등록 이동<%-- <spring:message code="global.btn.search" /> --%></button>  <!-- 고객등록 이동 -->
                        <button type="button" class="btn_m btn_save" id="btnMembershipSave">멤버십 신청<%-- <spring:message code="global.btn.search" /> --%></button>  <!-- 멤버십 신청 -->
                    </div>
                </div>
				<form id="membershipForm" name="membershipForm" onsubmit="return false;">
                <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:24%;">
                                <col style="width:10%;">
                                <col style="width:23%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required">고객명</span></th><!-- 고객명 -->
                                    <td class="required_area">
                                        <div id="custSearch" class="form_search">
                                            <input id="custNm" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" /><!-- // 고객조회 -->
                                            <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                            <input type="hidden" id="custNo" name="custNo" >
                                            <!-- <input type="text" id="sCustNm" name="sCustNm" class="form_input" style="width:60%"  readonly /> -->
                                        </div>
                                    </td>
                                    <th scope="row"><%-- <spring:message code="" /> --%>담당영업자</th>
                                    <td>
                                        <input id="mngScId" name="mngScId" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                    </td>
                                    <th scope="row"><%-- <spring:message code="" /> --%>잠재/보유고객</th>
                                    <td>
                                        <!-- <input id="custCd" name="custCd" value="" readonly="readonly" class="form_input form_readonly" style="width:100%"> -->
                                        <input id="custCd" name="custCd" class="form_select form_readonly" style="width:100%" readOnly/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><%-- <spring:message code="" /> --%>고객유형</th>
                                    <td>
                                        <!-- <input id="custTp" name="custTp" value="" readonly="readonly" class="form_input form_readonly" style="width:100%"> -->
                                        <input id="custTp" name="custTp" class="form_select form_readonly" style="width:100%" readOnly/>
                                    </td>
                                    <th scope="row"><%-- <spring:message code="" /> --%>이메일</th>
                                    <td colspan="3">

                                        <div class="form_float">
                                            <div class="form_left">
                                                <input id="emailNm" name="emailNm" value="" readonly="readonly" class="form_input form_readonly">
                                            </div>
                                            <div class="form_right">
                                                <input id="emailDomainNm" name="emailDomainNm" value="" readonly="readonly" class="form_input form_readonly">
                                            </div>
                                        </div>
                                        <input type="hidden" id="emailDomainCd" name="emailDomainCd" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><%-- <spring:message code="" /> --%>휴대전화</th>
                                    <td>
                                        <input id="hpNo" name="hpNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                    </td>
                                    <th scope="row"><%-- <spring:message code="" /> --%>주소</th>
                                    <td colspan="3">
                                        <div class="form_float">
                                            <div class="form_left">
                                                <input id="addr1" name="addr1" value="" readonly="readonly" class="form_input form_readonly">
                                            </div>
                                            <div class="form_right">
                                                <input id="addr2" name="addr2" value="" readonly="readonly" class="form_input form_readonly">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><%-- <spring:message code="" /> --%>집전화</th>
                                    <td>
                                        <input id="telNo" name="telNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                    </td>
                                    <th scope="row"><%-- <spring:message code="" /> --%>선호연락방법</th>
                                    <td>
                                        <!-- <input id="prefCommMthCd" name="prefCommMthCd" value="" readonly="readonly" class="form_input form_readonly" style="width:49%">
                                        <input id="prefCommNo" name="prefCommNo" value="" readonly="readonly" class="form_input form_readonly" style="width:50%"> -->
                                        <div class="form_float">
                                            <div class="form_left">
                                                <input id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox form_readonly" readOnly />
                                            </div>
                                            <div class="form_right">
                                                <input id="prefCommNo" name="prefCommNo" value="" readonly="readonly" class="form_input form_readonly" />
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"></th>
                                    <td></td>
                                </tr>
                                <c:if test="${membershipStan eq '01'}">
                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!-- 신분증유형 --></th>
                                        <td>
                                            <!-- <input id="mathDocTp" name="mathDocTp" value="" readonly="readonly" class="form_input form_readonly" style="width:100%"> -->
                                            <input id="mathDocTp" name="mathDocTp" class="form_select form_readonly" style="width:100%" readOnly />
                                        </td>
                                        <th scope="row"><%-- <spring:message code="" /> --%>신분증번호</th>
                                        <td>
                                            <!-- <input id="idCardNo" name="idCardNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%"> -->
                                            <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="numberandalpha" style="width:100%" />
                                            <span id="drivingNoSpan" style="display:none;">
                                            <input id="drivingNo" name="drivingNo" type="text" value="" class="numberandalpha" style="width:100%" />
                                            </span>
                                            <span id="officeNoSpan" style="display:none;">
                                            <input id="officeNo" name="officeNo" type="text" value="" class="numberandalpha" style="width:100%" />
                                            </span>
                                            <span id="passportNoSpan" style="display:none;">
                                            <input id="passportNo"  name="passportNo" type="text" value="" class="numberandalpha" style="width:100%" />
                                            </span>
                                            <span id="otherNoSpan" style="display:none;">
                                            <input id="otherNo"  name="otherNo" type="text" value="" class="numberandalpha" style="width:100%" />
                                            </span>
                                        </td>
                                        <th scope="row"></th>
                                        <td></td>
                                    </tr>
                                </c:if>
                                <c:if test="${membershipStan eq '02'}">
                                    <tr>
                                        <th scope="row"><span class="bu_required"><%-- <spring:message code="" /> --%>VIN <!-- 차대번호 --></span></th>
                                        <td class="required_area">
                                            <select style="width:100%" id="vinNo">
                                                <option></option>
                                                <option value="KOL-123-1234">KOL-123-1234</option>
                                                <option value="KOL-231-4638">KOL-231-4638</option>
                                                <option value="KOL-751-9364">KOL-751-9364</option>
                                                <option value="KOL-991-2677">KOL-991-2677</option>
                                            </select>
                                        </td>
                                        <th scope="row"><%-- <spring:message code="" /> --%>차종명</th>
                                        <td>
                                            <select style="width:100%" id="">
                                                <option></option>
                                                <option>아반떼</option>
                                                <option>아이오닉</option>
                                                <option>소나타</option>
                                                <option>그랜저</option>
                                                <option>제네시스</option>
                                            </select>
                                        </td>
                                        <th scope="row"><%-- <spring:message code="" /> --%>차량번호 <!-- 차량번호--></th>
                                        <td>
                                            <input id="carNo" name="carNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><%-- <spring:message code="" /> --%>모델명</th>
                                        <td>
                                            <select style="width:100%">
                                                <option></option>
                                                <option>1.6 GDI AT</option>
                                                <option>1.6 GDI MT</option>
                                                <option>2.0 GDI AT</option>
                                                <option>2.0 GDI MT</option>
                                            </select>
                                        </td>
                                    </tr>
                                </c:if>

                            </tbody>
                        </table>
                </div>

                <div class="header_area">
                    <h2 class="title_basic">추가정보</h2><!-- 추가정보 -->
                </div>
                <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:24%;">
                                <col style="width:10%;">
                                <col style="width:23%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><%-- <spring:message code="" /> --%>회원등급</th>
                                    <td>

                                        <!-- <input id="delYn" name="delYn" type="hidden" value="N"> -->
                                        <div class="form_float">
                                            <div class="form_left">

                                        <input id="gradeCd" name="gradeCd" value="" readonly="readonly" class="form_input form_readonly" >
                                            </div>
                                            <div class="form_right">
                                                <select style="width:100%" id="rechargeCd">
                                                    <option></option>
                                                    <option value="01">Silver</option>
                                                    <option value="02">Gold</option>
                                                    <option value="03">VIP</option>
                                                    <option value="04">VVIP</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"></th>
                                    <td></td>
                                    <th scope="row"></th>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic">맴버십 프로그램</h2><!-- 맴버십 프로그램 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><%-- <spring:message code="" /> --%>충전식</th>
                                <td  class="required_area">
                                    <input type="checkbox" id="rechargeYn" name="rechargeYn" value="" > <label for="rechargeYn"> 가입합니다.</label>
                                </td>
                                <th scope="row"><%-- <spring:message code="" /> --%>상품선택</th>
                                <td>
                                    <select id="rechargeCd">
                                        <option></option>
                                        <option value="01">10,000원 충전권</option>
                                        <option value="02">30,000원 충전권</option>
                                        <option value="03">50,000원 충전권</option>
                                        <option value="04">100,000원 충전권</option>
                                        <option value="05">1,000,000원 충전권</option>
                                    </select>
                                </td>
                                <th scope="row"><span class="bu_required"><%-- <spring:message code="" /> --%>포인트</th>
                                <td class="required_area">
                                    <input type="checkbox" id="pointYn" name="pointYn" value="" > <label for="pointYn">가입합니다.</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				</form>


                <div class="header_area">
                    <h2 class="title_basic">가입신청서</h2><!-- 가입신청서 -->
                </div>
                <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><%-- <spring:message code="" /> --%>가입신청서 &nbsp;&nbsp;<img src="<c:url value='/resources/img/ico_print.png'/>" id="print" alt="가입신청서 양식 프린트" title="가입신청서 양식 프린트" style="float:right;width:8%;cursor:pointer;" /></th>
                                    <td>
										<form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/dmm/membership/insertMembershipUpload.do"/>">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:70%;">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="file" id="uploadFile" name="uploadFile" />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
										</form>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     * 데이터 셋업 영역
     *************************************************************/
    var popupWindow;
    var loginDlrCd              = "${dlrCd}";

    //고객유형 설정
    var custTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.itemCd}" , "cmmCdNm":"${obj.itemNm}"});
    </c:forEach>

    //잠재/보유 고객 설정
    var custCdList              = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.itemCd}" , "cmmCdNm":"${obj.itemNm}"});
    </c:forEach>

    //선호연락방법설정
    var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":""}];
    var prefCommMthCdMap        = [];
    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //신분증 유형(주요인증문서유형) 설정
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpMap            = [];
    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //차대번호 설정
    var vinNoList           = [{"cmmCd":"", "cmmCdNm":""}
                               ,{"cmmCd":"KOL-123-1234", "cmmCdNm":"KOL-123-1234"}
                               ,{"cmmCd":"KOL-123-1234", "cmmCdNm":"KOL-123-1234"}
                               ,{"cmmCd":"KOL-123-1234", "cmmCdNm":"KOL-123-1234"}
                               ,{"cmmCd":"KOL-123-1234", "cmmCdNm":"KOL-123-1234"}];
    var vinNoMap            = [];
    /* <c:forEach var="obj" items="${mathDocTpList}">
    vinNoList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    vinNoMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach> */

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

    ////버튼 - 고객등록이동
    $("#btnMove").kendoButton({
        click:function(e){
            location.href = "<c:url value='crm/cif/customerInfo/selectCustomerInfoMain.do'/>";
        }
    });


    //버튼 - 멤버십 신청
    $("#btnMembershipSave").kendoButton({
        click:function(e) {
            if($("#custNo").val() == ""){
                //고객명(을)를 선택해 주시기 바랍니다.
                dms.notification.info("<spring:message code='global.lbl.custNm' var='custNm' /><spring:message code='global.info.check.field' arguments='${custNm}' />");
                $("#custNm").focus();
                return;
            }

            if(!$('#rechargeYn').is(":checked") && !$('#pointYn').is(":checked")){
                dms.notification.success("충전식 또는 포인트식을 선택해 주시기 바랍니다.");
                $('#rechargeYn').focus();
                return ;
            }

            if($('#pointYn').is(":checked")){
                $('#pointYn').val("Y");
            }else{
                $('#pointYn').val("N");
            }

            if($('#rechargeYn').is(":checked")){
                $('#rechargeYn').val("Y");
            }else{
                $('#rechargeYn').val("N");
            }

            obj = {};
            obj["custNo"] = $("#custNo").val();
            <c:if test="${membershipStan eq '02'}">
            /* var surveyName = $("#vinNo").data("kendoExtDropDownList").text();
            $("#surveyName").append(surveyName); */
            obj["carId"] = $("#carId").val();
            obj["vinNo"] = $("#vinNo").val();
            </c:if>
            obj["gradeCd"] = $("#custGradeCd").val();
            obj["fileDocNo"] = $("#fileDocNo").val();
            obj["pointYn"] = $("#pointYn").val();
            obj["rechargeYn"] = $("#rechargeYn").val();
            obj["rechargeCd"] = $("#rechargeCd").val();


/*             var json = $("#membershipForm").serializeObject();

            var params = [];



            var idx = 0;

            $.each(json, function(key, value){
                obj = {};

                if(key == "custNo"){
                    obj["custNo"] = value;
                }
                if(key == "carId"){
                    obj["carId"] = value;
                }
                if(key == "vinNo"){
                    obj["vinNo"] = value;
                }
                if(key == "gradeCd"){
                    obj["gradeCd"] = value;
                }
                if(key == "fileDocNo"){
                    obj["fileDocNo"] = value;
                }
                if(key == "pointYn"){
                    obj["pointYn"] = value;
                }
                if(key == "rechargeYn"){
                    obj["rechargeYn"] = value;
                }
                if(key == "rechargeCd"){
                    obj["rechargeCd"] = value;
                }

                params.push(obj);

                idx++;
            }); */



            $.ajax({
                url:"<c:url value='/crm/dmm/membership/insertMembership.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(obj)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    /* $("#mcdGrid").data("kendoExtGrid").dataSource.read();
                    mode = "N";
                    resetDefualtForm(); */
                }
            });

        }
    });

    /*************************************************************
     * 고객검색팝업
     *************************************************************/
    $("#custSearch").click(function(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
console.log(data);
                        if(data.length >= 1) {
                            //[TODO] 고객 팝업에서 조회를 했을때 차대번호 및 차량 소유목록을 ajax에서 가지고 와서 setting해야함
                            //  /sal/veh/vehicleMaster/selectVehicleMaster.do 에서 호출할것


                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#mngScId").val(data[0].mngScId);//담당영업자
                            $("#custCd").data("kendoExtDropDownList").value(data[0].custCd)//잠재/보유고객
                            //$("#custCd").val(data[0].custCd);
                            $("#custTp").data("kendoExtDropDownList").value(data[0].custTp)//고객유형
                            //$("#custTp").val(data[0].custTp);
                            $("#addr1").val(data[0].addr1);//주소1
                            $("#addr2").val(data[0].addr2);//주소2
                            $("#telNo").val(data[0].telNo);//집전화
                            $("#prefCommMthCd").data("kendoExtDropDownList").value(data[0].custTp)//선호연락방법
                            //$("#prefCommMthCd").val(data[0].prefCommMthCd);
                            $("#prefCommNo").val(data[0].prefCommNo);//선호연락방법

                            $("#hpNo").val(data[0].hpNo);//핸드폰번호
                            $("#emailNm").val(data[0].emailNm);//이메일명
                            $("#emailDomainCd").val(data[0].emailDomainCd);//이메일도메인코드
                            $("#emailDomainNm").val(data[0].emailDomainNm);//이메일도메인명
                            <c:if test="${membershipStan eq '01'}">
                                $("#mathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp)//신분증 유형(주요인증문서유형)

                                $("#ssnCrnNo").val(data[0].ssnCrnNo);//주민사업자등록번호
                                $("#idCardNo").val(data[0].idCardNo);//ID 카드번호
                                $("#drivingNo").val(data[0].drivingNo);//운전면허증번호
                                $("#officdNo").val(data[0].officdNo);//관증번호
                                $("#passportNo").val(data[0].passportNo);//여권번호
                                $("#otherNo").val(data[0].otherNo);//기타번호
                            </c:if>
                            <c:if test="${membershipStan eq '02'}">
                                //[TODO] 고객 팝업에서 조회를 했을때 차대번호 및 차량 소유목록을 ajax에서 가지고 와서 setting해야함
                                //  /sal/veh/vehicleMaster/selectVehicleMaster.do 에서 호출할것
                            </c:if>
                            $("#custGradeCd").val(data[0].custGradeCd);//고객등급코드
                            //가입신청서

                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    });

    /* $("#print").kendoButton({
        click:function(e){
            alert("print준비중...1");
        }
    }); */

    $("#print").click(function(){
        alert("print준비중...2");
    });



    /*************************************************************
    *드랍다운 리스트 셋팅
    *************************************************************/

    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:custTpList
            , index:0
        });
        //$("#custTp").data("kendoExtDropDownList").value("01");

     // 잠재/보유고객      custCd              (CRM023)
        $("#custCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:custCdList
            , index:0
            , change:function(){

                if (this.value() =="01"){
                    /* $("#addr1").parent().removeClass('required_area');
                    $("#addr2").parent().removeClass('required_area'); */
                }else{
                    /* $("#addr1").parent().addClass('required_area');
                    $("#addr2").parent().addClass('required_area'); */
                }
            }
            //,  value:"01"
        });
        //$("#custCd").data("kendoExtDropDownList").value("01");


     // 선호연락방법       prefCommMthCd (CRM022)
         $("#prefCommMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:prefCommMthCdList
            , index:0
            , click:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#prefCommNo").val($("#hpNo"));
                } else {
                    $("#prefCommNo").val("");
                }
            }
        });

     // 신분증유형            mathDocTp       (CRM024)
         $("#mathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:mathDocTpList
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#ssnCrnNo").show();
                    $("#drivingNoSpan").hide();
                    $("#officeNoSpan").hide();
                    $("#passportNoSpan").hide();
                    $("#otherNoSpan").hide();
                }else if (selcmmCd == "02"){
                    $("#ssnCrnNo").hide();
                    $("#drivingNoSpan").show();
                    $("#officeNoSpan").hide();
                    $("#passportNoSpan").hide();
                    $("#otherNoSpan").hide();
                }else if (selcmmCd == "03"){
                    $("#ssnCrnNo").hide();
                    $("#drivingNoSpan").hide();
                    $("#officeNoSpan").show();
                    $("#passportNoSpan").hide();
                    $("#otherNoSpan").hide();
                }else if (selcmmCd == "04"){
                    $("#ssnCrnNo").hide();
                    $("#drivingNoSpan").hide();
                    $("#officeNoSpan").hide();
                    $("#passportNoSpan").show();
                    $("#otherNoSpan").hide();
                }else{
                    $("#ssnCrnNo").hide();
                    $("#drivingNoSpan").hide();
                    $("#officeNoSpan").hide();
                    $("#passportNoSpan").hide();
                    $("#otherNoSpan").show();
                }
            }
         , bind:function(){
             $("#drivingNo").hide();
             $("#officeNo").hide();
             $("#passportNo").hide();
             $("#otherNo").hide();
         }
        });

});



/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/crm/cso/testDriveMgmt/listJsp/selectTestDriveMgmtList.jsp"></c:import>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h1><spring:message code="crm.lbl.salesActiveSearch" /><!-- 영업활동 조회조건 --></h1>
        </div>
       <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 客户--></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sCust" placeholder="<spring:message code='crm.lbl.custNmHpNo' />">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.prsNm" /><!-- 담당자 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sScId"  style="width:100%">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.testDriveModel" /><!-- 시승 차관 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sModelCd" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sStatus" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sVin" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.tdrvDt" /><!-- 시승일 --></th>
                            <td class="f_term">
                                <div class="f_item01" style = "width:82%">
                                    <input type="date" id="sStartDt" name="sStartDt" value="" style="background-color:#ffffff;" data-json-obj="true"  />
                                    <%-- <input type="search" id="sStartDt" name="sStartDt" value="" data-json-obj="true"  />
                                    <span class="date" onclick="calpicker('sStartDt')"><spring:message code='global.lbl.date' /></span> --%>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01" style = "width:82%">
                                    <input type="date" id="sEndDt" name="sEndDt" value="" style="background-color:#ffffff;" data-json-obj="true"  />
                                    <%-- <input type="search" id="sEndDt" name="sEndDt" value="" data-json-obj="true"  />
                                    <span class="date" onclick="calpicker('sEndDt')"><spring:message code='global.lbl.date' /></span> --%>
                                </div>
                                <input type="hidden" id="" />
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12726" hasPermission="${dms:getPermissionMask('READ')}">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <!-- 시승상세정보 -->
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h1><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></h1>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption>시승 상세정보</caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody id="salesActiveMgmtForm">
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="custNm" name="custNm" data-json-obj="true" class="" placeholder="" disabled />
                                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                            <input type="hidden" id="tdrvStatCd" name="tdrvStatCd" data-json-obj="true" />

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic"  id="hpNo" name="hpNo"  data-json-obj="true" required maxlength="14" class="" placeholder="" disabled/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='ser.lbl.carNo' /><!-- 차량번호  --></th>
                                    <td>
                                         <div class="f_item01 f_disabled">
                                            <input type="text"  id="carRegId" name="carRegId"  data-json-obj="true" required maxlength="14" class="" placeholder="" disabled/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='global.lbl.tdrvDt' /><!-- 시승예약일자/시승일시  --></th>
                                    <td>
                                         <div class="f_item01 f_disabled">
                                            <input type="text" id="resvDt" name="resvDt" value="" style="background-color:#ffffff;" required  data-json-obj="true" disabled />
                                            <%-- <span class="date" onclick="calpicker('resvDt')"><spring:message code='global.lbl.tdrvDt'  /></span> --%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='crm.lbl.tdrvHmCd' /><!-- 시승시간  --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="tdrvHmCd" name="tdrvHmCd" class="form_comboBox" data-json-obj="true"  disabled/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 담당SC --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="scNm" name="scNm" data-json-obj="true"  placeholder="" disabled/>
                                            <input type="hidden" id="scId" name="scId" data-json-obj="true" required />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.memo' /><!-- 메모 --></th>
                                    <td>
                                        <textarea rows="3" cols="" id="remark" name="remark" class="f_textarea f_disabled" data-json-obj="true" maxlength="4000" disabled="disabled" readonly></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='global.lbl.regDt' /><!-- 등록일   --></th>
                                    <td>
                                         <div class="f_text f_disabled">
                                            <input type="text" id="regDt" name="regDt" class="form_input" disabled />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 시승일지 -->
             <div class="co_group">
                <div class="content_title">
                    <h1><spring:message code='global.title.tdrvLog' /><!-- 시승일지    --></h1>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption>시승 상세정보</caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody id="tdrvMgmtInputForm">
                                 <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.custStsfCd' /><!-- 고객만족도 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="hidden" id="tdrvSeq" name="tdrvSeq"  data-json-obj="true" />
                                        <input type="hidden" id="tdrvVinNo" name="tdrvVinNo"  data-json-obj="true" />
                                        <input type="hidden" id="tdrvContractDocNo" name="tdrvContractDocNo" data-json-obj="true" >
                                        <input id="custStsfCd" name="custStsfCd" class="form_comboBox"  data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.saleFcstCd' /><!-- 판매전망 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="saleFcstCd" name="saleFcstCd" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.befRunDistVal' /><!-- 이전 주행거리 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="number" id="befRunDistVal" name="befRunDistVal" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.aftRunDistVal' /><!-- 이후 주행거리 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="number" id="aftRunDistVal" name="aftRunDistVal" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.befRfuelQty' /><!-- 이전 주유량 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="number" id="befRfuelQty" name="befRfuelQty" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.aftRfuelQty' /><!-- 이후 주유량 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="number" id="aftRfuelQty" name="aftRfuelQty" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.intPblmYn" /><!-- 내장 이상유무 --></th>
                                    <td>
                                        <input type="radio" id="intPblmYn_Y" name="intPblmYn" class="f_radio" value="Y" /><label for="intPblmYn_Y"><spring:message code="crm.lbl.problemY" /></label><!-- 있음 -->
                                        <input type="radio" id="intPblmYn_N" name="intPblmYn" class="f_radio" value="N" checked /><label for="intPblmYn_N"><spring:message code="crm.lbl.problemN" /></label><!-- 없음 -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.extPblmYn" /><!-- 외장 이상유무 --></th>
                                    <td>
                                        <input type="radio" id="extPblmYn_Y" name="extPblmYn" class="f_radio" value="Y" data-json-obj="true"  ><label for="extPblmYn_Y"> <spring:message code="crm.lbl.problemY" /></label><!-- 있음 -->
                                        <input type="radio" id="extPblmYn_N" name="extPblmYn" class="f_radio" value="N" data-json-obj="true"  checked > <label for="extPblmYn_N"><spring:message code="crm.lbl.problemN" /></label><!-- 없음 -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.memo' /><!-- 메모 --></th>
                                    <td>
                                        <textarea rows="3" cols="" id="remark2" name="remark" data-json-obj="true" class="f_textarea" maxlength="1000"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="con_btnarea">
                            <dms:access viewId="VIEW-D-12725" hasPermission="${dms:getPermissionMask('READ')}">
                            <span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /></span>
                            </dms:access>
                        </div>
                    </div>
                </div>
                <div class="con_btnarea">
                <dms:access viewId="VIEW-D-13130" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
                </dms:access>
                </div>
            </div>
        </section>



    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var toDt                = "${toDt}",
/* sevenDtBf           = "${sevenDtBf}"; */
sevenDtBf           = "${toDt}";

var toDate,
    gCrud;

toDate = new Date();


//SC 목록
var usersDS = [];
<c:forEach var="obj" items="${users}">
    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
</c:forEach>

// 시승모델
var carIdDs = [];
<c:forEach var="obj" items="${carIdList}">
    carIdDs.push({text:"${obj.modelNm}", value:"${obj.modelCd}"});
</c:forEach>

// 고객만족도
var custStsfCdDs = [];
var custStsfCdArr = [];
<c:forEach var="obj" items="${custStsfCdList}">
    custStsfCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    custStsfCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


// 판매전망
var saleFcstCdDs = [];
<c:forEach var="obj" items="${saleFcstCdList}">
    saleFcstCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

//
//시승상세정보 - 시승시간
var tdrvHmCdDs = [];
var tdrvHmCdArr = [];
<c:forEach var="obj" items="${tdrvHmCdList}">
   tdrvHmCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
   tdrvHmCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//시승상세정보 - 시승노선
var tdrvClineCdDs = [];
var tdrvClineCdArr = [];
<c:forEach var="obj" items="${tdrvClineCdList}">
    tdrvClineCdDs.push({text:"${obj.clineNm}", value:"${obj.clineSeq}", fileDocNo:"${obj.fileDocNo}" , fileNo:"${obj.fileNo}"});
    tdrvClineCdArr["${obj.clineSeq}"] = "${obj.clineNm}";
</c:forEach>

//시승상세정보 - 시승출처
var tdrvPathCdDs = [];
var tdrvPathCdArr = [];
<c:forEach var="obj" items="${tdrvPathCdList}">
    tdrvPathCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    tdrvPathCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//잠재,보유고객
var custCdMap = [];
<c:forEach var="obj" items="${custCdList}">
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//상태
var custStsfStatList = [];
var custStsfStatMap = [];
<c:forEach var="obj" items="${custStsfStatCdList}" >
custStsfStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custStsfStatMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {
  //현재일자
    var toDay = "${toDay}";
    var lastDay = "${lastDay}";


    // 판매고문
    $("#sScId").kendoExtDropDownList({
        dataSource:usersDS
        , dataTextField:"usrNm"
        , dataValueField:"usrId"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 시승모델
    $("#sModelCd").kendoExtDropDownList({
        dataSource:carIdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 고객만족도
    $("#custStsfCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(custStsfCdDs)
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 판매전망
    $("#saleFcstCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(saleFcstCdDs)
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 상태
    $("#sStatus").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
        , dataSource:dms.data.cmmCdFilter(custStsfStatList)
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.tdrvMgmt' />"); //시승관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sScId      = $("#sScId").data("kendoExtDropDownList").value();
            var sModelCd = $("#sModelCd").data("kendoExtDropDownList").value();
            var sStartDt      = $("#sStartDt").val();
            var sEndDt      = $("#sEndDt").val();

            if(sScId != "") $("#search1Area span[name='searchStr']").text($("#sScId").data("kendoExtDropDownList").text());
            if(sModelCd != "") $("#search2Area span[name='searchStr']").text(sModelCd);
            if(sStartDt != "") $("#search3Area span[name='searchStr']").html(sStartDt +"~<br/>"+ sEndDt);

            initList();
            listData.read();
        }
    });
});

//폼 초기화
function initForm(val){
    //시승일지
    if(val){
        $("#tdrvSeq").val("");
        $("#tdrvVinNo").val("");
        $("#tdrvContractDocNo").val("");
        $("#custStsfCd").data("kendoExtDropDownList").value("");
        $("#custStsfCd").data("kendoExtDropDownList").enable(true);
        $("#saleFcstCd").data("kendoExtDropDownList").value("");
        $("#saleFcstCd").data("kendoExtDropDownList").enable(true);

        $("#befRunDistVal").val();
        $("#befRunDistVal").prop("disable",true);
        $("#aftRunDistVal").val();
        $("#aftRunDistVal").prop("disable",true);
        $("#befRfuelQty").val();
        $("#befRfuelQty").prop("disable",true);
        $("#aftRfuelQty").val();
        $("#aftRfuelQty").prop("disable",true);
        $("input:radio").attr("disabled", false);
        $("#intPblmYn_N").prop("checked", true);
        $("#extPblmYn_N").prop("checked", true);
        $("#remark").val("").attr("disabled", false).removeClass('form_readonly');
    }
}

//버튼 - 시승일지 저장
$("#btnSave").kendoButton({
    click:function(e){
        confirmOpen(confirmMsgSave,'doSave',y,n);
    }
});

function doSave(){
    var befRunDistVal = $("#befRunDistVal").val();
    var aftRunDistVal = $("#aftRunDistVal").val();

    if ( aftRunDistVal <= befRunDistVal ) {
        // 주행거리 / 을(를) 확인하여 주세요.
        mob.notification.info("<spring:message code='global.lbl.runDist' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
        return;
    }

    if($("#custStsfCd").val() == ""){

        mob.notification.info("<spring:message code='crm.lbl.custStsfCd' var='arguMsg' /><spring:message code='global.info.required.field' arguments='${arguMsg}'/>");
        return;
    }

    if($("#saleFcstCd").val() == ""){

        mob.notification.info("<spring:message code='crm.lbl.saleFcstCd' var='arguMsg' /><spring:message code='global.info.required.field' arguments='${arguMsg}'/>");
        return;
    }

    var saveData = $("#tdrvMgmtInputForm").serializeObject(
            $("#tdrvMgmtInputForm").serializeArrayInSelector("[data-json-obj='true']")
            );

    //내/외장 이상유무
    if($("input:radio[name='intPblmYn']:checked").attr("id") == "intPblmYn_Y"){
        saveData.intPblmYn = "Y";
    }else {
        saveData.intPblmYn = "N";
    }
    if($("input:radio[name='extPblmYn']:checked").attr("id") == "extPblmYn_Y"){
        saveData.extPblmYn = "Y";
    }else{
        saveData.extPblmYn = "N";
    }

    var id = ""
    $("span[name='tdrvTpCd']").each(function(){
        if($(this).hasClass("on")){
            id = this.id;
        }
    });
    var tdrvTpCdVal = id.replace("tdrvTpCd_","");
    saveData.tdrvTpCd = tdrvTpCdVal;

    mob.loading.show();
    $.ajax({
        url:"<c:url value='/crm/cso/testDrive/updateTestDriveMgmt.do' />",
        data:JSON.stringify(saveData),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        },

        success:function(result) {
            mob.loading.hide();
            if (result === 1) {
                // 저장 / 이 완료 되었습니다.
                mob.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
            } else {
                options.callbackFunc("FAIL");
            }
        },error:function(result){
            mob.loading.hide();
            mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
    });

    contentListNonRefresh();
}

</script>
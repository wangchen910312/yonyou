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
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="crm.lbl.testDriveList" /><!-- 시승 목록 --></h2>
            </div>

            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="crm.lbl.carId" /><!-- 시승모델 --></span></th>
                                <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.prsnSC" /><!-- 담당SC --></span></th>
                                <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.tdrvDt" /><!-- 시승일 --></span></th>
                                <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                <div class="listhead dlistitem">
                    <span style="width:30%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
                    <span style="width:35%"><spring:message code="global.lbl.hpNo" /><!-- 휴대폰번호 --></span>
                    <span style="width:35%"><spring:message code="crm.lbl.custCd" /><!-- 잠재/보유 --></span>
                    <span class="clboth" style="width:65%"><spring:message code="global.lbl.tdrvResvDt" /><!-- 시승예약일시 --></span>
                    <span class="" style="width:35%"><spring:message code="crm.lbl.tdrvHmCd" /><!-- 시승시간 --></span>
                    <span class="clboth" style="width:30%"><spring:message code="crm.lbl.custStsfCd" /><!-- 고객만족도 --></span>
                    <span style="width:65%"><spring:message code="crm.lbl.scId" /><!-- 담당SC --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
            </div>
        </section>


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
                            <th scope="row"><spring:message code="crm.lbl.carId" /><!-- 시승모델 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sModelCd" >
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 담당 SC --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sScId"  style="width:100%">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.tdrvDt" /><!-- 시승일 --></th>
                            <td class="f_term">
                                <div class="f_item01 f_disabled">
                                    <input type="text" id="sStartDt" name="sStartDt" value="${sevenDtBf}" data-json-obj="true" readOnly />
                                    <span class="date" onclick="calpicker('sStartDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01 f_disabled">
                                    <input type="text" id="sEndDt" name="sEndDt" value="${toDt}" data-json-obj="true" disabled />
                                    <span class="date" onclick="calpicker('sEndDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <input type="hidden" id="" />
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
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
                                    <th scope="row"><spring:message code='crm.lbl.carId' /><!-- 시승모델 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="modelNm" name="modelNm" data-json-obj="true" placeholder="" disabled />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="custNm" name="custNm" data-json-obj="true" class="" placeholder="" disabled />
                                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                            <input type="hidden" id="tdrvStatCd" name="tdrvStatCd" data-json-obj="true" />

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text"  id="hpNo" name="hpNo"  data-json-obj="true" required maxlength="14" class="" placeholder="" disabled/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='global.lbl.tdrvDt' /><!-- 시승예약일자/시승일시  --></th>
                                    <td>
                                         <div class="f_item01">
                                            <input type="text" id="resvDt" name="resvDt" value="" required  data-json-obj="true" disabled />
                                            <%-- <span class="date" onclick="calpicker('resvDt')"><spring:message code='global.lbl.tdrvDt'  /></span> --%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='crm.lbl.tdrvHmCd' /><!-- 시승시간  --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="tdrvHmCd" name="tdrvHmCd" class="form_comboBox" data-json-obj="true"  disabled/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='crm.lbl.tdrvClineCd' /><!-- 시승노선  --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text"  id="tdrvClineCd" name="tdrvClineCd"  class="form_comboBox" data-json-obj="true" placeholder="" disabled />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.tdrvPathCd' /><!-- 시승출처 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="tdrvPathCd" name="tdrvPathCd" class="form_comboBox" data-json-obj="true"  placeholder="" disabled />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.prsnSC' /><!-- 담당SC --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="scNm" name="scNm" data-json-obj="true"  placeholder="" disabled/>
                                            <input type="hidden" id="scId" name="scId" data-json-obj="true" required />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.tdrvTpCd' /><!-- 시승타입 --></th>
                                    <td>
                                        <ul class="tridetype">
                                        <c:forEach var="obj" items="${tdrvTpCdList}" varStatus="status" >
                                            <li><span id="tdrvTpCd_<c:out value='${obj.cmmCd}' />" name="tdrvTpCd" data-json-obj="true"><c:out value='${obj.cmmCdNm}' /></span></li>
                                        </c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.memo' /><!-- 메모 --></th>
                                    <td>
                                        <textarea rows="3" cols="" id="remark" name="remark" class="f_textarea" data-json-obj="true" maxlength="4000" disabled></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" ><spring:message code='global.lbl.regDt' /><!-- 등록일   --></th>
                                    <td>
                                         <div class="f_text">
                                            <input type="text" id="regDt" name="regDt" class="form_input" disabled />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <%-- <div class="con_btnarea btncount2">
                            <div>
                                <span class="btnd1t2"><spring:message code='global.lbl.resvCancel' /><!-- 예약취소 --></span>
                            </div>
                            <div>
                                <span class="btnd1" id="btnRvLog"><spring:message code='global.title.tdrvLog' /><!-- 시승일지 --></span>
                            </div>
                        </div> --%>
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
                                    <th scope="row"><spring:message code='crm.lbl.custStsfCd' /><!-- 고객만족도 --></th>
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
                                    <th scope="row"><spring:message code='crm.lbl.saleFcstCd' /><!-- 판매전망 --></th>
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
                                            <input type="text" id="befRunDistVal" name="befRunDistVal" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.aftRunDistVal' /><!-- 이후 주행거리 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="aftRunDistVal" name="aftRunDistVal" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.befRfuelQty' /><!-- 이전 주유량 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="befRfuelQty" name="befRfuelQty" data-json-obj="true"   placeholder="" >

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.aftRunDistVal' /><!-- 이후 주유량 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="aftRfuelQty" name="aftRfuelQty" data-json-obj="true"   placeholder="" >

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
                            <span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /></span>
                        </div>
                    </div>
                </div>
            </div>
        </section>



    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

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
    custStsfCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
    custStsfCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


// 판매전망
var saleFcstCdDs = [];
<c:forEach var="obj" items="${saleFcstCdList}">
    saleFcstCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
</c:forEach>

//
//시승상세정보 - 시승시간
var tdrvHmCdDs = [];
var tdrvHmCdArr = [];
<c:forEach var="obj" items="${tdrvHmCdList}">
   tdrvHmCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
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
    tdrvPathCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
    tdrvPathCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//잠재,보유고객
var custCdMap = [];
<c:forEach var="obj" items="${custCdList}">
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sScId").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sModelCd").val("");
            break;
        case "search3Area" :
            $("#sStartDt").val("");
            $("#sEndDt").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sScId      = $("#sScId").data("kendoExtDropDownList").value();
    var sModelCd = $("#sModelCd").data("kendoExtDropDownList").value();
    var sStartDt      = $("#sStartDt").val();
    var sEndDt      = $("#sEndDt").val();

    if(sScId == "" && sModelCd == "" && sStartDt == "" && sEndDt == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sScId == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sModelCd == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sStartDt == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
    setMainListHeight();
}



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
        dataSource:custStsfCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 판매전망
    $("#saleFcstCd").kendoExtDropDownList({
        dataSource:saleFcstCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    /* // 시승시간
    $("#tdrvHmCd").kendoExtDropDownList({
        dataSource:tdrvHmCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 시승노선
    $("#tdrvClineCd").kendoExtDropDownList({
        dataSource:tdrvClineCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });

    // 시승출처
    $("#tdrvPathCd").kendoExtDropDownList({
        dataSource:tdrvPathCdDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
    });
 */
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
    //$("#header_title").on("click", contentSearch);
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록조회
    $("#sStartDt").val(chgServerDate2Str(sevenDtBf));
    $("#sEndDt").val(chgServerDate2Str(toDt));
    var sStartDt = $("#sStartDt");
    var sEndDt = $("#sEndDt");
    if(sStartDt.val() != "" || sEndDt.val() != "") $("#search3Area span[name='searchStr']").html(sStartDt.val() + " ~</br> " + sEndDt.val());
    //if(sStartDt.val() != "" || sEndDt.val() != "") $("#search3Area span[name='searchStr']").text(sStartDt.val() + " ~ " + sEndDt.val());
    setSearchBox();
    $("#mainList").attr("src", "<c:url value='/mob/crm/cso/testDrive/selectTestDriveMgmtsList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sScId      = $("#sScId").data("kendoExtDropDownList").value();
            var sModelCd = $("#sModelCd").data("kendoExtDropDownList").value();
            var sStartDt      = $("#sStartDt").val();
            var sEndDt      = $("#sEndDt").val();

            if(sScId != "") $("#search1Area span[name='searchStr']").text($("#sScId").data("kendoExtDropDownList").text());
            if(sModelCd != "") $("#search2Area span[name='searchStr']").text(sModelCd);
            if(sStartDt != "") $("#search3Area span[name='searchStr']").text(sStartDt +"~"+ sEndDt);

            setSearchBox();
            contentList();
        }
    });

    //추가 버튼
    $("#btnAdd").bind("click", contentOpenNew);

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });


/*
    //시승타입 event
    $(".tridetype").find("li span").click(function(){
        var id  = this.id
        $(this).toggleClass("on");

        $(".tridetype").find("span").each(function(){
            if(id != this.id){
                $(this).removeClass("on");
            }
        });
    }); */
});

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");
  $("#header_title span").attr("class","search_open");
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침

}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

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


    }else{}


   // $("#btnSave").data("kendoButton").enable(true);
}


//상세페이지 보기
function contentDetail(dataItem) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_detail").css("display","block");

  $("#header_title span").removeAttr("class");

  var param =   {
          "sTdrvSeq":dataItem.tdrvSeq
  };
    //  var param = {"sTdrvSeq":dataItem.salesActiveNo};

      $.ajax({
          url:"<c:url value='/mob/crm/cso/testDrive/selectTestDriveResvByKey.do' />",
          data:JSON.stringify(param),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
              mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
          }

      }).done(function(body) {

          //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
          if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
              return false;
          }

          $("span[name='tdrvTpCd']").each(function(){
              $(this).removeClass("on");
          });

          //시승 상세정보
          $("#modelNm").val(body.modelNm);
          $("#modelNm").prop("disable",true);

          $("#tdrvSeq").val(body.tdrvSeq);
          $("#tdrvStatCd").val(body.tdrvStatCd);
          $("#custNm").val(body.custNm);
          $("#custNm").prop("disable",true);
          $("#custNo").val(body.custNo);
          $("#hpNo").val(body.hpNo);
          $("#hpNo").prop("disable",true);
          $("#resvDt").val(body.resvDt);
          $("#resvDt").prop("disable",true);
          $("#tdrvHmCd").val(tdrvHmCdArr[body.tdrvHmCd]);        //시승시간

          $("#tdrvVinNo").val(body.tdrvVinNo);
          $("#tdrvClineCd").val(tdrvClineCdArr[body.tdrvClineCd]);      //시승노선
          $("#tdrvPathCd").val(tdrvPathCdArr[body.tdrvPathCd]);        //시승출처
          //$("#tdrvClineCd").val(body.tdrvClineCd);
          //$("#tdrvPathCd").val(body.tdrvPathCd);
          $("#scId").val(body.scId);
          $("#scNm").val(body.scNm);
          $("#tdrvTpCd_"+body.tdrvTpCd).addClass("on");
          //$("input:radio[id='tdrvTpCd_"+body.tdrvTpCd+"']").prop("checked", true);
          $("#remark").val(body.remark);
          $("#regDt").val(body.regDt);

          //시승일지
          //입력폼 초기화
          initForm("rvlog");

          $("#tdrvSeq").val(body.tdrvSeq);
          $("#tdrvVinNo").val(body.tdrvVinNo);
          $("#tdrvContractDocNo").val(body.tdrvContractDocNo);

          $("#custStsfCd").data("kendoExtDropDownList").value(body.custStsfCd);
          $("#saleFcstCd").data("kendoExtDropDownList").value(body.saleFcstCd);

          $("#befRunDistVal").val(body.befRunDistVal);
          $("#aftRunDistVal").val(body.aftRunDistVal);
          $("#befRfuelQty").val(body.befRfuelQty);
          $("#aftRfuelQty").val(body.aftRfuelQty);

          $("input:radio[id='intPblmYn_"+body.intPblmYn+"']").prop("checked", true);
          $("input:radio[id='extPblmYn_"+body.extPblmYn+"']").prop("checked", true);

          $("#remark2").val(body.remark);

          //시승 상세정보 class변경(f_disabled 추가)
          $(".f_text>input, .f_item01>input, .f_item01>span, .form_comboBox").each(function(index, item){
              if(item.isDisabled){
                  item.parentNode.className += " f_disabled";
              }else{
                  item.parentNode.className.replace("f_disabled","");
              }
              });
      });
}


function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");

    initForm();
  }

//버튼 - 시승일지 저장
$("#btnSave").kendoButton({
    click:function(e){
        var befRunDistVal = $("#befRunDistVal").val();
        var aftRunDistVal = $("#aftRunDistVal").val();

        if ( aftRunDistVal <= befRunDistVal ) {
            // 주행거리 / 을(를) 확인하여 주세요.
            dms.notification.info("<spring:message code='global.lbl.runDist' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
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

        console.log("saveData:" + saveData);

        $.ajax({
            url:"<c:url value='/mob/crm/cso/testDrive/updateTestDriveMgmt.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                mob.notification.error(jqXHR.responseJSON.errors);
            },

            success:function(result) {

                if (result === 1) {
                    // 저장 / 이 완료 되었습니다.
                    mob.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                    // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                    /* $("#tdrvMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                    isGridReload = true;
                    tdrvMgmtSeq = tdrvSeq; */

                    contentList();

                } else {
                    // 저장 / 에 실패 하였습니다.
                    options.callbackFunc("FAIL");
                }

            }
        });


    }
});


// 고객 검색 팝업
var popupWindow  ;
$("#custSearch").click(function(){
    popupWindow = mob.window.popup({
        windowId:"customerSearchPopupMain"
        , content:{
            url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if ( dms.string.isNotEmpty(data.custNo) ) {
                        initForm();
                        $("#custNo").val(data.custNo);
                        $("#custNm").val(data.custNm);
                        $("#prefCommNo").val(data.hpNo);
                        $("#scId").val(data.mngScId);
                        $("#scNm").val(data.mngScNm);
                    }
                }
            }
        }
    })
});

</script>
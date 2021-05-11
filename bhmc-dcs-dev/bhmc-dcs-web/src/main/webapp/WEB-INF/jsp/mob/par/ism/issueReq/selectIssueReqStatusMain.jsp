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
                <h2 id="content_list_title"><spring:message code="par.title.giDocList" /><!-- 출고문서 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="par.lbl.parGiTp" /><!-- 위탁서유형 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="par.lbl.parReqDocNo" /><!-- 위탁서번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.regDt" /><!-- 등록일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search6Area">
                                <th scope="row"><span><spring:message code="global.lbl.serPrsnId" /><!-- 서비스담당자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search7Area">
                                <th scope="row"><span><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="par.lbl.giRegDt" /><!-- 출고등록일자 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.parReqDocNo" /><!-- 위탁서번호 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.giDocStatCd" /><!-- 출고문서상태 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="global.lbl.custNo" /><!-- 고객명 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.giDocSearchCondition" /><!-- 출고문서 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- 위탁서유형 --></th>
                        <td>
                            <div class="f_text"><input id="sParGiTp" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- 위탁서번호 --></th>
                        <td>
                            <div class="f_text">
                                <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일자 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sReqStartDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sReqStartDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sReqEndDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sReqEndDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sCustNm" class="form_input" maxlength="15"  style="width:100%"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sCarNo" class="form_input" style="width:100%"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.serPrsnId" /><!-- 서비스담당자ID --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sSerPrsnId" class="form_input" style="width:100%"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sGiDocNo" class="form_input" style="width:100%"/>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
        </div>

    </section>

    <!-- content_detail -->
    <div class="content_right" >
        <section id="content_itemList" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <%-- <h2><span id="lblInvcDocNo" ></span> <spring:message code="global.lbl.budgetDetlCont" /><!-- 상세내역 --></h2> --%>
                <h2><spring:message code="par.title.giConfirm" /><!-- 출고확정 --></h2>
            </div>
            <div class="listarea">
                        <div class="listhead checkitem">
                            <span style="width:50%"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.giQty" />(<spring:message code="par.lbl.unit" />)<!-- 출고수량(단위) --></span>
                            <span class="clboth" style="width:50%"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.giLoc" /><!-- 출고Location --></span>
                        </div>
                <iframe id="detailList" name="detailList" border="1" frameborder="0" width="100%" height="300px"></iframe>
                <input type="hidden" id="selParReqDocNo" value=""/>
            </div>
            <div class="btnfixed">
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnFix"><spring:message code='global.btn.fix' /></span></div>
                <div><span class="btnd1" id="partBarcodeScan" ><spring:message code="global.lbl.part" /> <spring:message code="mob.lbl.barcode" /> <spring:message code="mob.lbl.scan" /><!-- 부품 바코드 스캔 --></span></div>
            </div>
            </div>
        </section>
    </div>


    <input id="dlrCd" type="hidden" />
    <input id="selParReqDocNo" type="hidden" />
    <input id="selCustCd" type="hidden" />
    <input id="selCustNm" type="hidden" />
    <input id="selVinNo" type="hidden" />
    <input id="selCarNo" type="hidden" />
    <input id="selGiDocNo" type="hidden" />
    <input id="selRoDocNo" type="hidden" />
    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.title.giDocResultReg" /><!-- 출고문서 결과등록 --></h2>
            </div>


            <div class="formarea">
                <table  class="flist01">
                    <input id="parReqDocLineNo" type="hidden"/>
                    <input id="reqQty" type="hidden"/>
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="giDocNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giDocStatCd" /><!-- 출고문서상태 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="gidocStatCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giRegDt" /><!-- 출고등록일자--></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcReqDt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- 위탁서번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parReqDocNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- 위탁서유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parGiTp" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <input id="custCd" type="hidden"/>
                                <div class="f_text f_disabled"><input id="custNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></th>
                            <td>
                                <input id="vinNo" type="hidden"/>
                                <div class="f_text f_disabled"><input id="carNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.serPrsnId" /><!-- 서비스담당자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="serPrsnId" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.unit" /><!-- 단위 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="unitCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giQty" /><!-- 출고수량 --></th>
                            <td>
                                <div class="f_text"><input id="resvQty" type="text" class="f_text" placeholder="" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.avlbStockQty" /><!-- 가용재고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="avlbStockQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.resvQty" /><!-- 예약수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="resvStockQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code='par.lbl.giStrgeCd' /><!-- 출고창고 --></th>
                            <td>
                                <div class="f_text f_required"><input id="giStrgeCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code='global.lbl.locationCd' /><!-- Location --></th>
                            <td>
                                <div class="f_text f_required"><input id="giLocCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <%--
            <div class="con_btnarea">
                <span id="btnNextScan" class="btnd2"><spring:message code='mob.btn.nextScan' /><!-- 다음스캔 --></span>
                <span id="btnSave" class="btnd2"><spring:message code='global.btn.save' /><!-- 저장 --></span>
            </div>
             --%>

            <div class="con_btnarea btncount3">
                <div><span class="btnd1" id="btnNextScan" ><spring:message code='mob.btn.nextScan' /><!-- 다음스캔 --></span></div>
                <div><span class="btnd1" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>

        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var saveList      = [],
lCrud         = '',
paramUrl      = '',
chkRow,
header;

var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    parGiTpList = [],
    giStrgeCdList = [],
    locationListObj     = {},
    locationObj         = {},

    giDocStatCdList = [],
    giDocStatCdObj = {},

    toDate,
    gCrud;


toDate = new Date();

//var parGiTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({ "cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

//var giStrgeCdList = [{"strgeCd":"", "strgeNm":""}];
<c:forEach var="obj" items="${giStrgeCdList}" varStatus="status">
    giStrgeCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
</c:forEach>


<c:forEach var="obj" items="${giDocStatCdList}" varStatus="status">
giDocStatCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
giDocStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sParGiTp").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sParReqDocNo").val("");
            break;
        case "search3Area" :
            $("#sReqStartDt").val("");
            $("#sReqEndDt").val("");
            break;
        case "search4Area" :
            $("#sCustNm").val("");
            break;
        case "search5Area" :
            $("#sCarNo").val("");
            break;
        case "search6Area" :
            $("#sSerPrsnId").val("");
            break;
        case "search7Area" :
            $("#sGiDocNo").val("");
            break;
        case "search8Area" :
            $("#sCustNm").val("");
            break;
        default :
            break;
    }
    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sParGiTp = $("#sParGiTp").data("kendoExtDropDownList").value();
    var sParReqDocNo = $("#sParReqDocNo").val();
    var sReqStartDt = $("#sReqStartDt").val();
    var sReqEndDt = $("#sReqEndDt").val();
    var sCustNm = $("#sCustNm").val();
    var sCarNo = $("#sCarNo").val();
    var sSerPrsnId = $("#sSerPrsnId").val();
    var sGiDocNo = $("#sGiDocNo").val();

    if(sParGiTp == "" && sParReqDocNo == "" && sReqStartDt == "" && sReqEndDt == "" && sCustNm == "" && sCarNo == "" && sSerPrsnId == "" && sGiDocNo == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if($.trim(sParGiTp) == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sParReqDocNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sReqStartDt == "" && sReqEndDt == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sCustNm == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sCarNo == "") $("#search5Area").hide();
        else $("#search5Area").show();
        if(sSerPrsnId == "") $("#search6Area").hide();
        else $("#search6Area").show();
        if(sGiDocNo == "") $("#search7Area").hide();
        else $("#search7Area").show();
    }

    setMainListHeight();
}







// ============ 바코드 스캔 START=================
/*
$("#partBarcodeScan, #btnNextScan").click(function(){
    openBarcodeReader('getBarcodeNum');
    //getBarcodeNumTest();
});
*/
$("#partBarcodeScan, #btnNextScan").kendoButton({
    click:function(e){
        openBarcodeReader('getBarcodeNum');
    }
});

function getBarcodeNum(code){ // js (앱에서 리턴되는 값 받는 스크립트)
    contentDetail(code);
};

//테스트용
function getBarcodeNumTest(){ // js (앱에서 리턴되는 값 받는 스크립트)
    var code = "";
    $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
        code = $(this).parent().parent().find("span[name='itemCd']").text();
    });
    contentDetail(code);
};
//============ 바코드 스캔 END=================


var setCheckItemList = function(){
    $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
        for(var i=0; i<saveList.length; i++){
            var code = $(this).parent().parent().find("span[name='itemCd']").text();
            if(code == saveList[i].itemCd){
                $("#detailList").contents().find("input[name='isSave']")[cnt].checked = true;
            }
        }
    });
};


$(document).ready(function() {


    var minDate = new Date(toDt);
    frYY = minDate.getFullYear();
    frMM = minDate.getMonth() + 1;
    if(frMM < 10){
        frMM = "0" + frMM;
    }
    frDD = minDate.getDate();
    if(frDD < 10){
        frDD = "0" + frDD;
    }

    //위탁서유형 드랍다운 리스트.
    $("#sParGiTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:parGiTpList
        ,autoBind:false
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    /*
    $("#tabstrip").kendoExtTabStrip({
        animation:false
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

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='par.title.giConfirm' />");<!-- 모바일입고 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#sReqStartDt").val(chgServerDate2Str(sevenDtBf));
    $("#sReqEndDt").val(chgServerDate2Str(toDt));
    var sRegDtFr = $("#sReqStartDt");
    var sRegDtTo = $("#sReqEndDt");
    if(sRegDtFr.val() != "" || sRegDtTo.val() != "") $("#search3Area span[name='searchStr']").html(sRegDtFr.val() + " ~<br/>" + sRegDtTo.val());
    setSearchBox();
    $("#mainList").attr("src", "<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sParGiTp = $("#sParGiTp").data("kendoExtDropDownList");
            var sParReqDocNo = $("#sParReqDocNo");
            var sReqStartDt = $("#sReqStartDt");
            var sReqEndDt = $("#sReqEndDt");
            var sCustNm = $("#sCustNm");
            var sCarNo = $("#sCarNo");
            var sSerPrsnId = $("#sSerPrsnId");
            var sGiDocNo = $("#sGiDocNo");

            if(sParGiTp.value() != "") $("#search1Area span[name='searchStr']").text(sParGiTp.text());
            if(sParReqDocNo.val() != "") $("#search2Area span[name='searchStr']").text(sParReqDocNo.val());
            if(sReqStartDt.val() != "" || sReqEndDt.val() != "") $("#search3Area span[name='searchStr']").html(sReqStartDt.val() + " ~<br/>" + sReqEndDt.val());
            if(sCustNm.val() != "") $("#search4Area span[name='searchStr']").text(sCustNm.val());
            if(sCarNo.val() != "") $("#search5Area span[name='searchStr']").text(sCarNo.val());
            if(sSerPrsnId.val() != "") $("#search6Area span[name='searchStr']").text(sSerPrsnId.val());
            if(sGiDocNo.val() != "") $("#search7Area span[name='searchStr']").text(sGiDocNo.val());

            setSearchBox();
            contentList();
        }
    });

    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var gridData = {
                    dlrCd:"", // 딜러코드 String
                    parReqDocNo:"",
                    parReqDocLineNo:"",
                    parReqStatCd:"",
                    purcReqNo:"",
                    cancYn:"",
                    parGiTp:"",
                    roDocNo:"",
                    roLineNo:"",
                    resvDocNo:"",
                    resvDocLineNo:"",
                    grStrgeCd:"",
                    giStrgeCd:"",
                    giLocCd:"",
                    dbItemCd:"",
                    itemCd:"",
                    reqQty:"",
                    unitCd:"",
                    endQty:"",
                    reqStrgeCd:"",
                    regUsrId:"",
                    updtDt:"",
                    updtUsrId:"",
                    itemNm:"",
                    pltCd:"",
                    avlbStockQty:"",
                    resvStockQty:"",
                    clamStockQty:"",
                    grScheQty:"",
                    giScheQty:"",
                    resvQty:"",
                    purcReqDt:"",
                    giDocNo:"",
                    giDocTp:"",
                    giDocStatCd:"",
                    dbYn:""
            };

            /*
            header = {
                    bpCd:$("#bpCd").val()
            };

            if(dms.string.isEmpty($("#bpCd").val())){
                //거래처정보는 필수 입력 사항입니다.
                mob.notification.warning("<spring:message code='global.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                return false;
            }
            */
            gridData.giDocNo = $("#giDocNo").val();
            gridData.goDocStatCd = $("#giDocStatCd").val();
            gridData.purcReqDt = chgDate($("#purcReqDt").val());  // todo:출고확정시 날짜 파라미터 오류 발생 (추후보완)
            gridData.parReqDocNo = $("#parReqDocNo").val();
            gridData.parGiTp = $("#parGiTp").val();
            gridData.itemCd = $("#itemCd").val();
            gridData.itemNm = $("#itemNm").val();
            gridData.unitCd = $("#unitCd").val();
            gridData.resvQty = $("#resvQty").val();
            gridData.avlbStockQty = $("#avlbStockQty").val();
            gridData.resvStockQty = $("#resvStockQty").val();
            gridData.giStrgeCd = $("#giStrgeCd").val();
            gridData.giLocCd = $("#giLocCd").val();
            gridData.parReqDocLineNo = $("#parReqDocLineNo").val();
            gridData.reqQty = $("#reqQty").val();

            if(dms.string.isEmpty(gridData.itemCd)){
                // 부품번호는 필수사항입니다.
                mob.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
                return false;
            }

            if(dms.string.isEmpty(gridData.giStrgeCd)){
                // 출고창고는 필수사항입니다.
                mob.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giStrgeCd}' />");
                return false;
            }

            if(dms.string.isEmpty(gridData.giLocCd)){
                // 출고위치는 필수사항입니다.
                mob.notification.info("<spring:message code='par.lbl.giLocCd' var='giLocCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giLocCd}' />");
                return false;
            }
            saveList.push(gridData);

            setCheckItemList();
            setTimeout(function(){
                //$("iframe[name='detailList']").contents().find("input[name='isSave']").each(function(cnt){
                    $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
                    var code = $(this).parent().parent().find("span[name='itemCd']").text();
                    var isSaveChecked = this.checked;
                    if(isSaveChecked == false){
                        contentDetail(code);
                        return false;

                    }
                    contentItemListNonRefresh($("#selParReqDocNo").val());
                    setTimeout(function(){ setCheckItemList();}, 200);

                });
            }, 200);

            //임시
            //contentItemList($("#sParReqDocNo").val());
            //contentItemListNonRefresh($("#sParReqDocNo").val());
        }
    });

    //버튼 - 입고확정
    $("#btnFix").kendoButton({
        click:function(e){

            var issuePartsOutVO = {
                dlrCd:""
                ,giDocNo:$("#selGiDocNo").val()
                ,giDocTp:"01"
                ,giDocStatCd:"01"
                ,cancYn:"N"
                ,parReqDocNo:$("#selParReqDocNo").val()
                ,roDocNo:$("#selRoDocNo").val()
                ,pltCd:""
                ,serPrsnId:$("#serPrsnId").val()
                ,custCd:$("#custCd").val()
                ,custNm:$("#custNm").val()
                ,vinNo:$("#vinNo").val()
                ,carNo:$("#carNo").val()
                ,mvtDocYyMm:""
                ,mvtDocNo:""
                ,regUsrId:null
                ,regDt:null
                ,updtUsrId:null
                ,updtDt:null
            }

            if(saveList.length > 0){
                var issueReqSaveVO ={
                       "issuePartsOutVO"  :issuePartsOutVO
                      ,"issueReqDetailVO":saveList
                    };
                console.log("saveData::"+kendo.stringify(issueReqSaveVO),paramUrl );
                $.ajax({
                     url:"<c:url value='/mob/par/ism/issueReq/insertIssueReqStatus.do' />"
                    ,data:kendo.stringify(issueReqSaveVO)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        //grid.dataSource.read();
                        //saveList = [];
                        //document.getElementById("detailList").contentWindow.document.location.reload();
                        //$("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();

                        //출고등록이 완료 되었습니다.
                        //mob.notification.success("<spring:message code='par.lbl.giReg' var='giReg' /><spring:message code='global.info.successMsg' arguments='${giReg}' />");
                        mob.notification.success("<spring:message code='par.lbl.giReg' var='giReg' /><spring:message code='global.info.successMsg' arguments='${giReg}' />");
                        contentList();
                    }
                    ,error:function(jqXHR,status,error) {
                        //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });
            }
        }
    });


    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_itemList").css("display") == "block") { contentList(); }
        /* else if ($("#content_detail").css("display") == "block") { contentItemList($("#sParReqDocNo").val()); } */
        else if ($("#content_detail").css("display") == "block") { contentItemListNonRefresh($("#selParReqDocNo").val()); setTimeout(function(){ setCheckItemList();}, 1000);}
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
});
</script>

<script>

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();

}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_itemList").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  /*
  var maxDate = new Date(sevenDtBf);
  var minYY = maxDate.getFullYear();
  var minMM = maxDate.getMonth() + 1;
  if(minMM < 10){
      minMM = "0" + minMM;
  }
  var minDD = maxDate.getDate();
  if(minDD < 10){
      minDD = "0" + minDD;
  }

  var minDate = new Date(toDt);
  var frYY = minDate.getFullYear();
  var frMM = minDate.getMonth() + 1;
  if(frMM < 10){
      frMM = "0" + frMM;
  }
  var frDD = minDate.getDate();
  if(frDD < 10){
      frDD = "0" + frDD;
  }

  $("#sReqStartDt").val(minYY+"-"+minMM+"-"+minDD);
  $("#sReqEndDt").val(frYY+"-"+frMM+"-"+frDD);
  */

  $("#sReqStartDt").val(chgServerDate2Str(sevenDtBf));
  $("#sReqEndDt").val(chgServerDate2Str(toDt));

}

//부품리스트 보기
function contentItemList(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#sParReqDocNo").val(key);
  $("#detailList").attr("src", "<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusItemList.do' />");
}


//부품리스트 보기(리스트에서 클릭할때)
function contentItemListFromList(dataItem) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#selParReqDocNo").val(dataItem.parReqDocNo);
  $("#detailList").attr("src", "<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusItemList.do' />");
}



//부품리스트 보기
function contentItemListNonRefresh(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#selParReqDocNo").val(key);
}


//상세페이지 보기
function contentDetail(key) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusItemListDetail.do' />",
            data:JSON.stringify({ sItemCd:key, sParReqDocNo:$("#selParReqDocNo").val()          }),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                alert(error);
            }
        }).done(function(result) {
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            console.log('result:', result);
            console.log('Hash:', partsJs.validate.formJs.Hash);
            console.log('result.itemCd:', result.itemCd);
            partsJs.validate.groupObjAllDataSet(result);
            //$("#parReqDocNo").val($("#selParReqDocNo").val());

            $("#custCd").val($("#selCustCd").val());
            $("#custNm").val($("#selCustNm").val());
            $("#vinNo").val($("#selVinNo").val());
            $("#carNo").val($("#selCarNo").val());

            gCrud = 'U';
        });
    }

    var itemList = [];
    itemList.push(key);
    var header = {
            sItemCdLst       :itemList
    };


    $.ajax({
        url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
       ,data:kendo.stringify(header)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,success:function(result) {
           locationListObj = {};
           locationObj[' '] = "";
           for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
               if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                   locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
               }else{
                   locationListObj[result.data[i].itemCd] = [];
                   locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
               }
               if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                   locationObj[result.data[i].locCd] = result.data[i].locNm;
               }
           }

       }
       ,error:function(jqXHR,status,error) {
           mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           return false;
       }
   });

    /*
    locationListObj[' '] = "";
    <c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
    locationList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        locationListObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    */

    //var itemCd = options.model.itemCd;

    // 입고창고 선택
    $("#giStrgeCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:giStrgeCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });



    // 출고로케이션 선택 ( jhlim todo)
    //var itemCd = options.model.itemCd;
    $("#giLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[key]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>" // 선택
    });
}


// 상세페이지 보기(바코드 스캔이후) --- 미사용
function contentDetailFromBarcode() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    var barCodeData = {};

    barCodeData.avlbStockQty= 177;
    barCodeData.cancYn= "N";
    barCodeData.clamStockQty= 0;
    barCodeData.dbItemCd= "252122B000";
    barCodeData.dbYn= "Y";
    barCodeData.dlrCd= "A07AA";
    barCodeData.endQty= 0;
    barCodeData.giDocNo= "-";
    barCodeData.giDocStatCd= "01";
    barCodeData.giDocTp= "01";
    barCodeData.giLocCd= "";
    barCodeData.giScheQty= 0;
    barCodeData.giStrgeCd= "";
    barCodeData.grScheQty= 0;
    barCodeData.grStrgeCd= "A07AA-01";
    barCodeData.itemCd= "252122B000";
    barCodeData.itemNm= "V型皮带";
    barCodeData.parGiTp= "RO";
    barCodeData.parReqDocLineNo= 1;
    barCodeData.parReqDocNo= "RQ20160400203";
    barCodeData.parReqStatCd= "01";
    barCodeData.pltCd= "1000";
    barCodeData.purcReqDt= "2016-04-14 12=32=14";
    barCodeData.purcReqNo= "";
    barCodeData.regDt= null;
    barCodeData.regUsrId= "admin";
    barCodeData.reqQty= 1;
    barCodeData.reqStrgeCd= "A07AA-01";
    barCodeData.resvDocLineNo= 0;
    barCodeData.resvDocNo= "RE201604-0127";
    barCodeData.resvQty= 0;
    barCodeData.resvStockQty= 0;
    barCodeData.rnum= 1;
    barCodeData.roDocNo= "-022";
    barCodeData.roLineNo= 1;
    barCodeData.unitCd= "EA";
    barCodeData.updtDt= null;
    barCodeData.updtUsrId= null;

    if(barCodeData != null){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        console.log('Hash:', partsJs.validate.formJs.Hash);
        partsJs.validate.groupObjAllDataSet(barCodeData);
        gCrud = 'U';

        //$("#parReqDocNo").val($("#selParReqDocNo").val());
        $("#custCd").val($("#selCustCd").val());
        $("#custNm").val($("#selCustNm").val());
        $("#vinNo").val($("#selVinNo").val());
        $("#carNo").val($("#selCarNo").val());

    }


    var itemList = [];
    itemList.push(barCodeData.itemCd);
    var header = {
            sItemCdLst       :itemList
    };


    $.ajax({
        url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
       ,data:kendo.stringify(header)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,success:function(result) {
           locationListObj = {};
           locationObj[' '] = "";
           for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
               if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                   locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
               }else{
                   locationListObj[result.data[i].itemCd] = [];
                   locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
               }
               if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                   locationObj[result.data[i].locCd] = result.data[i].locNm;
               }
           }

       }
       ,error:function(jqXHR,status,error) {
           mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           return false;
       }
   });

    /*
    locationListObj[' '] = "";
    <c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
    locationList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        locationListObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    */

    //var itemCd = options.model.itemCd;

    // 입고창고 선택
    $("#giStrgeCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:giStrgeCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });



    // 출고로케이션 선택 ( jhlim todo)
    //var itemCd = options.model.itemCd;
    $("#giLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[barCode.itemCd]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>" // 선택
    });


}


//배송업체 조회팝업
function fnDlBpCdPop(e){
    selectVenderMasterPopupWindow();
}


function selectVenderMasterPopupWindow(){
    venderSearchPopupWin = dms.window.popup({
        windowId:"venderMasterPopup"
        ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
        ,deactivate :false
        ,content:{
            url:"<c:url value='/mob/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"bpTp":'04'
                ,"callbackFunc":function(data){
                    $("#dlBpCd").val(data.bpCd);
                    $("#dlBpNm").val(data.bpNm);
                }
            }
        }
    });
}



</script>
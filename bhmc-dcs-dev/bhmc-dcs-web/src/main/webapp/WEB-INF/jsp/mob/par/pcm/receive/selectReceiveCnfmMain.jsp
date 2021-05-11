
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
                <h2 id="content_list_title"><spring:message code="par.title.invcList" /><!-- Invoice 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="global.lbl.arrvDt" /><!-- 도착일자 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.invcSearchCondition" /><!-- Invoice 조회조건  --></h2>
        </div>
        <div class="formarea form2">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sMobisInvcNo" class="form_input" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></th>
                        <td>
                            <div class="f_item01">
                                <input type="text" id="sInvcDt" class="" style="width:140px" readOnly/>
                                <span class="date" onclick="calpicker('sInvcDt');">날짜선택</span>
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
                <h2><span id="lblInvcDocNo" ></span> <spring:message code="global.lbl.budgetDetlCont" /><!-- 상세내역 --></h2>
            </div>
            <div class="listarea">
                        <div class="listhead checkitem">
                            <span style="width:50%"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.grQty" />(<spring:message code="par.lbl.unit" />)<!-- 입고수량(단위) --></span>
                            <span class="clboth"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
                        </div>
                <iframe id="detailList" name="detailList" border="1" frameborder="0" width="100%" height="300px"></iframe>
                <input type="hidden" id="sInvcDocNo" value=""/>
            </div>
            <%-- <div class="con_btnarea">
                <span class="btnd2" id="btnFix"><spring:message code='global.btn.fix' /></span>
                <span class="btnd2" id="partBarcodeScan" ><spring:message code="global.lbl.part" /> <spring:message code="mob.lbl.barcode" /> <spring:message code="mob.lbl.scan" /><!-- 부품 바코드 스캔 --></span>
            </div> --%>
            <div class="btnfixed">
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnFix"><spring:message code='global.btn.fix' /></span></div>
                <div><span class="btnd1" id="partBarcodeScan" ><spring:message code="global.lbl.part" /> <spring:message code="mob.lbl.barcode" /> <spring:message code="mob.lbl.scan" /><!-- 부품 바코드 스캔 --></span></div>
            </div>
            </div>
        </section>
    </div>



    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.title.partReceiveInfo" /><!-- 부품입고정보 --></h2>
            </div>
            <input id="dlrCd" type="hidden" /> <!-- 딜러코드 -->
            <input id="dpBm" type="hidden" /> <!-- 공급업체명 -->
            <input id="bpCd" type="hidden" /> <!-- 공급업체코드 -->
            <input id="invcDocNo" type="hidden" /> <!-- 송장문서번호 -->
            <input id="invcDocLineNo" type="hidden" /> <!-- 송장문서라인번호 -->
            <input id="invcPrc" type="hidden" /> <!-- 송장단가 -->
            <input id="invcAmt" type="hidden" /> <!-- 송장금액 -->
            <input id="purcOrdNo" type="hidden" /> <!-- 구매오더번호 -->
            <input id="purcOrdLineNo" type="hidden" /> <!-- 구매오더라인번호 -->

            <div class="formarea">
                <table  class="flist01 form2">
                    <caption><spring:message code="par.title.partReceiveInfo" /><!-- 부품입고정보 --></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mobisInvcNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.invcLine" /><!-- INVOICE라인 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mobisInvcLineNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcQty" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.unit" /><!-- 단위 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcUnitCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='par.lbl.grStrgeCd' /><!-- 입고창고 --></th>
                            <td>
                                <div class="f_text"><input id="grStrgeCd" type="text" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.locationCd' /><!-- Location --></th>
                            <td>
                                <div class="f_text"><input id="grLocCd" type="text" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='par.lbl.claimTp' /><!-- 클레임사유 --></th>
                            <td>
                                <div class="f_text"><input id="claimTp" type="text" class="form_comboBox" data-tye="combo" data-mandatory="true" /></div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='par.lbl.claimQty' /><!-- 클레임수량 --></th>
                            <td >
                                <div class="f_text">
                                    <input id="claimQty" type="text" placeholder=""/>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='par.lbl.claimTargetCd' /><!-- 클레임대상 --></th>
                            <td class="required_area">
                                <div class="f_text"><input id="claimTargCd" type="text" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='par.lbl.dlBpCd' /><!-- 배송업체  --></th>
                            <td>
                                <input id="dlBpCd" type="hidden" />
                                <div class="f_item01 f_disabled">
                                    <input id="dlBpNm" type="text" disabled="disabled" />
                                        <span class="search" onclick="fnDlBpCdPop(this);"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.reqCont' /><!-- 요청사항 --></th>
                            <td>
                                <!-- <input id="reqCont" type="text" /> -->
                                <textarea id="reqCont" rows="2" cols="" class="f_textarea"  placeholder=""></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="con_btnarea btncount3">
                <div><span id="btnNextScan" class="btnd1"><spring:message code='mob.btn.nextScan' /><!-- 다음스캔 --></span></div>
                <div><span id="btnSave" class="btnd1"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
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
    grStrgeTpList       = [],
    grStrgeTpObj        = {},
    locationListObj     = {},
    locationObj         = {},
    claimTpList         = [],
    claimTpObj          = {},
    claimTargetTpList   = [],
    claimTargetTpObj    = {},
    toDate,
    gCrud;



toDate = new Date();

grStrgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

claimTpObj[' '] = "";
<c:forEach var="obj" items="${clTpList}" varStatus="status">
    claimTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    claimTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

claimTargetTpObj[' '] = "";
<c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
    claimTargetTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    claimTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sMobisInvcNo").val("");
            break;
        case "search2Area" :
            $("#sInvcDt").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sMobisInvcNo = $("#sMobisInvcNo").val();
    var sInvcDt = $("#sInvcDt").val();
    if(sMobisInvcNo == "" && sInvcDt == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sMobisInvcNo == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sInvcDt == "") $("#search2Area").hide();
        else $("#search2Area").show();
    }
    setMainListHeight();
}



//============ 바코드 스캔 START=================
/*
$("#partBarcodeScan, #btnNextScan").click(function(){
 openBarcodeReader('getBarcodeNum');
 //getBarcodeNumTest();
});
*/


$("#partBarcodeScan, #btnNextScan").kendoButton({
    click:function(e){
        openBarcodeReader('getBarcodeNum');
        //getBarcodeNumTest();
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
            //alert("code="+code+", saveList[i].itemCd="+saveList[i].itemCd);
            if(code == saveList[i].itemCd){
                $("#detailList").contents().find("input[name='isSave']")[cnt].checked = true;
            }
        }
    });
};

$(document).ready(function() {

    // 타이틀 클릭 조회기능 여부(검색 타이틀 아이콘 처리용도) "Y":조회기능 유, "N":조회기능 무 --- default:"Y"
    //searchMode = "N";

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

    // 입고창고 선택
    $("#grStrgeCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:grStrgeTpList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    // 클레임사유 선택
    $("#claimTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:claimTpList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    // 클레임대상 선택
    $("#claimTargCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:claimTargetTpList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

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
    $("#header_title").html("<spring:message code='mob.title.mobileReceive' />");<!-- 모바일입고 -->
    //$("#header_title").html("<span class='search_open'><spring:message code='mob.title.mobileReceive' /></span>");<!-- 모바일입고 -->


    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");






/*
function setSearchTitleIcon(obj){
    if(obj == "block"){
        $("#header_title span").attr("class","search_close");
    }else{
        $("#header_title span").attr("class","search_open");
    }
}
*/




    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/pcm/receive/selectReceiveCnfmList.do' />");





    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sMobisInvcNo = $("#sMobisInvcNo");
            var sInvcDt = $("#sInvcDt");
            if(sMobisInvcNo.val() != "") $("#search1Area span[name='searchStr']").text(sMobisInvcNo.val());
            if(sInvcDt.val() != "") $("#search2Area span[name='searchStr']").text(sInvcDt.val());
            setSearchBox();
            contentList();
        }
    });


    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var gridData = {
                    dlrCd:"", // 딜러코드 String
                    invcDocNo:"", // 송장문서번호 String
                    invcDocLineNo:"", // 송장문서라인번호 int
                    mobisInvcNo:"", // 모비스송장번호 String
                    mobisInvcLineNo:"", // 모비스송장라인번호 int
                    purcOrdTp:"", // 구매오더유형 String
                    purcOrdNo:"", // 구매오더번호 String
                    purcOrdLineNo:"", // 구매오더라인번호 int
                    itemCd:"", // 품목코드 String
                    itemNm:"", // 품목명 String
                    invcQty:"", // 송장수량 Double
                    invcUnitCd:"", // 송장단위코드 String
                    invcPrc:"", // 송장단가 Double
                    invcAmt:"", // 송장금액 Double
                    vatAmt:"", // 부가세금액 Double
                    invcTotAmt:"", // 송장총금액 Double
                    debitCreditDstinCd:"", // 차변대변구분코드 String
                    refInvcDocNo:"", // 참조송장문서번호 String
                    refInvcDocLineNo:"", // 참조송장문서라인번호 int
                    invcGrDt:"", // 송장입고일자 Date
                    invcDt:"", // INVOICE일자 Date
                    dlPdcCd:"", // 배송PDC코드 String
                    grStrgeCd:"", // 입고창고코드 String
                    grStrgeNm:"", // 입고창고명 String
                    grLocCd:"", // 입고Location String
                    grLocNm:"", // 입고Location명 String
                    grQty:"", // 입고수량 Double
                    bpCd:"", // 거래처코드 String
                    bpNm:"", // 거래처명 String
                    claimTargCd:"", // 클레임대상코드 String
                    dlBpCd:"", // 배송거래처코드 String
                    dlBpNm:"", // 배송거래처명 String
                    claimTp:"", // 클레임유형 String
                    prevClaimQty:"", // 기 클레임수량 Double
                    claimQty:"", // 클레임 수량 Double
                    reqCont:"", // 요청내용 String
                    docFileNo:"", // 문서파일번호 String
                    grEndYn:"" // 입고완료여부 String

            };
            header = {
                    bpCd            :$("#bpCd").val()
            };

            if(dms.string.isEmpty($("#bpCd").val())){
                //거래처정보는 필수 입력 사항입니다.
                mob.notification.warning("<spring:message code='global.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                return false;
            }
            gridData.dlrCd = $("#dlrCd").val();
            gridData.bpNm = $("#bpNm").val();
            gridData.mobisInvcNo = $("#mobisInvcNo").val();
            gridData.mobisInvcLineNo = $("#mobisInvcLineNo").val();
            gridData.itemCd = $("#itemCd").val();
            gridData.itemNm = $("#itemNm").val();
            gridData.invcQty = $("#invcQty").val();
            gridData.invcUnitCd = $("#invcUnitCd").val();
            gridData.grStrgeCd = $("#grStrgeCd").val();
            gridData.grLocCd = $("#grLocCd").val();
            gridData.claimTp = $("#claimTp").val();
            gridData.claimTargCd = $("#claimTargCd").val();
            gridData.dlBpCd = $("#dlBpCd").val();
            gridData.dlBpNm = $("#dlBpNm").val();
            gridData.claimQty = $("#claimQty").val();
            gridData.reqCont = $("#reqCont").val();
            gridData.invcDocNo = $("#invcDocNo").val();
            gridData.invcDocLineNo = $("#invcDocLineNo").val();
            gridData.invcPrc = $("#invcPrc").val();
            gridData.invcAmt = $("#invcAmt").val();
            gridData.purcOrdNo = $("#purcOrdNo").val();
            gridData.purcOrdLineNo = $("#purcOrdLineNo").val();
            gridData.bpCd = $("#bpCd").val();

            if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                // 수량을 입력하십시오
                mob.notification.warning("<spring:message code='global.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                saveList = [];
                return false;
            }

            if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                // 단가를 입력하십시오.
                mob.notification.warning("<spring:message code='global.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                saveList = [];
                return false;
            }

            if(dms.string.isEmpty(gridData.grStrgeCd)){
                // 입고창고를 선택하십시오
                mob.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                saveList = [];
                return false;
            }

            /* 임시
            if(dms.string.isEmpty(gridData.grLocCd)){
                // 입고로케이션를 선택하십시오
                mob.notification.warning("<spring:message code='global.lbl.locationCd' var='grLocCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grLocCd}'/>");
                saveList = [];
                return false;
            }
            */

            if(gridData.claimQty > 0){

                if(Number(gridData.claimQty) > Number(gridData.invcQty)){
                    // 클레임 수량이 입고확정수량보다 클 수 없습니다.
                    mob.notification.warning("<spring:message code='par.err.compareClaimInvcQty' />");
                    saveList = [];
                    return false;
                }

                if(dms.string.isEmpty(gridData.claimTp)){
                    // 클레임 사유를 선택하십시오
                    mob.notification.warning("<spring:message code='par.lbl.claimTp' var='claimTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTp}'/>");
                    saveList = [];
                    return false;
                }

                if(dms.string.isEmpty(gridData.claimTargCd)){
                    // 클레임 대상을 선택하십시오
                    mob.notification.warning("<spring:message code='par.lbl.claimTargetCd' var='claimTargetCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTargetCd}'/>");
                    saveList = [];
                    return false;
                }else{
                    //클레임 대상이 배송처인 경우
                    if(gridData.claimTargCd === '02'){
                        if(dms.string.isEmpty(gridData.dlBpCd)){
                            // 배송업체를 선택하십시오
                            mob.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.dlBpNm)){
                            // 배송업체를 선택하십시오
                            mob.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                            saveList = [];
                            return false;
                        }
                    }
                }
            }
            saveList.push(gridData);



            setCheckItemList();
            setTimeout(function(){
                $("iframe[name='detailList']").contents().find("input[name='isSave']").each(function(cnt){
                    var code = $(this).parent().parent().find("span[name='itemCd']").text();
                    var isSaveChecked = this.checked;
                    if(isSaveChecked == false){
                        contentDetail(code);
                        return false;

                    }
                    contentItemListNonRefresh($("#sInvcDocNo").val());
                    setTimeout(function(){ setCheckItemList();}, 200);

                });
            }, 200);


            /*
            contentItemListNonRefresh($("#sInvcDocNo").val());
            setCheckItemList();
            */



            //contentItemList($("#sInvcDocNo").val());

        }
    });


    //버튼 - 입고확정
    $("#btnFix").kendoButton({
        click:function(e){
            if(saveList.length > 0){
                var data ={
                       "invcVO"  :header
                      ,"invcItemList":saveList
                    };
                console.log("saveData::"+kendo.stringify(data),paramUrl );
                $.ajax({
                     url:"<c:url value='/mob/par/pcm/receive/insertReceiveCnfm.do' />"
                    ,data:kendo.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        if (result === 1) {
                            mob.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                            //document.getElementById("detailList").contentWindow.document.location.reload();
                            contentList();
                        } else {
                            console.log('errorResult:',result);
                            if(result === 0){
                                mob.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                            }
                        }
                    }
                    ,error:function(jqXHR,status,error) {
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
        //else if ($("#content_detail").css("display") == "block") { contentItemList($("#sInvcDocNo").val()); }
        else if ($("#content_detail").css("display") == "block") { contentItemListNonRefresh($("#sInvcDocNo").val()); setTimeout(function(){ setCheckItemList();}, 1000);}

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
  $("#sInvcDt").val(frYY+"-"+frMM+"-"+frDD);

}


//부품리스트 보기
function contentItemList(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#sInvcDocNo").val(key);
  $("#detailList").attr("src", "<c:url value='/mob/par/pcm/receive/selectReceiveCnfmItemList.do' />");

  saveList = [];
}


//부품리스트 보기
function contentItemListNonRefresh(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#sInvcDocNo").val(key);
}


//상세페이지 보기
function contentDetail(key) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if( key != null && key != 'undefined'){
        $.ajax({
            //url:"<c:url value='/mob/par/pcm/invc/selectReceiveItemByInvcItemBarcode.do' />",
            url:"<c:url value='/mob/par/pcm/reveice/selectReceiveCnfmItemDetail.do' />",
            data:JSON.stringify({ sItemCd:key, sMobisInvcNo:$("#sInvcDocNo").val()          }),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                //alert(error);
            }
        }).done(function(result) {
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            console.log('result:', result);
            console.log('Hash:', partsJs.validate.formJs.Hash);
            partsJs.validate.groupObjAllDataSet(result);
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

    // 입고로케이션 선택 ( jhlim todo)
    //var itemCd = options.model.itemCd;
    $("#grLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[key]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
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
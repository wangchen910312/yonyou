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
                <h2 id="content_list_title"><spring:message code="par.title.stockDdDocList" /><!-- 재고실사문서 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="global.lbl.regDt" /><!-- 등록일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="par.lbl.strgeNm" /><!-- 창고 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="par.lbl.stockDdDocNo" /><!-- 실사문서번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="par.lbl.prsnId" /><!-- 담당자ID --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="global.lbl.regDt" /><!-- 등록일자 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.strgeNm" /><!-- 창고 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="par.lbl.stockDdDocNo" /><!-- 실사문서번호 --></span>
                            <%--<span style="width:50%"><spring:message code="par.lbl.prsnId" />(<spring:message code="global.lbl.name" />)<!-- 담당자ID(이름) --></span>--%>
                            <span style="width:50%"><spring:message code="par.lbl.prsnId" /><!-- 담당자ID --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.stockDdDocSearchCondition" /><!-- 재고실사문서 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일자 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sRegDtFr" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sRegDtFr');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sRegDtTo" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sRegDtTo');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.strgeNm" /><!-- 창고 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sStrgeCd" class="form_comboBox" style="width:100%"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockDdDocNo" /><!-- 실사문서번호 --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sStockDdDocNo" class="form_input" style="width:100%">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.prsnId" /><!-- 담당자ID --></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sPrsnId" class="form_input" style="width:100%">
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
                <h2><spring:message code="par.title.stockDdDocPartsList" /><!-- 재고실사문서 부품리스트 --></h2>
            </div>
            <input id="sel1DlrCd" type="hidden" />
            <input id="sel1StrgeCd" type="hidden" />
            <input id="sel1StockDdDocNo" type="hidden" />
            <input id="sel1PrsnId" type="hidden" />
            <input id="sel1DocStatCd" type="hidden" />
            <input id="sel1PltCd" type="hidden" />
            <input id="sel1StockLockYn" type="hidden" />
            <input id="sel1ApproveReqDt" type="hidden" />
            <input id="sel1EndDt" type="hidden" />
            <input id="sel1CancDt" type="hidden" />
            <input id="sel1SignOpnCont" type="hidden" />
            <input id="sel1Remark" type="hidden" />


            <div class="listarea">
                        <div class="listhead checkitem">
                            <span style="width:50%"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.stockStat" /><!-- 재고상태 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="global.lbl.locationCd" /><!-- Location --></span>
                            <span style="width:50%"><spring:message code="global.lbl.qty" />(<spring:message code="par.lbl.unit" />)<!-- 수량(단위) --></span>
                        </div>
                <iframe id="detailList" name="detailList" border="1" frameborder="0" width="100%" height="300px"></iframe>
                <input type="hidden" id="selStockDdDocNo" value=""/>
            </div>
            <%-- <div class="con_btnarea">
                <span class="btnd2" id="btnFix"><spring:message code='global.btn.end' /><!-- 완료 --></span>
                <span class="btnd2" id="partBarcodeScan" ><spring:message code="global.lbl.part" /> <spring:message code="mob.lbl.barcode" /> <spring:message code="mob.lbl.scan" /><!-- 부품 바코드 스캔 --></span>
            </div> --%>
            <div class="btnfixed">
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnFix"><spring:message code='global.btn.end' /><!-- 완료 --></span></div>
                <div><span class="btnd1" id="partBarcodeScan" ><spring:message code="global.lbl.part" /> <spring:message code="mob.lbl.barcode" /> <spring:message code="mob.lbl.scan" /><!-- 부품 바코드 스캔 --></span></div>
            </div>
            </div>
        </section>
    </div>



    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.menu.stockResultInvest" /><!-- 재고실사 결과등록 --></h2>
            </div>
            <input id="dlrCd" type="hidden" />
            <input id="itemDstinCd" type="hidden" />
            <input id="unitCd" type="hidden" />
            <input id="carlineCd" type="hidden" />
            <input id="abcInd" type="hidden" />
            <!-- <input id="lastGrDt" type="hidden" /> -->
            <!-- <input id="lastGiDt" type="hidden" /> -->

            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stockDdDocNo" /><!-- 재고실사문서번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stockDdDocNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stockDdDocLine" /><!-- 재고실사문서Line --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stockDdDocLineNo" type="text" placeholder="" disabled="disabled"/></div>
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
                            <th scope="row"><spring:message code='par.lbl.strgeNm' /><!-- 창고 --></th>
                            <%--
                            <td class="required_area">
                                <div class="f_combo">
                                    <input id="strgeCd" type="text" data-type="combo" data-mandatory="true" />
                                </div>
                            </td>
                            --%>
                            <td>
                                <input id="strgeCd" type="hidden"/>
                                <div class="f_text f_disabled"><input id="strgeNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.stockStat" /><!-- 재고상태 --></th>
                            <td>
                                <input id="itemStatCd" type="hidden"/>
                                <div class="f_text f_disabled"><input id="itemStatNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                         <tr>
                            <th scope="row"><spring:message code='global.lbl.locationCd' /><!-- Location --></th>
                            <td>
<!--                                 <input id="locCd" type="hidden" /> -->
                                <div class="f_text f_disabled"><input id="locCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                            <%--
                            <td class="required_area">
                                <div class="f_combo">
                                    <input id="grLocCd" type="text" data-type="combo" data-mandatory="true" />
                                </div>
                            </td>
                             --%>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.bookQty" /><!-- 장부수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="bookQty" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.ddQty" /><!-- 실사수량 --></th>
                            <td>
                                <div class="f_text"><input id="ddQty" type="text" placeholder="" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.diffQty" /><!-- 손익수량 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                    <input id="diffQty" type="text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.prc" /><!-- 단가 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                    <input id="movingAvgPrc" type="text" placeholder="" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.reasonCont' /><!-- 차이사유 --></th>
                            <td>
                                <div class="f_text">
                                    <input id="reasonCont" type="text" data-tye="combo" data-mandatory="true" />
                                </div>
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

/*
var saveList      = [],
lCrud         = '',
paramUrl      = '',
chkRow,
header;
*/

var saveData = {};
var header;
saveData.insertList = [];
saveData.updateList = [];
saveData.deleteList = [];
saveData.investigationVO = {};


var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",

    storageList         = [],
    storageObj          = {},
    docStatList         = [],
    docStatObj          = {},
    stockLockYnList     = [],
    itemStatObj          = {},
    locationListObj     = {},
    locationObj         = {},

    toDate,
    gCrud;



toDate = new Date();

storageObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

stockLockYnList.push({cmmCd:"", cmmCdNm:" "});
stockLockYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
stockLockYnList.push({cmmCd:"N", cmmCdNm:"No"});

docStatList.push({cmmCd:"", cmmCdNm:" "});
<c:forEach var="obj" items="${docStatList}" varStatus="status">
    docStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

itemStatObj[' '] = "";
<c:forEach var="obj" items="${itemStatList}" varStatus="status">
    itemStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sRegDtFr").val("");
            $("#sRegDtTo").val("");
            break;
        case "search2Area" :
            $("#sStrgeCd").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sStockDdDocNo").val("");
            break;
        case "search4Area" :
            $("#sPrsnId").val("");
            break
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sRegDtFr = $("#sRegDtFr").val();
    var sRegDtTo = $("#sRegDtTo").val();
    var sStrgeCd = $("#sStrgeCd").data("kendoExtDropDownList").value();
    var sStockDdDocNo = $("#sStockDdDocNo").val();
    var sPrsnId = $("#sPrsnId").val();

    if(sRegDtFr == "" && sRegDtTo == "" && sStrgeCd == "" && sStockDdDocNo == "" && sPrsnId == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();

        if(sRegDtFr == "" && sRegDtTo == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if($.trim(sStrgeCd) == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sStockDdDocNo == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sPrsnId == "") $("#search4Area").hide();
        else $("#search4Area").show();
    }

    setMainListHeight();
}


//============ 바코드 스캔 START=================

/*
$("#partBarcodeScan, #btnNextScan").click(function(){
    //openBarcodeReader('getBarcodeNum');
    getBarcodeNumTest();
});
*/


$("#partBarcodeScan, #btnNextScan").kendoButton({
    click:function(e){
        //openBarcodeReader('getBarcodeNum');
        getBarcodeNumTest();
    }
});

function getBarcodeNum(code){ // js (앱에서 리턴되는 값 받는 스크립트)
    //contentDetail(code);
    contentDetailFromBarcode(code);
};

//테스트용
function getBarcodeNumTest(){ // js (앱에서 리턴되는 값 받는 스크립트)
    var code = "";
    $("iframe[name='detailList']").contents().find("input[name='isSave']").each(function(cnt){
        code = $(this).parent().parent().find("span[name='itemCd']").text();
    });
    //contentDetail(code);
    contentDetailFromBarcode(code);
};


//============ 바코드 스캔 END=================



var setCheckItemList = function(){
    //$(this).parent().parent().find("input[name='isSave']").each(function(cnt){
    $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
        for(var i=0; i<saveData.updateList.length; i++){
            var code = $(this).parent().parent().find("span[name='itemCd']").text();
            if(code == saveData.updateList[i].itemCd){
                //$(this).parent().parent().find("input[name='isSave']")[cnt].checked = true;
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


    // 창고선택
    $("#sStrgeCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:storageList
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
    $("#header_title").html("<spring:message code='par.menu.stockResultInvest' />");<!-- 재고실사 결과등록 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    $("#sRegDtFr").val(chgServerDate2Str(sevenDtBf));
    $("#sRegDtTo").val(chgServerDate2Str(toDt));
    var sRegDtFr = $("#sRegDtFr");
    var sRegDtTo = $("#sRegDtTo");
    if(sRegDtFr.val() != "" || sRegDtTo.val() != "") $("#search1Area span[name='searchStr']").html(sRegDtFr.val() + " ~<br/>" + sRegDtTo.val());
    setSearchBox();
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sRegDtFr = $("#sRegDtFr");
            var sRegDtTo = $("#sRegDtTo");
            var sStrgeCd = $("#sStrgeCd").data("kendoExtDropDownList");
            var sStockDdDocNo = $("#sStockDdDocNo");
            var sPrsnId = $("#sPrsnId");
            if(sRegDtFr.val() != "" || sRegDtTo.val() != "") $("#search1Area span[name='searchStr']").html(sRegDtFr.val() + " ~<br/>" + sRegDtTo.val());
            if(sStrgeCd.value() != "") $("#search2Area span[name='searchStr']").text(sStrgeCd.text());
            if(sStockDdDocNo.val() != "") $("#search3Area span[name='searchStr']").text(sStockDdDocNo.val());
            if(sPrsnId.val() != "") $("#search4Area span[name='searchStr']").text(sPrsnId.val());
            setSearchBox();
            contentList();
        }
    });


    // 버튼 - 저장
    $("#btnSave").kendoButton({

        click:function(e){
            var gridData = {
                    dlrCd:"",
                    stockDdDocNo:"",
                    stockDdDocLineNo:"",
                    strgeCd:"",
                    locCd:"",
                    itemCd:"",
                    itemStatCd:"",
                    itemNm:"",
                    itemDstinCd:"",
                    carlineCd:"",
                    abcInd:"",
                    /* lastGrDt:"", */
                    /* lastGiDt:"", */
                    bookQty:"",
                    ddQty:"",
                    diffQty:"",
                    /* movingAvgPrc:"", */
                    unitCd:"",
                    reasonCont:""
            };


            header = {
                    stockDdDocNo   :$("#sel1StockDdDocNo").val()
                   ,remark         :$("#sel1Remark").val()
                   ,docStatCd      :$("#sel1DocStatCd").val()
                   ,stockLockYn    :$("#sel1StockLockYn").val()
            };

            gridData.dlrCd = $("#dlrCd").val();
            gridData.stockDdDocNo = $("#stockDdDocNo").val();
            gridData.stockDdDocLineNo = $("#stockDdDocLineNo").val();
            gridData.strgeCd = $("#strgeCd").val();
            gridData.locCd = $("#locCd").val();
            gridData.itemCd = $("#itemCd").val();
            gridData.itemStatCd = $("#itemStatCd").val();
            gridData.itemNm = $("#itemNm").val();
            gridData.itemDstinCd = $("#itemDstinCd").val();
            gridData.carlineCd = $("#carlineCd").val();
            gridData.abcInd = $("#abcInd").val();
            /* gridData.lastGrDt = $("#lastGrDt").val(); */
            /* gridData.lastGiDt = $("#lastGiDt").val(); */
            gridData.bookQty = $("#bookQty").val();
            gridData.ddQty = $("#ddQty").val();
            gridData.diffQty = $("#diffQty").val();
            /* gridData.movingAvgPrc = $("#movingAvgPrc").val(); */
            gridData.unitCd = $("#unitCd").val();
            gridData.reasonCont = $("#reasonCont").val();

            /*
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
            */

            /**
            saveData:{
                "insertList":[],
                "updateList":[{"rnum":0,"regUsrId":null,"regDt":null,"updtUsrId":null,"updtDt":null,"dlrCd":"A07AA","stockDdDocNo":"PI20160400006","stockDdDocLineNo":1,"itemStatCd":"REL","strgeCd":"A07AA-01","locCd":"01-BB-20001","itemCd":"252122B000","itemNm":"V型皮带","itemDstinCd":"02","carlineCd":"C9","abcInd":"A2","lastGrDt":"2016-04-12T05:20:21.000Z","lastGiDt":"2016-04-18T00:53:05.000Z","bookQty":200,"ddQty":111,"diffQty":-89,"movingAvgPrc":0,"unitCd":"EA","reasonCont":"부품대여","stockAdjMvtDocYyMm":null,"stockAdjMvtDocNo":null,"stockAdjMvtDocLineNo":0}],
                "deleteList":[],
                "investigationVO":{"stockDdDocNo":"PI20160400006","remark":"","docStatCd":"END","stockLockYn":"N"}
            }
            */


            saveData.updateList.push(gridData);
            saveData.investigationVO = header;
            //saveList.push(gridData);


            setCheckItemList();
            setTimeout(function(){
                $("iframe[name='detailList']").contents().find("input[name='isSave']").each(function(cnt){
                    //var code = $(this).parent().parent().find("span[name='itemCd']").text();
                    var isSaveChecked = this.checked;
                    if(isSaveChecked == false){
                        var dataItem = {};
                        dataItem.stockDdDocNo = $(this).parent().parent().find("input[name='itemLstStockDdDocNo']").val();
                        dataItem.stockDdDocLineNo = $(this).parent().parent().find("input[name='itemLstStockDdDocLineNo']").val();
                        dataItem.strgeCd = $(this).parent().parent().find("input[name='itemLstStrgeCd']").val();
                        dataItem.strgeNm = $(this).parent().parent().find("input[name='itemLstStrgeNm']").val();
                        dataItem.locCd = $(this).parent().parent().find("input[name='itemLstLocCd']").val();
                        dataItem.itemCd = $(this).parent().parent().find("input[name='itemLstItemCd']").val();
                        dataItem.itemStatCd = $(this).parent().parent().find("input[name='itemLstItemStatCd']").val();
                        dataItem.itemStatNm = $(this).parent().parent().find("input[name='itemLstItemStatNm']").val();
                        dataItem.itemNm = $(this).parent().parent().find("input[name='itemLstItemNm']").val();
                        dataItem.bookQty = $(this).parent().parent().find("input[name='itemLstBookQty']").val();
                        dataItem.ddQty = $(this).parent().parent().find("input[name='itemLstDdQty']").val();
                        dataItem.diffQty = $(this).parent().parent().find("input[name='itemLstDiffQty']").val();
                        dataItem.movingAvgPrc = $(this).parent().parent().find("input[name='itemLstMovingAvgPrc']").val();
                        dataItem.reasonCont = $(this).parent().parent().find("input[name='itemLstReasonCont']").val();
                        dataItem.itemDstinCn = $(this).parent().parent().find("input[name='itemLstItemDstinCn']").val();
                        dataItem.carlineCd = $(this).parent().parent().find("input[name='itemLstCarlineCd']").val();
                        dataItem.abcInd = $(this).parent().parent().find("input[name='itemLstAbcInd']").val();
                        dataItem.unitCd = $(this).parent().parent().find("input[name='itemLstUnitCd']").val();

                        contentDetailFromList(dataItem);

                        //contentDetail(code);
                        return false;
                    }
                    contentItemListNonRefresh($("#sel1StockDdDocNo").val());
                    setTimeout(function(){ setCheckItemList();}, 200);

                });
            }, 200);

        }
    });




    //버튼 - 확정
    $("#btnFix").kendoButton({
        click:function(e){

            if(saveData.updateList.length > 0){
                /*
                var data ={
                       "invcVO"  :header
                      ,"invcItemList":saveList
                    };
                */
                //console.log("saveData::"+kendo.stringify(data),paramUrl );
                $.ajax({
                     //url:"<c:url value='/mob/par/stm/investigation/multiInvestigations.do' />"
                     url:"<c:url value='/mob/par/stm/physicalInv/actionPhysicalInv.do' />"

                    //,data:kendo.stringify(data)
                    ,data:kendo.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {

                        if (result === true) {
                            //mob.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");
                            mob.notification.info("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");

                            contentList();
                            //saveData = [];
                        } else {
                            console.log('errorResult:',result);
                            if(result === 0){
                                //mob.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.modifyFailedParam' arguments='${stockDdDoc}'/>");
                                mob.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.modifyFailedParam' arguments='${stockDdDoc}'/>");
                            }
                        }
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
        else if ($("#content_detail").css("display") == "block") { contentItemListNonRefresh($("#sel1StockDdDocNo").val()); setTimeout(function(){ setCheckItemList();}, 1000);}

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

  $("#sRegDtFr").val(minYY+"-"+minMM+"-"+minDD);
  $("#sRegDtTo").val(frYY+"-"+frMM+"-"+frDD);
  */

  $("#sRegDtFr").val(chgServerDate2Str(sevenDtBf));
  $("#sRegDtTo").val(chgServerDate2Str(toDt));
}

//부품리스트 보기
function contentItemList(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#selStockDdDocNo").val(key);
  $("#detailList").attr("src", "<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemList.do' />");

  //saveList = [];
}


//부품리스트 보기(리스트에서 클릭할때)
function contentItemListFromList(dataItem) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#selStockDdDocNo").val(dataItem.stockDdDocNo);
  $("#detailList").attr("src", "<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemList.do' />");

    //saveList = [];

    if(dataItem != null){
        partsJs.validate.groupObjAllDataSet(dataItem);
        gCrud = 'U';
    }

}


//부품리스트 보기
function contentItemListNonRefresh(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  // 부품리스트 조회
  $("#sel1StockDdDocNo").val(key);

}


//상세페이지 보기
function contentDetail(key) { // 미사용
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/mob/par/stm/investigation/selectApproveReqInvestigations.do' />",
            data:JSON.stringify({ stockDd:key, sMobisInvcNo:$("#sInvcDocNo").val()          }),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                alert(error);
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

    $("#grLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[key]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });
}


//상세페이지 보기
function contentDetailFromBarcode(itemCd) {

    if(itemCd != null && itemCd != ""){
        var dataItem = {};
        $("iframe[name='detailList']").contents().find("input[name='isSave']").each(function(cnt){
            var code = $(this).parent().parent().find("span[name='itemCd']").text();
            if(code == itemCd){
                dataItem.stockDdDocNo = $(this).parent().parent().find("input[name='itemLstStockDdDocNo']").val();
                dataItem.stockDdDocLineNo = $(this).parent().parent().find("input[name='itemLstStockDdDocLineNo']").val();
                dataItem.strgeCd = $(this).parent().parent().find("input[name='itemLstStrgeCd']").val();
                dataItem.strgeNm = $(this).parent().parent().find("input[name='itemLstStrgeNm']").val();
                dataItem.locCd = $(this).parent().parent().find("input[name='itemLstLocCd']").val();
                dataItem.itemCd = $(this).parent().parent().find("input[name='itemLstItemCd']").val();
                dataItem.statCd = $(this).parent().parent().find("input[name='itemLstItemStatCd']").val();
                dataItem.itemStatCd = $(this).parent().parent().find("input[name='itemLstItemStatNm']").val();
                dataItem.itemStatNm = $(this).parent().parent().find("input[name='itemLstItemNm']").val();
                dataItem.lstItemNm = $(this).parent().parent().find("input[name='itemLstBookQty']").val();
                dataItem.bookQty = $(this).parent().parent().find("input[name='itemLstDdQty']").val();
                dataItem.ddQty = $(this).parent().parent().find("input[name='itemLstDiffQty']").val();
                dataItem.diffQty = $(this).parent().parent().find("input[name='itemLstMovingAvgPrc']").val();
                dataItem.movingAvgPrc = $(this).parent().parent().find("input[name='itemLstReasonCont']").val();
                dataItem.itemDstinCn = $(this).parent().parent().find("input[name='itemLstItemDstinCn']").val();
                dataItem.carlineCd = $(this).parent().parent().find("input[name='itemLstCarlineCd']").val();
                dataItem.abcInd = $(this).parent().parent().find("input[name='itemLstAbcInd']").val();
                dataItem.unitCd = $(this).parent().parent().find("input[name='itemLstUnitCd']").val();
                return false;
            }
        });
        contentDetailFromList(dataItem);
    }
}


//상세페이지 보기
function contentDetailFromList(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem != null){
        partsJs.validate.groupObjAllDataSet(dataItem);
        gCrud = 'U';
    }

    var itemList = [];
    itemList.push(dataItem.itemCd);
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

  $("#grLocCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:locationListObj[dataItem.itemCd]
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
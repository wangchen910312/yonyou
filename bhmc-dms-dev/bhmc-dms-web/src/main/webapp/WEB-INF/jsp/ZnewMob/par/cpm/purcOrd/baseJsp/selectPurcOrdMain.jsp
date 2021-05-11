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
    <c:import url="/WEB-INF/jsp/ZnewMob/par/cpm/purcOrd/listJsp/selectPurcOrdList.jsp"></c:import>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.purcOrdListSearch" /><!-- 오더현황 조회  --></h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sPurcOrdTp" style="width:100%" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sPurcOrdNo" style="width:100%"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.supplyCd" /><!-- 업체코드 --></th>
                        <td>
                            <input id="sBpNm" type="hidden"/>
                            <div class="f_text"><input id="sBpCd" type="text" class="form_comboBox" disabled/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sPurcRegDtFr" style="width:140px; background-color:#ffffff" />
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sPurcRegDtTo" style="width:140px; background-color:#ffffff" />
                            </div>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td class="required_area">
                            <div class="f_text"><input id="sPurcOrdStatCd" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='par.lbl.ordRegId' /><!-- 오더신청자 --></th>
                        <td>
                            <div class="f_item01">
                                <input type="search" id="sRegUsrNm" name="sRegUsrNm" value="" disabled>
                                <span class="search"  id="searchUsrId"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                            </div>
                            <input type="hidden" id="sRegUsrId" name="sRegUsrId" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.trsfType" /><!-- 운송유형 --></th>
                        <td>
                            <div class="f_text"><input id="sTrsfTp" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.ordTotAmt" /><!-- 오더총금액 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%"><input type="text" id="sTotPurcAmtFr" onblur="getCommaData(this.value,'01')"/></div>
                            <span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%"><input type="text" id="sTotPurcAmtTo" onblur="getCommaData(this.value,'02')"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <dms:access viewId="VIEW-D-12714" hasPermission="${dms:getPermissionMask('READ')}">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /><!-- 초기화 --></span></div>
            </dms:access>
            <dms:access viewId="VIEW-D-12713" hasPermission="${dms:getPermissionMask('READ')}">
            <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
        <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.lbl.purcItemStatCd" /><!-- 구매오더 상태 --><!-- <span id="detailPageNo"></span> --></h2>
            </div>
            <div class="co_view">
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.confirmCnt" /><!-- 확정건수 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="confirmParCnt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.confirmQty" /><!-- 확정수량 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="confirmParQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.ordAmt" /><!-- 오더금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="purcParAmt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="purcRegDt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.backOrderCnt" /><!-- B/O건수 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="boParCnt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.backOrderQty" /><!-- B/O수량 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="boParQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.purcItemStatCd" /><!-- 구매오더상태 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="purcItemStatCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더신청자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="regUsrId" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </div>

            <!-- 구매오더 등록정보 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/par/cpm/purcOrd/listJsp/selectPurcOrdStatusList.jsp"></c:import>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>

        </section>
    </div>

    <div class="content_right">
        <section id="contentStatus_detail" class="content_detail" style="display:none">
        <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.title.purcOrdInfo" /><!-- 구매오더 등록정보 --></h2>
            </div>
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody class="detialListData">
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ordTp" /><!-- 오더유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcOrdTp" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcOrdNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- bmp오더번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="bmpOrdNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- //공급업체 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="bpNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='par.lbl.request' /><spring:message code="par.lbl.purcQty" /><!-- 요청구매수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='par.lbl.confirm'/><spring:message code="par.lbl.purcQty" /><!-- 확정구매수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="confirmQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.amendCode" /><!-- 편수코드 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="editCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                         <tr>
                            <th scope="row"><spring:message code="par.lbl.boQty" /><!-- BO수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="boQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.alloc" /><!-- 할당수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="odrAlcQt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.picking" /><!-- 피킹중수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="odrOpicQt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.packing" /><!-- 포장중수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="odrOpacQt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.packEnd" /><!-- 포장완료수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="odrPakdQt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.invcQty" /><!-- 인보이스수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="odrInvQt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="mobisInvcNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.boxNo" /><!-- BOX번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="boxNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.trsfType" /><!-- 운송유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="trsfTp" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.trsfPrsn" /><!-- 운송인 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="trsfUsrId" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.sendOrdDt" /><!-- 발송일자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcDt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.arrvExpcDt" /><!-- 도착예정일자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="arrvDt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.lineNm" /><!-- 구매오더라인번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcOrdLineNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
        </section>
    </div>

</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';


var toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    spyrCdList          = [],
    spyrCdObj           = {},
    purcOrdTpList       = [],
    purcOrdTpObj        = [],
    trsfTpList          = [],
    trsfTpObj           = {},
    purcOrdStatList     = [],
    purcOrdStatObj      = {},
    purcUnitList        = [],
    purcUnitObj         = {},
    prcTpList           = [],
    prcTpObj            = {},
    grStrgeTpList       = [],
    grStrgeTpObj        = {},
    purcItemTpList      = [],
    purcItemTpObj       = {},
    popItemObj          = {},
    checkdIds           = {},
    bpCdList            = [],
    bpCdObj             = {},
    toDate,
    gCrud;

var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}";

toDate = new Date();

grStrgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>
var grStrgeTpMap = dms.data.arrayToMap(grStrgeTpList, function(obj){return obj.cmmCd});


<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
var purcOrdTpMap = dms.data.arrayToMap(purcOrdTpList, function(obj){return obj.cmmCd});

purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
<c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    if("${obj.useYn}" !=='N' ){
        purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var purcOrdStatMap = dms.data.arrayToMap(purcOrdStatList, function(obj){return obj.cmmCd});

bpCdObj[' '] = "";
<c:forEach var="obj" items="${bpCdList}" varStatus="status">
    bpCdList.push({"cmmCd":"${obj.bpCd}", "cmmCdNm":"${obj.bpNm}", "useYn":"Y"});
    bpCdObj["${obj.bpCd}"] = "${obj.bpNm}";
</c:forEach>


<c:forEach var="obj" items="${trsfTpList}" varStatus="status">
    trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 운송유형
changeTrsfTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = trsfTpObj[val];
    }
    return returnVal;
};

$(document).ready(function() {
    // 검색 - 구매오더상태선택
    $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdStatList
        ,select:function(e){
            var selectPurcOrdStatCd = this.dataItem(e.item);

            if(selectPurcOrdStatCd.cmmCd == " "){
                $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
            }
        }
    });


    // 검색 - 오더유형선택
    $("#sPurcOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(purcOrdTpList)
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    // 검색 - 업체코드 임시
    $("#sBpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:bpCdList
       ,index:0
    });

  //운송선택
    $("#sTrsfTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:trsfTpList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    function initPage(){
        $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅
        $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
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
            $(this).data("kendoExtMaskedDatePicker").value('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").value(new Date(chkDateValue.resultMsg));
        }
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='par.menu.partOrderMgr' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    //초기조건 임시 업체코드:BMP
    $("#sBpCd").data("kendoExtDropDownList").value("A07C001");
    var sBpCd = $("#sBpCd").data("kendoExtDropDownList");

    $("#sPurcRegDtFr").val(chgServerDate2Str(sevenDtBf));
    $("#sPurcRegDtTo").val(chgServerDate2Str(toDt));

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sPurcOrdTp").data("kendoExtDropDownList").value("");
            $("#sPurcOrdNo").val("");
            $("#sBpCd").data("kendoExtDropDownList").value("");
            $("#sPurcRegDtFr").val(chgServerDate2Str(sevenDtBf));
            $("#sPurcRegDtTo").val(chgServerDate2Str(toDt));
            $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value("");
            $("#sRegUsrNm").val("");
            $("#sRegUsrId").val("");
            $("#sTrsfTp").data("kendoExtDropDownList").value("");
            $("#sTotPurcAmtFr").val("");
            $("#sTotPurcAmtTo").val("");
        }
    });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initList();
            listData.read();
        }
    });
});

var detailPageNum;
var selectedBpCd;
var selectedPurcOrdNoFromOrdList;

//상세페이지 보기
function contentDetail(obj) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    $("#contentStatus_detail").css("display","none");

    $.ajax({
        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />"
        ,data:JSON.stringify({sPurcOrdNo:obj.purcOrdNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
        }
        ,success:function(result) {
            if(result!=null && result != ""){
                $("#confirmParCnt").val(parseInt(result.confirmParCnt));
                $("#confirmParQty").val(parseInt(result.confirmParQty));

                $("#purcParAmt").val(kendo.toString(result.totTaxDdctAmt, 'n2')+" / "+kendo.toString(result.totPurcAmt, 'n2'));
                $("#purcRegDt").val(chgDate2Str(result.purcRegDt));

                $("#boParCnt").val(parseInt(result.boParCnt));
                $("#boParQty").val(parseInt(result.boParQty));

                $("#purcItemStatCd").val(purcOrdStatObj[result.purcOrdStatCd]);
                $("#regUsrId").val(result.regUsrNm);                                //jhg 수정
            }else{
            }
        }
    });

    selectedBpCd                        = obj.bpCd;
    selectedPurcOrdNoFromOrdList         = obj.purcOrdNo;

    subListData.read();
}

function moveStatusDetail(item){
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#contentStatus_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#purcOrdTp").val(purcOrdTpObj[item.purcOrdTp]);
    $("#purcOrdNo").val(item.purcOrdNo);
    $("#bmpOrdNo").val(item.bmpOrdNo);
    $("#bpNm").val(item.bpNm);
    $("#itemNm").val(item.itemNm);
    $("#purcQty").val(item.purcQty);
    $("#confirmQty").val(item.confirmQty);
    $("#editCd").val(item.editCd);
    $("#boQty").val(item.boQty);
    $("#odrAlcQt").val(item.odrAlcQt);
    $("#odrOpicQt").val(item.odrOpicQt);
    $("#odrOpacQt").val(item.odrOpacQt);
    $("#odrPakdQt").val(item.odrPakdQt);
    $("#odrInvQt").val(item.odrInvQt);
    $("#mobisInvcNo").val(item.mobisInvcNo);
    $("#boxNo").val(item.boxNo);
    $("#trsfTp").val(changeTrsfTp(item.trsfTp));
    $("#trsfUsrId").val(item.trsfUsrId);
    $("#invcDt").val(item.invcDt);
    $("#arrvDt").val(item.arrvDt);
    $("#purcOrdLineNo").val(item.purcOrdLineNo);
}

function getCommaData(value,type){
    if(type=="01"){
        $("#sTotPurcAmtFr").val(commaPointPlus(value));
    }else if(type=="02"){
        $("#sTotPurcAmtTo").val(commaPointPlus(value));
    }
}

var userSearchPopupWin;
$("#searchUsrId").click(function(){
    userSearchPopupWin = mob.window.popup({
      windowId:"userSearchPopupWin"
      ,content:{
          url:"<c:url value='/mob/cmm/sci/commonPopup/selectUserPopup.do'/>"
          , data:{
              "autoBind":false
              ,"usrNm":""
              ,"callbackFunc":function(data){
                  if(data != undefined){
                      $("#sRegUsrId").val(data.usrId);
                      $("#sRegUsrNm").val(data.usrNm);
                  }
              }
          }
      }

    });
});

</script>
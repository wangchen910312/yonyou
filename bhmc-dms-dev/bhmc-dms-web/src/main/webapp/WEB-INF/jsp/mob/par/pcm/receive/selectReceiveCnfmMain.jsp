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

        <div class="listarea">
            <div class="listhead dlistitem" style="padding-right:10px;">
                <span style="width:50%"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></span>
                <span style="width:50%; text-align:right;"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></span>
                <span class="clboth" style="width:35%"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></span>
                <span style="width:35%; text-align:center;"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></span>
                <span style="width:30%; text-align:right;"><spring:message code="par.lbl.bpCd" /><!-- 업체코드 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
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
                        <th scope="row"><spring:message code="par.lbl.invcTp" /><!-- INVOICE유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sInvcTp" class="form_comboBox" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sMobisInvcNo" class="form_input" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                         <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- 송장일자 --></th>
                         <td class="f_term">
                             <div class="f_item01">
                                 <input type="text" id="sInvcDtFr" style="width:140px" class="" readOnly/>
                                 <span class="date" onclick="calpicker('sInvcDtFr');">날짜선택</span>
                             </div><span class="termtext"> ∼</span>
                             <div class="f_item01">
                                 <input type="text" id="sInvcDtTo" style="width:140px" class="" readOnly/>
                                 <span class="date" onclick="calpicker('sInvcDtTo');">날짜선택</span>
                             </div>
                         </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 업체코드 --></th>
                        <td>
                            <div class="f_text"><input id="sBpCd" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td>
                            <div class="f_text"><input id="sInvcStatCd" type="text" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 생성일자 --></th>
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
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <dms:access viewId="VIEW-D-12694" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /><!-- 초기화 --></span></div>
            </dms:access>
            <dms:access viewId="VIEW-D-12693" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
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
                    <span class="clboth" style="width:50%"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.statNm" /><!--  상태 --></span>
                </div>
                <iframe id="detailList" name="detailList" border="1" frameborder="0" width="100%" height="300px"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub1"><span></span></div>
                <input type="hidden" id="sInvcDocNo" value=""/>
            </div>
            <div class="btnfixed">
                <div class="con_btnarea btncount2">
                    <div style="width:20%;"><em style="position:relative;top:8px;font-size:14px;"><spring:message code="mob.lbl.barcode" /><!-- 바코드 --></em></div>
                    <div style="width:40%;margin-bottom:10px;" class="al">
                        <div class="f_text f_barc"><input type="text" id="barcode" name="barcode" /></div>
                    </div>
                    <dms:access viewId="VIEW-D-12692" hasPermission="${dms:getPermissionMask('READ')}">
                        <div style="width:20%; padding:0 2px;"><span class="btnd1" id="btnBarcodeConfirm"><spring:message code='global.btn.confirm' /><!-- 확인 --></span></div>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12691" hasPermission="${dms:getPermissionMask('READ')}">
                        <div style="width:20%; padding-left:2px;"><span class="btnd1" id="btnBarcodeScan"><spring:message code='mob.lbl.scan' /><!-- 스캔 --></span></div>
                    </dms:access>
                    <div style="width:50%;"><span class="btnd1" id="btnItemListClose" ><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
                    <dms:access viewId="VIEW-D-12689" hasPermission="${dms:getPermissionMask('READ')}">
                        <div style="width:50%;padding-right:2px;"><span class="btnd1" id="btnFix"><spring:message code='par.lbl.confirm' /><!-- 확정 --></span></div>
                    </dms:access>
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
            <input id="invcAmt" type="hidden" /> <!-- 송장금액 -->
            <input id="purcOrdLineNo" type="hidden" /> <!-- 구매오더라인번호 -->

            <!--  9/27 added -->
            <input id="boxNo" type="hidden" />
            <input id="bmpOrdNo" type="hidden" />
            <input id="ordRegUsrId" type="hidden" />
            <input id="purcOrdLineDetlNo" type="hidden" />
            <input id="invcUnitCd" type="hidden" />
            <input id="invcTp" type="hidden" />
            <input id="invcDt" type="hidden" />
            <input id="invcStatCd" type="hidden" />
            <input id="invcTargetQty" type="hidden" />
            <input id="dcRate" type="hidden" />
            <input type="hidden" id="confirmDt"  />
            <input type="hidden" id="arrvDt"  />
            <input type="hidden" id="purcOrdTp"  />
            <input type="hidden" id="dlPdcCd"  />



            <div class="formarea">
                <table  class="flist01 form2">
                    <caption><spring:message code="par.title.partReceiveInfo" /><!-- 부품입고정보 --></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일자 --></th>
                            <td>
                            <div class="f_text f_disabled" >
                                <input type="text" id="purcRegDt" class="" readOnly/>
                                <!-- <span class="date" onclick="calpicker('purcRegDt');">날짜선택</span> -->
                            </div>
                        </td>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcOrdNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
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
                            <th scope="row"><spring:message code="par.lbl.invcQty" /><!-- 송장수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcQty" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcQty" /><!-- 구매수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcQty" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="grQty" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.gapQty" /><!-- 차이수량 --></th>
                            <td>
                                <div class="f_text"><input id="compareQty" type="number" placeholder="" onblur="calcul_Qty();" onkeypress='numValidate(event)' onfoucs="calcul_Qty2()" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.reasonCont" /><!-- 차이사유 --></th>
                            <td>
                                <div class="f_text"><input id="reqCont" type="text" placeholder="" /></div>
                            </td>
                        </tr>
                        <%-- <tr>
                            <th scope="row"><spring:message code="par.lbl.unit" /><!-- 단위 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcUnitCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code='par.lbl.grStrgeCd' /><!-- 입고창고 --></th>
                            <td>
                                <div class="f_text"><input id="grStrgeCd" type="text" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <%-- <tr>
                            <th scope="row"><spring:message code='global.lbl.locationCd' /><!-- Location --></th>
                            <td>
                                <div class="f_text"><input id="grLocCd" type="text" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code="par.title.grItemPrice" /><!-- 입고가격 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcPrc" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.title.grItemPrice" />(<spring:message code="par.lbl.taxSprt" />)<!-- 입고가격(세금별도) --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="taxDdctPrc" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.grAmt" /><!-- 입고금액(세금제외) --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcAmt2" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.grAmtTax" /><!-- 입고금액 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invcTotAmt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <%-- <tr>
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
                        </tr> --%>
                    </tbody>
                </table>
            </div>

            <div class="con_btnarea btncount2">
                <dms:access viewId="VIEW-D-12688" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span id="btnNextScan" class="btnd1"><spring:message code='mob.btn.nextScan' /><!-- 다음스캔 --></span></div>
                </dms:access>
                <dms:access viewId="VIEW-D-12687" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span id="btnSave" class="btnd1"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
                </dms:access>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

</section>


<!-- script -->
<script>
var recviedDataArr;

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
    invcStatList        = [],
    invcStatObj         = {},
    bpCdList            = [],
    bpCdObj             = {},
    invcTpList          = [],
    invcTpObj           = {},
    toDate,
    gCrud;

toDate = new Date();

var __compareQtyArr=[];

grStrgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>
var grStrgeTpMap = dms.data.arrayToMap(grStrgeTpList, function(obj){return obj.cmmCd});

claimTpObj[' '] = "";
<c:forEach var="obj" items="${clTpList}" varStatus="status">
    claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    claimTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

claimTargetTpObj[' '] = "";
<c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
    claimTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    claimTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//송장유형코드
invcTpObj[' '] = "";
<c:forEach var="obj" items="${invcTpList}" varStatus="status">
    invcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    invcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
var invcTpMap = dms.data.arrayToMap(invcTpList, function(obj){return obj.cmmCd});

//송장상태코드
invcStatObj[' '] = "";
<c:forEach var="obj" items="${invcStatList}" varStatus="status">
    invcStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    invcStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
var invcStatMap = dms.data.arrayToMap(invcStatList, function(obj){return obj.cmmCd});

// 업체코드
bpCdObj[' '] = "";
<c:forEach var="obj" items="${bpCdList}" varStatus="status">
    bpCdList.push({"cmmCd":"${obj.bpCd}", "cmmCdNm":"${obj.bpNm}", "useYn":"Y"});
    bpCdObj["${obj.bpCd}"] = "${obj.bpNm}";
</c:forEach>
var bpCdMap = dms.data.arrayToMap(bpCdList, function(obj){return obj.cmmCd});



function getBarcodeNum(code){ // js (앱에서 리턴되는 값 받는 스크립트)
    $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
        if(code == $(this).parent().parent().find("span[name='itemCd']").text()){
            contentDetail3(code);
        }
        //code = $(this).parent().parent().find("span[name='itemCd']").text();
    });
};


var setCheckItemList = function(){
    setTimeout(function(){
        $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
            for(var i=0; i<saveList.length; i++){
                /* var _key = $(this).parent().parent().find("input[name='purcOrdNo']").val();
                if(_key == saveList[i].purcOrdNo){
                    $("#detailList").contents().find("input[name='isSave']")[cnt].checked = true;
                } */
                var _key = $(this).parent().parent().find("span[name='itemCd']").text();
                if(_key == saveList[i].itemCd){
                    $("#detailList").contents().find("input[name='isSave']")[cnt].checked = true;
                }
            }
        });
    }, 200);
};
var setCheckItemList2 = function(){
    setTimeout(function(){
        $("#detailList").contents().find("input[name='isSave']").each(function(cnt){
            for(var i=0; i<saveList.length; i++){
                var code = $(this).parent().parent().find("span[name='itemCd']").text();
                if(code == saveList[i].itemCd){
                    $("#detailList").contents().find("input[name='isSave']")[cnt].checked = true;
                }
            }
        });
    }, 200);
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
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        ,dataSource:claimTargetTpList
        ,index:0
    });

    //송장유형 선택
    $("#sInvcTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource : dms.data.cmmCdFilter(invcTpList)
       ,index:0
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
   });

    //송장상태 선택
    $("#sInvcStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource : dms.data.cmmCdFilter(invcStatList)
       ,index:0
       ,value:'02'
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
   });
    $("#sInvcStatCd").data("kendoExtDropDownList").enable(false);

    $("#sBpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:bpCdList
       ,index:0
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });
    $("#sBpCd").data("kendoExtDropDownList").enable(false);

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
    }

    // 타이틀
    $("#header_title").html("<spring:message code='par.menu.partInStockConfirm' />");
    $("#header_title").on("click", moveSearch);
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    $("#sInvcDtFr").val(chgServerDate2Str(sevenDtBf));
    $("#sInvcDtTo").val(chgServerDate2Str(toDt));

    var sBpCd = $("#sBpCd").data("kendoExtDropDownList");
    sBpCd.value(sessionBpCd);

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/pcm/receive/selectReceiveCnfmList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sInvcTp = $("#sInvcTp").data("kendoExtDropDownList");
            var sMobisInvcNo = $("#sMobisInvcNo");
            var sInvcDtFr = $("#sInvcDtFr");
            var sInvcDtTo = $("#sInvcDtTo");
            var sBpCd = $("#sBpCd").data("kendoExtDropDownList");
            var sInvcStatCd = $("#sInvcStatCd");
            var sRegDtFr = $("#sRegDtFr");
            var sRegDtTo = $("#sRegDtTo");
            if(sBpCd.value() =="" || sBpCd.value() == null){
                mob.notification.info("<spring:message code='par.lbl.bpCd' var='sBpCd' /><spring:message code='par.info.issueCheckMsg' arguments='${sBpCd}' />");
            }else{
                contentList();
            }
        }
    });


    // 버튼 - 저장
    $("#btnSave").click(function(){
        var compareQty = $("#compareQty").val();
        var numYN = checkOnlyNum(compareQty);

        if(!compareQty || !numYN) {
            $("#compareQty").val("");
            mob.notification.warning("<spring:message code='par.lbl.gapQty' var='compareQty' /><spring:message code='global.err.checkQtyParam' arguments='${compareQty}'/>");
            return false;
        }
        confirmOpen(confirmMsgSave,'doSave',y,n);
    });

    function checkOnlyNum(value) {
        if(!($.isNumeric(value))) {
            return false;
        }else{
            return true;
        }
    }


    //버튼 - 입고확정
    $("#btnFix").click(function(){
        if(saveList.length > 0){

            header = {
                    /*
                    bpCd            :$("#sBpCd").val()
                   ,mobisInvcNo     :$("#sMobisInvcNo").val()
                   ,arrvDt          :$("#arrvDt").val()
                   */
                    bpCd            :$("#bpCd").val()
                    ,mobisInvcNo     :$("#mobisInvcNo").val()
                    ,invcDocNo       :$("#invcDocNo").val()
                    ,arrvDt          :$("#arrvDt").val()
            };

            var data ={
                   "invcVO"  :header
                  ,"invcItemList":saveList
                };
            mob.loading.show();
            setTimeout(function(){
                console.log('kendo.stringify(data):',kendo.stringify(data));
                $.ajax({
                     url:"<c:url value='/par/pcm/invc/updateReceiveCnfmForMobile.do' />"
                    ,data:kendo.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        if (result.resultYn) {
                            $("#sMobisInvcNo").val("");
                            mob.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                            contentList();
                        } else {
                            if(result === 0){
                                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                            }
                        }
                        mob.loading.hide();
                    }
                    ,error:function(jqXHR,status,error) {
                        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        mob.loading.hide();
                    }
                });
            }, 200);
        }else{
             // 선택값이 없습니다.
            mob.notification.warning("<spring:message code='global.info.unselected' />");
            return false;
        }
    });


    //버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") {
            goMain();
        }
        else if ($("#content_search").css("display") == "block") {
            contentList();
        }
        else if ($("#content_itemList").css("display") == "block") {
            $("#sMobisInvcNo").val("");
            contentList();
        }
        else if ($("#content_detail").css("display") == "block") {
            contentItemListNonRefresh($("#sInvcDocNo").val());
            setCheckItemList();
        }
    });

  //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            //$("#content_search input").val("");

            $("#sInvcTp").data("kendoExtDropDownList").value("");
            $("#sMobisInvcNo").val("");
            $("#sInvcDtFr").val(chgServerDate2Str(sevenDtBf));
            $("#sInvcDtTo").val(chgServerDate2Str(toDt));
            $("#sRegDtFr").val("");
            $("#sRegDtTo").val("");

        }
    });

    // 버튼 - 바코드 확인
    $("#btnBarcodeConfirm").click(function(){
        setCheckItemList2();
        if($("#btnBarcodeConfirm").hasClass("disabled")){
            return false;
        }
        checkBarcode();
        //contentDetail3($("#barcode").val());


    });

    $("#btnBarcodeScan").click(function(){
        if($("#btnBarcodeScan").hasClass("disabled")){
            return false;
        }
        scanBarcode();
    });

    $("#btnNextScan").click(function(){
        scanBarcode();
    });

    // 버튼 - 부품리스틑 닫기 버튼 클릭시
    $("#btnItemListClose").click(function(){
        contentList();
    });


    $("#barcode").keyup(function(e){
        if(e.keyCode == 120){ // pda 바코드 스캔키 (노란색버튼)
            var barcode = "";
            barcode = $("#barcode").val();
            //alert("keyup - barcode=" + barcode);
            setTimeout(function(){
                changeBarCode(e.keyCode);
            }, 500);
        }
        /*
        if(e.keyCode == 51){ // 테스트 '3'버튼 클릭시 커밋날자 alert
            alert('keyup - 1013');
        }
        */
    });

    $("#compareQty").focusin(function(){
        if(Number($("#compareQty").val()) == 0){
            $("#compareQty").val("");
        }
    });


});


function changeBarCode(keyCode){
    //alert('changeBarCode start');
    var barcode = $("#barcode").val();
    if($("#btnBarcodeConfirm").hasClass("disabled")){
        return false;
    }
    checkBarcode();
}


function fnSetLocCdObj(pItemList){
    var header = {
            sItemCdLst       :pItemList
    };
    $.ajax({
        url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
       ,data:kendo.stringify(header)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,success:function(result) {
           if(result.total > 0){
               for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                   if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                       if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){

                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }else{
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }
                   }else{
                       locationListObj[result.data[i].itemCd] = {};
                       locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                       locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                   }
                   if(!locationObj.hasOwnProperty(result.data[i].strgeCd)){
                       locationObj[result.data[i].strgeCd] = {};
                       locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                   }else{
                       if(!locationObj[result.data[i].strgeCd].hasOwnProperty(result.data[i].locCd)){
                           locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                       }
                   }
               }
           }
       }
       ,error:function(jqXHR,status,error) {
           mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           return false;
       }
   });
}


function checkBarcode(){
    var str = $("#barcode").val();
    var curCharLen = 0;
    var spaceCnt = 0;
    //두번째 공백 위치 구하기
    var secondSpaceDigit = str.length;
    for(var i =0 ; i <str.length; i++){
        if(' ' == str.charAt(i)){
            spaceCnt = spaceCnt + 1;
            if(spaceCnt == 2){
                secondSpaceDigit = i; //두번째 스페이스 위치
                break;
            }
        }
    }
    str = str.substring(0,secondSpaceDigit); //연속해서 공백이 2개이상인 경우 첫번째 공란 이후 정보 삭제
    str = str.replace(/ /g, "");
    if("-" == str.substring(5,6)){
        str = str.substring(0,5) + str.substring(6,str.length);
    }
    var isHere=false;
    if(recviedDataArr != null){
        for(var i=0; i<recviedDataArr.length; i++){
            if(recviedDataArr[i].itemCd==str){
                isHere=true;
            }
        }
    }
    if(isHere){
        $("#barcode").val(str);
    }else{
        mob.notification.warning("<spring:message code='par.lbl.itemCd'/>:"+str+"<br><spring:message code='global.info.nodata'/>");
        $("#barcode").val("");
    }
}


function scanBarcode(){
    var userAgent = navigator.userAgent.toLowerCase();
    if(userAgent.match(/iphone|ipod|ipad/)){
        document.location='bhmccp://openBarcodeReader?type=etc&return_func=getBarcodeNum';
    }else{
        try{
            window.bhmccp.openBarcodeReader('etc', 'N','getBarcodeNum');
        }catch(e){
        }
    }
}


function doSave(){
    var gridData = {
            /*
            rnum : "",
            regUsrId : "",
            regDt : "",
            updtUsrId : "",
            updtDt : "",
            rnum : "",
            */

        dlrCd:"", // 딜러코드 String
        invcDocNo:"", // 송장문서번호 String
        invcDocLineNo:null, // 송장문서라인번호 int
        mobisInvcNo:"", // 모비스송장번호 String
        mobisInvcLineNo:null, // 모비스송장라인번호 int
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
        invcTotAmt:null, // 송장총금액 Double
        debitCreditDstinCd:"", // 차변대변구분코드 String
        refInvcDocNo:0, // 참조송장문서번호 String
        refInvcDocLineNo:"", // 참조송장문서라인번호 int
        invcGrDt:"", // 송장입고일자 Date
        invcDt:"", // INVOICE일자 Date
        dlPdcCd:"", // 배송PDC코드 String
        grStrgeCd:"", // 입고창고코드 String
        grStrgeNm:"", // 입고창고명 String
        //grLocCd:"", // 입고Location String
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

        //0927 added
        ,boxNo:"",
        bmpOrdNo:"",
        ordRegUsrId:"",
        purcOrdLineDetlNo:"",
        invcTp:"",
        invcStatCd:"",
        invcTargetQty:"",
        dcRate:"",
        arrvDt:"",
        purcRegDt:""
        ,compareQty:null

        // 1025 add
            /*
        ,invcDstinCd : ""
        ,confirmDt:""
        ,pltCd:""
        ,currCd:""
        ,vatCd:""
        ,remark:""
        ,cancYn:""
        */



    };

    if(dms.string.isEmpty($("#sBpCd").val())){
        //거래처정보는 필수 입력 사항입니다.
        mob.notification.warning("<spring:message code='global.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
        return false;
    }

    gridData.dlrCd = $("#dlrCd").val();
    gridData.bpNm = $("#bpNm").val();
    gridData.mobisInvcNo = $("#mobisInvcNo").val();
    gridData.mobisInvcLineNo = Number($("#mobisInvcLineNo").val());
    gridData.itemCd = $("#itemCd").val();
    gridData.itemNm = $("#itemNm").val();
    gridData.invcQty = $("#invcQty").val();
    gridData.invcUnitCd = $("#invcUnitCd").val();
    gridData.grStrgeCd = $("#grStrgeCd").val();
    //gridData.grLocCd = $("#grLocCd").val();
    gridData.claimTp = $("#claimTp").val();
    gridData.claimTargCd = $("#claimTargCd").val();
    gridData.dlBpCd = $("#dlBpCd").val();
    gridData.dlBpNm = $("#dlBpNm").val();
    gridData.claimQty = $("#claimQty").val();
    gridData.reqCont = $("#reqCont").val();
    gridData.invcDocNo = $("#invcDocNo").val();
    gridData.invcDocLineNo = Number($("#invcDocLineNo").val());
    gridData.invcPrc = $("#invcPrc").val();
    gridData.invcAmt = $("#invcAmt").val();
    gridData.purcOrdNo = $("#purcOrdNo").val();
    gridData.purcOrdLineNo = $("#purcOrdLineNo").val();
    gridData.bpCd = $("#bpCd").val();

    // 0927 added
    gridData.boxNo = $("#boxNo").val();
    gridData.bmpOrdNo = $("#bmpOrdNo").val();
    gridData.ordRegUsrId = $("#ordRegUsrId").val();
    gridData.purcOrdLineDetlNo = $("#purcOrdLineDetlNo").val();
    gridData.invcTp = $("#invcTp").val();
    gridData.invcStatCd = $("#invcStatCd").val();
    gridData.invcTargetQty = $("#invcTargetQty").val();
    gridData.dcRate = $("#dcRate").val();
    gridData.arrvDt = $("#arrvDt").val();

    gridData.purcRegDt = chgDate($("#purcRegDt").val());

    gridData.dlPdcCd = $("#dlPdcCd").val();

    gridData.invcDt = chgDate($("#invcDt").val());

    gridData.invcTotAmt = Number($("#invcTotAmt").val());

    gridData.compareQty = Number($("#compareQty").val());


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

    /* if(saveList.length>0){
        for(var i=0; i<saveList.length; i++){
            if(saveList[i].itemCd!=gridData.itemCd){
                saveList.push(gridData);
            }
        }
    }else{
        saveList.push(gridData);
    } */

    for(var i = saveList.length - 1; i >= 0; i--) {
        if(saveList[i].itemCd === gridData.itemCd) {
            saveList.splice(i, 1);
        }
    }
    saveList.push(gridData);

    setCheckItemList();
    setTimeout(function(){
        $("iframe[name='detailList']").contents().find("input[name='isSave']").each(function(cnt){
            var _key = $(this).parent().parent().find("input[name='purcOrdNo']").val();
            var isSaveChecked = this.checked;
            if(isSaveChecked == false){
                //contentDetail2(_key); 이거 있어야 하는데 임시로 삭제합니다 아마도 다시 되살릴 것입니다.!!!  khskhs 되살리면 저장하고 다음 부품으로 넘어간다!!!!
                //return false;
            }
            contentItemListNonRefresh($("#sInvcDocNo").val());
            setTimeout(function(){ setCheckItemList();}, 200);
        });
    }, 200);

    $("#barcode").val("");
    //$("#itemCd").val();

    var __compareQtyObj={itemCd:$("#itemCd").val(),compareQty:$("#compareQty").val(), reqCont:$("#reqCont").val(), grStrgeCd:$("#grStrgeCd").val()};
    for(var i = __compareQtyArr.length - 1; i >= 0; i--) {
        if(__compareQtyArr[i].itemCd === $("#itemCd").val()) {
            __compareQtyArr.splice(i, 1);
        }
    }
    __compareQtyArr.push(__compareQtyObj);

}



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

    //$("#sMobisInvcNo").val("");

    setTimeout(function(){ setMainListHeight();}, 200);
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
//function contentItemList(key) {
function contentItemList(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","block");
    $("#content_detail").css("display","none");

    //$("#sInvcDocNo").val(key);
    //$("#sInvcDocNo").val(dataItem.sInvcDocNo);
    console.log("dataItem.sMobisInvcNo="+dataItem.sMobisInvcNo);
    $("#sMobisInvcNo").val(dataItem.mobisInvcNo);
    mob.loading.show();
    $("#detailList").attr("src", "<c:url value='/mob/par/pcm/receive/selectReceiveCnfmItemList.do' />");
    setMainListHeight();
    saveList = [];
}


//부품리스트 보기
function contentItemListNonRefresh(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_itemList").css("display","block");
  $("#content_detail").css("display","none");

  $("#sInvcDocNo").val(key);
}


$("#detailConfirmBtn").click(function(){
    setTimeout(function(){
        $("#content_list").css("display","none");
        $("#content_search").css("display","none");
        $("#content_itemList").css("display","block");
        $("#content_detail").css("display","none");
    }, 200);
});


//상세페이지 보기
function contentDetail(key) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_itemList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/mob/par/pcm/reveice/selectReceiveCnfmItemDetail.do' />",
            data:JSON.stringify({ sItemCd:key, sMobisInvcNo:$("#sInvcDocNo").val()          }),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            }
        }).done(function(result) {
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            partsJs.validate.groupObjAllDataSet(result);
            gCrud = 'U';
        });
    }

    var itemList = [];
    itemList.push(key);

    fnSetLocCdObj(itemList);

    // 입고로케이션 선택
    /* $("#grLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[key]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    }); */
}


//배송업체 조회팝업
function fnDlBpCdPop(e){
    selectVenderMasterPopupWindow();
}


function selectVenderMasterPopupWindow(){
    venderSearchPopupWin = mob.window.popup({
        windowId:"venderMasterPopup"
        ,width:"100%"
        ,height:"350px"
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



//상세페이지 보기2
function contentDetail2(key, itemCd) {
    if(key == null || key == ""){
        mob.notification.error("<spring:message code='global.info.noSearchDataMsg' />");
        return false;
    }
    var itemList = [];
    itemList.push(key);
    fnSetLocCdObj(itemList);

    // 입고로케이션 선택
    /* $("#grLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[key]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    }); */

    var isExsit = false;
    console.log("recviedDataArr",recviedDataArr);

    if( key != null && key != 'undefined'){
        for(var i=0; i<recviedDataArr.length; i++){
            if(recviedDataArr[i].purcOrdNo==key && recviedDataArr[i].itemCd==itemCd){
                isExsit = true;

                $("#dlrCd").val(recviedDataArr[i].dlrCd);
                $("#bpCd").val(recviedDataArr[i].bpCd);

                $("#invcDocLineNo").val(recviedDataArr[i].invcDocLineNo);
                $("#purcRegDt").val(chgDate2Str(recviedDataArr[i].purcRegDt));

                $("#purcOrdNo").val(recviedDataArr[i].purcOrdNo);
                $("#mobisInvcNo").val(recviedDataArr[i].mobisInvcNo);
                $("#mobisInvcLineNo").val(recviedDataArr[i].mobisInvcLineNo);

                $("#invcDocNo").val(recviedDataArr[i].invcDocNo);

                $("#itemCd").val(recviedDataArr[i].itemCd);
                $("#itemNm").val(recviedDataArr[i].itemNm);
                $("#invcQty").val(recviedDataArr[i].invcQty);
                $("#purcQty").val(recviedDataArr[i].purcQty);
                $("#grQty").val(recviedDataArr[i].grQty);

                $("#compareQty").val(recviedDataArr[i].invcQty-recviedDataArr[i].grQty);
                $("#reqCont").val(recviedDataArr[i].reqCont);
                $("#grStrgeCd").data("kendoExtDropDownList").value(recviedDataArr[i].grStrgeCd);
                if(__compareQtyArr.length > 0){
                    for(var j=0; j<__compareQtyArr.length; j++){
                        if(itemCd == __compareQtyArr[j].itemCd){
                            $("#compareQty").val(__compareQtyArr[j].compareQty);
                            $("#reqCont").val(__compareQtyArr[j].reqCont);
                            $("#grStrgeCd").data("kendoExtDropDownList").value(__compareQtyArr[j].grStrgeCd);
                            break;
                        }
                    }
                }


                //$("#grLocCd").data("kendoExtDropDownList").value(recviedDataArr[i].grLocCd);
                $("#invcPrc").val(recviedDataArr[i].invcPrc);
                $("#taxDdctPrc").val(recviedDataArr[i].taxDdctPrc);
                $("#invcAmt2").val(recviedDataArr[i].invcAmt);
                $("#invcTotAmt").val(recviedDataArr[i].invcTotAmt);

                // 9/27 added
                $("#boxNo").val(recviedDataArr[i].boxNo);
                $("#bmpOrdNo").val(recviedDataArr[i].bmpOrdNo);
                $("#ordRegUsrId").val(recviedDataArr[i].ordRegUsrId);
                $("#purcOrdLineDetlNo").val(recviedDataArr[i].purcOrdLineDetlNo);
                $("#invcUnitCd").val(recviedDataArr[i].invcUnitCd);
                $("#invcTp").val(recviedDataArr[i].invcTp);
                $("#invcDt").val(recviedDataArr[i].invcDt);
                $("#purcOrdTp").val(recviedDataArr[i].purcOrdTp);
                $("#purcOrdLineNo").val(recviedDataArr[i].purcOrdLineNo);



                $("#invcStatCd").val(recviedDataArr[i].invcStatCd);
                $("#invcTargetQty").val(recviedDataArr[i].invcTargetQty);
                $("#dcRate").val(recviedDataArr[i].dcRate);

                //$("#arrvDt").val(recviedDataArr[i].arrvDt);
                //alert(recviedDataArr[i].arrvDt);



                //$("#arrvDt").val(toDt);

                if(recviedDataArr[i].arrvDt == null){
                    $("#arrvDt").val(chgDateTimeStampKendo(sevenDtBf));
                }else{
                    $("#arrvDt").val(recviedDataArr[i].arrvDt);
                }



                $("#confirmDt").val(recviedDataArr[i].confirmDt);

                $("#dlPdcCd").val(recviedDataArr[i].dlPdcCd);


            }
        }
    }

    if(!isExsit){
        mob.notification.error("<spring:message code='global.info.noSearchDataMsg' />");
        return false;
    }else{
        $("#content_list").css("display","none");
        $("#content_search").css("display","none");
        $("#content_itemList").css("display","none");
        $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    }
}
//상세페이지 보기2
function contentDetail3(key) {
    if(key == null || key == ""){
        mob.notification.error("<spring:message code='global.info.noSearchDataMsg' />");
        return false;
    }
    var itemList = [];
    itemList.push(key);
    fnSetLocCdObj(itemList);

    // 입고로케이션 선택
    /* $("#grLocCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:locationListObj[key]
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    }); */

    var isExsit = false;

    if( key != null && key != 'undefined'){
        for(var i=0; i<recviedDataArr.length; i++){
            if(recviedDataArr[i].itemCd==key){
                isExsit = true;

                $("#dlrCd").val(recviedDataArr[i].dlrCd);
                $("#bpCd").val(recviedDataArr[i].bpCd);
                $("#invcDocLineNo").val(recviedDataArr[i].invcDocLineNo);
                $("#purcRegDt").val(chgDate2Str(recviedDataArr[i].purcRegDt));
                $("#purcOrdNo").val(recviedDataArr[i].purcOrdNo);
                $("#mobisInvcNo").val(recviedDataArr[i].mobisInvcNo);
                $("#mobisInvcLineNo").val(recviedDataArr[i].mobisInvcLineNo);
                $("#invcDocNo").val(recviedDataArr[i].invcDocNo);
                $("#itemCd").val(recviedDataArr[i].itemCd);
                $("#itemNm").val(recviedDataArr[i].itemNm);
                $("#invcQty").val(recviedDataArr[i].invcQty);
                $("#purcQty").val(recviedDataArr[i].purcQty);
                $("#grQty").val(recviedDataArr[i].grQty);
                $("#compareQty").val(recviedDataArr[i].invcQty-recviedDataArr[i].grQty);
                $("#reqCont").val(recviedDataArr[i].reqCont);
                if(__compareQtyArr.length > 0){
                    for(var j=0; j<__compareQtyArr.length; j++){
                        if(key == __compareQtyArr[j].itemCd){
                            $("#compareQty").val(__compareQtyArr[j].compareQty);
                            $("#reqCont").val(__compareQtyArr[j].reqCont);
                            break;
                        }
                    }
                }

                $("#grStrgeCd").data("kendoExtDropDownList").value(recviedDataArr[i].grStrgeCd);
                //$("#grLocCd").data("kendoExtDropDownList").value(recviedDataArr[i].grLocCd);
                $("#invcPrc").val(recviedDataArr[i].invcPrc);
                $("#taxDdctPrc").val(recviedDataArr[i].taxDdctPrc);
                $("#invcAmt2").val(recviedDataArr[i].invcAmt);
                $("#invcTotAmt").val(recviedDataArr[i].invcTotAmt);

                // 9/27 added
                $("#boxNo").val(recviedDataArr[i].boxNo);
                $("#bmpOrdNo").val(recviedDataArr[i].bmpOrdNo);
                $("#ordRegUsrId").val(recviedDataArr[i].ordRegUsrId);
                $("#purcOrdLineDetlNo").val(recviedDataArr[i].purcOrdLineDetlNo);
                $("#invcUnitCd").val(recviedDataArr[i].invcUnitCd);
                $("#invcTp").val(recviedDataArr[i].invcTp);
                $("#invcDt").val(recviedDataArr[i].invcDt);
                $("#purcOrdTp").val(recviedDataArr[i].purcOrdTp);
                $("#purcOrdLineNo").val(recviedDataArr[i].purcOrdLineNo);



                $("#invcStatCd").val(recviedDataArr[i].invcStatCd);
                $("#invcTargetQty").val(recviedDataArr[i].invcTargetQty);
                $("#dcRate").val(recviedDataArr[i].dcRate);

                if(recviedDataArr[i].arrvDt == null){
                    $("#arrvDt").val(chgDateTimeStampKendo(sevenDtBf));
                }else{
                    $("#arrvDt").val(recviedDataArr[i].arrvDt);
                }

                $("#confirmDt").val(recviedDataArr[i].confirmDt);

                $("#dlPdcCd").val(recviedDataArr[i].dlPdcCd);


            }
        }
    }

    if(!isExsit){
        mob.notification.error("<spring:message code='global.info.noSearchDataMsg' />");
        return false;
    }else{
        $("#content_list").css("display","none");
        $("#content_search").css("display","none");
        $("#content_itemList").css("display","none");
        $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    }
}

function getDataFromChild(obj){
    recviedDataArr=obj;
    /* for(var i=0; i<tempData.length; i++){
        if(tempData[i].itemCd=="00030689SO"){
            //alert(tempData[i].itemNm);
        }
    } */
}

function calcul_Qty(){

    if(Number($("#grQty").val()) < Number($("#compareQty").val())||$("#compareQty").val() == ""){
        $("#compareQty").val(0);
    }
}

function calcul_Qty2(){

    if(Number($("#compareQty").val()) == 0){
        $("#compareQty").val("");
    }
}

</script>

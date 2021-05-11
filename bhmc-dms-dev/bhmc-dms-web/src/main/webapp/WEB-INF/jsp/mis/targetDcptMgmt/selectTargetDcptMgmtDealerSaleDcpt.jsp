<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frmDealerdcpt" id="frmDealerdcpt" action="<c:url value="/mis/tdm/selectTargetDcptMgmtDealerDcptSaleSearch.do"/>">
<%
    String sDealerSaleDcptYyMm = request.getParameter("sDealerSaleDcptYyMm");
    pageContext.setAttribute("sDealerSaleDcptYyMm", sDealerSaleDcptYyMm);
%>
<input type="hidden" id="idccDealRate" name="idccDealRate" value="${targetDcptMgmtSearchVO.idccDealRate}">
<input type="hidden" id="shopDealRate" name="shopDealRate" value="${targetDcptMgmtSearchVO.shopDealRate}">
<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
        <input type="text" id="sDealerSaleDcptYyMm" name="sDealerSaleDcptYyMm" value="${pageContext.request.contextPath}" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtDealerDcptSaleSearch" name="btnTargetDcptMgmtDealerDcptSaleSearch"><spring:message code="global.btn.search" /></button><!-- 딜러분해자료조회  -->
    </div>
    <div class="btn_right">
        <button type="button" class="btn_s" id="btnTempSave"><spring:message code="global.btn.save" /></button><!-- 저장  -->
        <!--<button type="button" class="btn_s"id="btnSave"><spring:message code="global.lbl.complete" /></button> 완료  -->
        <button type="button" class="btn_s" id="btnSetComplete"><spring:message code="global.btn.fix" /></button><!-- 확정  -->
    </div>
</div>
<br>
<c:choose>
<c:when test='${targetDcptMgmtSearchVO.dealerPrefTp == "T" }' >
<div class="table_info table_info_v1">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:40%;">
                <col style="width:40%;">
                <col style="width:8%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row" rowspan="2" class="bot_none"><spring:message code='mis.lbl.monthalltarget' /><br>
                    <input type="text" id="allDealerGoalPrefVal" class="number" name="allDealerGoalPrefVal" style="background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${targetDcptMgmtSearchVO.allDealerGoalPrefVal}" size="20" Readonly></th>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.idcc' /></th>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.market' /></th>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.config' /></th>
                </tr>
                <tr>
                    <td><input type="text" id="idccDealerGoalPrefVal" name="idccDealerGoalPrefVal" style="width:150px;text-align:center;" value="${targetDcptMgmtSearchVO.idccDealerGoalPrefVal}" onkeyup="allDealerGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="shopDealerGoalPrefVal" name="shopDealerGoalPrefVal" style="width:150px;text-align:center;" value="${targetDcptMgmtSearchVO.shopDealerGoalPrefVal}" onkeyup="allDealerGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="dealerPrefTp" class="number" name="dealerPrefTp" style="width:150px;background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${targetDcptMgmtSearchVO.dealerPrefTp}" Readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div class="table_info table_info_v1 mt5">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.monthalltarget' /></th>
                    <th scope="col"><spring:message code='mis.lbl.total' /></th>
                    <th scope="col">2C</th>
                    <th scope="col">B3</th>
                    <th scope="col">BX</th>
                    <th scope="col">C3</th>
                    <th scope="col">C7</th>
                    <th scope="col">C9</th>
                    <th scope="col">CE</th>
                    <th scope="col">CH</th>
                    <th scope="col">CP</th>
                    <th scope="col">DC</th>
                    <th scope="col">DZ</th>
                    <th scope="col">E5</th>
                    <th scope="col">ES</th>
                    <th scope="col">F0</th>
                    <th scope="col">F8</th>
                    <th scope="col">F9</th>
                    <th scope="col">ID</th>
                    <th scope="col">IK</th>
                    <th scope="col">IV</th>
                    <th scope="col">IZ</th>
                    <th scope="col">TE</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.idcc' /><br>
                    <input type="text" id="idccDealerGoalGapVal" name="idccDealerGoalGapVal" style="background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${carResultListVO.idccDealerGoalGapVal}" size="15" Readonly></th>
                    <td><input type="text" id="idccDealerGoalSumVal" name="idccDealerGoalSumVal" style="width:50px;text-align:center;border-style:none;" value="${carResultListVO.idccDealerGoalSumVal}" Readonly></td>
                    <td><input type="text" id="carNo1" name="carNo1" style="width:50px;text-align:center;" value="${carResultListVO.carNo1}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo2" name="carNo2" style="width:50px;text-align:center;" value="${carResultListVO.carNo2}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo3" name="carNo3" style="width:50px;text-align:center;" value="${carResultListVO.carNo3}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo4" name="carNo4" style="width:50px;text-align:center;" value="${carResultListVO.carNo4}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo5" name="carNo5" style="width:50px;text-align:center;" value="${carResultListVO.carNo5}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo6" name="carNo6" style="width:50px;text-align:center;" value="${carResultListVO.carNo6}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo7" name="carNo7" style="width:50px;text-align:center;" value="${carResultListVO.carNo7}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo8" name="carNo8" style="width:50px;text-align:center;" value="${carResultListVO.carNo8}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo9" name="carNo9" style="width:50px;text-align:center;" value="${carResultListVO.carNo9}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo10" name="carNo10" style="width:50px;text-align:center;" value="${carResultListVO.carNo10}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo11" name="carNo11" style="width:50px;text-align:center;" value="${carResultListVO.carNo11}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo12" name="carNo12" style="width:50px;text-align:center;" value="${carResultListVO.carNo12}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo13" name="carNo13" style="width:50px;text-align:center;" value="${carResultListVO.carNo13}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo14" name="carNo14" style="width:50px;text-align:center;" value="${carResultListVO.carNo14}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo15" name="carNo15" style="width:50px;text-align:center;" value="${carResultListVO.carNo15}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo16" name="carNo16" style="width:50px;text-align:center;" value="${carResultListVO.carNo16}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo17" name="carNo17" style="width:50px;text-align:center;" value="${carResultListVO.carNo17}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo18" name="carNo18" style="width:50px;text-align:center;" value="${carResultListVO.carNo18}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo19" name="carNo19" style="width:50px;text-align:center;" value="${carResultListVO.carNo19}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo20" name="carNo20" style="width:50px;text-align:center;" value="${carResultListVO.carNo20}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo21" name="carNo21" style="width:50px;text-align:center;" value="${carResultListVO.carNo21}" onkeyup="idccGoalPrefValChk(this.value);"></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.market' /><br>
                    <input type="text" id="shopDealerGoalGapVal" name="shopDealerGoalGapVal" style="background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${shopResultListVO.shopDealerGoalGapVal}" size="15" Readonly></th>
                    <td><input type="text" id="shopDealerGoalSumVal" name="shopDealerGoalSumVal" style="width:50px;text-align:center;border-style:none;" value="${shopResultListVO.shopDealerGoalSumVal}" Readonly></td>
                    <td><input type="text" id="carNo22" name="carNo22" style="width:50px;text-align:center;" value="${shopResultListVO.carNo22}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo23" name="carNo23" style="width:50px;text-align:center;" value="${shopResultListVO.carNo23}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo24" name="carNo24" style="width:50px;text-align:center;" value="${shopResultListVO.carNo24}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo25" name="carNo25" style="width:50px;text-align:center;" value="${shopResultListVO.carNo25}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo26" name="carNo26" style="width:50px;text-align:center;" value="${shopResultListVO.carNo26}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo27" name="carNo27" style="width:50px;text-align:center;" value="${shopResultListVO.carNo27}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo28" name="carNo28" style="width:50px;text-align:center;" value="${shopResultListVO.carNo28}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo29" name="carNo29" style="width:50px;text-align:center;" value="${shopResultListVO.carNo29}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo30" name="carNo30" style="width:50px;text-align:center;" value="${shopResultListVO.carNo30}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo31" name="carNo31" style="width:50px;text-align:center;" value="${shopResultListVO.carNo31}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo32" name="carNo32" style="width:50px;text-align:center;" value="${shopResultListVO.carNo32}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo33" name="carNo33" style="width:50px;text-align:center;" value="${shopResultListVO.carNo33}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo34" name="carNo34" style="width:50px;text-align:center;" value="${shopResultListVO.carNo34}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo35" name="carNo35" style="width:50px;text-align:center;" value="${shopResultListVO.carNo35}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo36" name="carNo36" style="width:50px;text-align:center;" value="${shopResultListVO.carNo36}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo37" name="carNo37" style="width:50px;text-align:center;" value="${shopResultListVO.carNo37}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo38" name="carNo38" style="width:50px;text-align:center;" value="${shopResultListVO.carNo38}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo39" name="carNo39" style="width:50px;text-align:center;" value="${shopResultListVO.carNo39}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo40" name="carNo40" style="width:50px;text-align:center;" value="${shopResultListVO.carNo40}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo41" name="carNo41" style="width:50px;text-align:center;" value="${shopResultListVO.carNo41}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="carNo42" name="carNo42" style="width:50px;text-align:center;" value="${shopResultListVO.carNo42}" onkeyup="shopGoalPrefValChk(this.value);"></td>
                </tr>
            </tbody>
        </table>
        </div>
        <br>
        <div class="table_info table_info_v1 mt5">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:10%;">
                <col style="width:34%;">
                <col style="width:34%;">

            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.collectcustomertarget' /></th>
                    <th scope="col"><spring:message code='mis.lbl.total' /></th>
                    <th scope="col"><spring:message code='mis.lbl.idcc' /></th>
                    <th scope="col"><spring:message code='mis.lbl.market' /></th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.opinionvalue' /></th>
                    <td><input type="text" id="allCustDealerOpinionvalue" name="allCustDealerOpinionvalue" style="width:150px;text-align:center;border-style:none;" value="${custResultListVO.allCustDealerOpinionvalue}" Readonly></td>
                    <td><input type="text" id="idccCustDealerOpinionvalue" name="idccCustDealerOpinionvalue" style="width:150px;text-align:center;border-style:none;" value="${custResultListVO.idccCustDealerOpinionvalue}" Readonly></td>
                    <td><input type="text" id="shopCustDealerOpinionvalue" name="shopCustDealerOpinionvalue" style="width:150px;text-align:center;border-style:none;" value="${custResultListVO.shopCustDealerOpinionvalue}" Readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.prefVal' /></th>
                    <td><input type="text" id="allCustDealerGoalPrefVal" name="allCustDealerGoalPrefVal" style="width:150px;text-align:center;border-style:none;" value="${custResultListVO.allCustDealerGoalPrefVal}" Readonly></td>
                    <td><input type="text" id="idccCustDealerGoalPrefVal" name="idccCustDealerGoalPrefVal" style="width:150px;text-align:center;" value="${custResultListVO.idccCustDealerGoalPrefVal}" onkeyup="custGoalPrefValChk(this.value);"></td>
                    <td><input type="text" id="shopCustDealerGoalPrefVal" name="shopCustDealerGoalPrefVal" style="width:150px;text-align:center;" value="${custResultListVO.shopCustDealerGoalPrefVal}" onkeyup="custGoalPrefValChk(this.value);"></td>
                </tr>
            </tbody>
        </table>
    </div>
</c:when>
<c:otherwise>
<div class="table_info table_info_v1">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:40%;">
                <col style="width:40%;">
                <col style="width:8%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row" rowspan="2" class="bot_none"><spring:message code='mis.lbl.monthalltarget' /><br>
                    <input type="text" id="allDealerGoalPrefVal" class="number" name="allDealerGoalPrefVal" style="background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${targetDcptMgmtSearchVO.allDealerGoalPrefVal}" size="20" Readonly></th>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.idcc' /></th>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.market' /></th>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.config' /></th>
                </tr>
                <tr>
                    <td>${targetDcptMgmtSearchVO.idccDealerGoalPrefVal}</td>
                    <td>${targetDcptMgmtSearchVO.shopDealerGoalPrefVal}</td>
                    <td>${targetDcptMgmtSearchVO.dealerPrefTp}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div class="table_info table_info_v1 mt5">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
                <col style="width:4%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.monthalltarget' /></th>
                    <th scope="col"><spring:message code='mis.lbl.total' /></th>
                    <th scope="col">2C</th>
                    <th scope="col">B3</th>
                    <th scope="col">BX</th>
                    <th scope="col">C3</th>
                    <th scope="col">C7</th>
                    <th scope="col">C9</th>
                    <th scope="col">CE</th>
                    <th scope="col">CH</th>
                    <th scope="col">CP</th>
                    <th scope="col">DC</th>
                    <th scope="col">DZ</th>
                    <th scope="col">E5</th>
                    <th scope="col">ES</th>
                    <th scope="col">F0</th>
                    <th scope="col">F8</th>
                    <th scope="col">F9</th>
                    <th scope="col">ID</th>
                    <th scope="col">IK</th>
                    <th scope="col">IV</th>
                    <th scope="col">IZ</th>
                    <th scope="col">TE</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.idcc' /><br>
                    <input type="text" style="background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${carResultListVO.idccDealerGoalGapVal}" size="15" Readonly></th>
                    <td>${carResultListVO.idccDealerGoalSumVal}</td>
                    <td>${carResultListVO.carNo1}</td>
                    <td>${carResultListVO.carNo2}</td>
                    <td>${carResultListVO.carNo3}</td>
                    <td>${carResultListVO.carNo4}</td>
                    <td>${carResultListVO.carNo5}</td>
                    <td>${carResultListVO.carNo6}</td>
                    <td>${carResultListVO.carNo7}</td>
                    <td>${carResultListVO.carNo8}</td>
                    <td>${carResultListVO.carNo9}</td>
                    <td>${carResultListVO.carNo10}</td>
                    <td>${carResultListVO.carNo11}</td>
                    <td>${carResultListVO.carNo12}</td>
                    <td>${carResultListVO.carNo13}</td>
                    <td>${carResultListVO.carNo14}</td>
                    <td>${carResultListVO.carNo15}</td>
                    <td>${carResultListVO.carNo16}</td>
                    <td>${carResultListVO.carNo17}</td>
                    <td>${carResultListVO.carNo18}</td>
                    <td>${carResultListVO.carNo19}</td>
                    <td>${carResultListVO.carNo20}</td>
                    <td>${carResultListVO.carNo21}</td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.market' /><br>
                    <input type="text" style="background-color:transparent;text-align:center;font-size:22px;border-style:none;" value="${shopResultListVO.shopDealerGoalGapVal}" size="15" Readonly></th>
                    <td>${shopResultListVO.shopDealerGoalSumVal}</td>
                    <td>${shopResultListVO.carNo22}</td>
                    <td>${shopResultListVO.carNo23}</td>
                    <td>${shopResultListVO.carNo24}</td>
                    <td>${shopResultListVO.carNo25}</td>
                    <td>${shopResultListVO.carNo26}</td>
                    <td>${shopResultListVO.carNo27}</td>
                    <td>${shopResultListVO.carNo28}</td>
                    <td>${shopResultListVO.carNo29}</td>
                    <td>${shopResultListVO.carNo30}</td>
                    <td>${shopResultListVO.carNo31}</td>
                    <td>${shopResultListVO.carNo32}</td>
                    <td>${shopResultListVO.carNo33}</td>
                    <td>${shopResultListVO.carNo34}</td>
                    <td>${shopResultListVO.carNo35}</td>
                    <td>${shopResultListVO.carNo36}</td>
                    <td>${shopResultListVO.carNo37}</td>
                    <td>${shopResultListVO.carNo38}</td>
                    <td>${shopResultListVO.carNo39}</td>
                    <td>${shopResultListVO.carNo40}</td>
                    <td>${shopResultListVO.carNo41}</td>
                    <td>${shopResultListVO.carNo42}</td>
                </tr>
            </tbody>
        </table>
        </div>
        <br>
        <div class="table_info table_info_v1 mt5">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:10%;">
                <col style="width:34%;">
                <col style="width:34%;">

            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="th_bg"><spring:message code='mis.lbl.collectcustomertarget' /></th>
                    <th scope="col"><spring:message code='mis.lbl.total' /></th>
                    <th scope="col"><spring:message code='mis.lbl.idcc' /></th>
                    <th scope="col"><spring:message code='mis.lbl.market' /></th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.opinionvalue' /></th>
                    <td>${custResultListVO.allCustDealerOpinionvalue}</td>
                    <td>${custResultListVO.idccCustDealerOpinionvalue}</td>
                    <td>${custResultListVO.shopCustDealerOpinionvalue}</td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='mis.lbl.prefVal' /></th>
                    <td>${custResultListVO.allCustDealerGoalPrefVal}</td>
                    <td>${custResultListVO.idccCustDealerGoalPrefVal}</td>
                    <td>${custResultListVO.shopCustDealerGoalPrefVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</c:otherwise>
</c:choose>

</form>
<form method="post" name="frmDealerdcptSave" id="frmDealerdcptSave" action="<c:url value="/mis/tdm/insertTargetDcptMgmtDealerDcptSaleSave.do"/>">
<input type="hidden" id="sDealerSaleDcptYyMmSave" name="sDealerSaleDcptYyMmSave">
<input type="hidden" id="idccDealerGoalPrefValSave" name="idccDealerGoalPrefValSave">
<input type="hidden" id="shopDealerGoalPrefValSave" name="shopDealerGoalPrefValSave">
<input type="hidden" id="dealerPrefTpSave" name="dealerPrefTpSave">
<input type="hidden" id="carPro1" name="carPro1"><input type="hidden" id="carPro2" name="carPro2"><input type="hidden" id="carPro3" name="carPro3">
<input type="hidden" id="carPro4" name="carPro4"><input type="hidden" id="carPro5" name="carPro5"><input type="hidden" id="carPro6" name="carPro6">
<input type="hidden" id="carPro7" name="carPro7"><input type="hidden" id="carPro8" name="carPro8"><input type="hidden" id="carPro9" name="carPro9">
<input type="hidden" id="carPro10" name="carPro10"><input type="hidden" id="carPro11" name="carPro11"><input type="hidden" id="carPro12" name="carPro12">
<input type="hidden" id="carPro13" name="carPro13"><input type="hidden" id="carPro14" name="carPro14"><input type="hidden" id="carPro15" name="carPro15">
<input type="hidden" id="carPro16" name="carPro16"><input type="hidden" id="carPro17" name="carPro17"><input type="hidden" id="carPro18" name="carPro18">
<input type="hidden" id="carPro19" name="carPro19"><input type="hidden" id="carPro19" name="carPro19"><input type="hidden" id="carPro20" name="carPro20">
<input type="hidden" id="carPro21" name="carPro21">

<input type="hidden" id="carPro22" name="carPro22"><input type="hidden" id="carPro23" name="carPro23"><input type="hidden" id="carPro24" name="carPro24">
<input type="hidden" id="carPro25" name="carPro25"><input type="hidden" id="carPro26" name="carPro26"><input type="hidden" id="carPro27" name="carPro27">
<input type="hidden" id="carPro28" name="carPro28"><input type="hidden" id="carPro29" name="carPro29"><input type="hidden" id="carPro30" name="carPro30">
<input type="hidden" id="carPro31" name="carPro31"><input type="hidden" id="carPro32" name="carPro32"><input type="hidden" id="carPro33" name="carPro33">
<input type="hidden" id="carPro34" name="carPro34"><input type="hidden" id="carPro35" name="carPro35"><input type="hidden" id="carPro36" name="carPro36">
<input type="hidden" id="carPro37" name="carPro37"><input type="hidden" id="carPro38" name="carPro38"><input type="hidden" id="carPro39" name="carPro39">
<input type="hidden" id="carPro40" name="carPro40"><input type="hidden" id="carPro41" name="carPro41"><input type="hidden" id="carPro42" name="carPro42">
<input type="hidden" id="idccCustDealerGoalPrefValSave" name="idccCustDealerGoalPrefValSave">
<input type="hidden" id="shopCustDealerGoalPrefValSave" name="shopCustDealerGoalPrefValSave">

</form>
<script type="text/javascript">
$(document).ready(function() {

    $("#sDealerSaleDcptYyMm").kendoDatePicker({
        value:"${sysdate}"
       ,start:"year"
       ,depth:"year"
       ,format:"yyyyMM"
       ,parseFormats:["yyyyMM"]
    });

    $("#sDealerSaleDcptYyMm").kendoMaskedTextBox({
        mask:"######"
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    if('${sDealerSaleDcptYyMm}' == "" || '${sDealerSaleDcptYyMm}' == 'null') {
        $("#sDealerSaleDcptYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
    } else {
        $("#sDealerSaleDcptYyMm").val('${sDealerSaleDcptYyMm}');
    }

    var deisplaychk = '${targetDcptMgmtSearchVO.dealerPrefTp}';

    if(deisplaychk == "T"){
        $("#btnTempSave").show();
        $("#btnSave").show();
        $("#btnSetComplete").show();
    } else if(deisplaychk == "S"){
        $("#btnTempSave").hide();
        $("#btnSave").show();
        $("#btnSetComplete").hide();
    } else if(deisplaychk == "C"){
        $("#btnTempSave").hide();
        $("#btnSave").hide();
        $("#btnSetComplete").hide();
    }

    $("#btnTargetDcptMgmtDealerDcptSaleSearch").kendoButton({
        click:function(e) {
            $('#frmDealerdcpt').submit();
           }
    });

    //버튼 - 저장
    $("#btnTempSave").kendoButton({
        click:function(e){

            if($("#idccDealerGoalGapVal").val() < '0' || $("#shopDealerGoalGapVal").val() < '0'){
                alert('채널별 당월 총목표를 확인하세요!');
                return;
            }

            var form = document.frmDealerdcpt;
            var allCustDealerGoalPrefVal = form.allCustDealerGoalPrefVal.value;
            var idccCustDealerGoalPrefVal = form.idccCustDealerGoalPrefVal.value;
            var shopCustDealerGoalPrefVal = form.shopCustDealerGoalPrefVal.value;
            var allDealerGoalPrefVal = form.allDealerGoalPrefVal.value;
            var allCustDealerOpinionvalue = form.allCustDealerOpinionvalue.value;
            var idccCustDealerOpinionvalue = form.idccCustDealerOpinionvalue.value;
            var shopCustDealerOpinionvalue = form.shopCustDealerOpinionvalue.value;
            var idccDealRate = form.idccDealRate.value;
            var shopDealRate = form.shopDealRate.value;

            form.allCustDealerGoalPrefVal.value=parseInt(idccCustDealerGoalPrefVal)+parseInt(shopCustDealerGoalPrefVal);
            form.idccCustDealerOpinionvalue.value=(parseInt(allDealerGoalPrefVal)/parseInt(idccDealRate)).toFixed(2);
            form.shopCustDealerOpinionvalue.value=(parseInt(allDealerGoalPrefVal)/parseInt(shopDealRate)).toFixed(2);
            form.allCustDealerOpinionvalue.value=((parseInt(allDealerGoalPrefVal)/parseInt(idccDealRate)) + (parseInt(allDealerGoalPrefVal)/parseInt(shopDealRate))).toFixed(2);


            if (!confirm($("#sDealerSaleDcptYyMm").val().substr(0,4) + "년 " + $("#sDealerSaleDcptYyMm").val().substr(4,2) + "월 목표를 저장하시겠습니까?")) return;

            $("#idccDealerGoalPrefValSave").val($("#idccDealerGoalPrefVal").val()); $("#shopDealerGoalPrefValSave").val($("#shopDealerGoalPrefVal").val());
            $("#dealerPrefTpSave").val($("#dealerPrefTp").val());   $("#sDealerSaleDcptYyMmSave").val($("#sDealerSaleDcptYyMm").val());

            $("#carPro1").val($("#carNo1").val());    $("#carPro9").val($("#carNo9").val());      $("#carPro17").val($("#carNo17").val());
            $("#carPro2").val($("#carNo2").val());    $("#carPro10").val($("#carNo10").val());    $("#carPro18").val($("#carNo18").val());
            $("#carPro3").val($("#carNo3").val());    $("#carPro11").val($("#carNo11").val());    $("#carPro19").val($("#carNo19").val());
            $("#carPro4").val($("#carNo4").val());    $("#carPro12").val($("#carNo12").val());    $("#carPro20").val($("#carNo20").val());
            $("#carPro5").val($("#carNo5").val());    $("#carPro13").val($("#carNo13").val());    $("#carPro21").val($("#carNo21").val());
            $("#carPro6").val($("#carNo6").val());    $("#carPro14").val($("#carNo14").val());
            $("#carPro7").val($("#carNo7").val());    $("#carPro15").val($("#carNo15").val());
            $("#carPro8").val($("#carNo8").val());    $("#carPro16").val($("#carNo16").val());

            $("#carPro22").val($("#carNo22").val());    $("#carPro30").val($("#carNo30").val());    $("#carPro38").val($("#carNo38").val());
            $("#carPro23").val($("#carNo23").val());    $("#carPro31").val($("#carNo31").val());    $("#carPro39").val($("#carNo39").val());
            $("#carPro24").val($("#carNo24").val());    $("#carPro32").val($("#carNo32").val());    $("#carPro40").val($("#carNo40").val());
            $("#carPro25").val($("#carNo25").val());    $("#carPro33").val($("#carNo33").val());    $("#carPro41").val($("#carNo41").val());
            $("#carPro26").val($("#carNo26").val());    $("#carPro34").val($("#carNo34").val());    $("#carPro42").val($("#carNo42").val());
            $("#carPro27").val($("#carNo27").val());    $("#carPro35").val($("#carNo35").val());
            $("#carPro28").val($("#carNo28").val());    $("#carPro36").val($("#carNo36").val());
            $("#carPro29").val($("#carNo29").val());    $("#carPro37").val($("#carNo37").val());

            $("#idccCustDealerGoalPrefValSave").val($("#idccCustDealerGoalPrefVal").val());
            $("#shopCustDealerGoalPrefValSave").val($("#shopCustDealerGoalPrefVal").val());


            $.ajax({
                type     :'post',
                dataType :'json',
                url      :'<c:url value="/mis/tdm/insertTargetDcptMgmtDealerDcptSaleSave.do" />',
                cache    :false,
                async    :false,
                data     :$('#frmDealerdcptSave').serialize(),
                success:function(data) {

                },
                error:function(xhr, textStatus) {

                },
                complete:function() {
                    alert('저장되었습니다.');
                }
            });

       }
    });

  //버튼 - 저장
    $("#btnSetComplete").kendoButton({
        click:function(e){

            if($("#idccDealerGoalGapVal").val() < '0' || $("#shopDealerGoalGapVal").val() < '0'){
                alert('채널별 당월 판매 총목표를 확인하세요!');
                return;
            }

            if($("#idccCustDealerGoalPrefVal").val() < '0' || $("#idccCustDealerGoalPrefVal").val() < '0'){
                alert('채널별 당월 집객 총목표를 확인하세요!');
                return;
            }


            if (!confirm($("#sDealerSaleDcptYyMm").val().substr(0,4) + "년 " + $("#sDealerSaleDcptYyMm").val().substr(4,2) + "월 목표를 확정하시겠습니까?")) return;

            $.ajax({
                type     :'post',
                dataType :'json',
                url      :'<c:url value="/mis/tdm/updateTargetDcptMgmtDealerDcptSaleComplete.do" />',
                cache    :false,
                async    :false,
                data     :$('#frmDealerdcpt').serialize(),
                success:function(data) {

                },
                error:function(xhr, textStatus) {

                },
                complete:function() {
                    alert('확정되었습니다.');
                    location.reload(true);
                }
            });

       }
    });


});

function allDealerGoalPrefValChk(value){
    if(value){
    var form = document.frmDealerdcpt;
    var idccDealerGoalPrefVal = form.idccDealerGoalPrefVal.value;
    var shopDealerGoalPrefVal = form.shopDealerGoalPrefVal.value;
    var idccDealerGoalSumVal = form.idccDealerGoalSumVal.value;
    var shopDealerGoalSumVal = form.shopDealerGoalSumVal.value;

    //if(idccDealerGoalPrefVal==false){
    //  alert('IDCC 총 목표값을 입력해 주십시요!');
    //  form.idccDealerGoalPrefVal.focus();
    //  return;
    //}
    //if(shopDealerGoalPrefVal==false){
    //    alert('SHOP 총 목표값을 입력해 주십시요!');
    //    form.shopDealerGoalPrefVal.focus();
    //    return;
    //  }
    form.allDealerGoalPrefVal.value=parseInt(idccDealerGoalPrefVal) + parseInt(shopDealerGoalPrefVal);
    form.idccDealerGoalGapVal.value=parseInt(idccDealerGoalPrefVal) - parseInt(idccDealerGoalSumVal);
    form.shopDealerGoalGapVal.value=parseInt(shopDealerGoalPrefVal) - parseInt(shopDealerGoalSumVal);
    }
}

function idccGoalPrefValChk(price){
    if(price){
    var form = document.frmDealerdcpt;
    var idccDealerGoalPrefVal = form.idccDealerGoalPrefVal.value;
    var idccDealerGoalSumVal = form.idccDealerGoalSumVal.value;

    var carNo1 = form.carNo1.value;    var carNo2 = form.carNo2.value;    var carNo3 = form.carNo3.value;    var carNo4 = form.carNo4.value;
    var carNo5 = form.carNo5.value;    var carNo6 = form.carNo6.value;    var carNo7 = form.carNo7.value;    var carNo8 = form.carNo8.value;
    var carNo9 = form.carNo9.value;    var carNo10 = form.carNo10.value;    var carNo11 = form.carNo11.value;    var carNo12 = form.carNo12.value;
    var carNo13 = form.carNo13.value;    var carNo14 = form.carNo14.value;    var carNo15 = form.carNo15.value;    var carNo16 = form.carNo16.value;
    var carNo17 = form.carNo17.value;    var carNo18 = form.carNo18.value;    var carNo19 = form.carNo19.value;    var carNo20 = form.carNo20.value;
    var carNo21 = form.carNo21.value;

    form.idccDealerGoalSumVal.value=parseInt(carNo1)+parseInt(carNo2)+parseInt(carNo3)+parseInt(carNo4)+parseInt(carNo5)+parseInt(carNo6)+parseInt(carNo7)+parseInt(carNo8)+parseInt(carNo9)+parseInt(carNo10)+parseInt(carNo11)+parseInt(carNo12)+parseInt(carNo13)+parseInt(carNo14)+parseInt(carNo15)+parseInt(carNo16)+parseInt(carNo17)+parseInt(carNo18)+parseInt(carNo19)+parseInt(carNo20)+parseInt(carNo21);
    form.idccDealerGoalGapVal.value=parseInt(idccDealerGoalPrefVal) - (parseInt(carNo1)+parseInt(carNo2)+parseInt(carNo3)+parseInt(carNo4)+parseInt(carNo5)+parseInt(carNo6)+parseInt(carNo7)+parseInt(carNo8)+parseInt(carNo9)+parseInt(carNo10)+parseInt(carNo11)+parseInt(carNo12)+parseInt(carNo13)+parseInt(carNo14)+parseInt(carNo15)+parseInt(carNo16)+parseInt(carNo17)+parseInt(carNo18)+parseInt(carNo19)+parseInt(carNo20)+parseInt(carNo21));
    }
}

function shopGoalPrefValChk(price){
    if(price){
    var form = document.frmDealerdcpt;
    var shopDealerGoalPrefVal = form.shopDealerGoalPrefVal.value;
    var shopDealerGoalSumVal = form.shopDealerGoalSumVal.value;

    var carNo22 = form.carNo22.value;    var carNo23 = form.carNo23.value;    var carNo24 = form.carNo24.value;    var carNo25 = form.carNo25.value;
    var carNo26 = form.carNo26.value;    var carNo27 = form.carNo27.value;    var carNo28 = form.carNo28.value;    var carNo29 = form.carNo29.value;
    var carNo30 = form.carNo30.value;    var carNo31 = form.carNo31.value;    var carNo32 = form.carNo32.value;    var carNo33 = form.carNo33.value;
    var carNo34 = form.carNo34.value;    var carNo35 = form.carNo35.value;    var carNo36 = form.carNo36.value;    var carNo37 = form.carNo37.value;
    var carNo38 = form.carNo38.value;    var carNo39 = form.carNo39.value;    var carNo40 = form.carNo40.value;    var carNo41 = form.carNo41.value;
    var carNo42 = form.carNo42.value;

    form.shopDealerGoalSumVal.value=parseInt(carNo22)+parseInt(carNo23)+parseInt(carNo24)+parseInt(carNo25)+parseInt(carNo26)+parseInt(carNo27)+parseInt(carNo28)+parseInt(carNo29)+parseInt(carNo30)+parseInt(carNo31)+parseInt(carNo32)+parseInt(carNo33)+parseInt(carNo34)+parseInt(carNo35)+parseInt(carNo36)+parseInt(carNo37)+parseInt(carNo38)+parseInt(carNo39)+parseInt(carNo40)+parseInt(carNo41)+parseInt(carNo42);
    form.shopDealerGoalGapVal.value=parseInt(shopDealerGoalPrefVal) - (parseInt(carNo22)+parseInt(carNo23)+parseInt(carNo24)+parseInt(carNo25)+parseInt(carNo26)+parseInt(carNo27)+parseInt(carNo28)+parseInt(carNo29)+parseInt(carNo30)+parseInt(carNo31)+parseInt(carNo32)+parseInt(carNo33)+parseInt(carNo34)+parseInt(carNo35)+parseInt(carNo36)+parseInt(carNo37)+parseInt(carNo38)+parseInt(carNo39)+parseInt(carNo40)+parseInt(carNo41)+parseInt(carNo42));
    }
}

function custGoalPrefValChk(price){
    if(price){
    var form = document.frmDealerdcpt;
    var allCustDealerGoalPrefVal = form.allCustDealerGoalPrefVal.value;
    var idccCustDealerGoalPrefVal = form.idccCustDealerGoalPrefVal.value;
    var shopCustDealerGoalPrefVal = form.shopCustDealerGoalPrefVal.value;
    var allDealerGoalPrefVal = form.allDealerGoalPrefVal.value;
    var allCustDealerOpinionvalue = form.allCustDealerOpinionvalue.value;
    var idccCustDealerOpinionvalue = form.idccCustDealerOpinionvalue.value;
    var shopCustDealerOpinionvalue = form.shopCustDealerOpinionvalue.value;
    var idccDealRate = form.idccDealRate.value;
    var shopDealRate = form.shopDealRate.value;

    form.allCustDealerGoalPrefVal.value=parseInt(idccCustDealerGoalPrefVal)+parseInt(shopCustDealerGoalPrefVal);
    form.allCustDealerOpinionvalue.value=(parseInt(idccCustDealerOpinionvalue)+parseInt(shopCustDealerOpinionvalue)).toFixed(2);
    form.idccCustDealerOpinionvalue.value=(parseInt(allDealerGoalPrefVal)/parseInt(idccDealRate)).toFixed(2);
    form.shopCustDealerOpinionvalue.value=(parseInt(allDealerGoalPrefVal)/parseInt(shopDealRate)).toFixed(2);
    form.allCustDealerOpinionvalue.value=((parseInt(allDealerGoalPrefVal)/parseInt(idccDealRate)) + (parseInt(allDealerGoalPrefVal)/parseInt(shopDealRate))).toFixed(2);
    }
}

</script>
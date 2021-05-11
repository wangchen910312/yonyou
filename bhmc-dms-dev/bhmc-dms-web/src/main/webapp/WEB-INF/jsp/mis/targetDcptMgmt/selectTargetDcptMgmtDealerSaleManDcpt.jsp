<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frmDealerSaleMan" id="frmDealerSaleMan" action="<c:url value="/mis/tdm/selectTargetDcptMgmtDealerDcptSaleManSearch.do"/>">
<%
    String sDealerSaleManDcptYyMm = request.getParameter("sDealerSaleManDcptYyMm");
    pageContext.setAttribute("sDealerSaleManDcptYyMm", sDealerSaleManDcptYyMm);
%>
   <div class="header_area">
        <div class="left_area ml0">
            <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
            <input type="text" id="sDealerSaleManDcptYyMm" name="sDealerSaleManDcptYyMm" value="${pageContext.request.contextPath}" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
            <button type="button" class="btn_s" id="btnTargetDcptMgmtDealerDcptSaleManSearch" name="btnTargetDcptMgmtDealerDcptSaleManSearch"><spring:message code="global.btn.search" /></button><!-- 딜러분해자료조회  -->
        </div>
        <div class="btn_right">
            <!-- <button type="button" class="btn_s" id="btnTempSave"><spring:message code="global.btn.save" /></button> 저장  -->
            <!-- <button type="button" class="btn_s" id="btnSetComplete"><spring:message code="global.btn.fix" /></button> 확정  -->
        </div>
    </div>

    <div class="header_area pt0">
        <h2 class="title_basic"><spring:message code='mis.lbl.monthalltarget' /></h2>
    </div>
    <div class="table_info table_info_v2">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:25%;">
                <col style="width:25%;">
                <col style="width:25%;">
                <col style="width:25%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code='mis.lbl.monthalltarget' /></th>
                    <th scope="col"><spring:message code="mis.lbl.goalPrefVal" /></th>
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th>
                    <th scope="col"><spring:message code="mis.lbl.salesAdvisorcnt" /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${saleAllResultListVO.allMonthTargetVal}</td>
                    <td>${saleAllResultListVO.idccMonthTargetVal}</td>
                    <td>${saleAllResultListVO.shopMonthTargetVal}</td>
                    <td>${saleAllResultListVO.allSalemanCnt}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="mis.lbl.monthmodeldcpttarget" />, <spring:message code="mis.lbl.goalRstfVal" />, <spring:message code="mis.lbl.gap" /></h2>
        <div class="btn_right">
            <p class="txt_right">* <spring:message code="mis.lbl.gap" />：<spring:message code="mis.lbl.targetmessage" /></p>
        </div>
    </div>
    <div class="table_info">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
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
                <col style="width:8%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.dealermodel" /></th>
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
                    <th scope="col"><spring:message code="mis.lbl.total" /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="mis.lbl.goalPrefVal" /></th>
                    <td>${saleStatusResultListVO.carNo1}</td>
                    <td>${saleStatusResultListVO.carNo2}</td>
                    <td>${saleStatusResultListVO.carNo3}</td>
                    <td>${saleStatusResultListVO.carNo4}</td>
                    <td>${saleStatusResultListVO.carNo5}</td>
                    <td>${saleStatusResultListVO.carNo6}</td>
                    <td>${saleStatusResultListVO.carNo7}</td>
                    <td>${saleStatusResultListVO.carNo8}</td>
                    <td>${saleStatusResultListVO.carNo9}</td>
                    <td>${saleStatusResultListVO.carNo10}</td>
                    <td>${saleStatusResultListVO.carNo11}</td>
                    <td>${saleStatusResultListVO.carNo12}</td>
                    <td>${saleStatusResultListVO.carNo13}</td>
                    <td>${saleStatusResultListVO.carNo14}</td>
                    <td>${saleStatusResultListVO.carNo15}</td>
                    <td>${saleStatusResultListVO.carNo16}</td>
                    <td>${saleStatusResultListVO.carNo17}</td>
                    <td>${saleStatusResultListVO.carNo18}</td>
                    <td>${saleStatusResultListVO.carNo19}</td>
                    <td>${saleStatusResultListVO.carNo20}</td>
                    <td>${saleStatusResultListVO.carNo21}</td>
                    <td>${saleStatusResultListVO.allDealerGoalSumVal}</td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="mis.lbl.dcptprocess" /></th>
                    <td>${saleProResultListVO.carPro1}</td>
                    <td>${saleProResultListVO.carPro2}</td>
                    <td>${saleProResultListVO.carPro3}</td>
                    <td>${saleProResultListVO.carPro4}</td>
                    <td>${saleProResultListVO.carPro5}</td>
                    <td>${saleProResultListVO.carPro6}</td>
                    <td>${saleProResultListVO.carPro7}</td>
                    <td>${saleProResultListVO.carPro8}</td>
                    <td>${saleProResultListVO.carPro9}</td>
                    <td>${saleProResultListVO.carPro10}</td>
                    <td>${saleProResultListVO.carPro11}</td>
                    <td>${saleProResultListVO.carPro12}</td>
                    <td>${saleProResultListVO.carPro13}</td>
                    <td>${saleProResultListVO.carPro14}</td>
                    <td>${saleProResultListVO.carPro15}</td>
                    <td>${saleProResultListVO.carPro16}</td>
                    <td>${saleProResultListVO.carPro17}</td>
                    <td>${saleProResultListVO.carPro18}</td>
                    <td>${saleProResultListVO.carPro19}</td>
                    <td>${saleProResultListVO.carPro20}</td>
                    <td>${saleProResultListVO.carPro21}</td>
                    <td>${saleProResultListVO.sumToalVal}</td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="mis.lbl.gap" /></th>

                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo1 - saleProResultListVO.carPro1 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo1 - saleProResultListVO.carPro1}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo1 - saleProResultListVO.carPro1}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo2 - saleProResultListVO.carPro2 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo2 - saleProResultListVO.carPro2}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo2 - saleProResultListVO.carPro2}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo3 - saleProResultListVO.carPro3 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo3 - saleProResultListVO.carPro3}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo3 - saleProResultListVO.carPro3}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo4 - saleProResultListVO.carPro4 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo4 - saleProResultListVO.carPro4}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo4 - saleProResultListVO.carPro4}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo5 - saleProResultListVO.carPro5 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo5 - saleProResultListVO.carPro5}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo5 - saleProResultListVO.carPro5}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo6 - saleProResultListVO.carPro6 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo6 - saleProResultListVO.carPro6}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo6 - saleProResultListVO.carPro6}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo7 - saleProResultListVO.carPro7 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo7 - saleProResultListVO.carPro7}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo7 - saleProResultListVO.carPro7}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo8 - saleProResultListVO.carPro8 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo8 - saleProResultListVO.carPro8}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo8 - saleProResultListVO.carPro8}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo9 - saleProResultListVO.carPro9 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo9 - saleProResultListVO.carPro9}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo9 - saleProResultListVO.carPro9}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo10 - saleProResultListVO.carPro10 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo10 - saleProResultListVO.carPro10}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo10 - saleProResultListVO.carPro10}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo11 - saleProResultListVO.carPro11 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo11 - saleProResultListVO.carPro11}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo11 - saleProResultListVO.carPro11}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo12 - saleProResultListVO.carPro12 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo12 - saleProResultListVO.carPro12}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo12 - saleProResultListVO.carPro12}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo13 - saleProResultListVO.carPro13 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo13 - saleProResultListVO.carPro13}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo13 - saleProResultListVO.carPro13}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo14 - saleProResultListVO.carPro14 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo14 - saleProResultListVO.carPro14}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo14 - saleProResultListVO.carPro14}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo15 - saleProResultListVO.carPro15 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo15 - saleProResultListVO.carPro15}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo15 - saleProResultListVO.carPro15}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo16 - saleProResultListVO.carPro16 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo16 - saleProResultListVO.carPro16}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo16 - saleProResultListVO.carPro16}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo17 - saleProResultListVO.carPro17 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo17 - saleProResultListVO.carPro17}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo17 - saleProResultListVO.carPro17}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo18 - saleProResultListVO.carPro18 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo18 - saleProResultListVO.carPro18}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo18 - saleProResultListVO.carPro18}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo19 - saleProResultListVO.carPro19 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo19 - saleProResultListVO.carPro19}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo19 - saleProResultListVO.carPro19}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo20 - saleProResultListVO.carPro20 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo20 - saleProResultListVO.carPro20}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo20 - saleProResultListVO.carPro20}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.carNo21 - saleProResultListVO.carPro21 > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.carNo21 - saleProResultListVO.carPro21}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.carNo21 - saleProResultListVO.carPro21}</td>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test='${saleStatusResultListVO.allDealerGoalSumVal - saleProResultListVO.sumToalVal > "0" }' >
                    <td class="bg_yellow">${saleStatusResultListVO.allDealerGoalSumVal - saleProResultListVO.sumToalVal}</td>
                    </c:when>
                    <c:otherwise>
                    <td>${saleStatusResultListVO.allDealerGoalSumVal - saleProResultListVO.sumToalVal}</td>
                    </c:otherwise>
                    </c:choose>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="mis.lbl.monthsalemantarget" /></h2>
    </div>
    <div class="header_area">
        <div class="left_area left_area_v1 ml0">
        </div>
        <c:choose>
            <c:when test='${saleAllResultListVO.prefTp == "C"}' >
                <div class="btn_right">
                    <!-- <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>  -->
                    <button type="button" class="btn_s" id="btnTempSave"><spring:message code="global.btn.save" /></button><!-- 저장  -->
                    <button type="button" class="btn_s" id="btnSetComplete"><spring:message code="global.btn.fix" /></button><!-- 확정  -->
                    <button type="button" class="btn_s" id="btnExcelImport"><spring:message code="mis.btn.salemanInputtarget" /></button>
                    <button type="button" class="btn_s" id="btnInputFormat"><spring:message code="mis.btn.salemanInputformat" /></button>
                </div>
                </c:when>
                <c:otherwise>
                <div class="btn_right">
                    <!-- <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>  -->
                    <!-- <button type="button" class="btn_s" id="btnTempSave"><spring:message code="global.btn.save" /></button>--><!-- 저장  -->
                    <!-- <button type="button" class="btn_s" id="btnSetComplete"><spring:message code="global.btn.fix" /></button>--><!-- 확정  -->
                    <!-- <button type="button" class="btn_s" id="btnExcelImport"><spring:message code="mis.btn.salemanInputtarget" /></button>-->
                    <button type="button" class="btn_s" id="btnInputFormat"><spring:message code="mis.btn.salemanInputformat" /></button>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="table_info table_info_v2 mt10">
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid"></div>
        </div>
        <!-- 그리드 종료 -->
    </div>
</form>
<script>
    $(document).ready(function() {
        $("#sDealerSaleManDcptYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
           ,parseFormats:["yyyyMM"]
        });

        $("#sDealerSaleManDcptYyMm").kendoMaskedTextBox({
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

        if('${sDealerSaleManDcptYyMm}' == "" || '${sDealerSaleManDcptYyMm}' == 'null') {
            $("#sDealerSaleManDcptYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
        } else {
            $("#sDealerSaleManDcptYyMm").val('${sDealerSaleManDcptYyMm}');
        }


    $("#btnTargetDcptMgmtDealerDcptSaleManSearch").kendoButton({
        click:function(e) {
            $('#frmDealerSaleMan').submit();
           }
    });

    // 부분포맷다운로드
    $("#btnInputFormat").kendoButton({
        click:function(e) {
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=TargetDcptSalemanDcpt.xlsx";
        }
    });

    // 버튼 - 엑셀 일괄등록
    $("#btnExcelImport").kendoButton({
        click:function(e) {

            if($("#sDealerSaleManDcptYyMm").val() == ''){
                alert("<spring:message code='mis.info.targetYearMonthInfo'/>");
                return;
            }

            targetSalesmanDcptRegUploadPopupWin = dms.window.popup({
                title:"<spring:message code='mis.title.salesmandcpt'/>"
                ,windowId:"targetSalesmanDcptRegUploadPopupWin"
                ,content:{
                     url:"<c:url value='/mis/tmp/selectSalesmanDcptRegPopup.do?sDealerSaleManDcptYyMm=' />"+$("#sDealerSaleManDcptYyMm").val()
                    ,data:{
                        "callbackFunc":function(){
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });

  //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-MIS-0905-111300"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/mis/tdm/selectTargetDcptMgmtDealerSalemanDcpt.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDealerSaleManDcptYyMm"] = $("#sDealerSaleManDcptYyMm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                         rnum:{type:"number", editable:false}
                        ,empNm:{type:"string"}
                        ,carNo1:{type:"string"}
                        ,carNo2:{type:"string"}
                        ,carNo3:{type:"string"}
                        ,carNo4:{type:"string"}
                        ,carNo5:{type:"string"}
                        ,carNo6:{type:"string"}
                        ,carNo7:{type:"string"}
                        ,carNo8:{type:"string"}
                        ,carNo9:{type:"string"}
                        ,carNo10:{type:"string"}
                        ,carNo11:{type:"string"}
                        ,carNo12:{type:"string"}
                        ,carNo13:{type:"string"}
                        ,carNo14:{type:"string"}
                        ,carNo15:{type:"string"}
                        ,carNo16:{type:"string"}
                        ,carNo17:{type:"string"}
                        ,carNo18:{type:"string"}
                        ,carNo19:{type:"string"}
                        ,carNo20:{type:"string"}
                        ,carNo21:{type:"string"}
                        ,sumSalemanCnt:{type:"string"}
                    }
                }
            }
        }
        ,height:400
        ,filterable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,editable:false
        ,sortable:false
        ,columns:[
            {field:"empNm", title:"<spring:message code='mis.lbl.empNm' />", width:150, sortable:false, attributes:{"class":"ac"}

            }
            ,{field:"carNo1", title:"2C", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo2", title:"B3", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo3", title:"BX", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo4", title:"C3", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo5", title:"C7", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo6", title:"C9", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo7", title:"CE", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo8", title:"CH", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo9", title:"CP", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo10", title:"DC", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo11", title:"DZ", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo12", title:"E5", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo13", title:"ES", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo14", title:"F0", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo15", title:"F8", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo16", title:"F9", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo17", title:"ID", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo18", title:"IK", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo19", title:"IV", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo20", title:"IZ", width:65, attributes:{"class":"ac"}

            }
            ,{field:"carNo21", title:"TE", width:65, attributes:{"class":"ac"}

            }
            ,{field:"sumSalemanCnt", title:"<spring:message code='mis.lbl.total' />", width:100, attributes:{"class":"ac"}

            }
        ]
    });
    });
</script>
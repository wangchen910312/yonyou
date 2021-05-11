<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- content -->
<section id="content">
    <!-- ElectronReceipt -->

    <!-- 송장정보 영역 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><!-- 装箱单信息 --><!-- 송장정보 --></h2>
            <div class="btn_right">
                <button id="btnInit" class="btn_m btn_reset" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
            </div>
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
                    <col style="width:23%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></th>
                        <td>
                            <input id="invcTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="invcDocNo" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- 송장일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="bpCd" name="bpCd" class="form_input hidden"/>
                                <input type="text" id="bpNm" class="form_input form_readonly" readonly/>
                                <input id="bpTp" name="bpTp" class="form_input hidden"  data-type="combo"/>
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td>
                            <input id="invcStatCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid">
            <table class="grid1">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1"><spring:message code="par.lbl.line" /><!-- 번호 --></th>
                        <th scope="col" data-field="data2"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></th>
                        <th scope="col" data-field="data3"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <th scope="col" data-field="data4"><spring:message code="par.lbl.regDt" /><!-- 등록일자--></th>
                        <th scope="col" data-field="data5"><spring:message code="par.lbl.invcDt" /><!-- 송장일자 --></th>
                        <th scope="col" data-field="data6"><spring:message code="par.lbl.bpCd" /><!-- 업체 --></th>
                        <th scope="col" data-field="data7"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <th scope="col" data-field="data8"><spring:message code="par.lbl.vatCd" /><!-- 세금코드 --></th>
                        <th scope="col" data-field="data9"><spring:message code="par.lbl.vatAmt" /><!-- 세액 --></th>
                        <th scope="col" data-field="data10"><spring:message code="par.lbl.totPurcAmt" /><!-- 금액 --></th>
                        <th scope="col" data-field="data11"><spring:message code="par.lbl.arrvDt" /><!-- 도착일자 --></th>
                        <th scope="col" data-field="data12"><spring:message code="par.lbl.remark" /><!-- 비고 --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </section>
    <!-- // 송장정보 영역 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic">电子发票列表</h2>
        </div>
        <div class="table_grid">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1"><spring:message code="par.lbl.line" /><!-- 번호 --></th>
                        <th scope="col" data-field="data2"><spring:message code="par.lbl.purcOrdNo" /><!-- 오더번호 --></th>
                        <th scope="col" data-field="data3"><spring:message code="par.lbl.lineNm" /><!-- 행 --></th>
                        <th scope="col" data-field="data4"><spring:message code="par.lbl.itemCd" /><!-- 부번 --></th>
                        <th scope="col" data-field="data5"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <th scope="col" data-field="data6"><spring:message code="par.lbl.prc" /><!-- 단가 --></th>
                        <th scope="col" data-field="data7"><spring:message code="par.lbl.qty" /><!-- 수량 --></th>
                        <th scope="col" data-field="data8"><spring:message code="par.lbl.amt" /><!-- 금액 --></th>
                        <th scope="col" data-field="data9"><spring:message code="par.lbl.vatAmt" /><!-- 세액 --></th>
                        <th scope="col" data-field="data10"><spring:message code="par.lbl.elReceipt" /><!-- 전자영수증电子发票编号 --></th>
                        <th scope="col" data-field="data11"><spring:message code="par.lbl.elReceiptRegDt" /><!-- 전자영수증생성일자电子发票日期 --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // 전자영수증조회 영역 -->

</section>
<!-- //content -->

<!-- script -->
<script>
    $(document).ready(function() {
        var venderSearchPopupWin;

        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".grid").kendoGrid({
            height:150
        });
        $(".grid1").kendoGrid({
            height:288
        });
        $(".form_comboBox").kendoExtDropDownList();

        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":''
                        ,"bpNm":''
                        ,"callbackFunc":function(data){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            $("#bpTp").val(data[0].bpTp);
                            $("#grid").data("kendoExtGrid").dataSource.data([]);
                        }
                    }
                }
            });
        }
    });
</script>
<!-- //script -->
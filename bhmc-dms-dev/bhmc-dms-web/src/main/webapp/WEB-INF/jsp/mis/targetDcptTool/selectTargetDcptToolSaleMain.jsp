<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 판매고문 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic title_basic_v1"><spring:message code='mis.lbl.salesAdvisor' /></h1>
    </div>
    <div class="table_info table_info_v1">
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
                    <th scope="col">당월 총 목표</th>
                    <th scope="col">IDCC 차이</th>
                    <th scope="col">전시장 차이</th>
                    <th scope="col">판매고문인수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${targetDcptToolSaleVO.monthTotalTargetVal}</td>
                    <td>${targetDcptToolSaleVO.monthidccGapVal}</td>
                    <td>${targetDcptToolSaleVO.monthShopGapVal}</td>
                    <td>${targetDcptToolSaleVO.monthDlrCnt}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active">IDCC</li>
            <li>전시장</li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- IDCC -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.targetyearmonth" /></span>
                    <input type="text" id="sSaleIdccYyMm" name="sSaleIdccYyMm" class="form_datepicker" maxlength="6" style="width:100px;">
                    <button type="button" class="btn_s" id="btnSaleIdccSearch" name="btnSaleIdccSearch"><spring:message code="global.btn.search" /></button>
                </div>
                <div class="btn_right">
                    <button type="button" class="btn_s">저장</button>
                    <button type="button" class="btn_s">확정</button>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2">
            <form method="post" name="frmSaleIdcc" id="frmSaleIdcc" action="<c:url value="/mis/tdt/selectTargetDcptToolSaleSearch.do"/>">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th_bg">차형</th>
                            <th scope="col">아반떼</th>
                            <th scope="col">올 뉴 투싼</th>
                            <th scope="col">쏘나타9</th>
                            <th scope="col">ix25</th>
                            <th scope="col">MISTRA</th>
                            <th scope="col">올 뉴 싼타페</th>
                            <th scope="col">신형 아반떼</th>
                            <th scope="col">쏘나타8</th>
                            <th scope="col">베르나</th>
                            <th scope="col">합계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">목표</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">진도</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">차이</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td class="bg_yellow">0</td>
                            <td class="bg_yellow">2</td>
                            <td class="bg_yellow">1</td>
                            <td class="bg_yellow">6</td>
                        </tr>
                    </tbody>
                </table>
                </form>
            </div>
            <div class="table_info table_info_v2 mt5">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th_bg">판매고문/차형</th>
                            <th scope="col">아반떼</th>
                            <th scope="col">올 뉴 투싼</th>
                            <th scope="col">쏘나타9</th>
                            <th scope="col">ix25</th>
                            <th scope="col">MISTRA</th>
                            <th scope="col">올 뉴 싼타페</th>
                            <th scope="col">신형 아반떼</th>
                            <th scope="col">쏘나타8</th>
                            <th scope="col">베르나</th>
                            <th scope="col">합계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">A</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">B</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">C</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">D</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">E</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //IDCC -->

        <!-- 전시장 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.targetyearmonth" /></span>
                    <input type="text" id="sSaleShopYyMm" name="sSaleShopYyMm" class="form_datepicker" maxlength="6" style="width:100px;">
                    <button type="button" class="btn_s" id="btnSaleShopSearch" name="btnSaleShopSearch"><spring:message code="global.btn.search" /></button>
                </div>
                <div class="btn_right">
                    <button type="button" class="btn_s">저장</button>
                    <button type="button" class="btn_s">확정</button>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2">
            <form method="post" name="frmSaleShop" id="frmSaleShop" action="<c:url value="/mis/tdt/selectTargetDcptToolSaleSearch.do"/>">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th_bg">차형</th>
                            <th scope="col">아반떼</th>
                            <th scope="col">올 뉴 투싼</th>
                            <th scope="col">쏘나타9</th>
                            <th scope="col">ix25</th>
                            <th scope="col">MISTRA</th>
                            <th scope="col">올 뉴 싼타페</th>
                            <th scope="col">신형 아반떼</th>
                            <th scope="col">쏘나타8</th>
                            <th scope="col">베르나</th>
                            <th scope="col">합계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">목표</th>
                            <td>2</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>7</td>
                        </tr>
                        <tr>
                            <th scope="row">진도</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">차이</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td class="bg_yellow">0</td>
                            <td class="bg_yellow">2</td>
                            <td class="bg_yellow">1</td>
                            <td class="bg_yellow">6</td>
                        </tr>
                    </tbody>
                </table>
                </form>
            </div>
            <div class="table_info table_info_v2 mt5">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:9%;">
                        <col style="width:8%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th_bg">판매고문/차형</th>
                            <th scope="col">아반떼</th>
                            <th scope="col">올 뉴 투싼</th>
                            <th scope="col">쏘나타9</th>
                            <th scope="col">ix25</th>
                            <th scope="col">MISTRA</th>
                            <th scope="col">올 뉴 싼타페</th>
                            <th scope="col">신형 아반떼</th>
                            <th scope="col">쏘나타8</th>
                            <th scope="col">베르나</th>
                            <th scope="col">합계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">A</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">B</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">C</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">D</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">E</th>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>6</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //전시장 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>

<script>
    $(document).ready(function() {

        $("#sSaleIdccYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sSaleIdccYyMm").kendoMaskedTextBox({
            mask:"######"
        });

        $("#sSaleShopYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sSaleShopYyMm").kendoMaskedTextBox({
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

        $("#sSaleIdccYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
        $("#sSaleShopYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

        $("#btnSaleIdccSearch").kendoButton({
            click:function(e) {
                $('#frmSaleIdcc').submit();
            }
        });

        $("#btnSaleShopSearch").kendoButton({
            click:function(e) {
                $('#frmSaleShop').submit();
            }
        });


        $(".form_comboBox").kendoExtDropDownList();
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });
    });
</script>
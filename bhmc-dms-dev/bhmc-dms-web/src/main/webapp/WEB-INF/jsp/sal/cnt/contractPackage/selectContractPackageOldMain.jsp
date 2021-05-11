<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 集团销售 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">集团销售</h1>
        <div class="left_area">
            <span class="span_txt">经销商</span>
            <div style="display:inline-block;position:relative;top:1px;">
                <div class="form_search" style="width:80px;">
                    <input type="text" value="" class="form_input">
                    <a href="javascript:;"></a>
                </div>
                <input type="text" value="" readonly class="form_input form_readonly" style="width:80px;">
            </div>
        </div>
        <div class="btn_right">
            <button class="btn_m">结算单打印</button>
            <button class="btn_m">合同打印</button>
            <button class="btn_m">创建合同</button>
            <button class="btn_m">合同取消</button>
            <button class="btn_m btn_search">查询</button>
            <button class="btn_m btn_new">新建</button>
            <button class="btn_m btn_save">保存</button>
            <button class="btn_m btn_modify">修改</button>
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
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">销售顾问</th>
                    <td class="readonly_area">
                        <input type="text" value="" readonly class="form_comboBox">
                    </td>
                    <th scope="row">客户</th>
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input type="text" value="" class="form_input">
                                    <a href="javascript:;"></a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row">公司编号</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">合同状态</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <td colspan="2"></td>
                    <th scope="row">合同签订日</th>
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
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">集团编号</th>
                    <th scope="col" data-field="data2">合约日起</th>
                    <th scope="col" data-field="data3">合约状态</th>
                    <th scope="col" data-field="data4">客户编号</th>
                    <th scope="col" data-field="data5">客户名</th>
                    <th scope="col" data-field="data6">销售顾问</th>
                    <th scope="col" data-field="data7">车种数量</th>
                    <th scope="col" data-field="data8">数量</th>
                    <th scope="col" data-field="data9">总销售金额</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //集团销售 -->

<!-- 客户信息 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">客户信息</h2>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:12%;">
                <col style="width:6%;">
                <col style="width:10%;">
                <col style="width:6%;">
                <col style="width:10%;">
                <col style="width:8%;">
                <col style="width:10%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">客户</th>
                    <td colspan="3">
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input type="text" value="" class="form_input">
                                    <a href="javascript:;">검색</a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row">客户类型</th>
                    <td>
                        <input type="text" value="개인" readonly class="form_input form_readonly ac">
                    </td>
                    <th scope="row">证件类型</th>
                    <td class="readonly_area">
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">证件号</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row">联系人</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">电话</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">邮件</th>
                    <td colspan="3">
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">合同类型</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">省</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">市</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">区</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">邮编</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">常住地址</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //客户信息 -->

<!-- 合同价格信息 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">合同价格信息</h2>
    </div>
    <div class="table_list table_list_v1">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:26%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:14%;">
                <col style="width:14%;">
                <col style="width:14%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">车种</th>
                    <th scope="col">车型</th>
                    <th scope="col">数量</th>
                    <th scope="col">实际车辆价格/台</th>
                    <th scope="col">实际车辆价格/总</th>
                    <th scope="col">其他费用合计</th>
                    <th scope="col">实际付款金额</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td class="ac">合计</td>
                    <td></td>
                    <td class="ar child_borderNone"></td>
                    <td class="ar child_borderNone"></td>
                    <td class="ar child_borderNone">2,400,000</td>
                    <td class="ar child_borderNone">22,500</td>
                    <td class="ar td_total child_borderNone"><strong>1,750,000</strong></td>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td class="ac">BX</td>
                    <td>BX 5145 D 1.4升GL自动档</td>
                    <td class="ar child_borderNone">10</td>
                    <td class="ar child_borderNone">160,000</td>
                    <td class="ar child_borderNone">1,600,000</td>
                    <td class="ar child_borderNone">11,500</td>
                    <td class="ar td_total child_borderNone"><strong>1,611,500</strong></td>
                </tr>
                <tr>
                    <td class="ac">C3</td>
                    <td>C3 5145 D 1.6升GL自动档</td>
                    <td class="ar child_borderNone">5</td>
                    <td class="ar child_borderNone">80,000</td>
                    <td class="ar child_borderNone">800,000</td>
                    <td class="ar child_borderNone">11,500</td>
                    <td class="ar td_total child_borderNone"><strong>811,500</strong></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //合同价格信息 -->









<!-- 车辆信息 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">车辆信息</h2>
    </div>
    <div id="tabCar" class="tab_area mt0">
        <ul>
            <li class="k-state-active">车种1</li>
        </ul>

        <span class="btn_right_absolute">
            <button type="button" class="btn_s">车种添加</button>
            <button type="button" class="btn_s">车种删除</button>
        </span>

        <!-- 车种1 -->
        <div>
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
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">车种</th>
                            <td>
                                <input type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row">车型</th>
                            <td>
                                <input type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row">OCN</th>
                            <td>
                                <input type="text" value="" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">外色</th>
                            <td>
                                <input type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row">内色</th>
                            <td>
                                <input type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row"><span class="bu_required">数量</span></th>
                            <td>
                                <input type="text" value="" class="form_input ar">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">客户类型</th>
                            <td>
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row">纳税类型</th>
                            <td>
                                <input type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row">期望交车日期</th>
                            <td>
                                <input type="text" value="" class="form_datepicker">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_list table_list_v1 mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:7%;">
                        <col style="width:7%;">
                        <col style="width:8%;">
                        <col style="width:8%;">
                        <col style="width:8%;">
                        <col style="width:8%;">
                        <col style="width:7%;">
                        <col style="width:6%;">
                        <col style="width:6%;">
                        <col style="width:6%;">
                        <col style="width:6%;">
                        <col style="width:8%;">
                        <col style="width:6%;">
                        <col>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" rowspan="2">车种</th>
                            <th scope="col" rowspan="2">车型</th>
                            <th scope="colgroup" colspan="5" class="hasBob">车辆价格（每台）</th>
                            <th scope="colgroup" colspan="4" class="hasBob">其他费用（每台）</th>
                            <th scope="col" rowspan="2"><strong>实际车辆<br>价格<br>B+C+D+E</strong></th>
                            <th scope="col" rowspan="2"><strong>其他费用<br>合计<br>F</strong></th>
                            <th scope="col" rowspan="2"><strong>实际付款金额<br>E+F</strong></th>
                        </tr>
                        <tr>
                            <th scope="col">采购价<br>A</th>
                            <th scope="col">厂家指导价<br>B</th>
                            <th scope="col">促销金额<br>C</th>
                            <th scope="col">置换抵扣<br>D</th>
                            <th scope="col">精品价格<br>E</th>
                            <th scope="col">取送费</th>
                            <th scope="col">保险费</th>
                            <th scope="col">代办费</th>
                            <th scope="col">附加费</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="ac">BX</td>
                            <td>XXX</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone">0</td>
                            <td class="ar child_borderNone"><strong>0</strong></td>
                            <td class="ar child_borderNone"><strong>0</strong></td>
                            <td class="ar td_total child_borderNone"><strong>0</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 탭메뉴 전체 영역 -->
            <div class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="driverTab" class="k-state-active"><spring:message code='sal.lbl.driver' /></li>     <!-- 실운전자 -->
                    <li id="consTab"><spring:message code='sal.lbl.cons' /></li>                   <!-- 탁송 -->
                    <li id="promotionTab"><spring:message code='sal.lbl.promotion' /></li>         <!-- 판촉 -->
                    <li id="receiptTab"><spring:message code='global.lbl.receipt' /></li>          <!-- 영수증 -->
                    <li id="payInfoTab"><spring:message code='sal.lbl.payInfo' /></li>             <!-- 입출금 -->
                    <li id="useCarTab"><spring:message code='sal.lbl.useCar' /></li>           <!-- 중고차치환 -->
                    <li id="subServiceTab"><spring:message code='sal.lbl.subService' /></li>   <!-- 추가서비스 -->
                    <li id="remarkTab"><spring:message code='sal.lbl.fileRemark' /></li>       <!-- 파일 및 비고 -->
                    <li id="goodsTab"><spring:message code='sal.lbl.goods' /></li>             <!-- 용품 -->
                    <li id="optionTab"><spring:message code='sal.lbl.optionAmt' /></li>        <!-- 부가비용 -->
                    <li id="priceTab"><spring:message code='sal.lbl.price' /></li>             <!-- 가격 -->
                </ul>
                <!-- //탭메뉴 -->

                <!-- 실운전자 -->
                <div class="mt0">
                    <div class="header_area">
                        <div class="fl ml0">
                            <label><input type="checkbox" class="form_check"> <spring:message code='global.lbl.contractCustomerInfoSame' /></label>       <!-- 계약고객정보와 동일 -->
                        </div>
                    </div>
                    <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:8%;">
                                <col style="width:12%;">
                                <col style="width:6%;">
                                <col style="width:10%;">
                                <col style="width:6%;">
                                <col style="width:10%;">
                                <col style="width:8%;">
                                <col style="width:10%;">
                                <col style="width:8%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                                    <td colspan="3">
                                        <div class="form_float">
                                            <div class="form_left">
                                                <div class="form_search">
                                                    <input type="text" value="" class="form_input">
                                                    <a href="javascript:;"><spring:message code='global.btn.search' /></a>       <!-- 검색 -->
                                                </div>
                                            </div>
                                            <div class="form_right">
                                                <input type="text" value="" readonly class="form_input form_readonly">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.custTp' /></th>        <!-- 고객유형 -->
                                    <td>
                                        <input type="text" value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">  <!-- 개인 -->
                                    </td>
                                    <td colspan="4"></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>      <!-- 신분증유형 -->
                                    <td class="readonly_area">
                                        <input type="text" value="" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>      <!-- 증서번호 -->
                                    <td colspan="3">
                                        <input type="text" value="" readonly class="form_input form_readonly">
                                    </td>
                                    <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 대표전화번호 -->
                                    <td>
                                        <input type="text" value="" readonly class="form_input form_readonly">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sung' /></th>      <!-- 성 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>       <!-- 시 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.dist' /></th>         <!-- 구 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.zipCd' /></th>       <!-- 우편번호 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>      <!-- 고객주소 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //실운전자 -->

                <!-- 탁송 -->
                <div>
                    <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:12%;">
                                <col style="width:7%;">
                                <col style="width:12%;">
                                <col style="width:7%;">
                                <col style="width:12%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.consTp' /></th>        <!-- 탁송구분 -->
                                    <td>
                                        <ul class="tabmenu">
                                            <li><button type="button"><spring:message code='sal.lbl.vsit' /></button></li>                  <!-- 방문 -->
                                            <li class="on"><button type="button"><spring:message code='sal.lbl.cons' /></button></li>       <!-- 탁송 -->
                                        </ul>
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.consAmt' /></th>        <!-- 탁송료 -->
                                    <td>
                                        <input type="number" value="" min="0" max="" class="form_numeric ar">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.zipCd' /></th>         <!-- 우편번호 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sung' /></th>      <!-- 탁송지 성 -->
                                    <td>
                                        <input type="text" value="" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>      <!-- 시 -->
                                    <td>
                                        <input type="text" value="" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.dist' /></th>        <!-- 구 -->
                                    <td>
                                        <input type="text" value="" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>     <!-- 상세주소 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //탁송 -->

                <!-- 판촉 -->
                <div class="mt0">
                    <div class="header_area">
                        <h3 class="title_basic"><spring:message code='sal.title.corpPromotion' /></h3>      <!-- 법인 프로모션 -->
                        <div class="right_area">
                            <div class="txt_total">
                                <!-- 판촉금액 -->
                                <p><spring:message code='sal.lbl.promotionAmt' />:<span>30,000</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="table_grid">
                        <table class="grid">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" data-field="data1"><spring:message code='global.lbl.chk' /></th>             <!-- 표시 -->
                                    <th scope="col" data-field="data2"><spring:message code='global.lbl.promotionNm' /></th>     <!-- 프로모션명 -->
                                    <th scope="col" data-field="data3"><spring:message code='global.lbl.amt' />/<spring:message code='global.lbl.dcRate' /></th>            <!-- 금액/할인율 -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" class="form_check"></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="header_area">
                        <h3 class="title_basic"><spring:message code='sal.title.dlrPromotion' /></h3>       <!-- 딜러 프로모션 -->
                    </div>
                    <div class="table_grid">
                        <table class="grid">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" data-field="data1">선택</th>
                                    <th scope="col" data-field="data2">판촉명</th>
                                    <th scope="col" data-field="data3">금액</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" class="form_check"></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //판촉 -->

                <!-- 영수증 -->
                <div>
                    <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /></th>    <!-- 고객명 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>       <!-- 영수번호 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.rcptAmt' /></th>       <!-- 영수금액 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.rcptDt' /></th>       <!-- 영수일자 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.rcptScan' /></th>      <!-- 영수증스캔 -->
                                    <td colspan="3">
                                        <input type="text" value="" readonly class="form_input form_readonly" style="width:85%;">
                                        <button type="button" class="btn_s"><spring:message code='sal.lbl.scan' /></button>     <!-- 스캔 -->
                                    </td>
                                    <td colspan="4"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //영수증 -->

                <!-- 입출금 -->
                <div class="mt0">
                    <div class="header_area">
                        <div class="btn_right">
                            <button id="btnPayInfoSave" type="button" class="btn_s"><spring:message code='global.btn.save' /></button>      <!-- 저장 -->
                            <button id="btnPayInfoAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>     <!-- 행추가 -->
                            <button id="btnPayInfoDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>     <!-- 행삭제 -->
                            <button id="btnPayInfoCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>  <!-- 취소 -->
                        </div>
                    </div>
                    <div class="table_grid">
                        <table class="grid">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" data-field="data1"><spring:message code='global.lbl.check' /></th>              <!-- 선택 -->
                                    <th scope="col" data-field="data2"><spring:message code='sal.lbl.rcvTp' /></th>                 <!-- 수납유형 -->
                                    <th scope="col" data-field="data3"><spring:message code='sal.lbl.dpstWdrwTp' /></th>            <!-- 입출금유형 -->
                                    <th scope="col" data-field="data4"><spring:message code='sal.lbl.dpsWdrwDt' /></th>             <!-- 입출금일자 -->
                                    <th scope="col" data-field="data5"><spring:message code='sal.lbl.dpstWdrwTargTp' /></th>        <!-- 입출금대상유형 -->
                                    <th scope="col" data-field="data6"><spring:message code='sal.lbl.dpstWdrwAmt' /></th>           <!-- 입/출금액 -->
                                    <th scope="col" data-field="data7"><spring:message code='global.lbl.reasonCd' /></th>           <!-- 사유 -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" class="form_check"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>13,000.00</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form_check"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><span class="txt_red">-3,000.00</span></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //입출금 -->

                <!-- 중고차치환 -->
                <div>
                    <div class="table_form">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:24%;">
                                <col style="width:10%;">
                                <col style="width:23%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.uatcCarPurc' /></th>      <!-- 치환여부 -->
                                    <td>
                                        <input type="text" value="" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>        <!-- VIN NO -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                    <th scope="row"><spring:message code='sal.lbl.usrSbstAmt' /></th>       <!-- 평가금액 -->
                                    <td>
                                        <input type="text" value="" class="form_input ar">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //중고차치환 -->

                <!-- 추가서비스 -->
                <div class="mt0">
                    <!-- 번호판 등록서비스 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code='sal.title.plateReg' /></h3>       <!-- 번호판 등록서비스 -->
                        </div>
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.plateRegPro' /></th>      <!-- 번호판 등록처리 -->
                                        <td>
                                            <ul class="tabmenu">
                                                <li><button type="button"><spring:message code='global.lbl.execution' /></button></li>              <!-- 대행 -->
                                                <li class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>     <!-- 본인 -->
                                            </ul>
                                        </td>
                                        <td colspan="6"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.regPreAmt' /></th>      <!-- 등록비 선수금 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.realRegAmt' /></th>     <!-- 실제등록비용 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.regDist' /></th>       <!-- 등록장소 -->
                                        <td>
                                            <input type="text" value="" class="form_input">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.regExpcDt' /></th>     <!-- 등록예상일자 -->
                                        <td>
                                            <input type="text" value="" class="form_datepicker">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.purcTaxPreAmt' /></th>        <!-- 구입세 선수금 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.realPurcTaxAmt' /></th>      <!-- 실제구입세 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>     <!-- 차액 -->
                                        <td>
                                            <input type="text" value="" readonly class="form_input form_readonly ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.regFeeAmt' /></th>            <!-- 등록수수료 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- //번호판 등록서비스 -->

                    <!-- 보험서비스 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code='sal.title.incService' /></h3>     <!-- 보험서비스 -->
                        </div>
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.incAap' /></th>       <!-- 보험처리 -->
                                        <td>
                                            <ul class="tabmenu">
                                                <li><button type="button"><spring:message code='global.lbl.execution' /></button></li>                <!-- 대행 -->
                                                <li class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>       <!-- 본인 -->
                                            </ul>
                                        </td>
                                        <td colspan="6"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.incExpcAmt' /></th>     <!-- 보험예상금액 -->
                                        <td>
                                            <input type="text" value="" readonly class="form_input form_readonly ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.realIncAmt' /></th>     <!-- 실보험금액 -->
                                        <td>
                                            <input type="text" value="" readonly class="form_input form_readonly ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>             <!-- 차액 -->
                                        <td>
                                            <input type="text" value="" readonly class="form_input form_readonly ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.incFeeAmt' /></th>       <!-- 보험수수료 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.incCmp' /></th>        <!-- 보험회사 -->
                                        <td>
                                            <input type="text" value="" class="form_comboBox">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.incProfitNm' /></th>      <!-- 제1수익자 -->
                                        <td>
                                            <input type="text" value="" class="form_input">
                                        </td>
                                        <td colspan="4"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.incType' /></th>      <!-- 보험종류 -->
                                        <td colspan="7">
                                            <div class="header_area">
                                                <div class="btn_right">
                                                    <button id="btnIncAdd" type="button"  class="btn_s mt0"><spring:message code='global.btn.rowAdd' /></button>        <!-- 행추가 -->
                                                    <button id="btnIncDel" type="button" class="btn_s mt0"><spring:message code='global.btn.rowDel' /></button>         <!-- 행삭제 -->
                                                    <button id="btnIncCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>          <!-- 취소 -->
                                                </div>
                                            </div>
                                            <div class="table_grid">
                                                <table class="grid">
                                                    <caption></caption>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" data-field="data1"><input type="checkbox" class="form_check"></th>
                                                            <th scope="col" data-field="data2"><spring:message code='sal.lbl.incTp' /></th>         <!-- 보험유형 -->
                                                            <th scope="col" data-field="data3"><spring:message code='global.lbl.incAmt' /></th>     <!-- 보험금액 -->
                                                            <th scope="col" data-field="data4"><spring:message code='sal.lbl.realIncAmt' /></th>    <!-- 실제보험료 -->
                                                            <th scope="col" data-field="data5"><spring:message code='sal.lbl.pridMonth' /></th>     <!-- 기간(월) -->
                                                            <th scope="col" data-field="data6"><spring:message code='sal.lbl.orgStartDt' /></th>    <!-- 시작일자 -->
                                                            <th scope="col" data-field="data7"><spring:message code='sal.lbl.orgEndDt' /></th>      <!-- 종료일자 -->
                                                            <th scope="col" data-field="data8"><spring:message code='global.lbl.remark' /></th>     <!-- 비고 -->
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.remark' /></th>     <!-- 비고 -->
                                        <td colspan="7">
                                            <input type="text" value="" readonly class="form_input form_readonly">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- //보험서비스 -->

                    <!-- 금융서비스 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code='sal.title.fincService' /></h3>        <!-- 금융서비스 -->
                            <div class="fl">
                                <label><input type="checkbox" class="form_check"> <spring:message code='global.lbl.fincApp' /></label>  <!-- 금융신청 -->
                            </div>
                        </div>
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:11%;">
                                    <col style="width:14%;">
                                    <col style="width:8%;">
                                    <col style="width:6%;">
                                    <col style="width:9%;">
                                    <col style="width:6%;">
                                    <col style="width:8%;">
                                    <col style="width:14%;">
                                    <col style="width:8%;">
                                    <col style="width:14%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.fincCmp' /></th>       <!-- 금융사 -->
                                        <td>
                                            <input type="text" value="" class="form_comboBox">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.fincRpayPrid' /></th>       <!-- 상환기간 -->
                                        <td>
                                            <input type="text" value="" class="form_input">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.fincLoadRate' /></th>    <!-- 대출비율(%) -->
                                        <td>
                                            <input type="text" value="" class="form_input">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.vehiclePrice' /></th>       <!-- 차량가격 -->
                                        <td>
                                            <input type="text" value="" readonly class="form_input form_readonly ar">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.fincFeeAmt' /></th>      <!-- 대출수수료 -->
                                        <td>
                                            <input type="text" value="" class="form_input ar">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.fincItem' /></th>      <!-- 금융상품 -->
                                        <td>
                                            <input type="text" value="" class="form_input">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.fincReqAmt' /></th>        <!-- 신청금액 -->
                                        <td colspan="2">
                                            <input type="number" value="" class="form_numeric ar">
                                        </td>
                                        <td></td>
                                        <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>     <!-- 신청일자 -->
                                        <td>
                                            <input type="text" value="" class="form_datepicker">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.fincEndDt' /></th>     <!-- 만기일자 -->
                                        <td>
                                            <input type="text" value="" class="form_datepicker">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- //금융서비스 -->
                </div>
                <!-- //추가서비스 -->

                <!-- 파일 및 비고 -->
                <div class="mt0">
                    <!-- 파일업로드 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code='global.title.fileUpload' /></h3>      <!-- 파일업로드 -->
                            <div class="btn_right">
                                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                            </div>
                        </div>
                        <div class="table_grid">
                            <table class="grid">
                                <caption></caption>
                                <thead>
                                    <tr>
                                        <th scope="col" data-field="data1"><input type="checkbox" class="form_check"></th>
                                        <th scope="col" data-field="data2"><spring:message code='global.lbl.fileNm' /></th> <!-- 파일명 -->
                                        <th scope="col" data-field="data3"><spring:message code='global.lbl.fileSize' /></th>   <!-- 파일크기 -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- //파일업로드 -->

                    <!-- 비고 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code='global.lbl.remark' /></h3>    <!-- 비고 -->
                        </div>
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.specialFact' /></th>       <!-- 특이사항 -->
                                        <td>
                                            <textarea rows="4" cols="30" placeholder="1,000字以" class="form_textarea"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- //비고 -->
                </div>
                <!-- //파일 및 비고 -->

                <!-- 용품 -->
                <div class="mt0">
                    <div class="header_area">
                        <div class="btn_right">
                            <button type="button" class="btn_s"><spring:message code='sal.lbl.goodsSelect' /></button>       <!-- 용품선택 -->
                        </div>
                    </div>
                    <div class="table_grid">
                        <table class="grid">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" data-field="data1"><spring:message code='global.lbl.check' /></th>      <!-- 선택 -->
                                    <th scope="col" data-field="data2"><spring:message code='global.lbl.no' /></th>      <!-- 번호 -->
                                    <th scope="col" data-field="data3"><spring:message code='sal.lbl.goodsCd' /></th>   <!-- 용품코드 -->
                                    <th scope="col" data-field="data4"><spring:message code='global.lbl.goodsNm' /></th>     <!-- 용품명 -->
                                    <th scope="col" data-field="data5"><spring:message code='global.lbl.prc' /></th>      <!-- 단가 -->
                                    <th scope="col" data-field="data6"><spring:message code='global.lbl.qty' /></th>      <!-- 수량 -->
                                    <th scope="col" data-field="data7"><spring:message code='global.lbl.amt' /></th>      <!-- 금액 -->
                                    <th scope="col" data-field="data8"><spring:message code='global.lbl.dcAmt' /></th>    <!-- 할인금액 -->
                                    <th scope="col" data-field="data9"><spring:message code='sal.lbl.realAmt' /></th>    <!-- 실제금액 -->
                                    <th scope="col" data-field="data10"><spring:message code='sal.lbl.giState' /></th>   <!-- 출고상태 -->
                                    <th scope="col" data-field="data11"><spring:message code='sal.lbl.cheGiTime' /></th> <!-- 예상출고시간 -->
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="4"><spring:message code='global.lbl.total' /></td>     <!-- 합계 -->
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><a href="javascript:;"><img src="../../img/btn_search.png" alt=""></a></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //용품 -->

                <!-- 부가비용 -->
                <div class="mt0">
                    <div class="header_area">
                        <div class="btn_right">
                            <div class="txt_total mt0" style="display:inline-block;position:relative;top:3px;margin-right:10px;">
                                <!-- 합계 -->
                                <p><spring:message code='global.lbl.total' />:<span>30,000</span></p>
                            </div>
                                <button id="btnOptionAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                                <button id="btnOptionDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
                                <button id="btnOptionCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>         <!-- 취소 -->
                        </div>
                    </div>
                    <div class="table_grid">
                        <table class="grid">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" data-field="data1"><spring:message code='global.lbl.chk' /></th>   <!-- 선택 -->
                                    <th scope="col" data-field="data2"><spring:message code='sal.lbl.addAtcNm' /></th> <!-- 부가항목 -->
                                    <th scope="col" data-field="data3"><spring:message code='global.lbl.amt' /></th>    <!-- 금액 -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form mt10">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:90%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.remark' /></th>     <!-- 비고 -->
                                    <td>
                                        <input type="text" value="" class="form_input">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //부가비용 -->

                <!-- 가격 -->
                <div class="mt0">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='sal.lbl.priceDetaile' /></h2>       <!-- 가격명세 -->
                        </div>
                    <div class="table_list table_list_v1">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:50%;">
                                <col>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col"><spring:message code='sal.lbl.no' /></th>         <!-- NO -->
                                    <th scope="col"><spring:message code='global.lbl.item' /></th>    <!-- 항목 -->
                                    <th scope="col"><spring:message code='global.lbl.amt' /></th>     <!-- 금액 -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="ac">1</td>
                                    <td><spring:message code='sal.lbl.whslAmt' /></td>                <!-- 구매가 -->
                                    <td class="ar child_borderNone"><input id="prcWhslAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">2</td>
                                    <td><spring:message code='sal.lbl.retlAmt' /></td>              <!-- 공장지도가 -->
                                    <td class="ar child_borderNone"><input id="prcRetlAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">3</td>
                                    <td><spring:message code='sal.lbl.promotionAmt' /></td>               <!-- 판촉금액 -->
                                    <td class="ar child_borderNone"><input id="prcPromotionAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">4</td>
                                    <td><spring:message code='sal.lbl.sbstAmt' /></td>               <!-- 치환차감 -->
                                    <td class="ar child_borderNone"><input id="prcSbstAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">5</td>
                                    <td><spring:message code='sal.lbl.goodsAmt' /></td>               <!-- 용품금액 -->
                                    <td class="ar child_borderNone"><input id="prcGoodsAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">6</td>
                                    <td><spring:message code='global.lbl.consAmt' /></td>                <!-- 탁송료 -->
                                    <td class="ar child_borderNone"><input id="prcConsAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">7</td>
                                    <td><spring:message code='sal.lbl.incAmt' /></td>                <!-- 보험료 -->
                                    <td class="ar child_borderNone"><input id="prcIncAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">8</td>
                                    <td><spring:message code='sal.lbl.prcAapAmt' /></td>              <!-- 차량등록비 -->
                                    <td class="ar child_borderNone"><input id="prcAapAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">9</td>
                                    <td><spring:message code='sal.lbl.optionAmt' /></td>               <!-- 부가비용 -->
                                    <td class="ar child_borderNone"><input id="prcVatAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td class="ac">10</td>
                                    <td><strong><spring:message code='sal.lbl.realCarAmt' /></strong></td>    <!-- 실제차량금액 -->
                                    <td class="ar child_borderNone"><strong><input id="prcRealCarAmt" class="form_numeric ar" readonly="readonly" /></strong></td>
                                </tr>
                                <tr>
                                    <td class="ac">11</td>
                                    <td><strong><spring:message code='global.lbl.oterTotAmt' /></strong></td>        <!-- 기타비용합계 -->
                                    <td class="ar child_borderNone"><strong><input id="prcEtcSumAmt" class="form_numeric ar" readonly="readonly" /></strong></td>
                                </tr>
                                <tr>
                                    <td class="ac">12</td>
                                    <td><strong><spring:message code='sal.lbl.realPayAmt' /></strong></td>        <!-- 실제지불금액 -->
                                    <td class="ar td_total child_borderNone"><input id="prcRealPayAmt" class="form_numeric ar" readonly="readonly" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //가격 -->
            </div>
            <!-- //탭메뉴 전체 영역 -->

        </div>
        <!-- //车种1 -->





    </div>






</section>
<!-- 车辆信息 -->


<script>
$(document).ready(function() {
    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".form_numeric").kendoExtNumericTextBox();
    $(".grid").kendoGrid();
    $(".btn_s, .btn_m").kendoButton();
    $(".tab_area").kendoExtTabStrip({
        animation:false
    });
});
</script>
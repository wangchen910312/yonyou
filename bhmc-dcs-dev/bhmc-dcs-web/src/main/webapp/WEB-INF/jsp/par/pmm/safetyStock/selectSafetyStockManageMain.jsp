<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><!-- 合理库存参数管理 --></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search">查询</button><!-- 조회 -->
            <button type="button" class="btn_m btn_save">保存</button><!-- 저장 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:16%;">
                <col style="width:4%;">
                <col style="width:16%;">
                <col style="width:12%;">
                <col style="width:16%;">
                <col style="width:10%;">
                <col style="width:16%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required">需求期间</span></th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"></th>
                    <td>
                        <label class="label_check"><input type="checkbox" name="" class="form_check"> 平均偏差反应与否</label>
                    </td>
                    <th scope="row">平均偏差反应比例</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">产品区分</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th/>
                    <td/>
                    <th/>
                    <td/>

                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic">需求期间加权值信息</h2>
    </div>
    <div class="table_list">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%">
                <col style="width:8%">
                <col style="width:14%">
                <col style="width:14%">
                <col style="width:14%">
                <col style="width:14%">
                <col style="width:14%">
                <col style="width:14%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">M</th>
                    <th scope="col">合计</th>
                    <th scope="col">M</th>
                    <th scope="col">M-1</th>
                    <th scope="col">M-2</th>
                    <th scope="col">M-3</th>
                    <th scope="col">M-4</th>
                    <th scope="col">M-5</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row" rowspan="2" class="bob_none">加权值</th>
                    <td class="td_total ac bob_none">6</td>
                    <td class="ac">1.4</td>
                    <td class="ac">1.2</td>
                    <td class="ac">1</td>
                    <td class="ac">1</td>
                    <td class="ac">0.8</td>
                    <td class="ac">0.6</td>
                </tr>
                <tr>
                    <td class="td_total ac bob_none">100%</td>
                    <td class="ac">23%</td>
                    <td class="ac">20%</td>
                    <td class="ac">17%</td>
                    <td class="ac">17%</td>
                    <td class="ac">13%</td>
                    <td class="ac">10%</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_list mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:16%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
                <col style="width:7%">
            </colgroup>
                <thead>
                    <tr>
                        <th scope="col">管理规则</th>
                        <th scope="col">A1</th>
                        <th scope="col">A2</th>
                        <th scope="col">A3</th>
                        <th scope="col">B1</th>
                        <th scope="col">B2</th>
                        <th scope="col">B3</th>
                        <th scope="col">C1</th>
                        <th scope="col">C2</th>
                        <th scope="col">C3</th>
                        <th scope="col">D1</th>
                        <th scope="col">D2</th>
                        <th scope="col">E1</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">订单频次</th>
                        <td class="ac">0.25</td>
                        <td class="ac">0.25</td>
                        <td class="ac">0.25</td>
                        <td class="ac">0.5</td>
                        <td class="ac">0.5</td>
                        <td class="ac">0.5</td>
                        <td class="ac">1</td>
                        <td class="ac">1</td>
                        <td class="ac">1</td>
                        <td class="ac">0</td>
                        <td class="ac">0</td>
                        <td class="ac">0</td>
                    </tr>
                    <tr>
                        <th scope="row">到货周期L/T</th>
                        <td class="ac">0.2</td>
                        <td class="ac">0.2</td>
                        <td class="ac">0.2</td>
                        <td class="ac">0.2</td>
                        <td class="ac">0.2</td>
                        <td class="ac">0.2</td>
                        <td class="ac">0.1</td>
                        <td class="ac">0.1</td>
                        <td class="ac">0.1</td>
                        <td class="ac">0</td>
                        <td class="ac">0</td>
                        <td class="ac">0</td>
                    </tr>
                    <tr>
                        <th scope="row">安全库存MOS</th>
                        <td class="ac">0.8</td>
                        <td class="ac">0.8</td>
                        <td class="ac">0.8</td>
                        <td class="ac">1.3</td>
                        <td class="ac">1.3</td>
                        <td class="ac">1.3</td>
                        <td class="ac">1.5</td>
                        <td class="ac">1.5</td>
                        <td class="ac">1.5</td>
                        <td class="ac">0.5</td>
                        <td class="ac">0.5</td>
                        <td class="ac">2</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <p class="mt5">合理库存 = 月均需求 × (订单频次 +到货周期L/T + 安全库存MOS  +特殊) </p>

    </section>
<!-- script -->
<script type="text/javascript">

$(document).ready(function() {


    $(".form_comboBox").kendoExtDropDownList();

    //btn
    $(".btn_m").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");

        }
    });
    //btn
    $(".btn_s").kendoButton({
        click:function(e){
            // ready message
            dms.notification.success("<spring:message code='global.info.ready'/>");
        }
    });

    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });

});

</script>
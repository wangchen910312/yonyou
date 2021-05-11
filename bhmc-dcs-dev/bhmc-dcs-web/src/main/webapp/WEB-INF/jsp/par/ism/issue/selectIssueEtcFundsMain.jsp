<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 其他出库信息 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 其他出库信息 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_delete">取消</button><!-- 취소 -->
                <button class="btn_m">打印</button><!-- 인쇄 -->
                <button class="btn_m btn_save">确认</button><!-- 확인 -->
                <button type="button" class="btn_m btn_reset">初始化<!-- 초기화 --></button>
                <button class="btn_m btn_search">查询</button><!-- 조회 -->
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
                        <th scope="row"><span class="bu_required">其他出库类型</span></th>
                        <td class="required_area">
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required">经销商</span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">出库单号</th>
                        <td>
                            <div class="form_search form_search_disabled">
                                <input type="text" value="" disabled class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">配件编号</th>
                        <td>
                            <div class="form_search form_search_disabled">
                                <input type="text" value="" disabled class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">配件名称</th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">出库日期<!-- 일자 --></th>
                        <td class="required_area">
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
                        <th scope="row">数量总计</th>
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">金额总计</th>
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s">从表格复制</button>
                <button type="button" class="btn_s">配件搜索</button>
                <button type="button" class="btn_s">添加行</button><!-- 행추가 -->
                <button type="button" class="btn_s">删除行</button><!-- 행삭제 -->
            </div>
        </div>

        <div class="table_grid">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">选择<!--  --></th>
                        <th scope="col" data-field="data2">出库单号<!--  --></th>
                        <th scope="col" data-field="data3">配件编码<!--  --></th>
                        <th scope="col" data-field="data4">配件名称<!--  --></th>
                        <th scope="col" data-field="data5">数量<!--  --></th>
                        <th scope="col" data-field="data6">单价<!--  --></th>
                        <th scope="col" data-field="data7">出库仓库<!--  --></th>
                        <th scope="col" data-field="data8">货位<!--  --></th>
                        <th scope="col" data-field="data9">零售价<!--  --></th>
                        <th scope="col" data-field="data10">单位<!--  --></th>
                        <th scope="col" data-field="data11">金额<!--  --></th>
                        <th scope="col" data-field="data12">税额 <!--  --></th>
                        <th scope="col" data-field="data13">出库原因<!--  --></th>
                        <th scope="col" data-field="data14">出库日期<!--  --></th>
                        <th scope="col" data-field="data15">出库时间<!--  --></th>
                        <th scope="col" data-field="data16">领料人<!--  --></th>
                        <th scope="col" data-field="data17">退回数量<!--  --></th>
                        <th scope="col" data-field="data18">取消日期<!--  --></th>
                        <th scope="col" data-field="data19">取消时间<!--  --></th>
                        <th scope="col" data-field="data20">取消者<!--  --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // 其他出库信息 -->

<!-- script -->
<script>
    var toDt                = "${toDt}",
        mvtTpList           = [];

        mvtTpList.push({cmmCd:"61", cmmCdNm:"调拨出库"});

        $(document).ready(function() {


            $(".form_comboBox").kendoExtDropDownList();

           //기타출고유형선택
            $("#mvtTp").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:mvtTpList
                ,index:0
            });

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
            $(".grid").kendoGrid({
                height:219
            });
        });
</script>
<!-- //script -->


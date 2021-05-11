<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 客户信息 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><!-- 客户信息 --></h1>
                    <div class="btn_left">
                        <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
                    </div>
                    <div class="btn_right">
                        <button class="btn_m" id="btnConfirm"><spring:message code="global.btn.confirm" /><!-- 확인 --></button>
                        <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
                    </div>
                </div>
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
                                <th scope="row">客户类型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">销售类型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">销售单号</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">客户名称</th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">状态</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">销售日期</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">电话</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">销售顾问</th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">折扣率</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">客户备注</th>
                                <td colspan="3">
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">担当者</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <th scope="row">总金额 </th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">折扣金额</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">总计</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th/>
                                <td/>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic">入库信息</h2>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">供应商</th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                                <th scope="row">税率 </th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">入库单号</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">担当者</th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">备注</th>
                                <td colspan="5">
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic">配件信息</h2>
                    <div class="btn_right">
                        <button class="btn_s btn_s_min5" id="itemPop"><spring:message code="par.btn.itemPop" /></button><!-- 부품팝업 -->
                        <button class="btn_s btn_add btn_s_min5" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 행추가 添加行 -->
                        <button class="btn_s btn_del btn_s_min5" id="btnDel"><spring:message code="global.btn.rowDel" /></button><!-- 행삭제?除行  -->
                    </div>
                </div>
                <div class="table_grid">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">选择<!--  --></th>
                                <th scope="col" data-field="data2"> 配件编码<!--  --></th>
                                <th scope="col" data-field="data3">配件名称<!--  --></th>
                                <th scope="col" data-field="data4">数量<!--  --></th>
                                <th scope="col" data-field="data5">入库价(不含税)<!--  --></th>
                                <th scope="col" data-field="data6">入库价<!--  --></th>
                                <th scope="col" data-field="data7">入库金额<!--  --></th>
                                <th scope="col" data-field="data8">出库价<!--  --></th>
                                <th scope="col" data-field="data9">出库金额<!--  --></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </section>
            <!-- //客户信息 -->

<!-- script -->
<script>
    $(document).ready(function() {
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".form_comboBox").kendoExtDropDownList();
        $(".form_numeric").kendoExtNumericTextBox();
        $(".grid").kendoGrid({
            height:311
        });
        $(".btn_s, .btn_m").kendoButton();
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });



    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.info.ready' />");
        }
    });
    // 확인 버튼
    $("#btnConfirm").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.info.ready' />");
        }
    });
    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.info.ready' />");
        }
    });

    //부품팝업
    $("#itemPop").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.info.ready' />");
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.info.ready' />");
        }
    });
    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.info.ready' />");
        }
    });

});


</script>
<!-- //script -->
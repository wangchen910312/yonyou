<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>



            <!-- 부품예약 영역 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><!-- 配件预约 --></h1><!-- 부품예약 -->
                    <div class="btn_right">
                        <button class="btn_m" id="btnConfirm"><spring:message code="global.btn.confirm" /><!-- 확인 --></button>
                        <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
                        <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
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
                                <th scope="row">委托类型<!-- 위탁유형 --></th>
                                <td>
                                    <input value="" class="form_comboBox">
                                </td>
                                <th scope="row">维修委托号码<!-- 위탁서번호 --></th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">维修领用状态<!-- 상태 --></th>
                                <td>
                                    <input value="" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required">委托日期<!-- 위탁일자 --></span></th>
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
                                <th scope="row">客户编号<!-- 고객번호 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                                <th scope="row">客户名<!-- 고객명 --></th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">服务顾问<!-- 정비담당 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                                <th scope="row">车牌号<!-- 차량번호--></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
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
                                <th scope="col" data-field="data1">序<!-- 번호 --></th>
                                <th scope="col" data-field="data2">维修领用状态<!-- 상태 --></th>
                                <th scope="col" data-field="data3">委托日期<!-- 일자 --></th>
                                <th scope="col" data-field="data4">委托类型<!-- 유형 --></th>
                                <th scope="col" data-field="data5">维修委托号码<!-- 위탁서번호 --></th>
                                <th scope="col" data-field="data6">客户名<!-- 고객명 --></th>
                                <th scope="col" data-field="data7">车牌号<!-- 차량번호 --></th>
                                <th scope="col" data-field="data8">车型<!-- 차형 --></th>
                                <th scope="col" data-field="data9">服务顾问<!-- 정비담당 --></th>
                                <th scope="col" data-field="data10">备注<!-- 비고 --></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
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
                            <col style="width:24%;">
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
                                <td colspan="7">
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
                                <th scope="col" data-field="data2">配件编码<!--  --></th>
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
            <!-- // 부품예약 영역 -->
<!-- script -->
<script>
    $(document).ready(function() {
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".grid").kendoGrid({
            height:150
        });
        $(".form_comboBox").kendoExtDropDownList();



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
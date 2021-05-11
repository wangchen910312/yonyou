<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 공구목록 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 工具列表 --></h1><!-- 공구목록 -->
            <div class="btn_right">
                <button class="btn_m btn_search">查询</button><!-- 조회 -->
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
                        <th scope="row">供应商类型</th><!-- 공급상유형 -->
                        <td>
                            <input type="text" value="" class="form_comboBox">
                        </td>
                        <th scope="row">工具编号</th><!-- 공구번호 -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">工具名称</th><!-- 공구명칭 -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">序</th><!-- 번호 -->
                        <th scope="col" data-field="data2">工具编号</th><!-- 공구번호 -->
                        <th scope="col" data-field="data3">工具名称</th><!-- 공구명칭 -->
                        <th scope="col" data-field="data4">库存</th><!-- 재고 -->
                        <th scope="col" data-field="data5">借出数量</th><!-- 차용수량 -->
                        <th scope="col" data-field="data6">价格</th><!-- 단가 -->
                        <th scope="col" data-field="data7">产品分类</th><!-- 부품분류 -->
                        <th scope="col" data-field="data8">供应商</th><!-- 공급상 -->
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //공구목록 -->

    <!-- 관리현황 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic">管理汇总</h2><!-- 관리현황 -->
        </div>
        <div class="table_grid">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">序</th><!-- 번호 -->
                        <th scope="col" data-field="data2">工具类型</th><!-- 공구유형 -->
                        <th scope="col" data-field="data3">工具编号</th><!-- 공구번호 -->
                        <th scope="col" data-field="data4">工具名称</th><!-- 공구명칭 -->
                        <th scope="col" data-field="data5">库存</th><!-- 재고 -->
                        <th scope="col" data-field="data6">维修技师</th><!-- 작업자 -->
                        <th scope="col" data-field="data7">借出数量</th><!--  -->
                        <th scope="col" data-field="data8">借出日期</th><!--  -->
                        <th scope="col" data-field="data9">归还数量</th><!--  -->
                        <th scope="col" data-field="data10">归还日期</th><!--  -->
                        <th scope="col" data-field="data11">报损数量</th><!--  -->
                        <th scope="col" data-field="data12">报损日期</th><!--  -->
                        <th scope="col" data-field="data13">担当者</th><!--  -->
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //관리현황 -->
<script>
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

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 其他出库信息 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 其他出库信息 --></h1>
            <div class="btn_left">
                <button type="button" class="btn_m btn_reset">初始化<!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_save">确  认</button><!-- 확인 -->
                <button class="btn_m btn_search">查      询</button><!-- 조회 -->
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGiTp" /><!-- 기타출고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required">维修技师</span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">出库单号</th>
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th/>
                        <td/>
                    </tr>
                    <tr>
                        <th scope="row">工具编号</th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">工具名称</th>
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">出库日期</th>
                        <td colspan="3">
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
                            <input type="text" value="0" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">金额总计</th>
                        <td>
                            <input type="text" value="0" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">担当者</th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">维修委托号码</th>
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

        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s btn_s_min5">添加</button><!-- 행추가 -->
                <button type="button" class="btn_s btn_s_min5">删除</button><!-- 행삭제 -->
            </div>
        </div>

        <div class="table_grid">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">选择<!--  --></th>
                        <th scope="col" data-field="data2">出库单号<!--  --></th>
                        <th scope="col" data-field="data3">工具编码<!--  --></th>
                        <th scope="col" data-field="data4">工具名称<!--  --></th>
                        <th scope="col" data-field="data5">数量<!--  --></th>
                        <th scope="col" data-field="data6">库存数量<!--  --></th>
                        <th scope="col" data-field="data7">单位<!--  --></th>
                        <th scope="col" data-field="data8">出库仓库<!--  --></th>
                        <th scope="col" data-field="data9">货位<!--  --></th>
                        <th scope="col" data-field="data10">维修项目<!--  --></th>
                        <th scope="col" data-field="data11">备注<!--  --></th>
                        <th scope="col" data-field="data12">出库日期<!--  --></th>
                        <th scope="col" data-field="data13">出库时间<!--  --></th>
                        <th scope="col" data-field="data14">维修技师<!--  --></th>
                        <th scope="col" data-field="data15">归还日期<!--  --></th>
                        <th scope="col" data-field="data16">归还时间<!--  --></th>
                        <th scope="col" data-field="data17">担当者<!--  --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // 其他出库信息 -->
<script>
var toDt                = "${toDt}",
    mvtTpList           = [];

    mvtTpList.push({cmmCd:"51", cmmCdNm:"工具借用"});
    mvtTpList.push({cmmCd:"52", cmmCdNm:"工具报损"});
    mvtTpList.push({cmmCd:"53", cmmCdNm:"工具归还"});

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
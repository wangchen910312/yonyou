<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 입출고현황조회 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><!-- 出入库单查询 --></h1><!-- 입출고현황조회 -->
                    <div class="btn_right">
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
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">出入库类型</th><!-- 입출고유형 -->
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">出入库单编号</th><!-- 입출고문서번호 -->
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">出入库年月</th><!-- 입출고년월 -->
                                <td>
                                    <input type="text" value="" class="form_monthpicker">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">出入库日期</th><!-- 입출고일자 -->
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
                                <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sItemCd" class="form_input">
                                        <a id="searchItemCd"><!-- 검색 --></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                                <td>
                                    <input type="text" id="sItemNm" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">产品区分</th><!-- 부품분류 -->
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">配件等级</th><!-- 부품등급 -->
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">车型</th><!-- 차형 -->
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">仓库</th><!-- 창고 -->
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">货位</th><!-- 로케이션 -->
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">客户</th><!-- 고객 -->
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;"><!-- 검색 --></a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 탭메뉴 전체 영역 -->
                <div class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active">入库</li><!-- 입고 -->
                        <li>出库</li><!-- 출고 -->
                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 입고 -->
                    <div>
                        <div class="table_grid">
                            <table class="grid">
                                <caption></caption>
                                <colgroup>
                                    <col style="width:50px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:100px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" data-field="data1">序</th><!-- 번호 -->
                                        <th scope="col" data-field="data2">出入库类型</th><!-- 입출고유형 -->
                                        <th scope="col" data-field="data3">出入库日期</th><!-- 입출고일자 -->
                                        <th scope="col" data-field="data4">出入库单编号</th><!-- 입출고문서번호 -->
                                        <th scope="col" data-field="data5">配件编号</th><!-- 부품번호 -->
                                        <th scope="col" data-field="data6">配件名称</th><!-- 부품명 -->
                                        <th scope="col" data-field="data7">数量</th><!-- 수량 -->
                                        <th scope="col" data-field="data8">单价</th><!-- 단가 -->
                                        <th scope="col" data-field="data9">金额</th><!-- 금액 -->
                                        <th scope="col" data-field="data10">税额</th><!-- 세액 -->
                                        <th scope="col" data-field="data11">处理人</th><!-- 담당자 -->
                                        <th scope="col" data-field="data12">入库日期</th><!-- 입고일자 -->
                                        <th scope="col" data-field="data13">入库时间</th><!-- 입고시간 -->
                                        <th scope="col" data-field="data14">取消数量</th><!-- 반품수량 -->
                                        <th scope="col" data-field="data15">取消日期</th><!-- 반품일자 -->
                                        <th scope="col" data-field="data16">取消时间</th><!-- 반품시간 -->
                                        <th scope="col" data-field="data17">取消人</th><!-- 반품인 -->
                                        <th scope="col" data-field="data18">备注</th><!-- 비고 -->
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
                    </div>
                    <!-- //입고 -->

                    <!-- 출고 -->
                    <div>
                        <div class="table_grid">
                            <table class="grid">
                                <caption></caption>
                                <colgroup>
                                    <col style="width:50px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:100px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                    <col style="width:80px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" data-field="data1">序</th><!-- 번호 -->
                                        <th scope="col" data-field="data2">出入库类型</th><!-- 입출고유형 -->
                                        <th scope="col" data-field="data3">出入库日期</th><!-- 입출고일자 -->
                                        <th scope="col" data-field="data4">出入库单编号</th><!-- 입출고문서번호 -->
                                        <th scope="col" data-field="data5">配件编号</th><!-- 부품번호 -->
                                        <th scope="col" data-field="data6">配件名称</th><!-- 부품명 -->
                                        <th scope="col" data-field="data7">数量</th><!-- 수량 -->
                                        <th scope="col" data-field="data8">单价</th><!-- 단가 -->
                                        <th scope="col" data-field="data9">金额</th><!-- 금액 -->
                                        <th scope="col" data-field="data10">税额</th><!-- 세액 -->
                                        <th scope="col" data-field="data11">处理人</th><!-- 담당자 -->
                                        <th scope="col" data-field="data12">出库日期</th><!-- 출고일자 -->
                                        <th scope="col" data-field="data13">出库时间</th><!-- 출고시간 -->
                                        <th scope="col" data-field="data14">退回数量</th><!-- 반품수량 -->
                                        <th scope="col" data-field="data15">退回日期</th><!-- 반품일자 -->
                                        <th scope="col" data-field="data16">退回时间</th><!-- 반품시간 -->
                                        <th scope="col" data-field="data17">退回人</th><!-- 반품인 -->
                                        <th scope="col" data-field="data18">备注</th><!-- 비고 -->
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
                    </div>
                    <!-- //출고 -->
                </div>
                <!-- //탭메뉴 전체 영역 -->
            </section>
            <!-- //입출고현황조회 -->


        <script>
         var userSearchPopupWin,
             searchItemPopupWindow;


            $(".form_datepicker").kendoDatePicker({
                format:"yyyy-MM-dd"
            });
            $(".form_comboBox").kendoExtDropDownList();
            $(".form_numeric").kendoExtNumericTextBox();
            $(".grid").kendoGrid({
                height:382
            });
            //$(".btn_s, .btn_m").kendoButton();
            $(".tab_area").kendoExtTabStrip({
                animation:false
            });

            $(".btn_s, .btn_m").kendoButton({
                click:function(e) {
                    dms.notification.warning("<spring:message code='global.info.ready'/>");
                }
            });

            $("#searchItemCd").on('click', selectPartsMasterPopupWindow);




     // 부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"itemCd":$("#sItemCd").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sItemCd").val(data[0].itemCd);
                                $("#sItemNm").val(data[0].itemNm);
                            }
                        }
                    }
                }
            });
        }

        function userSearchPopup() {
            userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"usrNm":""
                        ,"callbackFunc":function(data){
                            if(data.length > 0){
                                $("#sPrsnId").val(data[0].usrId);

                            }
                           // userSearchPopupWin.close();
                        }
                    }
                }

            });
        }

        </script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style>
.explist{padding:5px 0 0 10px;}
.explist li{padding:2px;}
.imglistarea{margin-top:10px;border:1px solid #e7e7e7;background:#f7f7f7;}
.imglist{overflow:hidden;padding:10px;}
.imglist li{width:16.5%;float:left;text-align:center;}
.imglist li sapn{width:120px;height:120px;}
.imglist li sapn img{width:100%;height:100%;}

</style>


<!-- content -->
<section id="content">
    <div class="header_area">
        <h1 class="title_basic">基本信息注册</h1><!-- 기본정보등록관리 -->
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>


    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active">车辆基本信息</li><!-- 차량기본정보 -->
            <li>客户信息</li><!-- 고객정보 -->
            <li>车辆详细信息</li><!-- 차량상세정보 -->
            <li>车辆配置信息</li><!-- 차량옵션정보 -->
            <li>车辆价格信息</li><!-- 차량가격정보 -->
            <li>车辆图片信息</li><!-- 차량이미지정보 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 탭내용1 车辆基本信息 -->
        <div>

            <!-- 2depth 탭 -->
            <div class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active">传统模式</li><!-- 전통방식 -->
                    <li>VIN(车架号)模式</li><!-- VIN(차대번호)방식 -->
                    <li>国际码模式</li><!-- 국제코드방식 -->
                </ul>
                <!-- //탭메뉴 -->

                <!-- 탭내용1-1 -->
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
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required">品牌</span></th><!-- 브랜드 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车种</span></th><!-- 차종 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车型</span></th><!-- 모델 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆类型</span></th><!-- 차량유형 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车架号(VIN)</span></th><!-- 차대번호(VIN) -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">车辆型号</th><!-- 차량번호 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled" style="width:70%;margin-right:3px">(万元)<!-- (만원) -->
                                    </td>
                                    <th scope="row"><span class="bu_required">登记年份</span></th><!-- 등록년 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">档位形式</span></th><!-- 기어방식 -->
                                    <td class="required_area">
                                        <input value="" disabled class="form_comboBox">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">发动机</th><!-- 엔진 -->
                                    <td class="required_area">
                                        <input value="" disabled class="form_comboBox">
                                    </td>
                                    <th scope="row"><span class="bu_required">排量</span></th><!-- 배기량 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">排放标准</span></th><!-- 배기표준 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车牌字头</span></th><!-- 차량번호판 첫번째문자 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">油漆级别</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆颜色</span></th><!-- 차량색상 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">行驶里程</span></th><!-- 주행거리 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车辆所在地</span></th><!-- 차량소재지 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">蓝本参考价</th>
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车身形式</span></th><!--  -->
                                    <td colspan="3">
                                        <div class="form_float">
                                            <div class="form_left" style="width:34%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                            <div class="form_left" style="width:33%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                            <div class="form_right" style="width:33%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"><span class="bu_required">燃料</span></th><!-- 연료 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">缸数</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //탭내용1-1 -->

                <!-- 탭내용1-2 -->
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
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required">车架号(VIN)</span></th><!-- 차대번호(VIN) -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">品牌</span></th><!-- 브랜드 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车种</span></th><!-- 차종 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车型</span></th><!-- 모델 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车辆型号</span></th><!-- 차량번호 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">蓝本参考价</th>
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled" style="width:70%;margin-right:3px">(万元)<!-- (만원) -->
                                    </td>
                                    <th scope="row"><span class="bu_required">档位形式</span></th><!-- 기어방식 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">发动机</th><!-- 엔진 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">燃料</span></th><!-- 연료 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">排放标准</span></th><!-- 배기표준 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车牌字头</span></th><!-- 차량번호판 첫번째 문자 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">油漆级别</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆颜色</span></th><!-- 차량색생 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆类型</span></th><!-- 차량유형 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">行驶里程</span></th><!-- 주행거리 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆所在地</span></th><!-- 차량소재지 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆所在地</span></th><!-- 차량소재지 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车辆类型</span></th><!-- 차량유형 -->
                                    <td colspan="3">
                                        <div class="form_float">
                                            <div class="form_left" style="width:34%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                            <div class="form_left" style="width:33%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                            <div class="form_right" style="width:33%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"><span class="bu_required">缸数</span></th>
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">排量</span></th><!-- 배기량 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //탭내용1-2 -->

                <!-- 탭내용1-3 -->
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
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required">车辆型号</span></th><!-- 차량번호 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">品牌</span></th><!-- 브랜드 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车种</span></th><!-- 차종 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车型</span></th><!-- 모델 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">行驶里程</span></th><!-- 주행거리 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车架号(VIN)</span></th><!-- 차량번호(VIN) -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">蓝本参考价</th>
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled" style="width:70%;margin-right:3px">(万元)
                                    </td>
                                    <th scope="row"><span class="bu_required">档位形式</span></th><!-- 기어방식 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">发动机</th><!-- 엔진 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">燃料</span></th><!-- 연료 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">排放标准</span></th><!-- 배기표준 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车牌字头</span></th><!-- 차량번호판 첫번째 문자 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">油漆级别</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆颜色</span></th><!-- 차량색상 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆类型</span></th><!-- 차량유형 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">车辆所在地</span></th><!-- 차량소재지 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">登记年份</span></th><!-- 등록년도 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">车辆类型</span></th><!-- 차량유형 -->
                                    <td colspan="3">
                                        <div class="form_float">
                                            <div class="form_left" style="width:34%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                            <div class="form_left" style="width:33%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                            <div class="form_right" style="width:33%">
                                                <input value="" disabled class="form_comboBox">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">缸数</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">排量</span></th><!-- 배기량 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //탭내용1-3 -->
            </div>
            <!-- // 2depth 탭 -->

        </div>
        <!-- //탭내용1 车辆基本信息 -->

        <!-- 탭내용2 客户信息-->
        <div>

            <!-- 2depth 탭 -->
            <div class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active">个人客户</li><!-- 개인고객 -->
                    <li>商家客户</li><!-- 법인고객 -->
                </ul>
                <!-- //탭메뉴 -->

                <!-- 탭내용2-1 -->
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
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required">姓名</span></th><!-- 이름 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">联系电话一</span></th><!-- 연락처1 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">联系电话二</th><!-- 연락처2 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">Email地址</th><!-- 이메일주소 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">证件类别</span></th><!--  -->
                                    <td class="required_area">
                                        <input value="" disabled class="form_comboBox">
                                    </td>
                                    <th scope="row"><span class="bu_required">证件号码</span></th><!--  -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">证件地址</span></th><!--  -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">详细地址</th><!-- 상세주소 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //탭내용2-1 -->

                <!-- 탭내용2-2 -->
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
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required">商家名称</span></th><!-- 법인명 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row"><span class="bu_required">商家名称</span></th><!-- 법인명 -->
                                    <td class="required_area">
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">联系人二</th><!-- 연락인1 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">联系电话一</th><!-- 연락처1 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">联系电话二</th><!-- 연락처2 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">商家性质</th><!-- 법인성격 -->
                                    <td>
                                        <input value="" disabled class="form_comboBox">
                                    </td>
                                    <th scope="row"><span class="bu_required">证件类别</span></th><!--  -->
                                    <td class="required_area">
                                        <input value="" disabled class="form_comboBox">
                                    </td>
                                    <th scope="row"><span class="bu_required">证件号码</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required">证件地址</span></th><!--  -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">邮政编码</th><!-- 우편번호 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                    <th scope="row">详细地址</th><!-- 상세정보 -->
                                    <td>
                                        <input type="text" value="" disabled class="form_input form_disabled">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //탭내용2-2 -->
            </div>
            <!-- // 2depth 탭 -->

        </div>
        <!-- // 탭내용2 客户信息-->

        <!-- 탭내용3 车辆详细信息-->
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">购入渠道</th><!-- 구매채널 -->
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row"><span class="bu_required">发动机号码</span></th><!-- 엔진번호 -->
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row"><span class="bu_required">交易方式</span></th><!-- 거래방식 -->
                            <td class="required_area">
                                <input value="" disabled class="form_comboBox">
                            </td>
                            <th scope="row">联系电话一</th><!-- 연락처1 -->
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">消息来源</th><!--  -->
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row"><span class="bu_required">车牌号码(原)</span></th><!-- 차량번호(기존) -->
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row"><span class="bu_required">车牌号码(过户后)</span></th><!-- 차량번호() -->
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row"><span class="bu_required">车船税截止期限</span></th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required">交强险</span></th>
                            <td>
                                <label class="label_check"><input type="radio" name="radio1" disabled checked class="form_check"> 有</label>
                                <label class="label_check"><input type="radio" name="radio1" disabled class="form_check"> 无</label>
                            </td>
                            <th scope="row"><span class="bu_required">商业保险</span></th>
                            <td colspan="5">
                                <label class="label_check"><input type="checkbox" name="" disabled checked class="form_check"> 无</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 车损</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 三者</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 盗抢</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 车上人员</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 不计免赔</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 玻璃</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 划痕</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 涉水</label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required">交强险期限</span></th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row">是否带牌销售</th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row">仓储地点</th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row">商业险期限</th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required">年检截止日期</span></th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row"><span class="bu_required">收购日期</span></th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row">保单</th>
                            <td>
                                <label class="label_check"><input type="radio" name="radio2" disabled checked class="form_check"> 有</label>
                                <label class="label_check"><input type="radio" name="radio2" disabled class="form_check"> 无</label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" colspan="3">二手车发票号(认证车可为新车发票号)</th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                            <th scope="row" colspan="3">二手车发票日期(认证车可为新车发票日期)</th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required">商业保险</span></th>
                            <td colspan="7">
                                <label class="label_check"><input type="checkbox" name="" disabled checked class="form_check"> 登记证</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 行驶证</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 购置税证</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 原始购车发票(新车发票)</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 购置税票</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 过户票</label>
                                <label class="label_check"><input type="checkbox" name="" disabled  class="form_check"> 环保证</label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">截止日期</th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //탭내용3 车辆详细信息-->

        <!-- 탭내용4 车辆配置信息-->
                <div>
                    <textarea rows="10" cols="" disabled class="form_textarea">
备胎尺寸规格:非全尺寸
变速器类型:手自一体
车门数:4
档位个数:6
动力形式:汽油机
发动机类型:自然吸气
发动机位置:前置
发动机型号:Nu
方向盘调节方向数:4
副驾驶座椅调节方向数:4
                    </textarea>
                    <p class="mt5">如果填写车辆的配置信息，请在车辆详细信息栏上填写</p>
                </div>
                <!-- //탭내용4 车辆配置信息-->

        <!-- 탭내용5 车辆价格信息-->
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required">预售价</span></th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled" style="width:78%;margin-right:3px">(万)
                            </td>
                            <th scope="row"><span class="bu_required">评估价</span></th>
                            <td>
                                <input type="text" value="" disabled class="form_input form_disabled" style="width:78%;margin-right:3px">(万)
                            </td>
                            <th scope="row"><span class="bu_required">评估人</span></th>
                            <td class="required_area">
                                <input type="text" value="" disabled class="form_input form_disabled">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //탭내용5 车辆价格信息-->

        <!-- 탭내용6 车辆图片信息-->
        <div class="mt0">
            <div class="clfix">
                <section class="left_areaStyle">
                    <div class="header_area">
                        <h2 class="title_basic">要求</h2>
                    </div>
                    <ul class="explist">
                        <li>- 至少上传3张照片，认证4S店上传的认证车辆，必须上传6张照片</li>
                        <li>- 分辨率：800*600至1024*768，照片500K以下</li>
                    </ul>
                </section>
                <section class="right_areaStyle">
                    <div class="header_area">
                        <h2 class="title_basic">6方位照片角度</h2>
                    </div>
                    <ul class="explist">
                        <li>1. 左前方45°带号牌（必传）</li>
                        <li>2. 仪表盘公里数（必传）</li>
                        <li>3. 前风挡下车架号（必传） </li>
                        <li>4. 前排内饰（认证车必传）</li>
                        <li>5. 后排内饰（认证车必传）</li>
                        <li>6. 发动机舱（认证车必传）</li>
                    </ul>
                </section>
            </div>
            <%-- <div class="img_car"><img src="<c:url value='/resources/img/img_login_car.png' />" alt=""></div> --%>
            <div class="imglistarea">
                <ul class="imglist">
                    <li><span><img src="<c:url value='/resources/img/sal_samplecar_s.png' />" alt=""></span></li>
                    <li><span><img src="<c:url value='/resources/img/sal_samplecar_s.png' />" alt=""></span></li>
                    <li><span><img src="<c:url value='/resources/img/sal_samplecar_s.png' />" alt=""></span></li>
                    <li><span><img src="<c:url value='/resources/img/sal_samplecar_s.png' />" alt=""></span></li>
                    <li><span><img src="<c:url value='/resources/img/sal_samplecar_s.png' />" alt=""></span></li>
                    <li><span><img src="<c:url value='/resources/img/sal_samplecar_s.png' />" alt=""></span></li>
                </ul>
            </div>
        </div>
        <!-- //탭내용6 车辆图片信息-->

    </div>
    <!-- //탭메뉴 전체 영역 -->

    <!-- 基本信息  -->
    <section class="group">
        <div class="table_grid mt10">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">车辆编号(VIN)<!--  --></th>
                        <th scope="col" data-field="data2">车辆名称<!--  --></th>
                        <th scope="col" data-field="data3">材料名称<!--  --></th>
                        <th scope="col" data-field="data4">上传状态 <!--  --></th>
                        <th scope="col" data-field="data5">操作<!--  --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </section>
    <!-- // 基本信息  -->

</section>
<!-- //content -->



<!-- script -->
<script>
$(document).ready(function() {
    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });


    $(".form_datepicker").kendoDatePicker();
    $(".grid").kendoGrid({
        height:242
    });
    $(".form_comboBox").kendoExtDropDownList();
    $("#tabstrip, #tabstrip2, .tab_area").kendoExtTabStrip({
        animation:false
    });
});
</script>
<!-- //script -->
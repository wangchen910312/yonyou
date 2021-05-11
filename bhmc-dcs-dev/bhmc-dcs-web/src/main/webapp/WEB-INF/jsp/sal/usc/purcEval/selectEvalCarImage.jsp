<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 중고차매입/평가관리 - 차량이미지 평가용 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_center2">北京现代二手车车辆状态评估表</h1><!-- 북경현대중고차차량상태평가표 -->
    </div>

<div class="viewEvalVal">
<form id="detailImageValForm" name="detailImageValForm" method="POST" action="/">
    <div class="header_area">
        <div class="left_area ml0">
            <ul class="txt_input2">
                <li><span class="span_txt">特约店名称：</span><input id="dlrNm" name="dlrNm" type="text" class="form_input form_input3" data-bind="value:dlrNm" data-json-obj="true"></li><!-- 딜러명 -->
                <li><span class="span_txt">特约店代码：</span><input id="dlrCd" name="dlrCd" type="text" class="form_input form_input3" ></li><!-- 딜러코드 -->
                <li><input id="purcNo" name="purcNo" type="hidden" /></li>
            </ul>
        </div>
        <div class="btn_right">
            <button id="btnSave" type="button" class="btn_m">保存</button>
        </div>
    </div>
    <div class="table_list2">
        <table>
            <caption></caption>
            <colgroup>
            <col style="width:26%;">
            <col style="width:25%;">
            <col style="width:25%;">
            <col style="width:24%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">客户名称</th><!-- 고객명 -->
                    <th scope="col">厂商名称</th><!-- 제조사명칭 -->
                    <th scope="col">车辆型号</th><!-- 차량모델 -->
                    <th scope="col">联系方式</th><!-- 연락처 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input id="custNm" name="custNm" type="text" class="form_input form_input3" data-bind="value:custNm" data-json-obj="true"></td>
                    <td><input id="imsNm" name="imsNm" type="text" class="form_input form_input3" data-bind="value:imsNm" data-json-obj="true"></td>
                    <td><input id="carModelCd" name="carModelCd" type="text" class="form_input form_input3" data-bind="value:carModelCd" data-json-obj="true"></td>
                    <td><input id="telNo" name="telNo" type="text" class="form_input form_input3" data-bind="value:telNo" data-json-obj="true"></td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:26%;">
            <col style="width:25%;">
            <col style="width:25%;">
            <col style="width:24%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">车牌号</th><!-- 차량번호 -->
                    <th scope="col">出厂日期</th><!-- 출고일자 -->
                    <th scope="col">登记日期</th><!-- 등록일자 -->
                    <th scope="col">车辆过户记录</th><!-- 차량명의변경일자 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input id="carNo" name="carNo" type="text" class="form_input form_input3" data-bind="value:carNo" data-json-obj="true"></td>
                    <td><input id="giDt" name="giDt" type="text" class="form_datepicker ac" data-bind="value:giDt" data-json-obj="true"></td>
                    <td><input id="carRegDt" name="carRegDt" type="text" class="form_datepicker ac" data-bind="value:carRegDt" data-json-obj="true"></td>
                    <td><input id="carOwnChgHisDt" name="carOwnChgHisDt" type="text" class="form_datepicker ac" data-bind="value:carOwnChgHisDt" data-json-obj="true"></td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:50%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">车辆VIN编码</th><!-- 차량 VIN NO -->
                    <th scope="col">发动机号</th><!-- 엔진번호 -->
                    <th scope="col">排量cc</th><!-- 배기량cc -->
                    <th scope="col">车身颜色</th><!-- 외장색 -->
                    <th scope="col">内饰颜色</th><!-- 내장색 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="td_tbl">
                        <table>
                            <colgroup>
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col>
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            <col style="width:5.4%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td><input id="vinNo1" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo2" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo3" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo4" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo5" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo6" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo7" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo8" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo9" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo10" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo11" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td>&nbsp;</td>
                                    <td><input id="vinNo12" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo13" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo14" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo15" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo16" type="text" maxlength="1" class="form_input form_input3"></td>
                                    <td><input id="vinNo17" type="text" maxlength="1" class="form_input form_input3"></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td><input id="enginNo" name="enginNo" type="text" class="form_input form_input3" data-bind="value:enginNo" data-json-obj="true"></td>
                    <td><input id="carDispQty" name="carDispQty" type="text" class="form_input form_input3" data-bind="value:carDispQty" data-json-obj="true"></td>
                    <td><input id="extColorNm" name="extColorNm" type="text" class="form_input form_input3" data-bind="value:extColorNm" data-json-obj="true"></td>
                    <td><input id="intColorNm" name="intColorNm" type="text" class="form_input form_input3" data-bind="value:intColorNm" data-json-obj="true"></td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:26%;">
            <col style="width:25%;">
            <col style="width:25%;">
            <col style="width:24%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">驱动方式</th><!-- 구동방식 -->
                    <th scope="col">变速箱类型</th><!-- 변속기유형 -->
                    <th scope="col">燃料类型</th><!-- 연료구분 -->
                    <th scope="col">使用性质</th><!-- 사용용도 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input id="drvMthCd" name="drvMthCd" type="hidden" data-bind="value:drvMthCd" data-json-obj="true" >
                        <label class="label_check">前驱 <input id="drvMthCd01" name="drvMthCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 전륜 -->
                        <label class="label_check">后驱 <input id="drvMthCd02" name="drvMthCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 후륜 -->
                        <label class="label_check">四驱 <input id="drvMthCd03" name="drvMthCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 사륜 -->
                    </td>
                    <td><input id="trmsTp" name="trmsTp" type="hidden" data-bind="value:trmsTp" data-json-obj="true" >
                        <label class="label_check">手动 <input id="trmsTp01" name="trmsTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 수동 -->
                        <label class="label_check">自动 <input id="trmsTp02" name="trmsTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 자동 -->
                        <label class="label_check">手自一体 <input id="trmsTp03" name="trmsTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 팁트로닉 -->
                    </td>
                    <td><input id="fuelCd" name="fuelCd" type="hidden" data-bind="value:fuelCd" data-json-obj="true" >
                        <label class="label_check">汽油 <input id="fuelCd01" name="fuelCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 휘발유 -->
                        <label class="label_check">新能源 <input id="fuelCd02" name="fuelCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 에너지자원 -->
                        <label class="label_check">油电混合 <input id="fuelCd03" name="fuelCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 전기오일 하이브리드 -->
                    </td>
                    <td><input id="carUseTp" name="carUseTp" type="hidden" data-bind="value:carUseTp" data-json-obj="true" >
                        <label class="label_check">私 <input id="carUseTp01" name="carUseTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 사적 -->
                        <label class="label_check">公 <input id="carUseTp02" name="carUseTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 공적 -->
                        <label class="label_check">营运 <input id="carUseTp03" name="carUseTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 상용 -->
                    </td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:26%;">
            <col style="width:25%;">
            <col style="width:25%;">
            <col style="width:24%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" colspan="4">车辆配置</th><!-- 차량옵션 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input id="srfDstinCd" name="srfDstinCd" type="hidden" data-bind="value:srfDstinCd" data-json-obj="true" >
                        <span class="span_txt">天窗： </span>&nbsp;<!-- 선루프 -->
                        <label class="label_check">单 <input id="srfDstinCd01" name="srfDstinCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 싱글 -->
                        <label class="label_check">全景 <input id="srfDstinCd02" name="srfDstinCd" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 전경 -->
                    </td>
                    <td><input id="airbackQty" name="airbackQty" type="hidden" data-bind="value:airbackQty" data-json-obj="true" >
                        <span class="span_txt">气囊： </span>&nbsp;<!-- 에어백 -->
                        <label class="label_check">2 <input id="airbackQty01" name="airbackQty" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label>
                        <label class="label_check">4 <input id="airbackQty02" name="airbackQty" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label>
                        <span class="span_txt">（</span><input id="airbackQty03" name="airbackQty" type="text" class="form_input form_input3 vt" style="width:20px;" onchange="funChkSigle(this.id,this.name)" ><span class="span_txt">）</span>
                    </td>
                    <td><input id="seatTp" name="seatTp" type="hidden" data-bind="value:seatTp" data-json-obj="true" >
                        <label class="label_check">皮制座椅 <input id="seatTp01" name="seatTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 가죽시트 -->
                        <label class="label_check">布座椅 <input id="seatTp02" name="seatTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 직물시트 -->
                    </td>
                    <td><input id="airconTp" name="airconTp" type="hidden" data-bind="value:airconTp" data-json-obj="true" >
                        <span class="span_txt">空调： </span>&nbsp;<!-- 에어컨 -->
                        <label class="label_check">手动 <input id="airconTp01" name="airconTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 수동 -->
                        <label class="label_check">自动 <input id="airconTp02" name="airconTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 자동 -->
                    </td>
                </tr>
                <tr>
                    <td><input id="stcTp" name="stcTp" type="hidden" data-bind="value:stcTp" data-json-obj="true" >
                        <span class="span_txt">启动： </span>&nbsp;<!-- 시동방식 -->
                        <label class="label_check">一键式 <input id="stcTp01" name="stcTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 스마트키 -->
                        <label class="label_check">电门式 <input id="stcTp02" name="stcTp" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)" ></label><!-- 일반키 -->
                    </td>
                    <td>
                        <label class="label_check">电动座椅 <input id="elecSeatYn" name="elecSeatYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 전동시트 -->
                        <label class="label_check">加热 <input id="heatSeatYn" name="heatSeatYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 열선시트 -->
                        <label class="label_check">通风 <input id="airSeatYn" name="airSeatYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 통풍시트 -->
                    </td>
                    <td>
                        <label class="label_check">DVD <input id="dvdYn" name="dvdYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- DVD -->
                        <label class="label_check">导航 <input id="naviYn" name="naviYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 네비게이션 -->
                        <label class="label_check">倒车影像 <input id="rcamYn" name="rcamYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 후방카메라 -->
                    </td>
                    <td>
                        <label class="label_check">自动大灯 <input id="autoHlgtYn" name="autoHlgtYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 오토헤드라이트 -->
                        <label class="label_check">疝灯 <input id="hidHlampYn" name="hidHlampYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- HID헤드라이트 -->
                        <label class="label_check">卤素 <input id="haloLampYn" name="haloLampYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 할로젠램프 -->
                    </td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:100%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">车辆手续</th><!-- 차량수속 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <label class="label_check">登记证 <input id="regCertYn" name="regCertYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 등록증 -->
                        <label class="label_check">行驶本 <input id="runCertYn" name="runCertYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 주행증 -->
                        <label class="label_check">购置税证 <input id="purcTaxCertYn" name="purcTaxCertYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 구매세증명 -->
                        <label class="label_check">购车发票 <input id="purcCertYn" name="purcCertYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 구매영수증 -->
                        <label class="label_check">过户票 <input id="ownChgRcptYn" name="ownChgRcptYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 명의변경영수증 -->
                        <label class="label_check">商业险 <input id="commInsYn" name="commInsYn" type="checkbox" class="form_check"></label data-json-obj="true"><!-- 상업보험 -->
                        <label class="label_check">交强险 <input id="spcInsYn" name="spcInsYn" type="checkbox" class="form_check" data-json-obj="true"></label><!-- 교통강제보험 -->
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="label_check">环保标 <input id="envPrtcLabelYn" name="envPrtcLabelYn" type="checkbox" class="form_check" data-bind="value:envPrtcLabelYn" data-json-obj="true"></label><!-- 환경보호라벨 -->
                        <span class="span_txt" style="margin-left:70px;">商业险期限：</span>&nbsp;<!-- 상업보험 유통기한 -->
                        <input id="commInsValidDtYear" name="commInsValidDtYear" type="text" maxlength="4" class="form_input form_input3 vt ar" style="width:35px;" data-bind="value:commInsValidDtYear" data-json-obj="true"> <span class="span_txt">年</span><!-- 년 -->
                        <input id="commInsValidDtMonth" name="commInsValidDtMonth" type="text" maxlength="2" class="form_input form_input3 vt ar" style="width:20px;" data-bind="value:commInsValidDtMonth" data-json-obj="true"> <span class="span_txt">月</span><!-- 월 -->
                        <span class="span_txt" style="margin-left:135px;">交强险期限：</span>&nbsp;<!-- 교통강제보험 유통기한 -->
                        <input id="spcIncValidDtYear" name="spcIncValidDtYear" type="text" maxlength="4" class="form_input form_input3 vt ar" style="width:35px;" data-bind="value:spcIncValidDtYear" data-json-obj="true"> <span class="span_txt">年</span><!-- 년 -->
                        <input id="spcIncValidDtMonth" name="spcIncValidDtMonth" type="text" maxlength="2" class="form_input form_input3 vt ar" style="width:20px;" data-bind="value:spcIncValidDtMonth" data-json-obj="true"> <span class="span_txt">月</span><!-- 월 -->
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="span_txt">其他：</span><!-- 기타 -->
                        <input id="etcCont" name="etcCont" type="text" class="form_input form_input3 vt al" style="width:90%;" data-bind="value:etcCont" data-json-obj="true">
                    </td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:10%;">
            <col style="width:41%;">
            <col style="width:3%;">
            <col style="width:46%;">
            </colgroup>
            <tbody>
                <tr>
                    <td colspan="2" rowspan="4">
                        <div class="car_img">
                            <img src="<c:url value='/resources/img/img_car2.png' />" alt="">
                            <p class="txt_front">车头</p><!--  -->
                            <p class="txt_rear">车尾</p><!--  -->
                        </div>
                    </td>
                    <td class="td_title">外观</td><!-- 외장내용 -->
                    <td><textarea id="extCont" name="extCont" rows="" cols="" class="form_textarea" data-bind="value:extCont" data-json-obj="true"></textarea></td>
                </tr>
                <tr>
                    <td class="td_title has_bol">内饰</td><!-- 내장내용 -->
                    <td><textarea id="intCont" name="intCont" rows="" cols="" class="form_textarea" data-bind="value:intCont" data-json-obj="true"></textarea></td>
                </tr>
                <tr>
                    <td class="td_title has_bol">车架</td><!-- 차대내용 -->
                    <td><textarea id="vinCont" name="vinCont" rows="" cols="" class="form_textarea" data-bind="value:vinCont" data-json-obj="true"></textarea></td>
                </tr>
                <tr>
                    <td class="td_title has_bol">机械</td><!-- 기계내용 -->
                    <td><textarea id="mechCont" name="mechCont" rows="" cols="" class="form_textarea" data-bind="value:mechCont" data-json-obj="true"></textarea></td>
                </tr>
                <tr>
                    <td class="td_title">状态标记</td>
                    <td class="td_txt">
                        <button id="statCont1" type="button" class="btn_xs btn_xs_check">A伤（含锈蚀）</button>
                        <button id="statCont2" type="button" class="btn_xs btn_xs_check">B凹坑</button>
                        <button id="statCont3" type="button" class="btn_xs btn_xs_check">C腐蚀</button>
                        <button id="statCont4" type="button" class="btn_xs btn_xs_check">P褪色（色差）</button>
                        <button id="statCont5" type="button" class="btn_xs btn_xs_check">W钣金修复</button>
                        <button id="statCont6" type="button" class="btn_xs btn_xs_check">X需要更换</button>
                        <button id="statCont7" type="button" class="btn_xs btn_xs_check">XX更换过</button>
                        <button id="statCont8" type="button" class="btn_xs btn_xs_check">Z缺件</button>
                    </td>
                    <td rowspan="2" class="td_title bg_blue bob_none">随车附件</td><!-- 차량악세사리 -->
                    <td rowspan="2" class="bob_none">
                        <label class="label_check mr30 mt2">说明书 <input id="carAccCont01" name="carAccCont" type="checkbox" class="form_check"></label><!-- 설명서 -->
                        <label class="label_check mr30 mt2">保养手册 <input id="carAccCont02" name="carAccCont" type="checkbox" class="form_check"></label><!-- 정비북 -->
                        <label class="label_check mr30 mt2">备胎 <input id="carAccCont03" name="carAccCont" type="checkbox" class="form_check"></label><!-- 백업타이어 -->
                        <label class="label_check mr30 mt2">千斤顶 <input id="carAccCont04" name="carAccCont" type="checkbox" class="form_check"></label><br><!-- 카젝 -->
                        <label class="label_check mr30 mt5">警示牌 <input id="carAccCont05" name="carAccCont" type="checkbox" class="form_check"></label><!-- 안정삼각대 -->
                        <label class="label_check mr30 mt5">随车工具 <input id="carAccCont06" name="carAccCont" type="checkbox" class="form_check"></label><!-- 차량공구 -->
                        <label class="label_check mr30 mt5">天线 <input id="carAccCont07" name="carAccCont" type="checkbox" class="form_check"></label><!-- 안테나 -->
                        <label class="label_check mr30 mt5">点烟器 <input id="carAccCont08" name="carAccCont" type="checkbox" class="form_check"></label><br><!-- 담배라이터 -->
                        <label class="label_check mr30 mt5">钥匙 把 <input id="carAccCont09" name="carAccCont" type="checkbox" class="form_check"></label><!-- 차키 -->
                    </td>
                </tr>
                <tr>
                    <td class="td_title">综合评价</td><!-- 종합평가 -->
                    <td><input id="totEvalCont" name="totEvalCont" type="hidden" data-bind="value:totEvalCont" data-json-obj="true" >
                        <label class="label_check">好 <input id="totEvalCont01" name="totEvalCont" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 아주 조음. -->
                        <label class="label_check">较好 <input id="totEvalCont02" name="totEvalCont" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 좋음 -->
                        <label class="label_check">一般 <input id="totEvalCont03" name="totEvalCont" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 일반 -->
                        <label class="label_check">较差 <input id="totEvalCont04" name="totEvalCont" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 비교적나쁨 -->
                        <label class="label_check">差 <input id="totEvalCont05" name="totEvalCont" type="checkbox" class="form_check" onclick="funChkSigle(this.id,this.name)"></label><!-- 나쁨 -->
                    </td>
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:51%;">
            <col style="width:24.5%;">
            <col style="width:24.5%;">
            </colgroup>
            <tbody>
                <tr>
                    <td rowspan="2" class="bob_none">
                        <span class="span_txt">备注：</span><!-- 비고 -->
                        <textarea id="remark" name="remark" rows="" cols="" class="form_textarea vt" style="width:90%;height:57px;" data-bind="value:remark" data-json-obj="true"></textarea>
                    </td>
                    <td class="td_title">新车指导价格</td><!-- 신차지도가격 -->
                    <td class="td_title">新车市场价格</td><!-- 신차시장가격 -->
                </tr>
                <tr>
                    <td class="td_price has_bol"><input id="ncarPltGuidePrc" name="ncarPltGuidePrc" type="text" class="form_input form_input3" style="width:78%;" data-bind="value:ncarPltGuidePrc" data-json-obj="true"><span class="span_txt">万元</span></td><!-- 만원 -->
                    <td class="td_price"><input id="ncarMarketPrc" name="ncarMarketPrc" type="text" class="form_input form_input3" style="width:78%;" data-bind="value:ncarMarketPrc" data-json-obj="true"><span class="span_txt">万元</span></td><!-- 만원 -->
                </tr>
            </tbody>
        </table>

        <table>
            <caption></caption>
            <colgroup>
            <col style="width:33%;">
            <col style="width:33%;">
            <col style="width:34;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">客户希望价格</th><!-- 고객희망가격 -->
                    <th scope="col">评估师报价</th><!-- 평가사견적 -->
                    <th scope="col" class="bg_blue">最终鉴定价格</th><!-- 최종계약가격 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="td_price"><input id="custHopePrc" name="custHopePrc" type="text" class="form_input form_input3" style="width:83%;" data-bind="value:custHopePrc" data-json-obj="true" ><span class="span_txt">万元</span></td><!-- 만원 -->
                    <td class="td_price"><input id="evalCmpEstPrc" name="evalCmpEstPrc" type="text" class="form_input form_input3" style="width:83%;" data-bind="value:evalCmpEstPrc" data-json-obj="true"><span class="span_txt">万元</span></td><!-- 만원 -->
                    <td class="td_price"><input id="lastContractPrc" name="lastContractPrc" type="text" class="form_input form_input3" style="width:83%;" data-bind="value:lastContractPrc" data-json-obj="true"> <span class="span_txt">万元</span></td><!-- 만원 -->
                </tr>
            </tbody>
        </table>
    </div>

</form>
</div>
</section>
<!-- //중고차매입/평가관리 - 차량이미지 평가용 -->

<!-- script -->
<script type="text/javascript">
//팝업옵션
var options = parent.popupEvCarWindow.options.content.data;

var dlrCd = options.dlrCd;
var purcNo = options.purcNo;
var purcStatCd = options.purcStatCd;

$("#dlrCd").val(dlrCd);
//purcStatCd:01:임시저장, 02:평가요청, 03:평가완료, 04:성공, 05:거절
$(document).ready(function() {

    if(purcStatCd == '01' || purcStatCd == '02'){
        $("#btnSave").show();
    }else if(purcStatCd == '03' || purcStatCd == '04' || purcStatCd == '05'){
        $("#btnSave").hide();
    }


    //출고일자
    $("#giDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //등록일자
    $("#carRegDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });



    //차량명의변경이력일자
    $("#carOwnChgHisDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });



    $("#dlrCd").val(dlrCd);
    $("#purcNo").val(purcNo);



    $.ajax({
        url:"<c:url value='/sal/usc/purcEval/selectImageEvalVal.do' />",
        data:JSON.stringify({sPurcNo:purcNo,sDlrCd:dlrCd}),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }

    }).done(function(result) {
            var purcEvalImageDs = result["purcEvalImageDs"];
            kendo.bind($(".viewEvalVal"), purcEvalImageDs);

            //VIN NO
            var vinNo = purcEvalImageDs.vinNo;
            if(vinNo != null && vinNo != ""){
                $("#vinNo1").val(vinNo.substring(0,1));
                $("#vinNo2").val(vinNo.substring(1,2));
                $("#vinNo3").val(vinNo.substring(2,3));
                $("#vinNo4").val(vinNo.substring(3,4));
                $("#vinNo5").val(vinNo.substring(4,5));
                $("#vinNo6").val(vinNo.substring(5,6));
                $("#vinNo7").val(vinNo.substring(6,7));
                $("#vinNo8").val(vinNo.substring(7,8));
                $("#vinNo9").val(vinNo.substring(8,9));
                $("#vinNo10").val(vinNo.substring(9,10));
                $("#vinNo11").val(vinNo.substring(10,11));
                $("#vinNo12").val(vinNo.substring(11,12));
                $("#vinNo13").val(vinNo.substring(12,13));
                $("#vinNo14").val(vinNo.substring(13,14));
                $("#vinNo15").val(vinNo.substring(14,15));
                $("#vinNo16").val(vinNo.substring(15,16));
                $("#vinNo17").val(vinNo.substring(16,17));
            }

            //구동방식(SAL161 )
            if(purcEvalImageDs.drvMthCd != null && purcEvalImageDs.drvMthCd != ""){
                if (purcEvalImageDs.drvMthCd == '01'){
                    $("#drvMthCd01").prop("checked", true);
                    $("#drvMthCd02").prop("checked", false);
                    $("#drvMthCd03").prop("checked", false);
                }else if(purcEvalImageDs.drvMthCd == '02') {
                    $("#drvMthCd01").prop("checked", false);
                    $("#drvMthCd02").prop("checked", true);
                    $("#drvMthCd03").prop("checked", false);
                }else if(purcEvalImageDs.drvMthCd == '03') {
                    $("#drvMthCd01").prop("checked", false);
                    $("#drvMthCd02").prop("checked", false);
                    $("#drvMthCd03").prop("checked", true);
                };
            }


            //변속기유형(SAL162 )
            if(purcEvalImageDs.trmsTp != null && purcEvalImageDs.trmsTp != ""){
                if (purcEvalImageDs.trmsTp == '01'){
                    $("#trmsTp01").prop("checked", true);
                    $("#trmsTp02").prop("checked", false);
                    $("#trmsTp03").prop("checked", false);
                }else if(purcEvalImageDs.trmsTp == '02') {
                    $("#trmsTp01").prop("checked", false);
                    $("#trmsTp02").prop("checked", true);
                    $("#trmsTp03").prop("checked", false);
                }else if(purcEvalImageDs.trmsTp == '03') {
                    $("#trmsTp01").prop("checked", false);
                    $("#trmsTp02").prop("checked", false);
                    $("#trmsTp03").prop("checked", true);
                };
            }


            //연료구분(SAL163 )
            if(purcEvalImageDs.fuelCd != null && purcEvalImageDs.fuelCd != ""){
                if (purcEvalImageDs.fuelCd == '01'){
                    $("#fuelCd01").prop("checked", true);
                    $("#fuelCd02").prop("checked", false);
                    $("#fuelCd03").prop("checked", false);
                }else if(purcEvalImageDs.fuelCd == '02') {
                    $("#fuelCd01").prop("checked", false);
                    $("#fuelCd02").prop("checked", true);
                    $("#fuelCd03").prop("checked", false);
                }else if(purcEvalImageDs.fuelCd == '03') {
                    $("#fuelCd01").prop("checked", false);
                    $("#fuelCd02").prop("checked", false);
                    $("#fuelCd03").prop("checked", true);
                };
            }


            //사용성격(SAL164 )
            if(purcEvalImageDs.carUseTp != null && purcEvalImageDs.carUseTp != ""){
                if (purcEvalImageDs.carUseTp == '01'){
                    $("#carUseTp01").prop("checked", true);
                    $("#carUseTp02").prop("checked", false);
                    $("#carUseTp03").prop("checked", false);
                }else if(purcEvalImageDs.carUseTp == '02') {
                    $("#carUseTp01").prop("checked", false);
                    $("#carUseTp02").prop("checked", true);
                    $("#carUseTp03").prop("checked", false);
                }else if(purcEvalImageDs.carUseTp == '03') {
                    $("#carUseTp01").prop("checked", false);
                    $("#carUseTp02").prop("checked", false);
                    $("#carUseTp03").prop("checked", true);
                };
            }



            //썬루프구분(SAL165 )
            if(purcEvalImageDs.srfDstinCd != null && purcEvalImageDs.srfDstinCd != ""){
                if (purcEvalImageDs.srfDstinCd == '01'){
                    $("#srfDstinCd01").prop("checked", true);
                    $("#srfDstinCd02").prop("checked", false);
                    $("#srfDstinCd03").prop("checked", false);
                }else if(purcEvalImageDs.srfDstinCd == '02') {
                    $("#srfDstinCd01").prop("checked", false);
                    $("#srfDstinCd02").prop("checked", true);
                    $("#srfDstinCd03").prop("checked", false);
                }else if(purcEvalImageDs.srfDstinCd == '03') {
                    $("#srfDstinCd01").prop("checked", false);
                    $("#srfDstinCd02").prop("checked", false);
                    $("#srfDstinCd03").prop("checked", true);
                };
            }


            //시트유형(SAL166 )
            if(purcEvalImageDs.seatTp != null && purcEvalImageDs.seatTp != ""){
                if (purcEvalImageDs.seatTp == '01'){
                    $("#seatTp01").prop("checked", true);
                    $("#seatTp02").prop("checked", false);
                    $("#seatTp03").prop("checked", false);
                }else if(purcEvalImageDs.seatTp == '02') {
                    $("#seatTp01").prop("checked", false);
                    $("#seatTp02").prop("checked", true);
                    $("#seatTp03").prop("checked", false);
                }else if(purcEvalImageDs.seatTp == '03') {
                    $("#seatTp01").prop("checked", false);
                    $("#seatTp02").prop("checked", false);
                    $("#seatTp03").prop("checked", true);
                };
            }


            //에어컨유형(SAL167 )
            if(purcEvalImageDs.airconTp != null && purcEvalImageDs.airconTp != ""){
                if (purcEvalImageDs.airconTp == '01'){
                    $("#airconTp01").prop("checked", true);
                    $("#airconTp02").prop("checked", false);
                    $("#airconTp03").prop("checked", false);
                }else if(purcEvalImageDs.airconTp == '02') {
                    $("#airconTp01").prop("checked", false);
                    $("#airconTp02").prop("checked", true);
                    $("#airconTp03").prop("checked", false);
                }else if(purcEvalImageDs.airconTp == '03') {
                    $("#airconTp01").prop("checked", false);
                    $("#airconTp02").prop("checked", false);
                    $("#airconTp03").prop("checked", true);
                };
            }


            //시트유형(SAL168 )
            if(purcEvalImageDs.stcTp != null && purcEvalImageDs.stcTp != ""){
                if (purcEvalImageDs.stcTp == '01'){
                    $("#stcTp01").prop("checked", true);
                    $("#stcTp02").prop("checked", false);
                    $("#stcTp03").prop("checked", false);
                }else if(purcEvalImageDs.stcTp == '02') {
                    $("#stcTp01").prop("checked", false);
                    $("#stcTp02").prop("checked", true);
                    $("#stcTp03").prop("checked", false);
                }else if(purcEvalImageDs.stcTp == '03') {
                    $("#stcTp01").prop("checked", false);
                    $("#stcTp02").prop("checked", false);
                    $("#stcTp03").prop("checked", true);
                };
            }

            //에어백수량
            if(purcEvalImageDs.airbackQty == 2){
                $("#airbackQty01").prop("checked", true);
            }else if(purcEvalImageDs.airbackQty == 4){
                $("#airbackQty02").prop("checked", true);
            }else {
                $("#airbackQty03").val(purcEvalImageDs.airbackQty);
            }



            //종합평가
            if(purcEvalImageDs.totEvalCont != null && purcEvalImageDs.totEvalCont != ""){
                if (purcEvalImageDs.totEvalCont == '01'){
                    $("#totEvalCont01").prop("checked", true);
                    $("#totEvalCont02").prop("checked", false);
                    $("#totEvalCont03").prop("checked", false);
                    $("#totEvalCont04").prop("checked", false);
                    $("#totEvalCont05").prop("checked", false);
                }else if(purcEvalImageDs.totEvalCont == '02') {
                    $("#totEvalCont01").prop("checked", false);
                    $("#totEvalCont02").prop("checked", true);
                    $("#totEvalCont03").prop("checked", false);
                    $("#totEvalCont04").prop("checked", false);
                    $("#totEvalCont05").prop("checked", false);
                }else if(purcEvalImageDs.totEvalCont == '03') {
                    $("#totEvalCont01").prop("checked", false);
                    $("#totEvalCont02").prop("checked", false);
                    $("#totEvalCont03").prop("checked", true);
                    $("#totEvalCont04").prop("checked", false);
                    $("#totEvalCont05").prop("checked", false);
                }else if(purcEvalImageDs.totEvalCont == '04') {
                    $("#totEvalCont01").prop("checked", false);
                    $("#totEvalCont02").prop("checked", false);
                    $("#totEvalCont03").prop("checked", false);
                    $("#totEvalCont04").prop("checked", true);
                    $("#totEvalCont05").prop("checked", false);
                }else if(purcEvalImageDs.totEvalCont == '05') {
                    $("#totEvalCont01").prop("checked", false);
                    $("#totEvalCont02").prop("checked", false);
                    $("#totEvalCont03").prop("checked", false);
                    $("#totEvalCont04").prop("checked", false);
                    $("#totEvalCont05").prop("checked", true);
                }
            }




            //전동시트여부
            if (purcEvalImageDs.elecSeatYn == 'Y'){$("#elecSeatYn").prop("checked", true);} else {$("#elecSeatYn").prop("checked", false);};
            //열선시트여부
            if (purcEvalImageDs.heatSeatYn == 'Y'){$("#heatSeatYn").prop("checked", true);} else {$("#heatSeatYn").prop("checked", false);};
            //통풍시트여부
            if (purcEvalImageDs.airSeatYn == 'Y'){$("#airSeatYn").prop("checked", true);} else {$("#airSeatYn").prop("checked", false);};
            //DVD여부
            if (purcEvalImageDs.dvdYn == 'Y'){$("#dvdYn").prop("checked", true);} else {$("#dvdYn").prop("checked", false);};
            //네비게이션여부
            if (purcEvalImageDs.naviYn == 'Y'){$("#naviYn").prop("checked", true);} else {$("#naviYn").prop("checked", false);};
            //후방카메라여부
            if (purcEvalImageDs.rcamYn == 'Y'){$("#rcamYn").prop("checked", true);} else {$("#rcamYn").prop("checked", false);};
            //오토헤드라이트여부
            if (purcEvalImageDs.autoHlgtYn == 'Y'){$("#autoHlgtYn").prop("checked", true);} else {$("#autoHlgtYn").prop("checked", false);};
            //HID헤드램프여부
            if (purcEvalImageDs.hidHlampYn == 'Y'){$("#hidHlampYn").prop("checked", true);} else {$("#hidHlampYn").prop("checked", false);};
            //할로겐램프여부
            if (purcEvalImageDs.haloLampYn == 'Y'){$("#haloLampYn").prop("checked", true);} else {$("#haloLampYn").prop("checked", false);};
            //등록증여부
            if (purcEvalImageDs.regCertYn == 'Y'){$("#regCertYn").prop("checked", true);} else {$("#regCertYn").prop("checked", false);};
            //주행증여부
            if (purcEvalImageDs.runCertYn == 'Y'){$("#runCertYn").prop("checked", true);} else {$("#runCertYn").prop("checked", false);};
            //구매세금증명서여부
            if (purcEvalImageDs.purcTaxCertYn == 'Y'){$("#purcTaxCertYn").prop("checked", true);} else {$("#purcTaxCertYn").prop("checked", false);};
            //구매증명서여부
            if (purcEvalImageDs.purcCertYn == 'Y'){$("#purcCertYn").prop("checked", true);} else {$("#purcCertYn").prop("checked", false);};
            //명의변경영수증여부
            if (purcEvalImageDs.ownChgRcptYn == 'Y'){$("#ownChgRcptYn").prop("checked", true);} else {$("#ownChgRcptYn").prop("checked", false);};
            //상업보험여부
            if (purcEvalImageDs.commInsYn == 'Y'){$("#commInsYn").prop("checked", true);} else {$("#commInsYn").prop("checked", false);};
            //교강보험여부
            if (purcEvalImageDs.spcInsYn == 'Y'){$("#spcInsYn").prop("checked", true);} else {$("#spcInsYn").prop("checked", false);};
            //환경보호라벨여부
            if (purcEvalImageDs.envPrtcLabelYn == 'Y'){$("#envPrtcLabelYn").prop("checked", true);} else {$("#envPrtcLabelYn").prop("checked", false);};



            //차량 악세서리
            if(purcEvalImageDs.carAccCont != null && purcEvalImageDs.carAccCont != ""){
                var carAccContList = purcEvalImageDs.carAccCont.split(",");
                for(var i=0; i < carAccContList.length; i++){
                    if(carAccContList[i] == 'Y'){
                        $("#carAccCont0"+(i+1)).prop("checked", true);
                    }else{
                        $("#carAccCont0"+(i+1)).prop("checked", false);
                    }
                }
            }





            if(purcEvalImageDs.statCont != null && purcEvalImageDs.statCont != ""){
                var statContList = purcEvalImageDs.statCont.split(",");
                for(var i=0; i < statContList.length; i++){
                    if(statContList[i] == 'Y'){
                        $("#statCont"+(i+1)).addClass("btn_active");
                    }else {
                        $("#statCont"+(i+1)).removeClass("btn_active");
                    }
                }
            }




    });

    /*************************************** 화면 Loading 시 조회 ***************************************/


    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {


            var param = $("#detailImageValForm").serializeObject($("#detailImageValForm").serializeArrayInSelector("[data-json-obj='true']"));
            param.giDt = $("#giDt").data("kendoExtMaskedDatePicker").value();
            param.carRegDt = $("#carRegDt").data("kendoExtMaskedDatePicker").value();
            param.carOwnChgHisDt = $("#carOwnChgHisDt").data("kendoExtMaskedDatePicker").value();
            param.dlrCd = dlrCd;
            param.purcNo = purcNo;


            var vinNo = $("#vinNo1").val()+$("#vinNo2").val()+$("#vinNo3").val()+$("#vinNo4").val()+$("#vinNo5").val()+$("#vinNo6").val()+$("#vinNo7").val()
                         +$("#vinNo8").val()+$("#vinNo9").val()+$("#vinNo10").val()+$("#vinNo11").val()+$("#vinNo12").val()+$("#vinNo13").val()
                         +$("#vinNo14").val()+$("#vinNo15").val()+$("#vinNo16").val()+$("#vinNo17").val();
            param.vinNo = vinNo;



            //전동시트여부
            if($("#elecSeatYn").is(":checked")){param.elecSeatYn = 'Y'}else{param.elecSeatYn = 'N'}
            //열선시트여부
            if($("#heatSeatYn").is(":checked")){param.heatSeatYn = 'Y'}else{param.heatSeatYn = 'N'}
            //통풍시트여부
            if($("#airSeatYn").is(":checked")){param.airSeatYn = 'Y'}else{param.airSeatYn = 'N'}
            //DVD여부
            if($("#dvdYn").is(":checked")){param.dvdYn = 'Y'}else{param.dvdYn = 'N'}
            //네비게이션여부
            if($("#naviYn").is(":checked")){param.naviYn = 'Y'}else{param.naviYn = 'N'}
            //후방카메라여부
            if($("#rcamYn").is(":checked")){param.rcamYn = 'Y'}else{param.rcamYn = 'N'}
            //오토헤드라이트여부
            if($("#autoHlgtYn").is(":checked")){param.autoHlgtYn = 'Y'}else{param.autoHlgtYn = 'N'}
            //HID헤드램프여부
            if($("#hidHlampYn").is(":checked")){param.hidHlampYn = 'Y'}else{param.hidHlampYn = 'N'}
            //할로겐램프여부
            if($("#haloLampYn").is(":checked")){param.haloLampYn = 'Y'}else{param.haloLampYn = 'N'}
            //등록증여부
            if($("#regCertYn").is(":checked")){param.regCertYn = 'Y'}else{param.regCertYn = 'N'}
            //주행증여부
            if($("#runCertYn").is(":checked")){param.runCertYn = 'Y'}else{param.runCertYn = 'N'}
            //구매세금증명서여부
            if($("#purcTaxCertYn").is(":checked")){param.purcTaxCertYn = 'Y'}else{param.purcTaxCertYn = 'N'}
            //구매증명서여부
            if($("#purcCertYn").is(":checked")){param.purcCertYn = 'Y'}else{param.purcCertYn = 'N'}
            //명의변경영수증여부
            if($("#ownChgRcptYn").is(":checked")){param.ownChgRcptYn = 'Y'}else{param.ownChgRcptYn = 'N'}
            //상업보험여부
            if($("#commInsYn").is(":checked")){param.commInsYn = 'Y'}else{param.commInsYn = 'N'}
            //교강보험여부
            if($("#spcInsYn").is(":checked")){param.spcInsYn = 'Y'}else{param.spcInsYn = 'N'}
            //환경보호라벨여부
            if($("#envPrtcLabelYn").is(":checked")){param.envPrtcLabelYn = 'Y'}else{param.envPrtcLabelYn = 'N'}




            //구동방식(SAL161)
            if($("#drvMthCd01").is(":checked")){
                param.drvMthCd = '01';
            }else if($("#drvMthCd02").is(":checked")){
                param.drvMthCd = '02';
            }else if($("#drvMthCd03").is(":checked")){
                param.drvMthCd = '03';
            }


            //변속기(SAL162)
            if($("#trmsTp01").is(":checked")){
                param.trmsTp = '01';
            }else if($("#trmsTp02").is(":checked")){
                param.trmsTp = '02';
            }else if($("#trmsTp03").is(":checked")){
                param.trmsTp = '03';
            }


            //연료구분(SAL163)
            if($("#fuelCd01").is(":checked")){
                param.trmsTp = '01';
            }else if($("#fuelCd02").is(":checked")){
                param.trmsTp = '02';
            }else if($("#fuelCd03").is(":checked")){
                param.trmsTp = '03';
            }



            //사용성격(SAL164)
            if($("#carUseTp01").is("checked")){
                param.carUseTp = '01';
            }else if($("#carUseTp02").is("checked")){
                param.carUseTp = '02';
            }else if($("#carUseTp03").is("checked")){
                param.carUseTp = '03';
            }



            //썬루프구분(SAL165)
            if($("#srfDstinCd01").is(":checked")){
                param.srfDstinCd = '01';
            }else if($("#srfDstinCd02").is(":checked")){
                param.srfDstinCd = '02';
            }else if($("#srfDstinCd03").is(":checked")){
                param.srfDstinCd = '03';
            }




            //시트유형(SAL166)
            if($("#seatTp01").is(":checked")){
                param.seatTp = '01';
            }else if($("#seatTp02").is(":checked")){
                param.seatTp = '02';
            }else if($("#seatTp03").is(":checked")){
                param.seatTp = '03';
            }


            //에어컨유형(SAL167)
            if($("#airconTp01").is(":checked")){
                param.airconTp = '01';
            }else if($("#airconTp02").is(":checked")){
                param.airconTp = '02';
            }else if($("#airconTp03").is(":checked")){
                param.airconTp = '03';
            }



            //시동방식(SAL168)
            if($("#stcTp01").is(":checked")){
                param.stcTp = '01';
            }else if($("#stcTp02").is(":checked")){
                param.stcTp = '02';
            }else if($("#stcTp03").is(":checked")){
                param.stcTp = '03';
            }



            //종합평가
            if($("#totEvalCont01").is(":checked")){
                param.totEvalCont = '01';
            }else if($("#totEvalCont02").is(":checked")){
                param.totEvalCont = '02';
            }else if($("#totEvalCont03").is(":checked")){
                param.totEvalCont = '03';
            }else if($("#totEvalCont04").is(":checked")){
                param.totEvalCont = '04';
            }else if($("#totEvalCont05").is(":checked")){
                param.totEvalCont = '05';
            }



            //차량 악세서리
            var carAccContList = "";
            for(var i=0; i < 9; i++){
                if($("#carAccCont0"+(i+1)).is(":checked")){
                    carAccContList = carAccContList + ",Y"
                }else {
                    carAccContList = carAccContList + ",N"
                }
            }
            param.carAccCont = carAccContList.replace(",","");


            //상태표기
            var statContList = [];
            for(var i=1; i < 9; i++){
                if($("#statCont"+i).attr("class").indexOf("btn_active") == -1){
                    statContList = statContList + ",N"
                }else {
                    statContList = statContList + ",Y"
                }
            }
            param.statCont = statContList.replace(",","");




            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/saveImageEval.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });


    /*************************************** 화면 Loading 시 조회 ***************************************/



    $(".btn_xs_check").click(function(){
        $(this).toggleClass("btn_active");
    });




});


function funChkSigle(id,name){
    if(name != "airbackQty" ){
        if($("#"+id).is(":checked") == false){
            $("#"+id).prop("checked", false);
            $("#"+name).val("");
        }else {
            if(id == name + '01'){
                $("#"+name+"01").prop("checked", true)
                $("#"+name+"02").prop("checked", false)
                $("#"+name+"03").prop("checked", false)
                $("#"+name+"04").prop("checked", false)
                $("#"+name+"05").prop("checked", false)
                $("#"+name).val("01");
            }else if(id == name + '02'){
                $("#"+name+"01").prop("checked", false)
                $("#"+name+"02").prop("checked", true)
                $("#"+name+"03").prop("checked", false)
                $("#"+name+"04").prop("checked", false)
                $("#"+name+"05").prop("checked", false)
                $("#"+name).val("02");
            }else if(id == name + '03'){
                $("#"+name+"01").prop("checked", false)
                $("#"+name+"02").prop("checked", false)
                $("#"+name+"03").prop("checked", true)
                $("#"+name+"04").prop("checked", false)
                $("#"+name+"05").prop("checked", false)
                $("#"+name).val("03");
            }else if(id == name + '04'){
                $("#"+name+"01").prop("checked", false)
                $("#"+name+"02").prop("checked", false)
                $("#"+name+"03").prop("checked", false)
                $("#"+name+"04").prop("checked", true)
                $("#"+name+"05").prop("checked", false)
                $("#"+name).val("04");
            }else if(id == name + '05'){
                $("#"+name+"01").prop("checked", false)
                $("#"+name+"02").prop("checked", false)
                $("#"+name+"03").prop("checked", false)
                $("#"+name+"04").prop("checked", false)
                $("#"+name+"05").prop("checked", true)
                $("#"+name).val("05");
            }
        }
    }else {
        if($("#"+id).is(":checked") == false){
            $("#"+id).prop("checked", false);
            $("#"+name).val("");
        }else {
            if(id == 'airbackQty01'){
                $("#airbackQty01").prop("checked",true);
                $("#airbackQty02").prop("checked",false);
                $("#airbackQty").val(2);
                $("#airbackQty03").val("");
            }else if(id == 'airbackQty02'){
                $("#airbackQty01").prop("checked",false);
                $("#airbackQty02").prop("checked",true);
                $("#airbackQty").val(4);
                $("#airbackQty03").val("");
            }
        }

        if(id == 'airbackQty03'){
            $("#"+name+"01").prop("checked", false)
            $("#"+name+"02").prop("checked", false)
            $("#"+name).val($("#airbackQty03").val());
        }
    }

}

</script>
<!-- //script -->
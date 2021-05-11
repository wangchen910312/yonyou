<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">
    <div id="accessoryItemSales">
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12779" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m" data-bind="enabled:isEnableBtnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12781" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCancel" class="btn_m" data-bind="enabled:isEnableBtnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12782" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnComplete" class="btn_m" data-bind="enabled:isEnableBtnComplete"><spring:message code="sal.btn.complete" /><!-- 완성 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12780" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" class="btn_m" data-bind="enabled:isEnableBtnPrint"><spring:message code="sal.btn.accStatPrint" /><!-- 정산서출력 --></button>
                </dms:access>
            </div>
        </div>
        <div class="table_form">
            <table>
            <colgroup>
                <col style="width:10%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.goodsTp'/></span><!-- 용품업무유형 --></th>
                        <td>
                            <input type="text" id="goodsTp" name="goodsTp" class="form_comboBox" data-bind="value:data.goodsTp, enabled:isEnabledGoodsTp" data-name="<spring:message code='sal.lbl.goodsTp'/>" required />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.goodsContractNo' /><!-- 용품오더번호 --></th>
                        <td>
                            <input type="text" id="goodsContractNo" name="goodsContractNo" readonly class="form_input form_readonly" data-bind="value:data.goodsContractNo" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.realDlsDt' /><!-- 완료일자 --></th>
                        <td>
                            <input id="confirmDt" name="confirmDt" readonly class="form_datepicker" data-bind="value:data.confirmDt, enabled:isEnabledConfirmDt" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span><!-- 고객 --></th>
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input type="text" id="contractCustNm" name="contractCustNm" class="form_input" data-bind="value:data.contractCustNm" />
                                        <a href="javascript:void(0);" id="btnSearchContractCustomer"><spring:message code='global.lbl.search' /><!-- 검색 --></a>
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input type="text" id="contractCustNo" name="contractCustNo" class="form_input form_readonly" readonly data-bind="value:data.contractCustNo" required />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></th>
                        <td>
                            <div class="form_float">
                                <input type="text" id="pconCustNo" name="pconCustNo" class="form_input form_readonly" readonly data-bind="value:data.pconCustNo" />
                            </div>
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.telNo' /><!-- 전화번호 --></th>
                        <td>
                            <input type="text" id="telNo" name="telNo" class="form_input" data-bind="value:data.telNo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.brand' /></span><!-- 브랜드 --></th>
                        <td>
                            <input type="text" id="carBrandCd" name="carBrandCd" class="form_comboBox" data-bind="value:data.carBrandCd"  data-name="<spring:message code='global.lbl.brand' />" required />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                        <td>
                            <input type="text" id="carlineCd" name="carlineCd" class="form_comboBox" data-bind="value:data.carlineCd , enabled:isEnabledCarline" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /><!-- 차관 --></th>
                        <td>
                            <input type="text" id="fscCd" name="fscCd" class="form_comboBox" data-bind="value:data.fscCd, enabled:isEnabledFsc" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                        <td>
                            <input type="text" id="ocnCd" name="ocnCd" class="form_comboBox" data-bind="value:data.ocnCd, enabled:isEnabledOcn" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                        <td>
                            <input type="text" id="extColorCd" name="extColorCd" class="form_comboBox" data-bind="value:data.extColorCd, enabled:isEnabledExtColor" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                        <td>
                            <input type="text" id="intColorCd" name="intColorCd" class="form_comboBox" data-bind="value:data.intColorCd, enabled:isEnabledIntColor" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.carVinNo' /><!-- VIN NO --></th>
                        <td>
                            <input type="text" id="vinNo" name="vinNo" class="form_input" data-bind="value:data.vinNo" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 차량번호 --></th>
                        <td>
                            <input type="text" id="carRegNo" name="carRegNo" class="form_input" data-bind="value:data.carRegNo" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.saleContractNo' /><!-- 판매계약번호 --></th>
                        <td>
                            <input type="text" id="saleContractNo" name="saleContractNo" readonly class="form_input form_readonly" data-bind="value:data.saleContractNo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prenAmt' /><!-- 증정금액 --></th>
                        <td>
                            <input type="number" id="prenAmt" name="prenAmt" readonly class="form_numeric form_readonly ar" data-bind="value:data.prenAmt" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.addPrenAmt' /><!-- 추가증정금액 --></th>
                        <td>
                            <input type="number" id="addPrenAmt" name="addPrenAmt" class="form_numeric ar" data-bind="value:data.addPrenAmt, events:{change:changeAddPrenAmt}, enabled:isEnabledAddPrenAmt" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.goodsRealAmt' /><!-- 판매합계금액 --></th>
                        <td>
                            <input type="number" id="goodsRealAmt" name="goodsRealAmt" readonly class="form_numeric form_readonly ar" data-bind="value:data.goodsRealAmt" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" id="pointAreaTh"><spring:message code='global.lbl.point' /><!-- 포인트 --></th>
                        <td id="pointAreaTd">
                            <div class="form_float">
                                <div class="form_left">
                                    <input type="number" id="pointVal" name="pointVal" class="form_numeric form_readonly ar" min=0 readonly data-bind="value:data.pointVal" required placeholder="<spring:message code='ser.lbl.thisUsePoint' />" /><!-- 이번사용포인트 -->
                                </div>
                                <div class="form_right">
                                    <div class="form_search_num">
                                        <input type="number" id="pointAmt" name="pointAmt" class="form_numeric form_readonly ar" min=0 readonly data-bind="value:data.pointAmt, events:{change:changeAddPointAmt}" placeholder="<spring:message code='ser.lbl.thisUseAmt' />" /><!-- 이번사용금액 -->
                                        <a href="javascript:void(0);" id="btnSearchContractMembership"><spring:message code='global.lbl.search' /><!-- 검색 --></a>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <th scope="row" id="couponAreaTh"><spring:message code='crm.title.coupon' /><!-- 쿠폰 --></th>
                        <td id="couponAreaTd">
                            <div class="form_float">
                                <div class="form_left">
                                    <input type="text" id="cupnPubliNo" name="cupnPubliNo" class="form_input form_readonly al" readonly data-bind="value:data.cupnPubliNo" required placeholder="<spring:message code='crm.lbl.cupnNo' />" /><!-- 쿠폰번호 -->
                                </div>
                                <div class="form_right">
                                    <div class="form_search_num">
                                        <input type="number" id="cupnAmt" name="cupnAmt" class="form_numeric form_readonly ar" readonly data-bind="value:data.cupnAmt" placeholder="<spring:message code='global.lbl.amt' />" /><!-- 금액 -->
                                        <a href="javascript:void(0);" id="btnSearchContractCoupon"><spring:message code='global.lbl.search' /><!-- 검색 --></a>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.custPayAmt' /><!-- 고객납부금액 --></th>
                        <td>
                            <input type="number" id="custPayAmt" name="custPayAmt" readonly class="form_numeric form_readonly ar" data-bind="value:data.custPayAmt" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_left">
                <div class="txt_total mt0 child_borderNone" style="display:inline-block;position:relative;top:3px;margin-right:10px;">
                    <!-- 총수량 -->
                    <p><spring:message code='sal.lbl.itemTotQty' /> :<input id="goodsTotCnt" class="form_numeric" readonly="readonly" data-bind="value:data.goodsTotCnt" style="width:80px;" /></p>
                </div>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12778" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnPackage" type="button" class="btn_s" data-bind="enabled:isEnabledBtnPackageAdd"><spring:message code="par.btn.pakage" /><!-- 패키지 --></button>
                <button id="btnItemAdd" type="button" class="btn_s" data-bind="enabled:isEnabledBtnItemAdd"><spring:message code='global.btn.add' /><!-- 추가 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12777" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnItemDel" type="button" class="btn_s" data-bind="enabled:isEnabledBtnItemDel"><spring:message code='global.btn.del' /><!-- 삭제 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12776" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnItemReturn" type="button" class="btn_s" data-bind="enabled:isEnabledBtnItemReturn"><spring:message code='global.btn.itemReturn' /><!-- 반품 --></button>
                </dms:access>
            </div>
        </div>

        <!-- HIDDEN  -->
        <!-- <div style="display:inline"> -->
        <div style="display:none">
            <input type="text" id="membershipNo" name="membershipNo" data-bind="value:data.membershipNo" /> <!-- 포인트 : 멤버쉽번호 -->
            <input type="text" id="cardNo" name="cardNo" data-bind="value:data.cardNo" /> <!-- 포인트 : 카드번호 -->
            <input type="text" id="modelCd" name="modelCd" data-bind="value:data.modelCd" />
            <input type="text" id="cancCupnPubliNo" name="cancCupnPubliNo" data-bind="value:data.cancCupnPubliNo" />
            <input type="text" id="pointSaveYn" name="pointSaveYn" data-bind="value:data.pointSaveYn" />
            <input type="text" id="cupnSaveYn" name="cupnSaveYn" data-bind="value:data.cupnSaveYn" />
        </div>

    </div>

    <div class="table_grid">
        <div id="grid"></div>
    </div>
</section>

<!--스크립트-->

<script type="text/javascript">
/**
버튼활성화 비활성화

저장
[활성화]용품판매문서상태가 출고대기(10),부분출고(20),전체출고(30) 상태인 경우
[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우

취소
[활성화]용품판매문서상태가 출고대기(10) 상태인 경우
[비활성]용품판매문서상태가 출고대기(10) 상태가 아닌 경우

완성
[활성화]용품판매문서상태가 전체출고(30) 상태인 경우
[비활성]용품판매문서상태가 전체출고(30) 상태가 아닌 경우
             용품판매품목상태가 출고대기(10),반품대기(30)인 용품이 있는 경우

정산서출력
[활성화]용품판매문서상태가 완성(40) 상태인 경우
[비활성]용품판매문서상태가 완성(40) 상태가 아닌 경우

추가
[활성화]용품판매문서상태가 출고대기(10),부분출고(20),전체출고(30) 상태인 경우
[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우

삭제
[활성화]용품판매문서상태가 완성(40),취소(50) 상태가 아닌 경우
[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우

반품
[활성화]용품판매문서상태가 완성(40),취소(50) 상태가 아닌 경우
[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우
*/
//var existItemChkObj     = {};
var viewModel = new kendo.observable({
    data:{
         "goodsTp":"${accessoryItemSalesVO.goodsTp}"                    //용품업무유형
        ,"goodsContractNo":"${accessoryItemSalesVO.goodsContractNo}"    //용품판매문서번호
        ,"contractCustNo":"${accessoryItemSalesVO.contractCustNo}"      //계약고객번호
        ,"contractCustNm":"${accessoryItemSalesVO.contractCustNm}"      //계약고객명
        ,"contractCustTp":"${accessoryItemSalesVO.contractCustTp}"      //계약고객유형
        ,"telNo":"${accessoryItemSalesVO.telNo}"                        //계약고객전화번호
        ,"pconCustNo":"${accessoryItemSalesVO.pconCustNo}"              //연계인고객번호
        ,"pconCustNm":"${accessoryItemSalesVO.pconCustNm}"              //연계인고객명
        ,"carBrandCd":"${accessoryItemSalesVO.carBrandCd}"              //브랜드
        ,"carlineCd":"${accessoryItemSalesVO.carlineCd}"                //차종
        ,"modelCd":"${accessoryItemSalesVO.modelCd}"                    //모델코드
        ,"fscCd":"${accessoryItemSalesVO.fscCd}"                        //차관
        ,"ocnCd":"${accessoryItemSalesVO.ocnCd}"                        //OCN
        ,"extColorCd":"${accessoryItemSalesVO.extColorCd}"              //외장색
        ,"intColorCd":"${accessoryItemSalesVO.intColorCd}"              //내장색
        ,"vinNo":"${accessoryItemSalesVO.vinNo}"                        //VIN
        ,"carRegNo":"${accessoryItemSalesVO.carRegNo}"                  //차량번호
        ,"saleContractNo":"${accessoryItemSalesVO.saleContractNo}"      //판매계약번호
        ,"confirmDt":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${accessoryItemSalesVO.confirmDt}' />", "yyyy-MM-dd")                  //완료일자
 //       ,"realDlDt":kendo.toString(kendo.parseDate('${accessoryItemSalesVO.realDlDt}') , "<dms:configValue code='dateFormat' />")
        ,"goodsAmt":"${accessoryItemSalesVO.goodsAmt}"                  //용품합계금액
        ,"prenAmt":"${accessoryItemSalesVO.prenAmt}"                    //증정금액
        ,"addPrenAmt":"${accessoryItemSalesVO.addPrenAmt}"              //추가증정금액
        ,"goodsRealAmt":"${accessoryItemSalesVO.goodsRealAmt}"          //판매합계금액
        ,"custPayAmt":"${accessoryItemSalesVO.custPayAmt}"              //고객지불금액

        ,"dlrCd":"${accessoryItemSalesVO.dlrCd}"                        //딜러코드
        ,"contractStatCd":"${accessoryItemSalesVO.contractStatCd}"      //용품판매문서상태
        ,"dcLvlCd":"${accessoryItemSalesVO.dcLvlCd}"                    //할인레벨코드
        ,"dcApproveYn":"${accessoryItemSalesVO.dcApproveYn}"            //할인승인여부
        ,"eqipPrsnId":"${accessoryItemSalesVO.eqipPrsnId}"              //설치담당자ID
        ,"expcGiEndDt":"${accessoryItemSalesVO.expcGiEndDt}"            //예정출고완료일자
        ,"updtDtStr":"${accessoryItemSalesVO.updtDtStr}"                //수정일시

		// 20170511 이인문 / 멤버십, 쿠폰 정보 추가
        ,"membershipNo":"${accessoryItemSalesVO.membershipNo}"          //멤버십 번호
        ,"cardNo":"${accessoryItemSalesVO.cardNo}"                      //카드번호
        ,"pointVal":"${accessoryItemSalesVO.pointVal}"                  //사용 포인트
        ,"pointAmt":"${accessoryItemSalesVO.pointAmt}"                  //포인트 사용 금액
        ,"cupnPubliNo":"${accessoryItemSalesVO.cupnPubliNo}"            //쿠폰 발행 번호
        ,"cancCupnPubliNo":"${accessoryItemSalesVO.cancCupnPubliNo}"    //취소 쿠폰 발행 번호
        ,"cupnAmt":"${accessoryItemSalesVO.cupnAmt}"                    //쿠폰 사용 금액
        ,"cupnSaveYn":"${accessoryItemSalesVO.cupnSaveYn}"              //쿠폰 수정여부
        ,"pointSaveYn":"${accessoryItemSalesVO.pointSaveYn}"            //포인트 수정여부

//         ,"goodsContractDt":"${accessoryItemSalesVO.goodsContractDt}"    //용품계약일자
    }

    ,"dirty":false

    //저장
    ,"isEnableBtnSave":function(){
        //[활성화]용품판매문서상태가 출고대기(10),부분출고(20),전체출고(30) 상태인 경우
        //[비활성]용품판매문서상태가 완성(50),취소(50) 상태인 경우
        if(this.data.contractStatCd == ""
                || this.data.contractStatCd == "10"
                || this.data.contractStatCd == "20"
                || this.data.contractStatCd == "30"){
            return true;
        }
        return false;
    }
    //취소
    ,"isEnableBtnCancel":function(){
        //[활성화]용품판매문서상태가 출고대기(10) 상태인 경우
        //[비활성]용품판매문서상태가 출고대기(10) 상태가 아닌 경우
        if(this.data.contractStatCd == "10"){
            return true;
        }
        return false;
    }
    //완성
    ,"isEnableBtnComplete":function(){
        //[활성화]용품판매문서상태가 전체출고(30) 상태인 경우
        //[비활성]용품판매문서상태가 전체출고(30) 상태가 아닌 경우
        //       용품판매품목상태가 출고대기(10),반품대기(30)인 용품이 있는 경우
        if(this.data.contractStatCd == "30"){
            return true;
        }
        return false;

    }
    //정산서출력
    ,"isEnableBtnPrint":function(){
        //[활성화]용품판매문서상태가 완성(40) 상태인 경우
        //[비활성]용품판매문서상태가 완성(40) 상태가 아닌 경우
        if(this.data.contractStatCd == "40"){
            return true;
        }
        return false;
    }

    //패키지
    ,"isEnabledBtnPackageAdd":function(){
        //[활성화]용품판매문서상태가 출고대기(10),부분출고(20),전체출고(30) 상태인 경우
        //[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우
        if(this.data.contractStatCd == ""
            || this.data.contractStatCd == "10"
            || this.data.contractStatCd == "20"
            || this.data.contractStatCd == "30"){
            return true;
        }
        return false;
    }

    //추가
    ,"isEnabledBtnItemAdd":function(){
        //[활성화]용품판매문서상태가 출고대기(10),부분출고(20),전체출고(30) 상태인 경우
        //[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우
        if(this.data.contractStatCd == ""
            || this.data.contractStatCd == "10"
            || this.data.contractStatCd == "20"
            || this.data.contractStatCd == "30"){
            return true;
        }
        return false;
    }

    //삭제
    ,"isEnabledBtnItemDel":function(){
        //[활성화]용품판매문서상태가 완성(40),취소(50) 상태가 아닌 경우
        //[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우
        if(this.data.contractStatCd != "40"
            && this.data.contractStatCd != "50"){
            return true;
        }
        return false;
       /*
        var grid = $('#grid').data('kendoExtGrid');
        var chkIdx = 0;
        var gridIdx = 0;
        $(".grid-checkbox-item").each( function(index , obj){
            var dataItem = grid.dataSource._data;
            if( $(obj).hasClass("k-state-selected")){
            }
        }); */
    }
    //반품
    ,"isEnabledBtnItemReturn":function(){
        //[활성화]용품판매문서상태가 완성(40),취소(50) 상태가 아닌 경우
        //[비활성]용품판매문서상태가 완성(40),취소(50) 상태인 경우
        if(this.data.contractStatCd != ""
            && this.data.contractStatCd != "40"
            && this.data.contractStatCd != "50"){
            return true;
        }
        return false;
    }
    ,"isEnabledCarline":function(){
        if(this.data.carBrandCd != "O") return true;
        return false;
    }
    ,"isEnabledFsc":function(){
        return !dms.string.isEmpty(this.data.fscCd);
    }
    ,"isEnabledOcn":function(){
        return !dms.string.isEmpty(this.data.ocnCd);
    }
    ,"isEnabledExtColor":function(){
        return !dms.string.isEmpty(this.data.extColorCd);
    }
    ,"isEnabledIntColor":function(){
        return !dms.string.isEmpty(this.data.intColorCd);
    }
    ,"isEnabledConfirmDt":function(){
        return false;
    }
    ,"isEnabledAddPrenAmt":function(){
        return dms.string.isEmpty(this.data.saleContractNo);
    }
    ,"changeAddPrenAmt":function(){

        var goodsRealAmt = Number(this.data.goodsRealAmt);//판매합계금액
        var addPrenAmt = Number(this.data.addPrenAmt);    //추가증정금액
        var pointAmt = Number(this.data.pointAmt);        //이번사용금액
        var cupnAmt = Number(this.data.cupnAmt);          //쿠폰 금액
        var custPayAmt = Number(this.data.custPayAmt);    //고객납부금액

        var useTotAmt = addPrenAmt + pointAmt + cupnAmt;
        var totAmt = goodsRealAmt - useTotAmt;
        var usePointAmt = goodsRealAmt - (pointAmt + cupnAmt);


        /**
         1. 추가증정금액이  포인트  , 쿠폰
        **/

        if( dms.string.isNotEmpty(this.data.goodsTp) ){

            if(this.data.goodsTp == "05"){
                this.set("data.custPayAmt", this.data.custPayAmt);
            }else{
                if(useTotAmt > usePointAmt ){
                    this.set("data.custPayAmt", 0);
                    this.set("data.addPrenAmt", usePointAmt);
                }else{
                    this.set("data.custPayAmt", totAmt);
                }
            }
        }else{
            if(useTotAmt > usePointAmt ){
                this.set("data.custPayAmt", 0);
                this.set("data.addPrenAmt", usePointAmt);
            }else{
                this.set("data.custPayAmt", totAmt);
            }
        }


    }
    ,"isEnabledGoodsTp":function(){
        return dms.string.isEmpty(this.data.saleContractNo);
    }
});

viewModel.bind("change", function(e){
    this.dirty = true;
});

//용품업무유형
var goodsTpList = [];
var goodsTpLists = [];
<c:forEach var="obj" items="${goodsTpList}">
    <c:if test="${obj.cmmCd eq '01' or obj.cmmCd eq '02'}">
        goodsTpLists.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
  goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var goodsTpMap = dms.data.arrayToMap(goodsTpList, function(obj){ return obj.cmmCd; });

//용품판매문서상태
var contractStatCdList = [];
<c:forEach var="obj" items="${contractStatCdList}">
contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var contractStatCdMap = dms.data.arrayToMap(contractStatCdList, function(obj){ return obj.cmmCd; });

//용품판매품목상태
var itemStatCdList = [];
<c:forEach var="obj" items="${itemStatCdList}">
itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });

//브랜드
var carBrandList = [];
<c:forEach var="obj" items="${carBrandList}">
carBrandList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//차종
var carlineList = [];
<c:forEach var="obj" items="${carlineList}">
carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//차관
var fscList = [];
<c:forEach var="obj" items="${fscList}">
fscList.push({fscNm:"${obj.fscNm}", fscCd:"${obj.fscCd}"});
</c:forEach>

//OCN
var ocnList = [];
<c:forEach var="obj" items="${ocnList}">
ocnList.push({ocnNm:"${obj.ocnNm}", ocnCd:"${obj.ocnCd}"});
</c:forEach>

//외장색
var extColorList = [];
<c:forEach var="obj" items="${extColorList}">
extColorList.push({extColorNm:"${obj.extColorNm}", extColorCd:"${obj.extColorCd}"});
</c:forEach>

//내장색
var intColorList = [];
<c:forEach var="obj" items="${intColorList}">
intColorList.push({intColorNm:"${obj.intColorNm}", intColorCd:"${obj.intColorCd}"});
</c:forEach>

//설치책임자
var eqipPrsnList = [];
<c:forEach var="obj" items="${eqipPrsnList}">
eqipPrsnList.push({tecId:"${obj.tecId}", tecNm:"${obj.tecNm}"});
</c:forEach>
var eqipPrsnMap = dms.data.arrayToMap(eqipPrsnList, function(obj){ return obj.tecId; });

//할인레벨
var dcLvlCdList = [];
<c:forEach var="obj" items="${dcLvlCdList}">
dcLvlCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dcLvlCdMap = dms.data.arrayToMap(dcLvlCdList, function(obj){ return obj.cmmCd; });


//테크니션
var techManCdList = [];
<c:forEach var="obj" items="${techManCdList}">
techManCdList.push({ "tecId":"${obj.tecId}" , "tecNm":"${obj.tecNm}" });
</c:forEach>
var techManMap = dms.data.arrayToMap(techManCdList, function(obj){ return obj.tecId; });


kendo.bind($("#accessoryItemSales"), viewModel);

var validator = $("#accessoryItemSales").kendoExtValidator().data("kendoExtValidator");

/**
 * 용품판매문서상태를 완성(40) 상태로 변경한다.
 */
var updateAccessoryItemSalesContractStatCdToCompletion = function(){
    //용품판매문서 상태를 취소로 변경한다.
    $.ajax({
        url:"<c:url value='/sal/acc/itemSales/updateAccessoryItemSalesContractStatCdToCompletion.do' />"
        ,data:JSON.stringify({
            "dlrCd":viewModel.data.dlrCd                        //딜러코드
            ,"goodsContractNo":viewModel.data.goodsContractNo   //용품판매문서번호
            ,"membershipNo":viewModel.data.membershipNo         //멤버쉽번호
            ,"custPayAmt":viewModel.data.custPayAmt             //고객납부금액
            ,"updtDtStr":viewModel.data.updtDtStr               //수정일시
        })
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(jqXHR,status,error) {
            //dms.notification.error(error);
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success :function(jqXHR, textStatus) {
            //완료되었습니다.
            dms.notification.success("<spring:message code='global.info.completed' />");

            //용품판매문서상태
            viewModel.set("data.contractStatCd", "40");

            //viewModel dirty 초기화
            viewModel.dirty = false;

            //viewModel 갱신
            kendo.bind($("#accessoryItemSales"), viewModel);

            //용품판매관리 그리드 갱신
            parent.$("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });
};

/**
 * 용품판매문서를 저장한다.
 */
var saveAccessoryItemSales = function(completeCallback){

    //용품판매문서 정보 체크
    if(!validator.validate()){
        return;
    }

    //용품품목 정보 체크
    var grid = $("#grid").data("kendoExtGrid");
    var items = grid.dataSource.data();
    var errorMessages = [];
    var priceZeroCnt = 0;

    if(items.length == 0){
        //용품을(를) 선택하여 주십시오
        dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
        return;
    }

    //총판매금액 보다 증정금액이 클 수 없음.
    if(Number(viewModel.data.goodsRealAmt) < Number(viewModel.data.addPrenAmt)){
        dms.notification.warning("<spring:message code='sal.lbl.addPrenAmt' var='addPrenAmt' /><spring:message code='sal.lbl.goodsRealAmt' var='goodsRealAmt' /><spring:message code='global.err.chkGreateParam' arguments='${addPrenAmt},${goodsRealAmt}'/>");
        return;
    }

    // 20170511 이인문 / TODO 포인트, 쿠폰 validation

    //그리드 입력값 체크
    $.each(items, function(idx, dataItem){
        if(dms.string.isEmpty(dataItem.goodsCd)){
            //용품을(를) 선택하여 주십시오
            errorMessages.push({errorMessage:"<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />"});
        }

        if(dataItem.goodsCnt == 0){
            //수량을(를) 입력하여 주십시오.
            errorMessages.push({errorMessage:"<spring:message code='global.lbl.qty' var='qtyMsg' /><spring:message code='global.info.validation.required' arguments='${qtyMsg}' />"});
        }

        if(dataItem.retlPrc === 0){//BHIT 부품담당자의 요청에 의해 추가.(천충, 2018.05.31)
            //단가가 0인 부품이있습니다.
            priceZeroCnt++;
        }

        /*
        if(dms.string.isEmpty(dataItem.eqipPrsnId)){
            //설치담당을(를) 선택하여 주십시오
            errorMessages.push({errorMessage:"<spring:message code='sal.lbl.eqipEmp' var='salLblEqipEmp' /><spring:message code='global.info.validation.select' arguments='${salLblEqipEmp}' />"});
        }
        */

        return errorMessages.length == 0;
    });

    if(priceZeroCnt > 0){
        //단가가 0인 부품이있습니다.
        dms.notification.warning("<spring:message code='global.lbl.prc' var='prcMsg' /><spring:message code='par.info.avlbStockQtyZero' arguments='${prcMsg}' />");
    }

    if(errorMessages.length != 0){
        dms.notification.warning(errorMessages);
        return;
    }

    //직책별 할인금액 체크
    if(!dms.string.isEmpty(viewModel.data.saleContractNo)){
        $.ajax({
            url:"<c:url value='/sal/acc/itemSales/selectDlrGoodsDcLevel.do' />"
            ,data:JSON.stringify({
                "sSaleContractNo":viewModel.data.saleContractNo
                ,"sPrenSumAmt":Number(viewModel.data.prenAmt) + Number(viewModel.data.addPrenAmt)
            })
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,error:function(jqXHR,status,error) {
                //dms.notification.error(error);
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success :function(jqXHR, textStatus) {
                if(jqXHR != null && jqXHR.total > 0
                    && dms.string.strNvl(jqXHR.data[0].prcNregYn) == "Y"
                    && dms.string.isNotEmpty(jqXHR.data[0].dcLvlCd)){

                    if(!confirm("["+ dms.string.strNvl(dcLvlCdMap[jqXHR.data[0].dcLvlCd].cmmCdNm) +"] <spring:message code='sal.lbl.dcLvMsg' /> \n <spring:message code='sal.lbl.isContinueMsg' />")){
                        return false;
                    }

                    dms.window.confirm({
                      //message:"<spring:message code='global.info.confirm.save' />"     //저장 하시겠습니까?
                      message : "["+ dms.string.strNvl(dcLvlCdMap[jqXHR.data[0].dcLvlCd].cmmCdNm) +"]"
                               +"<spring:message code='sal.lbl.dcLvMsg' /> \n <spring:message code='sal.lbl.isContinueMsg' />"
                      ,width:300
                      ,confirmBtnText:"<spring:message code='global.btn.confirm' />"   //확인
                      ,cancelBtnText:"<spring:message code='global.btn.cancel' />"     //취소
                      ,callback:function(result){
                        viewModel.data.dcLvlCd = jqXHR.data[0].dcLvlCd;
                        viewModel.data.dcApproveYn = "Y";
                      }
                    });

               }
            }
        });
    }

    //용품판매품목상태를 체크하여 용품판매문서상태를 조정하여 준다.
    //1.전체출고 : 용품판매품목상태가 출고(20),반품(40)만 포함
    //2.부분출고 : 용품판매품목상태가 출고대기(10) 또는 반품대기(30) 와  출고(20) 또는 반품(40)이 함께 포함
    documentStatChange();

    var changedData = grid.getCUDData("insertList", "updateList", "deleteList");

    var accessoryItemSalesSaveData = {};
    accessoryItemSalesSaveData["accessoryItemSalesVO"] = viewModel.data;
    accessoryItemSalesSaveData["insertList"] = changedData.insertList;
    accessoryItemSalesSaveData["updateList"] = changedData.updateList;
    accessoryItemSalesSaveData["deleteList"] = changedData.deleteList;

    //용품판매문서 저장 및 수납데이터 생성/변경
    $.ajax({
        url:"<c:url value='/sal/acc/itemSales/multiAccessoryItemSales.do' />"
        ,data:JSON.stringify(accessoryItemSalesSaveData)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,beforeSend:function(jqXHR, settings){
            dms.loading.show();
        }
        ,complete:function(jqXHR, textStatus){
            dms.loading.hide();
        }
        ,error:function(jqXHR,status,error) {
            //dms.notification.error(error);
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus) {

            //용품판매문서번호
            viewModel.set("data.goodsContractNo", jqXHR.goodsContractNo);

            //용품판매문서상태
            viewModel.set("data.contractStatCd", jqXHR.contractStatCd);
            viewModel.set("data.updtDtStr", jqXHR.updtDtStr);

            //용품판매문서 품목 그리드 갱신
            $("#grid").data("kendoExtGrid").dataSource.read();

            //viewModel 갱신
            viewModel.set("data.cancCupnPubliNo", "");    //취소쿠폰발행번호
            viewModel.set("data.cupnSaveYn", "");
            viewModel.set("data.pointSaveYn", "");
            kendo.bind($("#accessoryItemSales"), viewModel);

            if(completeCallback){
                completeCallback();
            }else{
                //용품판매관리 그리드 갱신
                parent.$("#grid").data("kendoExtGrid").dataSource.page(1);

                //저장되었습니다.
                dms.notification.success("<spring:message code='global.info.saved' />");
            }
        }
    });
};


var rtnAbleQty = 0;
$(document).ready(function() {

    //팝업옵션

    var popupWindow = parent.popupWindow.options.content.data;
/*
    var popupWindow = parent.$("#accessoryItemSalesDetailPopupWin").data("kendoWindow");
    popupOptions = popupWindow.options.content.data;
 */

    /*
    var popupWindow = parent.$("#accessoryItemSalesDetailPopupWin").data("kendoWindow");
    console.log(popupWindow)
    var popupOptions;
    if(popupWindow != undefined){
        popupOptions = popupWindow.options.content.data;
    }else{
        parent.$("#accessoryItemSalesDetailPopupWin").data("kendoWindow").close();
        return;
    } */
    /*
    var popupOptions;
    if(parent.popupWindow == undefined){
        popupWindow = parent.$("#accessoryItemSalesDetailPopupWin").data("kendoWindow");
        popupOptions = popupWindow.options.content.data;
    }else{
        popupOptions = parent.popupWindow.options.content.data;
    }
     */

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(){

          //sal.info.cancCouponPointAmt
            var goodsRealAmt = Number(viewModel.data.goodsRealAmt);  //판매합계금액
            var addPrenAmt   = Number(viewModel.data.addPrenAmt);    //추가증정금액
            var pointAmt     = Number(viewModel.data.pointAmt);      //이번사용금액
            var cupnAmt      = Number(viewModel.data.cupnAmt);       //쿠폰 금액
            var custPayAmt   = Number(viewModel.data.custPayAmt);    //고객납부금액

            var useTotAmt   = addPrenAmt + pointAmt + cupnAmt;       //포인트 사용금액
            var totAmt      = goodsRealAmt - useTotAmt;              //실고객 납부금앧
            var usePointAmt = goodsRealAmt - (pointAmt + cupnAmt);
            var grid  = $("#grid").data("kendoExtGrid");
            var result = true;

            if(useTotAmt > goodsRealAmt){

              //Confirm 팝업 오픈
                dms.window.confirm({
                    message:"<spring:message code='sal.info.cancCouponPointAmt' />"   //쿠폰,포인트금액 사용금액이 고객납부금액보다 큽니다. 쿠폰,포인트 사용을 취소 하시겠습니까?
                    ,width:300
                    ,confirmBtnText:"<spring:message code='global.btn.confirm' />"      //확인
                    ,cancelBtnText:"<spring:message code='global.btn.cancel' />"        //취소
                    ,callback:function(result){
                        if(result){

                            //포인트 삭제
                            //viewModel.set("data.membershipNo", membershipNo);   //멤버십번호
                            //viewModel.set("data.cardNo", cardNo);       //카드번호
                            viewModel.set("data.pointVal", "");           //사용포인트
                            viewModel.set("data.pointAmt", "");           //사용금액
                            viewModel.set("data.custPayAmt", totAmt );    //고객납부금액
                            viewModel.set("data.pointSaveYn", "Y");       //포인트 저장여부

                            //쿠폰삭제
                            viewModel.set("data.cancCupnPubliNo", viewModel.data.cupnPubliNo);
                            viewModel.set("data.cupnPubliNo", "");      //쿠폰발행번호
                            viewModel.set("data.cupnAmt", "");          //쿠폰할인금액
                            viewModel.set("data.custPayAmt", totAmt );  //고객납부금액
                            viewModel.set("data.cupnSaveYn", "Y");      //쿠폰 저장여부

                            viewModel.set("data.addPrenAmt", 0);     //추가 증정 삭제

                            saveAccessoryItemSales();
                        }else{
                            grid.dataSource.read();
                        }
                    }
                });
            } else {
                saveAccessoryItemSales();
            }
        }
    });

    //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(){


            //용품판매문서상태가 출고대기(10)인 경우만 취소가 가능함
            if(viewModel.data.contractStatCd != "10"){
                //문서상태가 출고대기 인 경우만 취소가 가능합니다.
                dms.notification.warning("<spring:message code='sal.info.cancel.accessoryItemSales' />");
                return;
            }

            var grid = $("#grid").data("kendoExtGrid");

            //용품판매품목상태가 출고(20)인 목록이 있다면 취소 할 수 없다.
            /*
            var isExist = grid.exists(function(item){
                return item.statCd === "20";
            });

            if(isExist){
                //출고된 용품이 존재합니다.
                dms.notification.warning("<spring:message code='sal.info.exist.alreadyReleaseItem' />");
                return;
            }
            */

            //Confirm 팝업 오픈
            dms.window.confirm({
                message:"<spring:message code='global.info.confirm.cancel' />"  //취소하시겠습니까?
                ,width:300
                ,confirmBtnText:"<spring:message code='global.btn.confirm' />"  //확인
                ,cancelBtnText:"<spring:message code='global.btn.cancel' />"    //취소
                ,callback:function(result){
                    if(result){
                        //용품판매문서 상태를 취소로 변경한다.
                        $.ajax({
                            url:"<c:url value='/sal/acc/itemSales/updateAccessoryItemSalesContractStatCdToCancel.do' />"
                            ,data:JSON.stringify({
                                "dlrCd":viewModel.data.dlrCd                        //딜러코드
                                ,"goodsContractNo":viewModel.data.goodsContractNo   //용품판매문서번호
                                ,"cupnPubliNo":viewModel.data.cupnPubliNo           //쿠폰번호
                                ,"membershipNo":viewModel.data.membershipNo         //멤버쉽번호
                                ,"custPayAmt":viewModel.data.custPayAmt             //고객납부금액
                                ,"updtDtStr":viewModel.data.updtDtStr               //수정일시
                            })
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,error:function(jqXHR,status,error) {
                                //dms.notification.error(error);
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success :function(jqXHR, textStatus) {
                                //취소되었습니다.
                                dms.notification.success("<spring:message code='global.info.canceled' />");
                                popupOptions.callbackFunc();
                                parent.popupWindow.close();
                            }
                        });
                    }
                }
            });
        }
    });

    //버튼 - 완성
    $("#btnComplete").kendoButton({
        click:function(){
            documentStatChange();

            //용품판매문서상태가 전체출고(30)인 경우만 완성처리 가능
            if(viewModel.data.contractStatCd != "30"){
                //미출고된 용품이 존재합니다.
                dms.notification.warning("<spring:message code='sal.info.exist.notReleaseItem' />");
                return;
            }

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr")
              , isNonStat = false;

            $.each(rows, function(index, row){
                var item = grid.dataItem(row);
                if(item.statCd == "10"){
                    isNonStat = true;
                }
            });
            if(isNonStat){
                //미출고된 용품이 존재합니다.
                dms.notification.warning("<spring:message code='sal.info.exist.notReleaseItem' />");
                return;
            }

            //Confirm 팝업 오픈
            dms.window.confirm({
                message:"<spring:message code='global.info.confirm.completed' />"   //완성하시겠습니까?
                ,width:300
                ,confirmBtnText:"<spring:message code='global.btn.confirm' />"      //확인
                ,cancelBtnText:"<spring:message code='global.btn.cancel' />"        //취소
                ,callback:function(result){
                    if(result){
                        var grid = $("#grid").data("kendoExtGrid");

                        console.log('viewModel.dirty:',viewModel.dirty);
                        console.log('grid.isModified():',grid.isModified());

                        //변경사항이 있는 경우
                        if(viewModel.dirty || grid.isModified()){
                            //1.용품판매문서를 저장한다.
                            //2.용품판매문서상태를 완성(40) 상태로 변경한다.
                            saveAccessoryItemSales(updateAccessoryItemSalesContractStatCdToCompletion);
                        }else{
                            //용품판매문서상태를 완성(40) 상태로 변경한다.
                            updateAccessoryItemSalesContractStatCdToCompletion();
                        }
                    }
                }
            });
        }
    });

    //버튼 - 정산서출력
    $("#btnPrint").kendoButton({
        click:function(){
            parent.parent._createOrReloadTabMenu("<spring:message code='sal.menu.accessorySale' />", "<c:url value='/ReportServer?reportlet=sale/selectAccessorySalesPrintMain.cpt'/>&sDlrCd="+viewModel.data.dlrCd+"&sGoodsContractNo="+viewModel.data.goodsContractNo);
        }
    });

    //버튼 - 패키지 추가(품목)
    $("#btnPackage").kendoButton({
        click:function(){
            parent.openAccessoryItemSearchPopup(viewModel, $("#grid").data("kendoExtGrid"), "02");
        }
    });

    //버튼 - 추가(품목)
    $("#btnItemAdd").kendoButton({
        click:function(){
           parent.openAccessoryItemSearchPopup(viewModel, $("#grid").data("kendoExtGrid"), "01");
        }
    });

    //버튼 - 삭제(품목)
    $("#btnItemDel").kendoButton({
        click:function(){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //용품을(를) 선택하여 주십시오
                dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
                return;
            }

            //처리상태가 출고(20), 반납(40)인 경우 삭제 할수 없다.
            var flag = true;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if(dataItem.statCd == "20" || dataItem.statCd == "40"){
                    flag = false;
                    return false;
                }
            });

            if(!flag){
                //처리상태가 출고/반납인 목록은 삭제 할 수 없습니다.
                dms.notification.warning("<spring:message code='sal.info.delete.impossibleState.accessoryItemSales' />");
                return;
            }

           /*
           var dataItem = grid.dataItem(rows);
            $.each(grid.dataSource.data() , function( idx , gridData) {
                if( (gridData.goodsCd == dataItem.goodsCd) && (gridData.giStrgeCd == dataItem.giStrgeCd) ){
                     if(gridData.statCd != "20"){
                           gridData.set("eqipCostAmt","0")
                     }
                }
            });
 */
            rows.each(function(index, row) {
                delete parent.existItemChkObj[grid.dataItem(row).goodsCd];
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 반품(품목)
    $("#btnItemReturn").kendoButton({
        click:function(){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length == 0){
                //용품을(를) 선택하여 주십시오
                dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
                return;
            }else if(rows.length != 1){
                //용품을 1개만 선택하여 주십시오.
                dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.required.select.max' arguments='${goodsMsg},"1"' />");
                return;
            }

            var selectedVal = grid.dataItem(rows);

            //처리상태가 출고(20)인 경우만 반품 할 수 있다.
            if(selectedVal.statCd != "20"){
                //처리상태가 출고인 목록만 반품 할 수 있습니다.
                dms.notification.warning("<spring:message code='sal.info.itemReturn.possibleState.accessoryItemSales' />");
                return;
            }

            //반품가능수량
            var avlReturnQty = selectedVal.goodsCnt;
            var mdfEqipCostAmt = 0;  //반품 시 합칠 설치비용
            var rtnQty = 0; //반품 수량
            var eqipCostAmtYn = true; //설치비용 반품유무

            $.each(grid.dataSource.data(), function(idx, dataItem){
                //창고코드와 품목코드가 같고 용품판매품목상태가 반품대기(30), 반품(40)
                if(selectedVal.goodsCd == dataItem.goodsCd
                        && selectedVal.giStrgeCd == dataItem.giStrgeCd
                        && (dataItem.statCd == "30" || dataItem.statCd == "40")
                        && selectedVal.seq == dataItem.refDocLineNo

                ){
                    avlReturnQty = avlReturnQty - dataItem.goodsCnt;
                }

                if(selectedVal.goodsCd == dataItem.goodsCd
                        && selectedVal.giStrgeCd == dataItem.giStrgeCd
                        && (dataItem.statCd != "20")
                        && selectedVal.seq == dataItem.refDocLineNo
                ){
                          rtnQty += Math.abs(dataItem.goodsCnt)*-1;

                          if(Math.abs(dataItem.eqipCostAmt) > 0 ){
                              eqipCostAmtYn = false;
                          }
                 }
            });

            rtnAbleQty = selectedVal.goodsCnt + rtnQty;

            if(rtnAbleQty <= 0 ){
                // 해당 부품 반품수량이 초과되었습니다.
                dms.notification.warning("<spring:message code='par.lbl.itemReturnCompleteMsg' />");
                return;
            }

            //최초 반품 시에만 반품금액에 설치비용을 합친다.
           /*  if(Number(selectedVal.goodsCnt) === Number(avlReturnQty)){
                if(Number(selectedVal.eqipCostAmt) > 0){
                    mdfEqipCostAmt = selectedVal.eqipCostAmt;
                }
            } */

            parent.openReturnItems(selectedVal,rtnAbleQty ,function (returnQty){


                //마지막  반품 시에만 반품금액에 설치비용을 합친다.
                if(Number(rtnAbleQty) === Number(returnQty)){
                    if(Number(selectedVal.eqipCostAmt) > 0 && eqipCostAmtYn){
                        mdfEqipCostAmt = selectedVal.eqipCostAmt * -1;
                    }
                }

                $("#grid").data("kendoExtGrid").dataSource.add({

                    dlrCd           : selectedVal.dlrCd                      //딜러코드
                   ,goodsContractNo : selectedVal.goodsContractNo            //용품계약번호
                   ,goodsCd         : selectedVal.goodsCd                    //용품코드
                   ,goodsNm         : selectedVal.goodsNm                    //용품명
                   ,carlineCd       : selectedVal.carlineCd                  //차종
                   ,goodsCnt        : (returnQty * -1)                       //수량
                   ,goodsUnitCd     : selectedVal.goodsUnitCd                //단위
                   ,retlPrc         : selectedVal.retlPrc                    //단가
                   ,dcRate          : selectedVal.dcRate * -1                //우대율
                   ,dcAmt           : selectedVal.dcAmt * -1                 //우대금액
                   ,saleAmt         : selectedVal.saleAmt * -1               //용품판매단가
                   ,retlTotAmt      : Number(returnQty) * Number(selectedVal.saleAmt) * -1           //용품총가격
                   ,expcEqipDt      : ""                                     //설치예정일
                   ,eqipCostAmt     : mdfEqipCostAmt                         //설치비용
                   ,eqipPrsnId      : ""                                     //설치담당
                   ,expcGiEndDt     : ""                                     //예약출고완료일자
                   ,realDlDt        : ""                                     //출고일
                   ,totAmt          : ((Number(returnQty) * Number(selectedVal.saleAmt)) + Math.abs(mdfEqipCostAmt)) * -1 //금액
                   ,pkgItemCd       : ""                                     //패키지품목코드
                   ,grStrgeCd       : ""                                     //입고창고
                   ,giStrgeCd       : selectedVal.giStrgeCd                  //출고창고
                   ,eqipEndDt       : ""                                     //설치완료일
                   ,statCd          : "30"                                   //처리상태 반품(30)
                   ,refDocNo        : selectedVal.goodsContractNo
                   ,refDocLineNo    : selectedVal.seq
                   ,preReturnQty:0                             //기반품수량

               });

                parent.popupWindow.close();

            });
        }
    });

    //버튼 - 고객조회
    $("#btnSearchContractCustomer").bind("click", function(){
        if($("#contractCustNm").prop("disabled")){ return false; }

        parent.openCustomerSearchPopup(viewModel.data.contractCustNm, function(data){


            viewModel.set("data.contractCustNo", data[0].custNo);     //계약고객번호
            viewModel.set("data.contractCustNm", data[0].custNm);     //계약고객명
            viewModel.set("data.contractCustTp", data[0].custTp);     //계약고객유형

            if(typeof(data.vinNo) != "undefined"){
                if(dms.string.isEmpty(data.carlineCd)){
                    viewModel.set("data.carBrandCd", "N");        //브랜드
                }
                viewModel.set("data.vinNo", data.vinNo);           //vinNo
                viewModel.set("data.carRegNo", data.carRegNo);     //차량번호
                viewModel.set("data.carlineCd", data.carlineCd);
                viewModel.set("data.modelCd", data.modelCd);
                viewModel.set("data.fscCd", data.fscCd);

                setFscCdDataSource(data.carlineCd); //차관
                setOcnDataSource(data.carlineCd, data.fscCd); //ocn

                /*
                $("#modelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(data.carlineCd));
                viewModel.set("data.modelCd", data.modelCd);
                $("#modelCd").data("kendoExtDropDownList").enable(dms.string.isNotEmpty(data.modelCd)?true:false);

                $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource(data.carlineCd, data.modelCd));
                $("#ocnCd").data("kendoExtDropDownList").enable(dms.string.isNotEmpty(data.modelCd)?true:false);
                 */
            }

            //계약고객전화번호
            if(dms.string.isEmpty(data[0].telNo)){
                viewModel.set("data.telNo", dms.string.strNvl(data[0].hpNo));
            }else{
                viewModel.set("data.telNo", data[0].telNo);
            }

            //parent.popupWindow.close();
        });
    });

    //버튼 - 멤버십 정보(포인트) 조회       20170511 이인문
    $("#btnSearchContractMembership").bind("click", function(){

        // 고객번호가 없거나 용품 주문 상태가 완성(40) 인경우 false
        if( dms.string.isEmpty($("#contractCustNo").val()) ) {
            //{고객}을(를) 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.lbl.customer' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
            return false;
        } else if ( viewModel.data.contractStatCd === "40" ) {
            return false;
        };

        var params = {
                "custNo" : viewModel.data.contractCustNo
               ,"custPayAmt" : $("#custPayAmt").data("kendoExtNumericTextBox").value()//viewModel.data.custPayAmt
        };

        parent.openMembershipSearchPopup(params,

                function(data, membershipPointUseYn){

                    var membershipNo;
                    var cardNo;
                    var pointVal;
                    var pointAmt;

                    if ( membershipPointUseYn === "Y" ) {
                        membershipNo = data.membershipNo;
                        cardNo = data.cardNo;
                        pointVal = data.occrPointVal;
                        pointAmt = data.dlrUseAmt;
                        viewModel.set("data.membershipNo", membershipNo);   //멤버십번호
                        viewModel.set("data.cardNo", cardNo);               //카드번호

                    } else if ( membershipPointUseYn === "N" ) {
                        //membershipNo = data.membershipNo;
                        cardNo = "";
                        pointVal = "";
                        pointAmt = "";

                        // TODO 취소버튼 누르면 상세보기 팝업에서는 멤버십 금액을 리셋한다.
                    };

                    viewModel.set("data.pointVal", pointVal);           //사용포인트
                    viewModel.set("data.pointAmt", pointAmt);           //사용금액
                    viewModel.set("data.custPayAmt", Number(viewModel.data.goodsRealAmt) - Number(viewModel.data.addPrenAmt) - Number(pointAmt) - Number(viewModel.data.cupnAmt) );        //사용금액
                    viewModel.set("data.pointSaveYn", "Y");

                });
    });

    //버튼 - 고객 쿠폰 조회	/ 20170511 이인문
    $("#btnSearchContractCoupon").bind("click", function(){

        // 고객번호가 없거나 용품 주문 상태가 완성(40) 인경우 false
        if( dms.string.isEmpty($("#contractCustNo").val()) ) {
            //{고객}을(를) 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.lbl.customer' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
            return false;
        } else if ( viewModel.data.contractStatCd === "40" ) {
            return false;
        };

        var params = {
                "custNo" : viewModel.data.contractCustNo
               ,"custPayAmt" : $("#custPayAmt").data("kendoExtNumericTextBox").value()
        };

        parent.openContractCouponSearchPopup(params, function(data, couponUseYn){

            var dcCd;
            var cupnAmt;

            if ( couponUseYn === "Y" ) {
                dcCd = data.dcCd;
                cupnAmt = (data.subDcAmt).toFixed(2);
            } else if ( couponUseYn === "N" ) {
                viewModel.set("data.cancCupnPubliNo", viewModel.data.cupnPubliNo);

                dcCd = "";
                cupnAmt = "";
            };

            viewModel.set("data.cupnPubliNo", dcCd);    //쿠폰발행번호
            viewModel.set("data.cupnAmt", cupnAmt);     //쿠폰할인금액
            viewModel.set("data.custPayAmt", Number(viewModel.data.goodsRealAmt) - Number(viewModel.data.addPrenAmt) - Number(viewModel.data.pointAmt) - Number(cupnAmt) );        //사용금액
            viewModel.set("data.cupnSaveYn", "Y");

        });
    });

    //버튼 - 연계인조회
    /*
    $("#btnSearchPconCustomer").bind("click", function(){
        parent.openCustomerSearchPopup(viewModel.data.pconCustNm, function(data){
            viewModel.set("data.pconCustNo", data[0].custNo);       //연계인고객번호
            viewModel.set("data.pconCustNm", data[0].custNm);       //연계인고객명

            //parent.popupWindow.close();
        });
    });
    */

    //버튼 - vinNo 조회
    $("#btnSearchVinNo").bind("click", function(){
        parent.openVinNoSearchPop(viewModel.data, function(data){

            setFscCdDataSource(data[0].carlineCd);
            setOcnDataSource(data[0].carlineCd, data[0].fscCd);
            //$("#modelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(data[0].carlineCd));
            //$("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource(data[0].carlineCd, data[0].modelCd));
            $("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource(data[0].modelCd));
            $("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource(data[0].modelCd));
            viewModel.set("data.carlineCd", data[0].carlineCd);
            viewModel.set("data.modelCd", data[0].modelCd);
            viewModel.set("data.ocnCd", data[0].ocnCd);
            viewModel.set("data.extColorCd", data[0].extColorCd);
            viewModel.set("data.intColorCd", data[0].intColorCd);
            viewModel.set("data.vinNo", data[0].vinNo);
            $("#modelCd").data("kendoExtDropDownList").enable(dms.string.isNotEmpty(data[0].modelCd)?true:false);
            $("#ocnCd").data("kendoExtDropDownList").enable(dms.string.isNotEmpty(data[0].ocnCd)?true:false);
            $("#extColorCd").data("kendoExtDropDownList").enable(dms.string.isNotEmpty(data[0].extColorCd)?true:false);
            $("#intColorCd").data("kendoExtDropDownList").enable(dms.string.isNotEmpty(data[0].intColorCd)?true:false);
        });
    });

    //입력폼 - 용품업무유형
    $("#goodsTp").kendoExtDropDownList({
         dataSource:dms.data.cmmCdFilter(goodsTpLists)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //입력폼 - 완료일자
    $("#confirmDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //입력폼 - 브랜드
    $("#carBrandCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:dms.data.cmmCdFilter(carBrandList)
      ,optionLabel:" "
      ,select:function(e){
          console.log("carBrandCd="+e.dataItem.cmmCd)
          if(e.dataItem.cmmCd == "N" || e.dataItem.cmmCd == ""){
              $("#carlineCd").data("kendoExtDropDownList").enable(true);
              $("#carlineCd").data("kendoExtDropDownList").setDataSource(carlineList);
          }else{
              $("#carlineCd").data("kendoExtDropDownList").setDataSource([]);
              $("#carlineCd").data("kendoExtDropDownList").enable(false);

              $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
              $("#fscCd").data("kendoExtDropDownList").enable(false);

              $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
              $("#ocnCd").data("kendoExtDropDownList").enable(false);

              $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#extColorCd").data("kendoExtDropDownList").enable(false);

              $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#intColorCd").data("kendoExtDropDownList").enable(false);
          }
      }
    });

    //입력폼 - 차종
    $("#carlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carlineList
       ,optionLabel:" "
       ,select:function(e){

           $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
           $("#fscCd").data("kendoExtDropDownList").enable(true);

           viewModel.set("data.modelCd", "");

           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#ocnCd").data("kendoExtDropDownList").enable(true);

           $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#extColorCd").data("kendoExtDropDownList").enable(false);

           $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intColorCd").data("kendoExtDropDownList").enable(false);

           if(e.dataItem.carlineCd == ""){
               $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
               $("#fscCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           //$("#fscCd").data("kendoExtDropDownList").setDataSource(gridFscCdDataSet(e.dataItem.carlineCd));
           //$("#modelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(e.dataItem.carlineCd));
           setFscCdDataSource(e.dataItem.carlineCd); //차관
           setOcnDataSource(e.dataItem.carlineCd,""); //ocn
       }
    });


    //입력폼 - 차관
    $("#fscCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,dataSource:fscList
       ,optionLabel:" "
       ,select:function(e){
           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#ocnCd").data("kendoExtDropDownList").enable(true);

           $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#extColorCd").data("kendoExtDropDownList").enable(false);

           $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intColorCd").data("kendoExtDropDownList").enable(false);

           if(e.dataItem.fscCd == ""){
               $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#ocnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           setOcnDataSource($("#carlineCd").val(), e.dataItem.fscCd );
           //$("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), e.dataItem.modelCd));
          // $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), e.dataItem.fscCd));
       }
    });

    //입력폼 - OCN
    $("#ocnCd").kendoExtDropDownList({
         dataTextField:"ocnNm"
        ,dataValueField:"ocnCd"
        ,dataSource:ocnList
        ,optionLabel:" "
        ,select:function(e){
            $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#extColorCd").data("kendoExtDropDownList").enable(true);

            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(false);

            if(e.dataItem.ocnCd == ""){
                $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#extColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            viewModel.set("data.modelCd", e.dataItem.modelCd);
            setExtColorDataSource(viewModel.data.modelCd);
            //$("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource(viewModel.data.modelCd));
        }
    });

    //입력폼 - 외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField:"extColorNm"
        ,dataValueField:"extColorCd"
        ,dataSource:extColorList
        ,optionLabel:" "
        ,select:function(e){
            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(true);

            if(e.dataItem.extColorCd == ""){
                $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#intColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            setIntColorDataSource(viewModel.data.modelCd);
            //$("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#modelCd").val()));
        }
    });


/*
  //차관(모델)의 DataSource를 불러온다.
  function setModelDataSource(carlineCd){
      var responseJson = dms.ajax.getJson({
          url:"<c:url value='/sal/acc/itemSales/selectModel.do' />"
          ,data:JSON.stringify({"carlineCd":carlineCd})
          ,async:false
      });

      if(responseJson == null){
          responseJson = [];
      }
      return responseJson;
  }

  //OCN의 DataSource를 불러온다.
  function setOcnDataSource(carlineCd, modelCd){
      var responseJson = dms.ajax.getJson({
          url:"<c:url value='/sal/acc/itemSales/selectOcn.do' />"
          ,data:JSON.stringify({"carlineCd":carlineCd, "modelCd":modelCd})
          ,async:false
      });

      if(responseJson == null){
          responseJson = [];
      }
      return responseJson;
  }
 */

    //입력폼 - 내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField:"intColorNm"
        ,dataValueField:"intColorCd"
        ,dataSource:intColorList
        ,optionLabel:" "
    });

    //입력폼 - 증정금액
    $("#prenAmt").kendoExtNumericTextBox({
         format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 추가증정금액
    $("#addPrenAmt").kendoExtNumericTextBox({
         format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 판매합계금액
    $("#goodsRealAmt").kendoExtNumericTextBox({
         format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 고객납부금액
    $("#custPayAmt").kendoExtNumericTextBox({
         format:"n2"
        ,min:0
        ,spinners:false
    });

    // 총수량
    $("#goodsTotCnt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0
       ,spinners:false
    });

    //사용 포인트
    $("#pointVal").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       ,value:0
       ,spinners:false
    });
    // 포인트 사용 금액
    $("#pointAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0
       ,spinners:false
    });
    // 쿠폰 사용 금액
    $("#cupnAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0
       ,spinners:false
    });


 // 판매상태에 따른 체크
    changeStatCd = function(pStatCd,pGoodsCnt,pPreReturnQty ){
        var returnVal = "";

        if(pStatCd === '20'){
           if(Number(pPreReturnQty) >= Number(pGoodsCnt)){
              returnVal = 'disabled';
          }
        }else if(pStatCd === '40'){
            returnVal = 'disabled';
        }
        return returnVal;
    };



    //용품목록 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0211-155601"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSalesItems.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sGoodsContractNo"] = $("#goodsContractNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{

                data:function (result){
                    var dataLen = result.data.length,
                        itemList = [],
                        header;
                    parent.existItemChkObj = {};
                    for(var i = 0; i < dataLen; i = i + 1){

                        var goodsCnt = 0;
                        if(result.data[i].statCd == "40") goodsCnt = Number(result.data[i].goodsCnt);
                        else if(result.data[i].statCd == "30")goodsCnt = 0;
                        else goodsCnt = Number(result.data[i].goodsCnt);

                        if(parent.existItemChkObj.hasOwnProperty(result.data[i].goodsCd)){
                            parent.existItemChkObj[result.data[i].goodsCd][result.data[i].giStrgeCd] += Number(goodsCnt);
                        }else{

                            itemList.push(result.data[i].goodsCd);
                            parent.existItemChkObj[result.data[i].goodsCd] = {};
                            parent.existItemChkObj[result.data[i].goodsCd][result.data[i].giStrgeCd] = Number(goodsCnt);

                        }
                    }

                    return result.data;
                }
                ,model:{
                    id:"seq",
                    fields:{
                         dlrCd:{type:"string"}                  //딜러코드
                        ,goodsContractNo:{type:"string"}        //용품계약번호
                        ,seq:{type:"number"}                    //일련번호(라인번호)
                        ,statCd:{type:"string"}                 //용품상태
                        ,goodsCd:{type:"string"}                //용품코드
                        ,goodsNm:{type:"string"}                //용품명
                        ,carlineCd:{type:"string"}              //차종
                        ,goodsCnt:{type:"number"}               //수량
                        ,goodsUnitCd:{type:"string"}            //단위
                        ,retlPrc:{type:"number"}                //단가
                        ,dcRate:{type:"number"}                 //우대율
                        ,dcAmt:{type:"number"}                  //우대금액
                        ,saleAmt:{type:"number"}                //실제판매가
                        ,retlTotAmt:{type:"number"}             //용품총가격
                        ,eqipCostAmt:{type:"number"}            //설치비용
                        ,totAmt:{type:"number"}                 //금액
                        ,expcEqipDt:{type:"date"}               //설치예정일
                        ,eqipPrsnId:{type:"string"}             //설치담당
                        ,expcGiEndDt:{type:"date"}              //예약출고완료일자
                        ,realDlDt:{type:"date"}                 //출고일자
                        ,pkgItemCd:{type:"string"}              //패키지품목코드
                        ,preReturnQty      :{ type:"number" , editable:false }
                        ,grStrgeCd:{type:"string"}              //입고창고
                        ,giStrgeCd:{type:"string"}              //출고창고
                        ,eqipEndDt:{type:"date"}                //설치완료일
                    }
                }
            }
        }
        ,change:function(e){
            var rows = e.sender.tbody.find("tr");
            rows.each(function(index, row) {
                var item = e.sender.dataItem(row)
                  , chk = changeStatCd(item.statCd, item.goodsCnt, item.preReturnQty );

                if( chk == "disabled"){
                    $(this).removeClass("k-state-selected");
                }else{
                    if($(this).hasClass("k-state-selected")){
                        $(this).find(".grid-checkbox-item").prop("checked", true);
                    }else{
                        $(this).find(".grid-checkbox-item").prop("checked", false);
                    }
                }
            });
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            //판매합계금액
            var goodsRealAmt = 0;
            //증정금액
            var prenAmt = 0;
            //총수량
            var totCnt = 0;

            $.each(rows, function(idx, row){
                 var item = e.sender.dataItem(row);

                 //우대금액(단가*(우대율/100))
                 item["dcAmt"] = (item.retlPrc * item.dcRate/100);

                 if(item.statCd == "30" || item.statCd == "40"){
                   //실제판매가(단가-우대금액)
                     item["saleAmt"] = (item.retlPrc + item.dcAmt)*-1;

                 }else {
                   //실제판매가(단가-우대금액)
                     item["saleAmt"] = item.retlPrc - item.dcAmt;

                 }
                //용품총가격(수량*실제판매가)
                item["retlTotAmt"] = Math.abs(item.goodsCnt) * item.saleAmt;

                //금액(용품총가격+설치비용)
                 item["totAmt"] = item.retlTotAmt + item.eqipCostAmt;
                 totCnt += item.goodsCnt;
                 prenAmt += item.goodsCnt * item.dcAmt;
                 goodsRealAmt += item.totAmt;

             });

            var rows = e.sender.tbody.children();

            //총수량
            viewModel.set("data.goodsTotCnt", totCnt);
            //판매합계금액
            viewModel.set("data.goodsRealAmt", goodsRealAmt);
            //증정금액
            viewModel.set("data.prenAmt", prenAmt);
            //고객지불금액
            if(viewModel.data.goodsTp == "05"){
                viewModel.set("data.custPayAmt", viewModel.data.custPayAmt);
            }else{
                viewModel.set("data.custPayAmt", Math.max(goodsRealAmt - viewModel.data.addPrenAmt - viewModel.data.pointAmt- viewModel.data.cupnAmt, 0));
            }

        }
        ,edit:function(e){
            //그리드 데이터소스가 "itemchange","add","remove","sync" 인 경우
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            var grid = $("#grid").data("kendoExtGrid");//.dataSource._data;
            var gridData = grid.dataSource;

            //용품판매문서상태가 완료인 경우
            if(viewModel.data.contractStatCd == "40"){
                this.closeCell();
                return;
            }

            //용품판매품목상태가 출고대기(10)인 경우만 변경 가능
            if(e.model.statCd != "10"){
                this.closeCell();
                return;
            }
            if(fieldName === "chk"){
                this.closeCell();
            }

            if(fieldName == "goodsNm"
                    || fieldName == "statCd"
                    || fieldName == "carlineCd"
                    || fieldName == "goodsUnitCd"
                    || fieldName == "saleAmt"
                    || fieldName == "retlTotAmt"
                    || fieldName == "totAmt"
                    || fieldName == "pkgItemCd"
                    || fieldName == "statCd"
                    || fieldName == "realDlDt"){
                this.closeCell();
                return;
            }
            var input = e.container.find(".k-input");
        }
       // ,multiSelectWithCheckbox:true
        ,height:230
        ,pageable:false
        ,resizable:true
        ,selectable:"multiple, row"
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,columns:[
             {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                  ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                  ,sortable:false
                  ,template:"<input type='checkbox' data-uid='#= uid #' #= changeStatCd(statCd,goodsCnt,preReturnQty)# class='grid-checkbox-item' data-chk=false/>"
             }
             ,{field:"statCd", title:"<spring:message code='global.lbl.issueStatCd'/>", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var statCdNm = "";

                    if(!dms.string.isEmpty(itemStatCdMap[dataItem.statCd])){
                        statCdNm = itemStatCdMap[dataItem.statCd].cmmCdNm;
                    }
                    if(dataItem.statCd == "10"){
                        return "<span class='txt_label bg_green'>" + statCdNm + "</span>";
                    }else if(dataItem.statCd == "20"){
                        return "<span class='txt_label bg_blue'>" + statCdNm + "</span>";
                    }else if(dataItem.statCd == "30"){
                        return "<span class='txt_label bg_orange'>" + statCdNm + "</span>";
                    }else if(dataItem.statCd == "40"){
                        return "<span class='txt_label bg_red'>" + statCdNm + "</span>";
                    }

                    return statCdNm;
                }
            }
            ,{field:"goodsCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:120
                ,attributes :{"class" :"ac"}
                ,editor :function(container, options) {
                    //!options.model.isNew()
                    if(options.model.statCd != "10"){
                        container.context.innerText = dms.string.strNvl(options.model.goodsCd);
                        return;
                    }
                    $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectGoodsSearchPopup(\''+dms.string.strNvl(options.model.goodsCd)+'\', \''+dms.string.strNvl(options.model.pkgItemCd)+'\');"></a></div>')
                    .appendTo(container);
                }
            } //용품코드
            ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:200}                                                //용품명
            ,{field:"strgeNm" ,title:"<spring:message code='sal.lbl.strgeCd' /> " ,attributes:{"class":"al"}   ,width:120}
//             ,{field:"carlineCd", title:"<spring:message code='sal.lbl.carLineCd' />", width:80}                                          //적용차종
            ,{field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", width:80, attributes:{"class":"ar"}                       //수량
                ,template:function(dataItem){
                    var spanObj = 0;
                    if(dataItem.goodsCnt != null){
                        spanObj = dataItem.goodsCnt;
                    }
                    return spanObj;
                 }
                 ,editor:function(container, options) {
                     $('<input name="goodsCnt" data-bind="value:' + options.field + '" maxlength="4" />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n2"
                        ,min:0
                        ,max:999
                        ,decimals:2
                        ,restrictDecimals: true
                        ,spinners:false
                        ,change:bf_gridSumGoodsAmt
                     });
                 }
                ,format:"{0:n2}"
            }
            ,{field:"goodsUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:70, attributes:{"class":"ac"}}     //단위
            ,{field:"retlPrc", title:"<spring:message code='global.lbl.prc' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                ,editor:function(container, options) {
                    $('<input name="retlPrc" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,min:0.00
                       ,restrictDecimals: true
                       ,max:999999
                       ,value:0.00
                       ,spinners:false
                       ,change:bf_gridSumGoodsAmt
                    });
                    $('<span class="k-invalid-msg" data-for="retlPrc"></span>').appendTo(container);
                }
            }          //단가
            ,{field:"dcRate", title:"<spring:message code='sal.lbl.upgrdRate' />", width:90, attributes:{"class":"ar"}  //우대율
                ,template:"#=kendo.toString(dcRate, 'n2')#%"
                ,editor:function(container, options) {
                    $('<input name="dcRate" data-bind="value:' + options.field + '" maxlength="6" />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2%"
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                       ,change: function(){
                           bf_gridSumGoodsAmt("dcRate");
                       }
                    });
                    $('<span class="k-invalid-msg" data-for="dcRate"></span>').appendTo(container);
                }
            }
            ,{field:"dcAmt", title:"<spring:message code='sal.lbl.upgrdAmt' />",width:90, attributes:{"class":"ar"}, format:"{0:n2}"  //우대금액
                ,editor:function(container, options) {
                    $('<input name="dcAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,min:0.00
                       ,restrictDecimals: true
                       ,value:0.00
                       ,spinners:false
                       ,change: function(){
                           bf_gridSumGoodsAmt("dcAmt");
                       }
                    });
                    $('<span class="k-invalid-msg" data-for="dcAmt"></span>').appendTo(container);
                }
            }
            ,{field:"saleAmt", title:"<spring:message code='sal.lbl.saleAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"  //실제판매가
                ,editor:function(container, options) {
                    $('<input name="saleAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="saleAmt"></span>').appendTo(container);
                }
            }
            ,{field:"retlTotAmt", title:"<spring:message code='sal.lbl.retlTotAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"  //용품총가격
                ,editor:function(container, options) {
                    $('<input name="retlTotAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="retlTotAmt"></span>').appendTo(container);
                }
                //,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                //,footerAttributes:{style:"text-align:right;"}
            }
            ,{field:"expcEqipDt", title:"<spring:message code='sal.lbl.expEqipDt' />", width:100, attributes:{"class":"ac"}                      //설치예정일
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input id="expcEqipDt" data-name="<spring:message code="sal.lbl.expEqipDt" />" name="expcEqipDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="expcEqipDt"></span>').appendTo(container);
                }
            }
            ,{field:"eqipCostAmt", title:"<spring:message code='sal.lbl.eqipCost' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"     //설치비용
                ,editor:function(container, options) {
                    $('<input name="eqipCostAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,min:0.00
                       ,max:999999
                       ,value:0.00
                       ,spinners:false
                       ,change:bf_gridSumGoodsAmt
                    });
                    $('<span class="k-invalid-msg" data-for="eqipCostAmt"></span>').appendTo(container);
                }
                //,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                //,footerAttributes:{style:"text-align:right;"}
            }
            ,{field:"totAmt", title:"<spring:message code='global.lbl.amt' />", width:90, attributes:{"class":"ar"}                             //총가격
                ,format:"{0:n2}"
                ,editor:function(container, options) {
                    $('<input name="totAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="totAmt"></span>').appendTo(container);
                }
                //,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                //,footerAttributes:{style:"text-align:right;"}
            }
            ,{field:"eqipPrsnId" ,title:"<spring:message code='sal.lbl.eqipEmp' />", width:90, attributes:{"class":"ac"}                        //설치담당
                ,template:"# if(techManMap[eqipPrsnId] != null) { # #= techManMap[eqipPrsnId].tecNm# # }#"
                ,editor:function (container, options){
                    $('<input name="eqipPrsnId" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField: "tecNm"
                        ,dataValueField:"tecId"
                        ,dataSource:techManCdList
                        //,dataSource:dms.data.cmmCdFilter(eqipPrsnList)
                        ,optionLabel:" "
                    });
                    $('<span class="k-invalid-msg" data-for="eqipPrsnId"></span>').appendTo(container);
                }
            }
            ,{field:"eqipEndDt", title:"<spring:message code='sal.lbl.eqipEndDt' />", width:100, attributes:{"class":"ac"}                       //설치완료일
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input id="eqipEndDt" data-name="<spring:message code="sal.lbl.eqipEndDt" />" name="eqipEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="expcEqipDt"></span>').appendTo(container);
                }
            }
            ,{field:"expcGiEndDt", title:"<spring:message code='sal.lbl.expcGiEndDt' />", width:100, attributes:{"class":"ac"}                  //예약출고완료일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input id="expcGiEndDt" data-name="<spring:message code="sal.lbl.expcGiEndDt" />" name="expcGiEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="expcGiEndDt"></span>').appendTo(container);
                }
            }
            ,{field:"realDlDt", title:"<spring:message code='global.lbl.giDt' />", width:80, attributes:{"class":"ac"}                          //출고일
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:120, attributes:{"class":"al"}, format:"{0:n2}"}    //패키지번호
            ,{field:"refDocNo" ,title:" " ,attributes:{"class":"ar"}   ,width:120,hidden:true}
            ,{field:"refDocLineNo" ,title:" " ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80,hidden:true}
        ]
    });


//    if(dms.string.isNotEmpty(viewModel.data.saleContractNo)){
    //if(viewModel.data.contractStatCd == "40"){
    if(viewModel.data.goodsTp == "01" || viewModel.data.goodsTp == "02"){

        $("#goodsTp").data("kendoExtDropDownList").setDataSource(goodsTpLists);
        $("#goodsTp").data("kendoExtDropDownList").value(viewModel.data.goodsTp);

        $("#contractCustNm").prop("disabled", false);
        $("#telNo").prop("disabled", false);
        $("#carBrandCd").data("kendoExtDropDownList").enable(true);
        //$("#carlineCd").data("kendoExtDropDownList").enable(true);
        $("#vinNo").prop("disabled", false);

    }else{
        $("#goodsTp").data("kendoExtDropDownList").setDataSource(goodsTpList);
        $("#goodsTp").data("kendoExtDropDownList").value(viewModel.data.goodsTp);
        $("#goodsTp").data("kendoExtDropDownList").enable(false);

        $("#contractCustNm").prop("disabled", true);
        $("#telNo").prop("disabled", true);
        $("#carBrandCd").data("kendoExtDropDownList").enable(false);
        //$("#carlineCd").data("kendoExtDropDownList").enable(false);
        $("#fscCd").data("kendoExtDropDownList").enable(false);

        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        $("#vinNo").prop("disabled", true);
    }

    //신규인 경우 완성/취소/정산처출력 버튼 비활성화
    if(dms.string.isEmpty(viewModel.data.goodsContractNo)){
        $("#btnComplete").data("kendoButton").enable(false);
        $("#btnPrint").data("kendoButton").enable(false);

        viewModel.set("data.carBrandCd", "OT");        //브랜드
        $("#carlineCd").data("kendoExtDropDownList").enable(false);
    }

    if(dms.string.isEmpty(viewModel.data.goodsContractNo)){
		$("#grid").data("kendoExtGrid").dataSource.data([]);
    }else{
        $("#grid").data("kendoExtGrid").dataSource.read();
    }

    // 완성차인경우 쿠폰/포인트 영역 감추기 / 20170511 이인문
    if(viewModel.data.goodsTp === "03"){
        $("#pointAreaTh").html("");
        $("#pointAreaTd").html("");
        $("#couponAreaTh").html("");
        $("#couponAreaTd").html("");
    };

});

//용품
selectGoodsSearchPopup = function(goodsCd, pkgItemCd){
    var obj = {};
    obj["dlrCd"] = viewModel.data.dlrCd;
    obj["carlineCd"] = viewModel.data.carlineCd
    obj["goodsCd"] = goodsCd;
    obj["pkgItemCd"] = pkgItemCd;

    parent.bf_pSearchGoodsSearchPopup(obj, function(data, type){
        var tData = {};
        var grid = $("#grid").data("kendoExtGrid");
        var selectItem = grid.dataItem(grid.select());

        if(type == "package"){       // 패키지

        }
        else{

            var rowNum = 0;
            for(var i=0; i<data.length; i++){
                tData = data[i];

                if(i == 0){
                    var rows = grid.tbody.find("tr");
                    $.each(rows, function(index, row) {
                        var rowItem = grid.dataItem(row);
                        if(selectItem.uid == rowItem.uid ){
                            rowNum = index;
                        }
                    });

                    selectItem.set("dlrCd", viewModel.data.dlrCd);
                    selectItem.set("goodsContractNo", viewModel.data.goodsContractNo);
                    selectItem.set("goodsCd", tData.itemCd);
                    selectItem.set("goodsNm", tData.itemNm);
                    selectItem.set("goodsCnt", 1);
                    selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd) );
                    selectItem.set("retlPrc", Number(tData.retlPrc));
                    selectItem.set("dcRate", 0);
                    selectItem.set("dcAmt", 0);
                    selectItem.set("saleAmt", Number(tData.retlPrc) );
                    selectItem.set("retlTotAmt", Number(tData.retlPrc) * 1);
                    selectItem.set("expcEqipDt", "");
                    selectItem.set("eqipCostAmt", 0 );
                    selectItem.set("eqipPrsnId", "");
                    selectItem.set("realDlDt", "");
                    selectItem.set("totAmt", Number(tData.retlPrc) );
                    selectItem.set("pkgItemCd", "");
                    selectItem.set("expcGiEndDt", "");
                    selectItem.set("grStrgeCd",   "");
                    selectItem.set("giStrgeCd",   tData.strgeCd);
                    selectItem.set("eqipEndDt", "");
                    selectItem.set("statCd", "10");
                    selectItem.set("dirty", true);
                }else{
                    grid.dataSource.insert(rowNum+i, {
                        "dlrCd":viewModel.data.dlrCd
                        ,"goodsContractNo":viewModel.data.goodsContractNo
                        ,"goodsCd":tData.itemCd
                        ,"goodsNm":tData.itemNm
                        ,"goodsCnt":1
                        ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd)
                        ,"retlPrc":Number(tData.retlPrc)
                        ,"dcRate":0
                        ,"dcAmt":0
                        ,"saleAmt":Number(tData.retlPrc)
                        ,"retlTotAmt":Number(tData.retlPrc) * 1
                        ,"expcEqipDt":""
                        ,"eqipCostAmt":0
                        ,"eqipPrsnId":""
                        ,"realDlDt":""
                        ,"totAmt":Number(tData.retlPrc)
                        ,"pkgItemCd":""
                        ,"expcGiEndDt":""
                        ,"grStrgeCd":""
                        ,"giStrgeCd":tData.strgeCd
                        ,"eqipEndDt":""
                        ,"statCd":"10"
                    }).set("dirty", true);
                }
            }
        }
    });
}


// 용품Grid 반영
bf_gridSumGoodsAmt = function( rateTp){

    var grid = $("#grid").data("kendoExtGrid");
    var rows = grid.tbody.find("tr");
    var item = grid.dataItem(grid.select());


    var dcAmt = item.dcAmt;
    var dcRate = item.dcRate;

    //용품 그리드 이벤트
    if(item != null){

        if(item.dcAmt > item.retlPrc ){
            dms.notification.info("<spring:message code='sal.lbl.upgrdAmt' var='upgrdAmt' /><spring:message code='global.lbl.prc' var='prc' /><spring:message code='sal.info.maxInfoChk' arguments='${upgrdAmt},${prc}' />");
            item.set("dcAmt", 0);
            item.set("dcRate", 0);
            return;
        }else{

            if( rateTp == "dcRate"){
            //if(dcAmt == 0 ){
                dcAmt = naNcheck(Number(dcRate)*Number(item.retlPrc)/100);
            }else{
                dcRate = naNcheck(dcAmt/item.retlPrc) * 100;
            }
            //할인율
            item.set("dcRate", dcRate);
            //할인가
            item.set("dcAmt", dcAmt );

            //용품판매단가(단가-할인금액)
            item.set("saleAmt", item.retlPrc - dcAmt);
            //용품총가격(수량*실제판매가)
            item.set("retlTotAmt", item.goodsCnt * item.saleAmt);
            //금액(용품총가격+설치비용)
            item.set("totAmt", item.retlTotAmt + item.eqipCostAmt);
        }
    }

    //판매합계금액
    var goodsRealAmt = 0;
    //증정금액
    var prenAmt = 0;
    //총수량
    var totCnt = 0;

    $.each(rows, function(idx, row){
        dataItem      = grid.dataItem(row);
        prenAmt      += dataItem.goodsCnt * dataItem.dcAmt;
        goodsRealAmt += dataItem.totAmt;
        totCnt       += Number(dataItem.goodsCnt);
    });

    //총수량
    viewModel.set("data.goodsTotCnt", totCnt);
    //판매합계금액
    viewModel.set("data.goodsRealAmt", goodsRealAmt);
    //증정금액
    viewModel.set("data.prenAmt", prenAmt);
    //고객지불금액
    if(viewModel.data.goodsTp == "05"){
        viewModel.set("data.custPayAmt", viewModel.data.custPayAmt);
    }else{
        viewModel.set("data.custPayAmt", Math.max(goodsRealAmt - viewModel.data.addPrenAmt - viewModel.data.pointAmt- viewModel.data.cupnAmt, 0));
    }
}

//차관
function setFscCdDataSource(carlineCd) {
    $.ajax({
        url:"<c:url value='/sal/cnt/contractMnt/selectFsc.do' />",
        data:JSON.stringify({"sCarlineCd":carlineCd}),
        type:'POST',
        dataType:'json',
        async:false,
        contentType:'application/json',
        error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        },
        success:function(result, textStatus){
            if(result.data.length > 0 ){
                ocnList = [];
                fscList = [];
                $.each(result.data , function(index , obj){
                    fscList.push({fscNm:obj.fscNm, fscCd:obj.fscCd});
                })

                console.log(JSON.parse(JSON.stringify(fscList)));
                $("#fscCd").data("kendoExtDropDownList").setDataSource(JSON.parse(JSON.stringify(fscList)));
            }
        }
    });
};
//ocn
function setOcnDataSource(carlineCd ,fscCd) {
    $.ajax({
        //url:"<c:url value='/sal/orm/btoCreateOrder/selectStrN1BlockOcn.do' />",
        url:"<c:url value='/sal/cnt/contractMnt/selectOcn.do' />",
        data:JSON.stringify({"sCarlineCd":carlineCd, "sFscCd":fscCd}),
        type:'POST',
        dataType:'json',
        async:false,
        contentType:'application/json',
        error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        },
        success:function(result, textStatus){
            if(result.data.length > 0 ){
                ocnList = [];
                $.each(result.data , function(index , obj){
                    ocnList.push({ocnNm:obj.ocnNm, ocnCd:obj.ocnCd , modelCd:obj.modelCd, modelCnt:obj.modelCnt});
                    //modelCdList.push({ modelNm:obj.modelCd, modelCd:obj.modelCd })
                });
                $("#ocnCd").data("kendoExtDropDownList").setDataSource(JSON.parse(JSON.stringify(ocnList)));
            }
        }
    });
};

//외장색의 DataSource를 불러온다.
function setExtColorDataSource(modelCd){
    /* var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/acc/itemSales/selectExtColor.do' />"
        ,data:JSON.stringify({"modelCd":modelCd})
        ,async:false
    });

    if(responseJson == null){
        responseJson = [];
    }
    return responseJson; */

    $.ajax({
        url:"<c:url value='/sal/acc/itemSales/selectExtColor.do' />",
        data:JSON.stringify({"modelCd":modelCd}),
        type:'POST',
        dataType:'json',
        async:false,
        contentType:'application/json',
        error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        },
        success:function(result, textStatus){
            console.log(result)
            if(result.length > 0 ){
                extColorList = [];
                $.each(result , function(index , obj){
                    extColorList.push({extColorNm:obj.extColorNm, extColorCd:obj.extColorCd });
                });
                console.log("extColorList:"+extColorList)
                $("#extColorCd").data("kendoExtDropDownList").setDataSource(JSON.parse(JSON.stringify(extColorList)));
            }
        }
    });

}

 //내장색의 DataSource를 불러온다.
 function setIntColorDataSource(modelCd){
     /*
     var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/acc/itemSales/selectIntColor.do' />"
         ,data:JSON.stringify({"modelCd":modelCd})
         ,async:false
     });
      */
     $.ajax({
         url:"<c:url value='/sal/acc/itemSales/selectIntColor.do' />",
         data:JSON.stringify({"modelCd":modelCd}),
         type:'POST',
         dataType:'json',
         async:false,
         contentType:'application/json',
         error:function(jqXHR,status,error){
             dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
         },
         success:function(result, textStatus){
             if(result.length > 0 ){
                 intColorList = [];
                 $.each(result , function(index , obj){
                     intColorList.push({intColorNm:obj.intColorNm, intColorCd:obj.intColorCd });
                 });
                 $("#intColorCd").data("kendoExtDropDownList").setDataSource(JSON.parse(JSON.stringify(intColorList)));
             }
         }
     });

 }

function naNcheck(data){
    return isNaN(data)?0:(Number(data)==Infinity||Number(data)==-Infinity)?0:Number(data);
}


//용품판매품목상태를 체크하여 용품판매문서상태를 조정하여 준다.
//1.전체출고 : 용품판매품목상태가 출고(20),반품(40)만 포함
//2.부분출고 : 용품판매품목상태가 출고대기(10) 또는 반품대기(30) 와  출고(20) 또는 반품(40)이 함께 포함
function documentStatChange(){
    var grid = $("#grid").data("kendoExtGrid");
    var items = grid.dataSource.data();

    if(!dms.string.isEmpty(viewModel.data.goodsContractNo)){
        var releaseWaitCnt = 0; //출고대기수
        var releaseCnt = 0;     //출고수
        var returnWaitCnt = 0;  //반품대기수
        var returnCnt = 0;      //반품수

        var goodItemCnt = grid.dataSource.data().length;
        var goodsCnt = 0;

 
        $.each(grid.dataSource.data(), function(idx, dataItem){
            
            if(dataItem.statCd == "10"){//출고대기(10)
                releaseWaitCnt += dataItem.goodsCnt;
                goodsCnt += dataItem.goodsCnt;
            }else if(dataItem.statCd == "20"){//출고(20)
                releaseCnt += dataItem.goodsCnt;
                goodsCnt += dataItem.goodsCnt;
            }else if(dataItem.statCd == "30"){//반품대기(30)
                returnWaitCnt += Math.abs(dataItem.goodsCnt)*-1;;
                goodsCnt += Math.abs(dataItem.goodsCnt)*-1;
            }else if(dataItem.statCd == "40"){//반품(40)
                returnCnt += Math.abs(dataItem.goodsCnt)*-1;;
                goodsCnt += Math.abs(dataItem.goodsCnt)*-1;
            }
        });

        if(goodItemCnt > 0 ){

            if( (releaseWaitCnt+ returnWaitCnt == 0 && ( releaseCnt + returnWaitCnt + returnCnt > 0) )  && goodsCnt > 0   ){  //전체출고
                viewModel.set("data.contractStatCd", "30");
//            }else if((releaseWaitCnt > 0 && ( releaseCnt + returnWaitCnt + returnCnt == 0 )) ){
            }else if((  ( releaseCnt + returnCnt == 0 )) ){
                viewModel.set("data.contractStatCd", "10");                  //출고대기
            }else{
                viewModel.set("data.contractStatCd", "20");                  //부분출고
            }
        }else{
            viewModel.set("data.contractStatCd", "10");//출고대기
        }
    }
}
</script>
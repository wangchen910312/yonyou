<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12845" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12844" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnCancel" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
            </dms:access>
        </div>
    </div>

    <form id="itemMasterForm">
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
                    <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.goodsCd" /><!-- 용품코드 --></span></th>
                    <td>
                        <input type="text" id="itemCd" name="itemCd" class="form_input bmp" pattern="[A-Z0-9\-]+" required data-name="<spring:message code="sal.lbl.goodsCd" />" data-value-update="keyup" data-bind="value:itemCd, disabled:isItemCdDisable" onkeyup="this.value=this.value.toUpperCase()"/>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.goodsNm" /><!-- 용품명 --></span></th>
                    <td>
                        <input type="text" id="itemNm" name="itemNm" class="form_input bmp" required data-name="<spring:message code="global.lbl.goodsNm" />" data-bind="value:itemNm" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.itemEnNm" /><!-- 용품영문명 --></th>
                    <td>
                        <input type="text" id="itemEnNm" name="itemEnNm" class="form_input bmp" data-name="<spring:message code="sal.lbl.itemEnNm" />" data-bind="value:itemEnNm" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.goodsGubun" /><!-- 용품유형 --></span></th>
                    <td>
                        <input type="text" id="etcCd1" name="etcCd1" class="form_comboBox bmp" required data-name="<spring:message code="sal.lbl.goodsGubun" />" data-bind="value:etcCd1" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.goodsHouse" /><!-- 용품창고 --></span></th>
                    <td>
                        <input type="text" id="grStrgeCd" name="grStrgeCd" class="form_comboBox bmp" required data-name="<spring:message code="sal.lbl.goodsHouse" />" data-bind="value:grStrgeCd" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.unit" /><!-- 단위 --></th>
                    <td>
                        <input type="text" id="stockUnitCd" name="stockUnitCd" class="form_comboBox bmp" data-name="<spring:message code="sal.lbl.unit" />" data-bind="value:stockUnitCd" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.brand" /><!-- 브랜드 --></span></th>
                    <td>
                        <input type="text" id="brandCd" name="brandCd" class="form_comboBox bmp" required data-name="<spring:message code="global.lbl.brand" />" data-bind="value:brandCd" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.validStartDt" /><!-- 유효시작일 --></th>
                    <td>
                        <input type="date" id="startDt" name="startDt" class="form_datepicker bmp" data-name="<spring:message code="sal.lbl.validStartDt" />" data-bind="value:startDt" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.validEndDt" /><!-- 유효종료일 --></th>
                    <td>
                        <input type="date" id="endDt" name="endDt" class="form_datepicker bmp" data-name="<spring:message code='sal.lbl.validEndDt' />" data-bind="value:endDt" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.bpCd" /><!-- 공급업체 --></span></th>
                    <td>
                        <input type="hidden" id="bpCd" name="bpCd" required data-name="<spring:message code='global.lbl.bpCd' />" data-bind="value:bpCd" />
                        <div class="form_search">
                        <input type="text" id="bpNm" name="bpNm" class="form_input form_readonly bmp" readonly required data-name="<spring:message code='global.lbl.bpCd' />" data-bind="value:bpNm, disabled:isBpNmDisable" />
                        <a href="javascript:void(0);" id="btnSearchVenderMaster"></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.prodFactory" /><!-- 생산공장 --></th>
                    <td>
                        <input type="text" id="etc1" name="etc1" class="form_input bmp" data-name="<spring:message code='sal.lbl.prodFactory' />" data-bind="value:etc1" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.lastGrPrice" /><!-- 최신입고가 --></th>
                    <td>
                        <input type="number" id="lastGrAmt" name="lastGrAmt" class="form_numeric form_redonly ar bmp" data-name="<spring:message code='global.lbl.lastGrPrice' />" data-bind="value:lastGrAmt, disabled:isLastGrAmtDisabled" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.endYn" /><!-- 사용중지 --></th>
                    <td>
                        <input type="checkbox" id="endYn" name="endYn" data-name="<spring:message code='sal.lbl.endYn' />" data-bind="checked:isEndYnChecked, events:{change:changeEndYn}" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.dealerPoint" /><!-- 딜러포인트 --></th>
                    <td><input type="number" id="etc4" name="etc4" class="form_numeric ar" required data-name="<spring:message code='global.lbl.dealerPoint' />" data-bind="value:etc4, disabled:isEtc4Disabled" /></td>
                    <th scope="row"><spring:message code="sal.lbl.fitCost" /><!-- 설치비 --></th>
                    <td>
                        <input type="number" id="etc2" name="etc2" class="form_numeric ar" required data-name="<spring:message code='sal.lbl.fitCost' />" data-bind="value:etc2" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.pointGoods" /><!-- 포인트상품 --></th>
                    <td>
                        <input type="checkbox" id="etcCd2" name="etcCd2" data-name="<spring:message code='sal.lbl.pointGoods' />" data-bind="checked:isEtcCd2Checked, events:{change:changeEtcCd2}" />
                    </td>
                    <th scope="row" style></th>
                    <td></td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <span style="display:none">
        <!-- 블루멤버십포인트 -->
        <input type="number" id="etc3" name="etc3" class="form_numeric ar" required data-name="<spring:message code='global.lbl.blueMembershipPoint' />" data-bind="value:etc3, disabled:isEtc3Disabled" />
        <!-- 부품마스터 수정여부 -->
        <input type="text" id="updtDtStr" name="updtDtStr" data-bind="value:updtDtStr" />
        <input type="text" id="itemDstinCd" name="itemDstinCd" data-bind="value:itemDstinCd " />
    </span>
    </form>
</section>

<script type="text/javascript">
var viewModel = new kendo.observable({
     "dlrCd":"${accessoryItemMaster.dlrCd}"                     //딜러코드
    ,"spyrCd":"${accessoryItemMaster.spyrCd}"                   //공급상구분
    ,"itemCd":"${accessoryItemMaster.itemCd}"                   //용품코드
    ,"itemNm":"${accessoryItemMaster.itemNm}"                   //용품명
    ,"brandCd":"${accessoryItemMaster.brandCd}"                 //브랜드
    ,"etcCd1":"${accessoryItemMaster.etcCd1}"                   //용품유형
    ,"itemEnNm":"${accessoryItemMaster.itemEnNm}"               //용품영문명
    ,"stockUnitCd":"${accessoryItemMaster.stockUnitCd}"         //재고단위
    ,"bpCd":"${accessoryItemMaster.bpCd}"                       //공급업체코드
    ,"bpNm":"${accessoryItemMaster.bpNm}"                       //공급업체명
    ,"etc1":"${accessoryItemMaster.etc1}"                       //생산공장
    ,"etc2":"${accessoryItemMaster.etc2}"                       //설치비
    ,"endYn":"${accessoryItemMaster.endYn}"                     //사용중지
    ,"etcCd2":"${accessoryItemMaster.etcCd2}"                   //포인트상품
    ,"etc3":"${accessoryItemMaster.etc3}"                       //블루멤버쉽포인트
    ,"etc4":"${accessoryItemMaster.etc4}"                       //딜러포인트
    ,"grStrgeCd":"${accessoryItemMaster.grStrgeCd}"             //창고코드
    ,"startDt":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${accessoryItemMaster.startDt}' />", "yyyy-MM-dd")       //유효시작일
    ,"endDt":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${accessoryItemMaster.endDt}' />", "yyyy-MM-dd")           //유효종료일
    ,"prndYn":"${accessoryItemMaster.prndYn}"                   //단종여부
    ,"dgrItemYn":"${accessoryItemMaster.dgrItemYn}"             //위험품여부
    ,"lastGrAmt":"${accessoryItemMaster.lastGrAmt}"             //최신입고가
    ,"updtDtStr":"${accessoryItemMaster.updtDtStr}"             //업데이트일자
    ,"itemDstinCd":"${accessoryItemMaster.itemDstinCd}"
    ,"strgeNm":"${accessoryItemMaster.strgeNm}"
    ,"isEtcCd2Checked":function(){
        return this.etcCd2 === "Y"? true:false;
    }
    ,"isEndYnChecked":function(){
        return this.endYn === "Y"? true:false;
    }
    ,"isEtc3Disabled":function(){
        return this.etcCd2 === "Y"? false:true;
    }
    ,"isEtc4Disabled":function(){
        return this.etcCd2 === "Y"? false:true;
    }
    ,"isLastGrAmtDisabled":function(){
        return true;
    }
    ,"isBpNmDisable":function(){
        return dms.string.isEmpty(this.bpNm);
    }
    ,"isItemCdDisable":function(){
        return !dms.string.isEmpty(this.itemCd);
    }
    ,"changeEtcCd2":function(e){
        var etc3 = $("#etc3").data("kendoExtNumericTextBox");      //블루멤버쉽포인트
        var etc4 = $("#etc4").data("kendoExtNumericTextBox");      //딜러포인트
        if(e.target.checked){
            this.etcCd2 = "Y";

            etc3.enable(true);
            etc4.enable(true);

        }else{
            this.etcCd2 = "N";

            etc3.value(0);
            etc4.value(0);
            etc3.enable(false);
            etc4.enable(false);
        }
    }
    ,"changeEndYn":function(e){
        if(e.target.checked){
            this.endYn = "Y";
        }else{
            this.endYn = "N";
        }
    }
});

//용품유형 목록
var etcCd1List = [];
<c:forEach var="obj" items="${etcCd1List}">
etcCd1List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//재고단위 목록
var stockUnitCdList = [];
<c:forEach var="obj" items="${stockUnitCdList}">
stockUnitCdList.push({"cmmCd":"${obj.unitExtCd}", "cmmCdNm":"${obj.unitExtCd}"});
</c:forEach>

//브랜드 목록
var brandCdList = [];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>

$(document).ready(function() {
    //팝업옵션
    var popupWindow = parent.$("#accessoryItemMasterDetailPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    var validator = $("#itemMasterForm").kendoExtValidator().data("kendoExtValidator");

    //버튼-저장
    $("#btnSave").kendoButton({
        click:function(e){
            var requestUrl;
            if(dms.string.isEmpty("${accessoryItemMaster.itemCd}")){
                requestUrl = "<c:url value='/sal/acc/itemMaster/insertAccessoryItemMaster.do' />";
            }else{
                requestUrl = "<c:url value='/sal/acc/itemMaster/updateAccessoryItemMaster.do' />";
            }
            if(validator.validate()){
                $.ajax({
                    url:requestUrl,
                    data:JSON.stringify(viewModel),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        popupOptions.callbackFunc();
                        popupWindow.close();
                    }
                });
            }
        }
    });

    //버튼-취소
    $("#btnCancel").kendoButton({
        click:function(e){
            popupWindow.close();
        }
    });

    kendo.bind($("#itemMasterForm"), viewModel);

    //입력폼 - 용품유형
    $("#etcCd1").kendoExtDropDownList({
         dataSource:etcCd1List
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
        ,height:130
    });

    //입력폼 - 재고단위
    $("#stockUnitCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:stockUnitCdList
        ,optionLabel:" "
        ,index:0
        ,height:100
    });

    //입력폼 - 브랜드
    $("#brandCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandCdList
        ,optionLabel:" "
        ,index:0
        ,height:130
    });

    //입력폼 - 공급업체조회
    $("#btnSearchVenderMaster").bind("click", function(){
         if(viewModel.itemDstinCd != "05" ){
             parent.selectVenderMasterSearchPopup(viewModel);
         }
    //    parent.selectVenderMasterSearchPopup(viewModel);
    });

    //입력폼 - 설치비
    $("#etc2").kendoExtNumericTextBox({
         format:"n2"
        ,max:100000000
        ,min:0
        ,spinners:false
    });

    //입력폼 - 유효시작일
    $("#startDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
//          ,popup:{
//              origin:"bottom left"
//              ,position:"bottom left"
//          }
//          ,top:100
    });

    //입력폼 - 유효종료일
    $("#endDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
//         ,popup:{
//             origin:"bottom left"
//             ,position:"bottom left"
//         }
//         ,top:78
    });

    //입력폼 - 용품창고
    $("#grStrgeCd").kendoExtDropDownList({
         dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:storageList
        ,optionLabel:" "
        ,index:0
        ,height:130
    });

    //입력폼 - 블루멤버쉽 포인트
    $("#etc3").kendoExtNumericTextBox({
         format:"n0"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 딜러 포인트
    $("#etc4").kendoExtNumericTextBox({
         format:"n0"
        ,min:0
        ,max:100000000
        ,spinners:false
    });

    //입력폼 - 최신입고가
    $("#lastGrAmt").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
    });

    //console.log(viewModel.grStrgeCd)
    if(viewModel.itemDstinCd == "05"){
        $(".bmp").attr("readonly","readonly");
        $(".bmp").addClass("form_readonly");
        $.each( $(".form_comboBox .bmp") , function(idx , obj){
            $("#"+obj.id).data("kendoExtDropDownList").enable(false);
        });
        console.log("viewModel.grStrgeCd="+viewModel.grStrgeCd);
        if(dms.string.isNotEmpty(viewModel.grStrgeCd)){
            storageList.push({"strgeCd": viewModel.grStrgeCd, "strgeNm":viewModel.strgeNm});
            $("#grStrgeCd").data("kendoExtDropDownList").setDataSource(storageList);
            $("#grStrgeCd").data("kendoExtDropDownList").value(viewModel.grStrgeCd);
        }
    }

});

</script>

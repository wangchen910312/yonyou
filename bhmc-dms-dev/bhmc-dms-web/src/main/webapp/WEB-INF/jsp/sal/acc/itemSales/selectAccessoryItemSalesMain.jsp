<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.goodsSalesMng' /><!-- 용품판매관리 --></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12785" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnViewDetail" class="btn_m"><spring:message code="global.btn.detail" /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12784" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnNew" class="btn_m btn_new"><spring:message code="global.btn.new" /><!-- 신규 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12783" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col style="width:20%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsTp" /><!-- 용품업무유형 --></th>
                    <td>
                        <input type="text" id="sGoodsTp" name="sGoodsTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsContractNo" /><!-- 용품주문번호 --></th>
                    <td>
                        <input type="text" id="sGoodsContractNo" name="sGoodsContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.contractNo" /><!-- 계약번호 --></th>
                    <td>
                        <input type="text" id="sSaleContractNo" name="sSaleContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.orderDate" /><!-- 오더일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartGoodsContractDt" name="sStartGoodsContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndGoodsContractDt" name="sEndGoodsContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.customer" /><!-- 고객 --></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input type="text" id="sContractCustNm" name="sContractCustNm" class="form_input" />
                                    <a href="javascript:void(0);" id="btnSearchCustomer"><spring:message code='global.lbl.search' /></a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input type="text" id="sContractCustNo" name="sContractCustNo" class="form_input form_readonly" readonly />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                    <td>
                        <input type="text" id="sVinNo" name="sVinNo" maxlength="17" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsStat" /><!-- 용품주문상태 --></th>
                    <td>
                        <input type="text" id="sContractStatCd" name="sContractStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.expcGiEndDt' /><!-- 예정출고일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartExpcGiEndDt" name="sStartExpcGiEndDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndExpcGiEndDt" name="sEndExpcGiEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.custTelNm" /><!-- 고객전화 --></th>
                    <td>
                        <input type="text" id="sTelNo" name="sTelNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></th>
                    <td>
                        <input type="text" id="sCarRegNo" name="sCarRegNo" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>

<script type="text/javascript">
var existItemChkObj = {};
//용품업무유형
var goodsTpList = [];
<c:forEach var="obj" items="${goodsTpList}">
goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var goodsTpMap = dms.data.arrayToMap(goodsTpList, function(obj){ return obj.cmmCd; });

//용품판매상태
var contractStatCdList = [];
<c:forEach var="obj" items="${contractStatCdList}">
<c:if test="${obj.cmmCd ne '60'}">
contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var contractStatCdMap = dms.data.arrayToMap(contractStatCdList, function(obj){ return obj.cmmCd; });

var popupWindow;

//상세정보 팝업 화면 출력
function openAccessoryItemSalesDetailPopup(goodsContractNo){
    popupWindow = dms.window.popup({
        windowId:"accessoryItemSalesDetailPopupWin"
        ,title:"<spring:message code='sal.title.goodsSalesInfo'/>"
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSalesDetailPopup.do?goodsContractNo="+goodsContractNo+"'/>"
            ,data:{
                "callbackFunc":function(){
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                    $("#accessoryItemSalesDetailPopupWin").data("kendoWindow").close();
                }
            }
        }
    });
}

//상세정보 팝업 화면에서 용품아이템조회 팝업 출력
function openAccessoryItemSearchPopup(viewModel, grid, type){
    popupWindow = dms.window.popup({
        windowId:"accessoryItemSearchPopup"
        ,title:"<spring:message code='sal.title.goodsSearch' />"
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSearchPopup.do'/>"
            ,data:{
                "type":type     // 아이템, 패키지, ALL
                ,"autoBind":true
                ,"selectable":"multiple"
                ,"callbackFunc":function(data, type){
                    var isExist = false;
                    //용품패키지
                    if(type == "package"){
                        var pkgItemCd = "";
                        var itemData = {};

                         if(data.length > 0 && isPackage(grid, data[0].pkgItemCd)){
                            // 동일한 패키지가 존재합니다.
                            dms.notification.info("<spring:message code='sal.info.IsPackageMsg'/>");
                            return false;
                        }

                        for(var i=0; i<data.length; i++){
                            itemData = {};
                            itemData["dlrCd"] = viewModel.dlrCd;
                            itemData["goodsContractNo"] = viewModel.goodsContractNo;
                            itemData["statCd"] = "10";
                            itemData["goodsCd"] = data[i].itemCd;
                            itemData["goodsNm"] = data[i].itemNm;
                            itemData["goodsCnt"] = 1;
                            itemData["goodsUnitCd"] = dms.string.strNvl(data[i].stockUnitCd) != "" ? data[i].stockUnitCd:data[i].itemUnitCd ;
                            itemData["retlPrc"] = Number(data[i].itemPrc);
                            itemData["dcRate"] = Number(data[i].pkgDetlDcRate);
                            itemData["dcAmt"] = Number(data[i].pkgDetlDcAmt);
                            itemData["saleAmt"] = Number(data[i].pkgDetlDcTotAmt);
                            itemData["retlTotAmt"] = Number(data[i].pkgDetlDcTotAmt);
                            itemData["expcEqipDt"] = "";
                            itemData["eqipCostAmt"] = 0 ;
                            itemData["eqipPrsnId"] = "";
                            itemData["expcGiEndDt"] = "";
                            itemData["realDlDt"] = "";
                            itemData["totAmt"] = Number(data[i].pkgDetlDcTotAmt);
                            itemData["pkgItemCd"] = data[i].pkgItemCd;
                            itemData["grStrgeCd"] = "";
                            itemData["giStrgeCd"] = data[i].strgeCd;
                            itemData["eqipEndDt"] = "";
                            itemData["preReturnQty"] = 0;
                            itemData["dirty"] = true;
                            grid.dataSource.insert(i, itemData);
                        }

                    //용품
                    }else{

                        setExistItemChkObj(grid);

                        $.each(data, function(idx, item){

                            if(existItemChkObj.hasOwnProperty(item.itemCd)){
                                if(existItemChkObj[item.itemCd].hasOwnProperty(item.strgeCd) &&
                                    existItemChkObj[item.itemCd][item.strgeCd] > 0
                                ){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = item.itemCd + '[' + item.itemNm + ']'+ '[' + item.strgeCd + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                    isExist = false;
                                    return false;
                                }else{
                                    existItemChkObj[item.itemCd][item.strgeCd] = 1;
                                    isExist = true;
                                }
                            }else{
                                existItemChkObj[item.itemCd] = {};
                                existItemChkObj[item.itemCd][item.strgeCd] = 1;
                                isExist = true;
                            }

             //               console.log("isExist="+isExist);
                            if(isExist){
                                grid.dataSource.add({
                                    dlrCd:viewModel.dlrCd                      //딜러코드
                                   ,goodsContractNo:viewModel.goodsContractNo  //용품계약번호
                                   ,goodsCd:item.itemCd                        //용품코드
                                   ,goodsNm:item.itemNm                        //용품명
                                   ,carlineCd:""                               //차종
                                   ,goodsCnt:1                                 //수량
                                   ,goodsUnitCd:item.stockUnitCd               //단위
                                   ,retlPrc:item.retlPrc                       //단가
                                   ,dcRate:0                                   //우대율
                                   ,dcAmt:0                                    //우대금액
                                   ,saleAmt:item.retlPrc                       //실제판매가
                                   ,retlTotAmt:item.retlPrc                    //용품총가격
                                   ,expcEqipDt:""                              //설치예정일
                                   ,eqipCostAmt:item.etc2                      //설치비용
                                   ,eqipPrsnId:""                              //설치담당
                                   ,realDlDt:""                                //출고일
                                   ,totAmt:item.retlPrc+item.etc2              //금액
                                   ,pkgItemCd:""                               //패키지품목코드
                                   ,grStrgeCd:""                               //입고창고
                                   ,giStrgeCd:item.strgeCd                     //출고창고
                                   ,eqipEndDt:""                               //설치완료일
                                   ,statCd:"10"                                //처리상태
                                   ,preReturnQty:0                             //기반품수량
                               });
                            }
                        });

/*
                        $.each(data, function(idx, item){
                             isExist = grid.exists(function(obj){
                                return (obj.goodsCd === item.itemCd
                                        && obj.giStrgeCd === item.strgeCd
                                        && ( (obj.statCd == '10' || obj.statCd == '20')
                                                && (obj.goodsCnt - obj.preReturnQty) > 0 )
                                );
                            });

                            //중복체크
                            if(!isExist){
                                grid.dataSource.add({
                                     dlrCd:viewModel.dlrCd                      //딜러코드
                                    ,goodsContractNo:viewModel.goodsContractNo  //용품계약번호
                                    ,goodsCd:item.itemCd                        //용품코드
                                    ,goodsNm:item.itemNm                        //용품명
                                    ,carlineCd:""                               //차종
                                    ,goodsCnt:1                                 //수량
                                    ,goodsUnitCd:item.stockUnitCd               //단위
                                    ,retlPrc:item.retlPrc                       //단가
                                    ,dcRate:0                                   //우대율
                                    ,dcAmt:0                                    //우대금액
                                    ,saleAmt:item.retlPrc                       //실제판매가
                                    ,retlTotAmt:item.retlPrc                    //용품총가격
                                    ,expcEqipDt:""                              //설치예정일
                                    ,eqipCostAmt:0                              //설치비용
                                    ,eqipPrsnId:""                              //설치담당
                                    ,realDlDt:""                                //출고일
                                    ,totAmt:item.retlPrc                        //금액
                                    ,pkgItemCd:""                               //패키지품목코드
                                    ,grStrgeCd:""                               //입고창고
                                    ,giStrgeCd:item.strgeCd                     //출고창고
                                    ,eqipEndDt:""                               //설치완료일
                                    ,statCd:"10"                                //처리상태
                                    ,preReturnQty:0                             //기반품수량
                                });
                            }else{
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + item.itemCd + "'/>");
                                return false;
                            }
                        });
                         */

                    }
                    if(isExist){
                        $("#accessoryItemSearchPopup").data("kendoWindow").close();
                    }
                }
            }
        }
    });
}

// 중복패키지 검색
function isPackage(grid, pkg){
    var isPackageFlag = false;
    var rows = grid.tbody.find("tr");
    $.each(rows, function(index, row) {
        var rowItem = grid.dataItem(row);
        if(pkg == rowItem.pkgItemCd){
            isPackageFlag = true;
        }
    });
    return isPackageFlag;
}

// existItemChkObj 셋팅
function setExistItemChkObj(grid){
    existItemChkObj = {};
    var rows = grid.tbody.find("tr");
    $.each(rows, function(index, row) {
        var item = grid.dataItem(row);
        var goodsCnt = 0;

        /*
        if(item.statCd == "40") {
            goodsCnt = Number(item.goodsCnt)*-1;
        }else{
            goodsCnt = Number(item.goodsCnt);
        }
        */
        goodsCnt = Number(item.goodsCnt);

        if(existItemChkObj.hasOwnProperty(item.goodsCd)){
            existItemChkObj[item.goodsCd][item.giStrgeCd] += Number(goodsCnt);
        }else{
            existItemChkObj[item.goodsCd] = {};
            existItemChkObj[item.goodsCd][item.giStrgeCd] = Number(goodsCnt);
        }
    });
}

//용품찾기
function bf_pSearchGoodsSearchPopup(obj, callbackFunc){
    dms.window.popup({
        windowId:"accessoryItemSearchPopup"
        ,title:"<spring:message code='sal.title.goodsSearch' />"
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                ,"selectable":"multiple"
                ,"callbackFunc":function(data, type){
                    callbackFunc(data, type);
                    $("#accessoryItemSearchPopup").data("kendoWindow").close();
                }
            }
        }
    });
}


//고객조회 팝업 출력
function openCustomerSearchPopup(custNm, callbackFunc){
    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"
        , modal:true
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":custNm
                , "callBackTp":"BTN_CREATE"
                , "closeYn":"Y"
                , "type":null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        callbackFunc(data);
                    }
                    //popupWindow.close();

                    if(data.callBackTp == "BTN_CREATE" ){
                        window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custReg' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do' />", "VIEW-D-10623");
                    }
                }
            }
        }
    });
}

//멤버십 정보(포인트) 조회 팝업 출력	/ 20170511 이인문
function openMembershipSearchPopup(params, callbackFunc){
    popupWindow = dms.window.popup({
        windowId:"membershipSearchPopup"
        , title:"<spring:message code='crm.info.pointInfo' />"  // 포인트정보
        , modal:true
        , height:250
        , content:{
            url:"<c:url value='/sal/acc/itemSales/selectDealerMemberShipInfoPopup.do'/>"
            , data:{
                "autoBind":true
                , "params":params
                , "closeYn":"Y"
                , "type":null
                , "callbackFunc":function(data, membershipPointUseYn){

                    if ( data !== null ) {
                        callbackFunc(data, membershipPointUseYn);
                    }

                }
            }
        }
    });
}


//고객쿠폰 조회 팝업 출력	/ 20170511 이인문
function openContractCouponSearchPopup(params, callbackFunc){
  popupWindow = dms.window.popup({
      windowId:"contractCouponSearchPopup"
      , title:"<spring:message code='crm.title.coupon' />"  // 쿠폰
      , modal:true
      , height:150
      , content:{
          url:"<c:url value='/sal/acc/itemSales/selectEtcDcTargetPopup.do'/>"
          , data:{
              "autoBind":true
              , "params":params
              , "closeYn":"Y"
              , "type":null
              , "callbackFunc":function(data, couponUseYn){

                  if ( data !== null ) {
                      callbackFunc(data, couponUseYn);
                  }

              }
          }
      }
  });
}


// vin조회 팝업 출력
function openVinNoSearchPop(data, callbackFunc){
    popupWindow = dms.window.popup({
        windowId:"vinNoSearchPopup"
        , title:"<spring:message code='sal.title.carSearch'/>"
        , modal:true
        , content:{
            url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
            , data:{
                "autoBind":null
                , "dataInfo":data
                , "type":null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        callbackFunc(data);
                    }
                    //$("#vinNoSearchPopup").data("kendoWindow").close();
                }
            }
        }
    });
}

function openReturnItems(selectedVal , rtnAbleQty, callbackFunc){

      //반품수량 조정 팝업 오픈
    popupWindow = dms.window.popup({
          windowId:"setAccessoryItemStockOutReturnPopup"
          ,title:"<spring:message code='par.btn.innerReturn' />"
          ,width :340
          ,height:180
          ,modal:true
          ,content:{
              url:"<c:url value='/sal/acc/itemSales/setAccessoryItemStockOutReturnPopup.do'/>"
              ,data:{
                   "goodsCnt":selectedVal.goodsCnt
                   ,"goodsCd":selectedVal.goodsCd
                   ,"goodsNm":selectedVal.goodsNm
                   ,"avlbReturnQty":rtnAbleQty
                   ,"callbackFunc":function(returnQty){

                       callbackFunc(returnQty);

                  }
              }
          }
      });

}

$(document).ready(function(){
    //버튼 - 상세
    $("#btnViewDetail").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length < 1){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            openAccessoryItemSalesDetailPopup(grid.dataItem(rows).goodsContractNo);
        }
    });

    //버튼 - 신규
    $("#btnNew").kendoButton({
        click:function(e){
            popupWindow = dms.window.popup({
                windowId:"accessoryItemSalesDetailPopupWin"
                ,title:"<spring:message code='sal.title.goodsSalesInfo'/>"
                ,modal:true
                ,content:{
                    url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSalesDetailPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(data){
                            $("#grid").data("kendoExtGrid").dataSource.page(1);
                            $("#accessoryItemSalesDetailPopupWin").data("kendoWindow").close();
                        }
                    }
                }
            });

        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if(dms.string.isEmpty($("#sStartGoodsContractDt").val()) || dms.string.isEmpty($("#sEndGoodsContractDt").val())){
                //오더일자 조회 기간을 입력하여 주십시오.
                dms.notification.warning("<spring:message code='sal.info.insertOrderDtSelectTerm'/>");
                return
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 고객조회팝업
    $("#btnSearchCustomer").bind("click", function(){
        openCustomerSearchPopup($("#sContractCustNm").val(), function(data){
            $("#sContractCustNo").val(data[0].custNo);
            $("#sContractCustNm").val(data[0].custNm);

            //popupWindow.close();
        });
    });

    //조회조건 - 용품업무유형
    $("#sGoodsTp").kendoExtDropDownList({
        /*
        dataSource:dms.data.arrayFilter(goodsTpList, function(obj){
             return obj.cmmCd == "03"? false:true;
         })
        */
        dataSource:dms.data.cmmCdFilter(goodsTpList)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 용품판매상태
    /* $("#sContractStatCd").kendoExtDropDownList({
         dataSource:dms.data.arrayFilter(contractStatCdList, function(obj){
             return obj.cmmCd == "60"? false:true;
         })
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    }); */

    $("#sContractStatCd").kendoExtMultiSelectDropDownList({
         /* dataSource:dms.data.arrayFilter(contractStatCdList, function(obj){
             return obj.cmmCd == "60"? false:true;
         } )*/
         dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataSource:contractStatCdList
        //,optionLabel:" "
        //,index:0
    });

    //조회조건  - 오더일자 조회시작일
    $("#sStartGoodsContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${startGoodsContractDt}' />", "yyyy-MM-dd")
    });

    //조회조건 - 오더일자 조회종료일
    $("#sEndGoodsContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${endGoodsContractDt}' />", "yyyy-MM-dd")
    });

    //조회조건 - 예정출고일자 조회시작일
    $("#sStartExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 예정출고일자 조회종료일
    $("#sEndExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 고객명 변경 이벤트
    //조회조건의 고객명 변경시 고객번호를 초기화 한다.
    $("#sContractCustNm").bind("change", function(){
        $("#sContractCustNo").val("");
    });

    //그리드 더블클릭
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());

        openAccessoryItemSalesDetailPopup(dataItem.goodsContractNo);
    });

    //그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-2017-051919"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSales.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGoodsTp"] = $("#sGoodsTp").data("kendoExtDropDownList").value();                                      //용품업무유형
                        params["sGoodsContractNo"] = $("#sGoodsContractNo").val();                                                  //용품오더번호
                        params["sSaleContractNo"] = $("#sSaleContractNo").val();                                                    //계약번호(완성차판매)
                        params["sStartGoodsContractDt"] = $("#sStartGoodsContractDt").data("kendoExtMaskedDatePicker").value();     //오더일자 조회시작일
                        params["sEndGoodsContractDt"] = $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value();         //오더일자 조회종료일
                        params["sContractCustNo"] = $("#sContractCustNo").val();                                                    //고객번호
                        params["sVinNo"] = $("#sVinNo").val();                                                                      //VIN
                        //params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").value();                        //용품주문상태
                        params["sContractStatCdList"] = $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").value();                        //용품주문상태
                        params["sStartExpcGiEndDt"] = $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value();             //예정출고일자 조회시작일
                        params["sEndExpcGiEndDt"] = $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value();                 //예정출고일자 조회종료일
                        params["sTelNo"] = $("#sTelNo").val();                                                                      //고객전화번호
                        params["sCarRegNo"] = $("#sCarRegNo").val();                                                                //차량번호

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"goodsContractNo"
                    ,fields:{
                        finDocNo:{type:"string"}          //수납문서번호
                        ,contractStatCd:{type:"string"}    //용품상태
                        ,goodsTp:{type:"string"}            //업무유형
                        ,contractCustNm:{type:"string"}    //고객명
                        ,carlineCd:{type:"string"}          //차종
                        ,goodsContractNo:{type:"string"}    //용품계약번호
                        ,goodsNm:{type:"string"}            //용품명칭
                        ,goodsCnt:{type:"number"}           //용품수
                        ,saleContractNo:{type:"string"}    //계약번호
                        ,telNo:{type:"string"}              //고객전화번호
                        ,vinNo:{type:"string"}              //vinNo
                        ,goodsContractDt:{type:"date"}      //오더일자
                        ,updtDtStr:{ type:"string" }

                    }
                }
            }
        }
        ,editable:false
        ,sortable:true
        //,selectable:"row"
        ,columns:[
            {field:"contractStatCd", title:"<spring:message code='sal.lbl.goodStat'/>", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var contractStatCdNm = "";

                    if(!dms.string.isEmpty(contractStatCdMap[dataItem.contractStatCd])){
                        contractStatCdNm = contractStatCdMap[dataItem.contractStatCd].cmmCdNm;
                    }

                    if(dataItem.contractStatCd == "10"){
                        return "<span class='txt_label bg_green'>" + contractStatCdNm + "</span>";
                    }else if(dataItem.contractStatCd == "20"){
                        return "<span class='txt_label bg_yellow'>" + contractStatCdNm + "</span>";
                    }else if(dataItem.contractStatCd == "30"){
                        return "<span class='txt_label bg_orange'>" + contractStatCdNm + "</span>";
                    }else if(dataItem.contractStatCd == "40"){
                        return "<span class='txt_label bg_blue'>" + contractStatCdNm + "</span>";
                    }else if(dataItem.contractStatCd == "50"){
                        return "<span class='txt_label bg_red'>" + contractStatCdNm + "</span>";
                    }else if(dataItem.contractStatCd == "60"){
                        return "<span class='txt_label bg_purple'>" + contractStatCdNm + "</span>";
                    }

                    return contractStatCdNm;
                }
            } //용품문서상태
            ,{field:"goodsContractDt", title:"<spring:message code='sal.lbl.orderDate' />", width:80                                    //오더일자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"goodsTp", title:"<spring:message code='sal.lbl.goodsTp' />", width:90
                ,attributes:{"class":"ac"}
                ,template:"# if(goodsTpMap[goodsTp] != null) { # #= goodsTpMap[goodsTp].cmmCdNm# # }#"
            }
            ,{field:"contractCustNm", title:"<spring:message code='global.lbl.custNm' />", width:130}                                   //고객명
            ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", width:100}                                       //차종
            ,{field:"goodsContractNo", title:"<spring:message code='sal.lbl.goodsContractNo' />", width:150, attributes:{"class":"ac"}} //용품오더번호
            ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:300, attributes:{"class":"al"}}                                                       //용품명
            ,{field:"goodsCnt", title:"<spring:message code='sal.lbl.goodsCnt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}", decimal:2}//용품수
            ,{field:"saleContractNo", title:"<spring:message code='global.lbl.contractNo' />", width:120, attributes:{"class":"ac"}}    //계약번호
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}                  //VIN
            ,{field:"telNo", title:"<spring:message code='sal.lbl.telNo' />", width:100}                                                //고객전화번호
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100}                                          //차량번호
            ,{field:"expcGiEndDt", title:"<spring:message code='sal.lbl.expcGiEndDt' />", width:80                                      //출고예정일자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                , hidden:true
            }
            ,{field      :"updtDtStr", hidden:true}//수정일시
        ]
    });
});

</script>


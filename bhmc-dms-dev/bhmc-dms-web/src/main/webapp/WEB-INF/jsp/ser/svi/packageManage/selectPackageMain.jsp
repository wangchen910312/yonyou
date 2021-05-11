<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 부품 조회 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12950" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_reset" id="btnInit"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                <!-- 조회 버튼 -->
                    <dms:access viewId="VIEW-D-12069" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12070" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnSave"><spring:message code="ser.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12072" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add" id="packageReg"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12071" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>

            <form id="packageForm" name="packageForm">
            <input type="hidden" id="pkgItemCd" name="pkgItemCd" data-json-obj="true" />
            <input type="hidden" id="pkgItemNm" name="pkgItemNm" data-json-obj="true" />
            <input type="hidden" id="pkgDocNo" name="pkgDocNo" data-json-obj="true" />
            <input type="hidden" id="ltsModelCd" name="ltsModelCd" data-json-obj="true" />
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:17%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.packageCd" /></th><!-- Package번호 -->
                            <td>
                                <input type="input" id="sPkgMngItemCd" name="sPkgMngItemCd" class="form_input" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.packageNm" /></th><!-- Package명 -->
                            <td>
                                <input type="input" id="sPkgMngItemNm" name="sPkgMngItemNm" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carlineNm" /></th><!-- 차종 -->
                            <td>
                                <input type="input" id="sLtsModelCd" name="sLtsModelCd" style="width:100%" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.brand" /><!-- 브랜드 --></th>
                            <td>
                                <input id="sBrandCd" name="sBrandCd" value="HD" data-type="combo" data-mandatory="true" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th><!-- 공임코드 -->
                            <td>
                                <input type="input" id="sLbrCd" name="sLbrCd" class="form_input" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.rpirNm" /></th><!-- 공임명 -->
                            <td>
                                <input type="input" id="sLbrNm" name="sLbrNm" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.itemCd" /></th><!-- 부품코드 -->
                            <td>
                                <input type="input" id="sItemCd" name="sItemCd" style="width:100%" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></th>
                            <td>
                                <input id="sItemNm" name="sItemNm" type="text" data-type="combo" data-mandatory="true" class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <!-- 그리드1 -->
                <div id="pkgMngGrid" class="grid"></div>
                <!-- 그리드1 -->
            </div>
        </section>
        </form>
        <!-- // 부품 조회 -->

         <!-- 그리드 시작 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.lbl.lbr" /></h2><!-- 정비항목 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12068" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_add btn_s_min5" id="lbrBtnAdd" disabled><spring:message code="global.btn.add" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12067" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_add btn_s_min5" id="lbrBtnDel" disabled><spring:message code="global.btn.rowDel" /></button>
                </dms:access>
            </div>
        </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="ltsGrid"></div>
        </div>

         <!-- 그리드 시작 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.lbl.item" /></h2><!-- 부품항목 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12066" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_add btn_s_min5" id="parBtnAdd" disabled><spring:message code="global.btn.add" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12065" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_add btn_s_min5" id="parBtnDel" disabled><spring:message code="global.btn.rowDel" /></button>
                </dms:access>
            </div>
        </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="parGrid"></div>
        </div>
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->
<!-- content -->

<script type="text/javascript">

//품목구분 Array
var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemDstinCdList}">
    itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//품목구분 Map
var itemDstinCdMap = dms.data.arrayToMap(itemDstinCdList, function(obj){ return obj.cmmCd; });

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
    ltsModelCdList.push({
         cmmCdNm:"${obj.ltsModelNm}"
        ,cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//브랜드
var brandDsList =[];
<c:forEach var="obj" items="${brandCdDs}">
brandDsList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var brandDsMap = dms.data.arrayToMap(brandDsList, function(obj){return obj.cmmCd;});

var laborSearchPopup;
var selectShareStockGiItemPopupWindow;
var partsPackageRegPopupWindow;
var partsPackageRegPopupWindow;
var packageRegPopupWin;

var pkgMngUrl = "<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />";
var pkgRegUrl = "<c:url value='/ser/svi/package/selectPackages.do' />";

var pkgUrl =  "<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />";
var selectTabId = "M";
var gridRow = 0;
var selectedYn = false;

//공통코드:임률정보
var rateList = [];
<c:forEach var ="obj" items="${rateDs}">
  rateList.push({
        rpirTp:"${obj.rpirTp}"
        , rpir01:"${obj.gnlRteRate}"
        , rpir02:"${obj.wartRteRate}"
        , rpir03:"${obj.incRteRate}"
        , rpir04:"${obj.intRteRate}"
        , rpir05:"${obj.rwrkRteRate}"
    });
</c:forEach>


//공통코드:정비유형(수리유형)
var lbrTpCdList  = []; //기본 수리유형
<c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});



$(document).ready(function() {



    // 정비유형(수리유형)
    lbrTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(lbrTpCdArr[val] != undefined)
            returnVal = lbrTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

    // 부품 구분
    itemDstinCdGrid = function(value){
        var returnVal = "";
        if( dms.string.strNvl(value) != ""){
            if(itemDstinCdMap[value] != undefined)
                returnVal =  itemDstinCdMap[value].cmmCdNm;
        }
        return returnVal;
    };


    //LTSMODEL
    setLtsMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(ltsMap[value] != undefined)
                resultVal =  ltsMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //브랜드
    setBrandMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(brandDsMap[value] != undefined)
                resultVal =  brandDsMap[value].cmmCdNm;
        }
        return resultVal;
    };


    //조회조건 - 품목구분선택
    $("#sItemDstinCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:itemDstinCdList
       ,value:"04"
    });

    //조회조건 - LTS MODEL CD
    $("#sLtsModelCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ltsModelCdList
       ,template:"# if(data.cmmCd != '') { # [#:data.cmmCd#] #:data.cmmCdNm# #}#"
       ,valueTemplate:"# if(data.cmmCd != '') { # [#:data.cmmCd#] #:data.cmmCdNm# #}#"
       ,optionLabel:" "
       ,pageSize : 5
    });

    $("#sBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandDsList
        ,optionLabel:" "
        ,index:0
    });

    /** 패키지 등록  팝업 - old **/
    selectPackageRegPopupWindow = function (e){

        packageRegPopupWin = dms.window.popup({
            windowId:"selectPackageRegPopupWindow"
                ,title:"<spring:message code = 'ser.menu.packageMng'/>"    //
                ,height:500
                ,width:650
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectPackageRegPopup.do'/>"
                    , data: {
                         "autoBind":false
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(){
                            packageRegPopupWin.close();
                            $("#btnSearch").click();
                             //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");

                        }
                    }
                }
        });
    };

    /** 패키지 등록  팝업 **/
    function selectPartsPackageRegPopupWindow(){

        partsPackageRegPopupWindow = dms.window.popup({
             windowId:"partsPackageRegPopupWindow"
            ,width:550
            ,height:350
            ,modal:true
            ,title:"<spring:message code='ser.title.packageMng' />"   // 패키지 등록
            ,content:{
                  url:"<c:url value='/par/cmm/selectPartsPackageRegPopup.do'/>"
                ,data:{
                     "type":""
                    ,"autoBind"    :true
                    ,"itemDstinCd" :'04'
                    ,"preFixId"    :"SER"
                    ,"selectable"  :"multiple"
                    ,"pkgTp"       :"01"
                    ,"callbackFunc":function(data){

                        $("#btnSearch").click();
                        partsPackageRegPopupWindow.close();
                    }
                }
            }
        });
    }


    //공임 팝업
    $("#lbrBtnAdd").kendoButton({
        click:function(e){
            if( dms.string.isEmpty($("#ltsModelCd").val())){
                dms.notification.warning("<spring:message code='ser.lbl.ltsModelCd' var='ltsModelCd' /><spring:message code='global.info.check.field' arguments='${ltsModelCd}'/>");
                return;
            }
            if( dms.string.isEmpty($("#pkgItemCd").val() ) ){
                dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
                return;
            }

            laborSearchPopup = dms.window.popup({
            windowId:"lbrSearchPopup"
            ,height:400
            ,title:"<spring:message code='ser.lbl.lbr' />"   // 공임항목
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"selectable":"multiple"
                    //,"sDlrCd":"${dlrCd}"
                    ,"sLtsModelCd":$("#ltsModelCd").val()
                    ,"callbackFunc":function(jsonObj){
                        if(jsonObj.length == 0){
                            return;
                        }else{
                            var grid = $('#ltsGrid').data('kendoExtGrid');
                            var dataItem = grid.dataSource._data;

                            $.each(jsonObj, function(idx, data){
                                var checkVal = true;

                                // 중복값 체크
                                $.each(dataItem, function(idx, obj){
                                    if(data.lbrCd == obj.lbrCd){
                                        checkVal = false;
                                    }
                                });

                                if(checkVal){
                                    var copyData ={
                                              dlrCd    :data.dlrCd
                                            , pkgItemCd:$("#pkgItemCd").val()
                                            , lbrCd    :data.lbrCd
                                            , lbrNm    :data.lbrNm
                                            , lbrQty   :data.lbrQty
                                            , lbrHm    :data.payLbrHm
                                            , lbrPrc   :Number(serviceJs.setRpirRate(rateList, "01", data.lbrTp))
                                            , lbrTp    :data.lbrTp
                                            , lbrAmt   :Number( ( data.lbrQty * data.lbrHm  * data.lbrRate  ).toFixed(2))          // 공임금액
                                            , dstinCd  :data.dstinCd

                                    };

                                    $('#ltsGrid').data('kendoExtGrid').dataSource.insert(copyData);
                                }

                            });

                        }
                    }
                }
            }

          });
        }
    });

    //부품팝업
    $("#parBtnAdd").kendoButton({
        click:function(e){
            if($("#pkgItemCd").val()==""){
                dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
                return;
            }
            selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"selectShareStockGiItemPopupWindow"
            , height:570
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectShareStockGiItemPopup.do'/>"
                , data:{
                    "autoBind":true
                    ,"selectable":"multiple"
                    ,"sPrcTpYn" : "Y"
                    ,"callbackFunc":function(jsonObj){
                        if(jsonObj.length == 0){
                            return;
                        }else{
                             var grid = $('#parGrid').data('kendoExtGrid');
                             var dataItem = grid.dataSource._data;

                            $.each(jsonObj, function(idx, data){

                                var checkVal = true;

                                // 중복값 체크
                                $.each(dataItem, function(idx, obj){
                                    if(data.itemCd == obj.itemCd){
                                        checkVal = false;
                                    }
                                });
                                if(checkVal){

                                    var copyData ={
                                              dlrCd     : data.dlrCd
                                            , pkgItemCd : $("#pkgItemCd").val()
                                            , itemCd    : data.itemCd
                                            , itemNm    : data.itemNm
                                            , itemQty   : data.giQty
                                            , itemUnitCd: data.stockUnitCd
                                            , itemPrc   : data.salePrcAmt
                                            , itemSalePrc   : data.taxDdctGrtePrc
                                            , itemAmt   : Number(  ( ( (data.giQty * data.salePrcAmt ) )  ).toFixed(2) )
                                    };

                                    $('#parGrid').data('kendoExtGrid').dataSource.insert(copyData);
                                }

                            });

                        }
                    }
                }
            }

          });
        }
    });


    //페키지 등록
    $("#packageReg").kendoButton({
        click:function(e) {
            selectPartsPackageRegPopupWindow();
        }
    });

    initAll = function(e){

        $("#pkgItemCd").val("");
        $("#pkgItemNm").val("");
        $("#pkgDocNo").val("");
        $("#ltsModelCd").val("");
        $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
        $("#parGrid").data("kendoExtGrid").dataSource.data([]);
    };

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#packageForm").get(0).reset();
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({

        click:function(e){

            $("#pkgMngGrid").data("kendoExtGrid").dataSource.data([]);
            $("#pkgMngGrid").data("kendoExtGrid").dataSource.page(1);
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);
            $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);

        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({

        click:function(e) {

            var ltsGrid = $("#ltsGrid").data("kendoExtGrid");
            var parGrid = $("#parGrid").data("kendoExtGrid");
            var formSaveData = $("#packageForm").serializeObject($("#packageForm").serializeArrayInSelector("[data-json-obj='true']"));
            var ltsGridData = ltsGrid.getCUDData("insertList", "updateList", "deleteList");
            var parGridData = parGrid.getCUDData("insertList", "updateList", "deleteList");

            if (ltsGrid.cudDataLength == 0 && parGrid.cudDataLength == 0 ) {
                dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                return;
            }

            var params =  $.extend(
                    {"packageMasterVO":formSaveData}
                   ,{"packageLtsVO":ltsGridData}
                   ,{"packageParVO":parGridData}
            );

            if (ltsGrid.gridValidation() && parGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/package/multiPackages.do' />",
                    data:JSON.stringify(params),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result, textStatus) {

                        var grid = $("#pkgMngGrid").data("kendoExtGrid");

                        $("#pkgDocNo").val(result);

                        selectedYn = true;
                        gridRow = grid.select().index();

                        grid.dataSource.data([]);
                        grid.dataSource.page(1);
                        ltsGrid.dataSource.data([]);
                        parGrid.dataSource.data([]);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
        ,enable: false
    });

    /** 취소 버튼**/
    $("#btnDel").kendoButton({

        click:function(e){

            $("#messageId").html("<spring:message code='global.btn.del' var='delete' />"+
                                 "<spring:message code='global.info.cnfrmMsg' arguments='${delete}' />" );
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){

                if($(this).hasClass("yes")){
                    conformKendoWindow.close();


                    var pkgMngGrid = $("#pkgMngGrid").data("kendoExtGrid");
                    var selectedVal = pkgMngGrid.dataItem(pkgMngGrid.select());

                    if(selectedVal == null){
                        dms.notification.warning("<spring:message code='global.info.selectEmptyRowMsg'/>");
                        return false;
                    }

                    var params = {
                            "ltsModelCd" : selectedVal.ltsModelCd
                           ,"pkgDocNo"   : selectedVal.pkgDocNo
                           ,"pkgItemCd"  : selectedVal.pkgItemCd
                    };

                    $.ajax({
                        url:"<c:url value='/ser/svi/package/deletePackages.do' />",
                        data:JSON.stringify(params),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(result, textStatus) {

                            var pkgMngGrid = $("#pkgMngGrid").data("kendoExtGrid");
                            var ltsGrid = $("#ltsGrid").data("kendoExtGrid");
                            var parGrid = $("#parGrid").data("kendoExtGrid");
                            selectedYn = false;

                            pkgMngGrid.dataSource.data([]);
                            pkgMngGrid.dataSource.page(1);
                            ltsGrid.dataSource.data([]);
                            parGrid.dataSource.data([]);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                    });

                }else{
                    conformKendoWindow.close();
                }
            }).end();
        }
        ,enable: false

    });

    //취소
    $("#lbrBtnCancel").kendoButton({
      click:function(e) {
          $('#ltsGrid').data('kendoExtGrid').cancelChanges();
      }
    });

    //취소
    $("#parBtnCancel").kendoButton({
      click:function(e) {
          $('#parGrid').data('kendoExtGrid').cancelChanges();
      }
    });

    /** 공임삭제  **/
    $("#lbrBtnDel").kendoButton({

        click:function (e){

          var grid = $("#ltsGrid").data("kendoExtGrid");
          var rows = grid.select();

          rows.each(function(index, row) {
              grid.removeRow(row);
          });

        }
    });

    /** 부품삭제  **/
    $("#parBtnDel").kendoButton({

        click:function (e){

            var grid = $("#parGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });


    /** 공임 계산**/
    calLaborAmt = function(e){
        // 공임 금액:수량 * 시간당 금액 * 단가
        var grid = $("#ltsGrid").data("kendoExtGrid");
        var gridData = grid.dataSource._data;

        var selectedVal = grid.dataItem(grid.select());

        var lbrQty = Number(selectedVal.lbrQty);
        var lbrHm  = Number(selectedVal.lbrHm);
        var lbrPrc = Number(selectedVal.lbrPrc);

        var lbrAmt = Number((lbrQty * lbrHm * lbrPrc ).toFixed(2));

        selectedVal.set("lbrAmt",lbrAmt);

    };

    /** 부품 계산**/
    calPartAmt = function(e){

        var grid = $("#parGrid").data("kendoExtGrid");
        var gridData = grid.dataSource._data;

        var selectedVal = grid.dataItem(grid.select());

        // ROUND ( ROUND ( 부품단가 * MARK UP * 수량  , 2) * TAX , 2)

        var itemQty  = Number(selectedVal.itemQty); //수량
        var itemPrc = Number(selectedVal.itemPrc); //단가
        var itemAmt = Number( ( itemPrc * itemQty ).toFixed(2)  );

        selectedVal.set("itemAmt",itemAmt);

    };

      //버튼설정
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "Y" :
                $("#lbrBtnAdd").data("kendoButton").enable(true);
                $("#lbrBtnDel").data("kendoButton").enable(true);
                $("#parBtnAdd").data("kendoButton").enable(true);
                $("#parBtnDel").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnDel").data("kendoButton").enable(true);

                break;
            case "N" :
                $("#lbrBtnAdd").data("kendoButton").enable(false);
                $("#lbrBtnDel").data("kendoButton").enable(false);
                $("#parBtnAdd").data("kendoButton").enable(false);
                $("#parBtnDel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);

                break;
            default :

                $("#lbrBtnAdd").data("kendoButton").enable(false);
                $("#lbrBtnDel").data("kendoButton").enable(false);
                $("#parBtnAdd").data("kendoButton").enable(false);
                $("#parBtnDel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);

                break;
        }
    };


    $("#pkgMngGrid").kendoExtGrid({
        gridId:"G-SER-1011-000126"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackageParSummary.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 품목구분코드.
                        params["sLtsModelCd"] = $("#sLtsModelCd").val();
                        params["sPkgItemCd"] = $("#sPkgMngItemCd").val();
                        params["sPkgItemNm"] = $("#sPkgMngItemNm").val();
                        params["sLbrCd"] = $("#sLbrCd").val();
                        params["sLbrNm"] = $("#sLbrNm").val();
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sBrandCd"] = $("#sBrandCd").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();
                        params["sPkgTp"] = "01";

                        return kendo.stringify(params);
                    }
                }
            }
            ,serverPaging:true
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum:{ type:"int"  }
                       ,dlrCd :{ type:"string" , validation:{required:true} }
                       ,pkgDocNo:{ type:"int"  }
                       ,ltsModelCd:{ type:"string"  }
                       ,itemDstinCd:{ type:"string" , validation:{required:true} }
                       ,pkgItemCd:{ type:"string" , validation:{required:true} }
                       ,pkgItemNm:{ type:"string" , validation:{required:true} }
                       ,pkgStartDt:{ type:"date"  }
                       ,pkgEndDt:{ type:"date"  }
                    }
                }
            }
          }
        ,editable:false
        ,autoBind:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,dataBound: function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }
        }
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            if( selectedItem != null && selectedItem != 'undefined'){

                initAll();

                $("#pkgItemCd").val(selectedItem.pkgItemCd);
                $("#pkgItemNm").val(selectedItem.pkgItemNm);
                $("#pkgDocNo").val(selectedItem.pkgDocNo);
                $("#ltsModelCd").val(selectedItem.ltsModelCd);

                var params = {
                        "sPkgItemCd":$("#pkgItemCd").val()
                       ,"sPkgDocNo":$("#pkgDocNo").val()
                       ,"sLtsModelCd":$("#ltsModelCd").val()
                };

                 $.ajax({
                     url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                    ,data:JSON.stringify(params)
                    ,type:"POST"
                    ,dataType:"json"
                    ,contentType:"application/json"
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                }).done(function(result) {

                    $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#parGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#ltsGrid").data("kendoExtGrid").dataSource.read();
                    $("#parGrid").data("kendoExtGrid").dataSource.read();

                    setButtonEnable("Y");

                });
            }
         }
        ,pageable:true
        ,scrollable:true
        ,sortable:false
        ,resizable:true
        ,height:170
        ,columns:[
             {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"},hidden:true}
            ,{field:"pkgItemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:150, attributes:{"class":"al"}}                //페키지 코드
            ,{field:"pkgItemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:300, attributes:{"class":"al"}}                //페키지 명
            ,{field:"brandCd",   title:"<spring:message code='ser.lbl.brand' />", width:100, sortable:false, attributes:{"class":"ac"}
                ,template :"#= setBrandMap(brandCd) #"
            }       //차량브랜드
            ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:250, attributes:{"class":"al"}
                ,template :"[#:ltsModelCd#]#= setLtsMap(ltsModelCd) #"
             } //차량모델
            ,{field:"pkgStartDt", title:"<spring:message code='par.lbl.startDttm' />", width:120
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             } //시작일시
            ,{field:"pkgEndDt", title:"<spring:message code='par.lbl.endDttm' />", width:120
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             } //종료일시
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.pkgLbrAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}" ,hidden:true}
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.pkgPartAmt' />", width:100, attributes:{"class":"ar"},format:"{0:n2}" ,hidden:true}
            ,{field:"totAmt", title:"<spring:message code='ser.lbl.pkgTotAmt' />", width:120, attributes:{"class":"ar"} ,format:"{0:n2}" ,hidden:true}
        ]
    });

    //공임 설정
    $("#ltsGrid").kendoExtGrid({
        gridId:"G-SER-1011-000127"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackageLtss.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPkgItemCd"] = $("#pkgItemCd").val();
                        params["sPkgDocNo"] = $("#pkgDocNo").val();
                        params["sLtsModelCd"] = $("#ltsModelCd").val();
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum :{ type:"number" }
                       ,dlrCd :{ type:"string" }
                       ,pkgItemCd:{ type:"string"}
                       ,pkgDocNo:{ type:"int"}
                       ,lineNo:{ type:"string"}
                       ,lbrCd:{ type:"string",editable:false}
                       ,lbrNm:{ type:"string",editable:false}
                       ,lbrTp:{ type:"string",editable:false}
                       ,lbrQty:{ type:"number" }
                       ,lbrHm:{ type:"number"}
                       ,lbrPrc:{ type:"number",editable:false}
                       ,lbrRate:{ type:"number",editable:false}
                       ,lbrAmt:{ type:"number",editable:false}
                    }
                }
            }
          }
        ,pageable:false
        ,height:100
        ,autoBind:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,selectable:"row"
        ,edit:function(e){
             var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="lbrAmt"){
                 this.closeCell();
             }
         }
        ,columns:[
             {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:150,attributes:{"class":"al"}}//공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:300,attributes:{"class":"al"}}//공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:150, attributes:{"class":"ac"}
                 ,template:"#=lbrTpCdGrid(lbrTp)#"
            }//공임유형
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:120, attributes:{"class":"ar"}
                  ,sortable:false
                  ,format:"{0:n2}"
                  ,editor:function(container, options){
                        $('<input required name="lbrHm" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"{0:n2}"                // n0:###,###, n2:###,###.##
                           ,decimals:2                // 소숫점
                           ,min:0.00
                           ,spinners:false
                           ,change:calLaborAmt
                    });
                    $('<span class="k-invalid-msg" data-for="lbrHm"></span>').appendTo(container);
                 }
            }//수리시간
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:120, attributes:{"class":"ar"}
                    , format:"{0:n2}"
                    , editor:function(container, options){
                        $('<input required name="lbrPrc" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n2"                // n0:###,###, n2:###,###.##
                           ,decimals:0.00                // 소숫점
                           ,min:0.00
                           ,spinners:false
                           ,change:calLaborAmt
                    });
                    $('<span class="k-invalid-msg" data-for="lbrPrc"></span>').appendTo(container);
                 }
                 ,hidden:true
            }//단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", attributes:{"class":"ar"}, width:120,format:"{0:n2}",hidden:true}//금액
            ,{field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"},hidden:true}
            ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:120, attributes :{"class":"ar"}
                   ,format:"{0:n0}"
                   , editor:function(container, options){
                        $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"                // n0:###,###, n2:###,###.##
                           ,decimals:0                // 소숫점
                           ,min:1
                           ,value:0
                           ,spinners:false
                           ,change:calLaborAmt
                    });
                    $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
                 },hidden:true
            }//수량
            ,{field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"},hidden:true}
            ,{field:"dstinCd" ,hidden : true}
        ]

    });


    //부품 설정
    $("#parGrid").kendoExtGrid({
        gridId:"G-SER-1011-000128"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPkgItemCd"] = $("#pkgItemCd").val();
                        params["sPkgDocNo"] = $("#pkgDocNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum :{ type:"number" }
                       ,dlrCd :{ type:"string" }
                       ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                       ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                       ,pkgDocNo:{ type:"int"}
                       ,pkgItemCd:{ type:"string"}
                       ,lineNo:{ type:"string",editable:false}
                       ,itemQty:{ type:"number" }
                       ,itemUnitCd:{ type:"string",editable:false}
                       ,itemPrc:{ type:"number",editable:false}
                       ,itemSalePrc:{ type:"number",editable:false}
                       ,itemAmt:{ type:"number",editable:true}
                    }
                }
            }
          }
        ,height:100
        ,pageable:false
        ,autoBind:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,selectable:"row"
        ,edit:function(e){
             var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt"){
                 this.closeCell();
             }
         }
        ,columns:[
             {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150 ,attributes:{"class":"al"} }//부품번호
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300 ,attributes:{"class":"al"} }//부품명
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:150, attributes:{"class":"ac"}, sortable:false}//수량단위
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:120, attributes:{"class":"ar"}
                , sortable:false
                , format:"{0:n0}"
                , editor:function(container, options){
                        $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"                // n0:###,###, n2:###,###.##
                           ,decimals:0                // 소숫점
                           ,min:1
                           ,value:0
                           ,spinners:false
                           ,change:calPartAmt
                    });
                    $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                 }

            }//수량
            ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:120,attributes:{"class":"ar"} ,format:"{0:n2}",hidden:true}//부품단가
            ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", attributes:{"class":"ar"}, width:120,format:"{0:n2}",hidden:true}//금액
            ,{field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"},hidden:true}
            ,{field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"}, hidden : true}
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:120,attributes:{"class":"ar"} ,format:"{0:n2}",hidden:true}//부품기본단가
        ]

    });
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

</script>

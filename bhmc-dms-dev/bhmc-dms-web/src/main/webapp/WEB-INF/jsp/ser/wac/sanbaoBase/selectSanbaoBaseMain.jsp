<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 현황 -->
 <div id="resizableContainer">
    <div class="content">
        <div id="kendoSanbaoBaseForm">
             <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="ser.lbl.stdPolicy" /></h1> <!-- 기준정책 -->
                    <div class="btn_right">
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                        <button type="button" id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button>
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
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.appyStd" /></th> <!-- 적용기준 -->
                                <td>
                                    <input type="text" id="sApplyDstinCd" name="sApplyDstinCd" class="form_comboBox" style="width:200px;" />
                                </td>
                               <th scope="row"></th>
                                <td></td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_add btn_s_min5" id="btnApyAdd" ><spring:message code="global.btn.rowAdd" /></button>
                        <button type="button" class="btn_s btn_delete btn_s_min5" id="btnApyDel"><spring:message code="global.btn.rowDel" /></button>
                        <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnApyCan" ><spring:message code="global.btn.cancel" /></button>

                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridBase" class="grid"></div>
                </div>
            </section>
            <!-- //현황 -->
            <div class="clfix">
                <section class="left_areaStyle">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="ser.lbl.roStartTime" /></h2> <!-- RO작업시간 -->
                        <div class="btn_right">
                            <button type="button" class="btn_s btn_add btn_s_min5" id="btnRoWkAdd" ><spring:message code="global.btn.rowAdd" /></button>
                            <button type="button" class="btn_s btn_delete btn_s_min5" id="btnRoWkDel"><spring:message code="global.btn.rowDel" /></button>
                            <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnRoWkCan" ><spring:message code="global.btn.cancel" /></button>
                        </div>
                    </div>
                    <div class="table_grid">
                      <div id="gridRoBase" class="grid"></div>
                    </div>
                </section>
                <section class="right_areaStyle">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="ser.lbl.depreRate" /></h2><!-- 감가상각률 -->
                        <div class="btn_right">
                            <button type="button" class="btn_s btn_add btn_s_min5" id="btnRateAdd" ><spring:message code="global.btn.rowAdd" /></button>
                            <button type="button" class="btn_s btn_delete btn_s_min5" id="btnRateDel"><spring:message code="global.btn.rowDel" /></button>
                            <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnRateCan" ><spring:message code="global.btn.cancel" /></button>
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="gridRate" class="grid"></div>
                    </div>
                </section>
            </div>
            <section class="group">
                <div class="table_form form_width_40per mt10" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:40%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.itemAtc" /> </th><!-- 분류항목 -->
                                <td>
                                    <input type="text" id="sItemAtcCd" name="sItemAtcCd" class="form_comboBox" style="width:200px;"/>
                                    <button type="button" class="btn_s btn_search btn_s_min5" id="btnAtcSearch"><spring:message code="global.btn.search" /></button>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.itemGrp" /></th><!-- 부품그룹 -->
                                <td>
                                    <input type="text" id="sItemGrpCd" name="sItemGrpCd" class="form_input" style="width:100px;" role="search" data-btnid="btnItemGrpSearch" />
                                    <button type="button" class="btn_s btn_search btn_s_min5" id="btnItemGrpSearch"><spring:message code="ser.btn.unregItemGrp" /> </button> <!-- 미등록부품그룹 -->
                                    <button type="button" class="btn_s btn_save btn_s_min5" id="btnItemGrpSave"><spring:message code="global.btn.save" /></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="gridPart" class="resizable_grid"></div>
                </div>
            </section>
            <input type="hidden" id="itemGrpTp" name="itemGrpTp" class="form_comboBox" style="width:200px;"/>
        </div>
    </div>
</div>
<!-- script -->
<script type="text/javascript">

var itemAtcUrl = "<c:url value='/ser/wac/sanbaoBase/selectSanbaoBasePartGrps.do' />";
var itemAtcSaveUrl = "<c:url value='/ser/wac/sanbaoBase/updateSabaoBaseItemsGrps.do' />";
var itemGrpUrl = "<c:url value='/ser/wac/sanbaoBase/selectSanbaoBaseUnregItemGrps.do' />";
var itemGrpSaveUrl = "<c:url value='/ser/wac/sanbaoBase/insertSabaoBaseItemsGrps.do' />";

var applyDstinList = [];
var applyDstinList2 = [];
var applyDstinList3 = [];
var applyDstinList4 = [];
//적용기준
<c:forEach var="obj" items="${applyDstinDs}">
    <c:if test='${obj.useYn eq "Y"}'>
        applyDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "A"}'>
        applyDstinList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "B"}'>
        applyDstinList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "C"}'>
        applyDstinList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

var applyDstinMap = dms.data.arrayToMap(applyDstinList, function(obj){return obj.cmmCd;});

//부품 분류항복
var itemGrpList = [];
<c:forEach var="obj" items="${itemGrpDs}">
itemGrpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemGrpMap = dms.data.arrayToMap(itemGrpList, function(obj){return obj.cmmCd;});


$(document).ready(function() {

    //var validator = $("#kendoSanbaoBaseForm").kendoExtValidator().data("kendoExtValidator");
    //적용기준
    setApplyNm = function(value){
        var strNm = "";
        if( dms.string.strNvl(value) != ""){
            if(applyDstinMap[value] != undefined)
                strNm =  applyDstinMap[value].cmmCdNm;
        }
        return strNm;
    };

    //부품 분류항목
    setItemGrpNm = function(value){

        var strNm = "";
        if( dms.string.strNvl(value) != ""){
            if(itemGrpMap[value] != undefined)
                strNm =  itemGrpMap[value].cmmCdNm;
        }
        return strNm;
    };

    /********************** 초기 데이터  설정 ***************************/
    /**적용기준 **/
    $("#sApplyDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:applyDstinList2
       ,optionLabel:" "  // 선택
       ,index:0
   });

    $("#sItemAtcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:itemGrpList
       ,optionLabel:" "  // 선택
       ,index:0
   });

    /********************** 초기 데이터  설정 ***************************/


    /********************** 버튼  설정 ***************************/

    /** 조회 버튼**/
    $("#btnSearch").kendoButton({
        click:function (e){
            getSearchGrid();
        }
    });

    /** 저장 버튼**/
    $("#btnSave").kendoButton({
        click:function (e){
            requestSaveData();

        }
    });

    /** 분류항목 조회 버튼**/
    $("#btnAtcSearch").kendoButton({
        click:function (e){
            var grid = $("#gridPart").data("kendoExtGrid").dataSource;
            grid.transport.options.read.url = itemAtcUrl;
            grid.read();
            $("#itemGrpTp").val("U");
        }
    });

    /** 미등록부품 조회 버튼**/
    $("#btnItemGrpSearch").kendoButton({
        click:function (e){
            var grid = $("#gridPart").data("kendoExtGrid").dataSource;
            grid.transport.options.read.url = itemGrpUrl;
            grid.read();
            $("#itemGrpTp").val("I");
        }
    });

    /** 미등록부품 저장 버튼**/
    $("#btnItemGrpSave").kendoButton({
        click:function (e){
            requestItemSaveData();
        }
    });

    /** 적용기준 행추가 버튼**/
    $("#btnApyAdd").kendoButton({
        click:function (e){
            var grid = $("#gridBase").data("kendoExtGrid").dataSource;
            var applyDstinCd = $("#sApplyDstinCd").data("kendoExtDropDownList").value();
            grid.insert(0,{
                 "applyDstinCd":(applyDstinCd == "")? "02":applyDstinList2
                ,"applyPrid":""
                ,"runDistVal":0
                ,"alrtStartTermVal":0
                ,"tcavTermVal":0
                ,"wartApplyStartDt":""
                ,"wartApplyEndDt":""
            });
        }

    });

    /** 적용기준 행삭제 버튼 **/
    $("#btnApyDel").kendoButton({
        click:function (e){
            var grid = $("#gridBase").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }

    });

    /**적용기준 행취소 버튼 **/
    $("#btnApyCan").kendoButton({
        click:function(e) {
            $('#gridBase').data('kendoExtGrid').cancelChanges();

        }
    });

    /** RO작업시간 행추가 버튼**/
    $("#btnRoWkAdd").kendoButton({

        click:function (e){
            var grid = $("#gridRoBase").data("kendoExtGrid").dataSource;
            grid.insert(0,{
                 "applyDstinCd":"06"
                ,"applyPrid":""
                ,"wartApplyStartDt":""
                ,"wartApplyEndDt":""
            });
        }

    });

    /** RO작업시간 행삭제 버튼 **/
    $("#btnRoWkDel").kendoButton({
        click:function (e){
            var grid = $("#gridRoBase").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }

    });

    /**RO작업시간 행취소 버튼 **/
    $("#btnRoWkCan").kendoButton({
        click:function(e) {
            $('#gridRoBase').data('kendoExtGrid').cancelChanges();

        }
    });

    /** 감가상각률 행추가 버튼**/
    $("#btnRateAdd").kendoButton({

        click:function (e){
            var grid = $("#gridRate").data("kendoExtGrid").dataSource;
            grid.insert(0,{
                 "applyDstinCd":"05"
                ,"applyPrid":"1"
                ,"wartApplyStartDt":""
                ,"wartApplyEndDt":""
            });
        }

    });

    /** 감가상각률 행삭제 버튼 **/
    $("#btnRateDel").kendoButton({
        click:function (e){
            var grid = $("#gridRate").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }

    });

    /**감가상각률 행취소 버튼 **/
    $("#btnRateCan").kendoButton({
        click:function(e) {
            $('#gridRate').data('kendoExtGrid').cancelChanges();

        }
    });

    /********************** 버튼  설정 ***************************/

    getSearchGrid = function(e){

        var gridBase = $("#gridBase").data("kendoExtGrid");
        var gridRoBase = $("#gridRoBase").data("kendoExtGrid");
        var gridRate = $("#gridRate").data("kendoExtGrid");

        gridBase.refresh();
        gridRoBase.refresh();
        gridRate.refresh();

        $("#gridBase").data("kendoExtGrid").dataSource.data([]);
        $("#gridRoBase").data("kendoExtGrid").dataSource.data([]);
        $("#gridRate").data("kendoExtGrid").dataSource.data([]);

        $("#gridBase").data("kendoExtGrid").dataSource._destroyed = [];
        $("#gridRoBase").data("kendoExtGrid").dataSource._destroyed = [];
        $("#gridRate").data("kendoExtGrid").dataSource._destroyed = [];

        $("#gridBase").data("kendoExtGrid").dataSource.read();
        $("#gridRoBase").data("kendoExtGrid").dataSource.read();
        $("#gridRate").data("kendoExtGrid").dataSource.read();

    };

    // Data 전송
    requestSaveData = function(e){

      /*  if(!setDataValidation()){
           return;
       }  */

       var gridBase = $("#gridBase").data("kendoExtGrid");
       var gridRoBase = $("#gridRoBase").data("kendoExtGrid");
       var gridRate = $("#gridRate").data("kendoExtGrid");

       if( setDataValidation(gridBase) ||
           setDataValidation(gridRoBase)||
           setDataValidation(gridRate)
        ){
           return;
       }

       var gridBaseData = gridBase.getCUDData("insertList", "updateList", "deleteList");
       var gridRoBaseData = gridRoBase.getCUDData("insertList", "updateList", "deleteList");
       var gridRateData = gridRate.getCUDData("insertList", "updateList", "deleteList");

       if (gridBase.cudDataLength == 0 && gridRoBase.cudDataLength == 0 && gridRate.cudDataLength == 0) {
           dms.notification.info("<spring:message code = 'global.info.required.change'/>");
           return;
       }

       var params =  $.extend(
                {"gridBaseVO":gridBaseData}
               ,{"gridRoBaseVO":gridRoBaseData}
               ,{"gridRateVO":gridRateData}
        );



       $.ajax({
           url:"<c:url value='/ser/wac/sanbaoBase/multiSabaoBases.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,cache:false
          ,error:function(jqXHR,status,error) {
              dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
          }
          ,success:function(result , textStatus){
              getSearchGrid();
              dms.notification.success("<spring:message code='ser.lbl.stdPolicy' var='stdPolicy' /><spring:message code='global.info.updateSuccessParam' arguments='${stdPolicy}' />");
          }
          ,beforeSend:function(xhr){
              dms.loading.show($("#resizableContainer"));
          }
          ,complete:function(xhr,status){
              dms.loading.hide($("#resizableContainer"));
          }
       });

    };


    // Data 전송
    requestItemSaveData = function(e){


       var gridPart = $("#gridPart").data("kendoExtGrid");
       var gridPartVO = gridPart.getCUDData("insertList", "updateList", "deleteList");

       if (gridPart.cudDataLength == 0) {
           dms.notification.info("<spring:message code = 'global.info.required.change'/>");
           return;
       }
       if(setPartDataValidation()){
           return;
       }

       $.ajax({
           url:($("#itemGrpTp").val() == "I" ) ? itemGrpSaveUrl:itemAtcSaveUrl
          ,data:JSON.stringify({"gridPartVO":gridPartVO})
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,cache:false
          ,error:function(jqXHR,status,error) {
              dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
          }
          ,success:function(result , textStatus){

              var grid = $("#gridPart").data("kendoExtGrid").dataSource;
              grid.transport.options.read.url = ($("itemGrpTp").val() == "I" ) ? itemGrpUrl:itemAtcUrl;
              grid.read();
             // setButtonEnable($("#statCd").val());
              dms.notification.success("<spring:message code='ser.lbl.itemGrp' var='itemGrp' /><spring:message code='global.info.updateSuccessParam' arguments='${itemGrp}' />");
          }
          ,beforeSend:function(xhr){
              dms.loading.show($("#resizableContainer"));
          }
          ,complete:function(xhr,status){
              dms.loading.hide($("#resizableContainer"));
          }
       });

    };



  //기준정책 보증수리일자 중복체크
    gridBaseDupCheckDate = function(e){

        var grid = $("#gridBase").data("kendoExtGrid");
        var selectId = e.sender.element[0].id;
      //  var selectId = grid.columns[grid._current[0].cellIndex].field;
        getCheckDupDate(grid);
    };
  //RO 작업시간 보증수리일자 중복체크
    gridRoBaseDupCheckDate = function(e){

        var grid = $("#gridRoBase").data("kendoExtGrid");
        getCheckDupDate(grid);
    };

  //감가상각률 보증수리일자 중복체크
    gridRateDupCheckDate = function(e){
        var grid = $("#gridRate").data("kendoExtGrid");
        getCheckDupDate(grid);
    };


    getCheckDupDate = function(grid){

       // var grid = $("#"+grid).data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var applyDstinCd = selectedVal.applyDstinCd;
        var wartApplyStartDt = kendo.toString(kendo.parseDate(selectedVal.wartApplyStartDt), "yyyy-MM-dd") ;
        var wartApplyEndDt = kendo.toString(kendo.parseDate(selectedVal.wartApplyEndDt), "yyyy-MM-dd") ;
        var rowIndex = grid.select()[0].rowIndex;


        if(wartApplyStartDt == null && wartApplyEndDt !=null){
            dms.notification.info( "<spring:message code='ser.lbl.wartStartDt' var='wartStartDt' />"+
                                   "<spring:message code='global.info.fromDate.input' arguments='${wartStartDt}' />");
            selectedVal.set("wartApplyEndDt","");
            return;

        }
        if(wartApplyStartDt > wartApplyEndDt){
            dms.notification.info( "<spring:message code='ser.lbl.wartStartDt' var='wartStartDt' />"+
                     "<spring:message code='ser.lbl.wartEndDt' var='wartEndDt' />"+
                     "<spring:message code='global.info.validation.min' arguments='${wartEndDt},${wartStartDt}' />");
            selectedVal.set("wartApplyEndDt","");
            return;

        }

        //그리드 적용기준별 보증수리일자 중복 체크
         $.each(grid.dataSource._data , function(i , data){
            var wartStartDt = kendo.toString(kendo.parseDate(data.wartApplyStartDt), "yyyy-MM-dd") ;
            var wartEndDt = kendo.toString(kendo.parseDate(data.wartApplyEndDt), "yyyy-MM-dd") ;
            if( (applyDstinCd == data.applyDstinCd ) && (rowIndex != i)){
                if( (wartApplyStartDt >= wartStartDt ) && (wartEndDt >= wartApplyStartDt) ){
                        dms.notification.info( "<spring:message code='ser.lbl.wartStartDt' var='wartStartDt' />"+
                                               "<spring:message code='global.info.duplicateCheck' arguments='${wartStartDt}' />");
                        selectedVal.set("wartApplyStartDt","");
                        return;
                }
                if((wartEndDt >= wartApplyEndDt ) && (wartApplyEndDt >= wartStartDt)){
                        dms.notification.info( "<spring:message code='ser.lbl.wartEndDt' var='wartEndDt' />"+
                                               "<spring:message code='global.info.duplicateCheck' arguments='${wartEndDt}' />");
                        selectedVal.set("wartApplyEndDt","");
                    return;
                }

            }
        });
    };

    setDataValidation = function(grid){

        //그리드 체크
        var result = false;
        var msgTxt ="";
        $.each(grid.dataSource._data , function(i , data){
           if( dms.string.isEmpty(data.applyDstinCd ) ){
               msgTxt = "<spring:message code='ser.lbl.appyStd' var='appyStd' />"+
                                      "<spring:message code='global.info.required.field' arguments='${appyStd}' />";
               result = true;
           }else if( dms.string.isEmpty(data.applyPrid ) ){
               msgTxt =  "<spring:message code='ser.lbl.applyPrid' var='applyPrid' />"+
                                      "<spring:message code='global.info.required.field' arguments='${applyPrid}' />";
               result = true;
           }else if( dms.string.isEmpty(data.wartApplyStartDt ) ){
               msgTxt =  "<spring:message code='ser.lbl.wartStartDt' var='wartStartDt' />"+
                                      "<spring:message code='global.info.required.field' arguments='${wartStartDt}' />";
               result = true;
           }else if(dms.string.isEmpty(data.wartApplyEndDt)){
               msgTxt =  "<spring:message code='ser.lbl.wartEndDt' var='wartEndDt' />"+
                                      "<spring:message code='global.info.required.field' arguments='${wartEndDt}' />";
               result = true;
           }

           if(data.applyDstinCd < "05"){
               /* if( dms.string.strNvl(data.runDistVal ) < 1 ){
                   msgTxt =  "<spring:message code='ser.lbl.nowRunDist' var='drivDis' />"+
                                          "<spring:message code='global.info.required.field' arguments='${drivDis}' />";
                   result = true;
               }else
              if( dms.string.strNvl(data.alrtStartTermVal )< 1 ){
                   msgTxt =  "<spring:message code='ser.lbl.alrTerm' var='alrTerm' />"+
                                          "<spring:message code='global.info.required.field' arguments='${alrTerm}' />";
                   result = true;
               }else if( dms.string.strNvl(data.tcavTermVal ) < 1){
                   msgTxt =  "<spring:message code='ser.lbl.tcavTerm' var='tcavTerm' />"+
                                          "<spring:message code='global.info.required.field' arguments='${wartStartDt}' />";
                   result = true;
               }
               */
           }


       });
        if(result)dms.notification.info(msgTxt);
        return result;

    };

    setPartDataValidation = function(grid){

        //그리드 체크
        var result = false;
        var msgTxt ="";
        var grid = $("#gridPart").data("kendoExtGrid");

        $.each(grid.dataSource._data , function(i , data){
            if(data.dirty){
               if( dms.string.isEmpty(data.itemGrpCd) ){
                   msgTxt = "<spring:message code='ser.lbl.itemGrp' var='itemGrp' />"+
                                          "<spring:message code='global.info.required.field' arguments='${itemGrp}' />";
                   result = true;
               }else if( dms.string.isEmpty(data.itemGrpNm ) ){
                   msgTxt =  "<spring:message code='ser.lbl.itemGrpNm' var='itemGrpNm' />"+
                                          "<spring:message code='global.info.required.field' arguments='${itemGrpNm}' />";
                   result = true;
               }else if( dms.string.strNvl(data.itemAtcCd ) < 1 ){
                   msgTxt =  "<spring:message code='ser.lbl.itemAtc' var='itemAtc' />"+
                                          "<spring:message code='global.info.required.field' arguments='${itemAtc}' />";
                   result = true;
               }else if( dms.string.strNvl(data.sameFauExchTermVal )< 1 ){
                   msgTxt =  "<spring:message code='ser.lbl.sameFauExchTermVal' var='sameFauExchTermVal' />"+
                                          "<spring:message code='global.info.required.field' arguments='${sameFauExchTermVal}' />";
                   result = true;
               }else if( dms.string.strNvl(data.alrtStartTermVal ) < 1){
                   msgTxt =  "<spring:message code='ser.lbl.alrTerm' var='alrTerm' />"+
                                          "<spring:message code='global.info.required.field' arguments='${alrTerm}' />";
                   result = true;
               }else if( dms.string.strNvl(data.tcavTermVal ) < 1){
                   msgTxt =  "<spring:message code='ser.lbl.tcavTerm' var='tcavTerm' />"+
                                          "<spring:message code='global.info.required.field' arguments='${tcavTerm}' />";
                   result = true;
               }else if( dms.string.isEmpty(data.applyStartDt ) ){
                   msgTxt =  "<spring:message code='ser.lbl.applyStartDt' var='applyStartDt' />"+
                                          "<spring:message code='global.info.required.field' arguments='${applyStartDt}' />";
                   result = true;
               }else if(dms.string.isEmpty(data.applyEndDt)){
                   msgTxt =  "<spring:message code='ser.lbl.applyEndDt' var='applyEndDt' />"+
                                          "<spring:message code='global.info.required.field' arguments='${applyEndDt}' />";
                   result = true;
               }
            }


       });
        if(result)dms.notification.info(msgTxt);
        return result;

    };


    /** 적용기준 **/
    $("#gridBase").kendoExtGrid({
        gridId:"G-SER-1011-000174"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoBase/selectSanbaoBaseMains.do' />"
                   }
                 ,create:{
                      cache:false
                 }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sApplyDstinCd"] = $("#sApplyDstinCd").data("kendoExtDropDownList").value();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,applyDstinCd:{type:"string",   validation:{required:true} }
                       ,applyPrid:{type:"number" , validation:{required:true} }
                       ,runDistVal:{type:"number" , validation:{required:true} }
                       ,alrtStartTermVal:{type:"number"  , validation:{required:true}}
                       ,tcavTermVal:{type:"number" , validation:{required:true} }
                       ,wartApplyStartDt:{type:"date" }
                       ,wartApplyEndDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:120
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[0]).attr("name");
            if(!e.model.isNew()){
                if(fieldName=="baseDstinCd"){
                    this.closeCell();
                }
            }
         }
        ,columns:[
                {field:"applyDstinCd", title:"<spring:message code='ser.lbl.appyStd' />", width:70
                    ,attributes :{"class":"al"}
                    ,template:"#=setApplyNm(applyDstinCd)#"
                    ,editor:function(container, options){
                        $('<input required name="baseDstinCd" id="baseDstinCd" data-name="<spring:message code="ser.lbl.appyStd" />" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:applyDstinList2
                        });
                        $('<span class="k-invalid-msg" data-for="baseDstinCd"></span>').appendTo(container);
                       }

                }
               ,{field:"applyPrid", title:"<spring:message code='ser.lbl.applyPrid' />", width:70
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="basePrid" id="basePrid" maxLength=3 data-name="<spring:message code="ser.lbl.applyPrid" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:0
                          ,max:9999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="basePrid"></span>').appendTo(container);
                    }

               }
               ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:80
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="baseRunDist" id="baseRunDist" maxLength="7" data-name="<spring:message code="ser.lbl.nowRunDist" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:0
                          ,max:9999999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="baseRunDist"></span>').appendTo(container);
                    }
               }
               ,{field:"alrtStartTermVal", title:"<spring:message code='ser.lbl.alrTerm' />", width:50
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="baseAlrtStartTerm" id="baseAlrtStartTerm" maxLength=3 data-name="<spring:message code="ser.lbl.alrTerm" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:0
                          ,max:999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="baseAlrtStartTerm"></span>').appendTo(container);
                    }

               }
               ,{field:"tcavTermVal", title:"<spring:message code='ser.lbl.tcavTerm' />", width:50
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="baseTcavTerm" id="baseTcavTerm" maxLength=3 data-name="<spring:message code="ser.lbl.tcavTerm" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:0
                          ,max:999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="baseTcavTerm"></span>').appendTo(container);
                    }
               }
               ,{field:"wartApplyStartDt", title:"<spring:message code='ser.lbl.wartStartDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="applyWartStartDt" name="applyWartStartDt" data-name="<spring:message code="ser.lbl.wartStartDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                           ,change:gridBaseDupCheckDate
                       });
                       $('<span class="k-invalid-msg" data-for="applyWartStartDt"></span>').appendTo(container);

                   }
               }
               ,{field:"wartApplyEndDt", title:"<spring:message code='ser.lbl.wartEndDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="applyWartEndDt" name="applyWartEndDt" data-name="<spring:message code="ser.lbl.wartEndDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                           ,change:gridBaseDupCheckDate
                       });
                       $('<span class="k-invalid-msg" data-for="applyWartEndDt"></span>').appendTo(container);

                   }
               }
             ]

    });

    /**RO 작업시간  **/
    $("#gridRoBase").kendoExtGrid({
        gridId:"G-SER-1011-000175"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoBase/selectSanbaoBaseRoWorkTimes.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,applyDstinCd:{type:"string", editable:false ,   validation:{required:true} }
                       ,applyPrid:{type:"number" , validation:{required:true} }
                       ,wartApplyStartDt:{type:"date" , validation:{required:true} }
                       ,wartApplyEndDt:{type:"date" , validation:{required:true}}
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:80
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[0]).attr("name");
            if(!e.model.isNew()){
                if(fieldName=="roDstinCd"){
                    this.closeCell();
                }
            }
         }
        ,columns:[
                {field:"applyDstinCd", title:"<spring:message code='ser.lbl.appyStd' />", width:70
                    ,attributes :{"class":"al"}
                    ,template:"#=setApplyNm(applyDstinCd)#"
                    ,editor:function(container, options){
                        $('<input required name="roDstinCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:applyDstinList3
                        });
                        $('<span class="k-invalid-msg" data-for="roDstinCd"></span>').appendTo(container);
                       }
                }
               ,{field:"applyPrid", title:"<spring:message code='ser.lbl.applyPrid' />", width:70
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="roPrid" id="roPrid" maxLength=3 data-name="<spring:message code="ser.lbl.applyPrid" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:0
                          ,max:9999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="roPrid"></span>').appendTo(container);
                    }

               }
               ,{field:"wartApplyStartDt", title:"<spring:message code='ser.lbl.wartStartDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input required id="roBaseWartStartDt" name="roBaseWartStartDt" data-name="<spring:message code="ser.lbl.wartStartDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                           ,change:gridRoBaseDupCheckDate
                       });
                       $('<span class="k-invalid-msg" data-for="roBaseWartStartDt"></span>').appendTo(container);

                   }
               }
               ,{field:"wartApplyEndDt", title:"<spring:message code='ser.lbl.wartEndDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input required id="roBaseWartEndDt" name="roBaseWartEndDt" data-name="<spring:message code="ser.lbl.wartEndDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                           ,change:gridRoBaseDupCheckDate
                       });
                       $('<span class="k-invalid-msg" data-for="roBaseWartEndDt"></span>').appendTo(container);

                   }
               }
             ]

    });


    /** 적용 비율 그리드**/
    $("#gridRate").kendoExtGrid({
        gridId:"G-SER-1011-000176"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoBase/selectSanbaoBaseDepreRates.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                         rnum:{type:"number", editable:false }
                        ,applyDstinCd:{type:"string", editable:false ,   validation:{required:true} }
                        ,rate:{type:"number" , validation:{required:true} }
                        ,applyPrid:{type:"number"  }
                        ,wartApplyStartDt:{type:"date"  }
                        ,wartApplyEndDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:80
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
             var fieldName = $(e.container.find("input")[0]).attr("name");
            if(!e.model.isNew()){
                if(fieldName=="rateDstinCd"){
                    this.closeCell();
                }
            }
         }
        ,columns:[
                {field:"applyDstinCd", title:"<spring:message code='ser.lbl.appyStd' />", width:70
                    ,attributes :{"class":"al"}
                    ,template:"#=setApplyNm(applyDstinCd)#"
                    ,editor:function(container, options){
                        $('<input required name="rateDstinCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:applyDstinList4
                        });
                        $('<span class="k-invalid-msg" data-for="rateDstinCd"></span>').appendTo(container);
                       }

                }
               ,{field:"rate", title:"<spring:message code='ser.lbl.rate' />", width:70
                   ,attributes :{"class":"ar"}
                   //,format: "{0:n4}"
                   ,editor:function(container, options){
                       $('<input required name="ratePrid" id="ratePrid" data-name="<spring:message code="ser.lbl.applyPrid" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           decimals:4
                          ,max:1
                          ,min:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="ratePrid"></span>').appendTo(container);
                   }
               }
               ,{field:"wartApplyStartDt", title:"<spring:message code='ser.lbl.wartStartDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="rateWartStartDt" name="rateWartStartDt" data-name="<spring:message code="ser.lbl.wartStartDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                           ,change:gridRateDupCheckDate
                       });
                       $('<span class="k-invalid-msg" data-for="rateWartStartDt"></span>').appendTo(container);

                   }
               }
               ,{field:"wartApplyEndDt", title:"<spring:message code='ser.lbl.wartEndDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="rateWartEndDt" name="rateWartEndDt" data-name="<spring:message code="ser.lbl.wartEndDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                           ,change:gridRateDupCheckDate
                       });
                       $('<span class="k-invalid-msg" data-for="rateWartEndDt"></span>').appendTo(container);
                   }
               }
             ]

    });

    /** 부품 그리드 **/
    $("#gridPart").kendoExtGrid({
        gridId:"G-SER-1011-000177"
        ,dataSource:{
            transport:{
                   read :{
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sItemAtcCd"] = $("#sItemAtcCd").val();
                         params["sItemGrpCd"] = $("#sItemGrpCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,itemGrpCd:{type:"string", editable:false, validation:{required:true} }
                       ,itemGrpNm:{type:"string", validation:{required:true} }
                       ,itemAtcCd:{type:"string", validation:{required:true} }
                       ,sameFauExchTermVal:{type:"number", validation:{required:true} }
                       ,alrtStartTermVal:{type:"number", validation:{required:true} }
                       ,tcavTermVal:{type:"number", validation:{required:true} }
                       ,applyStartDt:{type:"date", validation:{required:true} }
                       ,applyEndDt:{type:"date", validation:{required:true} }
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:false
        ,height:205
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
                {field:"itemGrpCd", title:"<spring:message code='ser.lbl.itemGrp' />", width:70, attributes :{"class":"al"}} //부품그룹
               ,{field:"itemGrpNm", title:"<spring:message code='ser.lbl.itemGrpNm' />", width:100, attributes :{"class":"al"}}//부품그룹명
               ,{field:"itemAtcCd", title:"<spring:message code='ser.lbl.itemAtc' />", width:100
                   ,attributes :{"class":"al"}
                   ,template:"#=setItemGrpNm(itemAtcCd)#"
                   ,editor:function(container, options){
                       $('<input required name="itemAtc" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:itemGrpList
                           ,optionLabel:" "
                       });
                       $('<span class="k-invalid-msg" data-for="itemAtc"></span>').appendTo(container);
                      }
               }//분류항목
               ,{field:"sameFauExchTermVal", title:"<spring:message code='ser.lbl.sameFauExchTermVal' />", width:50
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="sameFauExchTerm" id="sameFauExchTerm" maxLength=3 data-name="<spring:message code="ser.lbl.sameFauExchTermVal" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:1
                          ,max:9999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="sameFauExchTerm"></span>').appendTo(container);
                    }
               }//동일하자
               ,{field:"alrtStartTermVal", title:"<spring:message code='ser.lbl.alrTerm' />", width:50
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="alrtStartTerm" id="alrtStartTerm" maxLength=3 data-name="<spring:message code="ser.lbl.alrTerm" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:1
                          ,max:9999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="alrtStartTerm"></span>').appendTo(container);
                    }

               }//알람조건
               ,{field:"tcavTermVal", title:"<spring:message code='ser.lbl.tcavTerm' />", width:50
                   ,attributes :{"class":"ar"}
                   ,editor:function(container, options){
                       $('<input required name="tcavTerm" id="tcavTerm" maxLength=3 data-name="<spring:message code="ser.lbl.tcavTerm" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0               // 소숫점
                          ,min:1
                          ,max:9999
                          ,value:0
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="tcavTerm"></span>').appendTo(container);
                    }

               }//기술자문조건
               ,{field:"applyStartDt", title:"<spring:message code='ser.lbl.applyStartDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input required id="itemWartStartDt" name="itemWartStartDt" data-name="<spring:message code="ser.lbl.applyStartDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="itemWartStartDt"></span>').appendTo(container);
                   }
               }
               ,{field:"applyEndDt", title:"<spring:message code='ser.lbl.applyEndDt' />", width:50
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input required id="itemWartEndDt" name="itemWartEndDt" data-name="<spring:message code="ser.lbl.applyEndDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                           ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="itemWartEndDt"></span>').appendTo(container);
                   }

               }
               ,{field:"updtUserId", title:"<spring:message code='ser.lbl.updtUserId' />", width:50, attributes :{"class":"ar"}}
             ]

    });


});
</script>
<!-- //script -->

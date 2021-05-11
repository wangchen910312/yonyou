<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 할인관리마스터 -->
<div id="resizableContainer">
    <div class="content_v1">
        <section class="group">
            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <%-- <h1 class="title_basic"><spring:message code="ser.title.dcMng" /></h1><!-- 할인관리마스터 --> --%>
                <div class="btn_left">
                <dms:access viewId="VIEW-D-11838" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                </dms:access>
                </div>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11836" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11837" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
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
                            <th scope="row"><spring:message code="ser.lbl.dcPermTp" /></th><!--할인권한구분  -->
                            <td>
                                <input id="sDcPermTp" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.dcCd" /></th><!--할인코드  -->
                            <td>
                                <input id="sDcCd" type="text" class="form_input">
                                <input type="hidden" id="model" value="INSERT">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.dcNm" /></th><!--할인명  -->
                            <td>
                                <input id="sDcNm" type="text" value="" class="form_input">
                            </td>

                            <th scope="row"><spring:message code="ser.lbl.dcTp" /></th><!--할인방식  -->
                            <td>
                                <input id="sDcTp" class="form_comboBox">
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
            <!-- 조회 조건 종료 -->
            <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>
        <!-- 그리드 종료 -->
        <form id="form">
            <div class="clfix">
                <!-- 할인코드 기본정보 -->
                <section>

                    <div id="tabstrip" class="tab_area">
                        <!-- 탭메뉴 -->
                        <ul>
                            <li id="BI" class="k-state-active"><spring:message code="ser.lbl.basicInfo" /></li>
                            <li id="SA" ><spring:message code="par.lbl.part" /></li>
                            <li id="CU"><spring:message code="ser.lbl.customer" /></li>

                        </ul>
                        <!-- //탭메뉴 -->

                        <!-- 기본정보 시작 -->
                        <div>
                            <div class="left_areaStyle">
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="ser.title.dcInfo" /> </h2><!--할인코드 기본정보  -->
                                </div>
                                <div class="table_form" style="height:150px">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:20%;">
                                            <col style="width:30%;">
                                            <col style="width:20%;">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><spring:message code="ser.lbl.dcCd" /></th><!--할인코드  -->
                                                <td>
                                                    <input id="dcCd" name="dcCd" class="form_input form_readonly" style="width:100%" data-json-obj="true" />
                                                </td>
                                                <th scope="row"><spring:message code="ser.lbl.useYn" /></th><!--사용여부  -->
                                                <td >
                                                    <input id="dcUseYn" name="dcUseYn" style="width:100%" class="form_comboBox" data-json-obj="true">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dcNm" /></span></th><!--할인명  -->
                                                <td colspan="3" class="required_area">
                                                    <input required id="dcNm" name="dcNm" type="text" class="form_input" data-name="<spring:message code="ser.lbl.dcNm" />" style="width:100%" data-json-obj="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><spring:message code="ser.lbl.dcBet" /></th><!--할인기간  -->
                                                <td colspan="3">
                                                    <div class="form_float">
                                                        <div class="date_left">
                                                            <input id="dcApplyStartDt" name="dcApplyStartDt" class="form_datepicker" data-json-obj="true" / >
                                                            <span class="txt_from">~</span>
                                                        </div>
                                                        <div class="date_right">
                                                            <input id="dcApplyEndDt" name="dcApplyEndDt" class="form_datepicker" data-json-obj="true" />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dcPermTp" /></span></th><!--할인권한구분  -->
                                                <td>
                                                    <input required id="dcPermTp" name="dcPermTp" type="text" class="form_comboBox" data-name="<spring:message code="ser.lbl.dcPermTp" />" data-json-obj="true" />
                                                </td>
                                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dcRole" /></span></th><!--할인권한 -->
                                                <td class="required_area">
                                                    <input required id="dcDstinCd" name="dcDstinCd" type="text" class="form_comboBox" style="width:100%" data-name="<spring:message code="ser.lbl.dcRole" />" data-json-obj="true" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="right_areaStyle">
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="ser.title.dcAmtInfo" /></h2><!--할인코드 세부금액  -->
                                </div>
                                    <!-- 할인코드 세부금액 시작 -->
                                <div class="table_form" style="height:150px">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:24%;">
                                            <col style="width:26%;">
                                            <col style="width:20%;">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dcTp" /></span></th><!--할인적용방식  -->
                                                <td colspan="3" class="required_area">
                                                    <input id="dcTp" name="dcTp" class="form_comboBox" data-json-obj="true" />
                                                </td>
                                            </tr>
                                            <tr class="hidden">
                                                <th scope="row"><spring:message code="ser.lbl.lbrDcRate" />(%)</th><!--공임할인  -->
                                                <td class="dcRate">
                                                    <input id="lbrDcRate" name="lbrDcRate" class="form_numeric ar" data-json-obj="true" />
                                                </td>
                                                <th scope="row"><spring:message code="ser.lbl.lbrDcAmt" /></th><!--공임할인금액  -->
                                                <td class="dcAmt">
                                                    <input id="lbrDcAmt" name="lbrDcAmt" class="form_numeric ar" data-json-obj="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><spring:message code="ser.lbl.parDcRate" />(%)</th><!--부품할인  -->
                                                <td class="dcRate">
                                                    <input id="parDcRate" name="parDcRate" class="form_numeric ar" data-json-obj="true" />
                                                </td>
                                                <th scope="row"><spring:message code="ser.lbl.parDcAmt" /></th><!-- 부품할인금액 -->
                                                <td class="dcAmt">
                                                    <input id="parDcAmt" name="parDcAmt" class="form_numeric ar" data-json-obj="true" />
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 기본정보 종료 -->

                        <!-- SA 정보 시작 -->
                        <div>
                             <div class="btn_right_absolute">
                            <dms:access viewId="VIEW-D-11835" hasPermission="${dms:getPermissionMask('READ')}">
                                 <button type="button" id="saAdd" class="btn_s btn_add" disabled><spring:message code="global.btn.add" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11834" hasPermission="${dms:getPermissionMask('READ')}">
                                 <button type="button" id="saDel" class="btn_s btn_delete" disabled><spring:message code="global.btn.rowDel" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11833" hasPermission="${dms:getPermissionMask('READ')}">
                                 <button type="button" id="saCancel" class="btn_s btn_cancel" disabled><spring:message code="global.btn.cancel" /></button>
                            </dms:access>
                             </div>
                             <div class="table_grid ">
                                <div id="gridSa" class="grid"></div>
                            </div>
                        </div>
                        <!-- SA 정보 종료 -->

                        <!-- 고객 정보 시작 -->
                        <div>
                            <div class="btn_right_absolute">
                            <dms:access viewId="VIEW-D-11832" hasPermission="${dms:getPermissionMask('READ')}">
                                 <button type="button" id="custAdd" class="btn_s btn_add" disabled><spring:message code="global.btn.add" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11831" hasPermission="${dms:getPermissionMask('READ')}">
                                 <button type="button" id="custDel" class="btn_s btn_delete" disabled><spring:message code="global.btn.rowDel" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11830" hasPermission="${dms:getPermissionMask('READ')}">
                                 <button type="button" id="custCancel" class="btn_s btn_cancel" disabled><spring:message code="global.btn.cancel" /></button>
                            </dms:access>
                            </div>
                            <div class="table_grid ">
                                <div id="gridCust" class="grid"></div>
                            </div>
                        </div>
                        <!-- 고객 정보 종료 -->

                    </div>
                </section>
            </div>
       </form>
    </div>
</div>
<script type="text/javascript">


//RO유형 Array
var dcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${dcTpList}">
dcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var dcTpMap = dms.data.arrayToMap(dcTpList, function(obj){ return obj.cmmCd; });

//할인구분 Array
var dcDstinCdList = [];
<c:forEach var="obj" items="${dcDstinCdList}">
dcDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//할인구분 Map
var dcDstinMap = dms.data.arrayToMap(dcDstinCdList, function(obj){ return obj.cmmCd; });

//할인구분 대상Array
var dcPermTpList = [];
<c:forEach var="obj" items="${dcPermTpList}">
if("${obj.remark1}" !== 'S'){
    dcPermTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>

//할인구분 대상 Map
var dcPermTpMap = dms.data.arrayToMap(dcPermTpList, function(obj){ return obj.cmmCd; });

//사용여부 Array
var useYnList = [];
<c:forEach var="obj" items="${useYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//사용여부 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

var gridSelectedRow = 0;
var selectedYn = false;
var popupWindow;

var selectTabId = "BI";


$(document).ready(function() {


    custSearchPopupWindow = function(){
            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , width:850
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "custCd":"02"// null:all, 01:잠재, 02:보유
                        //, "dlrMbrYn":"N"        // 딜러 멤버십 가입 여부
                        , "closeYn" : "N"
                        , "callbackFunc":function(data){

                            if(data.length >= 1) {
                                var grid = $('#gridCust').data('kendoExtGrid');
                                var messages = [];

                                $.each(data, function(idx, user){

                                    var isExist = grid.exists(function(data){
                                        if(data.custNo == user.custNo) {
                                            messages.push({"errorMessage":"<spring:message code='cmm.info.already.regist.user' />".replace("{0}", user.usrId)});
                                            return true;
                                        }
                                        return false;
                                    });

                                    if(!isExist){
                                        grid.dataSource.insert(0, {
                                             "dcCd":$("#dcCd").val()
                                            ,"custNo":user.custNo
                                            ,"custNm":dms.string.strNvl(user.custNm) == "" ? user.carOwnerNm : user.custNm
                                            ,"preFixId":"02"
                                        });
                                    }
                                });

                                if(messages.length > 0){
                                    dms.notification.info(messages);
                                }


                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });
    };

     // DC 구분
     dcTpCdGrid = function(value){
         var returnVal = "";

         if( dms.string.strNvl(value) != ""){
             if(dcTpMap[value] != undefined){
                 returnVal = dcTpMap[value].cmmCdNm;
             }
         }
         return returnVal;
     };

     // DC 구분
     dcDstinCdGrid = function(value){
         var returnVal = "";

         if( dms.string.strNvl(value) != ""){
             if(dcDstinMap[value] != undefined)
                 returnVal = dcDstinMap[value].cmmCdNm;
         }
         return returnVal;
     };

     // 사용여부
     useYnGrid = function(value){
         var returnVal = "";
         if( dms.string.strNvl(value) != ""){
             if(useYnMap[value] != undefined)
                 returnVal = useYnMap[value].cmmCdNm;
         }
         return returnVal;
     };

     //할인대상구분
     setDcPermTpMap = function(value){
         var resultVal = "";
         if( dms.string.strNvl(value) != ""){
             if(dcPermTpMap[value] != undefined)
                 resultVal = dcPermTpMap[value].cmmCdNm;
         }
         return resultVal;
     };

    $("#dcTp").kendoExtDropDownList({
         dataSource:dcTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,change:function(e){
            var selectVal = this.value();
            if(selectVal == "01") {
                $("#parDcRate").attr("readonly", true);
                $("#lbrDcRate").attr("readonly", true);
                $(".dcRate").addClass("readonly_area");
                $("#lbrDcAmt").attr("readonly", false);
                $("#parDcAmt").attr("readonly", false);
                $(".dcAmt").removeClass("readonly_area");
            } else if(selectVal == "02") {
                $("#lbrDcAmt").attr("readonly", true);
                $("#parDcAmt").attr("readonly", true);
                $(".dcAmt").addClass("readonly_area");
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            } else {
                $("#lbrDcAmt").attr("readonly", false);
                $("#parDcAmt").attr("readonly", false);
                $(".dcAmt").removeClass("readonly_area");
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            }
        }
    });

    $("#dcUseYn").kendoExtDropDownList({
         dataSource:useYnList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:1
    });

    $("#sDcTp").kendoExtDropDownList({
        dataSource:dcTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    $("#dcDstinCd").kendoExtDropDownList({
        dataSource:dcDstinCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,change:function(e){
            var selectVal = this.value();
            if(selectVal == "ECT"){
                $("#dcTp").data("kendoExtDropDownList").value("01");
                $("#dcTp").data("kendoExtDropDownList").enable(false);
                $("#parDcRate").attr("readonly", true);
                $("#lbrDcRate").attr("readonly", true);
                $(".dcRate").addClass("readonly_area");
            } else {
                $("#dcTp").data("kendoExtDropDownList").value("");
                $("#dcTp").data("kendoExtDropDownList").enable(true);
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            }
        }
    });

    $("#sDcPermTp").kendoExtDropDownList({
        dataSource: dcPermTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel : " "
        ,index:0
    });

    $("#dcPermTp").kendoExtDropDownList({
        dataSource: dcPermTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });


    $("#dcApplyStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#dcApplyEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#lbrDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,restrictDecimals: true
      ,change:calTotRate
    });

    $("#lbrDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,restrictDecimals: true
      ,change:calTotAmt
    });

    $("#parDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,restrictDecimals: true
      ,change:calTotRate
    });

    $("#parDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,restrictDecimals: true
      ,change:calTotAmt
    });

    /* $("#subDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotRate
    });

    $("#subDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotAmt
    });

    $("#totDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,spinners:false
    });

    $("#totDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,spinners:false
    });

 */
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
       click:function(e){

           var validator = $("#form").kendoExtValidator().data("kendoExtValidator");

           if (validator.validate()) {

               var json = $("#form").serializeObject( $("#form").serializeArrayInSelector("[data-json-obj='true']"));

               json.dcApplyStartDt= $("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value();
               json.dcApplyEndDt= $("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value();
               json.dcTp = $("#dcTp").data("kendoExtDropDownList").value();

               /* 할인적용방식 확인*/
               if(json.dcTp == "01"){//금액
                   //할인율 초기화.
                   json.parDcRate = 0;
               }else if(json.dcTp == "02"){//할인율
                   //금액 초기화.
                   json.parDcAmt = 0;
               }else{
                   //할인적용방식 없을 때
                   json.parDcRate = 0;
                   json.parDcAmt = 0;
               }
               var saSaveData   = $("#gridSa").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");
               var custSaveData = $("#gridCust").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");

               var params =  $.extend(
                       {"dcMasterVO":json}
                       ,{"dcSaDetailVO":saSaveData}
                       ,{"dcCustDetailVO":custSaveData}
                );

               $.ajax({
                   url: "<c:url value='/ser/svi/dcMaster/multiDcMastersForParts.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
                   ,data:JSON.stringify(params)
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors);
                   }
                   ,success:function(data) {
                       dms.notification.success("<spring:message code='global.info.success'/>");
                       selectedYn = true;
                       gridSelectedRow = $("#grid").data("kendoExtGrid").select().index();
                       $("#grid").data("kendoExtGrid").dataSource.read();
                       if($("#model").val()=="INSERT"){
                           $("#btnReset").click();
                       }
                   }
                   ,beforeSend:function(xhr){
                       dms.loading.show($("#resizableContainer"));
                   }
                   ,complete:function(xhr,status){
                       dms.loading.hide($("#resizableContainer"));
                   }
               });

           }

       }
    });

    //사용자 팝업
    $("#saAdd").kendoButton({

        click : function(e){

            var grid = $('#gridSa').data('kendoExtGrid');
            var rows = grid.select();

            var selectedItem = grid.dataItem(grid.select());

            //사용자 조회 팝업
            dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"closeAfterSelect":false
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(users){
                            var messages = [];

                            $.each(users, function(idx, user){

                                var isExist = grid.exists(function(data){
                                    if(data.usrId == user.usrId) {
                                        messages.push({"errorMessage":"<spring:message code='cmm.info.already.regist.user' />".replace("{0}", user.usrId)});
                                        return true;
                                    }
                                    return false;
                                });

                                if(!isExist){
                                    grid.dataSource.insert(0, {
                                         "dcCd":$("#dcCd").val()
                                        ,"usrId":user.usrId
                                        ,"usrNm":user.usrNm
                                        ,"useYn":"Y"
                                        ,"preFixId":"03"
                                    });
                                }
                            });

                            if(messages.length > 0){
                                dms.notification.info(messages);
                            }
                        }
                    }
                }
            });
        }
    });
    //사용자 삭제
    $("#saDel").kendoButton({

        click : function(e){

            var grid = $("#gridSa").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //사용자 취소
    $("#saCancel").kendoButton({

        click : function(e){
            var grid = $('#gridSa').data('kendoExtGrid');
            grid.cancelChanges();

        }
    });
    //CRM 고객 팝업
    $("#custAdd").kendoButton({

        click : function(e){

            custSearchPopupWindow();
        }
    });
    //CRM 고객 삭제
    $("#custDel").kendoButton({

        click : function(e){

            var grid = $("#gridCust").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });
    //CRM 고객 취소
    $("#custCancel").kendoButton({

        click : function(e){
            var grid = $('#gridCust').data('kendoExtGrid');
            grid.cancelChanges();
        }
    });

    setButtonEnable = function (pwaStatCd){

        switch(pwaStatCd){
            case "Y" :
                $("#saAdd").data("kendoButton").enable(true);
                $("#saDel").data("kendoButton").enable(true);
                $("#saCancel").data("kendoButton").enable(true);
                $("#custAdd").data("kendoButton").enable(true);
                $("#custDel").data("kendoButton").enable(true);
                $("#custCancel").data("kendoButton").enable(true);

                      break;
            case "N" :
                $("#saAdd").data("kendoButton").enable(false);
                $("#saDel").data("kendoButton").enable(false);
                $("#saCancel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                $("#custCancel").data("kendoButton").enable(false);

                      break;
            default :
                $("#saAdd").data("kendoButton").enable(false);
                $("#saDel").data("kendoButton").enable(false);
                $("#saCancel").data("kendoButton").enable(false);
                $("#custAdd").data("kendoButton").enable(false);
                $("#custDel").data("kendoButton").enable(false);
                $("#custCancel").data("kendoButton").enable(false);
                break;
        }
    };

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var json = $("form").serializeObject();
            $.ajax({
                url:"<c:url value='/ser/svi/pDIChkAtc/deletePDIChkAtc.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(json)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#btnReset").click();
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){

            $("#form").get(0).reset();

            $("#lbrDcAmt").attr("readonly", false);
            $("#parDcAmt").attr("readonly", false);
            $(".dcAmt").removeClass("readonly_area");
            $("#parDcRate").attr("readonly", false);
            $("#lbrDcRate").attr("readonly", false);
            $(".dcRate").removeClass("readonly_area");
            $("#dcTp").data("kendoExtDropDownList").enable(true);

            /*
            $("#dcCd").val("");
            $("#dcTp").data("kendoExtDropDownList").value("");
            $("#dcNm").val("");
            $("#lbrDcRate").val("");
            $("#lbrDcAmt").val("");
            $("#parDcRate").val("");
            $("#parDcAmt").val("");

            $("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value("");
            $("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value("");
            $("#dcScoreVal").val("");
             */
            /* $("#subDcRate").val("");
            $("#subDcAmt").val("");
            $("#totDcRate").val("");
            $("#totDcAmt").val(""); */

            setButtonEnable("N");
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000118"
        ,dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/svi/dcMaster/selectDcMasters.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {},
                           sDcPermTpLst = [];

                       for(var i = 0; i < dcPermTpList.length; i = i + 1){
                           sDcPermTpLst[i] = dcPermTpList[i].cmmCd;
                       }

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sDcCd"]        = $("#sDcCd").val();
                       params["sDcNm"]        = $("#sDcNm").val();
                       params["sDcTp"]        = $("#sDcTp").data("kendoExtDropDownList").value();
                       params["sDcPermTp"]    = $("#sDcPermTp").data("kendoExtDropDownList").value();
                       params["sDcPermTpLst"] = sDcPermTpLst;

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"rnum"
                   ,fields:{
                       dlrCd:{type:"string"}
                       ,dcCd:{type:"string"}
                       ,dcNm:{type:"string"}
                       ,dcDstinCd:{type:"string"}
                       ,dcPermTp:{type:"string"}
                       ,dcTp:{type:"string"}
                       ,lbrDcRate:{type:"number"}
                       ,lbrDcAmt:{type:"number"}
                       ,parDcRate:{type:"number"}
                       ,parDcAmt:{type:"number"}
                       ,dcApplyStartDt:{type:"date"}
                       ,dcApplyEndDt:{type:"date"}
                       ,dcScoreVal:{type:"string"}
                       ,dcUseYn:{type:"string"}
                   }
               }
           }
        }
        ,height:200
        ,editable:false
        ,selectable:"row"
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#dlrCd").val(dataItem.dlrCd);
            $("#dcCd").val(dataItem.dcCd);
            $("#dcTp").data("kendoExtDropDownList").value(dataItem.dcTp);
            $("#dcDstinCd").data("kendoExtDropDownList").value(dataItem.dcDstinCd);
            $("#dcNm").val(dataItem.dcNm);
            $("#lbrDcRate").data("kendoExtNumericTextBox").value(dataItem.lbrDcRate);
            $("#lbrDcAmt").data("kendoExtNumericTextBox").value(dataItem.lbrDcAmt);
            $("#parDcRate").data("kendoExtNumericTextBox").value(dataItem.parDcRate);
            $("#parDcAmt").data("kendoExtNumericTextBox").value(dataItem.parDcAmt);
            $("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value(dataItem.dcApplyStartDt);
            $("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value(dataItem.dcApplyEndDt);
            $("#dcScoreVal").val(dataItem.dcScoreVal);
            $("#dcUseYn").data("kendoExtDropDownList").value(dataItem.dcUseYn);
            $("#dcPermTp").data("kendoExtDropDownList").value(dataItem.dcPermTp);

            $("#gridSa").data("kendoExtGrid").dataSource.read();
            $("#gridCust").data("kendoExtGrid").dataSource.read();

            if(dataItem.dcDstinCd == "ECT"){
                $("#dcTp").data("kendoExtDropDownList").enable(false);
                $("#parDcRate").attr("readonly", true);
                $("#lbrDcRate").attr("readonly", true);
                $(".dcRate").addClass("readonly_area");
            } else {
                $("#dcTp").data("kendoExtDropDownList").enable(true);
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            }

            if(dataItem.dcTp == "01") {
                $("#parDcRate").attr("readonly", true);
                $("#lbrDcRate").attr("readonly", true);
                $(".dcRate").addClass("readonly_area");
                $("#lbrDcAmt").attr("readonly", false);
                $("#parDcAmt").attr("readonly", false);
                $(".dcAmt").removeClass("readonly_area");
            } else if(dataItem.dcTp == "02") {
                $("#lbrDcAmt").attr("readonly", true);
                $("#parDcAmt").attr("readonly", true);
                $(".dcAmt").addClass("readonly_area");
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            } else {
                $("#lbrDcAmt").attr("readonly", false);
                $("#parDcAmt").attr("readonly", false);
                $(".dcAmt").removeClass("readonly_area");
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            }

            setButtonEnable("Y");

        }
        ,columns:[
            {field:"dcCd", title:"<spring:message code='ser.lbl.dcCd' />", width:100
                ,attributes:{"class":"ac"}
            }//할인코드
            ,{field:"dcNm", title:"<spring:message code='ser.lbl.dcNm' />", width:100
                ,attributes:{"class":"ac"}
            }//할인명
            ,{field:"dcDstinCd", title:"<spring:message code='ser.lbl.dcRole' />", width:80, attributes:{"class":"ac"}
                   ,template:"#=dcDstinCdGrid(dcDstinCd)#"
            }
            ,{field:"dcTp", title:"<spring:message code='ser.lbl.dcTp' />", width:80, attributes:{"class":"ac"}
                 ,template:"#=dcTpCdGrid(dcTp)#"
            }
            ,{field:"dcPermTp", title:"<spring:message code='ser.lbl.dcPermTp' />", width:80, attributes:{"class":"ac"}
                 ,template:"#=setDcPermTpMap(dcPermTp)#"
            }
            ,{field:"dcUseYn", title:"<spring:message code='ser.lbl.useYn' />", width:80, attributes:{"class":"ac"}
                 //,template:"#=useYnGrid(dcUseYn)#"
            }//사용여부
            ,{field:"dcApplyStartDt", title:"<spring:message code='ser.lbl.dcBet' />(FROM)", width:100,format:"{0:<dms:configValue code='dateFormat' />}"//할인기간
                ,attributes:{"class":"ac"}
            }
            ,{field:"dcApplyEndDt", title:"<spring:message code='ser.lbl.dcBet' />(TO)", attributes:{"class":"ac"}, width:100,format:"{0:<dms:configValue code='dateFormat' />}"}//할인기간
        ]

    });

    //SA 그리드 설정
    $("#gridSa").kendoExtGrid({
        gridId:"G-SER-1011-000119"
        ,dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/svi/dcMaster/selectDcDetails.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sDcCd"] = $("#dcCd").val();
                       params["sPreFixId"] = "03";

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"rnum"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,dcCd:{type:"string" ,editable:false}
                       ,usrId:{type:"string",editable:false}
                       ,usrNm:{type:"string",editable:false}
                       ,useYn:{type:"string", editable:true}

                   }
               }
           }
        }
        ,height:200
        ,autoBind : false
        ,selectable:"row"
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
             {field:"usrId", title:"<spring:message code='ser.lbl.userId' />", width:100, attributes:{"class":"ac"} }//사용자ID
            ,{field:"usrNm", title:"<spring:message code='ser.lbl.userNm' />", width:100,attributes:{"class":"ac"} }//사용자명
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:80, attributes:{"class":"ac"}
                 ,template:"#=useYnGrid(useYn  )#"
                 ,editor:function(container, options){
                     $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:useYnList
                         ,valuePrimitive:true
                     });
                     $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                    }
            } //사용여부
            ,{field:"preFixId", width:100,attributes:{"class":"ac"},  hidden:true }//사용자명
        ]

    });

    //그리드 설정
    $("#gridCust").kendoExtGrid({
        gridId:"G-SER-1011-000120"
        ,dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/svi/dcMaster/selectDcDetails.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sDcCd"] = $("#dcCd").val();
                       params["sPreFixId"] = "02";

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"rnum"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,custNo:{type:"string" ,editable:false}
                       ,custNm:{type:"string" ,editable:false}
                       ,totCnt:{type:"number" ,editable:true}
                       ,useCnt:{type:"number" ,editable:false}
                   }
               }
           }
        }
        ,height:200
        ,editable:true
        ,autoBind : false
        ,selectable:"row"
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
             {field:"custNo", title:"<spring:message code='ser.lbl.custNo' />", width:100 ,attributes:{"class":"ac"}}//고객번호
            ,{field:"custNm", title:"<spring:message code='ser.lbl.custNm' />", width:100 ,attributes:{"class":"ac"} } //고객명
            ,{field:"totCnt", title:"<spring:message code='ser.lbl.totCnt' />", width:80, attributes:{"class":"ar"},format:"{0:n0}"
                , editor:function(container, options){
                    $('<input required name="totCnt" id="totCnt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="totCnt"></span>').appendTo(container);
                 }
            } //전체횟수 全部次数
            ,{field:"useCnt", title:"<spring:message code='ser.lbl.useCnt' />", width:80, attributes:{"class":"ar"},format:"{0:n0}"
                , editor:function(container, options){
                    $('<input required name="useCnt" id="useCnt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="useCnt"></span>').appendTo(container);
                }
            } //사용횟수 使用次数
            ,{field:"preFixId", width:100,attributes:{"class":"ac"},  hidden:true }
        ]

    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select: function(e) {
            selectTabId = e.item.id;
        }
      ,change : function(e){
          var dcPermTp = $("#dcPermTp").data("kendoExtDropDownList").value();
          var tabToActivate = $("#BI");
          if(selectTabId == "CU" && dcPermTp == "01"){
              $("#CU").removeClass("k-state-active");
              $("#BI").addClass("k-state-active");

              $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab(tabToActivate);
          }/*else if(selectTabId == "SA" && dcPermTp == "02"){
              $("#SA").removeClass("k-state-active");
              $("#BI").addClass("k-state-active");
              $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab(tabToActivate);
          }*/

          if(selectTabId == "SA" && dcPermTp == "01"){
              $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab($("#SA"));
          }else if(selectTabId == "CU" && dcPermTp == "02"){
              $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab($("#CU"));
          }else if(selectTabId == "SA" && dcPermTp == "02"){
              $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip").activateTab($("#SA"));
          }

      }
    });


});


// 금액 합계 계산
calTotAmt = function(){

  var lbrDcAmt = Number(dms.string.defaultString($("#lbrDcAmt").data("kendoExtNumericTextBox").value(), "0" ) );
  var parDcAmt = Number(dms.string.defaultString($("#parDcAmt").data("kendoExtNumericTextBox").value(), "0" ) );
  //var subDcAmt = Number(dms.string.defaultString($("#subDcAmt").data("kendoExtNumericTextBox").value(), "0" ) );

 //$("#totDcAmt").data("kendoExtNumericTextBox").value(lbrDcAmt + parDcAmt + subDcAmt);
};

// 비율 합계 계산
calTotRate = function(){

  var lbrDcRate = Number(dms.string.defaultString($("#lbrDcRate").data("kendoExtNumericTextBox").value(), "0" ) );
  var parDcRate = Number(dms.string.defaultString($("#parDcRate").data("kendoExtNumericTextBox").value(), "0" ) );
  //var subDcRate = Number(dms.string.defaultString($("#subDcRate").data("kendoExtNumericTextBox").value(), "0" ) );

 //$("#totDcRate").data("kendoExtNumericTextBox").value(lbrDcRate + parDcRate + subDcRate);
};

</script>








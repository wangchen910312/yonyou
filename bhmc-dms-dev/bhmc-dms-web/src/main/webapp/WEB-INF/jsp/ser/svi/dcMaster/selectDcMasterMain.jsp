<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<!-- 할인관리마스터 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12081" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12080" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12079" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_s_min5" id="btnSave" ><spring:message code="ser.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12075" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12074" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
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
                            <th scope="row"><spring:message code="ser.lbl.dcCd" /></th><!--할인코드  -->
                            <td>
                                <input id="sDcCd" type="text" class="form_input">
                                <input id="dcCd" type="hidden" class="form_input readonly" readonly>
                                <input id="model" type="hidden" value="INSERT">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.dcNm" /></th><!--할인명  -->
                            <td>
                                <input id="sDcNm" type="text" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.useYn" /></th><!--사용여부  -->
                            <td>
                                <input id="sDcUseYn" type="text" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.dcPermDt" /></th><!--권한일자  -->
                            <td>
                                <input type="text" id="sToday" class="form_datepicker ac" />
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
        <!-- SA 정보 시작 -->
        <section>
            <div class="header_area">
                <div class="btn_right mt10">
                    <dms:access viewId="VIEW-D-12076" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="saConfirm" class="btn_s btn_add btn_s_min5" disabled style="display:none"><spring:message code="ser.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12078" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="saAdd" class="btn_s btn_add btn_s_min5" disabled><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12077" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="saDel" class="btn_s btn_del btn_s_min5" disabled><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_grid mt5">
                <div id="gridSa" class="grid"></div>
            </div>
        </section>
        <!-- SA 정보 종료 -->
    </div>
</div>
<script type="text/javascript">

//20170508 hg
var isTablet="${isTablet}";
var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
}


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
if("${obj.remark1}" !== 'P'){ //구분이 부품인 대상 제외
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
var tecSearchPopup;
var dcMasterRegPopupWindow;

var selectTabId = "BI";


$(document).ready(function() {

     // DC 구분
     dcTpCdGrid = function(value){
         var returnVal = "";

         if( dms.string.strNvl(value) != ""){
             if(dcTpMap[value] != undefined)
                 returnVal = dcTpMap[value].cmmCdNm
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

    $("#sDcUseYn").kendoExtDropDownList({
         dataSource:useYnList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
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
                $("#subDcRate").attr("readonly", true);
                $(".dcRate").addClass("readonly_area");
            } else {
                $("#dcTp").data("kendoExtDropDownList").value("");
                $("#dcTp").data("kendoExtDropDownList").enable(true);
                $("#parDcRate").attr("readonly", false);
                $("#lbrDcRate").attr("readonly", false);
                $("#subDcRate").attr("readonly", false);
                $(".dcRate").removeClass("readonly_area");
            }
        }
        ,enable:false
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
        ,enable:false
    });

    $("#sToday").kendoExtMaskedDatePicker({
        format: "<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    $("#dcApplyStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#dcApplyEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#lbrDcRate, #parDcRate").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,spinners:false
    });

    $("#lbrDcAmt, #parDcAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,spinners:false
        ,change:function(e){
            $("#subDcAmt").data("kendoExtNumericTextBox").value(0.00);
        }
    });

    $("#subDcRate").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,spinners:false
    });

    $("#subDcAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,min:0.00
        ,spinners:false
        ,change:function(e){
            $("#lbrDcAmt").data("kendoExtNumericTextBox").value(0.00);
            $("#parDcAmt").data("kendoExtNumericTextBox").value(0.00);
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
       click:function(e){

           var saveData   = $("#grid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");
           var saSaveData = $("#gridSa").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");

           var params =  $.extend(
                   {"dcMasterVOList":saveData}
                   ,{"dcSaDetailVO":saSaveData}
           );

           $.ajax({
               url: "<c:url value='/ser/svi/dcMaster/multiDcMasters.do' />"
               ,dataType:"json"
               ,type:"POST"
               ,contentType:"application/json"
               ,data:JSON.stringify(params)
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               }
               ,success:function(data) {
                   $("#grid").data("kendoExtGrid").dataSource.read();

                   $("#saConfirm").click();
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

    // 추가
    $("#btnAdd").kendoButton({
        click : function(e){
            dcMasterPopup();
        }
    });

    dcMasterPopup = function(){
        dcMasterRegPopupWindow = dms.window.popup({
            windowId:"dcMasterRegPopupWindow"
           ,width:750
           ,height:350
           ,modal:false
           ,title:"<spring:message code='ser.menu.dcMng' />"   // 할인관리
           ,content:{
               url:"<c:url value='/ser/cmm/popup/selectdcMasterRegPopup.do'/>"
               ,data:{
                    "autoBind"    :true
                   ,"callbackFunc":function(data){
                       var gridData = $("#grid").data("kendoExtGrid").dataSource;
                       gridData.insert(0,{
                            "dcCd":data.dcCd
                           ,"dcNm":data.dcNm
                           ,"dcTp":data.dcTp
                           ,"dcUseYn":data.dcUseYn
                           ,"dcApplyStartDt":data.dcApplyStartDt
                           ,"dcApplyEndDt":data.dcApplyEndDt
                           ,"lbrDcRate":data.lbrDcRate
                           ,"parDcRate":data.parDcRate
                           ,"dcDstinCd":"PEM"
                           ,"dcPermTp":"01"
                       });
                        dcMasterRegPopupWindow.close();
                   }
               }
           }
       });
    };

    // 삭제
    $("#btnDel").kendoButton({
        click : function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                if(grid._data[index].dcCd == ""){
                    grid.removeRow(row);
                }else{
                    dms.notification.info("<spring:message code='crm.info.noDeleteFile' />");
                }
            });
        }
    });

    //사용자 확인
    $("#saConfirm").kendoButton({
        click : function(e){
            var master = {
                    dcCd:$("#dcCd").val()
                };
            var saSaveData   = $("#gridSa").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");

            var params =  $.extend(
                    {"dcMasterVO":master}
                    ,{"dcSaDetailVO":saSaveData}
            );

            $.ajax({
                url: "<c:url value='/ser/svi/dcMaster/multiDcDetails.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(params)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#grid").data("kendoExtGrid").dataSource.read();
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

    //사용자 팝업
    $("#saAdd").kendoButton({
        click : function(e){
            tecManAddPopup();
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

    setButtonEnable = function (showYn){
        switch(showYn){
            case "Y" :
                $("#saConfirm").data("kendoButton").enable(true);
                $("#saAdd").data("kendoButton").enable(true);
                $("#saDel").data("kendoButton").enable(true);
                    break;
            case "N" :
                $("#saConfirm").data("kendoButton").enable(false);
                $("#saAdd").data("kendoButton").enable(false);
                $("#saDel").data("kendoButton").enable(false);
                    break;
            default :
                $("#saConfirm").data("kendoButton").enable(false);
                $("#saAdd").data("kendoButton").enable(false);
                $("#saDel").data("kendoButton").enable(false);
                    break;
        }
    };

    $("#btnReset").kendoButton({
        click:function(e){

            $("#sDcCd").val("");
            $("#sDcNm").val("");
            $("#sDcUseYn").data("kendoExtDropDownList").value(" ");
            $("#sToday").data("kendoExtMaskedDatePicker").value("");
            $("#grid").data("kendoExtGrid").dataSource.read();

            setButtonEnable("N");
            $("#gridSa").data("kendoExtGrid").dataSource.data([]);
        }
    })

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0519-174211"
        ,dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/svi/dcMaster/selectDcMasters.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sDcCd"] = $("#sDcCd").val();
                       params["sDcNm"] = $("#sDcNm").val();
                       params["sDcUseYn"] = $("#sDcUseYn").data("kendoExtDropDownList").value();
                       params["sToday"]  = $("#sToday").data("kendoExtMaskedDatePicker").value();

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
                       dlrCd:{type:"string", editable:false}
                       ,dcCd:{type:"string", editable:false}
                       ,dcNm:{type:"string"}
                       ,dcDstinCd:{type:"string", editable:false}
                       ,dcPermTp:{type:"string", editable:false}
                       ,dcTp:{type:"string", editable:false}
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
        ,editable:true
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#dcCd").val(dataItem.dcCd);
            if($("#dcCd").val() != ""){
                $("#gridSa").data("kendoExtGrid").dataSource.read();
                setButtonEnable("Y");
            }
        }
        ,columns:[
             {field:"dcCd", title:"<spring:message code='ser.lbl.dcAuthCd' />", width:100, attributes:{"class":"ac"}}        //할인코드
            ,{field:"dcNm", title:"<spring:message code='ser.lbl.dcAuthName' />", width:100, attributes:{"class":"ac"}}     //할인명
            ,{field:"dcTp", title:"<spring:message code='ser.lbl.dcTp' />", width:80, attributes:{"class":"ac"}             // 할인적용방식
                 ,template:"#=dcTpCdGrid(dcTp)#"
            }
            ,{field:"dcUseYn", title:"<spring:message code='ser.lbl.useYn' />", width:80, attributes:{"class":"ac"}
                 ,template:"#=useYnGrid(dcUseYn)#"
                 ,editor:function(container, options) {
                     $('<input name="dcUseYn" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         valuePrimitive:true
                         ,dataSource:useYnList
                         ,dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,optionLabel:" "
                     })
                     $('<span class="k-invalid-msg" data-for="dcUseYn"></span>').appendTo(container);
                 }
            }//사용여부
            ,{field:"dcApplyStartDt", title:"<spring:message code='ser.lbl.dcStartDt' />", width:100,format:"{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
            }//할인시작일자
            ,{field:"dcApplyEndDt", title:"<spring:message code='ser.lbl.dcEndDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}"
                , attributes:{"class":"ac"}
            }//할인종료일자
            ,{field:"lbrDcRate", title:"<spring:message code='ser.lbl.lbrDcRate' />", width:100, attributes:{"class":"ar"} , format:"{0:n2}"}        //공임할인률
            ,{field:"parDcRate", title:"<spring:message code='ser.lbl.parDcRate' />", width:100, attributes:{"class":"ar"} , format:"{0:n2}"}        //부품할인률
            ,{field:"dcDstinCd", title:"<spring:message code='ser.lbl.dcRole' />", width:80, attributes:{"class":"ac"}, template:"#=dcDstinCdGrid(dcDstinCd)#", hidden:true}        //할인권한
            ,{field:"dcPermTp", title:"<spring:message code='ser.lbl.dcPermTp' />", width:80, attributes:{"class":"ac"}, template:"#=setDcPermTpMap(dcPermTp)#", hidden:true}       //할인권한구분
        ]
    });

    if(isTablet == "true"){
        //SA 그리드 설정
        $("#gridSa").kendoExtGrid({
            gridId:"G-SER-0626-160703"
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
                           params["sPreFixId"] = "01";

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
                           ,dcCd:{type:"string", editable:false}
                           ,usrId:{type:"string"}
                           ,usrNm:{type:"string"}
                           ,deptCd:{type:"string"}
                           ,deptNm:{type:"string"}
                           ,tskCd:{type:"string"}
                           ,tskNm:{type:"string"}
                           ,useYn:{type:"string", editable:true}
                           ,sex:{type:"string", editable:false}
                       }
                   }
               }
            }
            ,height:200
            ,autoBind:false
            //,multiSelectWithCheckbox:true
            ,selectable:"row"
            ,appendEmptyColumn:true
            ,filterable:false                 // 필터링 기능 사용안함
            ,edit:function(e){

                var fieldName = $(e.container.find("input")[0]).attr("name");
                if(fieldName != "usrId" && fieldName != "usrNm"){
                    this.closeCell();
                }

            }
            ,columns:[
                {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                    ,sortable:false
                    ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"}
                ,{field:"usrId", title:"<spring:message code='ser.lbl.systemId' />", width:150//시스템번호
                    ,attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="usrId" data-name="<spring:message code='ser.lbl.tecId'/>" class="form_input" readonly="true" /><a href="#" onclick="tecManAdd()" >&nbsp;</a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="usrId"></span>')
                        .appendTo(container);
                    }
                }
                ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", sortable:false, width:100,attributes:{"class":"ac"}}//직원번호
                ,{field:"usrNm", title:"<spring:message code='ser.lbl.empNm' />", width:200
                    ,attributes:{"class":"al"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="usrNm" data-name="<spring:message code='ser.lbl.tecId'/>" class="form_input" readonly="true" /><a href="#" onclick="tecManAdd()" >&nbsp;</a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="usrNm"></span>')
                        .appendTo(container);
                    }
                }//사용자명
                ,{field:"sexCd", title:"<spring:message code='ser.lbl.userSex' />", sortable:false, width:80}                      // 성별
                ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", sortable:false, width:150}                     // 부서코드
                ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", sortable:false, width:150}                     // 부서코드
                ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", sortable:false, width:150}                       // 직무코드
                ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", sortable:false, width:150}                       // 직무명칭
                ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:100, attributes:{"class":"ac"}
                     ,template:"#=useYnGrid(useYn)#"
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
                    ,hidden:true
                } //사용여부
                ,{field:"preFixId", width:100,attributes:{"class":"ac"},  hidden:true }//사용자명
            ]

        });

    }else{
        //SA 그리드 설정
        $("#gridSa").kendoExtGrid({
            gridId:"G-SER-0626-174255"
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
                           params["sPreFixId"] = "01";

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
                           ,dcCd:{type:"string", editable:false}
                           ,usrId:{type:"string"}
                           ,usrNm:{type:"string"}
                           ,deptCd:{type:"string"}
                           ,deptNm:{type:"string"}
                           ,tskCd:{type:"string"}
                           ,tskNm:{type:"string"}
                           ,useYn:{type:"string", editable:true}
                           ,sex:{type:"string", editable:false}
                       }
                   }
               }
            }
            ,height:200
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,selectable:_selectable
            ,appendEmptyColumn:true
            ,filterable:false                 // 필터링 기능 사용안함
            ,edit:function(e){

                var fieldName = $(e.container.find("input")[0]).attr("name");
                if(fieldName != "usrId" && fieldName != "usrNm"){
                    this.closeCell();
                }

            }
            ,columns:[
                {field:"usrId", title:"<spring:message code='ser.lbl.systemId' />", width:150//시스템번호
                    ,attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="usrId" data-name="<spring:message code='ser.lbl.tecId'/>" class="form_input" readonly="true" /><a href="#" onclick="tecManAdd()" >&nbsp;</a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="usrId"></span>')
                        .appendTo(container);
                    }
                }
                ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", sortable:false, width:100,attributes:{"class":"ac"}}//직원번호
                ,{field:"usrNm", title:"<spring:message code='ser.lbl.empNm' />", width:200
                    ,attributes:{"class":"al"}
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="usrNm" data-name="<spring:message code='ser.lbl.tecId'/>" class="form_input" readonly="true" /><a href="#" onclick="tecManAdd()" >&nbsp;</a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="usrNm"></span>')
                        .appendTo(container);
                    }
                }//사용자명
                ,{field:"sexCd", title:"<spring:message code='ser.lbl.userSex' />", sortable:false, width:80}                      // 성별
                ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", sortable:false, width:150}                     // 부서코드
                ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", sortable:false, width:150}                     // 부서코드
                ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", sortable:false, width:150}                       // 직무코드
                ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", sortable:false, width:150}                       // 직무명칭
                ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:100, attributes:{"class":"ac"}
                     ,template:"#=useYnGrid(useYn)#"
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
                    ,hidden:true
                } //사용여부
                ,{field:"preFixId", width:100,attributes:{"class":"ac"},  hidden:true }//사용자명
            ]

        });
    }

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

tecManAdd = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0)
                    {
                        var grid = $("#gridSa").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var selectedVal = grid.dataItem(grid.select());
                        var checkVal = true;

                        // 중복값 체크
                        $.each(grid.dataSource._data, function(idx, obj){
                            if(data[0].usrId == obj.usrId){
                                checkVal = false;
                            }
                        });

                        if(checkVal){
                            selectedVal.set("usrId",data[0].usrId);
                            selectedVal.set("usrNm",data[0].usrNm);
                            selectedVal.set("tskCd",data[0].tskCd);
                            selectedVal.set("tskNm",data[0].tskNm);
                            selectedVal.set("deptCd",data[0].deptCd);
                            selectedVal.set("deptNm",data[0].deptNm);
                        }
                    }
                }
            }
        }
    });
}

tecManAddPopup = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0)
                    {
                        var gridData = $('#gridSa').data('kendoExtGrid').dataSource;
                        var checkVal = true;

                        // 중복값 체크
                        $.each(gridData._data, function(idx, obj){
                            if(data[0].usrId == obj.usrId){
                                checkVal = false;
                            }
                        });

                        if(checkVal){
                            gridData.insert(0,{
                                "sysNo":data[0].sysNo,
                                "usrId":data[0].usrId
                               ,"usrNm":data[0].usrNm
                               ,"deptCd":data[0].tskCd
                               ,"deptNm":data[0].tskNm
                               ,"tskCd":data[0].deptCd
                               ,"tskNm":data[0].deptNm
                               ,"useYn":"Y"
                               ,"preFixId":"01"
                           });
                        }
                    }
                }
            }
        }
    });
}

$(document).on("click", ".grid-checkbox-item", function(e){

    if(isTablet == "true"){
        var grid = $('#gridSa').data('kendoExtGrid');
        var row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");

        if($(this).is(":checked")){
            $(e.currentTarget).closest("tr").addClass("k-state-selected");
            $(row).addClass("k-state-selected");
        }else{
            $(e.currentTarget).closest("tr").removeClass("k-state-selected");
            $(row).removeClass("k-state-selected");
        }
    }
});

</script>


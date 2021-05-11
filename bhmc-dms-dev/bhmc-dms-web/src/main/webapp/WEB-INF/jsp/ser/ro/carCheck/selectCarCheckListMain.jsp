<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->
<!-- 차량점검현황 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.menu.carChkList" /><!-- 차량점검현황 --></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13091" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12970" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup id="carchecklistColGroup">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                    <td>
                        <input type="text" id="sCarRegNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carChkDocNo' /><!-- 차량점검번호 --></th>
                    <td>
                        <input type="text" id="sCarChkDocNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                    <td>
                        <input id="sRoTp" name="sRoTp" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.roDt' /></th><!-- ro일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRoFromDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRoToDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                 </tr>
                 <tr>
                    <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carChkUsrNm' /><!-- 점검확인자 --></th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="sRegUsrNm" class="form_input">
                            <a href="javascript:userSearch('USR');"></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.chkTp' /><!-- 차량점검 유형 --></th>
                    <td>
                        <input type="text" id="sChkTp" name="sChkTp" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carChkDate' /></th><!-- 점검확인시간  -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRegFromDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRegToDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 차량소유자 --></th>
                    <td>
                        <input type="text" id="sCarOwnerNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carChkNm' /><!-- 차량점검자 --></th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="sSaNm" class="form_input">
                            <a href="javascript:userSearch('SA');"></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carChkStat' /><!-- 차량점검 상태 --></th>
                    <td>
                        <input type="text" id="sCarChkStatCd" name="sCarChkStatCd" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carChkCompleteDate' /></th><!-- 점검완료시간 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sCompleteFromDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sCompleteToDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</section>
<input type="hidden" id="carChkDocNo" name="carChkDocNo" />
<input type="hidden" id="vinNo" name="vinNo" />


<!-- script -->
<script>

var userSearchPopupWin;

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
//ltsModelCdList.push( "${obj.ltsModelCd}");
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량점검유형
var carChkTpCdList = [];
<c:forEach var="obj" items="${carChkTpCdList}">
carChkTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carChkTpCdArr = dms.data.arrayToMap(carChkTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량점검상태
var carChkStatCdList = [];
<c:forEach var="obj" items="${carChkStatCdList}">
carChkStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carChkStatCdArr = dms.data.arrayToMap(carChkStatCdList, function(obj){return obj.cmmCd});

getLtsModelNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(ltsMap[val] != undefined)
        returnVal = ltsMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // 차량점검확인 일자
    $("#sRegFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });
    $("#sRegToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // 차량점검완료 일자
    $("#sCompleteFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });
    $("#sCompleteToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 점검유형
    $("#sChkTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carChkTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 점검상태
    $("#sCarChkStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carChkStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 엑셀 버튼
    $("#btnExcelExport").kendoButton({
        click:function(e){

            var param = $.extend(
                  {"sCarRegNo"       : $("#sCarRegNo").val()}
                 ,{"sCarChkDocNo"    : $("#sCarChkDocNo").val()}
                 ,{"sRoTp"           : $("#sRoTp").val()}
                 ,{"sRoFromDt"       : $("#sRoFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sRoToDt"         : $("#sRoToDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sVinNo"          : $("#sVinNo").val()}
                 ,{"sRegUsrNm"       : $("#sRegUsrNm").val()}
                 ,{"sChkTp"          : $("#sChkTp").val()}
                 ,{"sRegFromDt"      : $("#sRegFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sRegToDt"        : $("#sRegToDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sCarOwnerNm"     : $("#sCarOwnerNm").val()}
                 ,{"sSaNm"           : $("#sSaNm").val()}
                 ,{"sCarChkStatCd"   : $("#sCarChkStatCd").val()}
                 ,{"sCompleteFromDt" : $("#sCompleteFromDt").data("kendoExtMaskedDatePicker").value()}
                 ,{"sCompleteToDt"   : $("#sCompleteToDt").data("kendoExtMaskedDatePicker").value()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/ro/carCheck/selectCarCheckListCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"         : "carCheckService"
                            ,"templateFile"    : "carCheckList_Tpl.xlsx"
                            ,"fileName"        : "<spring:message code='ser.menu.carChkList' />.xlsx"
                            ,"sCarRegNo"       : $("#sCarRegNo").val()        //차량번호
                            ,"sCarChkDocNo"    : $("#sCarChkDocNo").val()  //차량번검번호
                            ,"sRoTp"           : $("#sRoTp").data("kendoExtDropDownList").value()    //RO유형
                            ,"sRoFromDt"       : $("#sRoFromDt").val()        //RO시간
                            ,"sRoToDt"         : $("#sRoToDt").val()            //RO시간
                            ,"sVinNo"          : $("#sVinNo").val()              //VIN
                            ,"sRegUsrNm"       : $("#sRegUsrNm").val()        //점검확인자
                            ,"sChkTp"          : $("#sChkTp").data("kendoExtDropDownList").value()   //차량점검유형
                            ,"sRegFromDt"      : $("#sRegFromDt").val()      //점검확인시간
                            ,"sRegToDt"        : $("#sRegToDt").val()          //점검확인시간
                            ,"sCarOwnerNm"     : $("#sCarOwnerNm").val()    //차량소유자
                            ,"sSaNm"           : $("#sSaNm").val()                //차량점검자
                            ,"sCarChkStatCd"   : $("#sCarChkStatCd").data("kendoExtDropDownList").value()//차량점검상태
                            ,"sCompleteFromDt" : $("#sCompleteFromDt").val() //점검완료시간
                            ,"sCompleteToDt"   : $("#sCompleteToDt").val()     //점검완료시간
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    $(document).on("click", ".linkPreDocNo", function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.carCheck' />", "<c:url value='/ser/ro/carCheck/selectCarCheckMain.do'/>?carChkDocNo="+selectedVal.carChkDocNo+"&vinNo="+selectedVal.vinNo, "VIEW-D-10343"); // RO Main
    });

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000088"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/carCheck/selectCarCheckList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarRegNo"] = $("#sCarRegNo").val();        //차량번호
                        params["sCarChkDocNo"] = $("#sCarChkDocNo").val();  //차량번검번호
                        params["sRoTp"] = $("#sRoTp").val();                //RO유형
                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();        //RO시간
                        params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();            //RO시간
                        params["sVinNo"] = $("#sVinNo").val();              //VIN
                        params["sRegUsrNm"] = $("#sRegUsrNm").val();        //점검확인자
                        params["sChkTp"] = $("#sChkTp").val();              //차량점검유형
                        params["sRegFromDt"] = $("#sRegFromDt").data("kendoExtMaskedDatePicker").value();      //점검확인시간
                        params["sRegToDt"] = $("#sRegToDt").data("kendoExtMaskedDatePicker").value();          //점검확인시간
                        params["sCarOwnerNm"] = $("#sCarOwnerNm").val();    //차량소유자
                        params["sSaNm"] = $("#sSaNm").val();                //차량점검자
                        params["sCarChkStatCd"] = $("#sCarChkStatCd").val();//차량점검상태
                        params["sCompleteFromDt"] = $("#sCompleteFromDt").data("kendoExtMaskedDatePicker").value(); //점검완료시간
                        params["sCompleteToDt"] = $("#sCompleteToDt").data("kendoExtMaskedDatePicker").value();     //점검완료시간

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,preChkDt:{type:"date"}
                        ,carChkStartDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,carChkCmptDt:{type:"date"}
                        ,carChkStartDt:{type:"date"}
                        ,carChkPrintDt:{type:"date"}
                        ,regDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,carChkStartDtFormat:{type:"date"}
                        ,roDtFormat:{type:"date"}
                        ,carChkCmptDtFormat:{type:"date"}
                        ,carChkStartDtFormat:{type:"date"}
                        ,carChkPrintDtFormat:{type:"date"}
                        ,regDtFormat:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.carChkStartDtFormat = kendo.parseDate(elem.carChkStartDt, "<dms:configValue code='dateFormat' />");
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                            elem.carChkCmptDtFormat = kendo.parseDate(elem.carChkCmptDt, "<dms:configValue code='dateFormat' />");
                            elem.carChkStartDtFormat = kendo.parseDate(elem.carChkStartDt, "<dms:configValue code='dateFormat' />");
                            elem.carChkPrintDtFormat = kendo.parseDate(elem.carChkPrintDt, "<dms:configValue code='dateFormat' />");
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:520
        ,editable:false
        ,selectable:"row"
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());
                var carChkDocNo = selectedVal.carChkDocNo;
                var vinNo = selectedVal.vinNo;

                $("#carChkDocNo").val(carChkDocNo);
                $("#vinNo").val(vinNo);
            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100} //차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150} //VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100} //소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100} //방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100} //차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:200} //모델명칭
            ,{field:"preRunDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100
                , attributes :{"class":"ar"}, format:"{0:n0}"}    //현주행거리
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.totRunDistVal' />", width:100
                , attributes :{"class":"ar"}, format:"{0:n0}"} //실제주행거리
            ,{field:"carChkStatNm", title:"<spring:message code='ser.lbl.carChkStat' />", width:100, attributes:{"class":"ac"}} //차량점검상태
            ,{field:"carChkDocNo", title:"<spring:message code='ser.lbl.carChkDocNo' />", width:150
                , attributes:{"class":"ac"}
                , template:function(dataItem){
                     var spanObj = "<a href='#' class='linkPreDocNo'>"+dataItem.carChkDocNo+"</a>";
                     return spanObj;
                 }
             }//차량점검번호
            ,{field:"chkTpNm", title:"<spring:message code='ser.lbl.chkTp' />", width:100, attributes:{"class":"ac"}} //차량점검유형
            ,{field:"regDtFormat", title:"<spring:message code='ser.lbl.carChkDate' />", width:130
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//점검확인시간
            ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.carChkUsrNm' />", width:100} //점검확인자
            ,{field:"carChkPrintDtFormat", title:"<spring:message code='ser.lbl.carChkPrintDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.carChkPrintDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//차량점검프린트시간
            ,{field:"updtDtFormat", title:"<spring:message code='ser.lbl.carChkUpdtDt' />", width:130
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//차량점검변경시간
            ,{field:"updtUsrNm", title:"<spring:message code='ser.lbl.carChkUpdtUsrNm' />", width:120}//차량점검변경자
            ,{field:"saNm", title:"<spring:message code='ser.lbl.carChkNm' />", width:100} //차량점검자
            ,{field:"carChkStartDtFormat", title:"<spring:message code='ser.lbl.carChkStartDate' />", width:130
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.carChkStartDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//차량점검시작시간
            ,{field:"carChkCmptDtFormat", title:"<spring:message code='ser.lbl.carChkCompleteDate' />", width:130
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.carChkCmptDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }//차량점검완료시간
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110, attributes:{"class":"ac"}} // RO번호
            ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100, attributes:{"class":"ac"}} // RO유형
            ,{field:"roDtFormat", title:"<spring:message code='ser.lbl.roDt' />", width:130
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= dms.string.strNvl(kendo.toString(data.roDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
            }// RO확인일자
            ,{field:"roRegUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100} // 위탁인
            ,{field:"carChkRemark", title:"<spring:message code='ser.lbl.carChkRemark' />", width:200} //차량점검비고
         ]
    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#carchecklistColGroup col");
            $(colEmt[0]).css("width","7%");
            $(colEmt[2]).css("width","9%");
            $(colEmt[4]).css("width","8%");
            $("#grid").parents(".table_grid").attr("style","width:968px !important; max-width:968px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

userSearch = function(gubun){
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
                    if(data.length > 0) {
                        if(gubun == "USR"){
                            $("#sRegUsrNm").val(data[0].usrNm)
                        }else{
                            $("#sSaNm").val(data[0].usrNm)
                        }
                    }
                }
            }
        }
    });
}
</script>
<!-- //script -->


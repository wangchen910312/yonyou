<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div id="resizableContainer">
    <div class="content_v1">
    <!-- 세차관리 -->
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11686" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11685" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11684" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
            </div>
        </div>

        <form id="workProcessForm" method="POST" action="/">
        <div class="header_area">
            <div class="table_form" role="search" data-btnid="btnSearch"">
                <table>
                    <caption></caption>
                    <colgroup id="carWashColGroup">
                        <col style="width:9%;">
                        <col style="width:13%;">
                        <col style="width:9%;">
                        <col style="width:19%;">
                        <col style="width:9%;">
                        <col style="width:12%;">
                        <col style="width:9%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carNo" /></th><!--차량번호  -->
                            <td>
                                <input id="sCarRegNo" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.preInsDt" /></th><!--사전점검일자  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sPreChkFromDt" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sPreChkToDt" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWasher" /></th><!--세차자  -->
                            <td>
                                <input id="sCarWashPrsnNm" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWashStartDt" /></th><!--세차시작시간  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCarWashStartFromDt" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCarWashStartToDt" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!--VIN  -->
                            <td>
                                <input id="sVinNo" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carlineNm" /></th><!-- 차종명 -->
                            <td>
                                <input id="sCarlineNm" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWashStat" /></th><!--세차상태  -->
                            <td>
                                <input id="sCarWashStatCd" type="text" class="form_comboBox" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carWashEndDt" /></th><!--세차완료시간  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCarWashEndFromDt" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCarWashEndToDt" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- RO작업 배정 상세 타이틀 시작 -->
        <!-- 그리드 시작 -->
        <div class="header_area">
            <div class="table_grid">
                <div id="roListGrid"></div>
            </div>
        </div>

        <!-- RO작업 배정 상세 타이틀 시작 -->
        <div class="header_area">
             <!-- 세차 시작 -->
            <div class="mt5">
                <div class="workProgress_manage">
                    <div class="top_area">
                        <ul class="txt_input">
                            <li>
                                <span class="bu_required"><spring:message code="ser.lbl.carWasher" /></span><!-- 세차자 -->
                                <div class="required_area">
                                    <div class="form_search">
                                        <input id="saNm3" name="saNm3" type="text" data-json-obj="true" class="form_input">
                                        <a href="javascript:techmanPopup('3');"></a>
                                    </div>
                                    <input id="saId3" name="saId3" type="hidden" data-json-obj="true" />
                                </div>
                            </li>
                        </ul>
                        <div class="btn_right">
                            <dms:access viewId="VIEW-D-11683" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v2" id="W1" data-for="wrk02" onclick="validWorkProcess('W1','saNm3','saId3','03')"><spring:message code="ser.btn.carWashStart" /><!-- 세차시작--></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11682" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v2" id="W2" data-for="wrk02" onclick="validWorkProcess('W2','saNm3','saId3','03')"><spring:message code="ser.btn.carWashEnd" /><!-- 세차완료 --></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11681" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_s_v2" id="W3" data-for="wrk02" onclick="validWorkProcess('W3','saNm3','saId3','03')"><spring:message code="ser.btn.carWashCancel" /> <!-- 세차취소 --></button>
                            </dms:access>
                        </div>
                    </div>
                </div>

            </div>
            <!-- 세차 종료-->
        </div>
    </form>
</div>
<!-- //작업진도관리 -->

<!-- 우측 메뉴 -->
<c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectWorkProcessKanban.jsp" />
<!-- //우측 메뉴 -->

<!-- script -->
<script>

var popupWindow;
var row = 0;
var row1 = 0;

//진행상태 Array
var progressStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//세차상태 Array
var carWashStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${carWashStatList}">
carWashStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//세차상태 map
var carWashStatMap = dms.data.arrayToMap(carWashStatList, function(obj){return obj.cmmCd;});

//공통코드:세차취소구분
var carWashCancCdList = [];
<c:forEach var="obj" items="${carWashCancCdList}">
carWashCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//세차상태 map
var carWashCancCdMap = dms.data.arrayToMap(carWashCancCdList, function(obj){return obj.cmmCd;});

carWashStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(carWashStatMap[val] != undefined)
        returnVal = carWashStatMap[val].cmmCdNm;
    }
    return returnVal;
};

carWashCancCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(carWashCancCdMap[val] != undefined)
        returnVal = carWashCancCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//버튼 - 저장
function validWorkProcess(stat,saNm,saId,type) {

    var roGrid = $("#roListGrid").data("kendoExtGrid");
    row1 = roGrid.select().index();
    var roDataItem = roGrid.dataItem(roGrid.select());

    if(roDataItem==null){
        dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
        return;
    }

    if($("#saId").val() == ""){
        dms.notification.info("<spring:message code='ser.lbl.carWasher' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
        return;
    }

    if(stat === "W3"){
        carWashCancelPopup = dms.window.popup({
            windowId:"carWashCancelPopup"
            , title:"<spring:message code='ser.btn.carWashCancel'/>"   // 세차취소
            , width:400
            , height:200
            , content:{
                url:"<c:url value='/ser/ro/carWash/selectCarWashCancelPopup.do'/>"
                ,data:{
                    "callbackFunc":function(data){
                        var jsonData = {
                            "roGrpNo":roDataItem.roGrpNo
                            ,"carWashPrsnCd":$("#"+saId).val()
                            ,"carWashPrsnNm":$("#"+saNm).val()
                            ,"wrkStatCd":stat
                            ,"type":type
                            ,"carWashCancReasonCd":data.carWashCancReasonCd
                            ,"carWashCancReasonCont":data.carWashCancReasonCont
                        }
                        saveWorkProcess(stat,saNm,saId,type,jsonData);
                    }
                }
            }
        });
    } else {
        var jsonData = {
            "roGrpNo":roDataItem.roGrpNo
            ,"carWashPrsnCd":$("#"+saId).val()
            ,"carWashPrsnNm":$("#"+saNm).val()
            ,"wrkStatCd":stat
            ,"type":type
        }
        saveWorkProcess(stat,saNm,saId,type,jsonData);
    }
};


function saveWorkProcess(stat,saNm,saId,type,jsonData){
    $.ajax({
        url:"<c:url value='/ser/ro/workProcess/insertWorkProcess.do' />",
        data:JSON.stringify(jsonData),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {
            $("#roListGrid").data("kendoExtGrid").dataSource.page(1);
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#roListGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){
            $("#workProcessForm").get(0).reset();
            row = 0;
            row1 = 0;
            $("#roListGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            dms.ajax.excelExport({
                "beanName"              :"repairOrderService"
                ,"templateFile"         :"CarWashStatusList_Tpl.xlsx"
                ,"fileName"             :"<spring:message code='ser.menu.carWashMng' />.xlsx"
                ,"sPreChkFromDt"        :$("#sPreChkFromDt").val()
                ,"sPreChkToDt"          :$("#sPreChkToDt").val()
                ,"sVinNo"               :$("#sVinNo").val()
                ,"sCarWashPrsnNm"       :$("#sCarWashPrsnNm").val()
                ,"sCarRegNo"            :$("#sCarRegNo").val()
                ,"sCarWashStatCd"       :$("#sCarWashStatCd").data("kendoExtDropDownList").value()
                ,"sCarWashStartFromDt"  :$("#sCarWashStartFromDt").val()
                ,"sCarWashStartToDt"    :$("#sCarWashStartToDt").val()
                ,"sCarWashEndFromDt"    :$("#sCarWashEndFromDt").val()
                ,"sCarWashEndToDt"      :$("#sCarWashEndToDt").val()
                ,"sCarlineNm"           :$("#sCarlineNm").val()
            });
        }
    });

    $(".btn_s").each(function(){
        $(this).kendoButton({
            enable:false
        });
    });

    // 사전점검일자(From)
    $("#sPreChkFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPreChkFromDt}"
    });

    // 사전점검일자(From)
    $("#sPreChkToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPreChkToDt}"
    });

    // 세차시작시간(From)
    $("#sCarWashStartFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 세차시작시간(To)
    $("#sCarWashStartToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 세차완료시간(From)
    $("#sCarWashEndFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 세차완료시간(To)
    $("#sCarWashEndToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sCarWashStatCd").kendoExtDropDownList({
        dataSource:carWashStatList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
    });

    //그리드 설정
    $("#roListGrid").kendoExtGrid({
        gridId:"G-SER-1011-000089"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/carWash/selectCarWashList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarWashStatCd"] = $("#sCarWashStatCd").data("kendoExtDropDownList").value();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        params["sCarWashPrsnNm"] = $("#sCarWashPrsnNm").val();
                        params["sPreChkFromDt"] = $("#sPreChkFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sPreChkToDt"] = $("#sPreChkToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarWashStartFromDt"] = $("#sCarWashStartFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarWashStartToDt"] = $("#sCarWashStartToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarWashEndFromDt"] = $("#sCarWashEndFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarWashEndToDt"] = $("#sCarWashEndToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarlineNm"] = $("#sCarlineNm").val();

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
                        ,carRegNo:{type:"string"}
                        ,vinNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,saNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,carWashStartDt:{type:"date"}
                        ,carWashEndDt:{type:"date"}
                        ,roStatCd:{type:"string"}
                        ,paintStatCd:{type:"string"}
                        ,qtTestStatCd:{type:"string"}
                        ,carWashStatCd:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            //세차대기
            if(dataItem.carWashStatCd === "W4"){
                $('[data-for="wrk02"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });
                $("#W1").data("kendoButton").enable(true);

                $("#saId3").val("${loginUsrId}");
                $("#saNm3").val("${loginUsrNm}");
            //세차시작
            }else if(dataItem.carWashStatCd === "W1"){
                $('[data-for="wrk02"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });
                $("#W2").data("kendoButton").enable(true);
                $("#W3").data("kendoButton").enable(true);
            // 세차완료
            }else if(dataItem.carWashStatCd === "W2"){
                $('[data-for="wrk02"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });
                $("#W3").data("kendoButton").enable(true);
            }else if(dataItem.carWashStatCd === "W3"){
                $('[data-for="wrk02"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });
                $("#W1").data("kendoButton").enable(true);

                $("#saId3").val("${loginUsrId}");
                $("#saNm3").val("${loginUsrNm}");
            } else {
                $('[data-for="wrk02"]').each(function(){
                    $(this).data("kendoButton").enable(false);
                });
                $("#W2").data("kendoButton").enable(false);
                $("#W3").data("kendoButton").enable(false);
            }
        }
        ,height:330
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:"row"
        ,dataBound:function(e) {
            e.sender.select(e.sender.tbody.find("tr")[row1]);
        }
        ,columns:[
              {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100
                  ,attributes:{"class":"ac"}
              }//차량등록번호
              ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150
                  ,attributes:{"class":"ac"}
              }//vin번호
              ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", sortable:false, width:90
                  ,attributes:{"class":"ac"}
              }//소유자
              ,{field:"driverNm", title:"<spring:message code='ser.lbl.driver' />", sortable:false, width:90
                  ,attributes:{"class":"ac"}
              }//운전자
              ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", sortable:false, width:90
                  ,attributes:{"class":"ac"}
              }//차종명
              ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", sortable:false, width:150}  // 모델명
              ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", sortable:false, width:80
                  ,attributes:{"class":"ar"}
                  ,format:"{0:n0}"
              }//주행거리
              ,{field:"runDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", sortable:false, width:80
                  ,attributes:{"class":"ar"}
                  ,format:"{0:n0}"
              }//현재주행거리
              ,{field:"preChkDt", title:"<spring:message code='ser.lbl.preInsDt' />", width:120
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
              }//사전점검시간
              ,{field:"carWashStatCd", title:"<spring:message code='ser.lbl.carWashStat' />", sortable:false, width:120
                  ,attributes:{"class":"ac"}
                  ,template:"#=carWashStatGrid(carWashStatCd)#"
              }//세차상태
              ,{field:"carWashPrsnNm", title:"<spring:message code='ser.lbl.carWasher' />", sortable:false, width:100
                  ,attributes:{"class":"ac"}
              }//세차자
              ,{field:"carWashStartDt", title:"<spring:message code='ser.lbl.carWashStartDt' />", width:120
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
              }//세차시작시간
              ,{field:"carWashEndDt", title:"<spring:message code='ser.lbl.carWashEndDt' />", width:120
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
              }//세차완료시간
              ,{field:"carWashCancPrsnNm", title:"<spring:message code='ser.lbl.carWashCancPrsnNm' />", sortable:false, width:100
                  ,attributes:{"class":"ac"}
              }//세차취소자
              ,{field:"carWashCancDt", title:"<spring:message code='ser.lbl.carWashCancDt' />", width:120
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
              }//세차취소시간
              ,{field:"carWashCancReasonCd", title:"<spring:message code='ser.lbl.carWashCancReason' />", sortable:false, width:120
                  ,attributes:{"class":"ac"}
                  ,template:"#=carWashCancCdGrid(carWashCancReasonCd)#"
              }//세차취소원인
              ,{field:"roGrpNo", hidden:true}
              ,{field:"carWashPrsnCd", hidden:true}
          ]
    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#carWashColGroup col");
            $(colEmt[0]).css("width","6%");
            $(colEmt[1]).css("width","13%");
            $(colEmt[2]).css("width","8%");
            $(colEmt[3]).css("width","23%");
            $(colEmt[4]).css("width","6%");
            $(colEmt[5]).css("width","12%");
            $(colEmt[6]).css("width","9%");
            $(".table_grid").attr("style","width:938px !important; max-width:938px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});


var tecSearchPopup;
techmanPopup = function(number) {
    tecSearchPopup = dms.window.popup({
        windowId:"teckManFnSearchWin"
        , title:"<spring:message code='ser.lbl.serviceUserSearch' />"   // 정비사용자 조회
        , content:{
            url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
            , data:{
                "autoBind":true
                , "callbackFunc":function(jsonObj) {

                    if(jsonObj.length > 0) {
                        if(number=='1'){
                            $("#saId1").val(jsonObj[0].tecId);
                            $("#saNm1").val(jsonObj[0].tecNm);
                        }else if(number=='2'){
                            $("#saId2").val(jsonObj[0].tecId);
                            $("#saNm2").val(jsonObj[0].tecNm);
                        }else {
                            $("#saId3").val(jsonObj[0].tecId);
                            $("#saNm3").val(jsonObj[0].tecNm);
                        }
                }
            }
        }
        }
    });
}

</script>
<!-- //script -->

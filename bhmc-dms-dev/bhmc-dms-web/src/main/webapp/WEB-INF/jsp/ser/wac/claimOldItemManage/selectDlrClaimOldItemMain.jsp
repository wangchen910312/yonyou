<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- 클레임 고품 요청 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12993" hasPermission="${dms:getPermissionMask('READ')}">
                        <%-- <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  --> --%>
                    </dms:access>
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </div>
                <div class="btn_right">
                     <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    <dms:access viewId="VIEW-D-12992" hasPermission="${dms:getPermissionMask('READ')}">
                     <%--    <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button> --%>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11995" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <form id="form">
            <!-- 조회 조건 시작 -->
                <div class="table_form" role="search" data-btnid="btnSearch">
                     <table>
                        <caption></caption>
                            <colgroup id="dlrclaimColGroup">
                                <col style="width:9%;">
                                <col style="width:19%;">
                                <col style="width:9%;">
                                <col style="width:15%;">
                                <col style="width:9%;">
                                <col style="width:14%;">
                                <col style="width:10%;">
                                <col style="width:14%;">
                            </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.reqDt" /></th><!--요청일자  -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sReqFromDt" value="" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sReqToDt" value="" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!--VIN NO  -->
                                <td>
                                    <input id="sVinNo" type="text"  class="form_input">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.oldItemStatCd" /></th> <!-- 부품상태 -->
                                <td>
                                    <input type="text" id="sOlditemStatCd" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!--클레임번호  -->
                                <td>
                                    <input id="sClaimDocNo" type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.OldItemstatNm" /></th><!--상태  -->
                                <td>
                                    <input id="sStatCd" type="text"  class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.oitemCd" /></th><!--부품코드  -->
                                <td>
                                    <input id="sItemCd" type="text"  class="form_input">
                                </td>
                                <th scope="row"><spring:message code="ser.oldItemDdctYn" /></th> <!-- 공제여부 -->
                                <td>
                                    <input type="text" id="sDdctYn" class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.reqUsrNm" /></th>
                                <td>
                                    <input id="sReqNm" type="text"  class="form_input">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <!-- 조회 조건 종료 -->

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>
    </div>
</div>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">


//요청상태 Array
var statCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${statCdList}">
<c:if test='${obj.remark5 eq "Y" }'>
  statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
//요청상태 Map
var statCdMap = dms.data.arrayToMap(statCdList, function(obj){ return obj.cmmCd; });

//공통코드:사용여부
var useYnCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnCdList, function(obj){return obj.cmmCd;});

//고품조회조건
var searchList = [];
<c:forEach var="obj" items="${searchList}">
<c:if test="${obj.remark2 eq 'Y' }" >
  searchList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>

//고품조회조건 Map
var searchMap = dms.data.arrayToMap(searchList, function(obj){ return obj.cmmCd; });

//고품부품상태
var itemStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemStatCdList}">
itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품부품상태 Map
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });

//고품지불방식
var oldItemPaymCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${oldItemPaymCdList}">
oldItemPaymCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품지불방식 Map
var oldItemPaymCdMap = dms.data.arrayToMap(oldItemPaymCdList, function(obj){ return obj.cmmCd; });

//부서코드 Array
var deptCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//부서코드 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.cmmCd; });



$(document).ready(function() {

    //사용여부
    setUseYnCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(useYnMap[val] != undefined)
            returnVal = useYnMap[val].cmmCdNm;
        }
        return returnVal;
    };

    // 요청상태
       statCdGrid = function(val){
           var returnVal = "";
           if(dms.string.strNvl(val) != ""){
               if(statCdMap[val] != undefined){
                   returnVal =  statCdMap[val].cmmCdNm;
               }
           }
           return returnVal;
       };

        // 요청부서
       deptCdGrid = function(val){
           var returnVal = "";
           if(dms.string.strNvl(val) != ""){
               if(deptCdMap[val] != undefined){
                   returnVal =  deptCdMap[val].cmmCdNm;
               }
            }
           return returnVal;
       };

        // 고품조회조건
       setSearchMap = function(val){
           var returnVal = "";
           if(dms.string.strNvl(val) != ""){
               if(searchMap[val] != undefined){
                   returnVal =  searchMap[val].cmmCdNm;
               }
            }
           return returnVal;
       };

        // 고품부품상태
       setItemStatCdMap = function(val){
           var returnVal = "";
           if(dms.string.strNvl(val) != ""){
               if(itemStatCdMap[val] != undefined){
                   returnVal =  itemStatCdMap[val].cmmCdNm;
               }
            }
           return returnVal;
       };

        // 고품지불방식
       setOldItemPaymCdMap = function(val){
           var returnVal = "";
           if(dms.string.strNvl(val) != ""){
               if(oldItemPaymCdMap[val] != undefined){
                   returnVal =  oldItemPaymCdMap[val].cmmCdNm;
               }
            }
           return returnVal;
       };
        // 접수여부
       setUseYnMap = function(val){
           var returnVal = "";
           if(dms.string.strNvl(val) != ""){
               if(useYnMap[val] != undefined){
                   returnVal =  useYnMap[val].cmmCdNm;
               }
            }
           return returnVal;
       };


    //조회조건 - RO유형
    $("#sStatCd").kendoExtDropDownList({
         dataSource:statCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 공제여부
    $("#sDdctYn").kendoExtDropDownList({
         dataSource:useYnCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 부품상태
    $("#sOlditemStatCd").kendoExtDropDownList({
        dataSource:itemStatCdList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

      //초기화
    $("#btnReset").kendoButton({
        click:function(e){

            $("#form").get(0).reset();
            $("#sReqFromDt").data("kendoExtMaskedDatePicker").value("${sReqFromDt}");
            $("#sReqToDt").data("kendoExtMaskedDatePicker").value("${sReqToDt}");

        }
    });

  //엑셀버튼
    $("#btnExcelExport").kendoButton({

        click:function(e){

            var param = $.extend(
                 {"sReqFromDt"           :$("#sReqFromDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sReqToDt"             :$("#sReqToDt").data("kendoExtMaskedDatePicker").value()}
                ,{"sVinNo"               :$("#sVinNo").val()}
                ,{"sStatCd"              :$("#sStatCd").val()}
                ,{"sClaimDocNo"          :$("#sClaimDocNo").val()}
                ,{"sItemCd"              :$("#sItemCd").val()}
                ,{"sReqNm"               :$("#sReqNm").val()}
                ,{"sOlditemStatCd"       :$("#sOlditemStatCd").val()}
                ,{"sDdctYn"              :$("#sDdctYn").val()}
            );

            // 엑셀다운로드 row수가 만건이 넘어가지 못하도록 체크
            $.ajax({
                url:"<c:url value='/ser/wac/claimOldItemManage/selectDlrClaimOldItemCnt.do' />"
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
                            "beanName"              :"claimOldItemManageService"
                            ,"templateFile"         :"OlditemRequestList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='ser.title.oldItemReqSearch' />.xlsx"
                            ,"sReqFromDt"           :$("#sReqFromDt").val()
                            ,"sReqToDt"             :$("#sReqToDt").val()
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sStatCd"              :$("#sStatCd").data("kendoExtDropDownList").value()
                            ,"sClaimDocNo"          :$("#sClaimDocNo").val()
                            ,"sItemCd"              :$("#sItemCd").val()
                            ,"sReqNm"               :$("#sReqNm").val()
                            ,"sOlditemStatCd"       :$("#sOlditemStatCd").data("kendoExtDropDownList").value()
                            ,"sDdctYn"              :$("#sDdctYn").data("kendoExtDropDownList").value()
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {'roTp':'','brandCd':'','useYn':'Y'
             });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //globalNotification.show("저장할 정보가 없습니다.", "info");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/rateMaster/multiRateMasters.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    $("#sReqFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sReqFromDt}"
    });

    $("#sReqToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sReqToDt}"
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000149"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemsRequest.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqFromDt"]     = $("#sReqFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqToDt"]       = $("#sReqToDt").data("kendoExtMaskedDatePicker").value();
                        params["sVinNo"]         = $("#sVinNo").val();
                        params["sStatCd"]        = $("#sStatCd").val();
                        params["sClaimDocNo"]    = $("#sClaimDocNo").val();
                        params["sItemCd"]        = $("#sItemCd").val();
                        params["sReqNm"]         = $("#sReqNm").val();
                        params["sOlditemStatCd"] = $("#sOlditemStatCd").val();
                        params["sDdctYn"]        = $("#sDdctYn").val();

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
                         rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,dlrNm:{type:"string", editable:false}
                        ,atqReqNo:{type:"string", editable:false}
                        ,claimStartDt:{type:"date", editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false}
                        ,claimQty:{type:"number", editable:false}
                        ,collcQty:{type:"number", editable:false}
                        ,itemUnitCd:{type:"string", editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,runDistVal:{type:"number", editable:false}
                        ,reqNm:{type:"string", editable:false}
                        ,reqDt:{type:"date", editable:false}
                        ,reqDeptCd:{type:"string", editable:false}
                        ,giDeptCd:{type:"string", editable:false}
                        ,controllDt:{type:"date", editable:false}
                        ,olditemStatCd:{type:"string", editable:false}
                        ,ddctDt:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.claimStartDt = kendo.parseDate(elem.claimStartDt, "<dms:configValue code='dateFormat' />");
                            elem.reqDt = kendo.parseDate(elem.reqDt, "<dms:configValue code='dateFormat' />");
                            elem.controllDt = kendo.parseDate(elem.controllDt, "<dms:configValue code='dateFormat' />");
                            elem.ddctDt = kendo.parseDate(elem.ddctDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,multiSelectWithCheckbox:false
        ,appendEmptyColumn:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"statNm", title:"<spring:message code='ser.lbl.OldItemstatNm' />", width:100//상태
                ,attributes:{"class":"ac"}
                //,template:"#=statCdGrid(statCd)#"
            }
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}//딜러사
            ,{field:"dlrNm", title:"<spring:message code='sal.lbl.dlrNm' />", width:120, attributes:{"class":"al"}}//딜러명칭
            ,{field:"atqReqNo", title:"<spring:message code='ser.lbl.requestNo' />", width:120, attributes:{"class":"al"}}//신청번호
            ,{field:"claimStartDt", title:"<spring:message code='ser.lbl.receivableDt' />", width:100,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (claimStartDt !== null ){# #= kendo.toString(data.claimStartDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }//클레임일자
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:100, attributes:{"class":"al"}}//클레임번호
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.oitemCd' />", width:100, attributes:{"class":"al"}}//부품코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, attributes:{"class":"al"}}//부품명칭
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.qty' />", width:80, format:"{0:n0}",attributes:{"class":"ar"}}//수량
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}}//회수수량
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:100, attributes:{"class":"ac"}}//단위
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:160, attributes:{"class":"al"}}//VIN
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100, format:"{0:n0}", attributes:{"class":"ar"}}//주행거리
            ,{field:"reqNm", title:"<spring:message code='ser.lbl.reqUsrNm' />", width:100,attributes:{"class":"al"}}//요청자
            ,{field:"reqDt", title:"<spring:message code='ser.lbl.reqDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (reqDt !== null ){# #= kendo.toString(data.reqDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }//요청일자
            ,{field:"reqDeptNm", title:"<spring:message code='ser.lbl.reqDept' />", width:100
                ,attributes:{"class":"ac"}
                //,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
            ,{field:"controllUsrNm", title:"<spring:message code='ser.lbl.outUser' />", width:100,attributes:{"class":"al"}}//출고자
            ,{field:"controllDt", title:"<spring:message code='ser.lbl.outDt' />", width:100//출고일
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (controllDt !== null ){# #= kendo.toString(data.controllDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }
            ,{field:"ddctYnNm", title:"<spring:message code='ser.oldItemDdctYn' />", width:80, attributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                //,template:"#=setUseYnCd(ddctYn)#"
            }     //공제여부
            ,{field:"ddctDt", title:"<spring:message code='ser.lbl.olditemDdctDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (ddctDt !== null ){# #= kendo.toString(data.ddctDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }//공제일자
            ,{field:"olditemStatNm", title:"<spring:message code='ser.lbl.oldItemStatCd' />", width:100//상태
                ,attributes:{"class":"ac"}
                //,template:"#=setItemStatCdMap(olditemStatCd)#"
            }//부품상태
        ]
    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#dlrclaimColGroup col");
            $(colEmt[0]).css("width","6%");
            $(colEmt[1]).css("width","23%");
            $("#grid").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

</script>








<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 클레임 고품 요청 관리 -->
 <div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.oldItemReqMng" />(DCS)</h1><!-- 고품요청관리 -->
                <div class="btn_right">
				<dms:access viewId="VIEW-I-12482" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m" id="btnExcelImport"><spring:message code="global.btn.excelImport" /></button>
				</dms:access>
                    <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
				<dms:access viewId="VIEW-I-12485" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="btnSave"><spring:message code="ser.btn.reqSend" /></button><!-- 요청전송 -->
				</dms:access>
				<dms:access viewId="VIEW-I-12484" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
				</dms:access>
				<dms:access viewId="VIEW-I-12483" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
				</dms:access>
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                    <tbody>
                        <tr>
                            <th scope="row">
                                <input type="text" id="sField" name="sField" class="form_comboBox" value="01" style="width:80%"/>
                            </th><!--요청일자  -->
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

                            <th scope="row"><spring:message code="ser.lbl.dlrCd" /></th><!--딜러  -->
                            <td>
                                <input id="sDlrCd" type="text"  class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.OldItemstatNm" /></th><!--부품상태  -->
                            <td>
                                <input id="sStatCd" type="text"  class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!--클레임번호  -->
                            <td>
                                <input id="sClaimDocNo" type="text" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.oitemCd" /></th><!--부품코드  -->
                            <td>
                                <input id="sItemCd" type="text"  class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.reqDept' /></th><!--요청부서  -->
                            <td>
                                <input id="sReqDeptCd" type="text" class="form_comboBox">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid" class="grid"></div>
            </div>
            <!-- 그리드 종료 -->

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <form id="oldItemform" method="POST" action="/">
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.requestNo" /></th><!--需求编号(요청번호)  -->
                                <td class="readonly_area">
                                    <input id="atqReqNo" name="atqReqNo" value="" class="form_input" readonly>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.reqDt" /></span></th><!--요청일자  -->
                                <td>
                                    <input required id="reqDt" name="reqDt" data-name="<spring:message code="ser.lbl.reqDt" />" value="" class="form_datepicker ac">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.reqStatCd" /></span></th><!--요청상태  -->
                                <td>
                                    <label class="label_check"><input type="radio" name="reqStatCd" class="form_check" checked="checked" value="02"> <spring:message code="ser.lbl.recReq" /></label><!-- 회수요청 -->
                                    <label class="label_check"><input type="radio" name="reqStatCd" class="form_check" value="03"> <spring:message code="ser.lbl.scrapReq" /></label><!-- 페기요청 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.requestUsr' /></span></th><!--요청자  -->
                                <td>
                                    <input type="hidden" id="reqId" name="reqId"/>
                                    <input required id="reqNm" name="reqNm" type="text" data-name="<spring:message code="sal.lbl.requestUsr" />" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.warInfo' /></th><!--주의사항  -->
                                <td rowspan="2">
                                    <textarea rows="2" id="warningInfo" name="warningInfo" class="form_textarea" >请索赔员妥善保管快递单,便于核对</textarea>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.recoveryCont' /></th><!-- 회수건의 -->
                                <td rowspan="2">
                                    <textarea rows="2" id="reqReasonCont" name="reqReasonCont" class="form_textarea">务必在3个工作日内将旧件寄至以上单位 (默认)</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.reqDept' /></th><!--요청부서  -->
                                <td>
                                    <input id="reqDeptCd" name="reqDeptCd" type="text" value="" class="form_comboBox"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required used"><spring:message code='ser.lbl.rcipNm' /></span></th><!--수취인  -->
                                <td>
                                    <input type="text" required id="rcipId" name="rcipId" data-name="<spring:message code='ser.lbl.rcipNm' />" value="" class="form_input"/>
                                </td>
                                <th scope="row"><span class="bu_required used"><spring:message code='ser.lbl.olditemReqHp' /></span></th> <!-- 신청인연락처 -->
                                <td>
                                    <input type="text" required id="reqTelNo" name="reqTelNo" data-name="<spring:message code='ser.lbl.olditemReqHp' />" class="form_input numberic" />
                                </td>
                                <th scope="row"><span class="bu_required used"><spring:message code="ser.lbl.oldItemAcceptHp" /></span></th><!-- 접수자연락처 -->
                                <td>
                                    <input type="text" required id="rcipTelNo" name="rcipTelNo" data-name="<spring:message code="ser.lbl.telCd" />" class="form_input numberic" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.trsfCmpCd" /></th><!--快递公司(택배회사)  -->
                                <td class="readonly_area">
                                    <input id="expsCmpNm" name="expsCmpNm" type="text" value="" class="form_input" readonly>
                                </td>
                                <th scope="row"><span class="bu_required used"><spring:message code='ser.lbl.addr' /></span></th><!--주소  -->
                                <td colspan="3">
                                    <input type="text" required id="rcipAddrNm" name="rcipAddrNm" data-name="<spring:message code='ser.lbl.rcipAddrNm' />" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.payMethod" /></th><!--收件地址(지불방식)  -->
                                <td class="readonly_area">
                                    <input id="payTp" name="payTp" type="text"  class="form_comboBox" value="02" readonly/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.olditemExpsAmt" /></th><!-- 보가금액  -->
                                <td >
                                    <input id="expsAmt" name="expsAmt" type="text"  class="form_numeric ar" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.olditemRecoveryCmp" /></th><!-- 고품회수회사 -->
                                <td >
                                    <input id="olditemCmpNm" name="olditemCmpNm" type="text" value="Ex) 北京三立车灯" class="form_input" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <!-- 조회 조건 종료 -->
        </section>
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->
<!-- script -->
<script type="text/javascript">

//요청상태 Array
var statCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${statCdList}">
    <c:if test='${obj.remark1 eq "Y"}'>
        statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
//요청상태 Map
var statCdMap = dms.data.arrayToMap(statCdList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var brandCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//브랜드 Map
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){ return obj.cmmCd; });

//고품조회조건
var searchList = [];
<c:forEach var="obj" items="${searchList}">
    <c:if test="${obj.remark1 eq 'Y' }" >
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
    <c:if test='${obj.useYn eq "Y"}' >
    deptCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//부서코드 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });

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

    //조회조건 (01:판정일자 , 02 : 신청일자 , 03 : 회수 확인일자 )
    $("#sField").kendoExtDropDownList({
         dataSource:searchList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - RO유형
    $("#sStatCd").kendoExtDropDownList({
         dataSource:statCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 요청부서
    $("#sReqDeptCd").kendoExtDropDownList({
         dataSource:deptCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //요청부서
    $("#reqDeptCd").kendoExtDropDownList({
         dataSource:deptCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //지불방식
    $("#payTp").kendoExtDropDownList({
         dataSource:oldItemPaymCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
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


    $("#reqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sToDt}"
    });

    /**보가금액**/
    $("#expsAmt").kendoExtNumericTextBox({
       min:0
      ,format:"n2" //"{0:##,###}"
      ,value :0
      ,spinners:false             // 증,감 화살표

    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#oldItemform").get(0).reset();

            $('#grid').data('kendoExtGrid').dataSource.page(1);

        }
    });

    $("#btnReset").kendoButton({
        click:function(e){
            $("#oldItemform").get(0).reset();
        }
    })

    /** 엑셀 다운 버튼**/
    $("#btnExcelExport").kendoButton({
        click:function(e){

            dms.ajax.excelExport({
                 "beanName"        : "claimOldItemManageService"
                ,"templateFile"    : "OlditemRequestList_Tpl.xlsx"
                ,"fileName"        : "<spring:message code='ser.title.oldItemReqMng' />.xlsx"
                ,"sReqFromDt"      : $("#sReqFromDt").val()
                ,"sReqToDt"        : $("#sReqToDt").val()
                ,"sDlrCd"          : $("#sDlrCd").val()
                ,"sStatCd"         : $("#sStatCd").data("kendoExtDropDownList").value()
                ,"sClaimDocNo"     : $("#sClaimDocNo").val()
                ,"sItemCd"         : $("#sItemCd").val()
                ,"sField"          : $("#sField").data("kendoExtDropDownList").value()
                ,"sTabId"          : "REQ"                                // TAB ID
            });
        }
    });


  //버튼 - 엑셀 Import
    $("#btnExcelImport").kendoButton({
        click:function(e) {
            claimOldItemBatchUploadPopupWin = dms.window.popup({
                title:"导入索赔旧件回收"
                ,width:800
                ,height:400
                ,windowId:"claimOldItemBatchUploadPopupWin"
                ,content:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemApproveBatchUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                           $('#grid').data('kendoExtGrid').dataSource.page(1);
                        }
                    }
                }
            });
        }
    });

    $('input[name="reqStatCd"]').click(function(e){

       if($('input[name="reqStatCd"]:checked').val() == "02"){
           $(".used").addClass("bu_required");
           $(".used").attr("required","");

       }else{
           $(".used").removeClass("bu_required");
           $(".used").attr("required","required");
       }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({

        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var saveData = [];
            var validator = $("#oldItemform").kendoExtValidator().data("kendoExtValidator");

            if (validator.validate()) { //validation check

                $(".grid-checkbox-item").each( function(index , obj){
                    var dataItem = grid.dataSource._data;
                    if( $(obj).hasClass("k-state-selected")){

                        var statCd = dataItem[index].statCd;
                        //요청 대상만 담음.
                        if(statCd == "01"){
                            dataItem[index].statCd        = $('input[name="reqStatCd"]:checked').val(); //상태
                            dataItem[index].reqDt         = $("#reqDt").data("kendoExtMaskedDatePicker").value();//요청일자
                            dataItem[index].reqStatCd     = $('input[name="reqStatCd"]:checked').val(); //요청상태
                            dataItem[index].reqId         = $("#reqId").val(); //요청자
                            dataItem[index].warningInfo   = $("#warningInfo").val();   //주의사항
                            dataItem[index].reqReasonCont = $("#reqReasonCont").val(); //회수건의
                            dataItem[index].reqDeptCd     = $("#reqDeptCd").data("kendoExtDropDownList").value();//요청부서
                            dataItem[index].rcipId        = $("#rcipId").val();//수취인
                            dataItem[index].reqTelNo      = $("#reqTelNo").val();//신청인연락처
                            dataItem[index].rcipTelNo     = $("#rcipTelNo").val();//접수자연락처
                            dataItem[index].expsCmpNm     = $("#expsCmpNm").val();//택배회사
                            dataItem[index].rcipAddrNm    = $("#rcipAddrNm").val();//주소
                            dataItem[index].payTp         = $("#payTp").data("kendoExtDropDownList").value();//지불방식
                            dataItem[index].expsAmt       = $("#expsAmt").data("kendoExtNumericTextBox").value();//보가금액
                            dataItem[index].olditemCmpNm  = $("#olditemCmpNm").val();//고품회수회사
                            saveData.push(dataItem[index]);
                        }
                    }
                });

                if(saveData.length == 0){

                    dms.notification.warning("<spring:message code='ser.btn.reqSend' var='reqSend' />"+
                                             "<spring:message code='ser.info.noInfoData' arguments='${reqSend} ' />");
                    return false;
                }else{
                    $("#messageId").html("<spring:message code='ser.btn.reqSend' var='reqSend' />"+
                    "<spring:message code='global.info.cnfrmMsg' arguments='${reqSend}' />" );
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();

                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();


                        var jsonData = {"claimOldItemManageList":saveData};
                        if (grid.gridValidation()) {
                            $.ajax({
                                url:"<c:url value='/ser/wac/claimOldItemManage/insertClaimOldItemManage.do' />",
                                data:JSON.stringify(jsonData),
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

                    }else{
                            conformKendoWindow.close();
                            $(".grid-checkbox-item").each( function(index , obj){
                                var dataItem = grid.dataSource._data;
                                if( $(obj).hasClass("k-state-selected")){
                                    var statCd = dataItem[index].statCd;
                                    //요청 대상상태 원복
                                    if(statCd == "02" || statCd == "03"){
                                        dataItem[index].statCd        = "01"; //상태
                                    }
                                }
                            });
                        }
                    }).end();
                }

            }
         }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0803-164001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqFromDt"]  = $("#sReqFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqToDt"]    = $("#sReqToDt").data("kendoExtMaskedDatePicker").value();
                        params["sDlrCd"]      = $("#sDlrCd").val();
                        params["sStatCd"]     = $("#sStatCd").data("kendoExtDropDownList").value();
                        params["sClaimDocNo"] = $("#sClaimDocNo").val();
                        params["sItemCd"]     = $("#sItemCd").val();
                        params["sField"]      = $("#sField").data("kendoExtDropDownList").value();

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
                        ,vinNo:{type:"string", editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,statCd:{type:"string", editable:false}
                        ,atqReqNo:{type:"string", editable:false}
                        ,runDistVal:{type:"number", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false}
                        ,itemUnitCd:{type:"string", editable:false}
                        ,collcQty:{type:"number"}
                        ,claimQty:{type:"number", editable:false}
                        ,reqStatCd:{type:"string", editable:false}
                        ,reqReasonCont:{type:"string", editable:false}
                        ,collcReqDt:{type:"date", editable:false}
                        ,reqId:{type:"string", editable:false}
                        ,reqNm:{type:"string", editable:false}
                        ,reqDt:{type:"date", editable:false}
                        ,reqDeptCd:{type:"string", editable:false}
                        ,collcId:{type:"string", editable:false}
                        ,collcDt:{type:"date", editable:false}
                        ,ddctId:{type:"string", editable:false}
                        ,ddctDt:{type:"date", editable:false}
                        ,giDstinCd:{type:"string", editable:false}
                        ,giDt:{type:"date", editable:false}
                        ,claimStartDt:{type:"date", editable:false}
                        ,giDeptCd:{type:"string", editable:false}
                        ,giId:{type:"string", editable:false}
                    }
                }
            }
        }
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function (e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dms.string.isEmpty(dataItem.atqReqNo)){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                }else{
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                }
            });
        }
        ,change:function(e){
             var selectedVal = this.dataItem(this.select());

             if( selectedVal != null ){

                 if( dms.string.isNotEmpty(selectedVal.atqReqNo )){
                     $("#atqReqNo").val(selectedVal.atqReqNo);          //신청번호
                     $("input[name='reqStatCd']:radio:input[value=" + selectedVal.reqStatCd + "]").prop("checked", true);   //요청상태
                     $("#reqDt").data("kendoExtMaskedDatePicker").value(selectedVal.reqDt);     //요청일
                     $("#reqId").val(selectedVal.reqId);                //신청자ID
                     $("#reqNm").val(selectedVal.reqNm);                //신청자명
                     $("#warningInfo").val(selectedVal.warningInfo);    //주의사항
                     $("#reqReasonCont").val(selectedVal.reqReasonCont);//회수건의
                     $("#reqDeptCd").data("kendoExtDropDownList").value(selectedVal.reqDeptCd);    //요청부서
                     $("#rcipId").val(selectedVal.rcipId);          //수취인
                     $("#reqTelNo").val(selectedVal.reqTelNo);      //신청인연락처
                     $("#rcipTelNo").val(selectedVal.rcipTelNo);    //접수자연락처
                     $("#expsCmpNm").val(selectedVal.expsCmpNm);    //택배회사
                     $("#rcipAddrNm").val(selectedVal.rcipAddrNm);  //수취 주소
                     $("#payTp").val(selectedVal.payTp);            //지불방식
                     $("#expsAmt").data("kendoExtNumericTextBox").value(selectedVal.expsAmt);     //보가금액
                     $("#oldItemCmpNm").val(selectedVal.oldItemCmpNm);      //고품회수회사
                 }else{
                     $("#atqReqNo").val(selectedVal.atqReqNo);          //신청번호
                     $("input[name='reqStatCd']:radio:input[value='01']").prop("checked", true);   //요청상태
                     $("#reqDt").data("kendoExtMaskedDatePicker").value("${sToDt}");     //요청일
                     $("#reqId").val("${loginUsrId}");                //신청자ID
                     $("#reqNm").val("${loginUsrNm}");                //신청자명
                     $("#warningInfo").val("请索赔员妥善保管快递单,便于核对");    //주의사항
                     $("#reqReasonCont").val("务必在3个工作日内将旧件寄至以上单位 (默认)");//회수건의
                     $("#reqDeptCd").data("kendoExtDropDownList").value("");    //요청부서
                     $("#rcipId").val("");          //수취인
                     $("#reqTelNo").val("");      //신청인연락처
                     $("#rcipTelNo").val("");    //접수자연락처
                     $("#expsCmpNm").val("");    //택배회사
                     $("#rcipAddrNm").val("");  //수취 주소
                     $("#expsAmt").data("kendoExtNumericTextBox").value(0.00);     //보가금액
                     $("#oldItemCmpNm").val("Ex) 北京三立车灯");      //고품회수회사
                 }
             }
        }
        ,columns:[
             {title:"", width:40, _field:"_checkAll"
                  ,attributes:{"class":"ac"}, _field:"_checkAll"
                  ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                  ,headerTemplate:"<input type='checkbox' class='checkAll' />"
             }
            ,{field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"statCd", title:"<spring:message code='ser.lbl.OldItemstatNm' />", width:100//상태
                ,attributes:{"class":"ac"}
                ,template:"#=statCdGrid(statCd)#"
            }
            ,{field:"atqReqNo", title:"<spring:message code='ser.lbl.requestNo' />", width:120, attributes:{"class":"ac"}}//요청번호
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}//딜러사
            ,{field:"dlrNm", title:"<spring:message code='sal.lbl.dlrNm' />", width:120, attributes:{"class":"al"}}//딜러명칭
            ,{field:"claimStartDt", title:"<spring:message code='ser.lbl.receivableDt' />", width:120//클레임일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:120 ,attributes:{"class":"al"} }//클레임번호
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.oitemCd' />", width:100 ,attributes:{"class":"al"} }//부품코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200 ,attributes:{"class":"al"} }//부품명칭
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.qty' />", width:80 ,attributes:{"class":"ar"} , format:"{0:n0}" }//수량
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:80, format:"{0:n0}"//회수수량
                ,attributes:{"class":"ar"}
            }
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:100 ,attributes:{"class":"ac"}}   //단위
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:180 ,attributes:{"class":"al"} }        //VIN
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100 ,attributes:{"class":"ar"} ,format:"{0:n0}" }//주행거리
            ,{field:"reqNm", title:"<spring:message code='sal.lbl.requestUsr' />", width:100, attributes:{"class":"ac"}}    //요청자
            ,{field:"reqDt", title:"<spring:message code='ser.lbl.reqDt' />", width:100//요청일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"reqDeptCd", title:"<spring:message code='ser.lbl.reqDept' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
        ]

    });



//############################################################################
//체크박스 세팅
//############################################################################

  //체크박스 세팅
    gridCheckBoxSet = function(uid , checked){
        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var rows = grid.tbody.find("tr[data-uid=" + uid + "]");


        if(checked){
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
            $(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
        }else{
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
        }

    };

    //그리드 헤더CheckBox 클릭이벤트
    $(".checkAll").on("click" , function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");
        var uid = $(this).attr("data-uid");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                if( dms.string.isEmpty(dataItem[index].atqReqNo)){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
            });
        }
    });


    //그리드 선택 이벤트
      $("#grid").on("click", "tr.k-state-selected", function (e) {

        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var chkBoolean = true;
        if(selectedVal != null){
            var uid = selectedVal.uid;
            if( dms.string.isEmpty(selectedVal.atqReqNo)){
                chkBoolean = $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked") ? false : true;
                gridCheckBoxSet(uid , chkBoolean);
            }
        }
    });

    //체크박스 선택이벤트
    $("#grid").on("click", ".grid-checkbox-item", function(e){
        var checked = $(this).is(":checked");

        var grid = $("#grid").data("kendoExtGrid");

        var chkBoolean = true;
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");
        rows.each( function(index , obj){
            var dataItem = grid.dataSource._data;
            if( uid  == dataItem[index].uid){
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid  + "]")).toggleClass("k-state-selected");
            }else{
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).removeClass("k-state-selected");
            }
        });

        gridCheckBoxSet($(this).attr("data-uid") , checked);

    });

});


</script>


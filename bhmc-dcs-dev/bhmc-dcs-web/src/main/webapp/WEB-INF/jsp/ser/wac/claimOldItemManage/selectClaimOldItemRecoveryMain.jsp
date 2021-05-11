<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 클레임 고품 회수 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.oldItemRecMng" />(DCS)</h1><!-- 고품회수관리 -->
                <div class="btn_left" style="display:none;">
                    <dms:access viewId="VIEW-I-13000" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-I-12904" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12487" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
    				<dms:access viewId="VIEW-I-12488" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m " id="btnSave"><spring:message code="ser.btn.recovery" /></button><!-- 회수 -->
    				</dms:access>
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->
            <!-- 조회 조건 시작 -->
            <form id="oldItemform" method="POST" action="/">
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                        <col style="width:10%;">
                        <col style="width:19%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col>
                    <tbody>
                        <tr>
                            <th scope="row">
                                <input id="sField" name="sField" class="form_comboBox" value="02" style="width:80%"/>
                            </th><!--요청일자  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sReqFromDt" value="${sReqFromDt}" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sReqToDt" value="${sReqToDt}" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.dlrCd" /></th><!--딜러   -->
                            <td>
                                <input type="text" id="sDlrCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.OldItemstatNm" /></th><!--상태  -->
                            <td>
                                <input type="text" id="sStatCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.oldItemStatCd" /></th><!--상태  -->
                            <td>
                                <input type="text" id="sOlditemStatCd" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!--클레임번호  -->
                            <td>
                                <input type="text" id="sClaimDocNo" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.oitemCd" /></th><!--부품코드  -->
                            <td>
                                <input type="text" id="sItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.oldItemAcceptYn' /></th><!--접수여부  -->
                            <td>
                                <input type="text" id="sAcceptYn" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.reqDept' /></th><!--요청부서  -->
                            <td>
                                <input id="sReqDeptCd" name="sReqDeptCd" type="text" value="" class="form_comboBox"/>
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
                            <th scope="row"><spring:message code="ser.lbl.senderId" /></span></th><!--부취인  -->
                            <td class="readonly_area">
                                <input type="text" id="senderId" name="senderId" maxlength="10" class="form_input" readonly>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.telNum' /></span></th><!--전화  -->
                            <td class="readonly_area">
                                <input type="text" id="senderTelNo" name="senderTelNo" maxlength="15" class="form_input numberic" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.trsfNo" /></span></th><!--운송번호  -->
                            <td class="readonly_area">
                                <input type="text" id="trsfNo" name="trsfNo" value="" maxlength="20" class="form_input" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.requestNo" /></th><!--需求编号(요청번호)  -->
                            <td class="readonly_area">
                                <input id="atqReqNo" name="atqReqNo" value="" class="form_input" readonly>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.recDt' /></span></th><!--회수일자-->
                            <td>
                                <input required type="text" id="collcReqDt" name="collcReqDt" value="${sToDt}" data-name="<spring:message code="ser.lbl.recDt" />" class="form_datepicker ac">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.reqStatCd" /></span></th><!--요청상태  -->
                            <td class="readonly_area">
                                <label class="label_check"><input type="radio" name="reqStatCd" class="form_check" checked="checked" value="02" disabled> <spring:message code="ser.lbl.recReq" /></label><!-- 회수요청 -->
                                <label class="label_check"><input type="radio" name="reqStatCd" class="form_check" value="03" disabled> <spring:message code="ser.lbl.scrapReq" /></label><!-- 페기요청 -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.requestUsr' /></span></th><!--요청자  -->
                            <td class="readonly_area">
                                <input id="reqId" name="reqId" value="${reqNm}" type="text" class="form_input" readonly/>
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.warInfo' /></th><!--주의사항  -->
                            <td rowspan="2" class="readonly_area">
                                <textarea rows="2" id="warningInfo" name="warningInfo" class="form_textarea" readonly></textarea>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.recoveryCont' /></th><!-- 회수건의 -->
                            <td rowspan="2" class="readonly_area">
                                <textarea rows="2" id="reqReasonCont" name="reqReasonCont" class="form_textarea" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.reqDept' /></th><!--요청부서  -->
                            <td class="readonly_area">
                                <input id="reqDeptCd" name="reqDeptCd" type="text" class="form_comboBox" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.rcipNm' /></th><!--수취인  -->
                            <td class="readonly_area">
                                <input type="text" id="rcipId" name="rcipId" value="" class="form_input" readonly/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.olditemReqHp' /></th> <!-- 신청인연락처 -->
                            <td class="readonly_area">
                                <input type="text" id="reqTelNo" name="reqTelNo" class="form_input numberic" readonly>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.oldItemAcceptHp" /></th><!-- 접수자연락처 -->
                            <td class="readonly_area">
                                <input type="text" id="rcipTelNo" name="rcipTelNo" class="form_input numberic" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.trsfCmpCd" /></th><!--快递公司(택배회사)  -->
                            <td class="readonly_area">
                                <input id="expsCmpNm" name="expsCmpNm" type="text" value="" class="form_input" readonly>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.addr' /></th><!--주소  -->
                            <td colspan="3" class="readonly_area">
                                <input type="text" id="rcipAddrNm" name="rcipAddrNm" class="form_input" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.payMethod" /></th><!--收件地址(지불방식)  -->
                            <td class="readonly_area">
                                <input id="payTp" name="payTp" type="text"  class="form_comboBox" value="02" readonly/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.olditemExpsAmt" /></th><!-- 보가금액  -->
                            <td class="readonly_area">
                                <input id="expsAmt" name="expsAmt" type="text"  class="form_numeric ar" readonly/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.olditemRecoveryCmp" /></th><!-- 고품회수회사 -->
                            <td class="readonly_area">
                                <input id="olditemCmpNm" name="olditemCmpNm" type="text" class="form_input" readonly/>
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
<script type="text/javascript">


//요청상태 Array
var statCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${statCdList}">
  <c:if test='${obj.remark2 eq "Y" }'>
      statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
</c:forEach>
//요청상태 Map
var statCdMap = dms.data.arrayToMap(statCdList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var useYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${useYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//브랜드 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

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
    <c:if test='${obj.remark1 eq "H"}' >
        itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
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

    //조회조건
    $("#sField").kendoExtDropDownList({
         dataSource:searchList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 상태코드
    $("#sStatCd").kendoExtDropDownList({
        dataSource:statCdList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
   });

    //조회조건 - 부품상태코드
    $("#sOlditemStatCd").kendoExtDropDownList({
         dataSource:itemStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 상태
    $("#sStatCd").kendoExtDropDownList({
         dataSource:statCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 접수여부
    $("#sAcceptYn").kendoExtDropDownList({
         dataSource:useYnList
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

    $("#collcReqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sToDt}"
    });

    $("#reqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    /**보가금액**/
    $("#expsAmt").kendoExtNumericTextBox({
       min:0
      ,format:"n2" //"{0:##,###}"
      ,value :0
      ,spinners:false  // 증,감 화살표

    });

  //지불방식
    $("#payTp").kendoExtDropDownList({
         dataSource:oldItemPaymCdList
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

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#oldItemform").get(0).reset();
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    /** 엑셀 다운 버튼**/
    $("#btnExcelExport").kendoButton({
        click:function(e){

            dms.ajax.excelExport({
                 "beanName"        : "claimOldItemManageService"
                ,"templateFile"    : "OlditemRecoveryList_Tpl.xlsx"
                ,"fileName"        : "<spring:message code='ser.title.oldItemRecMng' />.xlsx"
                ,"sReqFromDt"      : $("#sReqFromDt").val()
                ,"sReqToDt"        : $("#sReqToDt").val()
                ,"sDlrCd"          : $("#sDlrCd").val()
                ,"sOlditemStatCd"  : $("#sOlditemStatCd").data("kendoExtDropDownList").value()
                ,"sStatCd"         : $("#sStatCd").data("kendoExtDropDownList").value()
                ,"sReqDeptCd"      : $("#sReqDeptCd").data("kendoExtDropDownList").value()
                ,"sAcceptYn"       : $("#sAcceptYn").data("kendoExtDropDownList").value()
                ,"sClaimDocNo"     : $("#sClaimDocNo").val()
                ,"sItemCd"         : $("#sItemCd").val()
                ,"sField"          : $("#sField").data("kendoExtDropDownList").value()
                ,"sTabId"          : "RCY"                                // TAB ID
            });


        }
    });

     //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var saveData = [];
            var validator = $("#oldItemform").kendoExtValidator().data("kendoExtValidator");

            $(".grid-checkbox-item").each( function(index , obj){
                var dataItem = grid.dataSource._data;
                if( $(obj).hasClass("k-state-selected")){
                    var statCd = dataItem[index].statCd;
                    //요청 대상상태 원복
                    if(statCd == "04"){
                        if(dataItem[index].collcQty == 0 ){
                            dms.notification.warning("<spring:message code='ser.lbl.recQty' var='ecQty' />"+
                            "<spring:message code='global.info.confirmMsgParam' arguments='${ecQty} ' />");
                            return ;
                        }
                    }
                }
            });

            if (validator.validate()) { //validation check

                $(".grid-checkbox-item").each( function(index , obj){
                    var dataItem = grid.dataSource._data;
                    if( $(obj).hasClass("k-state-selected")){
                        var statCd = dataItem[index].statCd;
                        //요청 대상만 담음.
                        if(statCd == "08"){
                            dataItem[index].statCd        = "04"; //상태
                            dataItem[index].collcReqDt    = $("#collcReqDt").data("kendoExtMaskedDatePicker").value();//회수일자
                            saveData.push(dataItem[index]);
                        }
                    }
                });


                if(saveData.length == 0){
                    dms.notification.warning("<spring:message code='ser.btn.reqSend' var='reqSend' />"+
                                             "<spring:message code='ser.info.noInfoData' arguments='${reqSend} ' />");
                    return;
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
                                    url:"<c:url value='/ser/wac/claimOldItemManage/updateReceiveOldItemManage.do' />",
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
                                    if(statCd == "04"){
                                        dataItem[index].statCd        = "08"; //상태
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
        gridId:"G-SER-0625-102801"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemRecovery.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqFromDt"]      = $("#sReqFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqToDt"]        = $("#sReqToDt").data("kendoExtMaskedDatePicker").value();
                        params["sDlrCd"]          = $("#sDlrCd").val();
                        params["sOlditemStatCd"]  = $("#sOlditemStatCd").val();
                        params["sStatCd"]         = $("#sStatCd").val();
                        params["sReqDeptCd"]      = $("#sReqDeptCd").val();
                        params["sAcceptYn"]       = $("#sAcceptYn").val();
                        params["sClaimDocNo"]     = $("#sClaimDocNo").val();
                        params["sItemCd"]         = $("#sItemCd").val();
                        params["sField"]          = $("#sField").val();

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
                        ,vinNo:{type:"string", editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,statCd:{type:"string", editable:false}
                        ,atqReqNo:{type:"string", editable:false}
                        ,runDistVal:{type:"number", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false}
                        ,itemUnitCd:{type:"string", editable:false}
                        ,collcQty:{type:"number", editable:true}
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
                        ,olditemStatCd:{type:"string", editable:false}
                        ,notSendCauseCont:{type:"string", editable:false}
                        ,acceptYn:{type:"string", editable:false}
                        ,trsfNo:{type:"string", editable:false}
                        ,controllUsrNm:{type:"string", editable:false}
                    }
                }
            }
        }
        ,editable:true
        ,dataBound:function (e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem.statCd != "04"){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                }else{
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                }
            });
        }
        ,change:function(e){

            var selectedVal = this.dataItem(this.select());
            if( selectedVal != null){
                if( dms.string.isNotEmpty(selectedVal.atqReqNo )){
                    $("#atqReqNo").val(selectedVal.atqReqNo);//요청번호
                    $("input[name='reqStatCd']:radio:input[value=" + selectedVal.reqStatCd + "]").prop("checked", true);
                    $("#reqId").val(selectedVal.reqNm);//요청자
                    $("#collcReqDt").data("kendoExtMaskedDatePicker").value(selectedVal.collcReqDt);//회수요청일자
                    $("#warningInfo").val(selectedVal.warningInfo);//주의사항
                    $("#reqReasonCont").val(selectedVal.reqReasonCont);//요청사유
                    $("#reqDeptCd").data("kendoExtDropDownList").value(selectedVal.reqDeptCd);//요청부서
                    $("#reqTelNo").val(selectedVal.reqTelNo);//전화
                    $("#rcipId").val(selectedVal.rcipId);//수취인
                    $("#rcipAddrNm").val(selectedVal.rcipAddrNm);//수취 주소
                    $("#rcipTelNo").val(selectedVal.rcipTelNo);//연락처
                    $("#expsCmpNm").val(selectedVal.expsCmpNm);//택배회사
                    $("#expsAmt").data("kendoExtNumericTextBox").value(selectedVal.expsAmt);
                    $("#olditemCmpNm").val(selectedVal.olditemCmpNm);
                    $("#payTp").val(selectedVal.payTp);//지불방식
                    $("#senderId").val(selectedVal.senderId);//부취인
                    $("#senderTelNo").val(selectedVal.senderTelNo);//전화
                    $("#trsfNo").val(selectedVal.trsfNo);//운송번호
                }else{
                    $("#collcReqDt").data("kendoExtMaskedDatePicker").value("");//회수요청일자
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
            ,{field:"seq", hidden:true}
            ,{field:"atqReqNo", title:"<spring:message code='ser.lbl.requestNo' />", width:120, attributes:{"class":"ac"}}//요청번호
            ,{field:"statCd", title:"<spring:message code='ser.lbl.OldItemstatNm' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=statCdGrid(statCd)#"

            }//상태
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dealerCo' />", width:80, attributes:{"class":"al"}
            }//딜러명
            ,{field:"dlrNm", title:"<spring:message code='sal.lbl.dlrNm' />", width:120, attributes:{"class":"al"}}//딜러명칭
            ,{field:"claimStartDt", title:"<spring:message code='ser.lbl.receivableDt' />", width:120//클레임일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:120 ,attributes:{"class":"al"}}//클레임번호
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.oitemCd' />", width:100,attributes:{"class":"al"}}//부품코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200//부품명칭
                ,attributes:{"class":"al"}
            }
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.qty' />", width:80 ,attributes:{"class":"ar"}}//수량
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input required name="collcQty" data-name="<spring:message code="ser.lbl.recQty" />" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0
                        ,max:1000
                        ,spinners:false
                    }).bind("keyup", function(){
                        var that = $(this).data("kendoExtNumericTextBox");
                        that.max = options.model.claimQty;
                        if(this.value > that.max){
                            this.value = that.max;
                        }
                    });
                }
            }//회수수량
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:80 ,attributes:{"class":"ac"}}//단위
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150 ,attributes:{"class":"al"}}//VIN
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100//주행거리
                ,attributes:{"class":"ar"}, format:"{0:n0}"
            }
            ,{field:"reqNm", title:"<spring:message code='sal.lbl.requestUsr' />", width:100 ,attributes:{"class":"al"}}//요청자
            ,{field:"reqDt", title:"<spring:message code='ser.lbl.reqDt' />", width:120//요청일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"reqDeptCd", title:"<spring:message code='ser.lbl.reqDept' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
            ,{field:"olditemStatCd", title:"<spring:message code='ser.lbl.oldItemStatCd' />", width:100//부품상태
                ,attributes:{"class":"ac"}
                ,template:"#=setItemStatCdMap(olditemStatCd)#"
            }
            ,{field:"notSendCauseCont", title:"<spring:message code='ser.lbl.notSendCauseCont' />", width:100 ,attributes:{"class":"al"}}//미전송원인
            ,{field:"acceptYn", title:"<spring:message code='ser.lbl.oldItemAcceptYn' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=setUseYnMap(acceptYn)#"
            }//접수여부
            ,{field:"senderId", title:"<spring:message code='ser.lbl.senderId' />", width:100 ,attributes:{"class":"al"}, hidden:true}//부취인
            ,{field:"senderTelNo", title:"<spring:message code='ser.lbl.telNum' />", width:100 ,attributes:{"class":"al"}, hidden:true}//전화
            ,{field:"trsfNo", title:"<spring:message code='ser.lbl.trsfNo' />", width:100 ,attributes:{"class":"al"}}//택배번호
            ,{field:"controllUsrNm", title:"<spring:message code='ser.lbl.oldItemControllUsrId' />", width:100 ,attributes:{"class":"al"}}//접수확인조작자

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
                  if( dataItem[index].statCd != "04" ){
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
              if( selectedVal.statCd != "04" ){
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


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<!-- 상단탭 시작 -->
<div id="resizableContainer">
<div id="mainTab" class="tab_area">
    <ul>
        <li id="BMJoinListTab" class="k-state-active" ><spring:message code="crm.lbl.blueMemJoin"/><!-- BM가입관리 --></li>
        <li id="BMCertifyListTab"><spring:message code="crm.lbl.blueMemCertify"/><!-- 비용지불 포인트취득 --></li>
        <li id="BMJoinHistoryListTab" ><spring:message code="crm.lbl.blueMemCertifyHis"/><!-- 블루멤버십 인증 히스토리 --></li>
        <li id="BMJoinHisListTab"><spring:message code="crm.menu.blueMemJoinHistory"/><!-- 블루멤버십 가입이력 --></li>
    </ul>

    <!-- 블루멤버십 가입 -->
    <div class="mt0" id="BMJoinListTabInfo">
            <!-- //블루멤버십 가입 조회부 -->
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11348" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11349" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_add" id="btnAdd"><spring:message code='global.btn.add'/></button><!-- 추가 -->
                    </dms:access>
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
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
                                <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vinNo'/></th><!-- VIN 번호 -->
                                <td>
                                    <input type="text" id="sVinNo" name="sVinNo" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.carRegNo'/></th><!-- 차량번호 -->
                                <td>
                                    <input type="text" id="sCarNo" name="sCarNo" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.deliveryDt'/><!-- 인도일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sSaleStartDt" name="sSaleStartDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sSaleEndDt" name="sSaleEndDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //블루멤버십 가입 조회부 -->

            <!-- 블루멤버십 가입 -->
            <section class="group">
                <div class="table_grid mt10">
                    <div id="blueMemUsrGrid" class="resizable_grid"></div>
                </div>
            </section>
            <!-- 블루멤버십 가입 -->
    </div>

    <!-- 비용지불 포인트취득 목록 탭 -->
    <div class="mt0" id="BMCertifyListTabInfo">
        <!-- //비용지불 포인트취득 조회부 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11350" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_search" id="btnBMCertifySearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11351" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_search" id="btnBMCertify"><spring:message code="crm.btn.blueMemCertify"/><!-- 취득확인 --></button>
                </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnBMCertifySearch" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col>
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.reqDt"/><!-- 요청일 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="beginDate" name="beginDate" class="form_datepicker ac" data-type="maskDate" >
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="endDate" name="endDate" class="form_datepicker ac" data-type="maskDate">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //비용지불 포인트취득 조회부 -->

        <!-- 비용지불 포인트취득 목록 -->
        <section class="group">
            <div class="table_grid mt10">
                <div id="BMCertifyGrid" class="resizable_grid" ></div>
            </div>
        </section>
        <!-- 비용지불 포인트취득 목록 -->

    </div>
    <!-- //비용지불 포인트취득 목록 탭 -->

    <!-- 지불 포인트 취득 기록 탭 -->
    <div class="mt0" id="BMJoinHistoryListTabInfo">
        <!-- 지불 포인트 취득 기록 조회부 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                 <!-- CRM_蓝缤入会管理_缴费获取积分记录 新增Excel 下载 功能 贾明 2018-10-22start -->
                 <dms:access viewId="VIEW-D-13282" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_excel" id="btnExcelExport"><spring:message code='global.btn.excelExport' /></button>
                </dms:access>
                <!-- CRM_蓝缤入会管理_缴费获取积分记录 新增Excel 下载 功能 贾明 2018-10-22 end -->
                <dms:access viewId="VIEW-D-11352" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_search" id="btnBMJoinHistory"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnBMJoinHistory" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col>
                        <col style="width:9%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                            <td>
                                <input type="text" id="sCustNmC" name="sCustNmC" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />" />
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.blueMembershipNo'/></th><!-- VIN 번호 -->
                            <td>
                                <input type="text" id="sBMIdNo" name="sBMIdNo" class="form_input" placeholder="<spring:message code='crm.lbl.blueMembershipNo'/>" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.evalDt'/></th><!-- 심사일자 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sStartJoinApproveDt" name="sStartJoinApproveDt" class="form_datepicker ac" data-type="maskDate" >
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sEndJoinApproveDt" name="sEndJoinApproveDt" class="form_datepicker ac" data-type="maskDate">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //지불 포인트 취득 기록 조회부 -->

        <!-- 지불 포인트 취득 기록 목록 -->
        <section class="group">
            <div class="table_grid mt10">
                <div id="BMJoinHistoryGrid" class="resizable_grid" ></div>
            </div>
        </section>
        <!-- 지불 포인트 취득 기록 목록 -->

    </div>

    <!-- 블루멤버십 가입 이력 목록 탭 -->
    <div class="mt0" id="BMJoinHisListTabInfo">
        <!-- 블루멤버십 가입 이력 조회부 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                <!-- CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 下载  贾明 2018-10-22start -->
                 <dms:access viewId="VIEW-D-13283" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_excel" id="btnBMJoinHisExcelExport"><spring:message code='global.btn.excelExport' /></button>
                </dms:access>
                <!-- CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 下载 贾明 2018-10-22 end -->
                <dms:access viewId="VIEW-D-11353" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_search" id="btnBMJoinHisList"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnBMJoinHisList" >
                <table>
                    <caption></caption>
                    <colgroup>
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
                            <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                            <td>
                                <input type="text" id="sCustNmH" name="sCustNmH" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.vinNo'/></th><!-- VIN 번호 -->
                            <td>
                                <input type="text" id="sVinNoH" name="sVinNoH" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.joinApproveYn'/></th><!-- 가입성공여부 -->
                            <td>
                                <input id="sJoinApproveYn" name="sJoinApproveYn" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.fincReqDt'/></th><!-- 신청일자 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sStartDt" name="sStartDt" class="form_datepicker ac" data-type="maskDate" >
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sEndDt" name="sEndDt" class="form_datepicker ac" data-type="maskDate">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //블루멤버십 가입 이력 조회부 -->

        <!-- 블루멤버십 가입 이력 목록 -->
        <section class="group">
            <div class="table_grid mt10">
                <div id="btnBMJoinHisListGrid" class="resizable_grid" data-offset="110"></div>
            </div>
        </section>
        <!-- 블루멤버십 가입 이력 목록 -->

    </div>
    <!-- 블루멤버십 가입 이력 목록 탭 -->

</div>
</div> <!-- resizableContainer -->

<!-- script -->
<script>

    var rowNumber = 0; //그리드 목록 번호

    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
    //고객유형 설정
    var custTpMap = [];
    <c:forEach var="obj" items="${custTpList}">
        custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //신분증 유형(주요인증문서유형) 설정
    var mathDocTpArr = {};
    <c:forEach var="obj" items="${mathDocTpList}">
        mathDocTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    mathDocTpArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = mathDocTpArr[val];
        }
        return returnVal;
    };

    //블루멤버십 회원등급
    var mLevelMap = [];
    <c:forEach var="obj" items="${mLevelList}">
        mLevelMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //비용지불포인트취득상태
    var paymentAccessPointsStatusMap = [];
    <c:forEach var="obj" items="${paymentAccessPointsStatusList}">
       paymentAccessPointsStatusMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 검색조건:요청일 시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
        //if(dms.string.isEmpty($(this).val())){return;}
        if(dms.string.isEmpty(e.data.from.val())){return;}
        if(dms.string.isEmpty(e.data.to.val())){return;}

        var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
        var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
        if(startDt > endDt){
            dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
            $(this).focus();
        }
    }
    
     // CRM_蓝缤入会管理_缴费获取积分记录 新增Excel 下载  贾明 2018-10-22 start
          
          $("#btnExcelExport").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartJoinApproveDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndJoinApproveDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    //$("#BMJoinHistoryGrid").data("kendoExtGrid").dataSource.page(1);
                }else{
                    $("#sEndJoinApproveDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndJoinApproveDt").focus();
                    return false;
                }
                 //参数
                 var param = $.extend(
                    {"sCustNm"           :$("#sCustNmC").val()}
                   ,{"sBlueMembershipNo"  :$("#sBMIdNo").val()}
                   ,{"sStartDt"           :$("#sStartJoinApproveDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sEndDt"             :$("#sEndJoinApproveDt").data("kendoExtMaskedDatePicker").value()}
               );
               
               
               $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinHistorysByConditionCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 65000){
                        dms.ajax.excelExport({
                            "beanName"              :"blueMembershipJoinHistorySupportService"
                            ,"templateFile"         :"BlueMembershipJoinHistorys_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='crm.lbl.blueMemCertifyHis' />.xlsx"
                            ,"sCustNm"             :$("#sCustNmC").val()
                            ,"sBlueMembershipNo"    :$("#sBMIdNo").val()
                            ,"sStartDt"             :$("#sStartJoinApproveDt").val()
                            ,"sEndDt"               :$("#sEndJoinApproveDt").val()
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},65000' />");
                    }
                }
            });
               
                
                
            }
        }); // 버튼 종료
          
        // CRM_蓝缤入会管理_缴费获取积分记录 新增Excel 下载  贾明 2018-10-22 end
        
        
       // CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 下载  贾明 2018-10-22 start
          
          $("#btnBMJoinHisExcelExport").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                   
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }
                 //参数
                 var param = $.extend(
                    {"sCustNm"            :$("#sCustNmH").val()}
                   ,{"sVinNo"             :$("#sVinNoH").val()}
                   ,{"sStartDt"           :$("#sStartDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sEndDt"             :$("#sEndDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sJoinApproveYn"     :$("#sJoinApproveYn").data("kendoExtDropDownList").value()}
               );
               
               
               $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinsByConditionCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 65000){
                        dms.ajax.excelExport({
                            "beanName"              :"blueMembershipJoinService"
                            ,"templateFile"         :"BlueMembershipJoins_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='crm.menu.blueMemJoinHistory' />.xlsx"
                            ,"sCustNm"              :$("#sCustNmH").val()
                            ,"sVinNo"               :$("#sVinNoH").val()
                            ,"sStartDt"             :$("#sStartDt").val()
                            ,"sEndDt"               :$("#sEndDt").val()
                            ,"sJoinApproveYn"       :$("#sJoinApproveYn").val()
                            ,"sTypeVal"             :"blueMembershipJoins"
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},65000' />");
                    }
                }
            });
               
                
                
            }
        }); // 버튼 종료
          
        //  CRM_蓝缤入会管理_蓝缤入会履历 新增Excel  下载  贾明 2018-10-22 end

    $(document).ready(function() {

        $("#mainTab").kendoExtTabStrip({
            animation:false
            , select:function(e) {

                var selectTabId = e.item.id;
                //console.log("selectTabId : ",selectTabId)
                //비용지불 포인트취득
                if (selectTabId === "BMCertifyListTab") {
                    $("#BMCertifyGrid").data("kendoExtGrid").dataSource.page(1);
                //지불 포인트 취득 기록
                } else if (selectTabId === "BMJoinHistoryListTab") {
                    $("#BMJoinHistoryGrid").data("kendoExtGrid").dataSource.page(1);
                //블루멤버십 가입이력
                } else if (selectTabId === "BMJoinHisListTab") {
                    $("#btnBMJoinHisListGrid").data("kendoExtGrid").dataSource.page(1);
                };

            }
        });

        /*****************************************************************************
         ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
         *******************************************************************************/
         // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
         $("#blueMemUsrGrid").on("dblclick", "tr.k-state-selected", function (e) {

             var gridId = e.delegateTarget.id
                , grid = $("#"+gridId+"").data("kendoExtGrid")
                , selectedItem = grid.dataItem(grid.select())
             ;

             if ( dms.string.isNotEmpty(selectedItem) ){

                 $("#btnAdd").click();

             } else {
                 // {상세정보}을(를) 확인하여 주세요.
                 dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                 return;
             }
        });

        /******************블루멤버십 가입 탭*************************************************************/
        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                $('#blueMemUsrGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 행추가
        $("#btnAdd").kendoButton({
            click:function(e){
                //$('#blueMemUsrGrid').data('kendoExtGrid').dataSource.insert(0);
                $("#searchYn").val("Y");//고객조푀팝업에 대한 open여부


                var  grid = $("#blueMemUsrGrid").data("kendoExtGrid")
                    ,selectedItem = grid.dataItem(grid.select())
                ;

                if ( dms.string.isNotEmpty(selectedItem) ){

                    //console.log("selectedItem : ",selectedItem);


//                     var custNo = selectedItem.carOwnerId;
//                     var custNm = selectedItem.carOwnerNm;
//                     var blueMembershipNo;
//                     var dlrCd = selectedItem.dlrCd;
//                     var custTp = selectedItem.custTp;
//                     var hpNo = selectedItem.carOwnerHpNo;
//                     var mathDocTp = selectedItem.mathDocTp;
//                     var ssnCrnNo = selectedItem.ssnCrnNo;
//                     var vinNo = selectedItem.vinNo;
//                     var modelNm = selectedItem.modelNm;

                    var custNo = selectedItem.custNo;
                    var custNm = selectedItem.custNm;
                    var blueMembershipNo;
                    var dlrCd = selectedItem.dlrCd;
                    var custTp = selectedItem.custTp;
                    var hpNo = selectedItem.hpNo;
                    var mathDocTp = selectedItem.mathDocTp;
                    var ssnCrnNo = selectedItem.ssnCrnNo;
                    var vinNo = selectedItem.vinNo;
                    var modelNm = selectedItem.modelNm;
                    var modelCd = selectedItem.modelCd;

                    popupWindow = dms.window.popup({
                        windowId:"blueMemJoinDetail"
                        ,width:"950px"
                        ,height:"180px"
                        , title:"<spring:message code='crm.menu.blueMemJoin' />"   // 블루멤버십 가입
                        , content:{
                            url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinPopup.do'/>"
                            , data:{
                                "autoBind"      : false
                                , "type"        : null
                                , "custNo"      : custNo
                                , "custNm"      : custNm
                                , "dlrCd"       : dlrCd
                                , "custTp"      : custTp
                                , "hpNo"        : hpNo
                                , "mathDocTp"   : mathDocTp
                                , "ssnCrnNo"    : ssnCrnNo
                                , "vinNo"       : vinNo
                                , "modelNm"     : modelNm
                                , "modelCd"     : modelCd
                                , "callbackFunc":function(data){

                                    //console.log("bm add data ::: ",data);

                                    if( data === "SUCCESS" ) {

                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                        popupWindow.close();
                                        $('#blueMemUsrGrid').data('kendoExtGrid').dataSource.page(1)

                                        //$("#sCustNo").val(data[0].custNo);
                                        //$("#sCustNm").val(data[0].custNm);
                                    }//end if
                                }//end callbackFunc
                            }//end data
                        }// end content
                    });


                } else {
                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }


            }
        });

        //인도일자
        $("#sSaleStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sStartDt}' />"
        });
        $("#sSaleEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sEndDt}' />"
        });

        // 블루멤버십 가입 그리드 설정
        $("#blueMemUsrGrid").kendoExtGrid({
            gridId:"G-CRM-0728-111026"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoin.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCustNm"] = $("#sCustNm").val();
                            params["sBlueMembershipJoinYn"] = "N";
                            params["sVinNo"] = $("#sVinNo").val();
                            params["sCarRegNo"] = $("#sCarNo").val();
                            params["sCustCd"] = "02"; // 01: 잠재, 02:보유, 03:타사보유
                            params["sCustTp"] = "01"; // 01: 개인, 02:법인
                            params["sMathDocTp"] = "01"; // 01 : 신분증
                            params["sHyundaiYn"] = "Y"; // 현대차여부

                            params["sSaleStartDt"] = $("#sSaleStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sSaleEndDt"] = $("#sSaleEndDt").data("kendoExtMaskedDatePicker").value();

                            //console.log("bm 가입 예정 목록11 : ",params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                            id:"dlrCd"
                                ,fields:{
                                    rnum:{type:"number"}
                                    //,dlrCd:{type:"string"}
                                    ,custNo:{type:"string", validation:{required:true}} //고객번호
                                    ,custNm:{type:"string", validation:{required:true} } //고객명
                                    ,custTp:{type:"string",  validation:{required:true}} // 고객유형
                                    ,hpNo:{type:"string", validation:{required:true}} // 휴대전화
                                    ,mathDocTp:{type:"string", validation:{required:true}} //신분증유형
                                    ,ssnCrnNo:{type:"string", validation:{required:true}} //신분증번호
                                    //,carOwnYn:{type:"string", validation:{required:true}} //차주여부
                                    //,sungNm:{type:"string", validation:{required:true}} //성
                                    //,cityNm:{type:"string", validation:{required:true}} //시
                                    ,regUsrId:{type:"string", validation:{required:true}} //등록자
                                    ,regDt:{type:"date", validation:{required:true}} //등록일
                                    ,regDtFormat:{type:"date", validation:{required:true}} //등록일
                                    ,saleDt:{type:"date", validation:{required:true}} //인도일일
                                    //,joinApproveYn:{type:"string", validation:{required:true}} //가입승인여부
                                    //,joinApproveDt:{type:"date", validation:{required:true}} //가입승인일자
                                    //,joinApproveDtFormat:{type:"date", validation:{required:true}} //가입승인일자
                                    //,blueMembershipNo:{type:"string", validation:{required:true}} //블루멤버쉽 번호
                                    //,blueMembershipJoinDt:{type:"date", validation:{required:true}} //블루멤버십 가입일자
                                    //,blueMembershipJoinDtFormat:{type:"date", validation:{required:true}} //블루멤버십 가입일자
                                    //,blueMembershipJoinDlrCd:{type:"string", validation:{required:true}} //블루멤버쉽 가입딜러코드
                                }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                    elem.saleDtFormat = kendo.parseDate(elem.saleDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,editable:false
            ,navigatable:true
            ,height:490
            ,selectable:"row"
            ,columns:[
                {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"al"},width:150}    // 고객명
               ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo'/>", attributes:{"class":"al"},width:150}    // VIN 번호
               ,{field:"carRegNo", title:"<spring:message code='crm.lbl.carRegNo'/>",attributes:{"class":"ac"},width:100}   // 차량번호
               ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm'/>"  // 차종명
                   ,attributes:{"class":"al"},width:150,sortable:false
               }
               ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm'/>"   // 모델명칭
                   ,attributes:{"class":"al"},width:150,sortable:false
               }
               ,{field:"custTp", title:"<spring:message code='global.lbl.custTp'/>", attributes:{"class":"ac"}  // 고객유형
                   ,width:80,sortable:false
                   ,template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
               }
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"},width:100}   // 이동전화
               ,{field:"mathDocTp", title:"<spring:message code='global.lbl.mathDocTp'/>", attributes:{"class":"ac"}    // 증서유형
                   ,width:100,sortable:false
                   ,template:'#= mathDocTpArrVal(mathDocTp)#'
               }
               ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo'/>",attributes:{"class":"ac"},width:150}// 증서번호
               ,{field:"saleDtFormat", title:"<spring:message code='sal.lbl.deliveryDt'/>",attributes:{"class":"ac"} //인도일자
                   ,width:100
                   ,template:"#if (saleDtFormat !== null ){# #= kendo.toString(data.saleDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt'/>",attributes:{"class":"ac"} //등록일
                   ,width:100
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });
        /******************블루멤버십 가입 탭*************************************************************/


        /******************비용지불 포인트취득 탭*************************************************************/
        //조회
        $("#btnBMCertifySearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#beginDate").data("kendoExtMaskedDatePicker").value()
                        ,$("#endDate").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#BMCertifyGrid").data("kendoExtGrid").dataSource.page(1);
                }else{
                    $("#endDate").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#endDate").focus();
                    return false;
                }
            }
        });

        //취득확인
        $("#btnBMCertify").kendoButton({
            click:function(e){

                var paramData = {};

                var   grid = $("#BMCertifyGrid").data("kendoExtGrid")
                    , selectedItem = grid.dataItem(grid.select())
                ;

                paramData["hpNo"] = selectedItem.Tel;
                paramData["ssnCrnNo"] = selectedItem.IdentityNumber;
                paramData["custNm"] = selectedItem.Name;
                paramData["amount"] = selectedItem.Amount;

                //console.log("버튼 인증 요청 param : "+JSON.stringify(paramData))

                $.ajax({
                    url:"<c:url value='/crm/dmm/blueMembershipJoin/insertMembershipApproval.do' />",
                    data:JSON.stringify(paramData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result) {

                        //console.log("result : ",result)

                        var isSuccess = result.IsSuccess;
                        var message = result.Message;

                        if ( isSuccess === true ) {

                            dms.notification.success("<spring:message code='global.info.success'/>");
                            $("#BMCertifyGrid").data("kendoExtGrid").dataSource.page(1);
                            $("#btnBMCertify").data("kendoButton").enable(false);

                        } else if ( isSuccess === false ){

                            dms.notification.warning(message);


                        };

                    }//end success
                })//end ajax

            }
            ,enable:false
        }); // 버튼 종료

        //요청일 선택
        $("#beginDate").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#endDate").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 블루멤버십 인증 요청 목록 그리드 설정
        $("#BMCertifyGrid").kendoExtGrid({
            gridId:"G-CRM-0929-090000"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipJoin/selectPaymentAccessPoints.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["beginDate"] = kendo.toString($("#beginDate").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd");
                            params["endDate"] = kendo.toString($("#endDate").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd");
                            //console.log("인증 파람 : ",params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                        ,data:"Data"
                        //,total:"total"
                        ,model:{
                            id:"IdentityNumber"
                            ,fields:{
                                IdentityNumber:{type:"string", editable:false}
                                ,rnum:{type:"string", editable:false}
                                ,DealerId:{type:"string", editable:false}
                                ,Tel:{type:"string", editable:false}
                                ,Amount:{type:"string", editable:false}
                                ,Name:{type:"string", editable:false}
                                ,Ispay:{type:"string", editable:false}
                                ,PayNumber:{type:"string", editable:false}
                                ,createtime:{type:"date", editable:false}
                                ,Status:{type:"string", editable:false}
                                ,regUsrId:{type:"string", editable:false}
                                ,regDt:{type:"string", editable:false}
                                ,updtUsrId:{type:"string", editable:false}
                                ,updtDt:{type:"string", editable:false}
                            }
                        }
                }
            }
            , dataBinding :function(e){
                rowNumber = 0;
            }
            ,change:function(e){

                var selectedItem = this.dataItem(this.select());

                if ( dms.string.isNotEmpty ) {
                    $("#btnBMCertify").data("kendoButton").enable(true);
                };

            }
            ,autoBind:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,editable:false
            ,navigatable:true
            ,sortable:false
            ,selectable:"row"
            ,height:490
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, template  :"#= ++rowNumber #", sortable:false ,attributes:{"class":"ac"}}
               ,{field:"DealerId", title:"<spring:message code='crm.lbl.dlrCd'/>", width:100, attributes:{"class":"ac"}}// 딜러코드
               ,{field:"Tel", title:"<spring:message code='global.lbl.hpNo' />", width:100, attributes:{"class":"ac"}}// <!-- 휴대전화 -->
               ,{field:"IdentityNumber", title:"<spring:message code='global.lbl.ssnCrnNo' />", width:150, attributes:{"class":"ac"}}// </th><!-- 증거번호 -->
               ,{field:"Amount", title:"<spring:message code='crm.lbl.amount'/>", width:100, attributes:{"class":"ar"}}// </th><!-- 지불금액 -->
               ,{field:"Name", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"al"}}// </th><!-- 고객명 -->
               ,{field:"Ispay", title:"<spring:message code='crm.lbl.isPay'/>", width:100, attributes:{"class":"ac"}}//지불완료여부
               ,{field:"PayNumber", title:"<spring:message code='crm.lbl.payNumber'/>", width:100, attributes:{"class":"ac"}}//지불넘버
               ,{field:"createtime", title:"<spring:message code='global.lbl.reqDt'/>",attributes:{"class":"ac"}        // 요청일
                   ,width:120
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"Status", title:"<spring:message code='crm.lbl.payStat'/>"
                   , width:100
                   , attributes:{"class":"ac"}
                   , template:'#if (Status !== ""){# #= paymentAccessPointsStatusMap[Status]# #}#'
               }// 지불상태
               ,{field:"regUsrId", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 등록자
               ,{field:"regDt", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 등록일
               ,{field:"updtUsrId", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 수정자
               ,{field:"updtDt", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 수정일
            ]
        });
        /******************비용지불 포인트취득 탭*************************************************************/




        /******************지불 포인트 취득 기록 탭*************************************************************/


        //조회
        $("#btnBMJoinHistory").kendoButton({
            click:function(e){

                if(crmJs.isDateValidPeriod($("#sStartJoinApproveDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndJoinApproveDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#BMJoinHistoryGrid").data("kendoExtGrid").dataSource.page(1);
                }else{
                    $("#sEndJoinApproveDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndJoinApproveDt").focus();
                    return false;
                }




            }
        }); // 버튼 종료

        //심사일자
        $("#sStartJoinApproveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sEndJoinApproveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 지불 포인트 취득 기록 그리드 설정
        $("#BMJoinHistoryGrid").kendoExtGrid({
            gridId:"G-CRM-0928-203000"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinHistorys.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCustNm"] = $("#sCustNmC").val();
                            params["sBlueMembershipNo"] = $("#sBMIdNo").val();
                            params["sStartDt"]    = $("#sStartJoinApproveDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"]      = $("#sEndJoinApproveDt").data("kendoExtMaskedDatePicker").value();

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"seq"
                                ,fields:{
                                    rnum:{type:"string"}
                                    ,dlrCd:{type:"string"}
                                    ,regDt:{type:"date"}
                                    ,blueAvlbPointVal:{type:"number"}
                                    ,amount:{type:"number"}
                                    ,regDtFormat:{type:"date"}
                                }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,autoBind:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,editable:false
            ,navigatable:true
            ,sortable:true
            ,selectable:"row"
            ,height:490
            ,columns:[
                {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"al"},width:150}    // 고객명
               ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo'/>",attributes:{"class":"ac"},width:150}    // 증서번호
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"},width:100}   // 휴대전화
               ,{field:"blueMembershipNo", title:"<spring:message code='crm.lbl.blueMembershipNo'/>",attributes:{"class":"ac"},width:120}   // 블루멤버십 번호
               ,{field:"blueGradeNm", title:"<spring:message code='global.lbl.BlueMbrShipReg'/>"     // 블루멤버십등급
                   ,attributes:{"class":"ac"},width:120
                   , template:'#if (blueGradeNm !== ""){# #= mLevelMap[blueGradeNm]# #}#'
               }
               ,{field:"blueAvlbPointVal", title:"<spring:message code='crm.lbl.getPoint'/>", attributes:{"class":"ar"}, width:80   // 취득포인트
                   ,format:"{0:n0}"
               }
               ,{field:"amount", title:"<spring:message code='crm.lbl.amount'/>", attributes:{"class":"ar"}, width:80   // 지불금액
                   ,format:"{0:n0}"
               }
               ,{field:"regUsrNm", title:"<spring:message code='global.lbl.pevalId'/>", width:100 ,attributes:{"class":"ac"}}   // 심사인
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.evalDt' />", width:100     //심사일자
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"

               }
            ]
        });
        /******************지불 포인트 취득 기록 탭*************************************************************/


        /******************블루멤버십 가입이력 탭 *************************************************************/
        //조회
        $("#btnBMJoinHisList").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#btnBMJoinHisListGrid").data("kendoExtGrid").dataSource.page(1);
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }
            }
        });

        //등록일
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //가입성공여부
        $("#sJoinApproveYn").kendoExtDropDownList({
            dataSource:['Y','N']
            ,optionLabel:" "
        });
        $("#sJoinApproveYn").data("kendoExtDropDownList").value("Y")

        // 블루멤버십 가입 이력 그리드 설정
        $("#btnBMJoinHisListGrid").kendoExtGrid({
            gridId:"G-CRM-1209-230301"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoins.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCustNm"] = $("#sCustNmH").val();
                            params["sVinNo"] = $("#sVinNoH").val();
                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sJoinApproveYn"] = $("#sJoinApproveYn").data("kendoExtDropDownList").value();

                            //console.log("params : ",kendo.stringify(params))
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"dlrCd"
                                ,fields:{
                                    rnum:{type:"string"}
                                    ,dlrCd:{type:"string"}
                                    ,custNo:{type:"string", validation:{required:true}} //고객번호
                                    ,custNm:{type:"string", validation:{required:true} } //고객명
                                    ,custTp:{type:"string",  validation:{required:true}} // 고객유형
                                    ,hpNo:{type:"string", validation:{required:true}} // 휴대전화
                                    //,carOwnYn:{type:"string", validation:{required:true}} //차주여부
                                    ,mathDocTp:{type:"string", validation:{required:true}} //신분증유형
                                    ,ssnCrnNo:{type:"string", validation:{required:true}} //신분증번호
                                    ,sungNm:{type:"string", validation:{required:true}} //성
                                    ,cityNm:{type:"string", validation:{required:true}} //시
                                    ,regUsrId:{type:"string", validation:{required:true}} //등록자
                                    ,regDt:{type:"date", validation:{required:true}} //등록일
                                    ,regDtFormat:{type:"date", validation:{required:true}} //등록일
                                    ,joinApproveYn:{type:"string", validation:{required:true}} //가입승인여부
                                    ,joinApproveDt:{type:"date", validation:{required:true}} //가입승인일자
                                    ,joinApproveDtFormat:{type:"date", validation:{required:true}} //가입승인일자
                                    ,blueMembershipNo:{type:"string", validation:{required:true}} //블루멤버쉽 번호
                                    ,blueMembershipJoinDt:{type:"date", validation:{required:true}} //블루멤버십 가입일자
                                    ,blueMembershipJoinDtFormat:{type:"date", validation:{required:true}} //블루멤버십 가입일자
                                    ,blueMembershipJoinDlrCd:{type:"string", validation:{required:true}} //블루멤버쉽 가입딜러코드
                                    ,payAmt:{type:"number", validation:{required:true}}// 지불 금액
                                    ,modelCd:{type:"string", validation:{required:true}}// 모델 코드
                                    ,modelNm:{type:"string", validation:{required:true}}// 모델 이름
                                    ,agree:{type:"string", validation:{required:true}}// 지불 여부(1: 지불 완료, 0: 미 지불 )
                                    ,vinNo:{type:"string", validation:{required:true}}// VIN 번호
                                }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                    elem.blueMembershipJoinDtFormat = kendo.parseDate(elem.blueMembershipJoinDt, "<dms:configValue code='dateFormat' />");
                                    elem.joinApproveDtFormat = kendo.parseDate(elem.joinApproveDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,autoBind:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,editable:false
            ,navigatable:true
            ,sortable:true
            ,selectable:"row"
            //,height:420
            ,columns:[
                {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"al"},width:150}    // 고객명
               ,{field:"custTp", title:"<spring:message code='global.lbl.custTp'/>", attributes:{"class":"ac"}  // 고객유형
                   ,width:80, sortable:false
                   ,template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
               }
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"},width:100}   // 휴대전화
               ,{field:"mathDocTp", title:"<spring:message code='global.lbl.mathDocTp'/>", attributes:{"class":"ac"}    // 증서유형
                   ,width:120, sortable:false
                   ,template:'#= mathDocTpArrVal(mathDocTp)#'
               }
               ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo'/>",attributes:{"class":"ac"},width:150}    // 증서번호
               ,{field:"agree", title:"<spring:message code='crm.lbl.agree'/>", attributes:{"class":"ac"},width:80} //지불 여부(1: 지불 완료, 0: 미 지불 )
               ,{field:"payAmt", title:"<spring:message code='crm.lbl.amount'/>", attributes:{"class":"ar"}, width:80   //지불금액
                   ,format:"{0:n2}"
                }
               ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo'/>", attributes:{"class":"al"},width:150}    // VIN 번호
               ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm'/>",attributes:{"class":"al"},width:150, sortable:false}  //  모델명칭
               ,{field:"blueMembershipNo", title:"<spring:message code='crm.lbl.blueMembershipNo'/>",attributes:{"class":"ac"},width:120}   // 블루멤버십 번호
               ,{field:"blueMembershipNo", title:"<spring:message code='crm.lbl.blueMembershipYn' />",  width:80    // 블루멤버회원
                   ,attributes:{"class":"ac"}
                   ,template:'#if (blueMembershipNo !== null ){# #= "Y"# #} else {# #= "N"# #}#'
               }
               ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId'/>", width:100 ,attributes:{"class":"ac"}}// 등록자
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.fincReqDt' />", width:100 // 신청일자
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"joinApproveYn", title:"<spring:message code='crm.lbl.joinApproveYn'/>",attributes:{"class":"ac"},width:80}// 가입성공여부
               ,{field:"remark", title:"<spring:message code='global.lbl.failReason'/>",attributes:{"class":"al"},width:150}// 실패사유
               ,{field:"joinApproveDtFormat", title:"<spring:message code='crm.lbl.joinApproveDt'/>",attributes:{"class":"ac"} // 가입일자
                   ,width:100
                   ,template:"#if (joinApproveDtFormat !== null ){# #= kendo.toString(data.joinApproveDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });
        /******************블루멤버십 가입이력 탭 *************************************************************/
    });

</script>
<!-- //script -->
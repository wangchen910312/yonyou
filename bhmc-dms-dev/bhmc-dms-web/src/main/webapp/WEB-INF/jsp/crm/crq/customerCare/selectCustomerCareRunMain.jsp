<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

        <div id="resizableContainer">
            <!-- 고객케어미션 관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.custCareRun' /><!-- 고객케어 실행--></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11365" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnTargTrsfCall"><spring:message code='crm.lbl.callSend' /><!-- 콜센터 전송 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11366" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11367" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnSearch" >
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
                                <th scope="row"><spring:message code='crm.lbl.custCareNm' /><!-- 고객케어명 --></th>
                                <td>
                                    <input type="text" id="sCustCareNm" name="sCustCareNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></th>
                                <td>
                                    <input id="sActiveTpCd" name="sActiveTpCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.autoActiveYn' /><!-- 자동발송여부 --></th>
                                <td>
                                    <input id="sAutoActiveYn" name="sAutoActiveYn" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="custCareMgmtGrid"></div>
                </div>
            <!-- //고객케어미션 관리 -->

            <!-- 대상자목록 -->
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='global.title.targetList' /><!-- 대상자 리스트 --> <span id="targetCnt"></span></h3>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11368" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnMessage"><spring:message code='global.btn.message' /><!-- 메시지 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11369" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnTargDel"><spring:message code='crm.btn.targDel' /><!-- 대상자 삭제 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11370" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_search" id="btnTargSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnTargSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col>
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 客户--></th>
                                <td>
                                    <input type="text" id="sCust" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnTargSearch" >
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
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="sHpNo" name="sHpNo" class="form_input numberic" maxlength="14" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.telNo" /><!-- 집전화 --></th>
                                <td>
                                    <input id="sTelNo" name="sTelNo" class="form_input numberic" maxlength="14" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.extrDgreCnt' /><!-- 추출차수 --></th>
                                <td>
                                    <input type="text" id="sExtrDgreCnt" name="sExtrDgreCnt" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.smsSendYn' /><!-- SMS발신여부 --></th>
                                <td>
                                    <input id="sSmsSendYn" name="sSmsSendYn" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.callCenSendYn' /><!-- 콜센터 전송 여부 --></th>
                                <td>
                                    <input id="sCallCenSendYn" name="sCallCenSendYn" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="targetGrid" class="resizable_grid">
                    </div>
                </div>

            </section>
            <!-- //대상자목록 -->
        </div>

            <script type="text/javascript">

                // TODO 대상자 목록 더블클릭시 실행 상세내역 팝업 오픈
                $("#targetGrid").on("dblclick", "tr.k-state-selected", function (e) {

                    var grid = $("#targetGrid").data("kendoExtGrid");
                    var selectedItem = grid.dataItem(grid.select());

                    if( dms.string.isNotEmpty(selectedItem) ){
                        //console.log("selectedItem ::",selectedItem)
                    }

                });

                var custCareSeq
                ;

                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어유형 DS
                var activeTpCdDs = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                function initForm(){

                    $("#btnMessage").data("kendoButton").enable(false);
                    $("#btnTargTrsfCall").data("kendoButton").enable(false);
                    $("#btnExcelExport").data("kendoButton").enable(false);
                    $("#btnTargDel").data("kendoButton").enable(false);
                    $("#btnTargSearch").data("kendoButton").enable(false);
                    //$("#targetGrid").data("kendoExtGrid").dataSource.data([]);

                }

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                     var grid = $("#targetGrid").data("kendoExtGrid"),
                     row = $(e.target).closest("tr");
                     var dataItem = grid.dataItem(row);

                     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
                });

                function gridCommonParams() {

                    var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                    var selectedVal = grid.dataItem(grid.select());
                    var params = {};

                    if ( dms.string.isNotEmpty(selectedVal) ) {

                        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
                        params["sCustCareSeq"] = selectedVal.custCareSeq;
                        params["sCust"] = $("#sCust").val();
                        params["sCustNm"] = $("#sCustNm").val();
                        params["sHpNo"]   = $("#sHpNo").val();
                        params["sTelNo"]  = $("#sTelNo").val();
                        params["sExtrDgreCnt"] = $("#sExtrDgreCnt").val();
                        params["sSmsSendYn"] = $("#sSmsSendYn").data("kendoExtDropDownList").value();
                        params["sCallCenSendYn"] = $("#sCallCenSendYn").data("kendoExtDropDownList").value();

                    }

                    return params;

                };

                $(document).ready(function() {

                    // s실행유형
                    $("#sActiveTpCd").kendoExtDropDownList({
                        dataSource:activeTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // sSMS 전송여부
                    $("#sAutoActiveYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    /*

                    // s시작일
                    $("#sStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#sEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });


                    // s추출차수
                    $("#sExtrDgreCnt").kendoExtNumericTextBox({
                         format:"#"
                        ,min:0
                        ,value:0
                    });
                     */

                     // show/hide
                     $("#btnHidden").kendoButton({
                         click:function(e){
                             $("#hiddenTable").toggle();
                             resizeGrid();
                         }
                     });

                     var onlyNum = new RegExp("[^0-9]","i");
                     $(".numberic").keyup(function(e)
                     {
                         var content = $(this).val();
                         if(content.match(onlyNum)){
                             $(this).val('');
                         }
                     });

                    // sSMS 전송여부
                    $("#sSmsSendYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s콜센터 전송여부
                    $("#sCallCenSendYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 메시지
                    $("#btnMessage").kendoButton({
                        click:function(e){

                            var   grid = $("#targetGrid").data("kendoExtGrid")
                                , rows = grid.select()
                                , dataItem
                                , dataValidate  = false
                                , smsTmplUserGroup = "Y"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                                , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                                , smsTmplUserList = []              // sms 전송 대상자 목록
                                , custCareMgmtGrid = $("#custCareMgmtGrid").data("kendoExtGrid")
                                , selectedItem = custCareMgmtGrid.dataItem(custCareMgmtGrid.select())
                                , refKeyNm
                                , refTableNm = "CR_0502T"
                                , contactBizCd = "09"
                            ;

                            if (rows.length <= 0) {
                                //목록을 선택하여 주십시오.
                                dms.notification.info("<spring:message code='global.info.required.select'/>");
                                return;
                            }

                            refKeyNm = selectedItem.custCareSeq   // 단건 일때는 여기서 변수지정, List 일때는 smsTmplUserList 에서 변수지정

                            // SMS 대상자가 다건일경우 smsTmplUserList에 리스트로 담아서 보내면되고ㅡ, 단건이면 smsTmplUserList에 1건만 담아서 리스트로 보내면 됩니다.
                            rows.each(function(index, row) {

                                dataItem = grid.dataItem(row);

                                if ( dms.string.isEmpty(dataItem.custNo) || dms.string.isEmpty(dataItem.custNm) ) {
                                    // {고객정보}을(를) 확인하여 주세요.
                                    dms.notification.success("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    smsTmplUserList = [];
                                    dataValidate = true;
                                    return false;
                                };

                                if ( dms.string.isEmpty(dataItem.hpNo) ) {
                                    // {휴대전화}을(를) 확인하여 주세요.
                                    dms.notification.success("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    smsTmplUserList = [];
                                    dataValidate = true;
                                    return false;
                                };

                                smsTmplUserList.push({
                                    "custNo" :dataItem.custNo
                                  , "custNm" :dataItem.custNm
                                  , "hpNo"   :dataItem.hpNo
                                  , "refKeyNm":dataItem.targCustSeq
                                  , "refTableNm":refTableNm
                                });


                            });
                            if(dataValidate){ return false; }

                            // SMS 전송 대상자를 임시 테이블에 저장
                            if ( smsTmplUserGroup === "Y" ) {

                                $.ajax({
                                    url:"<c:url value='/crm/cmm/customerInfo/insertSmsTmplUsers.do' />"
                                    ,data:JSON.stringify(smsTmplUserList)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,async:false
                                    ,error:function(jqXHR, status, error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    }
                                    ,success:function(jqXHR, textStatus) {

                                        if ( jqXHR > 0 && textStatus === "success" ) {
                                            smsTmplUserSeq = jqXHR;
                                        } else {
                                            smsTmplUserSeq = ""
                                        }

                                    }
                                });

                                smsTmplUserList = [];

                            } else if ( smsTmplUserGroup === "N" ) {

                                smsTmplUserSeq = ""
                            }

                            messagePopupWindow = dms.window.popup({
                                windowId:"messagePopupWindow"
                                , title:"<spring:message code='global.title.msgTransmission' />"   // 메시지전송
                                , width:"520px"
                                , height:"475px"
                                , content:{
                                    url:"<c:url value='/crm/cmm/customerInfo/selectMessagePopup.do'/>"
                                    , data:{
                                        "autoBind":false

                                        , "smsTmplUserList":smsTmplUserList
                                        , "smsTmplUserSeq" :smsTmplUserSeq

                                        , "contactBizCd"   :contactBizCd
                                        , "refTableNm"     :refTableNm
                                        , "refKeyNm"       :refKeyNm

                                        , "callbackFunc":function(data){

                                            if(data == "success"){

                                                messagePopupWindow.close();
                                                // 전송 / 이 완료 되었습니다.
                                                dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                                $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

                                            }

                                        }
                                    }
                                }
                            });

                        }
                        , enable:false
                    });

                    // 콜센터 전송
                    $("#btnTargTrsfCall").kendoButton({
                        click:function(e){

                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isEmpty(selectedVal) ) {

                                // 고객케어명 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.custCareNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;

                            } else if ( dms.string.isNotEmpty(selectedVal) ) {

                                var custCareSeq = selectedVal.custCareSeq;
                                var extrDgreCnt = selectedVal.extrDgreCnt;
                                var activeTpCd = selectedVal.activeTpCd;

                                if ( activeTpCd !== "01" ) {
                                    // 실행유형이 전화인경우에만 콜센터 전송이 가능합니다.
                                    dms.notification.warning("<spring:message code='crm.info.callSendChk' />");
                                    return;
                                }

                                if ( dms.string.isEmpty(custCareSeq) ) {
                                        // {고객케어일련번호}을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custCareSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(extrDgreCnt) ) {
                                    // {추출차수}을(를) 확인하여 주세요.
                                    dms.notification.warning("<spring:message code='crm.lbl.extrDgreCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if ( selectedVal.custExtrAutoYn !== "N" ) {
                                        // {대상자자동추출}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                var param = {
                                          "custCareSeq":custCareSeq
                                        , "extrDgreCnt":extrDgreCnt
                                        , "activeTpCd":activeTpCd
                                }
                                //console.log("saveData:",JSON.stringify(param));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/insertExtrTargetTrsfCallCenter.do' />",
                                    data:JSON.stringify(param),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {

                                        //console.log("jqXHR:",jqXHR)
                                        //console.log("status:",status)
                                        //console.log("error:",error)

                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        //console.log("jqXHR:" ,jqXHR)
                                        //console.log("textStatus:" ,textStatus)

                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR === "00" ){
                                            // {콜센터 전송}이(가) 완료 되었습니다.
                                            dms.notification.success("<spring:message code='crm.btn.callSend' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                            $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

                                        } else if(textStatus == "success" && jqXHR === "02" ){
                                            // {콜센터 전송}할 데이터가 존재하지 않습니다.
                                            dms.notification.info("<spring:message code='crm.lbl.callSend' var='arguMsg' /><spring:message code='global.info.notExistData' arguments='${arguMsg}'/>");
                                            //$("#targetGrid").data("kendoExtGrid").dataSource.page(1);
                                        } else {
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.error("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                    ,beforeSend:function(xhr) {
                                        dms.loading.show();
                                    }
                                    ,complete:function(xhr, status) {
                                        dms.loading.hide();
                                    }
                                });


                            }





                        }
                        , enable:false
                    });

                    //엑셀Export
                    $("#btnExcelExport").kendoButton({
                        click:function(e) {

                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isNotEmpty(selectedVal) ) {

                                var params = {};
                                params = gridCommonParams();

                                // 고객케어 대상자 엑셀Export 수량 데이터를 조회한다.
                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareExtrTargetsExcelExportCnt.do' />",
                                    data:JSON.stringify(params),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(resultCnt) {

                                        //console.log("resultCnt : ",resultCnt)
                                        <c:set value="10000" var="maxCnt" />;
                                        var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                                        if ( resultCnt > excelMaxExportCnt ) {
                                            // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                                            dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                                            return;
                                        };

                                        dms.ajax.excelExport({
                                            "beanName":"customerCareExtrTargetService"
                                            ,"templateFile":"CustomerCareExtrTarget_Tpl.xlsx"
                                            ,"fileName":"<spring:message code='crm.menu.custCareRun' />_<spring:message code='global.title.targetList' />_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                                            ,"sCustCareSeq":selectedVal.custCareSeq
                                            ,"sCust":$("#sCust").val()
                                            ,"sCustNm":$("#sCustNm").val()
                                            ,"sHpNo":$("#sHpNo").val()
                                            ,"sTelNo":$("#sTelNo").val()
                                            ,"sExtrDgreCnt":$("#sExtrDgreCnt").val()
                                            ,"sSmsSendYn":$("#sSmsSendYn").data("kendoExtDropDownList").value()
                                            ,"sCallCenSendYn":$("#sCallCenSendYn").data("kendoExtDropDownList").value()
                                        });

                                    }
                                });

                            } else {
                                //목록을 선택하여 주십시오.
                                dms.notification.info("<spring:message code='global.info.required.select'/>");
                                return;
                            }

                        }
                        , enable:false
                    });

                    //조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                            initForm();
                        }
                    });

                    //대상자 삭제
                    $("#btnTargDel").kendoButton({
                        click:function(e){

                            var grid = $("#targetGrid").data("kendoExtGrid")
                                ,rows = grid.select()
                                ,dataValidate = false
                                ,dataItem
                            ;

                            // 콜센터 전송 / SMS 발송 이력이 있으면 삭제 안됨
                            rows.each(function(index, row) {

                                dataItem = grid.dataItem(row);

                                if ( dms.string.isNotEmpty(dataItem.callCenSendDt) ) {
                                    // {콜센터 전송일}을(를) 확인하여 주세요.
                                    dms.notification.info("<spring:message code='crm.lbl.callCenSendDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    dataValidate = true;
                                    return false;
                                }

                                if ( dms.string.isNotEmpty(dataItem.smsSendDt) ) {
                                    // {SMS전송일자}을(를) 확인하여 주세요.
                                    dms.notification.info("<spring:message code='crm.lbl.smsSendDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    dataValidate = true;
                                    return false;
                                }

                            });

                            if(dataValidate){ return false; };

                            // validation 확인후 삭제
                            rows.each(function(index, row) {
                                grid.removeRow(row);
                            });

                            saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["regDtFormat", "smsSendDtFormat", "callCenSendDtFormat", "callCenRsltDtFormat"]);
                            if (grid.cudDataLength == 0) {
                                //변경된 정보가 없습니다.
                                dms.notification.info("<spring:message code='global.info.required.change'/>");
                                return;
                            };

                            if (grid.gridValidation()) {

                                //console.log("saveDate:",JSON.stringify(saveData));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/deleteExtrTarget.do' />"
                                    ,data:JSON.stringify(saveData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR,status,error) {

                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(jqXHR, textStatus) {

                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);

                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                        $("#targetGrid").data("kendoExtGrid").dataSource.page(1);
                                    }
                                    ,beforeSend:function(xhr) {
                                        dms.loading.show();
                                    }
                                    ,complete:function(xhr, status) {
                                        dms.loading.hide();
                                    }
                                });
                            }else{
                                //입력값을 확인하여 주십시오.
                                dms.notification.warning("<spring:message code='global.info.check.input'/>");

                            }

                        }
                        , enable:false
                    });

                    // 조회
                    $("#btnTargSearch").kendoButton({
                        click:function(e){

                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedItem = grid.dataItem(grid.select());

                            if (dms.string.isNotEmpty(selectedItem)) {

                                $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

                            }

                        }
                        , enable:false
                    });

                    // 고객캐어 그리드 시작
                    $("#custCareMgmtGrid").kendoExtGrid({
                        gridId:"G-CRM-0721-112702"
                        ,dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareRuns.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sCustCareNm"] = $("#sCustCareNm").val();
                                        params["sActiveTpCd"] = $("#sActiveTpCd").data("kendoExtDropDownList").value();
                                        params["sAutoActiveYn"] = $("#sAutoActiveYn").data("kendoExtDropDownList").value();

                                        //console.log("custCareMgmtGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"custCareSeq"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,custCareSeq:{type:"number"}
                                        ,custCareNm:{type:"string"}
                                        ,useYn:{type:"string"}
                                        ,activeTpCdNm:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,activeTmplId:{type:"string"}
                                        ,custExtrTermCd:{type:"string"}
                                        ,custExtrAutoYn:{type:"string"}
                                        ,custExtrTermPrid:{type:"string"}
                                        ,custCareCont:{type:"string"}
                                        ,regUsrNm:{type:"string"}
                                        ,updtDt:{type:"date"}
                                        ,regDt:{type:"date"}
                                        ,regDtFormat:{type:"date", editable:false}
                                        ,startDt:{type:"date"}
                                        ,startDtFormat:{type:"date", editable:false}
                                    }
                                }
                                ,parse:function(d) {
                                    if(d.data){
                                        $.each(d.data, function(idx, elem) {
                                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                            elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                                        });
                                    }
                                    return d;
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            var custCareSeq = selectedItem.custCareSeq;
                            var custExtrAutoYn = selectedItem.custExtrAutoYn;

                            if (dms.string.isNotEmpty(custCareSeq)) {
                                initForm();
                                $("#targetGrid").data("kendoExtGrid").dataSource.page(1);
                            } else {
                                $("#targetGrid").data("kendoExtGrid").dataSource.data([]);
                            }

                        }
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                                ,filterable:false
                            }
                            ,{field:"custCareNm", title:"<spring:message code='crm.lbl.custCareNm' />", width:150}                //고객케어명
                            ,{field:"custCareCont", title:"<spring:message code='crm.lbl.custCareCont' />", width:150}            //고객케어내용
                            ,{field:"activeTpCdNm", title:"<spring:message code='crm.lbl.activeTpCd' />", width:100               //실행유형
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:100         //대상자자동추출
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrTermCdNm", title:"<spring:message code='crm.lbl.custExtrTermCd' />", width:100       //고객추출조건코드
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrTermPrid", title:"<spring:message code='crm.lbl.custExtrTermPrid' />", width:100     //고객추출주기 일(기간)
                                ,attributes:{ "style":"text-align:right"}
                            }
                            ,{field:"extrDgreCnt", title:"<spring:message code='crm.lbl.extrDgreCnt' />", width:100               //추출차수
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"startDtFormat", title:"<spring:message code='crm.lbl.startDt' />", width:100                 //시작일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (startDtFormat!== null ){# #= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                            ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:60                            //사용여부
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100}                 //등록자
                            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100                  //등록일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                        ]
                      //,autoBind:false
                        ,editable:false
                        ,height:200
                        ,navigatable:false
                        //,selectable:"row"
                        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
                        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                        ,enableTooltip:true               //Tooltip 적용, default:false
                    });
                    // 고객캐어 그리드 종료

                    // 대상자 목록 그리드 시작 //
                    $("#targetGrid").kendoExtGrid({
                        gridId:"G-CRM-0721-112703"
                        ,dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareExtrTargets.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        // 고객케어 리스트 그리드의 선택된 CUST_NO
                                        var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());

                                        if ( dms.string.isNotEmpty(selectedVal) ) {

                                            params = $.extend(params, gridCommonParams());

                                        }

                                        //console.log("targetGrid:"+kendo.stringify(params));
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"targCustSeq"
                                    ,fields:{
                                          dlrCd:{type:"string"}
                                        ,custCareSeq:{type:"number"}
                                        ,targCustSeq:{type:"number"}
                                        ,extrDgreCnt:{type:"number"}
                                        ,custNo:{type:"string"}
                                        ,telNo:{type:"string"}
                                        ,hpNo:{type:"string"}
                                        ,wechatId:{type:"string"}
                                        ,emailNm:{type:"string"}
                                        ,sungNm:{type:"string"}
                                        ,cityNm:{type:"string"}
                                        ,distNm:{type:"string"}
                                        ,zipCd:{type:"string"}
                                        ,extZipCd:{type:"string"}
                                        ,addrNm:{type:"string"}
                                        ,addrDetlCont:{type:"string"}
                                        ,smsSendDt:{type:"date"}
                                        ,receiveRsltCdNm:{type:"string"}
                                        ,callCenSendDt:{type:"date"}
                                        ,callCenRsltDt:{type:"date"}
                                        ,regUsrId:{type:"string"}
                                        ,regDt:{type:"date"}
                                        ,updtUsrId:{type:"string"}
                                        ,updtDt:{type:"date"}
                                        ,cmmCdTxt:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,custNm:{type:"string"}
                                        ,usrNm:{type:"string"}
                                        ,regDtFormat:{type:"date", editable:false}
                                        ,smsSendDtFormat:{type:"date", editable:false}
                                        ,callCenSendDtFormat:{type:"date", editable:false}
                                        ,callCenRsltDtFormat:{type:"date", editable:false}
                                    }
                                }
                                ,parse:function(d) {
                                    if(d.data){
                                        $.each(d.data, function(idx, elem) {
                                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                            elem.smsSendDtFormat = kendo.parseDate(elem.smsSendDt, "<dms:configValue code='dateFormat' />");
                                            elem.callCenSendDtFormat = kendo.parseDate(elem.callCenSendDt, "<dms:configValue code='dateFormat' />");
                                            elem.callCenRsltDtFormat = kendo.parseDate(elem.callCenRsltDt, "<dms:configValue code='dateFormat' />");
                                        });
                                    }
                                    return d;
                                }

                            }
                        }
                    /*
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            custCareSeq = selectedItem.custCareSeq;

                            if (dms.string.isNotEmpty(custCareSeq)) {

                                $("#btnTargDel").data("kendoButton").enable(true);
                                $("#btnCallReg").data("kendoButton").enable(true);
                                $("#btnMessage").data("kendoButton").enable(true);
                                $("#btnTargSearch").data("kendoButton").enable(true);

                            }

                        }
                         */
                        ,dataBound:function(e) {


                            //console.log("1111")
                            // TODO dataBound 두번 호출되는거 확인.... 버튼이 껌뻑이네..

                            //console.log(this);
                            //console.log("s_sortable ::",this.options.sortable );
                            //this.options.sortable = true;

                            var targetCnt = e.sender.dataSource._total;
                            if ( targetCnt > 0 ) {

                                $("#btnExcelExport").data("kendoButton").enable(true);
                                $("#btnTargDel").data("kendoButton").enable(true);
                                $("#btnTargSearch").data("kendoButton").enable(true);
                                $("#btnMessage").data("kendoButton").enable(true);

                                $("#targetCnt").text(":"+targetCnt+"<spring:message code='crm.lbl.people' />");

                                var custCareMgmtGrid = $("#custCareMgmtGrid").data("kendoExtGrid");
                                var selectedItem = custCareMgmtGrid.dataItem(custCareMgmtGrid.select());

                                //수동추출 & 시작일 이후면 콜센처 전송버튼 활성화
                                if ( selectedItem.custExtrAutoYn === "N" && kendo.parseDate("${sysDate}") >= kendo.parseDate(selectedItem.startDt) ) {
                                    $("#btnTargTrsfCall").data("kendoButton").enable(true);
                                };

                                //this.options.sortable = true;

                            } else {

                                $("#targetCnt").text("");
                                //this.options.sortable = false;

                            }

                            //console.log("e_sortable ::",this.options.sortable );

                        }
                       ,columns:[
                             {field:"dlrCd"            , title:"<spring:message code='global.lbl.dlrCd' />", width:100, hidden:true}             // 딜러코드
                            ,{field:"custCareSeq"      , title:"<spring:message code='crm.lbl.custCareSeq' />", width:100, hidden:true}          // 고객케어일련번호
                            ,{field:"custNo"           , title:"<spring:message code='global.lbl.custNo' />", width:100, hidden:true}            // 고객번호
                            ,{field:"custExtrTermCd"   , title:"<spring:message code='crm.lbl.custExtrTermCd' />", width:100, hidden:true}       // 고객추출조건
                            ,{field:"regUsrId"         , title:"<spring:message code='global.lbl.regUsrId' />", width:100, hidden:true}          // 등록자
                            ,{field:"updtUsrId"        , title:"<spring:message code='global.lbl.updtUsrId' />", width:100, hidden:true}         // 수정자
                            ,{field:"updtDt"           , title:"<spring:message code='global.lbl.updtDt' />", width:100, hidden:true}            // 수정일

                            ,{field:"autoActiveYn"     , title:"<spring:message code='crm.lbl.autoActiveYn' />", width:100, hidden:true          // 자동발송여부
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"extrDgreCnt"      , title:"<spring:message code='crm.lbl.extrDgreCnt' />", width:100         //추출차수
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"activeTpCdNm", title:"<spring:message code='crm.lbl.activeTpCd' />", width:100               //실행유형
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"smsSendDt", hidden:true}
                            ,{field:"smsSendDtFormat", title:"<spring:message code='crm.lbl.smsSendDt' />", width:100             //SMS전송일자
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (smsSendDtFormat !== null ){# #= kendo.toString(data.smsSendDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }

                            ,{field:"receiveRsltCdNm"  , title:"<spring:message code='crm.lbl.smsSendRsltCont' />", width:100
                                , attributes:{"class":"ac"}
                            }    //SMS전송결과
                            ,{field:"callCenSendDtFormat", title:"<spring:message code='crm.lbl.callCenSendDt' />", width:100     //콜센터 전송일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (callCenSendDtFormat !== null ){# #= kendo.toString(data.callCenSendDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                            ,{field:"callCenRsltDtFormat", title:"<spring:message code='crm.lbl.callCenRsltDt' />", width:100     //콜센터결과일자
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (callCenRsltDtFormat !== null ){# #= kendo.toString(data.callCenRsltDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                            ,{field:"callRsltCdNm"  , title:"<spring:message code="crm.lbl.callRsltCd" />", width:100,sortable:false}    //콜결과
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100                    //고객명
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            ,{field:"hpNo"             , title:"<spring:message code='global.lbl.hpNo' />", width:100}            //휴대전화
                            ,{field:"telNo"            , title:"<spring:message code='global.lbl.telNo' />", width:100}           //전화번호
                            ,{field:"wechatId"         , title:"<spring:message code='global.lbl.wechatId' />", width:100}        //Wechat ID
                            ,{field:"emailNm"          , title:"<spring:message code='global.lbl.emailNm' />", width:100}         //이메일
                            ,{field:"sungNm"           , title:"<spring:message code='global.lbl.sungNm' />", width:100}          //성 이름
                            ,{field:"cityNm"           , title:"<spring:message code='global.lbl.cityNm' />", width:100}          //도시명
                            ,{field:"distNm"           , title:"<spring:message code='global.lbl.distNm' />", width:100}          //지역명
                            ,{field:"zipCd"            , title:"<spring:message code='global.lbl.zipCd' />", width:100}           //우편번호
                            ,{field:"extZipCd"         , title:"<spring:message code='global.lbl.extZipCd' />", width:100}        //확장우편번호
                            ,{field:"addrNm"           , title:"<spring:message code='crm.lbl.addrNm' />", width:100}             //주소
                            ,{field:"addrDetlCont"     , title:"<spring:message code='crm.lbl.addrDetlCont' />", width:100}       //상세주소
                            ,{field:"regUsrNm"         , title:"<spring:message code='global.lbl.regUsrId' />", width:100}        //등록자
                            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100                  //등록일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                       ]
                       ,autoBind:false
                       ,editable:false
                       ,navigatable:false
                       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                       ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
                       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                       ,enableTooltip:true               //Tooltip 적용, default:false
                       //,navigatable:false
                       //,pageable:false
                       //,sortable:false
                       ,selectable:"multiple"
                   });
                   // 대상자 목록 그리드 종료 //


                });

            </script>
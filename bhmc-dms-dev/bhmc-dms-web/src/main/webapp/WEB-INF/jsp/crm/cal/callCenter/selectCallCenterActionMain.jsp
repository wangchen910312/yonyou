<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">
            <!-- CALL 조회 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.title.callSearch" /><!-- OB 실행 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11373" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11374" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnMessage" class="btn_m">SMS<!-- SMS --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11375" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-13233" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">

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
                <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnSearch" ">
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
                                <th scope="row"><spring:message code="crm.lbl.bizCd" /><!-- 업무구분--></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" >
                                            <input id="sBizCd" name="sBizCd" class="form_comboBox" />
                                        </div>
                                        <div class="form_right">
                                            <input id="sBizSubCd" name="sBizSubCd" class="form_comboBox" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.title.bizTitle' /><!-- 업무명 --></th>
                                <td>
                                    <input type="text" id="sCallBizTitleNm" name="sCallBizTitleNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.callPrsnId' /><!-- 콜담당자ID --></th>
                                <td>
                                    <input id="sCallPrsnId" name="sCallPrsnId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.callStat" /><!-- 콜상태 --></th>
                                <td>
                                    <input id="sCallProcEndYn" name="sCallProcEndYn" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt' /></th> <!-- 등록일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartRegDt" name="sStartRegDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndRegDt" name="sEndRegDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="callCenterActionGrid" class="resizable_grid"></div>
                </div>

            </section>
            <!-- //CALL 조회 -->
        </div>
        <!-- //콜센터실행-->

        <script>

            var callcenterPopupWindow;
            var messagePopupWindow;
            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/
            // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
            $("#callCenterActionGrid").on("dblclick", "tr.k-state-selected", function (e) {

                var gridId = e.delegateTarget.id
                  , grid = $("#"+gridId+"").data("kendoExtGrid")
                  , selectedItem = grid.dataItem(grid.select())
                ;

                console.log("gridId ::: ",gridId)
                console.log("더블클릭 selectedItem ::: ",selectedItem)
                if ( dms.string.isNotEmpty(selectedItem) ){
                    // 상세조회 후 팝업오픈
                    viewDetail(selectedItem);
                } else {
                    // 선택해주세요.
                    dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                    return;
                }

            });

            function viewDetail(selectedItem){

                console.log("selectedItem : ",selectedItem)
                // 상세 조회
                if ( dms.string.isNotEmpty(selectedItem) ) {

                    var callSeq = selectedItem.callSeq;
                    var bizCd = selectedItem.bizCd;

                    var param = {
                            "sCallSeq":callSeq
                            ,"sBizCd":bizCd
                            };

                    //console.log("콜센터실행 상세 조회 파람:",JSON.stringify(param));
                    //return;

                    callcenterPopupWindow = dms.window.popup({
                        windowId:"callcenterPopupWindow"
                        , title:"<spring:message code='crm.title.callActionInfo' />"<!-- OB 실행정보 -->
                        , width:"950px"
                        , height:"500px"
                        , content:{
                            url:"<c:url value='/crm/cal/callCenter/selectCallCenterActionPopup.do' />"
                            , data:{
                                "autoBind":false
                                ,"callSeq":callSeq
                                ,"bizCd":bizCd
                                , "callbackFunc":function(data){

                                    if(dms.string.isNotEmpty(data)){


                                        //console.log("저장완료 - data : ",data)
                                        // 저장 / 이 완료 되었습니다.
                                        dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                        $("#callCenterActionGrid").data("kendoExtGrid").dataSource.page(1);

                                        resultKey = data;
                                        isGridReload = true;

                                        // 팝업 닫기
                                        callcenterPopupWindow.close();

                                    }

                                }
                            }
                        }
                    });


                };

            };      //fucniton 종료
            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/

            // 업무구분 DS
            var bizCdListDs = [];
            <c:forEach var="obj" items="${bizCdList}">
            <c:if test="${obj.remark1 == '10'}">
                bizCdListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
            </c:if>
            </c:forEach>

            // 만족도 조사 타입 DS
            var stsfIvstTpCdListDs = [];
            <c:forEach var="obj" items="${stsfIvstTpCdList}">
                stsfIvstTpCdListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
            </c:forEach>

            // 마케팅 유형 DS
            var makTpListDs = [];
            <c:forEach var="obj" items="${makTpList}">
                makTpListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
            </c:forEach>

            /**
            * hyperlink in grid event of Customer Information
            */
            $(document).on("click", ".linkCust", function(e){

                 var grid = $("#callCenterActionGrid").data("kendoExtGrid"),
                 row = $(e.target).closest("tr");
                 var dataItem = grid.dataItem(row);

                 window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
            });


            // 팝업창에서 VIN 팝업 띄우기
            function fn_custVinSearchPopUp(iframe, autoBind, type, custNo) {

                popupWindow = dms.window.popup({
                    windowId:"customerHaveCarSearchPopupMain"
                    ,title:"<spring:message code='global.lbl.haveCar' />"   // 보유차량
                    ,height:330
                    //,width:900
                    ,content:{
                         url:"<c:url value='/crm/cif/customerInfo/selectCustHaveCarSearchPopup.do'/>"
                         , data:{
                             "autoBind":true
                            ,"custNo":custNo
                            ,"callbackFunc":function(data){
                                if (data.length >= 1) {

                                    var windowElement = $("#"+iframe);
                                    var iframeDomElement = windowElement.children("iframe")[0];
                                    var iframeWindowObject = iframeDomElement.contentWindow;
                                    popupWindow.close();
                                    iframeWindowObject.fn_custVinSearchRlt(data);

                                }
                            }
                         }
                    }
                });

            };


            // 검색조건 : 등록일 시작일-종료일 날짜 비교
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


            function gridCommonParams() {

                var params = {};

                // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
                params["sCust"] = $("#sCust").val();
                params["sCustNm"] = $("#sCustNm").val();
                params["sHpNo"]   = $("#sHpNo").val();
                params["sTelNo"]  = $("#sTelNo").val();
                params["sBizCd"]  = $("#sBizCd").data("kendoExtDropDownList").value();
                params["sBizSubCd"]  = $("#sBizSubCd").data("kendoExtDropDownList").value();

                params["sCallBizTitleNm"] = $("#sCallBizTitleNm").val();
                params["sCallPrsnId"] = $("#sCallPrsnId").data("kendoExtDropDownList").value();
                params["sCallProcEndYn"]  = $("#sCallProcEndYn").data("kendoExtDropDownList").value();
                params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                params["sEndRegDt"] = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                params["sListTp"] = "R";

                return params;

            };


            $(document).ready(function() {

                var   isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                ;

                /********************************************* 검색조건 시작 */
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

                // 업무구분
                $("#sBizCd").kendoExtDropDownList({
                    dataSource:bizCdListDs
                    , dataTextField:"cmmCdNm"
                    , dataValueField:"cmmCd"
                    , optionLabel:" "
                    , index:0
                    , select:function(e){

                        var dataItem = this.dataItem(e.item);
                        var cmmCd = dataItem.cmmCd;

                        $("#sBizSubCd").data("kendoExtDropDownList").setDataSource([]);
                        $("#sBizSubCd").data("kendoExtDropDownList").enable(false);

                        if ( cmmCd === "05" ) {

                            $("#sBizSubCd").data("kendoExtDropDownList").enable(true);
                            $("#sBizSubCd").data("kendoExtDropDownList").setDataSource(stsfIvstTpCdListDs);

                        } else if ( cmmCd === "06" ) {

                            $("#sBizSubCd").data("kendoExtDropDownList").enable(true);
                            $("#sBizSubCd").data("kendoExtDropDownList").setDataSource(makTpListDs);

                        };

                    }

                });
                // 업무구분 SUB
                $("#sBizSubCd").kendoExtDropDownList({
                      dataTextField:"cmmCdNm"
                    , dataValueField:"cmmCd"
                    , optionLabel:" "
                    , enable:false
                });

                // 콜상태
                $("#sCallProcEndYn").kendoExtDropDownList({
                    dataSource:[{text:"<spring:message code='global.lbl.incomplete' />", value:"incomplete"},{text:"<spring:message code='global.lbl.complete' />", value:"complete"}]
                    , dataTextField:"text"
                    , dataValueField:"value"
                    , optionLabel:" "
                    , index:1
                });

                // S 판매고문
                $("#sCallPrsnId").kendoExtDropDownList({
                      dataTextField:"usrNm"
                    , dataValueField:"usrId"
                    , optionLabel:" "
                    , index:0
                });

                // 판매고문이 아닌경우 로그인한 아이디로 조회.
                var assignUserDS = [];
                var sCallPrsnId = $("#sCallPrsnId").data("kendoExtDropDownList");
                var hasRole = false;
                hasRole = <c:out value="${hasRole}" />;

                if ( hasRole ) {
                    // 판매고문 목록
                    <c:forEach var="obj" items="${assignUserList}">
                        assignUserDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                    </c:forEach>
                    sCallPrsnId.setDataSource(assignUserDS);
                } else {
                    sCallPrsnId.setDataSource([{"usrNm":"<c:out value='${userNm}' />", "usrId":"<c:out value='${userId}' />" }]);
                    sCallPrsnId.select(1)
                    sCallPrsnId.enable(false);
                };

                // 등록일
                $("#sStartRegDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                    ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                });

                // 등록일
                $("#sEndRegDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                    ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                });

                /********************************************* 검색조건 종료 */


                /********************************************* 메인 그리드 버튼 시작 */
                // 상세정보
                $("#btnViewDetail").kendoButton({
                    click:function(e){

                        var grid = $("#callCenterActionGrid").data("kendoExtGrid");
                        var selectedItem = grid.dataItem(grid.select());
                        if ( dms.string.isNotEmpty(selectedItem) ){

                            viewDetail(selectedItem);

                        } else {
                            //목록을 선택하여 주십시오.
                            dms.notification.info("<spring:message code='global.info.required.select'/>");
                            return;
                        }

                    }
                    , enable:false
                });
                // 메시지
                $("#btnMessage").kendoButton({
                    click:function(e){

                        var   grid = $("#callCenterActionGrid").data("kendoExtGrid")
                            , rows = grid.select()
                            , dataItem
                            , dataValidate  = false
                            , smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                            , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                            , smsTmplUserList = []              // sms 전송 대상자 목록
                            , selectedItem = grid.dataItem(grid.select())
                            , refKeyNm
                            , refTableNm = "CR_0606T"
                            , contactBizCd = "10"               // CRM361
                        ;

                        if (rows.length <= 0) {
                            //목록을 선택하여 주십시오.
                            dms.notification.info("<spring:message code='global.info.required.select'/>");
                            return;
                        }

                        refKeyNm = selectedItem.callSeq   // 단건 일때는 여기서 변수지정, List 일때는 smsTmplUserList 에서 변수지정

                        // SMS 대상자가 다건일경우 smsTmplUserList에 리스트로 담아서 보내면되고ㅡ, 단건이면 smsTmplUserList에 1건만 담아서 리스트로 보내면 됩니다.
                        rows.each(function(index, row) {

                            dataItem = grid.dataItem(row);

                            if ( dms.string.isEmpty(dataItem.custNo) || dms.string.isEmpty(dataItem.custNm) || dms.string.isEmpty(dataItem.hpNo) ) {
                                // {고객정보}을(를) 확인하여 주세요.
                                dms.notification.success("<spring:message code='global.lbl.custInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                smsTmplUserList = [];
                                dataValidate = true;
                                return false;
                            }

                            smsTmplUserList.push({
                                "custNo" :dataItem.custNo
                              , "custNm" :dataItem.custNm
                              , "hpNo"   :dataItem.hpNo
                              , "refKeyNm":dataItem.callSeq
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
                            , height:"470px"
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
                // 조회
                $("#btnSearch").kendoButton({
                    click:function(e){
                        if(crmJs.isDateValidPeriod($("#sStartRegDt").data("kendoExtMaskedDatePicker").value()
                                ,$("#sEndRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                            $("#callCenterActionGrid").data("kendoExtGrid").dataSource.page(1);
                        }else{
                            $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                            $("#sEndRegDt").focus();
                            return false;
                        }

                    }
                });
                /********************************************* 메인 그리드 버튼 종료 */

                setKendoDate = function( dtValue){
                    return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
                };

                //엑셀Export
                $("#btnExcelExport").kendoButton({
                    click:function(e) {

                        if ( $("#callCenterActionGrid").data("kendoExtGrid").dataSource._total > 0 ) {

                            var params = {};
                            params = gridCommonParams();

                            // 엑셀Export 수량 데이터를 조회한다.
                            $.ajax({
                                url:"<c:url value='/crm/ass/assign/selectCallCenterAssignsExcelExportCnt.do' />",
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
                                        "beanName":"callCenterActionService"
                                        ,"templateFile":"CallCenterActions_Tpl.xlsx"
                                        ,"fileName":"<spring:message code='crm.title.callSearch' />_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                                        ,"field":"callPrsnAllocDt"  // [20170911-이인문] OB 배정, 실행에서 excelExport 할때 grid default sort 랑 excel sort 랑 동일하게 맞춤.
                                        ,"dir":"asc"
                                        ,"sCust":$("#sCust").val()
                                        ,"sCustNm":$("#sCustNm").val()
                                        ,"sHpNo":$("#sHpNo").val()
                                        ,"sTelNo":$("#sTelNo").val()
                                        ,"sBizCd":$("#sBizCd").data("kendoExtDropDownList").value()
                                        ,"sBizSubCd":$("#sBizSubCd").data("kendoExtDropDownList").value()
                                        ,"sCallBizTitleNm":$("#sCallBizTitleNm").val()
                                        ,"sCallPrsnId":$("#sCallPrsnId").data("kendoExtDropDownList").value()
                                        ,"sCallProcEndYn":$("#sCallProcEndYn").data("kendoExtDropDownList").value()
                                        ,"sStartRegDt":setKendoDate($("#sStartRegDt").data("kendoExtMaskedDatePicker").value())
                                        ,"sEndRegDt":setKendoDate($("#sEndRegDt").data("kendoExtMaskedDatePicker").value())
                                        ,"sListTp":"R"
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

                // 콜센터실행 시행내역 그리드 시작
                $("#callCenterActionGrid").kendoExtGrid({
                    gridId:"G-CRM-0814-095200"
                    ,dataSource:{
                         transport:{
                            read:{
                                url:"<c:url value='/crm/cal/callCenter/selectCallCenterActions.do' />"
                            }
                            ,parameterMap:function(options, operation) {
                                if (operation === "read") {

                                    var params = {};

                                    params["recordCountPerPage"] = options.pageSize;
                                    params["pageIndex"] = options.page;
                                    params["firstIndex"] = options.skip;
                                    params["lastIndex"] = options.skip + options.take;
                                    if ( dms.string.isEmpty(options.sort) ){
                                        params["sort"] = [{"field":"callPrsnAllocDt","dir":"asc"}];     // 20160910 수정
                                    } else {
                                        params["sort"] = options.sort;
                                    }

                                    params = $.extend(params, gridCommonParams());
                                    //console.log("callCenterActionGrid param:"+kendo.stringify(params));

                                    return kendo.stringify(params);

                                } else if (operation !== "read" && options.models) {
                                    return kendo.stringify(options.models);
                                }
                            }
                        }
                        ,schema:{
                            model:{
                                id:"callSeq"
                                ,fields:{
                                    rnum:{type:"number"}
                                    ,callSeq:{type:"number"}
                                    ,custNm:{type:"string"}
                                    ,hpNo:{type:"string"}
                                    ,telNo:{type:"string"}
                                    ,bizCdNm:{type:"string"}
                                    ,callCnt:{type:"number"}
                                    ,callRsltCdNm:{type:"string"}
                                    ,callPrsnNm:{type:"string"}
                                    ,regUsrNm:{type:"string"}
                                    ,regDt:{type:"date"}
                                    ,regDtFormat:{type:"date", editable:false}
                                    ,scheCallDt:{type:"date"}
                                    ,scheCallDtFormat:{type:"date", editable:false}
                                    ,callPrsnAllocDt:{type:"date"}
                                    ,realCallDt:{type:"date"}
                                    ,updtDt:{type:"date"}
                                    ,startDt:{type:"date"}
                                    ,endDt:{type:"date"}
                                }
                            }
                            ,parse:function(d) {
                                if(d.data){
                                    $.each(d.data, function(idx, elem) {
                                        elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                        elem.scheCallDtFormat = kendo.parseDate(elem.scheCallDt, "<dms:configValue code='dateFormat' />");
                                    });
                                }
                                return d;
                            }
                        }
                    }
                    ,dataBound:function(e) {

                        // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                        var grid = $("#callCenterActionGrid").data("kendoExtGrid")
                        , rows = grid.tbody.find("tr")
                        , gridData
                        , selectRow

                        if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {

                            rows.each(function(index, row) {

                                gridData = grid.dataSource.at(index);

                                if ( gridData.callSeq == resultKey ) {     // 조건키 확인
                                    selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                    //console.log("selectRow:",selectRow)
                                    grid.select(selectRow);
                                }

                            });

                            isGridReload = false;

                        }

                        if ( e.sender.dataSource._total > 0 ) {
                            $("#btnExcelExport").data("kendoButton").enable(true);
                        } else {
                            $("#btnExcelExport").data("kendoButton").enable(false);
                        }

                    }
                    ,change:function(e){

                        var selectedItem = this.dataItem(this.select());

                        if ( dms.string.isNotEmpty(selectedItem) ) {
                            $("#btnViewDetail").data("kendoButton").enable(true);
                            $("#btnMessage").data("kendoButton").enable(true);
                        }

                    }
                    ,autoBind:true
                    ,editable:false
                    ,navigatable:false
                    ,selectable:"multiple"
                    ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
                    ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                    ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                    ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                    ,enableTooltip:true               //Tooltip 적용, default:false
                    ,columns:[
                        {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                            ,filterable:false
                            ,attributes:{"class":"ac"}
                        }
                        ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100         // 고객명
                            ,template:function(dataItem){
                                var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                return spanObj;
                            }
                        }
                        ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100}               //휴대전화
                        ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100              //전화번호
                            , attributes:{"class":"ac"}
                        }
                        ,{field:"purcMngNm", title:"<spring:message code='crm.lbl.companyContacts'/>", attributes:{"class":"al"}, width:100}//구매담당자 명
                        ,{field:"useCustNm", title:"<spring:message code='crm.lbl.driver'/>", attributes:{"class":"al"}, width:100}//방문자명
                        ,{field:"useHpNo", title:"<spring:message code='crm.lbl.driverHp'/>", attributes:{"class":"ac"}, width:100}//방문자 이동전화
                        ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//담당자
                        ,{field:"callBizTitleNm", title:"<spring:message code='crm.title.bizTitle' />", width:150}  // 업무명
                        ,{field:"bizCdNm", title:"<spring:message code='crm.lbl.bizCd' />", width:100, sortable:false, attributes:{"class":"ac"}}       //업무구분
                        ,{field:"bizSubCdNm", title:"<spring:message code='crm.lbl.bizSubCd' />", width:100, sortable:false, attributes:{"class":"ac"}} //업무구분SUB
                        ,{field:"callCnt", title:"<spring:message code='global.lbl.callCnt' />", width:100 ,attributes:{ "style":"text-align:right"}}   //CALL횟수
                        ,{field:"callRsltCdNm", title:"<spring:message code='crm.lbl.callRsltCd' />", width:100, sortable:false, attributes:{"class":"ac"}} //콜결과
                        ,{field:"callCont", title:"<spring:message code='crm.lbl.callCont' />", width:100, sortable:false, attributes:{"class":"tooltip-enabled"}}        //콜내용
                        ,{field:"callPrsnNm", title:"<spring:message code='crm.lbl.callPrsnId' />", width:100, attributes:{"class":"ac"}}      //콜담당자
                        ,{field:"scheCallDtFormat", title:"<spring:message code='crm.lbl.nextCallDt' />", width:120        //다음Call시간
                            ,attributes:{"class":"ac tooltip-disabled"}
                            ,template:"#if (scheCallDtFormat !== null ){# #= kendo.toString(data.scheCallDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                        }
                        ,{field:"callAssignIdNm", title:"<spring:message code='crm.lbl.callAssignId' />", width:100, attributes:{"class":"ac"}}       //배정인
                        ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100       //등록일
                            ,attributes:{"class":"ac tooltip-disabled"}
                            ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                        }
                    ]
                });
                // 콜센터실행 시행내역 그리드 종료

            })// ready 종료

        </script>
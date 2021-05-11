<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 고객케어미션 관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.custCareRun' /><!-- 고객케어 실행--></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form">
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

            </section>
            <!-- //고객케어미션 관리 -->

            <!-- 대상자목록 -->
            <section class="group">
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='global.title.targetList' /><!-- 대상자 리스트 --> <span id="targetCnt"></span></h3>
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="btnDelTarget"><spring:message code='global.btn.rowDel' /><!-- 행삭제 --></button>
                        <button type="button" class="btn_s" id="btnMessage"><spring:message code='global.btn.message' /><!-- 메시지 --></button>
                        <button type="button" class="btn_s btn_search" id="btnSubSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button type="button" class="btn_s" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
                    </div>
                </div>

                <div class="table_form">
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
                    <div id="targetGrid">
                    </div>
                </div>

            </section>
            <!-- //대상자목록 -->

            <script type="text/javascript">

                // TODO 대상자 목록 더블클릭시 실행 상세내역 팝업 오픈
                $("#targetGrid").on("dblclick", "tr.k-state-selected", function (e) {

                    var grid = $("#targetGrid").data("kendoExtGrid");
                    var selectedItem = grid.dataItem(grid.select());

                    if( dms.string.isNotEmpty(selectedItem) ){
                        console.log("selectedItem ::",selectedItem)
                    }

                });

                var custCareSeq
                ;

                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어유형 DS
                var activeTpCdDs = [];
                var activeTpCdArr = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    activeTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                activeTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = activeTpCdArr[val];
                    }
                    return returnVal;
                };

                function initForm(){

                    $("#btnDelTarget").data("kendoButton").enable(false);
                    $("#btnMessage").data("kendoButton").enable(false);
                    $("#btnExcelExport").data("kendoButton").enable(false);
                    $("#btnSubSearch").data("kendoButton").enable(false);

                    $("#targetGrid").data("kendoExtGrid").dataSource.data([]);

                }

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                     var grid = $("#targetGrid").data("kendoExtGrid"),
                     row = $(e.target).closest("tr");
                     var dataItem = grid.dataItem(row);

                     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                });

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

                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                            initForm();
                        }
                    });

                    // 행삭제
                    $("#btnDelTarget").kendoButton({
                        click:function(e){

                            //$("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                            var grid = $("#targetGrid").data("kendoExtGrid");
                            var rows = grid.select();

                            rows.each(function(index, row) {
                                grid.removeRow(row);
                            });

                        }
                        , enable:false
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
                                  , "refKeyNm":dataItem.custCareSeq
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
                                , height:"450px"
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
                    $("#btnSubSearch").kendoButton({
                        click:function(e){

                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedItem = grid.dataItem(grid.select());

                            if (dms.string.isNotEmpty(selectedItem)) {

                                $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

                            }

                        }
                        , enable:false
                    });


                    //버튼 - 엑셀저장
                    $("#btnExcelExport").kendoButton({
                        click:function(e) {

                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());
                            var sysDate = "${sysDate}";

                            if ( dms.string.isNotEmpty(selectedVal) ) {

                                dms.ajax.excelExport({
                                    "beanName":"customerCareExtrTargetService"
                                    ,"templateFile":"CustomerCareExtrTarget_Tpl.xlsx"
                                    ,"fileName":"<spring:message code='crm.menu.custCareRun' />_<spring:message code='global.title.targetList' />_"+sysDate+".xlsx"
                                    ,"sExtrDgreCnt":$("#sExtrDgreCnt").val()
                                    ,"sSmsSendYn":$("#sSmsSendYn").data("kendoExtDropDownList").value()
                                    ,"sCallCenSendYn":$("#sCallCenSendYn").data("kendoExtDropDownList").value()
                                    ,"sCustCareSeq":0
                                });

                            } else {
                                //목록을 선택하여 주십시오.
                                dms.notification.info("<spring:message code='global.info.required.select'/>");
                                return;
                            }

                        }
                        , enable:false
                    });

                    // 고객캐어 그리드 시작
                    $("#custCareMgmtGrid").kendoExtGrid({
                        dataSource:{
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

                                        console.log("custCareMgmtGrid param:"+kendo.stringify(params));

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
                                        ,activeTpCd:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,activeTmplId:{type:"string"}
                                        ,custExtrTermNo:{type:"string"}
                                        ,custExtrAutoYn:{type:"string"}
                                        ,custExtrCycleCont:{type:"string"}
                                        ,custCareCont:{type:"string"}
                                        ,updtDt:{type:"date"}
                                        ,regDt:{type:"date"}

                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            custCareSeq = selectedItem.custCareSeq;

                            if (dms.string.isNotEmpty(custCareSeq)) {
                                var targetGrid = $("#targetGrid").data("kendoExtGrid");
                                targetGrid.dataSource.page(1);
                                initForm();
                            }

                        }
                        //,autoBind:false
                        ,editable:false
                        ,height:305
                        ,navigatable:false
                        //,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"custCareNm", title:"<spring:message code='crm.lbl.custCareNm' />", width:100}            /* 고객케어명 */
                            ,{field:"custCareCont", title:"<spring:message code='crm.lbl.custCareCont' />", width:100}        /* 고객케어내용 */
                            ,{field:"activeTpCd", title:"<spring:message code='crm.lbl.activeTpCd' />", width:100             /* 실행유형 */
                                , attributes:{"class":"ac"}
                                , template:'#= activeTpCdArrVal(activeTpCd)#'
                            }
                            ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:60      /* 고객추출자동여부*/
                                , attributes:{"class":"ac"}
                            }

                            ,{field:"custExtrCycleCont", title:"<spring:message code='crm.lbl.custExtrCycleCont' />", width:100}   /* 고객추출주기*/
                            ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:60                        /* 사용여부*/
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100}             /* 등록자 */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                        ]
                    });
                    // 고객캐어 그리드 종료

                    // 대상자 목록 그리드 시작 //
                    $("#targetGrid").kendoExtGrid({
                        dataSource:{
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
                                            params["sCustCareSeq"] = selectedVal.custCareSeq;

                                            params["sExtrDgreCnt"] = $("#sExtrDgreCnt").val();
                                            params["sSmsSendYn"] = $("#sSmsSendYn").data("kendoExtDropDownList").value();
                                            params["sCallCenSendYn"] = $("#sCallCenSendYn").data("kendoExtDropDownList").value();

                                        }

                                        console.log("targetGrid:"+kendo.stringify(params));
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    fields:{
                                         dlrCd:{type:"string"}
                                        ,custCareSeq:{type:"number"}
                                        ,extrDgreCnt:{type:"number"}
                                        ,custNm:{type:"string"}
                                        ,custNo:{type:"string"}
                                        ,custExtrTermNo:{type:"string"}
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
                                        ,smsSendRsltCont:{type:"string"}
                                        ,callCenSendDt:{type:"date"}
                                        ,callCenRsltCont:{type:"string"}
                                        ,regUsrNm:{type:"string"}
                                        ,regUsrId:{type:"string"}
                                        ,regDt:{type:"date"}
                                        ,updtUsrId:{type:"string"}
                                        ,updtDt:{type:"date"}
                                    }
                                }
                            }
                        }
                    /*
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            custCareSeq = selectedItem.custCareSeq;

                            if (dms.string.isNotEmpty(custCareSeq)) {

                                $("#btnDelTarget").data("kendoButton").enable(true);
                                $("#btnCallReg").data("kendoButton").enable(true);
                                $("#btnMessage").data("kendoButton").enable(true);
                                $("#btnSubSearch").data("kendoButton").enable(true);

                            }

                        }
                         */
                        ,dataBound:function(e) {

                            // TODO dataBound 두번 호출되는거 확인.... 버튼이 껌뻑이네..
                            var targetCnt = e.sender.dataSource._total;
                            if ( targetCnt > 0 ) {

                                $("#btnSubSearch").data("kendoButton").enable(true);
                                $("#btnDelTarget").data("kendoButton").enable(true);
                                $("#btnMessage").data("kendoButton").enable(true);
                                $("#btnExcelExport").data("kendoButton").enable(true);

                                $("#targetCnt").text(":"+targetCnt+"<spring:message code='crm.lbl.people' />")

                            }

                        }
                       ,autoBind:false
                       ,editable:false
                       ,height:305
                       ,multiSelectWithCheckbox:true
                       //,navigatable:false
                       //,pageable:false
                       //,sortable:false
                       ,selectable:"multiple"
                       ,columns:[
                             {field:"dlrCd"            , title:"<spring:message code='global.lbl.dlrCd' />", width:100, hidden:true}             // 딜러코드
                            ,{field:"custCareSeq"      , title:"<spring:message code='crm.lbl.custCareSeq' />", width:100, hidden:true}          // 고객케어일련번호
                            ,{field:"extrDgreCnt"      , title:"<spring:message code='crm.lbl.extrDgreCnt' />", width:100
                                , attributes:{"class":"ac"}
                            }          // 추출차수
                            ,{field:"custNo"           , title:"<spring:message code='global.lbl.custNo' />", width:100, hidden:true}            // 고객번호
                            ,{field:"custExtrTermNo"   , title:"<spring:message code='crm.lbl.custExtrTermNo' />", width:100, hidden:true}       // 고객추출조건
                            ,{field:"regUsrId"         , title:"<spring:message code='global.lbl.regUsrId' />", width:100, hidden:true}          // 등록자
                            ,{field:"updtUsrId"        , title:"<spring:message code='global.lbl.updtUsrId' />", width:100, hidden:true}         // 수정자
                            ,{field:"updtDt"           , title:"<spring:message code='global.lbl.updtDt' />", width:100, hidden:true}            // 수정일

                            ,{field:"autoActiveYn"     , title:"<spring:message code='crm.lbl.autoActiveYn' />", width:100, hidden:true          // 자동발송여부
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"activeTpCd"       , title:"<spring:message code='crm.lbl.activeTpCd' />", width:100            // 실행유형
                                , attributes:{"class":"ac"}
                                , template:'#= activeTpCdArrVal(activeTpCd)#'
                            }
                            ,{field:"smsSendDt"        , title:"<spring:message code='crm.lbl.smsSendDt' />", width:100             // SMS전송일자
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"smsSendRsltCont"  , title:"<spring:message code='crm.lbl.smsSendRsltCont' />", width:100}      // SMS전송결과
                            ,{field:"callCenSendDt"    , title:"<spring:message code='crm.lbl.callCenSendDt' />", width:100         // 콜센터 전송일
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"callCenRsltCont"  , title:"<spring:message code='crm.lbl.callCenRsltCont' />", width:100}      // 콜센터 결과
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100         // 고객명 custCd 는.. 고객테이블이랑 조인 안해서 안가져옴.
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            ,{field:"hpNo"             , title:"<spring:message code='global.lbl.hpNo' />", width:100}              // 휴대전화
                            ,{field:"telNo"            , title:"<spring:message code='global.lbl.telNo' />", width:100}             // 전화번호
                            ,{field:"wechatId"         , title:"<spring:message code='global.lbl.wechatId' />", width:100}          // Wechat ID
                            ,{field:"emailNm"          , title:"<spring:message code='global.lbl.emailNm' />", width:100}           // 이메일
                            ,{field:"sungNm"           , title:"<spring:message code='global.lbl.sungNm' />", width:100}            // 성 이름
                            ,{field:"cityNm"           , title:"<spring:message code='global.lbl.cityNm' />", width:100}            // 도시명
                            ,{field:"distNm"           , title:"<spring:message code='global.lbl.distNm' />", width:100}            // 지역명
                            ,{field:"zipCd"            , title:"<spring:message code='global.lbl.zipCd' />", width:100}             // 우편번호
                            ,{field:"extZipCd"         , title:"<spring:message code='global.lbl.extZipCd' />", width:100}          // 확장우편번호
                            ,{field:"addrNm"           , title:"<spring:message code='crm.lbl.addrNm' />", width:100}               // 주소
                            ,{field:"addrDetlCont"     , title:"<spring:message code='crm.lbl.addrDetlCont' />", width:100}         // 상세주소
                            ,{field:"regUsrNm"         , title:"<spring:message code='global.lbl.regUsrId' />", width:100}          // 등록자
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                       ]
                   });
                   // 대상자 목록 그리드 종료 //


                });

            </script>
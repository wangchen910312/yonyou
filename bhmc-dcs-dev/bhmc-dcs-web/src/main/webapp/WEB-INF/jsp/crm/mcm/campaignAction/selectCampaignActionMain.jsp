<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 기본정보 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.campaignActionMng" /></h1><!-- 캠페인실행 관리 -->
            <div class="btn_right">
			<dms:access viewId="VIEW-I-12564" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m" id="btnViewDetail" ><spring:message code='global.btn.detail' /><!-- 상세 --></button>
			</dms:access>
			<dms:access viewId="VIEW-I-12563" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
			</dms:access>
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
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
                        <form id="campaignActionForm">
                            <input id="dlrCd" name="dlrCd" type="hidden">
                            <input id="pltCd" name="pltCd" type="hidden">
                            <input id="makCd" name="makCd" type="hidden">
                            <input id="refKeyNm" name="refKeyNm" type="hidden">
                            <input id="custExtrTermNo" name="custExtrTermNo" type="hidden">
                            <input id="extrDgreCnt" name="extrDgreCnt" type="hidden">
                        </form>
                        <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인명 --></th>
                        <td>
                            <input id="sMakNm" name="sMakNm" class="form_input" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.cpiCd" /><!-- 캠페인 코드 --></th>
                        <td>
                            <input id="sMakCd" name="sMakCd" class="form_input" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.hostCd" /><!-- 주최 --></th>
                        <td>
                            <input id="sHostCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sStatCd" class="form_comboBox" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.campaignDt" /><!-- 캠페인일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartDt" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndDt" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                        <td>
                            <div class="form_float">
                                <div class="form_left" >
                                    <input id="sMakTpCd" class="form_comboBox" />
                                </div>
                                <div class="form_right">
                                    <input id="sMakSubTpCd" class="form_comboBox" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid">
            <div id="mcdGrid" class="resizable_grid"></div>
        </div>

    <!-- // 탭 시작 -->
        <section id="campaignActionWindow" class="pop_wrap">
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="actionTab" class="k-state-active"><spring:message code="crm.title.campaignActionMng" /><!-- 켐페인실행 --></li>
                <li id ="actionRecordTab"><spring:message code="crm.title.campaignActionRecordMng" /><!-- 켐페인실행이력 --></li>
            </ul>
            <!--알림 발송 탭 영역 -->
            <div class="mt0">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.campaignActionMng" /></h2><!-- 켐페인실행 -->
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="btnSmsSend"><spring:message code="global.btn.sms" /><!-- SMS --></button>
                    <%--<button type="button" class="btn_s" id="btnSaleSend"><spring:message code="crm.btn.saleSend" /><!-- 판매 전송 --></button>
                        <button type="button" class="btn_s" id="btnServiceSend"><spring:message code="crm.btn.lbrSend" /><!-- 정비 전송 --></button>--%>
                        <button type="button" class="btn_s" id="btnCallSend"><spring:message code="crm.btn.callSend" /><!-- 콜센터 전송 --></button>
                    </div>
                </div>
                <div class="table_grid">
                    <!-- 알림 발송 그리드 -->
                    <div id="actionGrid" ></div>
                    <!-- 알림 발송 그리드 -->
                </div>

            </div>
            <!--데이터 전송 탭 영역 -->
            <div class="mt0">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.campaignActionRecordMng" /></h2><!-- 켐페인실행이력 -->
                </div>
                <div class="table_grid">
                    <!-- 데이터 전송 그리드 -->
                    <div id="actionRecordGrid" ></div>
                    <!-- 데이터 전송 그리드 -->
                </div>
            </div>
        </div>
        </section>
        <!-- // 탭 종료 -->

    </section>
</div>

<script type="text/javascript">

var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var makSubTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

<c:forEach var="obj" items="${hostList}">
    hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${makTpList}">
    makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${makSubTpList}">
    makSubTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${statList}">
    statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

function callBackFunc(){
    //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
    //$("#tabstrip-1", parent.document).html(customerForm);
    //$("#tabFormIframe").contents().find("#customerForm").html();
}

var mode = "N";

//그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
$("#mcdGrid").on("dblclick", "tr.k-state-selected", function (e) {

    var gridId = e.delegateTarget.id
      , grid = $("#"+gridId+"").data("kendoExtGrid")
      , selectedItem = grid.dataItem(grid.select())
    ;

    if ( dms.string.isNotEmpty(selectedItem) ){

        var win = $("#campaignActionWindow").data("kendoWindow");
        win.center();
        win.open();

    } else {
        // 선택해주세요.
        dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
        return;
    }

});

$(document).ready(function() {

    $("#campaignActionWindow").kendoWindow({
        pinned:true,
        modal:true,
        resizable:false,
        visible:false,
        animation:false,
        title:"<spring:message code='crm.menu.campaignActionMng' />",
        width:"950px",
        height:"500px"
    }).data("kendoWindow");

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

    //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 주최.   hostList
    $("#sHostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:hostList
    });

    // 유형.   makTpList
    $("#sMakTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:makTpList
        , select:onSelectMakTpCdSearch
    });

    // 유형상세.   makSubTpList
    $("#sMakSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
    });

    $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);

    // 상태.   statList
    $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:statList
    });

    /**
    * 유형에 따른 유형 Sub 조회(조회조건)
    */
    function onSelectMakTpCdSearch(e) {

      console.log(e);
       var dataItem = this.dataItem(e.item);

       $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
       $("#sMakSubTpCd").data("kendoExtDropDownList").enable(true);

       if(dataItem.cmmCd == ""){
           $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);
           return false;
       }

       var responseJson = dms.ajax.getJson({
           url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
           ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
           ,async:false
       });

       $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

    };


    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem != null){

                mode = "U";

                if (selectTabId == "actionTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#refKeyNm").val(selectedItem.makCd);
                    // 고객추출조건번호
                    $("#custExtrTermNo").val(selectedItem.custExtrTermNo);
                    // 추출차수
                    $("#extrDgreCnt").val(selectedItem.extrDgreCnt);

                    // 캠페인실행 그리드 조회
                    var grid = $("#actionGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "actionRecordTab"){

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#refKeyNm").val(selectedItem.makCd);
                    // 고객추출조건번호
                    $("#custExtrTermNo").val(selectedItem.custExtrTermNo);
                    // 추출차수
                    $("#extrDgreCnt").val(selectedItem.extrDgreCnt);

                    // 캠페인실행이력 그리드 조회
                    var grid = $("#actionRecordGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                }

            } else {
                mode = "N";
            }
        }
    });

/*************************************************************
이벤트 정의
*************************************************************/

    // 조회버튼
    $("#btnSearch").kendoButton({
        click:function(e) {

            var grid = $("#mcdGrid").data("kendoExtGrid");
            grid.dataSource.page(1);

            mode = "N";

            var kendoTab = $("#tabstrip").data("kendoExtTabStrip").select();

            if (kendoTab[0].id == "actionTab") {

                $("#actionGrid").data("kendoExtGrid").dataSource._destroyed = [];
                $("#actionGrid").data("kendoExtGrid").dataSource.page(1);

            } else if (kendoTab[0].id == "actionRecordTab"){

                $("#actionRecordGrid").data("kendoExtGrid").dataSource._destroyed = [];
                $("#actionRecordGrid").data("kendoExtGrid").dataSource.page(1);

            }
        }
    });



    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                var win = $("#campaignActionWindow").data("kendoWindow");
                win.center();
                win.open();

            } else {

                // 선택해주세요.
                dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                return;
            }

        }
        , enable:true
    });



    // 버튼 - SMS발송 팝업 오픈
    $("#btnSmsSend").kendoButton({
        click:function(e){

            var   grid = $("#actionGrid").data("kendoExtGrid")
                , rows = grid.dataSource.view()
                , dataItem
                , dataValidate  = false
                , smsTmplUserGroup = "Y"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                , smsTmplUserList = []              // sms 전송 대상자 목록
                , mcdGrid = $("#mcdGrid").data("kendoExtGrid")
                , selectedItem = mcdGrid.dataItem(mcdGrid.select())
                , refKeyNm
                , refTableNm = "CR_0710T"
                , contactBizCd = "06"
            ;

            if (rows.length <= 0) {
                //전송할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.send' var='send' /><spring:message code='global.info.notExistData' arguments='${send},' />");
                return;
            }

            refKeyNm = selectedItem.extrDgreCnt   // 단건 일때는 여기서 변수지정, List 일때는 smsTmplUserList 에서 변수지정

            // SMS 대상자가 다건일경우 smsTmplUserList에 리스트로 담아서 보내면되고ㅡ, 단건이면 smsTmplUserList에 1건만 담아서 리스트로 보내면 됩니다.
            for(var i = 0; i < rows.length; i++) {

                if ( dms.string.isEmpty(rows[i].custNo) || dms.string.isEmpty(rows[i].custNm) || dms.string.isEmpty(rows[i].hpNo) ) {
                    // {고객정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.custInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    smsTmplUserList = [];
                    dataValidate = true;
                    return false;
                }

                smsTmplUserList.push({
                    "custNo" :rows[i].custNo
                  , "custNm" :rows[i].custNm
                  , "hpNo"   :rows[i].hpNo
                  , "refKeyNm":rows[i].targCustSeq
                });
            }
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

    });


/*
    //버튼 - SMS발송 팝업 오픈
    $("#btnSmsSend").kendoButton({
        click:function(e) {

            var grid = $('#actionGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            console.log("selectedItem",selectedItem)

            if ( dms.string.isNotEmpty(selectedItem) ) {

                var custNm = selectedItem.custNm;
                var custNo = selectedItem.custNo;
                var hpNo = selectedItem.hpNo;
                var contactBizCd = "06";
                var refTableNm = "CR_0710T";
                var refKeyNm = selectedItem.makCd;

                messagePopupWindow = dms.window.popup({
                    windowId:"messagePopupWindow"
                    , title:"<spring:message code='global.title.msgTransmission' />"   // 메시지전송
                    , content:{
                        url:"<c:url value='/crm/cmm/customerInfo/selectMessagePopup.do'/>"
                        , data:{
                            "autoBind":false
                            , "custNm"         :custNm
                            , "custNo"         :custNo
                            , "hpNo"           :hpNo
                            , "contactBizCd"   :contactBizCd
                            , "refTableNm"     :refTableNm
                            , "refKeyNm"       :refKeyNm
                            , "callbackFunc":function(data){

                                if(data == "SUCCESS"){

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.page(1);

                                    // 전송 / 이 완료 되었습니다.
                                    dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                }
                            }
                        }
                    }
                });
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select'/>");
            }
        }
    });
*/

    //버튼 - 판매 전송
    $("#btnSaleSend").kendoButton({
        click:function(e) {

            var grid = $('#actionGrid').data('kendoExtGrid');
            var saleDs = grid.dataSource;
            var iRowCnt = saleDs.total();

            if (iRowCnt > 0) {
/*
                var json = $("#campaignActionForm").serializeObject();

                var url = "<c:url value='/crm/cmm/campaignAction/selectCallCenterSends.do' />";

                $.ajax({
                    url:url
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify(json)
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {

                        console.log("data::::" + data.result);
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
*/
            } else {
                //전송할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.send' var='send' /><spring:message code='global.info.notExistData' arguments='${send},' />");
            }
        }
    });

    //버튼 - 정비 전송
    $("#btnServiceSend").kendoButton({
        click:function(e) {

            var grid = $('#actionGrid').data('kendoExtGrid');
            var serviceDs = grid.dataSource;
            var iRowCnt = serviceDs.total();

            if (iRowCnt > 0) {
/*
                var json = $("#campaignActionForm").serializeObject();

                var url = "<c:url value='/crm/cmm/campaignAction/selectCallCenterSends.do' />";

                $.ajax({
                    url:url
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify(json)
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {

                        console.log("data::::" + data.result);
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
*/
            } else {
                //전송할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.send' var='send' /><spring:message code='global.info.notExistData' arguments='${send},' />");
            }
        }
    });

    //버튼 - 콜센터 전송
    $("#btnCallSend").kendoButton({
        click:function(e) {

            var grid = $('#actionGrid').data('kendoExtGrid');
            var callDs = grid.dataSource;
            var iRowCnt = callDs.total();

            if (iRowCnt > 0) {

                var json = $("#campaignActionForm").serializeObject();

                var url = "<c:url value='/crm/cmm/campaignAction/selectCallCenterSends.do' />";

                $.ajax({
                    url:url
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify(json)
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {

                        console.log("data::::" + data.result);
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#campaignActionWindow"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#campaignActionWindow"));
                    }
                });
            } else {
                //전송할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.send' var='send' /><spring:message code='global.info.notExistData' arguments='${send},' />");
            }
        }
    });

/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

    //그리드 설정(캠페인 마스터)
    $("#mcdGrid").kendoExtGrid({
        gridId:"G-CRM-0725-185301"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/mcm/campaignAction/selectCampaignActions.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sMakNm"]      = $("#sMakNm").val();
                        params["sMakCd"]      = $("#sMakCd").val();
                        params["sHostCd"]     = $("#sHostCd").val();
                        params["sMakTpCd"]    = $("#sMakTpCd").val();
                        params["sMakSubTpCd"] = $("#sMakSubTpCd").val();
                        params["sStatCd"]     = $("#sStatCd").val();
                        params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                        console.log(params);
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
                    id:"makCd"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        , makCd:{type:"string", editable:false}
                        , makNm:{type:"string", editable:false}
                        , custExtrTermNo:{type:"string", editable:false}
                        , custExtrTitleNm:{type:"string", editable:false}
                        , extrDgreCnt:{type:"number", editable:false}
                        , hostCd:{type:"string", editable:false}
                        , hostNm:{type:"string", editable:false}
                        , makTpCd:{type:"string", editable:false}
                        , makTpNm:{type:"string", editable:false}
                        , statCd:{type:"string", editable:false}
                        , statNm:{type:"string", editable:false}
                        , rcpeNm:{type:"string", editable:false}
                        , targCustCnt:{type:"number", editable:false}
                        , pgssRate:{type:"number", editable:false}
                        , startDt:{type:"date", editable:false}
                        , startDtFormat:{type:"date", editable:false}
                        , endDt:{type:"date", editable:false}
                        , endDtFormat:{type:"date", editable:false}
                        , budgetAmt:{type:"number", editable:false}
                        , realCustCnt:{type:"number", editable:false}
                        , dlrCd:{type:"string", editable:false}
                        , pltCd:{type:"string", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                            elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
            ,requestEnd:function(e){
                if (e.type !== "read"){
                    //this.page(1);
                }
            }
        }
        ,change:function(e){

            var selectedItem = this.dataItem(this.select());

            if (selectedItem != null) {

                var kendoTab = $("#tabstrip").data("kendoExtTabStrip").select();

                mode = "U";

                if (kendoTab[0].id == "actionTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#refKeyNm").val(selectedItem.makCd);
                    // 고객추출조건번호
                    $("#custExtrTermNo").val(selectedItem.custExtrTermNo);
                    // 추출차수
                    $("#extrDgreCnt").val(selectedItem.extrDgreCnt);

                    // 캠페인실행 그리드 조회
                    var grid = $("#actionGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (kendoTab[0].id == "actionRecordTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#refKeyNm").val(selectedItem.makCd);
                    // 고객추출조건번호
                    $("#custExtrTermNo").val(selectedItem.custExtrTermNo);
                    // 추출차수
                    $("#extrDgreCnt").val(selectedItem.extrDgreCnt);

                    // 캠페인실행이력 그리드 조회
                    var grid = $("#actionRecordGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                }
            } else {
                mode = "N";
            }

        }
        ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
           ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", width:130, attributes:{"class":"ac"}}       // 캠페인코드
           ,{field:"makNm", title:"<spring:message code='global.lbl.crNm' />", width:200}      // 캠페인명
           ,{field:"custExtrTermNo", title:"<spring:message code='crm.lbl.rcpeExtrNm' />", hidden:true}                       // 대상자 추출명
           ,{field:"custExtrTitleNm", title:"<spring:message code='crm.lbl.rcpeExtrNm' />", width:200, attributes:{"class":"al"}}       // 대상자 추출명
           ,{field:"extrDgreCnt", hidden:true}                                    // 추출차수
           ,{field:"hostCd", title:"<spring:message code='global.lbl.hostCd' />", hidden:true}                       // 주최
           ,{field:"hostNm", title:"<spring:message code='global.lbl.hostCd' />", width:100, attributes:{"class":"ac"}}       // 주최
           ,{field:"makTpCd", title:"<spring:message code='global.lbl.type' />", hidden:true}    // 유형
           ,{field:"makTpNm", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}}    // 유형
           ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", hidden:true}   // 상태
           ,{field:"statNm", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}}   // 상태
           ,{field:"rcpeNm", title:"<spring:message code='global.lbl.rcpeNm' />", width:100}      // 대상
           ,{field:"targCustCnt", title:"<spring:message code='global.lbl.targCustCnt' />", width:100, attributes:{"class":"ac"}}    // 목표인수
//           ,{field:"startDt", title:"<spring:message code='global.lbl.startDt' />", width:100, attributes:{"class":"ac"}
//               ,format:"{0:<dms:configValue code='dateFormat' />}"
//           }
//           ,{field:"endDt", title:"<spring:message code='global.lbl.EndDt' />", width:100, attributes:{"class":"ac"}
//               ,format:"{0:<dms:configValue code='dateFormat' />}"
//           }
           ,{field:"startDtFormat", title:"<spring:message code='global.lbl.startDt' />", width:100
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') #"
           }
           ,{field:"endDtFormat", title:"<spring:message code='global.lbl.EndDt' />", width:100
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') #"
           }
           ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:##,###}"}    // 예산
           ,{field:"realCustCnt", title:"<spring:message code='global.lbl.useper' />", width:100, attributes:{"class":"ac"}}
           ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
           ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
        ]
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:false          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,navigatable:true
    });


    //캠페인실행 그리드 설정
    $("#actionGrid").kendoExtGrid({
        gridId:"G-CRM-0725-185302"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/mcm/campaignAction/selectActions.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]          = $("#dlrCd").val();
                        params["sPltCd"]          = $("#pltCd").val();
                        params["sMakCd"]          = $("#makCd").val();
                        params["sExtrDgreCnt"]    = $("#extrDgreCnt").val();
                        params["sCustExtrTermNo"] = $("#custExtrTermNo").val();

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
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,makCd:{type:"string", editable:false}
                        ,extrDgreCnt:{type:"number", editable:false}
                        ,custNo:{type:"string", editable:false}
                        ,custExtrTermNo:{type:"string", editable:false}
                        ,custNm:{type:"string", editable:false}
                        ,addrDetlCont:{type:"string", editable:false}
                        ,telNo:{type:"string", editable:false}
                        ,hpNo:{type:"string", editable:false}
                        ,smsSendDt:{type:"date", editable:false}
                        ,callCenSendDt:{type:"date", editable:false}
                    }
                }
            }
        }
/*
        ,dataBound:function (e) {

            var evalDs = this.dataSource;
            var iRowCnt = evalDs.total();

            for(var i = 0; i < iRowCnt; i++){

                if(evalDs.at(i).smsSendDt == null){
                    $("#btnSmsSend").data("kendoButton").enable(true);
                    break;
                }else{
                    $("#btnSmsSend").data("kendoButton").enable(false);
                    break;
                }
            }
        }
*/
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", hidden:true}
            ,{field:"makCd", hidden:true}
            ,{field:"extrDgreCnt", hidden:true}
            ,{field:"custNo", hidden:true}
            ,{field:"custExtrTermNo", hidden:true}
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}
            ,{field:"addrDetlCont", title:"<spring:message code='par.lbl.addr' />", width:300, attributes:{"class":"al"}}
            ,{field:"hpNo", title:"<spring:message code='global.lbl.cellphone' />", width:100, attributes:{"class":"ac"}}
            ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:100, attributes:{"class":"ac"}}
            ,{field:"smsSendDt", title:"<spring:message code='crm.lbl.smsSendDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"callCenSendDt", title:"<spring:message code='crm.lbl.callCenSendDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
        ]
        ,height:400
    });

    //캠페인실행이력 그리드 설정
    $("#actionRecordGrid").kendoExtGrid({
        gridId:"G-CRM-0725-185303"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/mcm/campaignAction/selectActionRecords.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]          = $("#dlrCd").val();
                        params["sPltCd"]          = $("#pltCd").val();
                        params["sMakCd"]          = $("#makCd").val();
                        params["sExtrDgreCnt"]    = $("#extrDgreCnt").val();
                        params["sCustExtrTermNo"] = $("#custExtrTermNo").val();

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
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,makCd:{type:"string", editable:false}
                        ,extrDgreCnt:{type:"number", editable:false}
                        ,custNo:{type:"string", editable:false}
                        ,custExtrTermNo:{type:"string", editable:false}
                        ,custNm:{type:"string", editable:false}
                        ,telNo:{type:"string", editable:false}
                        ,hpNo:{type:"string", editable:false}
                        ,smsSendDt:{type:"date", editable:false}
                        ,smsSendRsltCont:{type:"string", editable:false}
                        ,callCenSendDt:{type:"date", editable:false}
                        ,callCenRsltCont:{type:"string", editable:false}
                        ,serSendDt:{type:"date", editable:false}
                        ,serRsltCont :{type :"string", editable :false}
                    }
                }
            }
        }
/*
        ,dataBound:function (e) {

            var evalDs1 = this.dataSource;
            var iRowCnt1 = evalDs1.total();

            for(var i = 0; i < iRowCnt1; i++){

                if(evalDs1.at(i).saleSendDt == null){
                    $("#btnSaleSend").data("kendoButton").enable(true);
                    break;
                }else{
                    $("#btnSaleSend").data("kendoButton").enable(false);
                    break;
                }
            }

            var evalDs2 = this.dataSource;
            var iRowCnt2 = evalDs2.total();

            for(var j = 0; j < iRowCnt2; j++){

                if(evalDs2.at(j).serSendDt == null){
                    $("#btnServiceSend").data("kendoButton").enable(true);
                    break;
                }else{
                    $("#btnServiceSend").data("kendoButton").enable(false);
                    break;
                }
            }

            var evalDs3 = this.dataSource;
            var iRowCnt3 = evalDs3.total();

            for(var k = 0; k < iRowCnt3; k++){

                if(evalDs3.at(k).callCenSendDt == null){
                    $("#btnCallSend").data("kendoButton").enable(true);
                    break;
                }else{
                    $("#btnCallSend").data("kendoButton").enable(false);
                    break;
                }
            }
        }
*/
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", hidden:true}
            ,{field:"makCd", hidden:true}
            ,{field:"extrDgreCnt", hidden:true}
            ,{field:"custNo", hidden:true}
            ,{field:"custExtrTermNo", hidden:true}
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}
            ,{field:"hpNo", title:"<spring:message code='global.lbl.cellphone' />", width:100, attributes:{"class":"ac"}}
            ,{field:"telNo", hidden:true}
            ,{field:"smsSendDt", title:"<spring:message code='crm.lbl.smsSendDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"smsSendRsltCont", title:"<spring:message code='crm.lbl.smsSendRsltCont' />", width:200, attributes:{"class":"ac"}}
            ,{field:"callCenSendDt", title:"<spring:message code='crm.lbl.callCenSendDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"callCenRsltCont", title:"<spring:message code='crm.lbl.callCenter' />", width:200, attributes:{"class":"al"}}
            ,{field:"serSendDt", title:"<spring:message code='crm.lbl.serSendDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field :"serRsltCont", title :"<spring:message code='crm.lbl.lbr' />", width :100, attributes :{"class" :"al"}}
        ]
        ,height:400
    });
});

</script>
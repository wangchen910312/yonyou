<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="ser.menu.reserStatus" /><!-- 예약접수현황 --></h2>
            </div>
            <div class="listarea">
                <div class="listhead dlistitem">
                    <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>

                    <span style="width:50%"><spring:message code="ser.lbl.resvDocNo" /><!-- 수리예약번호 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.resvAcceptNm" /><!-- 예약접수자 --></span>

                    <span style="width:50%"><spring:message code="ser.lbl.resvChannel" /><!-- 예약채널 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></span>

                    <span style="width:50%"><spring:message code="ser.lbl.resvDt" /><!-- 예약시간 --></span>
                    <span style="width:50%"><spring:message code="ser.lbl.repairResvDt" /><!-- 예약서비스시간 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.reserStatus" /><!-- 예약접수현황 --> <spring:message code="global.title.searchCondition" /><!-- 조회조건  --></h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text"><input id="sCarRegNo" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.resvDocNo" /><!-- 수리예약번호 --></th>
                        <td>
                            <div class="f_text"><input id="sResvDocNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.resvChannel' /><!-- 예약채널 --></th>
                        <td>
                            <div class="f_text"><input id="sResvTp" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.resvDt' /><!-- 예약시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sSerResvStartFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sSerResvStartFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sSerResvStartToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sSerResvStartToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- VinNo --></th>
                        <td>
                            <div class="f_text"><input id="sVinNo" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.resvAcceptNm' /><!-- 예약접수자 --></th>
                        <td>
                            <div class="f_text"><input id="sRegUsrNm" type="text"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.resvStat" /><!-- 예약접수상태 --></th>
                        <td>
                            <div class="f_text"><input id="sResvStatCd" type="text" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.repairResvDt' /><!-- 수리예약시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sResvFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sResvFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sResvToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sResvToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /></span></div>
            <dms:access viewId="VIEW-D-12652" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span></div>
            </dms:access>
        </div>
    </section>
    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="ser.menu.reserStatus" /> <spring:message code="global.lbl.budgetDetlCont" /><!-- 부품예약현황 상세내역 --></h2>
            </div>
            <div class="co_group">
                <div class="formarea" id="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody id="defaultHtml"><!-- 여기에 디폴트 HTML --></tbody>
                    </table>
                    <div class="content_title">
                        <h2><spring:message code="global.btn.moreInfo" /></h2>
                        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                    </div>
                    <div class="co_view" style="display:none;">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody id="hiddenHtml"><!-- 여기에 HIDE HTML --></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListCustomerDemand.jsp" /><!--고객요청사항-->
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListLabors.jsp" /><!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListParts.jsp" /><!-- 부품수령 -->
            <c:import url="/WEB-INF/jsp/mob/ser/cmm/UiOnlySelectSubListEtcIssues.jsp" /><!-- 기타사항 -->
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12653" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
                </dms:access>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>
</section>

<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

var fromWhere="selectReservationReceiptMain";
var _sResvDocNo="";

var resvStatCdList = [],
resvStatCdObj = {};
<c:forEach var="obj" items="${resvStatCdList}" varStatus="status">
    resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    resvStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//공통코드:예약구분
var resvTpCdList = [];
var resvTpCdObj = {};
<c:forEach var="obj" items="${resvTpCdList}">
    resvTpCdList.push({ "cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    resvTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//공통코드:예약접수상태
var resvReptStatCdList = [];
<c:forEach var="obj" items="${resvReptStatCdList}">
    resvReptStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvReptStatCdArr = dms.data.arrayToMap(resvReptStatCdList, function(obj){return obj.cmmCd});


var resvStat = function(){
    var params ={};
    params.sDlrCd = "${dlrCd}";
    params.sListType = "01";
    params.sCarRegNo = $("#sCarRegNo").val();
    params.sRegUsrNm = $("#sRegUsrNm").val();
    params.sResvTp =$("#sResvTp").data("kendoExtDropDownList").value();
    params.sVinNo = $("#sVinNo").val();
    params.sResvDocNo= $("#sResvDocNo").val();
    params.sResvStatCd= $("#sResvStatCd").data("kendoExtDropDownList").value();

    if($("#sResvFromDt").val() == "" ){
        params.sResvFromDt = null;
    }else{
        params.sResvFromDt = chgDate($("#sResvFromDt").val());
    }
    if($("#sResvToDt").val() == ""){
        params.sResvToDt = null;
    }else{
        params.sResvToDt = chgDate($("#sResvToDt").val());
    }

    if($("#sSerResvStartFromDt").val() == "" ){
        params.sSerResvStartFromDt = null;
    }else{
        params.sSerResvStartFromDt = chgDate($("#sSerResvStartFromDt").val());
    }
    if($("#sSerResvStartToDt").val() == ""){
        params.sSerResvStartToDt = null;
    }else{
        params.sSerResvStartToDt = chgDate($("#sSerResvStartToDt").val());
    }

    $.ajax({
        url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptByStats.do' />",
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        async:false,
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {
            //console.log("result : ", jqXHR);
            $("#resvReady").html('<strong>'+jqXHR.aqty+'</strong>');
            $("#resvKeep").html('<strong>'+jqXHR.bqty+'</strong>');
            $("#resvLate").html('<strong>'+jqXHR.cqty+'</strong>');
            $("#resvMiss").html('<strong>'+jqXHR.dqty+'</strong>');
            $("#resvCancel").html('<strong>'+jqXHR.eqty+'</strong>');
        }
    });
}


$(document).ready(function() {

  //조회조건 - 예약상태
    $("#sResvStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(resvStatCdList)
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });
  //예약채널
    $("#sResvTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:resvTpCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    function initPage(){
        partsJs.validate.groupObjAllDataInit();

        //$("#sSerResvStartFromDt").val("${sResvFromDt}");
        //$("#sSerResvStartToDt").val("${sResvToDt}");
    }
    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.reserStatus' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    /* $("#sResvFromDt").val(chgServerDate2Str(sevenDtBf));
    $("#sResvToDt").val(chgServerDate2Str(toDt)); */
    $("#sSerResvStartFromDt").val("${sResvFromDt}");
    $("#sSerResvStartToDt").val(chgServerDate2Str(toDt));
    $("#mainList").attr("src", "<c:url value='/mob/ser/rev/reservationReceipt/selectReservationReceiptList.do' />");

    resvStat();

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        contentList();
        resvStat();
    });

 // 버튼 - 초기화
    $("#btnInit").click(function(){
        $("input").val("");
        $("#sResvTp").data("kendoExtDropDownList").value("");
        $("#sResvStatCd").data("kendoExtDropDownList").value("");

        $("#sSerResvStartFromDt").val("${sResvFromDt}");
        $("#sSerResvStartToDt").val(chgServerDate2Str(toDt));
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });


});

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
    $("#content_search").css("display","none");
    $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
    $("#sBayNo").val("");
    document.getElementById("mainList").contentWindow.document.location.reload();
    setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","block");
}

//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""}, //VIN
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""}, //차량소유자
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""}, //방문자
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""}, //차종명
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""}, //차관명
               {temp:"s",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""}, //실제주행거리
               {temp:"h",key:"carRunDistVal",txt:"<spring:message code='ser.lbl.accuDrivDis' />",type:""},//누계주행거리
               {temp:"h",key:"resvStatCd",txt:"<spring:message code='ser.lbl.resvStat' />",type:""},//예약상태
               {temp:"h",key:"resvDocNo",txt:"<spring:message code='ser.lbl.resvDocNo' />",type:""},//수리예약번호
               {temp:"h",key:"resvTp",txt:"<spring:message code='ser.lbl.resvChannel' />",type:""},//예약채널
               {temp:"h",key:"resvDt",txt:"<spring:message code='ser.lbl.repairResvDt' />",type:"strDate"},//수리예약시간
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.resvAcceptNm' />",type:""},//예약자?
               {temp:"h",key:"resvPrintDt",txt:"<spring:message code='ser.lbl.resvPrintDt' />",type:"strDate"},//예약프린트시간
               {temp:"h",key:"updtDt",txt:"<spring:message code='ser.lbl.resvUpdt' />",type:"strDate"},//예약변경시간
               {temp:"h",key:"updtUsrNm",txt:"<spring:message code='ser.lbl.resvChgUsrNm' />",type:""},//예약변경자
               {temp:"h",key:"cancResvDt",txt:"<spring:message code='ser.lbl.resvCancelDt' />",type:"strDate"},//예약취소시간
               {temp:"h",key:"cancUsrNm",txt:"<spring:message code='ser.lbl.resvCancelUsrId' />",type:""},//예약취소자
               {temp:"h",key:"cancReasonCont",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},//취소원인
               {temp:"h",key:"hopeResvDt",txt:"<spring:message code='ser.lbl.hopeResvDt' />",type:"strDate"},//예약희망일자
               {temp:"h",key:"serResvStartDt",txt:"<spring:message code='ser.lbl.resvDt' />",type:"strDate"},// 예약시간
               {temp:"h",key:"confirmDt",txt:"<spring:message code='ser.lbl.resvConfirmHm' />",type:"strDate"},//예약완료시간
               {temp:"h",key:"confirmUsrNm",txt:"<spring:message code='ser.lbl.resvConfirmUsrNm' />",type:""},//예약완료자
               {temp:"h",key:"resvRemark",txt:"<spring:message code='ser.lbl.resvRemark' />",type:""},//예약비고
               {temp:"h",key:"saNm",txt:"<spring:message code='ser.lbl.saAppoint' />",type:""},//SA
               {temp:"h",key:"tecNm",txt:"<spring:message code='ser.lbl.tecAppoint' />",type:""},//테크니션
               {temp:"h",key:"lbrAmt",txt:"<spring:message code='ser.lbl.preLbrSubAmt' />",type:""},//예정공임비
               {temp:"h",key:"parAmt",txt:"<spring:message code='ser.lbl.preParSubAmt' />",type:""},//예정부품비
               {temp:"h",key:"etcAmt",txt:"<spring:message code='ser.lbl.preEtcSubAmt' />",type:""},//에정기타비
               {temp:"h",key:"sumAmt",txt:"<spring:message code='ser.lbl.preTotAmt' />",type:""},//예정총금액
               {temp:"h",key:"resvAlramDt",txt:"<spring:message code='ser.lbl.resvAlramDt' />",type:"strDate"},//수리예약알람시간
               {temp:"h",key:"resvAlramUsrNm",txt:"<spring:message code='ser.lbl.resvAlramUsr' />",type:""},//수리예약알람자
               ];


//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    if(dataItem != null){

        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

        $("#carRunDistVal").val(commaZero(dataItem.carRunDistVal));
        $("#parAmt").val(kendo.toString(dataItem.parAmt, 'n2'));
        $("#sumAmt").val(kendo.toString(dataItem.sumAmt, 'n2'));
        $("#preAmt").val(kendo.toString(dataItem.preAmt, 'n2'));
        $("#lbrAmt").val(kendo.toString(dataItem.lbrAmt, 'n2'));
        $("#etcAmt").val(kendo.toString(dataItem.etcAmt, 'n2'));

        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");
        $("#resvStatCd").val(resvStatCdObj[$("#resvStatCd").val()]);
        $("#resvTp").val(resvTpCdObj[$("#resvTp").val()]);

        _sResvDocNo=dataItem.resvDocNo;
    }

}


detailSet = function(data){
    $.ajax({
        url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptByKey.do' />"
        ,data:JSON.stringify({sResvDocNo:data.resvDocNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            if(dms.string.strNvl(result.resvDocNo) == ""){
                //dms.notification.info("<spring:message code='ser.lbl.resv' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
            } else {
                //getCustInfo(result, status);                        // 고객정보(selectCustCarInfoMain.jsp)
                /* resvInfoSet(result);
                partInfo(result.resvDocNo, "${preFixId}");          // 부품(selectPartList.jsp)
                lbrInfo(result.resvDocNo, "${preFixId}");           // 공임(selectLbrList.jsp)
                trobleDescInfo(result.resvDocNo, "${preFixId}");    // 고객요구사항및 고장설명(selectTabInfo.jsp)
                etcIssueSet(result.resvDocNo, "${preFixId}");       // 기타사항(selectEtcIssue.jsp)
                changeTotalAmt();                                   // 금액 계산(selectLbrList.jsp)

                btnControll($("#resvStatCd").val()); */
                trobleDescInfo(result.resvDocNo, "${preFixId}");    // 고객요구사항및 고장설명(selectTabInfo.jsp)
            }
        }
    });
};

//고장설명 조회
trobleDescInfo = function(jobNo, listType){

    tabInfoPreFixId = dms.string.strNvl(listType) == "" ? $("#preFixId").val():listType;
    tabInfoJobNo = jobNo;

    var params = {
        "sPreFixId":tabInfoPreFixId
        ,"sJobNo":tabInfoJobNo
    };

    $.ajax({
        url:"<c:url value='/ser/cmm/tabInfo/selectTrobleDescs.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            if(result != null){

                trobleDescInfoSet(result);
            }
        }
    });

};


</script>
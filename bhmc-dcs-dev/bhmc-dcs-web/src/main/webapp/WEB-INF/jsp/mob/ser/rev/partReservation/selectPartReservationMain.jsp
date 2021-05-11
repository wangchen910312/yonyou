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
                <h2 id="content_list_title"><spring:message code='ser.menu.partReserveStatus' /> <spring:message code='global.title.list' /><!-- 부품예약현황 목록 --></h2>
            </div>

            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="global.lbl.carNo" /><!-- 부품예약일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <%--
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.vinNo" /><!-- 차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDocNo" /><!-- 고객명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            --%>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="global.lbl.resvDt" /><!-- 예약일자 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.vinNo" /><!-- vin --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.partReserveStatus" /> <spring:message code="global.title.searchCondition" /><!-- 부품예약현황 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="global.lbl.resvDt" /><!-- 부품예약일자 --></th>
                        <td>
                            <div class="f_item01">
                                <input type="text" id="sParResvDt" class="" style="width:140px" readOnly/>
                                <span class="date" onclick="calpicker('sParResvDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <%--
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sCarRegNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sDriverNm" /></div>
                        </td>
                    </tr>
                    --%>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sParResvStatCd" class="form_comboBox" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
        </div>

    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="ser.menu.partReserveStatus" /> <spring:message code="global.lbl.budgetDetlCont" /><!-- 부품예약현황 상세내역 --></h2>
            </div>
            <div class="co_group">
            <div class="formarea" id="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:40%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parResvDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.customer" /> <spring:message code="ser.lbl.remark" /><!-- 고객비고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="custRemark" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.calcDetailInfo" /><!-- 정산상세정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">

                <ul class="sumlist">
                        <li>
                            <div class="sumtitle">
                                <h3><spring:message code="ser.lbl.lbrSubAmt" /><!--공임비소계  --></h3>
                                <span class="svalue" id="lbrSumAmt">00</span>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.parSubCamt" /><!--부품비소계  --></h3>
                                <span class="svalue" id="parSumAmt">00</span>
                            </div>
                        </li>
                        <li>
                            <div class="sumtitle">
                                <h3><span class="ico_plus"></span><spring:message code="ser.lbl.etcSubAmt" /><!--기타비용소계  --></h3>
                                <span class="svalue" id="etcSumAmt">00</span>
                            </div>
                        </li>
                        <li class="sumlistTotal">
                            <div class="sumtitle">
                                <h3><span class="ico_equal"></span><spring:message code="ser.lbl.serTotAmt" /><!--서비스총계  --></h3>
                                <span class="svalue" id="totSumAmt">00</span>
                            </div>
                        </li>
                    </ul>

            <%--
            <div class="formarea" id="formarea2">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.pre" /> <spring:message code="ser.lbl.parSubCamt" /><!-- 예정부품비 소계 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.pre" /> <spring:message code="ser.lbl.etcSubAmt" /><!-- 예정기타비용 소계 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.pre" /> <spring:message code="ser.lbl.serTotAmt" /><!-- 예정서비스총비용 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            --%>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.title.itemInfo" /><!-- 부품정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.giTp" /><!-- 출고유형 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.itemUntPrc" /><!-- 부품단가 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.qty" /> / <spring:message code="ser.lbl.unitCd" /><!-- 수량/단위 --></span>
                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.preParAmt" /><!-- 예정부품대 --></span>
                        </div>
                <iframe id="subList1" name="subList1" border="1" frameborder="0" width="100%" height="200px"></iframe>
            </div>
            </div>
            </div>


            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="ser.lbl.resvInfo" /><!-- 예약정보 --></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="formarea" id="formarea3">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:40%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.item" /><spring:message code="ser.lbl.resvDt" /><!-- 부품예약시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parResvDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.real" /><spring:message code="global.lbl.order" /><spring:message code="ser.lbl.dt" /><!-- 실제주문시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="realOrdDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.pre" /><spring:message code="global.lbl.parArrvDt" /><!-- 예정도착시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="scheArryDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.real" /><spring:message code="global.lbl.parArrvDt" /><!-- 실제도착시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="realArryDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.arrv" /><spring:message code="global.lbl.info" /><spring:message code="ser.lbl.dt" /><!-- 도착알림시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="arryAlrtDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.item" /><spring:message code="ser.lbl.resvDt" /><spring:message code="ser.lbl.remark" /><!-- 부품예약비고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parResvRemark" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>


    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",

    toDate,
    gCrud;

    var url;
    var listType;


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sParResvDt").val("");
            break;
        /*
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sDriverNm").val("");
            break;
        */
        case "search4Area" :
            $("#sParResvStatCd").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }
    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sParResvDt = $("#sParResvDt").val();
    //var sCarRegNo = $("#sCarRegNo").val();
    //var sDriverNm = $("#sDriverNm").val();
    var sParResvStatCd = $("#sParResvStatCd").data("kendoExtDropDownList").value();

    //if(sParResvDt == "" && sCarRegNo == "" && sDriverNm == "" && sParResvStatCd == ""){
    if(sParResvDt == "" && sParResvStatCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();

        if(sParResvDt == "") $("#search1Area").hide();
        else $("#search1Area").show();

        /*
        if(sCarRegNo == "") $("#search2Area").hide();
        else $("#search2Area").show();

        if(sDriverNm == "") $("#search3Area").hide();
        else $("#search3Area").show();
        */

        if(sParResvStatCd == "") $("#search4Area").hide();
        else $("#search4Area").show();

    }

    setMainListHeight();
}


//예약상태
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var resvStatCdMap = dms.data.arrayToMap(resvStatCdList, function(obj){return obj.cmmCd;});


$(document).ready(function() {

    function initPage(){
        $(".skeyarea").hide();
    }

    // 예약상태
    $("#sParResvStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:resvStatCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.partReserveStatus' />");<!-- 부품예약현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#sParResvDt").val(chgServerDate2Str(toDt));
    var sParResvDt = $("#sParResvDt");
    if(sParResvDt.val() != "") $("#search1Area span[name='searchStr']").text(sParResvDt.val());

    setSearchBox();
    $("#mainList").attr("src", "<c:url value='/mob/ser/rev/partReservation/selectPartReservationList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sParResvDt = $("#sParResvDt");
            //var sCarRegNo = $("#sCarRegNo");
            //var sDriverNm = $("#sDriverNm");
            var sParResvStatCd = $("#sParResvStatCd").data("kendoExtDropDownList");

            if(sParResvDt.val() != "") $("#search1Area span[name='searchStr']").text(sParResvDt.val());
            //if(sCarRegNo.val() != "") $("#search2Area span[name='searchStr']").text(sCarRegNo.val());
            //if(sDriverNm.val() != "") $("#search3Area span[name='searchStr']").text(sDriverNm.val());
            if(sParResvStatCd.value() != "") $("#search4Area span[name='searchStr']").text(sParResvStatCd.text());


            setSearchBox();
            contentList();
        }
    });


    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });


    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });


    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });




});

</script>

<script>

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
    $("#sParResvDt").val(chgServerDate2Str(toDt));
}

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem != null){
        /*
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataSet(dataItem);
        */

        $("#parResvDocNo").val(dataItem.parResvDocNo);
        $("#custRemark").val(dataItem.custRemark);

        $("#parResvDt").val(dataItem.parResvDt);
        $("#realOrdDt").val(dataItem.realOrdDt);
        $("#scheArrtDt").val(dataItem.scheArrtDt);
        $("#realArrtDt").val(dataItem.realArrtDt);
        $("#arryAlrtDt").val(dataItem.arryAlrtDt);
        $("#parResvRemark").val(dataItem.parResvRemark);

        if(dataItem.parResvDocNo != null && dataItem.parResvDocNo != 'undefined'){

            // 부품정보 목록 조회
            $("#subList1").attr("src", "<c:url value='/mob/ser/rev/partReservation/selectPartReservationSubList1.do' />");

        }

    }

}



</script>
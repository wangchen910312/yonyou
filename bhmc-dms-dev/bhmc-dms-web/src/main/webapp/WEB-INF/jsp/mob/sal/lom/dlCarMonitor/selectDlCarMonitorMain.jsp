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
                <h2 id="content_list_title"><spring:message code="global.title.tpVehicleMonitoring" /> <spring:message code="global.title.list" /></h2>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%"><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
                    <span style="width:50%"><spring:message code='global.lbl.model' /><!-- 차관 --></span>
                    <span style="width:50%"><spring:message code='sal.lbl.vinNum' /><!-- VIN NO --></span>
                    <span style="width:50%"><spring:message code='sal.lbl.extColor' /><!-- 외색 --></span>
                    <span style="width:50%"><spring:message code='global.lbl.realDlDts' /><!-- 발차일자 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.expcArriveDt" /><!-- 예상도착일자 --></span>
                    <span style="width:50%"><spring:message code="sal.lbl.trsfLoc" /><!-- 운송중위치 --></span>
                    <span style="width:50%"><spring:message code="par.lbl.logisticsCmpn" /><!-- 물류회사 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.title.tpVehicleMonitoring" /> <spring:message code="global.title.searchCondition" /></h2>
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
                                <th scope="row"><spring:message code='global.lbl.vinNo' /><!-- VIN --></th>
                                <td>
                                    <div class="f_text">
                                    <input type="text" id="sVinNo1"  maxlength="11" class="form_input" style="width:100%">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                 <th scope="row"><span class="bu_required"><spring:message code='global.lbl.realDlDts' /></span></th>    <!-- 발차일자 -->
                                 <td class="f_term">
                                    <div class="f_item01" style="width:82%">
                                        <input type="search" id="sSrchFrDt" value="${toDayFrom}"  />
                                        <span class="date" onclick="calpicker('sSrchFrDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                    <span class="termtext"> ∼</span>
                                    <div class="f_item01" style="width:82%">
                                        <input type="search" id="sSrchToDt" value="${toDayTo}"  />
                                        <span class="date" onclick="calpicker('sSrchToDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12628" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.tpVehicleMonitoring" /> <spring:message code="global.lbl.dtlInfo" /></h2>
                </div>
                <div class="formarea">
                    <table class="flist01 detialListData">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.vinNo" /><!-- VIN번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="vinNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carlineCd" /><!-- 차종코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.model" /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="modelNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnCode" /><!-- OCN코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorCd" /><!-- 외색코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.extColor" /><!-- 외색명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="intColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.logisticsCmpn" /><!-- 물류회사 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="dstbCmpNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.tpCarNo" /><!-- 트럭번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="trsfCarNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.licensePlt" /><!-- 번호판 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carRegNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.realDlDts" /><!-- 발차일자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="pltGiDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.expcArriveDt" /><!-- 예상도착일 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="exptDate" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <%-- <th scope="row"><spring:message code="global.lbl.trsfPosition" /><!-- 운송중위치 --></th> --%>
                                <th scope="row"><spring:message code="sal.lbl.trsfLoc" /><!-- 운송중위치 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="trsfLocCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="trsfStatCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.preAltNoti" /><!-- 조기경보통지 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="preAlrtNtceCont" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.driver" /><!-- 운전기사 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="driverNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.driverTel" /><!-- 기사전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="driverTelNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();


/* $(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sVinNo1").val("");
            break;
        case "search2Area" :
            $("#sSrchFrDt").val("");
            $("#sSrchToDt").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});



function setSearchBox(){

    var sVinNo1 = $("#sVinNo1").val();
    var sSrchFrDt = $("#sSrchFrDt").val();

    if(sVinNo1 == "" && sSrchFrDt == "" ){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sVinNo1 == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sSrchFrDt == "") $("#search2Area").hide();
        else $("#search2Area").show();
    }
} */

$(document).ready(function() {
  //현재일자
    var toDay = "${toDay}";

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.tpVehicleMonitoring' />"); //TP차량모니터링
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    var sSrchFrDt = $("#sSrchFrDt").val();
    var sSrchToDt = $("#sSrchToDt").val();

    if(sSrchFrDt != "") $("#search2Area span[name='searchStr']").html(sSrchFrDt +" ~ <br/>"+ sSrchToDt);
    //setSearchBox();

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/lom/dlCarMonitor/selectDlCarMonitorList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#listarea_noData").hide();
            mob.loading.show();

            var sVinNo1 = $("#sVinNo1").val();
            var sSrchFrDt = $("#sSrchFrDt").val();
            var sSrchToDt = $("#sSrchToDt").val();

            if(sVinNo1 != "") $("#search1Area span[name='searchStr']").text(sVinNo1);
            if(sSrchFrDt != "") $("#search2Area span[name='searchStr']").html(sSrchFrDt +" ~ <br/>"+ sSrchToDt);
            //setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
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
            ////$("#docu_top").fadeIn();
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
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기

function contentDetail(obj) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    setDetailData(obj.dataItem,".detialListData input[id]");
  }
</script>
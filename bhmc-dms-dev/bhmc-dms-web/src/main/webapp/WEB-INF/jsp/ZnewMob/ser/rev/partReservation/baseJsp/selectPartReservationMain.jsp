<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<section id="content">
    <!-- content_list -->
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/rev/partReservation/listJsp/selectPartReservationList.jsp" />
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
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sCarRegNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sParResvDocNo" /></div>
                        </td>
                    </tr>
                     <tr>
                        <th scope="row" id="sOrdsTpTh"><spring:message code="ser.lbl.partResvTp" /><!-- 부품예약유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sParResvTp" type="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.preResvPartHm' /><!-- 부품예약일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sParResvStartDt" style="width:140px; background-color:#ffffff;" value="${sParResvStartDt}"  />
                                <%-- <input type="search" id="sParResvStartDt" style="width:140px" value="${sParResvStartDt}"  />
                                <span class="date" onclick="calpicker('sParResvStartDt')">날짜</span> --%>
                            </div>
                            <span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sParResvEndDt" style="width:140px; background-color:#ffffff;" value="${sParResvEndDt}"  />
                                <%-- <input type="search" id="sParResvEndDt" style="width:140px" value="${sParResvEndDt}"  />
                                <span class="date" onclick="calpicker('sParResvEndDt')">날짜</span> --%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- Vin No --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sVinNo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.partResveNm" /><!-- 부품예약자 --></th>
                        <td>
                           <div class="f_item01">
                               <input type="text" id="sRegUsrNm" />
                               <span class="search"  id="searchUsrId"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                           </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.partResvStat" /><!-- 부품예약상태 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sParResvStatCd" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.itemNm" /><!-- 차량소유자 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sPartNm" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /></span></div>
            <dms:access viewId="VIEW-D-12654" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span></div>
            </dms:access>
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
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListCustomerDemand.jsp" /><!--고객요청사항-->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListParts.jsp" /><!-- 부품수령 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/ser/subCmm/selectSubListEtcIssues.jsp" /><!-- 기타사항 -->
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12653" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
                </dms:access>
            </div>
        </section>
    </div>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
</section>


<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var fromWhere="selectPartReservationMain";
var _parResvDocNo="";

var sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",

    toDate,
    gCrud;

    var url;
    var listType;

function setSearchBox(){
    setMainListHeight();
}


//예약상태
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvStatCdMap = dms.data.arrayToMap(resvStatCdList, function(obj){return obj.cmmCd;});

var partResvTpCdList = [];
<c:forEach var="obj" items="${partResvTpCdList}">
partResvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partResvTpCdMap = dms.data.arrayToMap(partResvTpCdList, function(obj){return obj.cmmCd});

//공통코드:예약부품상태
var partResvStatCdList = [];
<c:forEach var="obj" items="${partResvStatCdList}">
partResvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partResvStatCdArr = dms.data.arrayToMap(partResvStatCdList, function(obj){return obj.cmmCd});

var preFixId="${preFixId}";
$(document).ready(function() {
    $("#sParResvTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partResvTpCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });

  //예약부품상태
    $("#sParResvStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partResvStatCdList
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.partReserveStatus' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    $("#mainList").attr("src", "<c:url value='/mob/ser/rev/partReservation/selectPartReservationList.do' />");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        initList();
        contentList();
    });
    // 버튼 - 초기화
    $("#btnInit").click(function(){
        $("input").val("");
        $("#sParResvTp").data("kendoExtDropDownList").value("");
        $("#sParResvStatCd").data("kendoExtDropDownList").value("");

        $("#sParResvStartDt").val("${sParResvStartDt}");
        $("#sParResvEndDt").val("${sParResvEndDt}");
    });

    /* // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    }); */

});


//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  listData.read();
}

/* //검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
    $("#sParResvDt").val(chgServerDate2Str(toDt));
} */

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});


//부품예상 유형
partResvTpGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(partResvTpCdArr[value] != undefined)
            returnVal = partResvTpCdArr[value].cmmCdNm;
    }
    return returnVal;
};

 //부품예약자 팝업
var userSearchPopupWin;
$("#searchUsrId").click(function(){
    userSearchPopupWin = mob.window.popup({
      windowId:"userSearchPopupWin"
      //,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
      ,content:{
          url:"<c:url value='/mob/cmm/sci/commonPopup/selectUserPopup.do'/>"
          , data:{
              "autoBind":false
              ,"usrNm":""
              ,"callbackFunc":function(data){
                  if(data != undefined){
                      $("#sRegUsrNm").val(data.usrNm);
                  }
              }
          }
      }

    });
});

</script>
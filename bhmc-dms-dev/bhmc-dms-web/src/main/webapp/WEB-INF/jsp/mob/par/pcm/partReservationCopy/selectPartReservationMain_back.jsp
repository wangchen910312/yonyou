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


        <div class="listarea">
                    <div class="listhead dlistitem">

                        <span style="width:50%"><spring:message code="ser.lbl.preResvPartHm" /><!-- 부품예약일자 --></span>
                        <span style="width:50%"><spring:message code="ser.lbl.partResveNm" /><!-- 부품예약자 --></span>

                        <span class="clboth" style="width:50%"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></span>
                        <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                    </div>

            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
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
                            <div class="f_text"><input type="text" id="parResvTp" type="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.preResvPartHm' /><!-- 부품예약일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sParResvStartDt" style="width:140px" value="${sParResvStartDt}"  />
                                <span class="date" onclick="calpicker('sParResvStartDt')">날짜</span>
                            </div>
                            <span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sParResvEndDt" style="width:140px" value="${sParResvEndDt}"  />
                                <span class="date" onclick="calpicker('sParResvEndDt')">날짜</span>
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
                                <input type="search" id="sRegUsrNm" name="sRegUsrNm" value="" >
                                <span class="search"  id="searchUsrId">검색<!-- 검색 --></span>
                            </div>
                            <input type="hidden" id="sRegUsrId" name="sRegUsrId" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.partResvStat" /><!-- 부품예약상태 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sParResvStatCd" type="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                           <div class="f_text"><input type="text" id="sPartNm" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /><!-- 초기화 --></span></div>
            <dms:access viewId="VIEW-D-12708" hasPermission="${dms:getPermissionMask('READ')}">
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
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carRegNo" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.carVinNo" /><!-- Vin NO --></th>
                                <td>
                                    <div class="f_text f_disabled" ><input id="vinNo" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carOwnerNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="driverNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carlineNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.modelNm" /><!-- 모델명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="modelNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /><!-- 실제주행거리 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="carRunDistVal" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="parResvDocNo" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.partResvTp" /><!-- 부품예약유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="partResvTp" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.parRsrvRegistrant" /><!-- 부품 예약 접수자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="regUsrNm" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.parRsrvNwTime" /><!-- 부품 예약 생성 시간 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="parResvDt" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="parResvDt_t" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.cancReasonCd" /><!-- 취소원인 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="cancReasonCont" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.partResvRemark" /><!-- 부품예약비고  --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="parResvRemark" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preParSubAmt" /><!-- 예정부품대 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="parAmt" type="text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preEtcSubAmt" /><!-- 예정기타비용 소계 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="etcAmt" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.dsctScheduleAmount" /><!-- 할인 예정 금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="dcAmt" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preTotAmt" /><!-- 예상수리비합계 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="sumAmt" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.preAmt" /><!-- 선수금금액 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="preAmt" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.dsctScheduleQty" /><!-- 부품예약수량 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="reqQty" type="text" disabled="disabled"/></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
                                    <span class="clboth" style="width:35%"><spring:message code="ser.lbl.itemUntPrc" /><!-- 부품단가 --></span>
                                    <span style="width:35%"><spring:message code="ser.lbl.qty" /> / <spring:message code="ser.lbl.unitCd" /><!-- 수량/단위 --></span>
                                    <span style="width:30%"><spring:message code="ser.lbl.preParAmt" /><!-- 예정부품대 --></span>
                                </div>

                        <iframe id="subList1" name="subList1" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub1"><span></span></div>
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

</section>


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
    $("#parResvTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partResvTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.partReserveStatus' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    $("#mainList").attr("src", "<c:url value='/mob/par/pcm/partReservation/selectPartReservationList.do' />");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        contentList();
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sCarRegNo").val("");
            $("#sCarOwnerNm").val("");
            $("#sDriverNm").val("");
            $("#sVinNo").val("");
            $("#sRegUsrNm").val("");
            $("#sParResvDocNo").val("");
            $("#parResvTp").data("kendoExtDropDownList").value("");
            $("#sParResvStartDt").val("${sParResvStartDt}");
            $("#sParResvEndDt").val("${sParResvEndDt}");
        }
    });

  //예약부품상태
    $("#sParResvStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partResvStatCdList
        ,optionLabel:" "
        ,index:0
    });
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
  document.getElementById("mainList").contentWindow.document.location.reload();
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_search").css("display","block");
    $("#sParResvDt").val(chgServerDate2Str(toDt));
}

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

//공통코드:RO유형
var partResvTpCdList = [];
<c:forEach var="obj" items="${partResvTpCdList}">
partResvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partResvTpCdArr = dms.data.arrayToMap(partResvTpCdList, function(obj){return obj.cmmCd});

//부품예상 유형
partResvTpGrid = function(value){
    var returnVal = "";
    if( dms.string.isNotEmpty(value)){
        if(partResvTpCdArr[value] != undefined)
            returnVal = partResvTpCdArr[value].cmmCdNm;
    }
    return returnVal;
};

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    //console.log("dataitem : ", dataItem);
    if(dataItem != null){
        $("#carRegNo").val(dataItem.carRegNo);
        $("#vinNo").val(dataItem.vinNo);
        $("#carOwnerNm").val(dataItem.carOwnerNm);
        $("#driverNm").val(dataItem.driverNm);
        $("#carlineNm").val(dataItem.carlineNm);
        $("#modelNm").val(dataItem.modelNm);
        $("#carRunDistVal").val(comma(dataItem.carRunDistVal));
        $("#parResvDocNo").val(dataItem.parResvDocNo);
        $("#partResvTp").val(partResvTpGrid(dataItem.parResvTp));
        $("#regUsrNm").val(dataItem.regUsrNm);
        var preResvDt_split = dataItem.parResvDt.split(' ');//["날짜","시간"]
        $("#parResvDt").val(preResvDt_split[0]);
        $("#parResvDt_t").val(preResvDt_split[1]);
        $("#cancReasonCont").val(dataItem.cancReasonCont);
        $("#parResvRemark").val(dataItem.parResvRemark);
        $("#parAmt").val(kendo.toString(dataItem.parAmt, 'n2'));
        $("#etcAmt").val(kendo.toString(dataItem.etcAmt, 'n2'));
        $("#dcAmt").val(kendo.toString(dataItem.dcAmt, 'n2'));
        $("#sumAmt").val(kendo.toString(dataItem.sumAmt, 'n2'));
        $("#preAmt").val(dataItem.preAmt);
        $("#reqQty").val(dataItem.reqQty);

        $("#custRemark").val(dataItem.custRemark);
        $("#realOrdDt").val(dataItem.realOrdDt);
        $("#scheArrtDt").val(dataItem.scheArrtDt);
        $("#realArrtDt").val(dataItem.realArrtDt);
        $("#arryAlrtDt").val(dataItem.arryAlrtDt);
        //$("#partResveNm").val(dataItem.driverNm);

        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");

        if(dataItem.parResvDocNo != null && dataItem.parResvDocNo != 'undefined'){
            // 부품정보 목록 조회
            $("#subList1").attr("src", "<c:url value='/mob/par/pcm/partReservation/selectPartReservationSubList1.do' />");

        }
    }

}
var userSearchPopupWin;
$("#searchUsrId").click(function(){
    userSearchPopupWin = mob.window.popup({
      windowId:"userSearchPopupWin"
      //,title:"사용자 조회"   // 사용자 조회
      ,content:{
          url:"<c:url value='/mob/cmm/sci/commonPopup/selectUserPopup.do'/>"
          , data:{
              "autoBind":false
              ,"usrNm":""
              ,"callbackFunc":function(data){
                  if(data != undefined){
                      $("#sRegUsrId").val(data.usrId);
                      $("#sRegUsrNm").val(data.usrNm);
                  }
              }
          }
      }

    });
});
</script>
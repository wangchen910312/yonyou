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
            <h2 id="content_list_title"><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.title.list" /><!-- 정비수령현황 목록 --></h2>
        </div>


        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
                <span style="width:50%"><spring:message code="par.lbl.serReceiveType" /><!-- 부품수령유형 --></span>
                <span style="width:50%"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></span>
                <span style="width:50%"><spring:message code="par.lbl.partsInOutStatus" /><!-- 부품수령상태 --></span>
                <span style="width:50%"><spring:message code="par.lbl.giTime" /><!-- 출고시간 --></span>
                <span style="width:50%"><spring:message code="par.lbl.receiveMan" /><!-- 수령인 --></span>
            </div>

            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.title.searchCondition" /><!-- 출고문서 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="par.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text"><input id="sCarNo" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                        <td>
                            <div class="f_text"><input id="sGiDocNo" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parGiStatCd" /><!-- 정비위탁상태 --></th>
                        <td>
                            <div class="f_text"><input id="sParGiStatCd" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.serReceiveType" /><!-- 부품수령유형 --></th>
                        <td>
                            <div class="f_text"><input id="sSerReceiveType" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.vin" /><!-- VIN번호 --></th>
                        <td>
                            <div class="f_text"><input id="sVin" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.getPrsnNm" /><!-- 수령인 --></th>
                        <td>
                            <div class="f_text"><input id="sGetPrsnNm" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></th>
                        <td>
                            <div class="f_text"><input id="sInvRoDocNo" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.partsInOutStatus" /><!-- 부품수령상태 --></th>
                        <td>
                            <div class="f_text"><input id="sPartsInOutStatus" class="form_comboBox" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.visitNm" /><!-- 방문자 --></th>
                        <td>
                            <div class="f_text"><input id="sVisitNm" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.giTime" /><!-- 출고시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sGiTimeStartDt" style="width:140px" class="" value="" />
                                <span class="date" onclick="calpicker('sGiTimeStartDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sGiTimeEndDt" style="width:140px" class="" value="" />
                                <span class="date" onclick="calpicker('sGiTimeEndDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parGiMan" /><!-- 정비위탁자 --></th>
                        <td>
                            <div class="f_text"><input id="sParGiMan" class="form_input" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnInit" class="btnd1"><spring:message code='global.btn.init' /><!-- 초기화 --></span></div>
            <dms:access viewId="VIEW-D-12706" hasPermission="${dms:getPermissionMask('READ')}">
            <div><span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span></div>
            </dms:access>
        </div>

    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.title.detail" /><spring:message code="mob.title.search" /><!-- 출고현황상세조회 --></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody class="detailObject1">
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.carNo" /><!-- 차량번호 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="carNo" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.vin" /><!-- 빈번호 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="vin" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="invRoDocNo" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.serReceiveType" /><!-- 부품수령유형 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="serReceiveType" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.partsInOutStatus" /><!-- 부품수령상태 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="partsInOutStatus" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="giDocNo" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.receiveMan" /><!-- 수령인 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="receiveMan" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.giTime" /><!-- 출고시간 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="giTime" class="f_text" disabled="disabled" /></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.lbl.infoData" /><!-- 정비수령현황 등록정보 --></h2>
                </div>
                <div class="co_view">
                <div class="listarea">
                    <div class="listhead dlistitem">
                        <span style="width:40%"><spring:message code='par.lbl.itemCd'/><!-- 부품번호 --></span>
                        <span style="width:60%"><spring:message code='par.lbl.itemNm'/><!-- 부품명 --></span>
                        <span style="width:40%"><spring:message code='par.lbl.qty'/><!-- 수량 --></span>
                        <span style="width:30%"><spring:message code='par.lbl.prc'/><!-- 단가 --></span>
                        <span style="width:30%"><spring:message code='par.lbl.amt'/><!-- 금액 --></span>

                    </div>
                    <iframe id="subList" border="0" frameborder="0" width="100%" height=""></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData2"><span></span></div>
                </div>
                </div>
            </div>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='ser.btn.return' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div class="content_right">
        <section id="contentStatus_detail" class="content_detail" style="display:none">
        <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.title.info" /><!-- 정비수령현황 --></h2>
            </div>
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody class="detialListData">
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="giDocNo2" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="invRoDocNo2" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.parReqStatCd" /><!-- 부품요청상태 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parReqStatCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- //위탁서유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="parGiTp" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='par.lbl.itemNm' /><!-- 부품명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='par.btn.pakage'/><!-- 패키지 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="pakage" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.outQty" /><!-- 입출고수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="outQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                         <tr>
                            <th scope="row"><spring:message code="par.lbl.avlbStockQty" /><!-- 수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="avlbStockQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.stockQty" /><!-- 가용재고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="stockQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.strge" /><!-- 부품창고 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="strge" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.locId" /><!-- 로케이션층급(창고로케이션) --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="locId" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.prc" /><!-- 단가 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="prc" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.taxDdctAmt" /><!-- 세전금액 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="taxDdctAmt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.taxAmt" /><!-- 세금액 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="taxAmt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.amt" /><!-- 금액 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="amt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.giTime" /><!-- 출고시간 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="giTime2" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.getPrsnNm" /><!-- 수령인 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="getPrsnNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="con_btnarea btncount3">
            <div><span class="btnd1" id="upBtn"><spring:message code='mob.btn.goup' /><!-- 상 --></span></div>
            <div><span class="btnd1" id="downBtn"><spring:message code='mob.btn.godown' /><!-- 하 --></span></div>
            <div><span class="btnd1" id="subDetailConfirmBtn"><spring:message code='ser.btn.return' /><!-- 닫기 --></span></div>
        </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

</section>

<!-- script -->
<script>

var giDocNo = "";
var gData=[];
var currentRnum="";

var dateFormat =  '<dms:configValue code="dateFormat" />';

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

//정비위탁상태
var roStatusCdList = [];
<c:forEach var="obj" items="${roStatusCdList}">
if("${obj.cmmCd}" != "06"){//RO상태 취소 제외.
    roStatusCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>

//부품수령유형
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});

//부품수령상태
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//수령인
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
</c:forEach>
var tecCdMap = {};
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});

//위탁서유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = {};
$.each(roTpCdList, function(idx, obj){
    roTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//부품창고
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = {};
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});

$(document).ready(function() {

    $("#sParGiStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roStatusCdList
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,autoBind:false
        ,index:0
    });

    $("#sSerReceiveType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:parGiTpList
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,autoBind:false
        ,index:0
    });

    $("#sPartsInOutStatus").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:partsParReqStatCdList
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,autoBind:false
        ,index:0
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='par.lbl.repairReptCdt' />");
    $("#header_title").on("click", moveSearch);
    $("#header_title").html("<span class='search_open'>" + $("#header_title").html() + "</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusList.do' />");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        contentList();
    });

    //버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#contentStatus_detail").css("display") == "block") {

            $("#content_search").css("display","none");
            $("#content_detail").css("display","block");
            $("#content_list").css("display","none");
            $("#contentStatus_detail").css("display", "none");
            $("#header_title span").attr("class","search_open");

        }
    });

    $("#subDetailConfirmBtn").bind("click", function(){

        $("#content_search").css("display","none");
        $("#content_detail").css("display","block");
        $("#content_list").css("display","none");
        $("#contentStatus_detail").css("display", "none");
        $("#header_title span").attr("class","search_open");

    });

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {

            $("#sCarNo").val("");
            $("#sGiDocNo").val("");
            $("#sParGiStatCd").data("kendoExtDropDownList").value("");
            $("#sSerReceiveType").data("kendoExtDropDownList").value("");
            $("#sVin").val("");
            $("#sGetPrsnNm").val("");
            $("#sInvRoDocNo").val("");
            $("#sPartsInOutStatus").data("kendoExtDropDownList").value("");
            $("#sVisitNm").val("");
            $("#sGiTimeStartDt").val("");
            $("#sGiTimeEndDt").val("");
            $("#sParGiMan").val("");

        }
    });

    //버튼- 상위이동
    $("#upBtn").kendoButton({
       click:function(e) {
           var obj = {};
           var inx = parseInt(currentRnum)-2;
           if(gData[inx] != null){
               obj = gData[inx];
               contentDetail(obj);
               if(inx==0){
                   $("#upBtn").data("kendoButton").enable(false);
               }else{
                   $("#downBtn").data("kendoButton").enable(true);
               }
           }
       }
    });

    //버튼- 하위이동
    $("#downBtn").kendoButton({
        click:function(e) {
            var obj = {};
            var inx = parseInt(currentRnum);
            if(gData[inx] != null){
                obj = gData[inx];
                contentDetail(obj);
                if(inx==gData.length-1){
                    $("#downBtn").data("kendoButton").enable(false);
                }else{
                    $("#upBtn").data("kendoButton").enable(true);
                }
            }
        }
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
    $("#content_list").css("display","block");
    $("#contentStatus_detail").css("display", "none");
    $("#header_title span").attr("class","search_open");
    document.getElementById("mainList").contentWindow.document.location.reload();
    setTimeout(function(){ setMainListHeight();}, 200);
}


//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
  $("#contentStatus_detail").css("display", "none");
}



// 부품리스트 보기(리스트에서 클릭할때)
contentItemListFromList = function(dataItem) {

    $("#content_list").css("display", "none");
    $("#content_search").css("display", "none");
    $("#content_detail").css("display", "block");
    $("#contentStatus_detail").css("display", "none");
    $("#header_title span").removeAttr("class");

    $("#carNo").val(dataItem.carNo);
    $("#vin").val(dataItem.vinNo);
    $("#invRoDocNo").val(dataItem.roDocNo);
    $("#serReceiveType").val("[" + dataItem.parGiTp + "]" +changeParGiTp(dataItem.parGiTp));
    $("#partsInOutStatus").val(changeParReqStatCd(dataItem.parReqStatCd));
    $("#giDocNo").val(dataItem.giDocNo);
    $("#receiveMan").val(dataItem.receiveNm);
    $("#giTime").val(chgDate2DateTimeStr(dataItem.regDt));

    giDocNo = dataItem.giDocNo;

    $("#subList").attr("src", "<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusItemList.do' />");

}

//currentRnum할당 및 상위,하위 버튼 활성화여부 초기셋팅
initGoBtnSetting = function(rnum) {
    var _rnum = parseInt(rnum);
    currentRnum = rnum;
    if(_rnum == 1) {
        $("#upBtn").data("kendoButton").enable(false);
        $("#downBtn").data("kendoButton").enable(true);
    }else if(_rnum == gData.length) {
        $("#upBtn").data("kendoButton").enable(true);
        $("#downBtn").data("kendoButton").enable(false);
    }else {
        $("#upBtn").data("kendoButton").enable(true);
        $("#downBtn").data("kendoButton").enable(true);
    }
}

//부품상세리스트 보기(리스트에서 클릭할때)
contentDetail = function(dataItem) {
    initGoBtnSetting(dataItem.rnum);
    $("#giDocNo2").val(dataItem.giDocNo);
    $("#invRoDocNo2").val(dataItem.roDocNo);
    $("#parReqStatCd").val(changeParReqStatCd(dataItem.parReqStatCd));
    $("#parGiTp").val("[" + dataItem.roTp + "]" + changeRoTp(dataItem.roTp));
    $("#itemCd").val(dataItem.itemCd);
    $("#itemNm").val(dataItem.itemNm);
    $("#pakage").val(dataItem.pkgItemCd);
    $("#outQty").val(dataItem.resvQty);
    $("#avlbStockQty").val(dataItem.avlbStockQty);
    $("#stockQty").val(dataItem.totStockQty);
    $("#strge").val(changeReqStrgeCd(dataItem.reqStrgeCd));
    $("#locId").val(dataItem.giLocCd);
    $("#prc").val(kendo.toString(dataItem.itemPrc,'n2'));
    $("#taxDdctAmt").val(kendo.toString(dataItem.taxDdctAmt,'n2'));
    $("#taxAmt").val(kendo.toString(dataItem.taxAmt,'n2'));
    $("#amt").val(kendo.toString(dataItem.itemAmt,'n2'));
    $("#giTime2").val(chgDate2DateTimeStr(dataItem.receiveTime));
    $("#getPrsnNm").val(dataItem.receiveNm);
    $("#content_list").css("display", "none");
    $("#content_search").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#contentStatus_detail").css("display", "block");
    $("#header_title span").removeAttr("class");
}

changeParGiTp = function(val) {
    var returnVal = "";
    if (val != null && val != "") {
        returnVal = parGiTpMap[val];
    }
    return returnVal;
};

changeParReqStatCd = function(val) {
    var returnVal = "";
    if (val != null && val != "") {
        returnVal = partsParReqStatCdMap[val];
    }
    return returnVal;
};

changeReceiveId = function(val) {
    var returnVal = "";
    if (val != null && val != "") {
        returnVal = tecCdMap[val];
    }
    return returnVal;
};

changeRoTp = function(val) {
    var returnVal = "";
    if (val != null && val != "") {
        returnVal = roTpCdMap[val];
    }
    return returnVal;
};

changeReqStrgeCd = function(val) {
    var returnVal = "";
    if (val != null && val != "") {
        returnVal = giStrgeCdMap[val];
    }
    return returnVal;
};

</script>
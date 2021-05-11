<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';
var sysDate = "${sysDate}";         // 현재일자

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    <c:if test="${obj.strgeTp eq '02'}">
        storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    </c:if>
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//위치
var locDSList = [];
var locCdObj = {};

//재고유형
var tStockTpList = [];
var tStockTpObj = {};
tStockTpList.push({"cmmCd":"3", "cmmCdNm":"<spring:message code='sal.lbl.all' />", "useYn":"Y"});
tStockTpList.push({"cmmCd":"1", "cmmCdNm":"<spring:message code='sal.lbl.stock' />", "useYn":"Y"});
tStockTpList.push({"cmmCd":"2", "cmmCdNm":"<spring:message code='sal.lbl.trsf' />", "useYn":"Y"});
tStockTpObj["3"] = "<spring:message code='sal.lbl.all' />";
tStockTpObj["1"] = "<spring:message code='sal.lbl.stock' />";
tStockTpObj["2"] = "<spring:message code='sal.lbl.trsf' />";

$(document).ready(function() {
    $("#sConfirmYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ynList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });
    // 타이틀
    $("#header_title").html("<spring:message code='mob.sal.title.stockResult' />"); //재고상태관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/inv/stockState/selectStockStateResultList.do' />");
    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#listarea_noData").hide();
            mob.loading.show();
            contentList();
        }
    });
    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); $("#content_detail").css("display","none"); }
    });

    $("#detailCloseBtn").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); $("#content_detail").css("display","none"); }
    });

    $("#stockCreate").click(function(){
        $.ajax({
            url:"<c:url value='/sal/inv/stockDue/CreateStockDueInfo.do' />"
           ,data:JSON.stringify({})
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               if(jqXHR.responseJSON.errors.length > 0){
                   mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }else{
                   mob.notification.error(error);
               }
           }
           ,success:function(jqXHR, textStatus) {
               mob.notification.success("<spring:message code='global.info.success' />");
               $("#btnSearch").click();
           }
       });
    });

});
</script>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<section id="content">
    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title"><spring:message code="mob.sal.title.stockResult" /><!-- 재고차종결과 --></h2>
            <div class="title_btn">
                <span class="tbtn01" id="stockCreate"><spring:message code='sal.btn.stockCreate' /></span>
            </div>
        </div>
        <div class="listarea">
            <div class="dlistitem listhead">
                <span style="width:65%;"><spring:message code='global.lbl.vinNum' /></span>
                <span style="width:35%;"><spring:message code="par.lbl.inInvestYn" /><!-- 실사여부 --></span>
                <span style="width:65%;" class="clboth"><spring:message code="global.lbl.ocn" />/<spring:message code="global.lbl.model" /><!-- OCN/차관 --></span>
                <span style="width:35%;"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
                <span style="width:65%;" class="clboth"><spring:message code="global.lbl.stockMonth" /><!-- 재고월령 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
        <div class="btnfixed">
            <div class="dlistitem bgNone" style="text-align: left; border-bottom: 0px">
                <span style="width:16.5%"><spring:message code='sal.lbl.stock' />:</span>
                <span style="width:16.5%" id="stockSum"></span>
                <span style="width:16.5%"><spring:message code='mob.sal.label.stockDone' />:</span>
                <span style="width:16.5%" id="stockDoneSum"></span>
                <span style="width:16.5%"><spring:message code='mob.sal.label.stockNo' />:</span>
                <span style="width:16.5%" id="stockNoSum"></span>
            </div>
        </div>
    </section>
    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.lbl.stockCarListSearch" /><!-- 재고차종 리스트 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="mob.sal.lbl.stockDt" /><!-- 실사일자 --></th>
                        <td>
                            <div class="f_item01">
                                 <input type="search" id="sStockDt" style="width:140px" value="${sysDate}" />
                                 <span class="date" onclick="calpicker('sStockDt');"></span>
                             </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.vinNo" /><!-- VIN NO --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo" class="f_text" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.confirmYn" /><!-- 확인여부 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sConfirmYn" class="form_comboBox" ></div>
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
                <h2><spring:message code="mob.sal.title.stockResult" /></h2>
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
                </div>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
</section>
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
  setTimeout(function(){ setMainListHeight();}, 200);
}
//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}
var keyMapArr=[
               {temp:"s",key:"confirmYn",txt:"<spring:message code='global.lbl.confirmYn' />",type:""}, //확인여부
               {temp:"s",key:"vinNo",txt:"<spring:message code='sal.lbl.carVinNo' />",type:""}, //vinNo
               {temp:"s",key:"carlineCd",txt:"<spring:message code='global.lbl.carlineCd' />",type:""},//차종코드
               {temp:"s",key:"carlineNm",txt:"<spring:message code='global.lbl.carlineNm' />",type:""},//차종명
               {temp:"s",key:"modelNm",txt:"<spring:message code='global.lbl.model' />",type:""},//차관
               {temp:"s",key:"ocnCd",txt:"<spring:message code='global.lbl.ocnCode' />",type:""},//OCN코드
               {temp:"s",key:"ocnNm",txt:"<spring:message code='global.lbl.ocnNm' />",type:""},//OCN명
               {temp:"s",key:"extColorCd",txt:"<spring:message code='global.lbl.extColorCd' />",type:""},//외장색코드
               {temp:"s",key:"extColorNm",txt:"<spring:message code='global.lbl.extColorNm' />",type:""},//외장색명
               {temp:"s",key:"intColorCd",txt:"<spring:message code='global.lbl.intColorCd' />",type:""},//내장색코드
               {temp:"s",key:"carStatNm",txt:"<spring:message code='sal.lbl.strgeCd' />",type:""},//창고
               {temp:"s",key:"locNm",txt:"<spring:message code='sal.lbl.location' />",type:""},//위치
               {temp:"s",key:"signoffDt",txt:"<spring:message code='sal.lbl.regDt' />",type:"strDateOnly"},//생성일자
               {temp:"s",key:"pltGiDt",txt:"<spring:message code='sal.lbl.pltGiDt' />",type:"strDateOnly"},//공장출고일자
               {temp:"s",key:"grDt",txt:"<spring:message code='sal.lbl.grDts' />",type:"strDateOnly"},//입고일자
               {temp:"s",key:"stockAgingCnt",txt:"<spring:message code='global.lbl.stockMonth' />",type:""},//재고월령
               {temp:"s",key:"remark",txt:"<spring:message code='global.lbl.remark' />",type:""}//비고
               ];
//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");
    if(dataItem != null){
        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        //setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것
        $("#confirmYn").val(ynObj[$("#confirmYn").val()]);
    }
}

</script>
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
            <h2><spring:message code="cmm.title.zipcode.search" /><!-- 주소 추가 --></h2>
        </div>
        <div class="listarea">
            <c:import url="/WEB-INF/jsp/ZnewMob/cmm/sci/commonPopup/listJsp/selectZipCodeListPopup.jsp"></c:import>
            <c:import url="/WEB-INF/jsp/ZnewMob/cmm/sci/commonPopup/listJsp/selectZipCodeListPopup2.jsp"></c:import>
            <c:import url="/WEB-INF/jsp/ZnewMob/cmm/sci/commonPopup/listJsp/selectZipCodeListPopup3.jsp"></c:import>
            <!-- <iframe id="comonPopupList" border="0" frameborder="0" width="30%" height="300" class="pl"></iframe>
            <iframe id="comonPopupList2" border="0" frameborder="0" width="30%" height="300" class="pl"></iframe>
            <iframe id="comonPopupList3" border="0" frameborder="0" width="37%" height="300" class="pl"></iframe> -->
        </div>
        <div class="btnfixed">
            <div class="formarea">
                <table class="flist01">
                    <caption><spring:message code='crm.lbl.addrSearchCond' /><!-- 주소 조회 조건    --></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="required"><spring:message code="crm.lbl.addr1" /><!-- 소재지 주소 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                    <input type="text" value="" name="addr" id="addr" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="crm.lbl.addrDetlCont" /><!-- 상세주소 --></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" value="" name="addrDtl" id="addrDtl" placeholder="<spring:message code='crm.lbl.addrDetlCont' />" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                    <div class="f_text"><input type="text" id="addrTp" name="addrTp" data-json-obj="true" /></div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 버튼 2개  -->
            <div class="con_btnarea btncount2">
                <div><span class="btnd1t2" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></span></div>
                <div><span class="btnd1" id="btnSelect"><spring:message code="global.btn.save" /><!-- 저장 --></span></div>
            </div>
        </div>
    </section>
</section>


<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>


<!-- script -->
<script>
var sungCd="";
var cityCd="";

//sung data 초기화
var sungCdDs = [];
<c:forEach var="obj" items="${sungCdList}">
sungCdDs.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>

//검색구분 목록
var gubunList = [];
<c:forEach var="obj" items="${gubunList}">
gubunList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//주소유형
var addrTpList = [];
<c:forEach var="obj" items="${addrTpList}">
addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var zipInfoList = [];
<c:forEach var="obj2" items="${zipInfoList}" begin="0" end="0">
zipInfoList.push({"sungNm":"${obj2.sungNm}"});
</c:forEach>

var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();


// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;
$(document).ready(function() {
    setDataItem = null ;// 화면 로딩시 초기화

    function initPage(){
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
    }

    var plHeight=$("#mwrap").height()-$("#header").height()-$(".content_title:eq(1)").height()-$("#content_list .content_title").height()*2-$(".btnfixed").height();
    $(".pl").height(plHeight);


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.zipSearch' />");    <!-- 우편번호 조회 -->
    $("#header_title").on("click", contentSearch);

    // 목록 조회
    $("#comonPopupList").attr("src", "<c:url value='/mob/cmm/sci/commonPopup/selectZipCodeListPopup.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sGubun = $("#sGubun").data("kendoExtDropDownList").text();
            var sValue = $("#sValue").val();
            var sZipCd = $("#sZipCd").val();


            if(sGubun != "") $("#search1Area span[name='searchStr']").text(sGubun);
            if(sValue != "") $("#search2Area span[name='searchStr']").text(sValue);
            if(sZipCd != "") $("#search3Area span[name='searchStr']").text(sZipCd);
           // setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        parent.zipCodeSearchPopupWin.close();
    });

 // 갬색구분 드랍다운 리스트.
    $("#sGubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:gubunList
        ,optionLabel:" "
        ,index:1
    });

 // 주소유형
    $("#addrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(addrTpList)
        ,optionLabel:" "
        ,index:1
    });

    //선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            if($("#addr").val()==""||$("#addr").val()==null){
                mob.notification.warning("<spring:message code='crm.lbl.addr1' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            }else if($("#addrDtl").val()==""||$("#addrDtl").val()==null){
                mob.notification.warning("<spring:message code='crm.lbl.addrDetlCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            }else if($("#addrTp").data("kendoExtDropDownList").value()==""||$("#addrTp").data("kendoExtDropDownList").value()==null){
                mob.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            }else{
                if(setDataItem != null) {
                    setDataItem.addrDetlCont = $("#addrDtl").val();
                    setDataItem.addrTp = $("#addrTp").data("kendoExtDropDownList").value();
                    options.callbackFunc(setDataItem);
                    parent.zipCodeSearchPopupWin.close();
                }else{
                    mob.notification.warning("<spring:message code='crm.lbl.addr1' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                }
            }
        }
    });

    //취소 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            console.log(">>>> cancel <<<<");
            goMain();
        }
    });

  //get the first zipcode date from grid, and get address info with this zipcode.
    if( zipInfoList != null && zipInfoList.length > 0){
        $("#sValue").val(zipInfoList[0].sungNm);
    }
});
</script>

<script>

//팝업 레이어닫기
function goMain() {
    parent.zipCodeSearchPopupWin.close();
}


//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_list").css("display","block");
  document.getElementById("comonPopupList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_search").css("display","block");
}

// 팝업 설정값
var options = parent.zipCodeSearchPopupWin.options.content.data;
function contentCommonDetail(dataItem) {
     setDataItem = dataItem;
     var addr = dataItem.sungNm + " " + dataItem.cityNm + " " + dataItem.distNm
     $("#addr").val(addr);
}
var sungNmGet="", cityNmGet="", distNmGet="";
function contentCommonDetail(fromNum, dataItem) {
    switch (fromNum){
        case 1:
            sungNmGet=dataItem.sungNm;
            cityNmGet="";
            distNmGet="";
            break;
        case 2:
            cityNmGet="/"+dataItem.cityNm;
            distNmGet="";
            break;
        case 3:
            distNmGet="/"+dataItem.distNm;
            break;
    }
    //setDataItem = dataItem;
    var addr = sungNmGet+cityNmGet+distNmGet;
    $("#addr").val(addr);
}
</script>
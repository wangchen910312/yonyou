<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <div class="content_title conttitlePrev">
            <h2 id="content_title_h2"><spring:message code="global.lbl.custSearchCondition" /><!-- 고객검색조건 --></h2>
        </div>
        <!-- 탭메뉴 -->
        <div id="custSearchTabDiv"> <!--  고객조회 TAB - 시작 -->
            <!-- content_pop_list -->
            <section id="content_pop_list" style="display:none;">
                <div class="listarea01">
                    <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustSearchListPopup.jsp"></c:import>
                </div>
                <div class="con_btnarea">
                    <dms:access viewId="VIEW-D-13131" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="btnd1" id="btnSelect"><spring:message code="global.btn.select" /><!-- 선택 --></span>
                    </dms:access>
                </div>
            </section>

            <!-- content_pop_search(고객)-->
            <section id="content_pop_search" class="content_pop_search">
               <div class="formarea">
                    <table class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                         <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custNm"  class="form_input" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custTp' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custTp"  class="form_comboBox" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /></th>
                                    <td>
                                        <div class="f_text"><div class="f_text"><input type="number" class="numberic" id="hpNo" class="form_input" /></div>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </div>
            </section>
        </div> <!--  고객조회 TAB - 끝-->

    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<!-- script -->
<script>
//Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
var tabSel = "${tabSel}";
var custTpFromSNSOPP = "${custTpFromSNSOPP}";

var custTpList = [];
var sexCdList = [];
var custTpMap = [];
var sexCdMap = [];
var chgBuyYnMap = [];
var custCdList = [];    //{"cmmCd":"", "cmmCdNm":"", "useYn":""}
var custCdMap = [];

<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

sexCdList.push({"cmmCd":"" , "cmmCdNm":""});
<c:forEach var="obj" items="${sexCdList}">
sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//잠재고객
<c:forEach var="obj" items="${custCdList}">
custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

//고객정보 조회
function setSearchBox(){
    var custNm = $("#custNm").val();
    var custTp = $("#custTp").data("kendoExtDropDownList").value();
    var hpNo = $("#hpNo").val();
    var sexCd = $("#sexCd").data("kendoExtDropDownList").value();
    var telNo = $("#telNo").val();
    //var bhmcYn = $("#bhmcYn").val();
    var bhmcYn = "";
    if($("#bhmcYn").prop("checked")){
        bhmcYn = "Y";
    }
    var regDtFrom = $("#regDtFrom").val();
    var regDtTo = $("#regDtTo").val();
}

// 그리드에서 목록 선택시 선택값 세팅
var setDataItem; //고객
var setDataItem2; //정보
$(document).ready(function() {
    setDataItem = null ;// 화면 로딩시 초기화
    setDataItem2 = null ;// 화면 로딩시 초기화
    var a = "${custNm}";

    function initPage(){
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $("#custTp").data("kendoExtDropDownList").value(custTpFromSNSOPP);
    }


    // 고객유형 드랍다운 리스트.
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        , dataSource:custTpList
        , index:0
        , change:function(e) {
            var selcmmCd = this.dataItem(this.select()).cmmCd;
        }
    });

    // 성별 드랍다운 리스트.
    $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        , dataSource:sexCdList
        , index:0
    });



    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.custSearch' />"); // 고객조회
    // 버튼 - 조회(고객)
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sUsrId = $("#sUsrId");
            var sUsrNm = $("#sUsrNm");
            var sEmpNo = $("#sEmpNo");

            var custNm = $("#custNm");
            var custTp = $("#custTp").data("kendoExtDropDownList").text();
            var hpNo = $("#hpNo");
            var telNo = $("#telNo");
            listData.read();
        }
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_pop_list").css("display") == "block") {
        //goMain();
        parent.popupWindow.close();
        }
        else if ($("#content_pop_search").css("display") == "block") { contentList(); }
    });

    //헤더 접기 실행
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    $("#header_title").bind("click", function(){
        if(tabSel == '1'){
            if($("#content_pop_search").css("display") == "block"){
                $("#content_pop_search").css("display","none");
                $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
                $("#header_title span").attr("class","search_open");
            } else if($("#content_pop_list").css("display")=="block"){
                $("#header_title span").attr("class","search_close");
                contentSearch();
            }
        }
    });
    if (options.autoBind) {
        $("#custNm").val(options.custNm);
        $("#btnSearch").click();
    }

});
</script>

<script>

//팝업 레이어닫기

function goMain() {
    parent.popupWindow.close();
}

//목록페이지 보기 (고객)
function contentList() {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");
  $("#header_title span").attr("class","search_open");
}

//검색페이지 보기(고객)
function contentSearch() {
  $("#content_pop_list").css("display","none");
  $("#content_pop_search").css("display","block");
}

// 팝업 설정값
var options = parent.popupWindow.options.content.data;

function contentCommonDetail(dataItem) {
    setDataItem = dataItem;
}

//선택 버튼.
$("#btnSelect").kendoButton({
    click:function(e){
        if(setDataItem != null) {
            options.callbackFunc(setDataItem);
            parent.popupWindow.close();
        }
    }
});

</script>
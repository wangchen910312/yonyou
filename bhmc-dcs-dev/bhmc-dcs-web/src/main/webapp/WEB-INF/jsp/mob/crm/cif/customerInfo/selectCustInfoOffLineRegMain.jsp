<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title mtitle">
                <h1><spring:message code="global.lbl.regCustList" /><!-- 등록고객 목록  --></h1>
            </div>
            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%"><spring:message code="global.lbl.custNm" /><!-- 고객명  --></span>
                    <span style="width:50%"><spring:message code="global.lbl.carRegDt" /><!-- 등록일자  --></span>
                    <span style="width:50%" class="clboth"><spring:message code="global.lbl.phoneNo" /><!-- 전화번호  --></span>
                    <span style="width:50%"><spring:message code="crm.lbl.custSource" /><!-- 고객출처  --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
            <!-- ToDo 고객등록 로직구현 필요 -->
            <div class="btnfixed">
                <div class="con_btnarea">
                    <span class="btnd1"><span class="search"><spring:message code="global.title.custAdd" /><!-- 고객등록  --></span></span>
                </div>
            </div>
        </section>



    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var toDate,
    gCrud;

toDate = new Date();


<!-- ToDo 고객출처 로직구현 필요 -->
//고객출처
var custSourceList             =  [],
custSourceObj              = {};

custSourceList             = [{cmmCd:"11",cmmCdNm:"Nm_11"},{cmmCd:"22",cmmCdNm:"Nm_22"}];
custSourceObj["11"]              = "Nm_11";
custSourceObj["22"]              = "Nm_22";

<!-- ToDo 고객출처 로직구현 필요 -->
<c:forEach var="obj" items="${custSourceList}" varStatus="status">
custSourceList({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
custSourceObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {

    // 고객출처
    $("#custSource").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:custSourceList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });


    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
        */
    }


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.offLineReg' />"); //오프라인 등록
    //$("#header_title").on("click", contentSearch);

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectCustInfoOffLineRegList.do' />");
    //document.getElementById("mainList").contentWindow.selectItemList();


    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var custNm = $("#custNm").val();
            var custHp = $("#custHp").val();
            var custSourceTxt = $("#custSource").data("kendoExtDropDownList").text();
            var custSourceVal = $("#custSource").data("kendoExtDropDownList").value();

            document.getElementById("mainList").contentWindow.addItemList(custNm, custHp, custSourceTxt, custSourceVal);
        }
    });

    // 버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#custNm").val("");
            $("#custHp").val("");
            $("#custSource").data("kendoExtDropDownList").value("");
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

function selectItemList(){
    var resultList = [
            {"SUBCAMPAIN_CD":"", "CUST_NM":"사진", "CUST_HP":"1111111111", "CAMPAIN_CD":"11","CREATE_DATE":"2015-01-01"},
            {"SUBCAMPAIN_CD":"", "CUST_NM":"사진2", "CUST_HP":"2111111111","CAMPAIN_CD":"11","CREATE_DATE":"2015-01-01"},
            {"SUBCAMPAIN_CD":"", "CUST_NM":"사진3", "CUST_HP":"3111111111", "CAMPAIN_CD":"22","CREATE_DATE":"2015-01-01"},
            {"SUBCAMPAIN_CD":"", "CUST_NM":"사진4", "CUST_HP":"4111111111", "CAMPAIN_CD":"22","CREATE_DATE":"2015-01-01"}

   ];
    document.getElementById("mainList").contentWindow.getItemList(resultList);
}
</script>

<script>
//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

</script>
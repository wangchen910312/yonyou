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
        <%-- <div class="tabarea">
            <ul class="tab_search">
                <li id="custSearchTab" class="on"><span><spring:message code="global.title.custSearch" /><!-- 고객조회 --></span></li>
                <li id="carInfoSearchTab"><span><spring:message code="ser.title.carInfo" /> <!-- 차량정보 --></span></li>
            </ul>
        </div> --%>
        <div id="custSearchTabDiv"> <!--  고객조회 TAB - 시작 -->
            <!-- content_pop_list -->
            <section id="content_pop_list" style="display:none;">
                <div class="skeyarea">
                    <div>
                        <table class="slist01">
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                 <tr id="search1Area">
                                    <th scope="row"><span><spring:message code='global.lbl.custNm' /></span></th><!-- 고객명 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search2Area">
                                    <th scope="row"><span><spring:message code='global.lbl.custTp' /></span></th><!-- 고객유형 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search3Area">
                                    <th scope="row"><span><spring:message code="global.lbl.hpNo" /></span></th><!-- 이동전화 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search4Area">
                                    <th scope="row"><span><spring:message code='global.lbl.sex' /></span></th><!-- 성별 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search5Area">
                                    <th scope="row"><span><spring:message code='global.lbl.homeTelNo' /></span></th><!-- 집전화 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search6Area">
                                    <th scope="row"><span><spring:message code="global.lbl.bhmcyn" /></span></th><!-- BHMC여부 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search7Area">
                                    <th scope="row"><span><spring:message code='global.lbl.regDt' /></span></th><!-- 등록일 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="listarea">
                    <div class="dlistitem listhead">
                        <%--<span style="width:45%"><spring:message code='global.lbl.custNm' />(<spring:message code="global.lbl.custTp" />)</span>--%>
                        <span style="width:45%"><spring:message code='global.lbl.custNm' /></span>
                        <span style="width:55%"><spring:message code='global.lbl.sex' /></span>
                        <span style="width:45%" class="clboth"><spring:message code="global.lbl.hpNo" /></span>
                        <span style="width:55%"><spring:message code="crm.lbl.potenCust" />/<spring:message code="crm.lbl.haveCust" /></span>
                    </div>
                    <iframe id="comonPopupList" border="0" frameborder="0" width="100%" height="300"></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_pop"><span></span></div>
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
                                <%-- <tr>
                                    <th scope="row"><spring:message code='global.lbl.sex' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sexCd"  class="form_comboBox" /></div>
                                    </td>
                                </tr> --%>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='global.lbl.homeTelNo' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="telNo"  class="form_input" /></div>
                                    </td>
                                </tr> --%>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='global.lbl.bhmcyn' /></th>
                                    <td>
                                        <input id="bhmcYn" name="bhmcYn" class="f_check" type="checkbox" /><label for="bhmcYn" /></label>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.regDt' /></th>
                                    <td class="f_term">
                                        <div class="f_item01">
                                            <input type="text" id="regDtFrom" name="regDtFrom" value="${toDay}" readOnly />
                                            <span class="date" onclick="calpicker('regDtFrom')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                        <span class="termtext"> ∼</span>
                                        <div class="f_item01">
                                            <input type="text" id="regDtTo" name="regDtTo" value="${toDay}" readOnly />
                                            <span class="date" onclick="calpicker('regDtTo')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr> --%>
                            </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </div>
            </section>
        </div> <!--  고객조회 TAB - 끝-->

        <div id="carInfoSearchTabDiv" style="display:none;"> <!-- 차량정보 TAB - 시작-->
            <!-- content_pop_list -->
            <section id="content_pop_list2">
                <div class="skeyarea">
                    <div>
                        <table class="slist01">
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr id="search8Area">
                                    <th scope="row"><span><spring:message code='global.lbl.vinNo' /></span></th><!-- VIN -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search9Area">
                                    <th scope="row"><span><spring:message code='global.lbl.carNo' /></span></th><!-- 차량번호 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search10Area">
                                    <th scope="row"><span><spring:message code="global.lbl.custNm" /></span></th><!-- 고객명 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="listarea">
                    <div class="dlistitem listhead">
                        <span style="width:70%"><spring:message code="global.lbl.vinNo" /></span>
                        <span style="width:30%"><spring:message code="global.lbl.carNo" /></span>
                        <span style="width:40%" class="clboth"><spring:message code="global.lbl.custNm" /></span>
                        <span style="width:30%"><spring:message code="global.lbl.hpNo" /></span>
                        <span style="width:30%"><spring:message code="global.lbl.homeTelNo" /></span>
                    </div>
                    <iframe id="comonPopupList2" border="0" frameborder="0" width="100%" height="300"></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_pop2"><span></span></div>
                </div>
                <div class="con_btnarea">
                    <span class="btnd1" id="btnSelect2"><spring:message code="global.btn.select" /><!-- 선택 --></span>
                </div>
            </section>


            <!-- content_pop_search2(차량) -->
            <section id="content_pop_search2" class="content_pop_search" style="display:none;">
               <div class="formarea">
                    <table class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                         <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sVinNo"  class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.carNo' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sCarNo"  class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sCustNm" class="form_input" ></div>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <span id="btnSearch2" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </div>
            </section>
        </div><!-- 차량정보 TAB - 끝-->



    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


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


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#custNm").val("");
            break;
        case "search2Area" :
            $("#custTp").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#hpNo").val("");
            break;
        case "search4Area" :
            $("#sexCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#telNo").val("");
            break;
        case "search6Area" :
            //$("#bhmcYn").val("");
            $("#bhmcYn").prop("checked", false);
            break;
        case "search7Area" :
            $("#regDtFrom").val("");
            $("#regDtTo").val("");
            break;
        case "search8Area" :
            $("#sVinNo").val("");
            break;
        case "search9Area" :
            $("#sCarNo").val("");
            break;
        case "search10Area" :
            $("#sCustNm").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");

    if ($("#content_pop_list").css("display") == "block"){
        setSearchBox();
        contentList();
    }
    if ($("#content_pop_list2").css("display") == "block"){
        setSearchBox2();
        contentList2();
    }

});

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

    if(custNm == "" && custTp == "" && hpNo == "" &&
            sexCd == "" && telNo == "" && bhmcYn == "" && regDtFrom == "" && regDtTo == ""){
        $("#content_pop_list .skeyarea").hide();
    } else {
        $("#content_pop_list .skeyarea").show();

        if(custNm == "") $("#search1Area").hide();
            else $("#search1Area").show();
        if(custTp == "") $("#search2Area").hide();
            else $("#search2Area").show();
        if(hpNo == "") $("#search3Area").hide();
            else $("#search3Area").show();
        if(sexCd == "") $("#search4Area").hide();
            else $("#search4Area").show();
        if(telNo == "") $("#search5Area").hide();
            else $("#search5Area").show();
        //if(bhmcYn == "") $("#search6Area").hide();
        if($("#bhmcYn").prop("checked") == false) $("#search6Area").hide();
            else $("#search6Area").show();
        if(regDtFrom == "") $("#search7Area").hide();
            else $("#search7Area").show();
    }
    //setMainListHeight();
    //setPopUpListHeight();
}
//차량정보조회
function setSearchBox2(){

    var sVinNo = $("#sVinNo").val();
    var sCarNo = $("#sCarNo").val();
    var sCustNm = $("#sCustNm").val();

    if(sVinNo == "" && sCarNo == "" && sCustNm == ""){
        $("#content_pop_list2 .skeyarea").hide();
    } else {
        $("#content_pop_list2 .skeyarea").show();

        if(sVinNo == "") $("#search8Area").hide();
            else $("#search8Area").show();
        if(sCarNo == "") $("#search9Area").hide();
            else $("#search9Area").show();
        if(sCustNm == "") $("#search10Area").hide();
            else $("#search10Area").show();
    }
}
// 그리드에서 목록 선택시 선택값 세팅
var setDataItem; //고객
var setDataItem2; //정보
$(document).ready(function() {
    setDataItem = null ;// 화면 로딩시 초기화
    setDataItem2 = null ;// 화면 로딩시 초기화
    var a = "${custNm}";

    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        } */
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();

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
            /*
            if (selcmmCd == "01"){  // 개인 (01), 법인(02)
               $("#sexCd").data("kendoExtDropDownList").enabel(false); // 성별
            } else {
                custHoldTpDtl.enable(false);
            }
            */
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
    //$("#header_title").on("click", contentSearch);
    //("#header_title").on("click", contentSearchCheck);

    // 목록 조회
    //$("#comonPopupList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectCustSearchListPopup.do' />");

    //$("#comonPopupList2").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectCustSearchList2Popup.do' />");

    // 버튼 - 조회(고객)
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sUsrId = $("#sUsrId");
            var sUsrNm = $("#sUsrNm");
            var sEmpNo = $("#sEmpNo");

            var custNm = $("#custNm");
            var custTp = $("#custTp").data("kendoExtDropDownList").text();
            var hpNo = $("#hpNo");
            //var sexCd = $("#sexCd").data("kendoExtDropDownList").text();
            var telNo = $("#telNo");
            /* var bhmcYn = $("#bhmcYn");

            var bhmcYn = "";
            if($("#bhmcYn").prop("checked")){
                bhmcYn = "Y";
            }

            var regDtFrom = $("#regDtFrom");
            var regDtTo = $("#regDtTo");

            if(custNm.val() != "") $("#search1Area span[name='searchStr']").text(custNm.val());
            if(custTp != "") $("#search2Area span[name='searchStr']").text(custTp);
            if(hpNo.val() != "") $("#search3Area span[name='searchStr']").text(hpNo.val());
            if(sexCd != "") $("#search4Area span[name='searchStr']").text(sexCd);
            if(telNo.val() != "") $("#search5Area span[name='searchStr']").text(telNo.val());
            //if(bhmcYn.val() != "") $("#search6Area span[name='searchStr']").text(bhmcYn.val());
            if(bhmcYn != "") $("#search6Area span[name='searchStr']").text("Y");
            if(regDtFrom.val() != "") $("#search7Area span[name='searchStr']").html(regDtFrom.val() +" ~ <br/>"+regDtTo.val());

            setSearchBox(); */

            //contentList();
            //조회버튼 클릭 시점에 contentList2()함수와 동일 기능 구현
            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");
            $("#comonPopupList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectCustSearchListPopup.do' />");
        }
    });
    // 버튼 - 조회(차량)
    $("#btnSearch2").kendoButton({
        click:function(e) {
            var sVinNo = $("#sVinNo");
            var sCarNo = $("#sCarNo");
            var sCustNm = $("#sCustNm");

            if(sVinNo.val() != "") $("#search8Area span[name='searchStr']").text(sVinNo.val());
            if(sCarNo.val() != "") $("#search9Area span[name='searchStr']").text(sCarNo.val());
            if(sCustNm.val() != "") $("#search10Area span[name='searchStr']").text(sCustNm.val());
            setSearchBox2();

            //contentList2();
            //조회버튼 클릭 시점에 contentList2()함수와 동일 기능 구현
            $("#content_pop_search2").css("display","none");
            $("#content_pop_list2").css("display","block");
            $("#comonPopupList2").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectCustSearchList2Popup.do' />");
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
        if ($("#content_pop_list2").css("display") == "block") {
         //goMain();
        parent.popupWindow.close();
          }
        else if ($("#content_pop_search2").css("display") == "block") { contentList2(); }
        //else if ($("#content_detail").css("display") == "block") { contentList(); }
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
    /* //고객조회 TAB
    $("#custSearchTab").bind("click", function()
    {
        if(tabSel == '2')
            return false;
        $("#custSearchTab").addClass("on");
        $("#carInfoSearchTab").removeClass("on");
        $("#custSearchTabDiv").css("display","block");
        $("#carInfoSearchTabDiv").css("display","none");
        $("#content_title_h2").text('<spring:message code="global.lbl.custSearchCondition" />(<spring:message code="global.title.custSearch" />)');

        setDataItem = null; // Tab 변경시 차량 선택 데이터 초기화
        setDataItem2 = null;
        contentSearchCheck(); //탭선택시 조회검색 화면 표시
    });
    //차량조회 TAB
    $("#carInfoSearchTab").bind("click", function()
    {
        if(tabSel == '1')
            return false;
        $("#custSearchTab").removeClass("on");
        $("#carInfoSearchTab").addClass("on");
        $("#custSearchTabDiv").css("display","none");
        $("#carInfoSearchTabDiv").css("display","block");
        $("#content_title_h2").text('<spring:message code="global.lbl.custSearchCondition" />(<spring:message code="ser.title.carInfo" />)');

        setDataItem = null; // Tab 변경시 차량 선택 데이터 초기화
        setDataItem2 = null;
        contentSearchCheck(); //탭선택시 조회검색 화면 표시
    });
    if(tabSel == '2'){  //차량조회만 선택 시 차량조회 Tab Default;
        $("#carInfoSearchTab").click();
    } */


    //헤더 접기 실행
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    /*
    $("#header_title").bind("click", function(){
        if($("#content_pop_search").css("display") == "block"){
            $("#header_title span").attr("class","search_close");
        }else{
            $("#header_title span").attr("class","search_open");
        }
    });
    */
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
        } else {
            if($("#content_pop_search2").css("display") == "block"){
                $("#content_pop_search2").css("display","none");
                $("#content_pop_list2").css("display","block");$("#header_title span").attr("class","search_open");
                $("#header_title span").attr("class","search_open");
            } else if($("#content_pop_list2").css("display")=="block"){
                $("#header_title span").attr("class","search_close");
                contentSearch2();
            }
        }
    });
    if (options.autoBind) {
        $("#custNm").val(options.custNm);
        $("#btnSearch").click();
        //console.log("asdf : ",document.getElementById("comonPopupList").contentWindow.listViewClick());

    }
});
</script>

<script>

//팝업 레이어닫기

function goMain() {
  //window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    parent.popupWindow.close();
}


//목록페이지 보기 (고객)
function contentList() {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("comonPopupList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setPopUpListObjHeight("content_pop_list");}, 200);
}

//목록페이지 보기 (차량)
function contentList2() {
  $("#content_pop_search2").css("display","none");
  $("#content_pop_list2").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("comonPopupList2").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setPopUpListObjHeight("content_pop_list2");}, 200);
}



//검색페이지 보기(고객)
function contentSearch() {
  $("#content_pop_list").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_pop_search").css("display","block");
}

//검색페이지 보기(차량)
function contentSearch2() {
  $("#content_pop_list2").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_pop_search2").css("display","block");
}

// 팝업 설정값
var options = parent.popupWindow.options.content.data;


function contentCommonDetail(dataItem) {
    setDataItem = dataItem;
}

function contentCommonDetail2(dataItem) {
    setDataItem2 = dataItem;
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


$("#btnSelect2").kendoButton({
    click:function(e){
        if(setDataItem2 != null) {
            options.callbackFunc(setDataItem2);
            parent.popupWindow.close();
        }
    }
});


function contentSearchCheck(){
    if ($("#custSearchTabDiv").css("display") == "block") { contentSearch(); }
    if ($("#carInfoSearchTabDiv").css("display") == "block") { contentSearch2(); }
}



</script>
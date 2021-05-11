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
            <h2 id="content_list_title"><spring:message code="sal.lbl.comVehicleDrvHisList" /><!-- 회사차 운행내역 목록 --></h2>
             <div class="title_btn">
                <span id="btnAdd" class="tbtn"><spring:message code="global.btn.add" /><!-- 추가 --></span>
            </div>
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
                            <th scope="row"><span><spring:message code="global.lbl.vinNo" /><!-- VIN NO --></span></th>
                            <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search2Area">
                            <th scope="row"><span><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span></th>
                            <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search3Area">
                            <th scope="row"><span><spring:message code="global.lbl.useTime" /><!-- 사용일시 --></span></th>
                            <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="listarea">
            <div class="dlistitem listhead">
                <span style="width:60%"><spring:message code='global.lbl.vinNo' /><!-- VIN NO --></span>
                <span style="width:40%"><spring:message code="global.lbl.carRegNo" /><!--차량번호 --></span>
                <span style="width:60%" class="clboth"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
                <span style="width:40%"><spring:message code='global.lbl.model' /><!-- 모델 --></span>
                <span style="width:60%" class="clboth"><spring:message code="global.lbl.proxyDstinTp" /><!-- 회사차구분 --></span>
                <span style="width:40%"><spring:message code="global.lbl.user" /><!-- 사용자 --></span>
                <!-- <span style="width:40%"><spring:message code="global.lbl.model" /></span> -->
                <span style="width:60%" class="clboth"><spring:message code='global.lbl.useStartDt' /><!-- 사용시작일시 --></span>
                <span style="width:40%"><spring:message code="global.lbl.useEndDt" /><!--사용종료일시 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
        </div>
    </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.lbl.comVehicleDrvListSearch" /><!-- 회사차 운행내역 조회조건 --></h2>
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
                        <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo"  class="form_input" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                        <td>
                            <div class="f_text"><input type="text" id="sCarRegNo"  class="form_input" style="width:100%"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.useStartDt' /></span></th>    <!-- 사용일시 -->
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sUseStartDt" value="${oneDay}" readOnly />
                                <span class="date" onclick="calpicker('sUseStartDt')"><spring:message code='global.lbl.useStartDt' /><!--사용시작일시--></span>
                            </div>
                            <div class=f_item01>
                                <input type="text" id="sUseStartTime" value="01:00" readOnly />
                                <span class="time" onclick="timepicker2('sUseStartTime')"><spring:message code='global.lbl.useStartDt' /><!--사용시작일시--></span>
                            </div>
                            <span class="termtext"> ∼</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.useEndDt' /></span></th>    <!-- 사용일시 -->
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sUseEndDt" value="${lastDay}" readOnly />
                                <span class="date" onclick="calpicker('sUseEndDt')"><spring:message code='global.lbl.useEndDt' /><!--사용종료일시--></span>
                            </div>
                            <div class="f_item01">
                                <input type="text" id="sUseEndTime" value="01:00" readOnly />
                                <span class="time" onclick="timepicker2('sUseEndTime')"><spring:message code='global.lbl.useEndDt' /><!--사용종료일시--></span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
    </section>

    <!-- content_detail -->
    <form id="detailForm" name="detailForm" method="POST" action="/">
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2 id="detailForm_content_title_id"><spring:message code='sal.lbl.comVehicleDrvListDetail' /><!-- 회사차 운행내역 상세정보 --></h2>
            </div>
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNo' /><!-- VIN --></th>
                            <td>
                                <div class="f_item01" id="searchVinNo">
                                    <input type="text" id="vinNo" name="vinNo" value="" data-json-obj="true">
                                    <span class="search"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="carRegNoOut"  class="f_text" disabled="disabled"></div>
                                <input type="hidden" id="carRegNo"  name="carRegNo" class="f_text" data-json-obj="true" >

                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text"  id="carlineNm" class="f_text" placeholder="" disabled="disabled"></div>
                                <input type="hidden" id="carlineCd"  name="carlineCd" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyDstinTp' /><!-- 회사차구분 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" class="form_comboBox" id="cmpCarDstinCdOut" disabled="disabled" ></div>
                                <input type="hidden" id="cmpCarDstinCd" name="cmpCarDstinCd" data-json-obj="true" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /><!-- 모델 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="modelNm"  class="f_text" placeholder="" disabled="disabled"></div>
                                <input type="hidden" id="modelCd" name="modelCd" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="ocnNm" class="f_text" placeholder="" disabled="disabled"></div>
                                <input type="hidden" id="ocnCd" name="ocnCd" data-json-obj="true" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.user' /><!-- 사용자 --></th>
                            <td>
                                <div class="f_item01" id="searchUsrId">
                                    <input type="text" id="usrNm" name="usrNm" value="" readOnly>
                                    <span class="search"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                </div>
                                <input type="hidden" id="usrId" name="usrId" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.useStartDt' /><!-- 사용시작일시 --></th>
                            <td>
                                 <div class="f_item01 f_disabled">
                                    <input type="text" id="useStartDt" name="useStartDt" value="" data-json-obj="true" disabled="disabled"/>
                                    <span class="date" onclick="calpickerLoc('useStartDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="f_item01 f_disabled">
                                    <input type="text" id="useStartTime" name="useStartTime" value="" class="" disabled="disabled">
                                    <span class="time" onclick="timepicker2Loc('useStartTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code='global.lbl.useEndDt' /><!-- 사용종료일시 --></th>
                            <td>
                                 <div class="f_item01 f_disabled">
                                    <input type="text" id="useEndDt" name="useEndDt" value="" data-json-obj="true" disabled="disabled"/>
                                    <span class="date" onclick="calpickerLoc('useEndDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="f_item01 f_disabled">
                                    <input type="text" id="useEndTime" name="useEndTime" value="" class="" disabled="disabled">
                                    <span class="time" onclick="timepicker2Loc('useEndTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.startKmVal' /><!-- 시작km --></th>
                            <td>
                               <div class="f_text"><input type="number"  id="useStartKmVal" name="useStartKmVal" value="0" onblur="fnOnblur(this.id);" class="f_text" data-json-obj="true"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.endKmVal' /><!-- 종료km --></th>
                            <td>
                                <div class="f_text"><input type="number"  id="useEndKmVal" name="useEndKmVal" value="0" onblur="fnOnblur(this.id);" class="f_text" data-json-obj="true"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code = 'global.lbl.remark'/><!-- 비고 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="remark" name="remark" value="" data-json-obj="true"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code = 'global.lbl.regDt'/><!-- 등록일 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="regDt" name="regDt" value="" readOnly /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code = 'global.lbl.regUsrId'/><!-- 등록자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="regUsrId" name="regUsrId" value="" readOnly /></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea btncount3">
                <div><span class="btnd1t2" id="btnReset"><spring:message code='global.btn.init' /></span></div><!-- 초기화 -->
                <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /></span></div><!-- 저장 -->
                <div><span class="btnd1" id="btnDelete"><spring:message code='global.lbl.del' /></span></div><!-- 삭제 -->
            </div>
        </section>
    </div>
    </form>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>
</section>



<!-- script -->
<script>

//화면 로딩,조회후  I , 수정시 U
var varSaveMode = 'I';
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDate,
    gCrud;

toDate = new Date();

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sVinNo").val("");
            break;
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sUseStartDt").val("");
            $("#sUseEndDt").val("");
            $("#sUseStartTime").val("");
            $("#sUseEndTime").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});

function setSearchBox(){
    var sVinNo = $("#sVinNo").val();
    var sCarRegNo = $("#sCarRegNo").val();
    var sUseStartDt = $("#sUseStartDt").val();
    var sUseEndDt = $("#sUseEndDt").val();

    if(sVinNo == "" && sCarRegNo == "" && sUseStartDt == "" && sUseEndDt == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sVinNo == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCarRegNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sUseStartDt == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
    setMainListHeight();
}

var oneDay = "${oneDay}"+" 00:00:00";   // 해당월 1일
var lastDay = "${lastDay}"+" 00:00:00"; // 해당월 마지막일자
var toDay = "${toDay}"+" 00:00:00";     // 오늘 일자

//회사차구분 Array
var cmpCarDstinCd = [];
<c:forEach var="obj" items="${cmpCarDstinCdList}">
    cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
  //개별정보 - 회사차구분
    $("#cmpCarDstinCdOut").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd,
        index:-1,
        optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    // 조회조건 - 시작일, 종료일
    $("#sUseStartDt").on('change', {from:$("#sUseStartDt"), to:$("#sUseEndDt")}, fnChkSearchDate);
    $("#sUseEndDt").on('change',   {from:$("#sUseStartDt"), to:$("#sUseEndDt")}, fnChkSearchDate);

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.comVehicleDrvMgmt' />"); //회사차운행관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");


    var sUseStartDt = $("#sUseStartDt");
    var sUseEndDt = $("#sUseEndDt");
    var sUseStartTime = $("#sUseStartTime");
    var sUseEndTime = $("#sUseEndTime");

    var timeSet =  sUseStartDt.val()+" "+changeTimeToZero(sUseStartTime.val())+" ~<br/> "+sUseEndDt.val()+" "+changeTimeToZero(sUseEndTime.val());
    $("#search3Area span[name='searchStr']").html(timeSet);
    setSearchBox();
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/cmp/cmpCarRunMng/selectCmpCarRunMngList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sVinNo = $("#sVinNo");
            var sCarRegNo = $("#sCarRegNo");
            var sUseStartDt = $("#sUseStartDt");
            var sUseEndDt = $("#sUseEndDt");
            var sUseStartTime = $("#sUseStartTime");
            var sUseEndTime = $("#sUseEndTime");

            if(sVinNo.val() != "") $("#search1Area span[name='searchStr']").text(sVinNo.val());
            if(sCarRegNo.val() != "") $("#search2Area span[name='searchStr']").text(sCarRegNo.val());
            if(sUseStartDt.val() != "") {
                var timeSet =  sUseStartDt.val()+" "+changeTimeToZero(sUseStartTime.val())+" ~ <br/>"+sUseEndDt.val()+" "+changeTimeToZero(sUseEndTime.val());
                $("#search3Area span[name='searchStr']").html(timeSet);
            }

            setSearchBox();
            contentList();
        }
    });

    //추가 버튼
    $("#btnAdd").bind("click", contentOpenNew);

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

    $(".f_text>input, .f_item01>input, .f_item02>input, .f_select select").each(function(index,arrInput){
        if(arrInput.parentNode.nodeName =="DIV"){
            var orgClassName = arrInput.parentNode.className;
            if(arrInput.disabled ==false){
                arrInput.parentNode.className = orgClassName.replace(/f_disabled/gi,"");
            }else{
                arrInput.parentNode.className = orgClassName + " f_disabled";
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
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침

    // 신규,수정여부
    varSaveMode = 'I';
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#vinNo").val(dataItem.vinNo);
    $("#carRegNoOut").val(dataItem.carRegNoOut);
    $("#carRegNo").val(dataItem.carRegNo);
    $("#carlineCd").val(dataItem.carlineCd);
    $("#carlineNm").val(dataItem.carlineNm);
    $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value(dataItem.cmpCarDstinCdOut);
    $("#cmpCarDstinCd").val(dataItem.cmpCarDstinCd);
    $("#modelCd").val(dataItem.modelCd);
    $("#modelNm").val(dataItem.modelNm);
    $("#ocnCd").val(dataItem.ocnCd);
    $("#ocnNm").val(dataItem.ocnNm);
    $("#usrId").val(dataItem.usrId);
    $("#usrNm").val(dataItem.usrNm);
    $("#useStartDt").val(chgDate2Str(dataItem.useStartDt));
    $("#useEndDt").val(chgDate2Str(dataItem.useEndDt));
    $("#useStartTime").val(chgDate2TimeStr(dataItem.useStartDt));
    $("#useEndTime").val(chgDate2TimeStr(dataItem.useEndDt));
    $("#useStartKmVal").val(dataItem.useStartKmVal);
    $("#useEndKmVal").val(dataItem.useEndKmVal);
    $("#remark").val(dataItem.remark);

    detailDisable("mod");
  }

function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    inputClear();
    detailDisable("ins");
  }

  function detailDisable(val){
      if(val == "ins") { //신규등록
          $("#vinNo").attr("disabled",false);
          inputClear(); //input값 clear
          // 신규,수정여부
          varSaveMode = 'I';
          $("#detailForm_content_title_id").text("<spring:message code='sal.lbl.comVehicleDrvListReg' />");// 회사차 운행내역 등록
      } else {  //수정
          //$("#vinNo").attr("disabled",true);
          $("#carRegNoOut").attr("disabled",true);
          //$("#carRegNo").attr("disabled",true);
          //$("#carlineCd").attr("disabled",true);
          $("#carlineNm").attr("disabled",true);
          $("#cmpCarDstinCdOut").attr("disabled",true);
          //$("#cmpCarDstinCd").attr("disabled",true);
          //$("#modelCd").attr("disabled",true);
          $("#modelNm").attr("disabled",true);
          //$("#ocnCd").attr("disabled",true);
          $("#ocnNm").attr("disabled",true);
          //$("#usrId").attr("disabled",true);
          //$("#usrNm").attr("disabled",true);

          $("#useStartDt").attr("disabled",true);
          $("#useEndDt").attr("disabled",true);
          $("#useStartTime").attr("disabled",true);
          $("#useEndTime").attr("disabled",true);
          $("#useStartKmVal").attr("disabled",true);
          $("#useEndKmVal").attr("disabled",true);
          // 신규,수정여부
          varSaveMode = 'U';
          checkInputFormDisabled();
          $("#detailForm_content_title_id").text("<spring:message code='sal.lbl.comVehicleDrvListDetail' />");//회사차 운행내역 상세정보
      }
  }

  //초기화
  $("#btnReset").kendoButton({
      click:function(e){
          inputClear(); //input값 clear
      }
  });

  function inputClear(){
      $("#useStartKmVal").prop("disabled","");
      $("#useEndKmVal").prop("disabled","");

      $("#useStartDt").prop("disabled","");
      $("#useEndDt").prop("disabled","");
      $("#useStartTime").prop("disabled","");
      $("#useEndTime").prop("disabled","");

      $("#vinNo").val("");
      $("#carRegNoOut").val("");
      $("#carRegNo").val("");
      $("#carlineCd").val("");
      $("#carlineNm").val("");
      $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value("");
      $("#cmpCarDstinCd").val("");
      $("#modelCd").val("");
      $("#modelNm").val("");
      $("#ocnCd").val("");
      $("#ocnNm").val("");
      $("#usrId").val("");
      $("#usrNm").val("");
      $("#useStartDt").val("${toDay}");
      $("#useEndDt").val("${toDay}");
      $("#useStartTime").val("01:00");
      $("#useEndTime").val("01:00");
      $("#useStartKmVal").val(0);
      $("#useEndKmVal").val(0);
      $("#remark").val("");
      $("#regDt").val("");
      $("#regUsrId").val("");
      checkInputFormDisabled();
  }



  //버튼 - 입고확정
    $("#btnSave").kendoButton({
        click:function(e){
          //vinNo 필수입력
            if ( dms.string.isEmpty($("#vinNo").val())){
                mob.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            //사용자 필수입력
            if ( dms.string.isEmpty($("#usrId").val())){
                mob.notification.warning("<spring:message code='global.lbl.user' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#usrId").focus();
                return false;
            }

            //시작일시 필수입력
            if ( dms.string.isEmpty($("#useStartDt").val())){
                mob.notification.warning("<spring:message code='global.lbl.useStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useStartDt").focus();
                return false;
            }
            if ( dms.string.isEmpty($("#useStartTime").val())){
                mob.notification.warning("<spring:message code='global.lbl.useStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useStartTime").focus();
                return false;
            }
            //종료일시 필수입력
            if ( dms.string.isEmpty($("#useEndDt").val())){
                mob.notification.warning("<spring:message code='global.lbl.useEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useEndDt").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#useEndTime").val())){
                mob.notification.warning("<spring:message code='global.lbl.useEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useEndTime").focus();
                return false;
            }

            //시작km 필수입력
            if ( $("#useStartKmVal").val() == 0){
                mob.notification.warning("<spring:message code='global.lbl.startKmVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useStartKmVal").focus();
                return false;
            }

            //종료km 필수입력
            if ( $("#useEndKmVal").val() == 0){
                mob.notification.warning("<spring:message code='global.lbl.endKmVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useEndKmVal").focus();
                return false;
            }
            var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
            param.useStartDt = new Date($("#useStartDt").val().replace("-","/")+" "+changeTimeToZero($("#useStartTime").val()));
            param.useEndDt = new Date($("#useEndDt").val().replace("-","/")+" "+changeTimeToZero($("#useEndTime").val()));

            /*
            var grid = $("#grid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                param.gb = "I";
            }else {
                param.gb = "U";
            }
            */

            param.gb = varSaveMode;
            console.log("saveData::"+JSON.stringify(param) );
            $.ajax({
                 url:"<c:url value='/mob/sal/cmp/cmpCarRunMng/saveCmpCarRunMng.do' />",
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 data:JSON.stringify(param),
                 error:function(jqXHR,status,error){
                     console.log(jqXHR);
                 },
                 success:function(data) {
                    if(data == '1'){
                        //$("#grid").data("kendoExtGrid").dataSource.read();
                        // 저장이 완료되었습니다.
                        mob.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                        contentList();
                    }else if(data == '0'){
                        //mob.notification.warning("선택된 차량은 해당 시간에 이미 운행되였습니다.차량/시간을 다시 확인해주세요.");
                        mob.notification.warning("<spring:message code='sal.err.chkOverlapTime'/>");
                    }else if(data == '2'){
                        //mob.notification.success("선택된 차량은 이미 입력한 시작km보다 더 운행되였습니다. 시작 km를 확인해주세요.");
                        mob.notification.warning("<spring:message code='sal.err.chkMaxKmVal'/>");
                    }
                }
            });
        }
    });

 // 삭제
    $("#btnDelete").kendoButton({
        click:function(e){

            if( varSaveMode ==  "I" || dms.string.isEmpty($("#vinNo").val()) ||
                 dms.string.isEmpty($("#useStartDt").val()) || dms.string.isEmpty($("#useStartTime").val())){
                //삭제할 데이터가 존재하지 않습니다.
                mob.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }
            /* var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();

            if(selectIdx ==  -1 ){
              //삭제할 데이터가 존재하지 않습니다.
                mob.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            } */

            // 삭제하시겠습니까?
            confirmOpen(confirmMsgDel,'doDelete',y,n);
        }
    });

  //조회조건:시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
      if(dms.string.isEmpty(e.data.from.val())){return;}
      if(dms.string.isEmpty(e.data.to.val())){return;}
/*
      var startDt = e.data.from.data("kendoDateTimePicker").value();
      var endDt = e.data.to.data("kendoDateTimePicker").value();
       */

      var startDt = new Date($("#sUseStartDt").val().replace("-","/")+" "+$("#sUseStartTime").val());
      var endDt = new Date($("#sUseEndDt").val().replace("-","/")+" "+$("#sUseEndTime").val());

      if(startDt > endDt){
          mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
          //$(this).data("kendoDateTimePicker").value(new Date(''));
          //$(this).focus();
          $("#sUseStartDt").val("");
          $("#sUseEndDt").val("");
          $("#sUseStartTime").val("01:00");
          $("#sUseEndTime").val("01:00");
      }
    }
  //현재 web 고객팝업열기 함수 사용
  //고객 팝업 열기 함수.
    $("#searchVinNo").click(function(){

        popupWindow = mob.window.popup({
            windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
            //,title:"<spring:message code='global.title.vehicleMaster' />aaaaa"
            ,content:{
                url:"<c:url value='/mob/sal/cmm/selectVehicleMasterPopup.do'/>"
                ,data:{
                    "type"  :null
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        if(data.cmpCarYn == 'Y'){
                            $("#vinNo").val(data.vinNo);
                            $("#carRegNoOut").val(data.carRegNo);
                            $("#carRegNo").val(data.carRegNo);
                            $("#carlineNm").val(data.carlineNm);
                            $("#carlineCd").val(data.carlineCd);
                            $("#modelNm").val(data.modelNm);
                            $("#modelCd").val(data.modelCd);
                            $("#ocnNm").val(data.ocnNm);
                            $("#ocnCd").val(data.ocnCd);
                            $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value(data.cmpCarDstinCd);
                            $("#cmpCarDstinCd").val(data.cmpCarDstinCd);
                        }else {
                            //mob.notification.warning("회사차여부가 Y인 차량만 선택가능 합니다.");
                            mob.notification.warning("<spring:message code='sal.err.checkCmpCarYn'/>");
                            return false;
                        }
                    }
                }
            }
        });
    });

    var userSearchPopupWin;
    //고객 팝업 열기 함수.
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
                          $("#usrId").val(data.usrId);
                          $("#usrNm").val(data.usrNm);
                      }
                  }
              }
          }

        });
    });

    function fnOnblur(id){
        var startVal = Number($("#useStartKmVal").val());
        var endVal = Number($("#useEndKmVal").val());


        if(startVal >= endVal && startVal != 0 && endVal != 0 ){

            if(id == 'useStartKmVal'){
                mob.notification.error("<spring:message code='global.lbl.startKmVal' var='useStartKmVal' /><spring:message code='global.lbl.endKmVal' var='useEndKmVal' /><spring:message code='sal.info.chkMin' arguments='${useStartKmVal},${useEndKmVal}'/>");
                $("#useStartKmVal").val(0);
                $("#useStartKmVal").focus();
            }else {
                mob.notification.error("<spring:message code='global.lbl.startKmVal' var='useStartKmVal' /><spring:message code='global.lbl.endKmVal' var='useEndKmVal' /><spring:message code='sal.info.chkMax' arguments='${useEndKmVal},${useStartKmVal}'/>");
                $("#useEndKmVal").val(0);
                $("#useEndKmVal").focus();
            }
        }
    }
    function calpickerLoc(obj){
        if($("#"+obj).attr("disabled") =="disabled") {
            return false;
        }
        calpicker(obj);
    }
    function timepicker2Loc(obj){
        if($("#"+obj).attr("disabled") =="disabled") {
            return false;
        }
        timepicker2(obj);
    }

</script>

<script>

function doDelete(){
    var data = {};
    data["vinNo"] = $("#vinNo").val();                                              // VIN NO
    //data["useStartDt"] = $("#useStartDt").data("kendoDateTimePicker").value();      // 사용일시 - 시작일
    //data["useStartDt"] = $("#useStartDt").val()+" "+$("#useStartTime").val();      // 사용일시 - 시작일
    data["useStartDt"] = new Date($("#useStartDt").val().replace("-","/")+" "+$("#useStartTime").val()); // 사용일시 - 시작일
    $.ajax({
        url:"<c:url value='/mob/sal/cmp/cmpCarRunMng/deleteCmpCarRunMng.do' />",
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify(data),
        error:function(jqXHR,status,error){
            console.log(jqXHR);
        },
        success:function(data){
            mob.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.successMsg' arguments='${del},' />");
            //삭제가 완료되었습니다.
            contentList();
        }
    });
}


</script>

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
                <h2 id="content_list_title"><spring:message code="sal.lbl.agencyBsiLIst" /><!-- 대행업무 목록 --></h2>
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
                                <th scope="row"><span><spring:message code="global.lbl.proxyDt" /><!-- 대행일 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.vinNo" /><!-- VIN NO --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.proxyDstinTp" /><!-- 대행업무 구분 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="global.lbl.proxyNm" /><!-- 대행자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:40%"><spring:message code="global.lbl.proxyDstinTp" /><!-- 대행업무구분 --></span>
                    <span style="width:30%"><spring:message code="global.lbl.proxyNm" /><!-- 대행자 --></span>
                    <span style="width:30%"><spring:message code="global.lbl.proxyDt" /><!-- 대행일 --></span>
                    <span style="width:40%" class="clboth"><spring:message code="global.lbl.carRegNo" /><!--차량번호 --></span>
                    <span style="width:60%"><spring:message code='global.lbl.vinNo' /><!-- VIN NO --></span>
                    <span style="width:40%" class="clboth"><spring:message code="global.lbl.cstAmt" /><!--원가 --></span>
                    <span style="width:60%"><spring:message code='global.lbl.profitAmt' /><!-- 수익 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.lbl.agencyBsiSearch" /><!-- 대행업무 조회조건  --></h2>
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
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.proxyDt' /></span></th>    <!-- 대행일 -->
                             <td class="f_term">
                                <div class="f_item01">
                                    <input type="text" id="sStartDt" value="${oneDay}" readOnly />
                                    <span class="date" onclick="calpicker('sStartDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01">
                                    <input type="text" id="sEndDt" value="${lastDay}" readOnly />
                                    <span class="date" onclick="calpicker('sEndDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                            <td>
                                <div class="f_text">
                                <input type="text" id="sVinNo"  class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                            <td>
                                <div class="f_text">
                                <input type="text" id="sCarRegNo"  class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyDstinTp' /></th><!-- 대행업무구분 -->
                            <td>
                                <div class="f_text"><input type="text" id="sAapWrkDstinCd" class="form_comboBox" style="width:100%"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                            <td>
                                <div class="f_text">
                                <input type="text" id="sAapEmpNm"  class="form_input" style="width:100%">
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
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='sal.lbl.agencyBsiDetail' /><!-- 대행업무 상세정보    --></h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption><spring:message code='sal.lbl.agencyBsiDetail' /><!-- 대행업무 상세정보    --></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                         <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNo' /><!-- VIN --></th>
                            <td>
                                <div class="f_item01 f_disabled" id="searchVinNo">
                                    <input type="text" id="vinNo" value="" disabled="disabled">
                                    <span class="search"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                </div>
                                <input type="hidden" id="seq" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="carRegNo"  class="f_text" placeholder="" disabled="disabled">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text"  id="carlineNm" class="f_text" placeholder="" disabled="disabled">
                                <input type="hidden" id="carlineCd"  >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyDstinTp' /><!-- 대행업무구분 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="aapWrkDstinCd"  class="f_text" placeholder=""></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /><!-- 모델 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="modelNm"  class="f_text" placeholder="" disabled="disabled">
                                <input type="hidden" id="modelCd"  >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="ocnNm"  class="f_text" placeholder="" disabled="disabled">
                                <input type="hidden" id="ocnCd"  >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyNm' /><!-- 대행자 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="aapEmpNm"  class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyDt' /><!-- 대행일 --></th>
                            <td>
                                 <div class="f_item01">
                                    <input type="text" id="aapDt" value="" class="" readOnly />
                                    <span class="date" onclick="calpicker('aapDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cstAmt' /><!-- 원가 --></th>
                            <td>
                                <div class="f_text">
                                <input id="cstAmt" type="number" maxlength="19" value="0" onblur="fnOnblur(this.id);" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.profitAmt' /><!-- 수익 --></th>
                            <td>
                                <div class="f_text">
                                <input id="profitAmt" type="number" value="0" onblur="fnOnblur(this.id);" class="f_text" placeholder="" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.total' /><!-- 합계 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input id="aapAmt" type="number" class="f_text" value="0" onblur="fnOnblur(this.id);" disabled="disabled">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /></span></div>
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDate,
    aapWrkDstinCdList        = [],
    aapWrkDstinCdObj         = {},
    gCrud;

toDate = new Date();


<c:forEach var="obj" items="${aapWrkDstinCdList}" varStatus="status">
    aapWrkDstinCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    aapWrkDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sStartDt").val("");
            $("#sEndDt").val("");
            break;
        case "search2Area" :
            $("#sVinNo").val("");
            break;
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sCarRegNo").val("");
            break;
        case "search4Area" :
            $("#sAapWrkDstinCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sAapEmpNm").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sStartDt = $("#sStartDt").val();
    //var sEndDt = $("#sEndDt").val();
    var sVinNo = $("#sVinNo").val();
    var sCarRegNo = $("#sCarRegNo").val();
    var sAapWrkDstinCd = $("#sAapWrkDstinCd").data("kendoExtDropDownList").value();
    var sAapEmpNm = $("#sAapEmpNm").val();

    if(sStartDt == "" && sVinNo == "" && sCarRegNo == "" &&
            sAapWrkDstinCd == ""&& sAapEmpNm == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sStartDt == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sVinNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sCarRegNo == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sAapWrkDstinCd == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sAapEmpNm == "") $("#search5Area").hide();
        else $("#search5Area").show();
    }
    setMainListHeight();
}



$(document).ready(function() {
  //현재일자
    var toDay = "${toDay}";
    var lastDay = "${lastDay}";
    //조회조건 - 품목구분선택
    $("#sAapWrkDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:aapWrkDstinCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });
    //조회조건 - 품목구분선택
    $("#aapWrkDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:aapWrkDstinCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

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
    $("#header_title").html("<spring:message code='global.title.agencyBsiMgmt' />"); //대행업무관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    var sStartDt      = $("#sStartDt").val();
    var sEndDt      = $("#sEndDt").val();
    if(sStartDt != "") $("#search1Area span[name='searchStr']").html(sStartDt +" ~ <br/>"+ sEndDt);
    setSearchBox();
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/cnt/aapMng/selectAapMngList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sStartDt      = $("#sStartDt").val();
            var sEndDt      = $("#sEndDt").val();
            var sVinNo      = $("#sVinNo").val();
            var sCarRegNo      = $("#sCarRegNo").val();
            var sAapEmpNm      = $("#sAapEmpNm").val();
            var sAapWrkDstinCd      = $("#sAapWrkDstinCd").data("kendoExtDropDownList").value();
            //var sAapWrkDstinCd      = $("#sAapWrkDstinCd").data("kendoExtDropDownList").text();

            if(sStartDt != "") $("#search1Area span[name='searchStr']").html(sStartDt +" ~ <br/>"+ sEndDt);
            if(sVinNo != "") $("#search2Area span[name='searchStr']").text(sVinNo);
            if(sCarRegNo != "") $("#search3Area span[name='searchStr']").text(sCarRegNo);
            if(sAapWrkDstinCd != "") $("#search4Area span[name='searchStr']").text($("#sAapWrkDstinCd").data("kendoExtDropDownList").text());
            if(sAapEmpNm != "") $("#search5Area span[name='searchStr']").text(sAapEmpNm);

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
});

function fnOnblur(id){

    var aapAmt = Number($("#cstAmt").val()) + Number($("#profitAmt").val());

    $("#aapAmt").val(aapAmt);

}

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

    $("#aapDt").val(dataItem.aapDt);                             //대행일자
    //$("#aapWrkDstinCd").val(dataItem.aapWrkDstinCd);             //대행업무구분코드
    $("#aapWrkDstinCd").data("kendoExtDropDownList").value(dataItem.aapWrkDstinCd);
    $("#seq").val(dataItem.seq);                                 //일련번호
    $("#vinNo").val(dataItem.vinNo);                             //차대번호
    $("#carlineCd").val(dataItem.carlineCd);                     //차종코드
    $("#carlineNm").val(dataItem.carlineNm);                     //차종명
    $("#modelCd").val(dataItem.modelCd);                         //모델코드
    $("#modelNm").val(dataItem.modelNm);                         //모델명
    $("#ocnCd").val(dataItem.ocnCd);                             //OCN코드
    $("#ocnNm").val(dataItem.ocnNm);                             //OCN명
    $("#carRegNo").val(dataItem.carRegNo);                       //차량등록번호
    $("#aapEmpNm").val(dataItem.aapEmpNm);                       //대행자명
    $("#cstAmt").val(dataItem.cstAmt);                           //원가금액
    $("#profitAmt").val(dataItem.profitAmt);                     //수익금액
    $("#aapAmt").val(dataItem.aapAmt);                           //대행금액
    detailDisable("mod");
  }

function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#aapDt").val("");                             //대행일자
    $("#aapWrkDstinCd").data("kendoExtDropDownList").value("");             //대행업무구분코드
    $("#seq").val("");                                 //일련번호
    $("#vinNo").val("");                             //차대번호
    $("#carlineCd").val("");                     //차종코드
    $("#carlineNm").val("");                     //차종명
    $("#modelCd").val("");                         //모델코드
    $("#modelNm").val("");                         //모델명
    $("#ocnCd").val("");                             //OCN코드
    $("#ocnNm").val("");                             //OCN명
    $("#carRegNo").val("");                       //차량등록번호
    $("#aapEmpNm").val("");                       //대행자명
    $("#cstAmt").val("");                           //원가금액
    $("#profitAmt").val("");                     //수익금액
    $("#aapAmt").val("");                           //대행금액
    detailDisable("ins");
  }

  function detailDisable(val){
      if(val == "ins") { //신규등록
          $("#aapDt").attr("disabled",false);                             //대행일자
          $("#aapDt").val("${toDay}");
          $("#aapWrkDstinCd").attr("disabled",false);             //대행업무구분코드
          $("#seq").attr("disabled",false);                                 //일련번호
          $("#vinNo").attr("disabled",false);                             //차대번호
          $("#carlineCd").attr("disabled",false);                     //차종코드
          $("#carlineNm").attr("disabled",false);                     //차종명
          $("#modelCd").attr("disabled",false);                         //모델코드
          $("#modelNm").attr("disabled",false);                         //모델명
          $("#ocnCd").attr("disabled",false);                             //OCN코드
          $("#ocnNm").attr("disabled",false);                             //OCN명
          $("#carRegNo").attr("disabled",false);                       //차량등록번호
          $("#aapEmpNm").attr("disabled",false);                       //대행자명
          $("#cstAmt").attr("disabled",false);                           //원가금액
          $("#profitAmt").attr("disabled",false);                     //수익금액
          $("#aapAmt").attr("disabled",false);                           //대행금액
      } else {  //수정
          //$("#aapDt").attr("disabled",true);                             //대행일자
          //$("#aapWrkDstinCd").attr("disabled",true);             //대행업무구분코드
          $("#seq").attr("disabled",true);                                 //일련번호
          $("#vinNo").attr("disabled",true);                             //차대번호
          $("#carlineCd").attr("disabled",true);                     //차종코드
          $("#carlineNm").attr("disabled",true);                     //차종명
          $("#modelCd").attr("disabled",true);                         //모델코드
          $("#modelNm").attr("disabled",true);                         //모델명
          $("#ocnCd").attr("disabled",true);                             //OCN코드
          $("#ocnNm").attr("disabled",true);                             //OCN명
          $("#carRegNo").attr("disabled",true);                       //차량등록번호
          //$("#aapEmpNm").attr("disabled",true);                       //대행자명
          //$("#cstAmt").attr("disabled",true);                           //원가금액
          //$("#profitAmt").attr("disabled",true);                     //수익금액
          $("#aapAmt").attr("disabled",true);                           //대행금액
      }

      /*
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
      */
      checkInputFormDisabled();
      /* $(".f_text>input[disabled], .f_item01>input[disabled], .f_item02>input[disabled], .f_select select[disabled]").parent().addClass("f_disabled");
      $(".f_text>input[readonly], .f_item01>input[readonly], .f_item02>input[readonly], .f_select select[readonly]").parent().addClass("f_disabled"); */

  }
  //버튼 - 입고확정
    $("#btnSave").kendoButton({
        click:function(e){
            var data ={
                //"aapDt"         :$("#aapDt").data("kendoExtMaskedDatePicker").value(),                             //대행일자
                //"aapDt"         :$("#aapDt").val(),                             //대행일자
                "aapDt"         :new Date($("#aapDt").val()),                             //대행일자
                "aapWrkDstinCd" :$("#aapWrkDstinCd").data("kendoExtDropDownList").value(),             //대행업무구분코드
                "seq"           :$("#seq").val(),                                 //일련번호
                "vinNo"         :$("#vinNo").val(),                             //차대번호
                "carlineCd"     :$("#carlineCd").val(),                     //차종코드
                "carlineNm"     :$("#carlineNm").val(),                     //차종명
                "modelCd"       :$("#modelCd").val(),                         //모델코드
                "modelNm"       :$("#modelNm").val(),                         //모델명
                "ocnCd"         :$("#ocnCd").val(),                             //OCN코드
                "ocnNm"         :$("#ocnNm").val(),                             //OCN명
                "carRegNo"      :$("#carRegNo").val(),                       //차량등록번호
                "aapEmpNm"      :$("#aapEmpNm").val(),                       //대행자명
                "cstAmt"        :$("#cstAmt").val(),                           //원가금액
                "profitAmt"     :$("#profitAmt").val(),                     //수익금액
                "aapAmt"        :$("#aapAmt").val()                           //대행금액
                };
            console.log("saveData::"+kendo.stringify(data) );
            $.ajax({
                 url:"<c:url value='/mob/sal/cnt/aapMng/saveAapMng.do' />"
                ,data:kendo.stringify(data)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {
                    /* if (result === 1) {
                        mob.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                        //$("#detailList").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
                        contentList();
                    } else {
                        console.log('errorResult:',result);
                        if(result === 0){
                            mob.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                        }
                    } */
                    mob.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                    contentList();
                }
                ,error:function(jqXHR,status,error) {
                    mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            });
        }
    });

  // 임시테스트
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
                        //alert(kendo.stringify(data[0].carRegNo));
                        $("#vinNo").val(data.vinNo);
                        $("#carRegNo").val(data.carRegNo);
                        $("#carlineNm").val(data.carlineNm);
                        $("#carlineCd").val(data.carlineCd);
                        $("#modelNm").val(data.modelNm);
                        $("#modelCd").val(data.modelCd);
                        $("#ocnNm").val(data.ocnNm);
                        $("#ocnCd").val(data.ocnCd);
                    }
                }
            }
        });
    });
</script>
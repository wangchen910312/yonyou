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
        <section id="content_list" >
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="par.title.purcOrdList" /><!-- 구매오더 현황 --></h2>
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
                                <th scope="row"><span><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.btn.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="par.lbl.purcRegDt" /><!-- 오더등록일 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.btn.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.btn.del" /><!-- 삭제 --></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="par.lbl.purcRegDt" /><!-- 오더등록일 --></span>
                            <span style="width:50%"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></span>
                        </div>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
        </section>


        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.title.purcOrdListSearch" /><!-- 오더현황 조회  --></h2>
            </div>
           <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col>
                    </colgroup>
                     <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                            <td class="required_area">
                                <div class="f_text"><input id="sPurcOrdStatCd" class="form_comboBox" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sPurcOrdTp" style="width:100%" class="form_comboBox" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcRegDt" /><!-- 오더등록일 --></th>
                            <td class="f_term">
                                <div class="f_item01">
                                    <input type="text" id="sPurcRegDtFr" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sPurcRegDtFr');">날짜선택</span>
                                </div><span class="termtext"> ∼</span>
                                <div class="f_item01">
                                    <input type="text" id="sPurcRegDtTo" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sPurcRegDtTo');">날짜선택</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sPurcOrdNo" style="width:100%"/></div>
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
                <h2><spring:message code="par.title.purcOrdInfo" /><!-- 구매오더 등록정보 --><span id="detailPageNo"></span></h2>
                <div class="title_btn">
                    <span id="prevDetailPage" class="prev_disable" class="prev"><span>이전</span></span>
                    <span id="nextDetailPage" class="next_disable" class="next"><span>다음</span></span>
                </div>
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
                            <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcOrdNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcOrdLineNo" /><!-- 구매오더Line --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcOrdLineNo" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcItemStatCd" /><!-- 품목진행상태 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcItemStatCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="itemNm" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcUnitCd" /><!-- 구매단위 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcUnitCd" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcQty" /><!-- 구매수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.bmpChkQty" /><!-- BMP확인수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="bmpChkQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cancQty" /><!-- 취소수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="cancQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.grQty" /><!-- 입고수량 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="grQty" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcPrc" /><!-- 구매단가 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcPrc" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.purcAmt" /><!-- 구매금액 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="purcAmt" type="text" class="f_text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';


var detailData = {
        purcOrdNo:"",
        purcOrdLineNo:"",
        purcItemStatCd:"",
        itemCd:"",
        itemNm:"",
        purcUnitCd:"",
        purcQty:"",
        bmpChkQty:"",
        cancQty:"",
        grQty:"",
        purcPrc:"",
        purcAmt:""
};

var detailList      = [];



var toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    spyrCdList          = [],
    spyrCdObj           = {},
    purcOrdTpList       = [],
    purcOrdTpObj        = [],
    trsfTpList          = [],
    purcOrdStatList     = [],
    purcOrdStatObj      = {},
    purcUnitList        = [],
    purcUnitObj         = {},
    prcTpList           = [],
    prcTpObj            = {},
    grStrgeTpList       = [],
    grStrgeTpObj        = {},
    purcItemTpList      = [],
    purcItemTpObj       = {},
    popItemObj          = {},
    checkdIds           = {},
    toDate,
    gCrud;

toDate = new Date();

<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


<c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    purcOrdStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sPurcOrdStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sPurcOrdTp").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sPurcRegDtFr").val("");
            $("#sPurcRegDtTo").val("");
            break;
        case "search4Area" :
            $("#sPurcOrdNo").val("");
            break
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});



function setSearchBox(){
    var sPurcOrdStatCd = $("#sPurcOrdStatCd").data("kendoExtDropDownList").value();
    var sPurcOrdTp = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
    var sPurcRegDtFr = $("#sPurcRegDtFr").val();
    var sPurcRegDtTo = $("#sPurcRegDtTo").val();
    var sPurcOrdNo = $("#sPurcOrdNo").val();
    if(sPurcOrdStatCd == "" && sPurcOrdTp == "" && sPurcRegDtFr == "" && sPurcRegDtTo == "" && sPurcOrdNo == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if($.trim(sPurcOrdStatCd) == "") $("#search1Area").hide();
        else $("#search1Area").show();

        if(sPurcOrdTp == "") $("#search2Area").hide();
        else $("#search2Area").show();

        if(sPurcRegDtFr == "" && sPurcRegDtTo == "") $("#search3Area").hide();
        else $("#search3Area").show();

        if(sPurcOrdNo == "") $("#search4Area").hide();
        else $("#search4Area").show();
    }
    setMainListHeight();
}



$(document).ready(function() {


    // 검색 - 구매오더상태선택
    $("#sPurcOrdStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdStatList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });


    // 검색 - 오더유형선택
    $("#sPurcOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdTpList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    /*
    $(".form_datepicker").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    */


    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });


    /* 처리필요
    $("#itemDstinCd").on("change", function (){
        console.log('itemDstinCd Change:',$(this).data("kendoExtDropDownList").value());
        $("#itemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[$(this).data("kendoExtDropDownList").value()]);
    });
    */


    function initPage(){

        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        //$("#sItemDstinCd").data("kendoExtDropDownList").value('02');
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
            $(this).data("kendoExtMaskedDatePicker").value('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").value(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='par.title.purcOrdListSearch' />");<!-- 오더현황 조회 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");


    $("#sPurcRegDtFr").val(chgServerDate2Str(sevenDtBf));
    $("#sPurcRegDtTo").val(chgServerDate2Str(toDt));
    var sRegDtFr = $("#sPurcRegDtFr");
    var sRegDtTo = $("#sPurcRegDtTo");
    if(sRegDtFr.val() != "" || sRegDtTo.val() != "") $("#search3Area span[name='searchStr']").html(sRegDtFr.val() + " ~<br/>" + sRegDtTo.val());
    setSearchBox();

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/pcm/purcOrd/selectPurcOrdList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            var sPurcOrdStatCd = $("#sPurcOrdStatCd").data("kendoExtDropDownList");
            var sPurcOrdTp = $("#sPurcOrdTp").data("kendoExtDropDownList");
            var sPurcRegDtFr = $("#sPurcRegDtFr");
            var sPurcRegDtTo = $("#sPurcRegDtTo");
            var sPurcOrdNo = $("#sPurcOrdNo");

            if(sPurcOrdStatCd.value() != "") $("#search1Area span[name='searchStr']").text(sPurcOrdStatCd.text());
            if(sPurcOrdTp.value() != "") $("#search2Area span[name='searchStr']").text(sPurcOrdTp.text());
            if(sPurcRegDtFr.val() != "" || sPurcRegDtTo.val() != "") $("#search3Area span[name='searchStr']").html(sPurcRegDtFr.val() + " ~<br/>" + sPurcRegDtTo.val());
            if(sPurcOrdNo.val() != "") $("#search4Area span[name='searchStr']").text(sPurcOrdNo.val());

            setSearchBox();
            contentList();
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
</script>

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
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  $("#sPurcRegDtFr").val(chgServerDate2Str(sevenDtBf));
  $("#sPurcRegDtTo").val(chgServerDate2Str(toDt));

}


var detailPageNum;

//상세페이지 보기
function contentDetail(key) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

  if( key != null && key != 'undefined'){
      $.ajax({
          url:"<c:url value='/mob/par/pcm/purcOrd/selectPurcOrdDetail.do' />",
          data:JSON.stringify({ sPurcOrdNo:key}),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
              mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
          }

      }).done(function(result) {
          detailList = [];
          detailPageNum = 1;

          if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
              return false;
          }
          if(result.data.length > 0){
              $("#detailPageNo").text("("+detailPageNum+" / "+result.data.length+")");
              for(var i=0; i<result.data.length; i++){
                  detailData = result.data[i];
                  detailList.push(detailData);
              }
              partsJs.validate.groupObjAllDataSet(result.data[0]);
          }
          gCrud = 'U';
          setEnableMoveBtn();
      });
   }
}


$("#prevDetailPage").click(function(){
    if(detailPageNum > 1){
        partsJs.validate.groupObjAllDataSet(detailList[detailPageNum-- -1]);
    }
    setEnableMoveBtn();
});

$("#nextDetailPage").click(function(){
    if(detailPageNum < detailList.length){
        partsJs.validate.groupObjAllDataSet(detailList[detailPageNum++ -1]);
    }
    setEnableMoveBtn();
});

function setEnableMoveBtn(){
    if(detailPageNum == detailList.length){
        $("#prevDetailPage").attr("class", "prev_disable");
        $("#nextDetailPage").attr("class", "next_disable");
    }else{
        if(detailPageNum < detailList.length){
            $("#nextDetailPage").attr("class", "next");
        }else{
            $("#nextDetailPage").attr("class", "next_disable");
        }
    }
    if(detailPageNum > 1){
        $("#prevDetailPage").attr("class", "prev");
    }else{
        $("#prevDetailPage").attr("class", "prev_disable");
    }
    $("#detailPageNo").text("("+detailPageNum+" / "+detailList.length+")");
}


</script>
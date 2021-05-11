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
                <h2 id="content_list_title"><spring:message code="ser.menu.reserStatus" /><!-- 예약접수현황 --></h2>
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
                                <th scope="row"><span><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.carNo" /><!--차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="ser.lbl.bayNm" /><!-- BAY 명 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="ser.lbl.realResvDt" /><!-- 실예약 일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- BAY list -->
            <div class="bayltarea">
                <div class="baymark">
                    <ul>
                        <li class="item01"><span class="icon"></span><spring:message code='ser.lbl.keepRev' /><strong>4</strong><spring:message code='ser.lbl.cnt' /></li>
                        <li class="item02"><span class="icon"></span><spring:message code='ser.lbl.missRev' /><strong>13</strong><spring:message code='ser.lbl.cnt' /></li>
                        <li class="item03"><span class="icon"></span><spring:message code='ser.lbl.revLate' /><strong>0</strong><spring:message code='ser.lbl.cnt' /></li>
                        <li class="item04"><span class="icon"></span><spring:message code='ser.lbl.revCancel' /><strong>2</strong><spring:message code='ser.lbl.cnt' /></li>
                    </ul>
                </div>
                <div class="baycontrol">
                    <!--
                    <div class="today"><span class>오늘</span></div>
                    -->
                    <div class="prev" style="display:;">이전</div>
                    <div class="next" style="display:;">다음</div>

                    <div class="bayltitemarea">
                        <ul class="bayltitem" style="width:">

                        <!--
                            <li class="on"><span>BAY1</span></li>
                            <li><span>BAY2-두번째</span></li>
                            <li><span>BAY3</span></li>
                            <li><span>BAY4</span></li>
                            <li><span>BAY5</span></li>
                            <li><span>BAY6</span></li>
                            <li><span>BAY7</span></li>
                        -->
                        </ul>
                    </div>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:70%"><spring:message code="ser.lbl.resvDocNo" /><!-- 예약번호 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.resvStat" /><!-- 예약상태--></span>

                            <span class="clboth" style="width:35%">BAY NO</span>
                            <span style="width:35%"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="par.lbl.resvDt" /><!-- 예약일시 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.resv" /><spring:message code="ser.lbl.dt" /><!-- 예약시간 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.statNm" /><!-- 상태 --></span>


                            <%--<span style="width:30%"><spring:message code="ser.lbl.car" /><!-- 차량 --></span>--%>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.reserStatus" /><!-- 예약접수현황 --> <spring:message code="global.title.searchCondition" /><!-- 조회조건  --></h2>
        </div>
       <div class="formarea">

            <input id="sResvDocNo" type="hidden"/><!-- 임시 -->


            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <div class="f_text"><input id="sDriverNm" type="text" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text"><input id="sCarRegNo" type="text"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.bayNm" /><!-- BAY 명 --></th>
                            <td>
                                <div class="f_text"><input id="sBayNo" type="text" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></th>
                            <td>
                                <div class="f_text"><input id="sResvStatCd" type="text" class="form_comboBox"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.realResvDt" /><!-- 실예약 일자 --></th>
                            <td class="f_term">
                                <div class="f_item01">
                                    <input type="text" id="sResvFromDt" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sResvFromDt');">날짜선택</span>
                                </div><span class="termtext"> ∼</span>
                                <div class="f_item01">
                                    <input type="text" id="sResvToDt" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sResvToDt');">날짜선택</span>
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


    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";


var resvStatCdList             = [],
resvStatCdObj              = {};


<c:forEach var="obj" items="${resvStatCdList}" varStatus="status">
resvStatCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
resvStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


//진행상태 map
//var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});


//공통코드:예약구분
var resvTpCdList = [];
var resvTpCdObj = {};
<c:forEach var="obj" items="${resvTpCdList}">
resvTpCdList.push({ "cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}" });
resvTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


    //공통코드:예약접수상태
var resvReptStatCdList = [];
<c:forEach var="obj" items="${resvReptStatCdList}">
resvReptStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var resvReptStatCdArr = dms.data.arrayToMap(resvReptStatCdList, function(obj){return obj.cmmCd});


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sDriverNm").val("");
            break;
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sBayNo").val("");
            break;
        case "search4Area" :
            $("#sResvStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sResvFromDt").val("");
            $("#sResvToDt").val("");
            break
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sDriverNm = $("#sDriverNm").val();
    var sCarRegNo = $("#sCarRegNo").val();
    var sBayNo = $("#sBayNo").val();
    var sResvStatCd = $("#sResvStatCd").data("kendoExtDropDownList").value();
    var sResvFromDt = $("#sResvFromDt").val();
    var sResvToDt = $("#sResvToDt").val();

    if( sDriverNm == "" && sCarRegNo == "" && sBayNo == "" && sResvStatCd == "" && sResvFromDt == "" && sResvToDt == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sDriverNm == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCarRegNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sBayNo == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sResvStatCd == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sResvFromDt == "" && sResvToDt == "") $("#search5Area").hide();
        else $("#search5Area").show();
    }

    setMainListHeight();
}



$(document).ready(function() {





  //조회조건 - 예약상태
    $("#sResvStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:resvStatCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });



    /*
    $("#sRoStatCd").kendoExtDropDownList({
        dataSource:roStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });
    */




    function initPage(){

        /*
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        */
        partsJs.validate.groupObjAllDataInit();
        $(".skeyarea").hide();
    }
    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.reserStatus' />");<!-- 예약접수 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    setBayNoBtnList();
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/rev/reservationReceipt/selectReservationReceiptList.do' />");


    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            var sDriverNm = $("#sDriverNm");
            var sCarRegNo = $("#sCarRegNo");
            var sBayNo = $("#sBayNo");
            var sResvStatCd = $("#sResvStatCd").data("kendoExtDropDownList");
            var sResvFromDt = $("#sResvFromDt");
            var sResvToDt = $("#sResvToDt");

            if(sDriverNm.val() != "") $("#search1Area span[name='searchStr']").text(sDriverNm.val());
            if(sCarRegNo.val() != "") $("#search2Area span[name='searchStr']").text(sCarRegNo.val());
            if(sBayNo.val() != "") $("#search3Area span[name='searchStr']").text(sBayNo.val());
            if(sResvStatCd.value() != "") $("#search4Area span[name='searchStr']").text(sResvStatCd.text());
            if(sResvFromDt.val() != "" || sResvToDt.val() != "") $("#search5Area span[name='searchStr']").html(sResvFromDt.val() + " ~<br/>" + sResvToDt.val());

            setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
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
  //$("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();





}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  $("#sResvFromDt").val(chgServerDate2Str(sevenDtBf));
  $("#sResvToDt").val(chgServerDate2Str(toDt));

}


/*
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem!=null){
        $("#roDt").val(dataItem.roDt);
        $("#roDocNo").val(dataItem.roDocNo);
        $("#carRegNo").val(dataItem.carRegNo);
        $("#driverNm").val(dataItem.driverNm);
        $("#vinNo").val(dataItem.vinNo);
        $("#roStatCd").val(dataItem.roStatNm);
    }

    if( dataItem.roDocNo != null && dataItem.roDocNo != 'undefined'){

        // 정비내역 리스트 조회
        $("#subList").attr("src", "<c:url value='/mob/ser/ro/workAssign/selectWorkAssignSubList.do' />");

    }
  }
*/


function setBayNoBtnList(){
    var params = {};
    params["sort"] = null;
    params["sDriverNm"] = parent.$("#sDriverNm").val();
    params["sCarRegNo"] = parent.$("#sCarRegNo").val();
    params["sResvStatCd"] = parent.$("#sResvStatCd").data("kendoExtDropDownList").value();
    params["sBayNo"] = parent.$("#sBayNo").val();

    if(parent.$("#sResvFromDt").val() == "" || parent.$("#search1Area span[name='searchStr']").text() == ""){
        params["sResvFromDt"] = null;
    }else{
        params["sResvFromDt"] = chgDate(parent.$("#sResvFromDt").val());
    }
    if(parent.$("#sResvToDt").val() == "" || parent.$("#search1Area span[name='searchStr']").text() == ""){
        params["sResvToDt"] = null;
    }else{
        params["sResvToDt"] = chgDate(parent.$("#sResvToDt").val());
    }

    $.ajax({
            url:"<c:url value='/mob/ser/rev/reservationReceipt/selectReservationReceiptsBayCd.do' />"
           //,data:kendo.stringify(header)
           ,data: JSON.stringify(params)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {

               console.log("result="+result);
               console.log("result.data.length="+result.data.length);

               for(var i=0; i<result.data.length; i++){
                   console.log("result.data[i].bayNo="+result.data[i].bayNo);
                   if(i == 0){
                       $(".bayltitem").append("<li class='on'><span>"+result.data[i].bayNo+"</span></li>");
                   }else{
                       $(".bayltitem").append("<li><span>"+result.data[i].bayNo+"</span></li>");
                   }
               }
               if(result.data[0].bayNo != null){
                   $("#sBayNo").val(result.data[0].bayNo);
               }
               $(".bayltitem li span").each(function(cnt){
                   $(this).attr("id",result.data[cnt].bayNo);
                   $(this).attr("onclick","searchData('"+result.data[cnt].bayNo+"')");
               });






var blist = $('.bayltitem');
    var barea = $('.bayltitemarea');

    blist.each(function(){
        var t = $(this), tWidth = 0;
        $('li',t).each(function(){ tWidth += $(this).outerWidth(); })
        t.css('width', tWidth+2);
    });

    var tWidth = blist.outerWidth();
    var areaWidth = barea.outerWidth();
    var maxScroll = areaWidth - tWidth;

    if(tWidth > areaWidth){ $('.next').css('display','block');}

    barea.scroll(function () {
        var scrollLeft = barea.scrollLeft();
        var posLeft = blist.position().left;

        if(posLeft<0){
            $('.baycontrol .prev').css('display','block');
        }else{
            $('.baycontrol .prev').css('display','none');
        }
        if(posLeft <= maxScroll){
            $('.baycontrol .next').css('display','none');
        }else{
            $('.baycontrol .next').css('display','block');
        }
    });

    /* on left button click scroll to the previous sibling of the current visible slide */
    $('.baycontrol .next').click(function () { barea.animate({'scrollLeft':'+=60px'}); });
    $('.baycontrol .prev').click(function () { barea.animate({'scrollLeft':'-=60px'}); });




           }
           ,error:function(jqXHR,status,error) {
               alert(error);
               //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
         }
      });
}


function searchData(bayNo){
    $(".bayltitem li").removeClass("on");
    $("#"+bayNo).parent().attr("class","on");

    if(bayNo != "" && bayNo != null) $("#search3Area span[name='searchStr']").text(bayNo);

    document.getElementById("mainList").contentWindow.searchBayNo(bayNo);
}


</script>
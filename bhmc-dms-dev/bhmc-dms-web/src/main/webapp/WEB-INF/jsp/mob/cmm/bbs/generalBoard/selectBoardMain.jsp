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
        <section id="content_list" class="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code='cmm.menu.bbs.notice' /><spring:message code='global.title.list' /></h2>
            </div>

            <div class="listarea">
                <div class="listhead dlistitem">
                    <span style="width:25%"><spring:message code="global.lbl.issueNo" /></span>
                    <span style="width:25%"><spring:message code="global.lbl.gubun" /></span>
                    <span style="width:50%"><spring:message code="global.lbl.title" /></span>
                    <span style="clear:both; width:50%"><spring:message code="global.lbl.wrtrNm" /></span>
                    <span style="width:50%"><spring:message code="global.lbl.wrtrDt" /></span>
                    </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" ></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="cmm.menu.bbs.notice" /> <spring:message code="global.btn.searchCondition" /><!-- 게시판 조회조건 --></h2>
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
                            <th scope="row"><spring:message code="global.lbl.gubun" /><!-- 구분 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sNttCatCd" type="form_comboBox"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.title' /></th><!-- 제목 -->
                            <td>
                                <div class="f_text"><input type="text" id="sNttTitleNm" class="form_input" style="width:100%"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cont' /></th><!-- 내용 -->
                            <td>
                                <div class="f_text"><input type="text" id="sNttCont" class="form_input" style="width:100%"></div>
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
                    <h2><spring:message code='cmm.menu.bbs.notice' /> <spring:message code='global.title.detail' /></h2>
                </div>
                <div class="formarea">


                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.gubun" /><!-- 구분 --></th>
                                <td>
                                    <div class="f_text">
                                    <input type="text" id="nttCatCd" readonly="readonly"/>
                                    <div class="f_text">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.title' /><!-- 제목 --></th>
                                <td>
                                    <div class="f_text">
                                    <input type="text" id="nttTitleNm" name="nttTitleNm"  readonly="readonly"/>
                                    <div class="f_text">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.cont' /><!-- 내용 --></th>
                                <td>
                                    <textarea rows="10" id=nttCont name="nttCont" cols="" class="f_textarea" readonly="readonly"></textarea>
                                </td>
                            </tr>
                            <input type="hidden" id="fileDocNo" name="fileDocNo"/>
                        </tbody>
                    </table>
                </div>
                <div class="listarea01">
                    <div class="dlistitem listhead">
                        <span style="width:100%" class="clboth"><spring:message code='global.lbl.attachedFile' /><!-- 첨부파일 --></span>
                    </div>
                    <iframe id="subList" border="0" frameborder="0" width="100%" height=""></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_dt"><span></span></div>
                </div>
            </section>
        </div>

        <div class="con_btnarea">
                <div><span class="btnd1" id="detailCloseBtn" style="display:none;"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
         </div>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

//게시물 구분
var arrCatCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${arrNttCat}">
arrCatCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var arrCatCdMap = dms.data.arrayToMap(arrCatCd, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

 // 타이틀
    $("#header_title").html("<spring:message code='cmm.menu.bbs.notice' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    //$("#header_title").html("알람리스트"); //품목마스터 조회
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/cmm/bbs/generalBoard/selectBoardList.do?isFromBoardMain=Y&hasRoleId=' />");

    ///버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
        else if ($("#content_subdetail").css("display") == "block") { contentDetail(); }
        $("#detailCloseBtn").hide();

    });

    $("#detailCloseBtn").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
        else if ($("#content_subdetail").css("display") == "block") { contentDetail(); }
        $("#detailCloseBtn").hide();
    });

    //버튼 - TOP
    $("#docu_top").kendoButton({
        click:function(e) {
            $("body,html").animate({scrollTop:0}, 200);
        }
    });

 // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            $("#listarea_noData").hide();
            mob.loading.show();
            contentList();
        }
    });

    // 조회조건 - 구분
    $("#sNttCatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:arrCatCd
        ,optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
    });
});

//목록페이지 보기
function contentList() {
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_list").css("display","block");
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
    setTimeout(function(){ setMainListHeight();}, 200);

}
//검색페이지 보기
function contentSearch() {
    $("#content_list").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_search").css("display","block");
}



//상세페이지 보기
function contentDetail(key, key2, key3) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_detail").css("display","block");
  $("#header_title span").removeAttr("class");
  if( key != null && key != 'undefined'){
      $.ajax({
          url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoardByKey.do' />",
          data:JSON.stringify({"sBbsId":key2, "sNttId":key }),
          type:"POST",
          dataType:"json",
          contentType:"application/json",
          error:function(jqXHR,status,error) {
              mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
          }
      }).done(function(result) {
          if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
              return false;
          }
          partsJs.validate.groupObjAllDataSet(result);

          $("#nttCatCd").val(arrCatCdMap[result.nttCatCd].cmmCdNm);
          $("#nttCont").val(result.nttCont);
          $("#nttTitleNm").val(result.nttTitleNm);
          $("#detailCloseBtn").show();

      });

      $("#fileDocNo").val(key3);
      $("#subList").attr("src", "<c:url value='/mob/cmm/bbs/generalBoard/selectBoardSubList.do' />");

  }
}
function contentSubDetail(fileDocNo, fileNo, fileNm) {
    //location.href="<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+fileDocNo+"&fileNo="+fileNo+"&inline=false"+"&fileNm="+fileNm;
}
//메인화면 가기
function goMain() {
    window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

</script>
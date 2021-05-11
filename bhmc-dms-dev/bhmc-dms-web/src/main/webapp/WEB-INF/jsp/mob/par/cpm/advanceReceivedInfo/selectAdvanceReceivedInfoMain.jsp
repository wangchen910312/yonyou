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
                <h2 id="content_list_title"><spring:message code="par.menu.advanceReceived" /></h2>
            </div>
            <div class="btn_right" align="right">
                <dms:access viewId="VIEW-D-12717" hasPermission="${dms:getPermissionMask('READ')}">
                <!--  <button id="btnSuggest" class="btn_m btn_m_min" align="right"><spring:message code="par.btn.suggestCost" /></button>--> <!-- 제시금액설정 -->
                </dms:access>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <tr>
                        <th scope="row" style="width:25%"><spring:message code='par.lbl.acAmt' /><!-- 보증금 --></th>
                        <td><input type="text" id = "acAmt" style="text-align: right;" disabled="disabled" /></td>
                    </tr>
                    <tr>
                        <th scope="row" style="width:25%"><spring:message code='par.lbl.calcAmt' /><!-- 공정중 --></th>
                        <td><input type="text" id = "calcAmt" style="text-align: right;" disabled="disabled"/></td>
                    </tr>
                    <tr>
                        <th scope="row" style="width:25%"><spring:message code='par.lbl.balAmt' /><!-- 가용금액 --></th>
                        <td><input type="text" id = "balAmt" style="text-align: right;" disabled="disabled"/></td>
                    </tr>
                    <tr>
                        <th scope="row" style="width:25%"><spring:message code='par.lbl.suggestAmt' /><!-- 제시금액 --></th>
                        <td><input type="text" id = "suggestAmt" style="text-align: right;" disabled="disabled"/></td>
                    </tr>
                </table>
            </div>
            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%" ><spring:message code="par.lbl.finishTime" /><!-- 거래일자--></span>
                    <span style="width:50%" ><spring:message code="par.lbl.advanceReceivedActEndDt" /><!-- 거래시간 --></span>
                    <span style="width:50%" ><spring:message code="par.lbl.sellType" /><!-- 거래유형 --></span>
                    <span style="width:50%" ><spring:message code="par.lbl.totAmtCol" /><!-- 신용 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.menu.advanceReceived" /> <spring:message code="global.title.searchCondition" /></h2>
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
                                <th scope="row"><spring:message code='global.lbl.dlrCd' /><!-- 딜러코드 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sDlrCd" type="form_input" disabled="disabled"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="group-OrdDt"><spring:message code='par.lbl.sellType' /><!-- 거래유형 --></th>
                                <td class="group-OrdDt">
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sPreAmtTp" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="f_term"><span><spring:message code='sal.lbl.orgStartDt' /></span></th>    <!-- 시작일자 -->
                                <td class="f_term">
                                    <div class="f_item01" style="width:82%">
                                        <input type="search" id="impStartDt"  />
                                        <span class="date" onclick="calpicker('impStartDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="f_term"><span><spring:message code='sal.lbl.orgEndDt' /></span></th>    <!-- 종료일자 -->
                                <td class="f_term">
                                    <div class="f_item01" style="width:82%">
                                        <input type="search" id="impEndDt"  />
                                        <span class="date" onclick="calpicker('impEndDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12716" hasPermission="${dms:getPermissionMask('READ')}">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="par.menu.advanceReceived" /> <spring:message code="global.lbl.dtlInfo" /></h2>
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
                                <th scope="row"><spring:message code="par.lbl.finishTime" /><!-- 거래일자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="finishTime" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                           <tr>
                                <th scope="row"><spring:message code="par.lbl.advanceReceivedActEndDt" /><!-- 거래시간 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="advanceReceivedActEndDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="par.lbl.sellType" /><!-- 거래유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="sellType" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.totAmtCol" /><!-- 신용 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="totAmtCol" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="par.lbl.dpstAmtCol" /><!-- 차변 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="dpstAmtCol" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="global.lbl.balc" /><!-- 잔액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="balc" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.advanceReceivedNum" /><!-- 참고번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="advanceReceivedNum" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var _windowHeight;

var preAmtTpList = [];
<c:forEach var="obj" items="${preAmtTpList}">
preAmtTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var preAmtTpMap = [];
$.each(preAmtTpList, function(idx, obj){
    preAmtTpMap[obj.cmmCd] = obj.cmmCdNm;
});

$(document).ready(function() {

    _windowHeight=$(window).height();

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();

        $("#sDlrCd").val("${dlrCd}");

    }

    initPage();

    $("#sPreAmtTp").kendoExtDropDownList({
        dataSource:preAmtTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,autoBind:true
        ,index:0
    });

    $("#acAmt").kendoExtNumericTextBox({
        enable:false
       ,format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#calcAmt").kendoExtNumericTextBox({
        enable:false
       ,format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#balAmt").kendoExtNumericTextBox({
        enable:false
       ,format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#suggestAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    // 타이틀
    $("#header_title").html("<spring:message code='par.menu.advanceReceived' />"); //공장가용자원정황
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoList.do' />");

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
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
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            contentList();
        }
    });

    //버튼 - 추가
    $("#btnSuggest").kendoButton({
           click:function(e){

            var AdvanceReceivedInfoHeaderVO = {
                dlrCd:"${dlrCd}"
                ,lmtAmt:$("#suggestAmt").data("kendoExtNumericTextBox").value()
            };

            $.ajax({
                url:"<c:url value='/par/cpm/advanceReceivedInfo/updateAdvanceReceivedInfoHeader.do' />"
                ,data:JSON.stringify(AdvanceReceivedInfoHeaderVO)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

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
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

changePreAmtTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = preAmtTpMap[val];
    }
    return returnVal;
};

//상세페이지 보기

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    $("#finishTime").val(dataItem.preAmtUpdtDt);
    $("#advanceReceivedActEndDt").val(dataItem.preAmtUpdtHm);
    $("#sellType").val(changePreAmtTp(dataItem.preAmtTp));
    $("#totAmtCol").val(kendo.toString(dataItem.totAmt,'n2'));
    $("#dpstAmtCol").val(kendo.toString(dataItem.dpstAmt, 'n2'));
    $("#balc").val(kendo.toString(dataItem.balAmt, 'n2'));
    $("#advanceReceivedNum").val(dataItem.dpstRefNo);

}

</script>
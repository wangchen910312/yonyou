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
        <c:import url="/WEB-INF/jsp/ZnewMob/cmm/todo/listJsp/selectTodoInfoList.jsp" />

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.title.workStatus" /> <spring:message code="global.btn.searchCondition" /><!--  조회조건 --></h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <%-- <tr>
                            <th scope="row"><spring:message code="global.lbl.confirmYn" /><!-- 확인여부 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sOpenYn" type="form_comboBox"/></div>
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.completeYn" /><!-- 완료여부 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="sHndlYn" type="form_comboBox"/></div>
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
                    <h2><spring:message code='global.title.workStatus' /> <spring:message code='global.title.detail' /></h2>
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
                                <th scope="row"><spring:message code="global.lbl.confirmYn" /><!-- 확인여부 --></th>
                                <td>
                                   <div class="f_text">
                                        <input type="text" id="openYn" readonly="readonly"/>
                                   <div class="f_text">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.cont' /><!-- 내용 --></th>
                                <td>
                                    <textarea rows="10" id=todoDesc name="todoDesc" cols="" class="f_textarea" readonly="readonly"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </section>
        </div>

        <div class="btnfixed">
                <div class="con_btnarea">
                    <span class="btnd1" id="btn_confirm"><span class=""><spring:message code="global.btn.completion" /></span></span>
                </div>
        </div>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script>
var mode="${mode}";
var sysDate="${sysDate}";
var oneDay="${oneDay}";

var openYnCd = [];
openYnCd.push({"cmmCd":"Y", "cmmCdNm":"<spring:message code='global.btn.confirm' />", "useYn":"Y"});
openYnCd.push({"cmmCd":"N", "cmmCdNm":"<spring:message code='global.btn.notConfirm' />", "useYn":"Y"});
var openYnCdMap = dms.data.arrayToMap(openYnCd, function(obj){ return obj.cmmCd; });


var hndlYnCd = [];
hndlYnCd.push({"cmmCd":"Y", "cmmCdNm":"<spring:message code='global.lbl.complete' />", "useYn":"Y"});
hndlYnCd.push({"cmmCd":"N", "cmmCdNm":"<spring:message code='global.lbl.incomplete' />", "useYn":"Y"});
var hndlYnCdMap = dms.data.arrayToMap(hndlYnCd, function(obj){ return obj.cmmCd; });
var isSelAll=false;


$(document).ready(function() {

 // 타이틀
    $("#header_title").html("<spring:message code='global.title.workStatus' />");
    $("#header_title").on("click", moveSearch);
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    if(mode==3){//미완료
        $("#sHndlYn").val("N");
    }

    $("#detailCloseBtn").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
        else if ($("#content_subdetail").css("display") == "block") { contentDetail(); }
        $("#detailCloseBtn").hide();
    });

 // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            if($("#sHndlYn").val() == "Y"){
                $(".btnfixed").hide();
            }else{
                $(".btnfixed").show();
            }
            $("#listarea_noData").hide();
            initList();
            contentList();
        }
    });

    // 조회조건 - 확인여부
    $("#sOpenYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:openYnCd
        ,optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
    });

   // 조회조건 - 완료여부
    $("#sHndlYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:hndlYnCd
        ,optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
    });

    $("#selAll").bind("click", function(){
        if(isSelAll){
            $("input[name='isSaveName']").each(function(cnt){
                $("input[name='isSaveName']")[cnt].checked = false;
            });
            isSelAll=false;
        }else{
            $("input[name='isSaveName']").each(function(cnt){
                $("input[name='isSaveName']")[cnt].checked = true;
            });
            isSelAll=true;
        }
    });

    $(".search_open").bind("click", function() {
        if($(".btnfixed").css("display") == "none") {
            $(".btnfixed").css("display","block");
        }else if($(".btnfixed").css("display") == "block") {
            $(".btnfixed").css("display","none");
        }
    });
});

var selList      = [];
$("#btn_confirm").click(function(){
    var listCnt = 0;
    var checkFlag = true;
    selList =[];
    $("input[name='isSaveName']").each(function(cnt){
        if($("input[name='isSaveName']")[cnt].checked == true){

            selList.push($("input[name='todoNo']")[cnt].value);
            //tempData[cnt].hndlYn="y";
            listCnt ++;
        }
    });
    if(listCnt == 0){
        mob.notification.warning("<spring:message code='global.info.unselected'/>");

    } else {//체크건수가 존재하는경우
         $.ajax({
            url:"<c:url value='/cmm/nms/todoInfo/updateTodoInfoHndl.do' />",
            data:JSON.stringify(selList),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                mob.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                //정상적으로 반영 되었습니다.
                initList();
                mob.notification.success("<spring:message code='global.info.success'/>");
                listData.read();

            }
        });
    }
});


//목록페이지 보기
function contentList() {
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_list").css("display","block");
    listData.read();
}

</script>
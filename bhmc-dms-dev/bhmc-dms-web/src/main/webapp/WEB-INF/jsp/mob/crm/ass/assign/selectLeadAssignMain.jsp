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
                <h2 id="content_list_title"><spring:message code="crm.title.leadAssign" /> <spring:message code="global.title.list" /><!-- 리드 배정 --></h2>
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
                                <th scope="row"><span><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.statNm" /><!-- 상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.regDt" /><!-- 배정일 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead checkitem">
                            <%--
                            <span class="check">
                                <input type="checkbox" id="check01" name="check01" class="f_check" /><label for="check01"></label>
                            </span>
                            --%>
                            <span style="width:35%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.hpNo" /><!-- 연락처 --></span>
                            <span style="width:30%"><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.intrCarLine" /><!-- 관심차종 --></span>
                            <span style="width:65%"><spring:message code="global.lbl.intrModel" /><!-- 관심모델  --></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.bhmcyn" /><!-- BMHC --></span>
                            <span style="width:35%"><spring:message code="global.lbl.statNm" /><!-- 상태 --></span>
                            <span style="width:30%"><spring:message code="global.lbl.regDt" /><!-- 배정일 --></span>
                        </div>

                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>

            <div class="btnfixed">
                <%--<div id="assignUserListArea" style="width:400px; height:50px; border:1px solid black;"></div>--%>

                <div class="con_btnarea btncount2">
                    <div style="width:70%;margin-bottom:10px;" class="al">
                        <textarea id="assignUserListArea" rows="2" cols="" class="f_textarea" style="padding:5px;" readonly="readonly"></textarea>
                    </div>
                    <div style="width:30%" ><span class="btnd1" id="btnAssignUserSearch"><spring:message code='global.btn.select' /><!-- 선택 --></span></div>
                    <div style="width:100%;" ><span class="btnd1" id="btnAssign"><spring:message code='global.btn.assign' /><!-- 배정 --></span></div>
                </div>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.title.leadAssign" /> <spring:message code="global.title.searchCondition" /><!-- 리드배정 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="global.lbl.leadSrc" /><!-- 리드출처 --></th>
                        <td>
                            <div class="f_text"><input id="sLeadSrcCd" type="text" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 진행상태 --></th>
                        <td>
                            <div class="f_text"><input id="sStatCd" type="text" class="form_comboBox"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRegDtFrom" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRegDtFrom');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRegDtTo" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRegDtTo');">날짜선택</span>
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


<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";
var userList = [];
var ynCdList = [];
var yesMap = [];
ynCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
yesMap["N"] = "<spring:message code='global.lbl.n' />";

// 리드출처
var leadSrcDs = [];
var leadSrcArr = [];
leadSrcDs.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${leadSrcList}">
    leadSrcDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    leadSrcArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
leadSrcArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = leadSrcArr[val];
    }
    return returnVal;
};

// 리드상태
var statDs = [];
var statArr = [];
statDs.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${statList}">
    statDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    statArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
statArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = statArr[val];
    }
    return returnVal;
};

// 판매고문 목록
var assignUserDS = [];
var assignUserArr = [];
assignUserDS.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${assignUserList}">
    assignUserDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    assignUserArr["${obj.usrId}"] = "${obj.usrNm}";
</c:forEach>
assignUserArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = assignUserArr[val];
    }
    return returnVal;
};



$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
           $("#sLeadSrcCd").data("kendoExtDropDownList").value("");
           break;
        case "search2Area" :
           $("#sStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sRegDtFrom").val("");
            $("#sRegDtTo").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){

    var sLeadSrcCd = $("#sLeadSrcCd").data("kendoExtDropDownList").value();
    var sStatCd = $("#sStatCd").data("kendoExtDropDownList").value();
    var sRegDtFrom = $("#sRegDtFrom").val();
    var sRegDtTo = $("#sRegDtTo").val();

    if(sLeadSrcCd == "" && sStatCd == "" && sRegDtFrom == "" && sRegDtTo == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sLeadSrcCd == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sStatCd == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sRegDtFrom == "" && sRegDtTo == "")  $("#search3Area").hide();
        else $("#search3Area").show();
    }

    setMainListHeight();
}


$(document).ready(function() {

// 배정 담당자
                    $("#assignUsers").kendoMultiSelect({
                        dataSource:assignUserDS,
                        valuePrimitive:true,
                        placeholder:"",
                        dataTextField:"usrNm",
                        dataValueField:"usrId"
                        //dataBound:defaultLangDatasourceSetting,
                        //change:defaultLangDatasourceSetting
                    });



    // 리드출처
$("#sLeadSrcCd").kendoExtDropDownList({
    dataSource:leadSrcDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.check'/>"
    , index:0
});


// 리드상태
$("#sStatCd").kendoExtDropDownList({
    dataSource:statDs
    , dataTextField:"text"
    , dataValueField:"value"
    , optionLabel:"<spring:message code='global.lbl.check'/>"
    , index:0
});

    function initPage(){
        $(".skeyarea").hide();
    }


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='crm.menu.leadAssign' />");<!-- 부품예약현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/crm/ass/assign/selectLeadAssignList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            var sLeadSrcCd = $("#sLeadSrcCd").data("kendoExtDropDownList");
            var sStatCd = $("#sStatCd").data("kendoExtDropDownList");

            var sRegDtFrom = $("#sRegDtFrom");
            var sRegDtTo = $("#sRegDtTo");

            if(sLeadSrcCd.value() != "") $("#search1Area span[name='searchStr']").text(sLeadSrcCd.text());;
            if(sStatCd.value() != "") $("#search2Area span[name='searchStr']").text(sStatCd.text());
            if(sRegDtFrom.val() != "" || sRegDtTo.val() != "") $("#search3Area span[name='searchStr']").html(sRegDtFrom.val() + " ~<br/>" + sRegDtTo.val());
            setSearchBox();
            contentList();
        }
    });

    // 배정
    $("#btnAssign").kendoButton({
        click:function(e){

            confirmOpen(confirmMsgSave,'doSave',y,n);
        }

    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
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


    $("#btnAssignUserSearch").click(function(){
        openAssignUserPopup();
    });



});
</script>
<script>


function doSave(){
var saveList      = [];
            // 임시 var grid          = $("#leadGrid").data("kendoExtGrid");
            // 임시 var rows          = grid.tbody.find("tr");
            // 임시 var userList      = $("#assignUsers").data("kendoMultiSelect").dataItems();
            var dataValidate  = false;
            var chkRow;
            var saveData;

            if(userList.length  == 0 ){
                // 배정담당자 / 을(를) 선택해주세요.
                mob.notification.warning("<spring:message code='global.lbl.assignPrsNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }


            var data={};
            $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
                if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){
                    data.custNm = $(this).parent().parent().find("input[name='custNm']").val();
                    data.custNo = $(this).parent().parent().find("input[name='custNo']").val();
                    data.custTp = $(this).parent().parent().find("input[name='custTp']").val();
                    data.hpNo = $(this).parent().parent().find("input[name='hpNo']").val();
                    data.mngScId = $(this).parent().parent().find("input[name='mngScId']").val();
                    data.officeTelNo = $(this).parent().parent().find("input[name='officeTelNo']").val();
                    data.oldCustNm = $(this).parent().parent().find("input[name='custNm']").val();
                    data.oldHpNo = $(this).parent().parent().find("input[name='custHpNo']").val();
                    data.prefCommMthCd = $(this).parent().parent().find("input[name='prefCommMthCd']").val();
                    data.prefCommNo = $(this).parent().parent().find("input[name='prefCommNo']").val();

                    saveList.push(data);
                }
            });

            //if(dataValidate){ return false; }
            if(saveList.length == 0 ){
                // 배정목록 / 을(를) 선택해주세요.
                mob.notification.warning("<spring:message code='global.btn.assignList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }
            if(saveList.length < userList.length ){
                // 선택된 목록보다 담당자가 많습니다.
                mob.notification.warning("<spring:message code='global.info.assignChk' />");
                return false;
            }



            /* 임시
            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                var data={};

                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chkRow === true){

                    if((gridData.statCd == "03") || (gridData.statCd == "04") || (gridData.statCd == "05")){
                        // 종료 상태에는 배정이 불가능합니다.
                        mob.notification.warning("<spring:message code='global.info.leadAssignChk' />");
                        saveList = [];
                        dataValidate = true;
                        return false;
                    }
                    //data.leadNo = gridData.leadNo;          // lead 번호
                    //data.statCd = gridData.statCd;          // lead 상태 ( BIZ 에서 validation 체크 )
                    data.custNm = gridData.custNm;
                    data.custNo = gridData.custNo;
                    data.custTp = gridData.custTp;
                    data.hpNo = gridData.custHpNo;
                    data.mngScId = gridData.mngScId;
                    data.officeTelNo = gridData.officeTelNo;
                    data.oldCustNm = gridData.custNm;
                    data.oldHpNo = gridData.custHpNo;
                    data.prefCommMthCd = gridData.prefCommMthCd;
                    data.prefCommNo = gridData.prefCommNo;

                    saveList.push(data);

                }
            });

            if(dataValidate){ return false; }

            if(saveList.length == 0 ){
                // 배정목록 / 을(를) 선택해주세요.
                mob.notification.warning("<spring:message code='global.btn.assignList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }

            if(saveList.length < userList.length ){
                // 선택된 목록보다 담당자가 많습니다.
                mob.notification.warning("<spring:message code='global.info.assignChk' />");
                return false;
            }
            */

            saveData ={
                    "assignList":saveList
                    ,"userList":userList
            };


            mob.loading.show();
            setTimeout(function(){
            $.ajax({
                url:"<c:url value='/mob/crm/ass/assign/updateCustomerInfoAssign.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    //mob.notification.error(jqXHR.responseJSON.errors);
                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                    mob.loading.hide();
                }
                ,success:function(jqXHR, textStatus) {
                    /*
                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);
                    var assignUsers = $("#assignUsers").data("kendoMultiSelect");
                    assignUsers.dataSource.data([]);
                    assignUsers.setDataSource(assignUserDS);
                    */
                    saveList = [];
                    userList = [];
                    //정상적으로 반영 되었습니다.
                    mob.notification.success("<spring:message code='global.info.success'/>");
                    mob.loading.hide();
                }
            });
            }, 200);
        }
        //, enable:false


//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_search").css("display","block");

  $("#sRegDtFrom").val(chgServerDate2Str(sevenDtBf));
  $("#sRegDtTo").val(chgServerDate2Str(toDt));

}





// 판매고문 선택 팝업
function openAssignUserPopup(){

    var assignUserList = [];
    if(userList.length > 0){
        assignUserList = userList;
    }
    assignUserPopupWin = mob.window.popup({
        windowId:"venderMasterPopup"
        ,title:"<spring:message code = 'crm.lbl.scId'/>"   // 판매고문
        ,deactivate :false
        ,content:{
            url:"<c:url value='/mob/crm/ass/assign/selectAssignUserPopMain.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"assignUserList":assignUserList
                ,"callbackFunc":function(data){
                }
            }
        }
    });
}



function addAssignUser(){


    /*
    for(var i=0; i<addAssignUserList.length; i++){
        var usrNm = addAssignUserList[i].usrNm;
        var usrId = addAssignUserList[i].usrId;
        var gridData = {
            usrNm:usrNm,
            usrId:usrId
        };
        // 중복처리 START
        if(userList.length == 0){
            userList.push(gridData);
            //$("#assignUserListArea").append("<div style='width:80px;' id='userArea_'"+usrId+"'><span>" + usrNm + "</span><input style='width:12px;' type='button'value='X' onclick='delUserArea(\""+ usrId +"\");'/></div>");
            $("#assignUserListArea").append("<div style='width:80px;' id='userArea_'"+usrId+"'><span>" + usrNm + "</span></div>");
        }else{
            var dupChk = false;
            for(var j=0; j<userList.length; j++){
                if(userList[j].usrId == gridData.usrId){
                    dupChk = true;
                }
            }
            if(!dupChk){
                userList.push(gridData);
                //$("#assignUserListArea").append("<div style='width:80px;' id='userArea_'"+usrId+"'><span>" + usrNm + "</span><input style='width:12px;' type='button' value='X' onclick='delUserArea(\""+ usrId +"\");'/></div>");
                $("#assignUserListArea").append("<div style='width:80px;' id='userArea_'"+usrId+"'><span>" + usrNm + "</span></div>");
            }
        }
        // 중복처리 END
    }
    */

    var strAssignUsers = "";
    for(var i=0; i<userList.length; i++){
        if(userList.length == 1 || i == userList.length-1) strAssignUsers += userList[i].usrNm;
        else strAssignUsers += userList[i].usrNm + ", ";
    }
    $("#assignUserListArea").val(strAssignUsers);
}


/*
function delUserArea(userId){
    alert(userId);
}
*/

</script>
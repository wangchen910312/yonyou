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
                <h2 id="content_list_title"><spring:message code="global.lbl.evalInfoList" /><!-- 평가정보 목록 --></h2>
            </div>
            <div class="listarea">
                <div class="listhead checkitem">
                    <span style="width:65%"><spring:message code="global.lbl.vinNo" /><!-- VIN --></span>
                    <span style="width:35%"><spring:message code="global.lbl.tpCarNo" /><!-- 차량번호 --></span>
                    <span style="width:65%" class="clboth"><spring:message code='sal.lbl.grDt' /><!-- 입고일자 --></span>
                    <%-- <span style="width:35%"><spring:message code='global.lbl.realDlDts' /><!-- 발차일자 --></span>--%>
                    <span style="width:35%"><spring:message code='global.lbl.evalScheDt' /><!-- 평가일자 --></span>
                     <span style="width:100%"><spring:message code="global.lbl.logisticsCmpn" /><!-- 물류회사 --></span>

                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300px"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
            <div class="btnfixed">
                <div class="con_btnarea btncount2">
                    <dms:access viewId="VIEW-D-12608" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span id="btnEvalSearch" class="btnd1"><spring:message code='global.btn.evalSearch' /></span></div><!-- 평가조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12607" hasPermission="${dms:getPermissionMask('READ')}">
                        <div><span id="btnCareerSearch" class="btnd1"><spring:message code='sal.btn.policySearch' /></span></div><!-- 이력조회 -->
                    </dms:access>
                </div>
            </div>
        </section>
        
        <section id="content_sublist" style="display:none">
            <div class="content_title conttitlePrev">
                <dms:access viewId="VIEW-D-12606" hasPermission="${dms:getPermissionMask('READ')}">
                    <h2 id="content_list_title"><spring:message code='sal.lbl.evaluationInfo' />&nbsp<spring:message code='sal.btn.policySearch' /><!-- 평가정보 이력조회 --></h2>
                </dms:access>
            </div>
            <div class="listarea">
                <div class="listhead dlistitem">
                    <input type="hidden" id ="sVinNo" value=""/>
                    <span style="width:50%"><spring:message code="global.lbl.vinNo" /><!-- VIN --></span>
                    <span style="width:50%"><spring:message code="global.lbl.matService" /><!-- 물류서비스 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.carTime" /><!-- 차량교부시간 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.evalScheDt" /><!-- 평가일자 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.driverSat" /><!-- 기사만족도 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.carMass" /><!-- 차량교부질량 --></span>
                    <span style="width:50%"><spring:message code="sal.lbl.otherCont" /><!-- 물류회사 --></span>
                </div>
                <iframe id="subList" border="0" frameborder="0" width="100%" height="300px"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
            <div class="btnfixed">
                <div class="con_btnarea">
                    <span class="btnd1" id="btnSubCancel"><spring:message code='global.btn.close' /><!-- 닫기--></span>
                </div>
            </div>
        </section>


        <!-- content_search -->
        <!--<section id="content_search" class="content_search" style="display:none;"> 임시-->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h1><spring:message code="global.lbl.evalInfoListSearch" /><!-- 평가정보 조회조건  --></h1>
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
                                <th scope="row"><spring:message code='global.lbl.vinNo' /><!-- VIN --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sVinNo" value="" maxlength="18" class="form_input" style="width:100%"></div>
                                    <!-- <div class="f_text"><input type="text" id="sVinNo1" value="" maxlength="11" class="form_input" style="width:100%"></div>
                                    <div class="f_text"><input type="text" id="sVinNo2" value="" maxlength="7" class="form_input" style="width:100%"></div> -->
                                </td>
                            </tr>
                            <tr>
                                 <th scope="row" class="required"><span><spring:message code='sal.lbl.grDts' /></span></th>    <!-- 입고일자 -->
                                 <td class="f_term">
                                    <div class="f_item01" style = "width:82%" >
                                        <input type="search" id="sGrDtS" value="${oneDay}"  />
                                        <span class="date" onclick="calpicker('sGrDtS')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                    <span class="termtext"> ∼</span>
                                    <div class="f_item01" style = "width:82%" >
                                        <input type="search" id="sGrDtE" value="${toDay}"  />
                                        <span class="date" onclick="calpicker('sGrDtE')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                 <th scope="row" class="required"><span><spring:message code='global.lbl.evalScheDt' /></span></th>    <!-- 평가일자 -->
                                 <td class="f_term">
                                    <div class="f_item01" style = "width:82%" >
                                        <input type="search" id="sApDtS" value="${oneDay}"  />
                                        <span class="date" onclick="calpicker('sApDtS')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                    <span class="termtext"> ∼</span>
                                    <div class="f_item01" style = "width:82%" >
                                        <input type="search" id="sApDtE" value="${toDay}"  />
                                        <span class="date" onclick="calpicker('sApDtE')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>

                            <%-- <tr>
                                <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                                <td>
                                    <div class="f_text"><input type="text" id="sCarStatCd" class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr> --%>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12604" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <section id="content_detail" style="display:none">
            <!-- 평가대상 차량  -->
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.lbl.evalForVehicle" /><!-- 평가대상차량 --></h2>
            </div>
            <div class="listarea01" style="">
                <ul id="updateEvalList">
                </ul>
            </div>
            <!-- // 평가대상 차량  -->

            <!-- 확인 목록  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.lbl.dlVehicleEval" /><!-- 배송차량평가 --> </h2>
                    <div class="title_btn">
                        <span class="co_open"><span><!-- 상세내용 접기--> </span></span>
                        <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
                    </div>
                </div>
                <div class="co_view" style="">
                    <div class="contbox">
                        <h3 class="contTitle3"><spring:message code='sal.lbl.dstbSerEval' /></h3><!-- 물류 서비스 평가 -->
                        <div class="evaluation">
                            <ul>
                                <li id="dstbSerEvalVal1" class="grade1"><span><span><spring:message code='global.btn.satisfaction' /></span></span></li><!-- 만족 -->
                                <li id="dstbSerEvalVal2" class="grade2"><span><span><spring:message code='global.btn.basicSatisfaction' /></span></span></li><!-- 기본만족 -->
                                <li id="dstbSerEvalVal3" class="grade3"><span><span><spring:message code='global.btn.normal' /></span></span></li><!-- 일반 -->
                                <li id="dstbSerEvalVal4" class="grade4"><span><span><spring:message code='global.btn.basicDissatisfied' /></span></span></li><!-- 기본 불만족 -->
                                <li id="dstbSerEvalVal5" class="grade5"><span><span><spring:message code='global.btn.dissatisfied' /></span></span></li>
                                <input type="hidden" id="dstbSerEvalVal" name="dstbSerEvalVal" value="1"/>
                            </ul>
                        </div>
                        <h3 class="contTitle3"><spring:message code='sal.lbl.driverStsf' /></h3><!-- 기사 만족도 -->
                        <div class="evaluation">
                            <ul>
                                <li id="driverStsfVal1" class="grade1"><span><span><spring:message code='global.btn.satisfaction' /></span></span></li><!-- 만족 -->
                                <li id="driverStsfVal2" class="grade2"><span><span><spring:message code='global.btn.basicSatisfaction' /></span></span></li><!-- 기본만족 -->
                                <li id="driverStsfVal3" class="grade3"><span><span><spring:message code='global.btn.normal' /></span></span></li><!-- 일반 -->
                                <li id="driverStsfVal4" class="grade4"><span><span><spring:message code='global.btn.basicDissatisfied' /></span></span></li><!-- 기본 불만족 -->
                                <li id="driverStsfVal5" class="grade5"><span><span><spring:message code='global.btn.dissatisfied' /></span></span></li>
                                <input type="hidden" id="driverStsfVal" name="driverStsfVal" value="1"/>
                            </ul>
                        </div>
                        <h3 class="contTitle3"><spring:message code='sal.lbl.carIssueHm' /></h3><!-- 차량 교부시간 -->
                        <div class="evaluation">
                            <ul>
                                <li id="carIssueHmVal1" class="grade1"><span><span><spring:message code='global.btn.truth' /></span></span></li><!-- 진실 -->
                                <li id="carIssueHmVal2" class="grade5"><span><span><spring:message code='sal.lbl.falsehood' /></span></span></li><!-- 허위 -->
                                <input type="hidden" id="carIssueHmVal" name="carIssueHmVal" value="1"/>
                            </ul>
                        </div>
                        <h3 class="contTitle3"><spring:message code='sal.lbl.carIssueMass' /></h3><!-- 차량 교부질량 -->
                        <div class="evaluation">
                            <ul><!-- 양호 -->
                                <li id="carIssueMassVal1" class="grade6"><span><span><spring:message code='global.btn.good' /></span></span></li><!-- 양호 -->
                                <li id="carIssueMassVal2" class="grade6"><span><span><spring:message code='global.btn.slightlyDamaged' /></span></span></li><!-- 손상경미 -->
                                <li id="carIssueMassVal3" class="grade6"><span><span><spring:message code='global.btn.seriousDamage' /></span></span></li><!-- 손상엄중 -->
                            </ul>
                            <ul>
                                <input type="hidden" id="carIssueMassVal" name="carIssueMassVal"/>
                                <li id="carIssueMassVal4" class="grade6"><span><span><spring:message code='global.btn.vehicleParts' /></span></span></li><!-- 차량부품 -->
                                <li id="carIssueMassVal5" class="grade6"><span><span><spring:message code='global.btn.remoteControlFault' /></span></span></li><!-- 리모컨 고장 -->
                                <li id="carIssueMassVal6" class="grade6"><span><span><spring:message code='global.btn.etc' /></span></span></li><!-- 기타 -->
                            </ul>
                        </div>
                        <h3 class="contTitle3"><spring:message code='sal.lbl.otherCont' /></h3><!-- 기타신고 및 의견 -->
                        <table class="flist01">
                            <caption><spring:message code='sal.lbl.otherCont' /></caption>
                            <colgroup>
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        <textarea rows="5" id="otherCont" name="otherCont" cols="" class="f_textarea"  placeholder="<spring:message code='sal.lbl.otherCont' />"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 확인 목록  -->

            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="btnCancel"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                <%-- <div><span id="btnCancel" class="btnd1t2"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div> --%>
                <dms:access viewId="VIEW-D-12602" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span id="btnEvalComplete" class="btnd1"><spring:message code='global.btn.evalComplete' /><!-- 평가완료 --></span></div>
                </dms:access>
                <%-- <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div> --%>
            </div>

        </section>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;
    
var sVinNo;

toDate = new Date();

/************* 차량상태(입고확정상태) SELECT BOX  *******************/
var carStatCdList = [];
<c:forEach var="obj" items="${carStatCdInfo}">
carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd});

/************* 물류 서비스 평가 SELECT BOX  *******************/
var dstbSerEvalList = [];
var dstbSerEvalArr = {};
<c:forEach var="obj" items="${dstbSerEvalInfo}">
  dstbSerEvalList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  dstbSerEvalArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/************* 기사만족도 SELECT BOX  *******************/
var driverStsfList = [];
var driverStsfArr = {};
<c:forEach var="obj" items="${driverStsfInfo}">
  driverStsfList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  driverStsfArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/************* 차량 교부시간 SELECT BOX  *******************/
 var carIssueHmList = [];
 var carIssueHmArr = {};
<c:forEach var="obj" items="${carIssueHmInfo}">
  carIssueHmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  carIssueHmArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/************* 차량 교부질량 SELECT BOX  *******************/
var carIssueMassList = [];
var carIssueMassArr = {};
  <c:forEach var="obj" items="${carIssueMassInfo}">
    carIssueMassList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carIssueMassArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
  </c:forEach>

  /************* 주문유형 SELECT BOX  *******************/

/* $(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sVinNo1").val("");
            $("#sVinNo2").val("");
            break;
        case "search2Area" :
            $("#sGrDtS").val("");
            $("#sGrDtE").val("");
            break;
        case "search3Area" :
            $("#sCarStatCd").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});



function setSearchBox(){

    var sVinNo1 = $("#sVinNo1").val();
    var sGrDtS = $("#sGrDtS").val();
    var sCarStatCd = $("#sCarStatCd").data("kendoExtDropDownList").value();
    if(sVinNo1 == "" && sGrDtS == "" && sCarStatCd == "" ){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sVinNo1 == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sGrDtS == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sCarStatCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
    }
} */

$(document).ready(function() {

  //현재일자
    var toDay = "${toDay}";

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#content_detail")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:carStatCdList
       ,optionLabel:"<spring:message code='global.lbl.check'/>"  // 선택
    });


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
    $("#header_title").html("<spring:message code='sal.lbl.evalInfoListSearch' />"); //평가정보 조회
    $("#header_title").on("click", moveSearch);
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    /* var sVinNo1 = $("#sVinNo1").val();
    var sVinNo2 = $("#sVinNo2").val();
    var sGrDtS = $("#sGrDtS").val();
    var sGrDtE = $("#sGrDtE").val(); */
    /* var sCarStatCd      = $("#sCarStatCd").data("kendoExtDropDownList").value();

    if(sVinNo1 != "") $("#search1Area span[name='searchStr']").html(sVinNo1+" - <br/>"+ sVinNo2);
    if(sGrDtS != "") $("#search2Area span[name='searchStr']").html(sGrDtS +" ~ <br/>"+ sGrDtE);
    if(sCarStatCd != "") $("#search3Area span[name='searchStr']").text($("#sCarStatCd").data("kendoExtDropDownList").text()); */

    //setSearchBox();

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/lom/evalSearchEdit/selectEvalSearchEditList.do' />");
    
    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#listarea_noData").hide();
            mob.loading.show();

           /*  sVinNo1 = $("#sVinNo1").val();
            sVinNo2 = $("#sVinNo2").val();
            sGrDtS = $("#sGrDtS").val();
            sGrDtE = $("#sGrDtE").val(); */
           /*  var sCarStatCd      = $("#sCarStatCd").data("kendoExtDropDownList").value();

            if(sVinNo1 != "") $("#search1Area span[name='searchStr']").html(sVinNo1+" - <br/>"+ sVinNo2);
            if(sGrDtS != "") $("#search2Area span[name='searchStr']").html(sGrDtS +" ~ <br/>"+ sGrDtE);
            if(sCarStatCd != "") $("#search3Area span[name='searchStr']").text($("#sCarStatCd").data("kendoExtDropDownList").text()); */
            //setSearchBox();
            contentList();
        }
    });

  //버튼 - 평가조회
    $("#btnEvalSearch").kendoButton({
        click:function(e) {
            contentDetail();
        }
    });
  
    //버튼 - 이력조회
    $("#btnCareerSearch").kendoButton({
        click:function(e) {
            
            var listCnt = 0;
            var checkFlag = true;
            $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
                if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){
                    sVinNo = $("#mainList").contents().find("input[name='sVinNo']")[cnt].value; 
                    listCnt ++;
                }
            });
            
            if(listCnt != 1){
                mob.notification.info("<spring:message code='global.lbl.selectOne' />");
                return;
            }
            
            $("#content_list").css("display","none");
            $("#content_search").css("display","none");
            $("#content_detail").css("display","none");
            $("#content_sublist").css("display","block");
            
            $("#header_title span").removeAttr("class");
            
            $("#subList").attr("src", "<c:url value='/mob/sal/lom/evalSearchEdit/selectEvalSearchEditSubList.do' />");
            
        }
    });

  //버튼 - 평가 완료
    $("#btnEvalComplete").kendoButton({
        click:function(e) {
            confirmOpen("<spring:message code='global.lbl.update' var='update' /><spring:message code='global.info.cnfrmMsg' arguments='${update},' />",'save',y,n);
        }
    });

  //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $("#content_search").css("display","none");
            $("#content_detail").css("display","none");
            $("#content_list").css("display","block");
        }
    });
    
    //버튼 - 취소
    $("#btnSubCancel").kendoButton({
        click:function(e) {
            $("#content_search").css("display","none");
            $("#content_detail").css("display","none");
            $("#content_sublist").css("display","none");
            $("#content_list").css("display","block");
        }
    });  
  
    //평가 항목 바인딩 처리
    makingEvalEdit();

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_sublist").css("display") == "block") {
            $("#content_search").css("display","none");
            $("#content_detail").css("display","none");
            $("#content_sublist").css("display","none");
            $("#content_list").css("display","block");
            contentListNonRefresh();
        }
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
  $("#content_list").css("display","block");
  $("#content_sublist").css("display","none");
  
  $("#header_title span").attr("class","search_open");
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기
var saveList      = [];
var gridData = {
        dlrCd             :"",
        dstbCmpNm         :"",
        trsfCarNo         :"",
        vinNo             :"",
        carStatCd         :"",
        grDt              :"",
        pltGiDt           :"",
        dlrEvalDt         :"",
        dstbSerEvalVal    :"",
        driverStsfVal     :"",
        carIssueHmVal     :"",
        carIssueMassVal   :"",
        otherCont         :""
};


function contentDetail() {
    saveList = [];
    makingEvalEditReset();//선택값 reset
    $("#updateEvalList").text("");
    var listCnt = 0;
    var checkFlag = true;
    $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
        if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){
            var gridData = {
                    dlrCd             :"",
                    dstbCmpNm         :"",
                    trsfCarNo         :"",
                    vinNo             :$("#mainList").contents().find("input[name='vinNo']")[cnt].value,
                    carStatCd         :$("#mainList").contents().find("input[name='carStatCd']")[cnt].value,
                    grDt              :"",
                    pltGiDt           :"",
                    dlrEvalDt         :chgDateTimeStamp($("#mainList").contents().find("input[name='dlrEvalDt']")[cnt].value),
                    dstbSerEvalVal    :$("#mainList").contents().find("input[name='dstbSerEvalVal']")[cnt].value,
                    driverStsfVal     :$("#mainList").contents().find("input[name='driverStsfVal']")[cnt].value,
                    carIssueHmVal     :$("#mainList").contents().find("input[name='carIssueHmVal']")[cnt].value,
                    carIssueMassVal   :$("#mainList").contents().find("input[name='carIssueMassVal']")[cnt].value,
                    otherCont         :$("#mainList").contents().find("input[name='otherCont']")[cnt].value
            };

            if("50" == $("#mainList").contents().find("input[name='carStatCd']")[cnt].value){
                mob.notification.info("<spring:message code='sal.lbl.receiveCncl' var='cancel' /><spring:message code='global.info.impos' arguments='${cancel},' />"); // 이미 입고확정 되었습니다.
                checkFlag = false;
                return false;
            }

            saveList.push(gridData);
            listCnt ++;
        }
    });
    //입고확정 데이터가 존재할 경우 수정 불가
    if(!checkFlag){
        return false;
    }

    if(listCnt == 0){
        mob.notification.info("<spring:message code='global.info.unselected' />");
    } else {
        if(listCnt == 1 ){ //선택항이 한건인 경우 해당건으로 데이터 세팅
            var dstbSerEvalVal   = saveList[0].dstbSerEvalVal  ;
            var driverStsfVal    = saveList[0].driverStsfVal   ;
            var carIssueHmVal    = saveList[0].carIssueHmVal   ;
            var carIssueMassVal  = saveList[0].carIssueMassVal ;
            var otherCont        = saveList[0].otherCont       ;

            if(dstbSerEvalVal != null && dstbSerEvalVal !=""){
                $('#dstbSerEvalVal'+dstbSerEvalVal).click();
            }
            if(driverStsfVal != null && driverStsfVal !=""){
                $('#driverStsfVal'+driverStsfVal).click();
            }
            if(carIssueHmVal != null && carIssueHmVal !=""){
                $('#carIssueHmVal'+carIssueHmVal).click();
            }
            if(carIssueMassVal != null && carIssueMassVal !=""){
                $('#carIssueMassVal'+carIssueMassVal).click();
            }
            $("#otherCont").val(otherCont) ;
        }
        var textUpdateEvalList = "";
        saveList.forEach(function(saveData){
            //$("#updateEvalList").append("<li>"+saveData.vinNo+"</li>");
            textUpdateEvalList = "";
            textUpdateEvalList = textUpdateEvalList+'<li>';
            textUpdateEvalList = textUpdateEvalList+'    <div class="dlistitem bgNone">';
            textUpdateEvalList = textUpdateEvalList+'        <span class="">'+saveData.vinNo+'</span>';
            textUpdateEvalList = textUpdateEvalList+'    </div>';
            textUpdateEvalList = textUpdateEvalList+'</li>';

            $("#updateEvalList").append(textUpdateEvalList);
        });
        $("#content_list").css("display","none");
        $("#content_search").css("display","none");
        $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    }
}
function makingEvalEditReset(){
    $('#dstbSerEvalVal1').click();
    $('#driverStsfVal1').click();
    $('#carIssueHmVal1').click();
    $('#carIssueMassVal1').click();
    $("#otherCont").val('') ;
}
//각평가 버튼 클릭시 class변경
function reCheckClassEvalEdit(obj){
    var slibs = obj.siblings("li");
    $.each(slibs,function(){
        tmpClassName = this.className.replace(/_on/gi,'');
        this.className = tmpClassName;
    });

    if(obj.attr("class").indexOf("_on") == -1) {
        obj.attr("class",obj.attr("class")+"_on");
    }
}

//차량 교부질량 평가 버튼 클릭시 class변경
function reCheckClassCarIssueMassVal(obj){
    $.each($(".grade6, .grade6_on"),function(){
        tmpClassName = this.className.replace(/_on/gi,'');
        this.className = tmpClassName;
    });

    if(obj.attr("class").indexOf("_on") == -1) {
        obj.attr("class",obj.attr("class")+"_on");
    }
}
var tmpClassName = '';
function makingEvalEdit(){
    // 물류서비스 평가:만족
    $("#dstbSerEvalVal1").click(function(){
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        reCheckClassEvalEdit($(this));
        $("#dstbSerEvalVal").val("1");
    });
    // 물류서비스 평가:기본만족
    $("#dstbSerEvalVal2").click(function(){
        reCheckClassEvalEdit($(this));
        $("#dstbSerEvalVal").val("2");
    });
    // 물류서비스 평가:일반
    $("#dstbSerEvalVal3").click(function(){
        reCheckClassEvalEdit($(this));
        $("#dstbSerEvalVal").val("3");
    });
    // 물류서비스 평가:기본 불만족
    $("#dstbSerEvalVal4").click(function(){
        reCheckClassEvalEdit($(this));
        $("#dstbSerEvalVal").val("4");
    });
    // 물류서비스 평가:불만족
    $("#dstbSerEvalVal5").click(function(){
        reCheckClassEvalEdit($(this));
        $("#dstbSerEvalVal").val("5");
    });

    // 기사 만족도:만족
    $("#driverStsfVal1").click(function(){
        reCheckClassEvalEdit($(this));
        $("#driverStsfVal").val("1");
    });
    // 기사 만족도:기본만족
    $("#driverStsfVal2").click(function(){
        reCheckClassEvalEdit($(this));
        $("#driverStsfVal").val("2");
    });
    // 기사 만족도:일반
    $("#driverStsfVal3").click(function(){
        reCheckClassEvalEdit($(this));
        $("#driverStsfVal").val("3");
    });
    // 기사 만족도:기본 불만족
    $("#driverStsfVal4").click(function(){
        reCheckClassEvalEdit($(this));
        $("#driverStsfVal").val("4");
    });
    // 기사 만족도:불만족
    $("#driverStsfVal5").click(function(){
        reCheckClassEvalEdit($(this));
        $("#driverStsfVal").val("5");
    });

    // 차량 교부시간:진실
    $("#carIssueHmVal1").click(function(){
        reCheckClassEvalEdit($(this));
        $("#carIssueHmVal").val("1");
    });
    // 차량 교부시간 :허위
    $("#carIssueHmVal2").click(function(){
        reCheckClassEvalEdit($(this));
        $("#carIssueHmVal").val("2");
    });

    // 차량 교부질량:완호
    $("#carIssueMassVal1").click(function(){
        reCheckClassCarIssueMassVal($(this));
        $("#carIssueMassVal").val("1");
    });
    // 차량 교부질량:손상경미
    $("#carIssueMassVal2").click(function(){
        reCheckClassCarIssueMassVal($(this));
        $("#carIssueMassVal").val("2");
    });
    // 차량 교부질량:손상엄중
    $("#carIssueMassVal3").click(function(){
        reCheckClassCarIssueMassVal($(this));
        $("#carIssueMassVal").val("3");
    });
    // 차량 교부질량:차량부품
    $("#carIssueMassVal4").click(function(){
        reCheckClassCarIssueMassVal($(this));
        $("#carIssueMassVal").val("4");
    });
    // 차량 교부질량:리모컨 고장
    $("#carIssueMassVal5").click(function(){
        reCheckClassCarIssueMassVal($(this));
        $("#carIssueMassVal").val("5");
    });
    // 차량 교부질량:기타
    $("#carIssueMassVal6").click(function(){
        reCheckClassCarIssueMassVal($(this));
        $("#carIssueMassVal").val("6");
    });
}

save = function() {
    var saveData;
    var saveFlag = true;
    var cnfrmInfo = { "dstbSerEvalVal":$("#dstbSerEvalVal").val()
            ,"driverStsfVal":$("#driverStsfVal").val()
            ,"carIssueHmVal":$("#carIssueHmVal").val()
            ,"carIssueMassVal":$("#carIssueMassVal").val()
            ,"otherCont":$("#otherCont").val()};

    if( saveFlag ){
        //if( !confirm("<spring:message code='global.lbl.update' var='update' /><spring:message code='global.info.cnfrmMsg' arguments='${update},' />")){ // 수정 하시겠습니까?
        //    return;
        //}

        var saveData = { "updateList":saveList
                        ,"popupVO":cnfrmInfo};

        mob.loading.show();
        $.ajax({
            url:"<c:url value='/mob/sal/lom/evalSearchEdit/updateEvalSearchEdit.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                mob.loading.hide();
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success:function(jqXHR, textStatus){
                mob.loading.hide();
                //저장후 리스트 재호출
                contentList();
                //정상적으로 반영 되었습니다.
                mob.notification.success("<spring:message code='global.info.success'/>");

            }
        });
    }
}


</script>
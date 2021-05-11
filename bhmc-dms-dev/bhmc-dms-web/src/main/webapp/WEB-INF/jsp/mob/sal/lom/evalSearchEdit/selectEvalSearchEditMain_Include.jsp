<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
        <section id="content_detail">
            <!-- 평가대상 차량  -->
           <div class="content_title conttitlePrev">
                <h2><spring:message code="global.lbl.evalForVehicle" /><!-- 평가대상차량 --></h2>
            </div>
            <div class="listarea01 bgNone" style="">
                <ul id="updateEvalList">
                </ul>
            </div>

            <!-- // 평가대상 차량  -->

            <!-- 확인 목록  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="par.lbl.receive" /><spring:message code="global.lbl.car" /><!-- 입고차량 --> </h2>
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
                <div><span id="btnCancel" class="btnd1"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
                <div><span id="btnEvalComplete" class="btnd1"><spring:message code='global.btn.evalComplete' /><!-- 평가완료 --></span></div>
            </div>

        </section>



<!-- script -->
<script>

$(document).ready(function() {
  //버튼 - 평가 완료
    $("#btnEvalComplete").kendoButton({
        click:function(e){
            var confirmData = { "dstbSerEvalVal":$("#dstbSerEvalVal").val()
                               ,"driverStsfVal":$("#driverStsfVal").val()
                               ,"carIssueHmVal":$("#carIssueHmVal").val()
                               ,"carIssueMassVal":$("#carIssueMassVal").val()
                               ,"otherCont":$("#otherCont").val()};
            /*
            var data = [];
            data.result = confirmData;
            data.msg = 'save';

            options.callbackFunc(data);
            */
            save(confirmData, "60", "D");

            /* $("#content_list_1").show();
            $("#content_list_4").hide(); */

        }
    });

  //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $("#content_list_3").show();
            $("#content_list_4").hide();
        }
    });


    //평가 항목 바인딩 처리
    makingEvalEdit();
    setTimeout(function(){
        makingEvalEditReset();
    },1000);
});


</script>

<script>

//상세페이지 보기
/* var saveList      = [];

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
        alert("<spring:message code='global.info.unselected' />");
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
            textUpdateEvalList = textUpdateEvalList+'    <div class="dlistitem">';
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

 */
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

function drawUpdateEvalList(saveList){
    var textUpdateEvalList = "";
    $.each(saveList , function(index , rowLoop){
        textUpdateEvalList = textUpdateEvalList+'<li>';
        textUpdateEvalList = textUpdateEvalList+'    <div class="dlistitem bgNone">';
        textUpdateEvalList = textUpdateEvalList+'        <span class="">'+rowLoop.vinNo+'</span>';
        textUpdateEvalList = textUpdateEvalList+'    </div>';
        textUpdateEvalList = textUpdateEvalList+'</li>';

        //$("#updateEvalList").append(textUpdateEvalList);
        $("#updateEvalList").html(textUpdateEvalList);
    });
}


/*
save = function() {
    var saveData;
    var saveFlag = true;
    var cnfrmInfo = { "dstbSerEvalVal":$("#dstbSerEvalVal").val()
            ,"driverStsfVal":$("#driverStsfVal").val()
            ,"carIssueHmVal":$("#carIssueHmVal").val()
            ,"carIssueMassVal":$("#carIssueMassVal").val()
            ,"otherCont":$("#otherCont").val()};

    if( saveFlag ){
        if( !confirm("<spring:message code='global.lbl.update' var='update' /><spring:message code='global.info.cnfrmMsg' arguments='${update},' />")){ // 수정 하시겠습니까?
            return;
        }

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

 */
</script>
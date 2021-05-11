<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <div class="content_title conttitlePrev">
            <h2 id="content_title_h2"><spring:message code="mob.lbl.sendSMS" /><!-- 고객검색조건 --></h2>
        </div>
        <section id="content_pop_search" class="content_pop_search">
               <div class="formarea">
                    <table class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                         <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custNm"  class="form_input" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /></th>
                                    <td>
                                        <div class="f_text"><div class="f_text"><input type="number" class="numberic" id="hpNo" class="form_input" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.tmplGrpList' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="smsTmplGrpId"  class="form_comboBox" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.template' /></th>
                                    <td>
                                        <div class="f_text"><input type="text" id=mesgTmplList  class="form_comboBox" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.mesgTxt' /> <spring:message code='global.lbl.cont' /></th>
                                    <td>
                                        <textarea rows="10" id="smsTmplMsg" onFocus="clearMessage();"  onKeyUp="txtLimit(this);"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                    <input type="hidden" id="custNoRequired" value="Y">
                </div>
                <div class="con_btnarea">
                    <span id="btnTransmission" class="btnd1"><spring:message code='global.btn.transmission' /><!-- 조회 --></span>
                </div>
            </section>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


<!-- script -->
<script>
//SMS템플릿그룹
var smsTmplGrpDs = [];
<c:forEach var="obj" items="${smsTemplateGroupList}">
    smsTmplGrpDs.push({text:"${obj.mesgTmplGrpNm}", value:"${obj.mesgTmplGrpId}"});
</c:forEach>

//팝업 설정값
var options = parent.sendSMSPopupWin.options.content.data;
var clearChk = true;        // 초기 메시지 클릭어 하기 위한 변수
var limitByte = 100;        //바이트의 최대크기, limitByte 를 초과할 수 없슴

//SMS템플릿그룹
var smsContextListDs = [];
    smsContextListDs.push(
            {text:"<spring:message code='global.lbl.hpNo' />", value:"$hpNo"}
            ,{text:"<spring:message code='global.lbl.custNm' />", value:"$custNm"}
    );

$(document).ready(function() {
    
    $("#custNm").val(options.custNm);
    $("#hpNo").val(options.hpNo);
    if ( dms.string.isNotEmpty(options.custNoRequired) ) {
        $("#custNoRequired").val(options.custNoRequired);
    }
    $("#mesgTmplList").kendoExtDropDownList({
        //dataSource:smsTmplDs
         dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
        , index:0
        , change:function(e){
            $("#smsTmplMsg").val(e.sender.dataSource.options.data[0].cont);
            
            if($("#mesgTmplList").data("kendoExtDropDownList").value() != ""){
                $("#smsTmplMsg").attr("readonly", true);    
            }else{
                $("#smsTmplMsg").val("");
                $("#smsTmplMsg").attr("readonly", false);
            }
            
        }
     });

 // 템플릿 - SMS
    $("#smsTmplGrpId").kendoExtDropDownList({
        dataSource:smsTmplGrpDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
        , index:0
        , change:function(e){

            // 전송 템플릿 초기화
            $("#smsTmplMsg").val("");
            $("#mesgTmplNo").val("");
            $("#smsTmplMsg").attr("readonly", false).removeClass('form_readonly');
            $("div[name=templeteBox]").removeClass("selected");
            $("#messageByte").html("0");
            //$("#btnSmsTransmission").data("kendoButton").enable(false);

            // 선택된 템플릿 메시지를 내용에 입력한다.
            var dataItem = this.dataItem(e.item);
            var value = dataItem.value;

            if ( dms.string.isNotEmpty(value) ) {

                var param = {
                        "sMesgTmplGrpId":dataItem.value
                };

                $.ajax({
                    url:"<c:url value='/crm/cmm/customerInfo/selectSmsTemplateList.do' />",
                    data:JSON.stringify(param),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    async:false,
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result, textStatus) {
                        
                        if(result.data.length == 0){
                            $("#mesgTmplList").data("kendoExtDropDownList").enable(false);
                        }else{
                            $("#mesgTmplList").data("kendoExtDropDownList").enable(true);
                            var smsTmplDs=[];
                            var smsTmplDsObj={};
                            for(var i=0; i<result.data.length; i++){
                                smsTmplDsObj.text=result.data[i].mesgTmplNm;
                                smsTmplDsObj.value=result.data[i].mesgTmplNo;
                                smsTmplDsObj.cont=result.data[i].mesgTmplCont;
                                smsTmplDs.push(smsTmplDsObj);
                            }
                            $("#mesgTmplList").data("kendoExtDropDownList").setDataSource(smsTmplDs);
                        }
                  
                    }
                });

            }

        }
    });
 
    $("#btnTransmission").bind("click", function(){
        if( dms.string.isEmpty($("#smsTmplMsg").val()) ){
            // {메세지}을(를) 입력해주세요.
            mob.notification.warning("<spring:message code='global.lbl.message' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
            return;
        };


        var velocityChk = velocityTxtChk();
        var smsConfirmMsg;

        if (velocityChk ) {
            // 발송확인하시겠습니까?
            smsConfirmMsg = "<spring:message code='crm.info.smsConfirm' />";

        } else {

            var smsSendMgs = $("#smsTmplMsg").val();
            smsSendMgs = smsSendMgs.replace("$custNm","张三");
            smsSendMgs = smsSendMgs.replace("$hpNo","010-00000000");

            smsConfirmMsg = "<spring:message code='crm.lbl.smsConfirmMsg1' /><br /><br />"; //템플릿으로 변환되지 않는 문자가 있습니다.
            smsConfirmMsg += "<spring:message code='crm.lbl.smsConfirmMsg2' /> " + smsSendMgs + " <spring:message code='crm.lbl.smsConfirmMsg3' />"; //으로 {0} 보내시겠습니까?

        };
        
        confirmOpen(smsConfirmMsg,'doSave',y,n);
        // 메시지 발송 confirm 
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        parent.sendSMSPopupWin.close();
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
function goMain() {
  //window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    parent.popupWindow.close();
}


//velocity에 선언되어있는 메시지인지 확인
function velocityTxtChk() {

    var smsTmplMsg = $("#smsTmplMsg").val()
      , firstIdx = smsTmplMsg.indexOf("$")
      , contextParamCheck = false
      , smsTmplMsgTxt
      , contextTxtArray
      , contextTxt
    ;

    if ( firstIdx > -1 ) {

        smsTmplMsgTxt = smsTmplMsg.slice(firstIdx);
        contextTxtArray = smsTmplMsgTxt.split("$");

        for(var i=1; i < contextTxtArray.length; i++){

            contextTxt = contextTxtArray[i];
            contextTxt = contextTxt.replace("{","");
            contextTxt = contextTxt.replace("}","");
            contextTxt = contextTxt.replace("\n","");

            contextParamCheck = contextValidation(contextTxt);

            if ( !contextParamCheck ) {
                return false;
            } else {
                contextParamCheck = true;
            }

        };

    } else {
        contextParamCheck = true;
    };

    return contextParamCheck;

};

function contextValidation (paramTxt) {

    var smsContextList = smsContextListDs
      , smsContextLength = smsContextListDs.length
      , contextText
      , contextCheck = false
      , subStrTxt
    ;

    if ( smsContextLength > 0 ) {

        for(var j=0; j < smsContextLength; j++){

            contextText = smsContextList[j].value.replace("$","");
            subStrTxt = paramTxt.slice(0,contextText.length);

            if ( contextText === subStrTxt ){
                return true;
            } else {
                contextCheck = false;
            };

        };

    };

    return contextCheck;

};

function doSave(){
    
    var params = {};

    params["contactBizCd"] = options.contactBizCd;
    params["custNoRequired"] = $("#custNoRequired").val();
    
    var insertSmsArr=[];
    var insertSmsObj={};
    insertSmsObj.custNm=$("#custNm").val();
    insertSmsObj.custNo=options.custNo;
    insertSmsObj.hpNo=options.hpNo;
    insertSmsObj.refKeyNm=options.refKeyNm;
    insertSmsArr.push(insertSmsObj);
    
    params["insertSms"] = insertSmsArr;
    params["mesgTmplNo"] = $("#mesgTmplList").data("kendoExtDropDownList").value();
    params["refKeyNm"] = options.refKeyNm;
    params["refTableNm"] = "CR_0101T";
    params["smsTmplMsg"] = $("#smsTmplMsg").val();
    params["smsTmplUserSeq"] = options.skip + options.take;
    params["smsTp"] = "N";
    
    $.ajax({
        url:"<c:url value='/crm/cmm/customerInfo/sendSmsMessage.do' />",      // SmsTmplUserController.java
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            mob.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {

            if ( jqXHR && textStatus === "success" ) {
                options.callbackFunc(textStatus);
                //mob.notification.success("<spring:message code='global.info.success'/>");
            } else {
                options.callbackFunc("FAIL");
                //mob.notification.success("<spring:message code='global.lbl.send'/>"+"<spring:message code='global.btn.failed'/>");
            }
            
           /*  if(data == "FAIL"){
                mob.notification.success("<spring:message code='global.lbl.send'/>"+"<spring:message code='global.btn.failed'/>");
            }else{
                mob.notification.success("<spring:message code='global.info.success'/>");
            } */
            
            $("#docu_prev").click();

        }
        ,beforeSend:function(xhr) {
            mob.loading.show();
        }
        ,complete:function(xhr, status) {
            mob.loading.hide();
            
        }
    });
}

//textarea byte 체크
var txtLimit = function(obj) {

    if(obj.value == null || obj.value.length == 0) return 0;

    var currLen = 0;
    var size = 0;
    var charCode, chr = null;
    for( var i = 0 ; i < obj.value.length ; i++ ) {

        chr = obj.value.charAt(i);
        charCode = chr.charCodeAt(0);

        if (charCode <= 0x00007F) size += 1; else       // 1
        if (charCode <= 0x0007FF) size += 1; else       // 2
        if (charCode <= 0x00FFFF) size += 1;            // 3
        else size += 1;                                 // 4
        // 바이트가 아닌 글자수 체크. 무조건 1byte 로 해서 100

        //console.log("charCode:",charCode+" | size:",size)
        if(size >= limitByte ){

            var rtnVal = "";

            for( var j = 0 ; j < currLen ; j++ ) {
                rtnVal += obj.value.charAt(j);
            }

            obj.value = rtnVal;
            // 텍스트를 {1000} 바이트 이상 작성할 수 없습니다.
            mob.notification.warning("<spring:message code='crm.info.mgsLimitSize' var='arguMsg' /><spring:message code='crm.info.mgsLimitInfo' arguments='${arguMsg}' />");
            return false;

        };

        currLen++;
    };

    // text 갯수
    //$('#messageByte').html(obj.value.length);
    $('#messageByte').html(size);

};
function clearMessage() {
    if ( clearChk ) {
/*         $("#smsTmplMsg").val("");
        clearChk = false */;
    }
};
</script>
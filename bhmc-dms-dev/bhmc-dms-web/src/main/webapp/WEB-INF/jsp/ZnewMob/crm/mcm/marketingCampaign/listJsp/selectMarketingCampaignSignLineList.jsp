<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title" id="signTitle">
        <h2>
            <spring:message code="crm.title.sign" />
            <!-- 결재 -->
        </h2>
        <div class="title_btn">
            <h2 id="btnSign" onclick="btnSign()" style = "display:none" >
                +
                <spring:message code="crm.title.sign" />
                <!-- 결재 -->
            </h2>
            &nbsp;&nbsp;<span id="flagBtnSign" class="co_open co_close"><span></span>
            </span>
        </div>
    </div>
    <div class="co_view" style="display: none;">
        <div class="subListarea">
            <!-- dlistitem  -->
            <div class="listhead dlistitem">
                <span style="width: 10%"><spring:message code='crm.lbl.abbreviationForNumber' /></span><!-- 번호 -->
                <span style="width: 20%"><spring:message code='global.lbl.result' /></span><!-- 결과 -->
                <span style="width: 23%"><spring:message code='crm.lbl.applyUsr' /></span> <!-- 승인자 -->
                <span style="width: 47%"><spring:message code='crm.lbl.cont' /></span> <!-- 의견 -->
            </div>
            <!--  리스트 삽입 -->
            <div>
                <div id="subListView2" style="height:200px; overflow:scroll"></div>
            </div>
        </div>
        <!-- 명세와 같은 html 태그 삽입 필요 02.25 18:00  -->
        <section id="layerPopup" class="lay_pop">
            <div class="lay_cont">
                <h2>
                    <spring:message code='crm.lbl.cont' />
                </h2>
                <textarea id="signCmt" data-json-obj="true"></textarea>
            </div>
            <div class="btnarea">
                <button type="button" class="btnd1" style="font-size:0.9em;"
                    onclick="layerClose2('#layerPopup')">
                    <spring:message code='global.btn.close' />
                    <!-- 닫기 -->
                </button>
                <dms:access viewId="VIEW-D-12903" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" onclick="btnEval()" id="btnEval" style="font-size:0.9em;"
                    class="btnd1">
                    <spring:message code='crm.btn.eval' />
                    <!-- 심사 -->
                </button>
                </dms:access>
                <dms:access viewId="VIEW-D-12902" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" onclick="btnReject()" style="font-size:0.9em;"
                    id="btnReject" class="btnd1">
                    <spring:message code='global.btn.appRollback' />
                    <!-- 반려 -->
                </button>
                </dms:access>
            </div>
        </section>
    </div>
</div>



<script type="text/x-kendo-template" id="subTemplate2">
<div class="dlistitem bgNone">
    <span style="width:10%">#:rnum+1 #<!-- 번호 --></span>
    <span style="width:20%">#:fnChangesignRslt(signRsltCd) # <!-- 결과 --></span>
    <span style="width:23%">#:trimNull(signUsrNm) # <!-- 승인자 --></span>
    <span style="width:47%">#:trimNull(signCont) # <!-- 의견 --></span>
</div>
</script>

<script type="text/javascript">

   // signList는 오직 단 하나만 선택 가능하다.
function check_only(chk){
    var obj = document.getElementsByName("chkbox");
    var data;
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
        else{
            data = obj[i];
        }
    }

    var statCd = data.nextElementSibling.nextElementSibling.value;
    var UsrNm = data.nextElementSibling.nextElementSibling.nextElementSibling.value;
    var LoginId = userId;

    if(UsrNm == LoginId && statCd == "02"){
        $("#btnSign").show();
    }
    else{
        $("#btnSign").hide();
    }
}

$("#btnSign").hide();

//var _url="";

/* // #apprDocNo의 역할은?? 결제 요청을 올리면 생기는 번호다. 즉, 이것이 존재한다는 말은 상태가 심사중이라는 뜻이다.
if($("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
    // 진짜 결재할 목록을 가져온다. (물론 로그인한 사용자의 id에 따라서 심사, 반려 버튼이 활성화/비활성화 되는건 마찬가지야~)
    // 요청자는 이제부터 심사 여부를 확인하기 위해서야)
     params["sSignDocNo"] = $("#apprDocNo").val();
    _url = "<c:url value='/mob/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
}else{
    // 기본 결재선 목록을 가져온다. (아직 안올렸어~)
    _url = "<c:url value='/mob/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
} */

var subListData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/crm/mcm/marketingCampaign/selectSignLineExs.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
            }
        ,parameterMap:function(options, operation){
            var params = {};
            params["sSignDocId"] = _signDocId;
            params["sSignDocNo"] = $("#apprDocNo").val();
            return kendo.stringify(params);
        }
    }
    ,batch:true
    ,change:function(e){
        $.each(e.items, function(index, obj) {
            var statCd = obj.signStatCd;
            var LoginId = userId;
            var UsrId = obj.signUsrId;
            var signDoclineNo = index;

            if(UsrId == LoginId && statCd == "02"){
                childData = obj;
                if(btnFlag){
                    $("#btnSign").show();
                }else{
                    $("#btnSign").hide();
                }
            }
        });
    }
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
            ,field:{
                rnum:{type:"number"}
            }
        }
    }
});

function fnChangesignStat(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = signStatCdObj[val];
    }
    return returnVal;
};

function fnChangesignRslt(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = signRsltCdObj[val];
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView2").kendoListView({
        dataSource:subListData2
        ,template:kendo.template($("#subTemplate2").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView2").css({"background-image":"none"});
            }
        }
    });
});
</script>
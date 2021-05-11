<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />




<div data-role="view">
    <ul data-role="listview" data-source="listData" data-template="list-template">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">

<!-- id 추가 예정 -->

<!--  <div class="checkitem bgNone">  -->

<!--    <span class="check"> -->
<!--         <input id="sign_#:rowIdx #" type="checkbox" name="chkbox" onclick="check_only(this)" class="f_check" /><label for="sign_#:rowIdx #"></label>   -->
<!--         <input type="hidden" name="signStatCd" value="#:signStatCd #" />   -->
<!--         <input type="hidden" name="signUsrId" value="#:signUsrId #" />   -->
<!--         <input type="hidden" name="signDocNo" value="#:signDocNo #" />   -->
<!--         <input type="hidden" name="signDocId" value="#:signDocId #"/>   -->
<!--    </span>   -->


<div class="dlistitem bgNone">

    <span style="width:10%">#:rowIdx #<!-- 번호 --></span>
    <span style="width:20%">#:fnChangesignRslt(signRsltCd) # <!-- 결과 --></span>
    <span style="width:23%">#:signUsrNm # <!-- 승인자 --></span>
    <span style="width:47%">#:signCont # <!-- 의견 --></span>
</div>



</script>

<script type="text/javascript">


/////////////////////////////////////////
//////////////결재 + show/hide//////////// 16:10 정주영
$("#signLineList").contents().find("input[name='chkbox']").each(function(cnt){

    alert("test!!");
    console.log("테스트중입니다");
    console.log(cnt);

    /* if($("#signLineList").contents().find("input[name='chkbox']")[cnt].checked == true){
               ;
    } */

});
//////////////////////////////////////////
//////////////////////////////////////////

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
    var LoginId = parent.userId;

    if(UsrNm == LoginId && statCd == "02"){
        console.log("클릭 가능")
        parent.$("#btnSign").show();

    }
    else{
        console.log("클릭 불가");
        parent.$("#btnSign").hide();
    }
}

    var pageIndex = 0;
    var pageSize = 100;
    var rowIndex = 0;
    var rowTotal = 1000;
    parent.$("#btnSign").hide();
    var listData = new kendo.data.DataSource({
        transport:{
            read:function(options) {
                if (rowIndex >= rowTotal) {
                    return;
                }

                app.showLoading();
                pageIndex++;

                var params = {};
                params["sort"]         = options.sort;
                params["sSignDocId"] = parent._signDocId;
                var _url="";

                // #apprDocNo의 역할은?? 결제 요청을 올리면 생기는 번호다. 즉, 이것이 존재한다는 말은 상태가 심사중이라는 뜻이다.
                if( parent.$("#apprDocNo").val() != null && parent.$("#apprDocNo").val() != "" ) {
                    // 진짜 결재할 목록을 가져온다. (물론 로그인한 사용자의 id에 따라서 심사, 반려 버튼이 활성화/비활성화 되는건 마찬가지야~)
                    // 요청자는 이제부터 심사 여부를 확인하기 위해서야)
                     params["sSignDocNo"] = parent.$("#apprDocNo").val();
                    _url = "<c:url value='/mob/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                }else{
                    // 기본 결재선 목록을 가져온다. (아직 안올렸어~)
                     //alert(parent.$("#apprDocNo").val());
                    _url = "<c:url value='/mob/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                }

                $.ajax({
                    url: _url
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        checklistCnt("detailList_noData", result.total, noDatamsg);
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;

                                // 심사평가의 null은 빈칸으로 대체한다.
                                if(row.signCont == null)
                                    row.signCont = "";

                                //console.log("실질 데이터");
                                //console.log(row);

                                data.push(
                                   {
                                    pageIdx:pageIndex,
                                    rowIdx:rowIndex,
                                    signStatCd:row.signStatCd,
                                    signRsltCd:row.signRsltCd,
                                    signUsrNm:row.signUsrNm,
                                    signCont:row.signCont,
                                    signDocNo:row.signDocNo,
                                    signUsrId: row.signUsrId,
                                    signDocId: row.signDocId,
                                    signDocLineNo: rowIndex
                                });

//                                 console.log("00000000000000000000000");
//                                 console.log(kendo.stringify(data));
                                $.each(data, function(index, obj) {
                                    var statCd = obj.signStatCd;
                                    var LoginId = parent.userId;
                                    var UsrId = obj.signUsrId;
                                    var signDoclineNo = index;
                                    //var iframeSignLineListHeight = parent.$("#signLineList").contents().find("body").height();

                                    if(UsrId == LoginId && statCd == "02"){
                                        parent.childData = obj;
                                        //parent.$("#flagBtnSign").show();
                                        if(parent.btnFlag){
                                            parent.$("#btnSign").show();
                                        }else{
                                            parent.$("#btnSign").hide();
                                        }


                                    }


                                });



                            });

                            // dlistitem으로 넘기는 것으로 추정 오후 5:22
                            options.success(data);
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", rowTotal);
                            //parent.setSubListHeightNew("detailList",1,rowTotal);
                        }
                        else {
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", 0);
                            //parent.setSubListHeightNew("detailList",1,0);
                        }


                    }
                });
            }
        },
        pageSize:pageSize,
        serverPaging:true,
        schema:{
            total:function(){ return rowTotal; }
        }
    });

    //var app = setKendoMobApp();
    var app = setKendoMobAppForNativeScroll();


    function fnChangesignStat(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.signStatCdObj[val];
        }
        return returnVal;
    };

    function fnChangesignRslt(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.signRsltCdObj[val];
        }
        return returnVal;
    };







</script>
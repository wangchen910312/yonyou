<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list" class="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='global.lbl.alarm' /><spring:message code='global.title.list' /></h2>
    </div>
    <div class="listarea">
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="deleteitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:70%">#:chgDate2DateTimeStr(mesgCreDt) #</span>
        <span class="check" style="width:30%">#: changeReceiveYn(receiveYn) #</span>
        <span class="clboth" style="width:100%">#:mesgCont #</span>
        <input type="hidden" name="_itemCd" value=#:mesgId #></span>
        <span class="delete" id="deleteItem">
            <span class="btn_del" name="deleteItem1" onclick="javascript:removeItem(this);"  #:delVisi(this) #>删除</span>
        </span>
    </div>
</script>

<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/cmm/alarm/selectAlarm.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    ,pageSize:pageSize
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
             ,fields:{
                rnum:{type:"number"}
            }
        }
    }
    ,change :function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            if(e.action == "remove"){

            }else{
                tempData.push.apply(tempData, this._data);
                listData._view=tempData;
            }
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});

delVisi = function(obj){
    var result = "";
    return result;
}

function msgDelBack(){
    var msgLi = $('.deleteitem').removeClass("delete");
    msgLi.children(".message").animate({left:0}, 400);
    msgLi.children(".delitem").animate({right:-80}, 400);
}


//조회후 조회된 데이터 bind처리
function alarmItemBinding(){
    var tapTimer, isTapHold = false;
    $('.deleteitem').bind('mousedown mouseup', function (event) {
        if(event.target.className =='btn_del'){
            return ;
        }
        var thisMsg = $(this);
        if (event.type == 'mousedown') {
            tapTimer = setTimeout(function () {
                isTapHold = true;
            }, 1000);
        } else {
            clearTimeout(tapTimer);
            if (!isTapHold) {
                var check = $(this).children(".check").text();
                var model = listData.getByUid($(this).attr(("data-uid")));
                setPushLayer(chgDate2DateTimeStr(model.mesgCreDt),model.mesgCont,model.mesgId,model.viewNm,model.viewUrlNm,check);


                $(this).children(".check").text("<spring:message code='global.btn.confirm' />");

                msgDelBack();
            }
            isTapHold = false;
        }
    });
}


function removeItem(obj){
    var data = {};
    data["mesgId"] = $(obj).parent().parent().find("input[name='_itemCd']").val();
    var itemCd = $(obj).parent().parent().find("input[name='_itemCd']").val();
    var _index;
    for(var i=0; i<listData._view.length; i++){
        if(listData._view[i].mesgId == itemCd){
            _index=listData._view[i].rnum-1;
            listData.remove(listData._view[listData._view[i].rnum-1]);
            //tempData.splice(_index,1);
            break;
        }
    }

    $.ajax({
        url:"<c:url value='/mob/cmm/alarm/deleteAlarm.do' />",
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify(data),
        error:function(jqXHR,status,error){

        },
        success:function(data){
            if("<spring:message code='global.btn.notConfirm' />" == $(this).children(".check").text()){
                var curCnt = parseInt($(".alarm_num").text());
                $(".alarm_num").text(curCnt + 1 );  //읽지않은 미확인 알림 삭제시 미확인 데이터 건수 한건 추가
            }

        }
    });

}


changeReceiveYn = function(val){
    var returnVal = "";
    if(val == "Y"){
        returnVal = "<spring:message code='global.btn.confirm' />";
    } else {
        returnVal = "<spring:message code='global.btn.notConfirm' />";
    }
    return returnVal;
};


function listViewClick(){
    alarmItemBinding();
}
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view" >
  <%--
  <ul data-role="listview" class="alarmlist" data-source="listData" data-endless-scroll="true" data-template="list-template" id="alarmListUL">
  --%>
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<%--
<div class="alarmitem" id="#: mesgId #">
--%>

    <div class="dlistitem">
        <span class="message">
            <span class="date">#: chgDate2DateTimeStr(mesgCreDt) #</span>
            <span class="" id="mesgContId" >#: mesgCont #</span>
        </span>
        <span class="check">#: changeReceiveYn(receiveYn) #</span>
        <span class="delitem"><spring:message code='global.btn.del' /></span>
    </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {
      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = options.sort;

      $.ajax({
          url:"<c:url value='/mob/cmm/alarm/selectAlarm.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              var data = [];
              rowTotal = result.total;

              //alert("KBS Loading page Success ["+pageIndex+"]");
              if (rowTotal > 0) {
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, mesgId:row.mesgId,
                          mesgCont:row.mesgCont, mesgTp:row.mesgTp, mesgCreDt:row.mesgCreDt, receiveUsrId:row.receiveUsrId,
                          sendYn:row.sendYn, receiveYn:row.receiveYn, receiveDt:row.receiveDt, viewId:row.viewId, viewNm:row.viewNm,
                          viewUrlNm:row.viewUrlNm});
                  });
              }

              options.success(data);

              //alert("KBS Loading page Success ["+pageIndex+"]");
              app.hideLoading();
              checklistCnt("listarea_noData",result.total,noDatamsg);
              alarmItemBinding();
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


function msgDelBack(){
    var msgLi = $('.alarmitem').removeClass("delete");
    msgLi.children(".message").animate({left:0}, 400);
    msgLi.children(".delitem").animate({right:-80}, 400);
}

function msgDelete(thisMsg){
    if(thisMsg.hasClass("delete") === true){
       msgDelBack();
    }
    else{
       msgDelBack();
       thisMsg.addClass("delete");
       thisMsg.children(".message").animate({left:-80}, 400);
       thisMsg.children(".delitem").animate({right:0}, 400);
    }
}
//조회후 조회된 데이터 bind처리
function alarmItemBinding(){
    //setup a timer and a flag variable
    var tapTimer, isTapHold = false;
    $('.alarmitem').bind('mousedown mouseup', function (event) {
        if(event.target.className =='btn_del'){
            return ;
        }
        var thisMsg = $(this);
        if (event.type == 'mousedown') {
            //set the timer to run the `taphold` function in three seconds
            tapTimer = setTimeout(function () {
                isTapHold = true;
                msgDelete(thisMsg);
            }, 1000);
        } else {
            //event.type == 'vmouseup'
            //clear the timeout if it hasn't yet occured
            clearTimeout(tapTimer);
            //if the flag is set to false then this is a `tap` event
            if (!isTapHold) {
                //this is a tap, not a tap-hold

                var check = $(this).children(".check").text();
                var model = listData.getByUid($(this).parent().attr(("data-uid")));
                parent.setPushLayer(chgDate2DateTimeStr(model.mesgCreDt),model.mesgCont,model.mesgId,model.viewNm,model.viewUrlNm,check);

                //미확인 목록 확인으로 수정
                if("<spring:message code='global.btn.notConfirm' />" == $(this).children(".check").text()){
                    $(this).children(".check").text('<spring:message code='global.btn.confirm' />');
                }

                msgDelBack();
            }
            //reset flag
            isTapHold = false;
        }
    });

    $('.alarmitem .delitem').click(function(){
        //$(this).parent().hide();  //delete로직구현
        var obj = $(this).parent();

        var data = {};
        data["mesgId"] = $(this).parent()[0].id;
      //삭제 테스트 임시로 주석 [S]
        $.ajax({
            url:"<c:url value='/mob/cmm/alarm/deleteAlarm.do' />",
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            data:JSON.stringify(data),
            error:function(jqXHR,status,error){
                console.log(jqXHR);
                alarmItemBinding();  //처리후 바인딩 다시 실행
            },
            success:function(data){
                ////$(this).parent().hide();  //delete로직구현
                var model = null;
                model = listData.getByUid(obj.parent().attr(("data-uid")));
                listData.remove(model);  //삭제시 선택 한 데이터 삭제 후 목록 데이터 refresh.
                $("#alarmListUL").data("kendoMobileListView").refresh();
                if("<spring:message code='global.btn.notConfirm' />" == $(this).children(".check").text()){
                    var curCnt = parseInt($(".alarm_num").text());
                    $(".alarm_num").text(curCnt + 1 );  //읽지않은 미확인 알림 삭제시 미확인 데이터 건수 한건 추가
                }
                alarmItemBinding(); //처리후 바인딩 다시 실행
            }
        });
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


//var app = new kendo.mobile.Application();
var app = setKendoMobApp();

</script>

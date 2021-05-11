<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view" >
  <ul data-role="listview"  data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" id="alarmListUL" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">

    <div class="deleteitem">
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

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {
      if (rowIndex >= rowTotal){
          return;
      }
      app.showLoading();
      pageIndex++;
      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;

      $.ajax({
          url:"<c:url value='/mob/cmm/alarm/selectAlarm.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              var data = [];
              rowTotal = result.total;
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
              app.hideLoading();
              checklistCnt("listarea_noData",result.total,noDatamsg);
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
        //console.log("event.type="+event.type);
        if (event.type == 'mousedown') {
            tapTimer = setTimeout(function () {
                isTapHold = true;
            }, 1000);
        } else {
            clearTimeout(tapTimer);
            //console.log("isTapHold="+isTapHold);
            if (!isTapHold) {
                var check = $(this).children(".check").text();
                var model = listData.getByUid($(this).parent().attr(("data-uid")));
                parent.setPushLayer(chgDate2DateTimeStr(model.mesgCreDt),model.mesgCont,model.mesgId,model.viewNm,model.viewUrlNm,check);

                //미확인 목록 확인으로 수정

                //console.log("check===="+$(this).children(".check").text());

                /* if("<spring:message code='global.btn.notConfirm' />" == $(this).children(".check").text()){

                    //console.log('111');
                    setTimeout(function () {
                        $(this).children(".check").text("<spring:message code='global.btn.confirm' />");
                    }, 200);

                    //console.log('222');


                } */

                $(this).children(".check").text("<spring:message code='global.btn.confirm' />");

                msgDelBack();
            }
            isTapHold = false;
            //$("#alarmListUL").data("kendoMobileListView").refresh();
        }
    });
}


function removeItem(obj){
    app.showLoading();
    var data = {};
    data["mesgId"] = $(obj).parent().parent().find("input[name='_itemCd']").val();
    var itemCd = $(obj).parent().parent().find("input[name='_itemCd']").val();
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        if($(item).find("input[name='_itemCd']").val() == itemCd){
             return false;
        }
        idx++;
    })
    listData.remove(listData._data[idx-1]);

    $.ajax({
        url:"<c:url value='/mob/cmm/alarm/deleteAlarm.do' />",
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify(data),
        error:function(jqXHR,status,error){
            //console.log(jqXHR);
            app.hideLoading();
        },
        success:function(data){
            var listView = $("#alarmListUL").data("kendoMobileListView");
            listView.refresh();

            if("<spring:message code='global.btn.notConfirm' />" == $(this).children(".check").text()){
                var curCnt = parseInt($(".alarm_num").text());
                $(".alarm_num").text(curCnt + 1 );  //읽지않은 미확인 알림 삭제시 미확인 데이터 건수 한건 추가
            }
            app.hideLoading();

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


var app = setKendoMobApp();
</script>

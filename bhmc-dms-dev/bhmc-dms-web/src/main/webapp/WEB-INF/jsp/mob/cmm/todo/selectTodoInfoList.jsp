<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="checkitem bgNone" id="listContentRow">
    <span class="check">
        <input id="isSave_#:rowIdx #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rowIdx #"></label>
    </span>
    <span style="width:100%" class="spanNormal">#:todoDesc #</span>
    <span style="width:50%; clear:both;" class="spanNormal" >#:chgDate2DateTimeStr(regDt) #</span>
    <span style="width:50%; text-align: center;" class="spanNormal">#:changeopenYnCdMap(openYn) #</span>
    <input type="hidden" name="todoNo" class="todoNo" value="#:todoNo #" >
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

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = options.sort;
      params["sOpenYn"] = parent.$("#sOpenYn").val();
      params["sHndlYn"] =  parent.$("#sHndlYn").val();
      /* params["sHndlYn"] = parent.$("#sHndlYn").val();
      params["sStartRegDt"] =chgDate(parent.$("#sStartRegDt").val());
      params["sEndRegDt"] = chgDate(parent.$("#sEndRegDt").val()); */


      $.ajax({
          url:"<c:url value='/mob/cmm/todo/selectTodo.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {

              checklistCnt("listarea_noData",result.total,noDatamsg);
              var data = [];
              rowTotal = result.total;
              var SerIndex=0, SalIndex=0, ParIndex=0, CrmIndex=0, ComIndex=0, AdmIndex=0;
              if (rowTotal > 0) {
                  $.each(result.data , function(i , row){
                      rowIndex++;

                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, hndlDt:row.hndlDt,
                          hndlUsrId:row.hndlUsrId, hndlYn:row.hndlYn, openDt:row.openDt, openUsrId:row.openUsrId,
                          openYn:row.openYn, regDt:row.regDt, regUsrId:row.regUsrId, rnum:row.rnum, todoDesc:row.todoDesc,
                          todoNo:row.todoNo, todoPolicyId:row.todoPolicyId, updtDt:row.updtDt, updtUsrId:row.updtUsrId});
                  });

              }

              options.success(data);
              app.hideLoading();


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

changeCatCdMap = function(val){
    if(isFromBoardMain=="Y"){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.arrCatCdMap[val].cmmCdNm;
        }
        return returnVal;
    }
};

/* function listViewClick(e)
{
    //parent.contentDetail(e.dataItem);
    $.ajax({
        url:"<c:url value='/cmm/nms/todoInfo/updateActionTodoInfo.do' />",
        data:"todoNo="+e.dataItem.todoNo,
        type:'POST',
        dataType:'json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {

            var viewId = jqXHR.viewId;
            var viewNm = jqXHR.viewNm;
            var viewUrl = jqXHR.viewUrl;
            var tCd = jqXHR.tCd;
            var viewParams = jqXHR.viewParams;
            var needReload = jqXHR.needReload;
            var needPostAction = jqXHR.needPostAction;

            //Todo 액션URL 메뉴 생성
            if(viewParams){
                viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + viewParams);
            }
            parent.goWhere(viewUrl);
        }
    });
} */
$(document).on("click", ".spanNormal", function(e){
    var tempTodoNo=$(this).siblings("input[name='todoNo']").val();

   $.ajax({
        url:"<c:url value='/cmm/nms/todoInfo/updateActionTodoInfo.do' />",
        data:"todoNo="+tempTodoNo,
        type:'POST',
        dataType:'json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {

            var viewId = jqXHR.viewId;
            if(typeof viewId !="undefined" || viewId==""){
                parent.mob.notification.none("");
                app.showLoading();
                var viewNm = jqXHR.viewNm;
                var viewUrl = jqXHR.viewUrl;
                var tCd = jqXHR.tCd;
                var viewParams = jqXHR.viewParams;
                var needReload = jqXHR.needReload;
                var needPostAction = jqXHR.needPostAction;


                //Todo 액션URL 메뉴 생성
                if(viewParams){
                    viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + viewParams);
                }
                parent.goWhere(viewUrl);
            }else{
                //app.hideLoading();
            }

        }
    });
});


changeopenYnCdMap = function(val){

    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.openYnCdMap[val].cmmCdNm;
    }
    return returnVal;
};


var app = setKendoMobApp();

</script>

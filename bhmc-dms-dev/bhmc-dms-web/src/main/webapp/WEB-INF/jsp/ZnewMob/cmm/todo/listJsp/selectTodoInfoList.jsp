<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list" class="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='global.title.workStatus' /><spring:message code='global.title.list' /></h2>
        <div class="title_btn">
            <span class="tbtn01" id="selAll"><spring:message code='global.btn.toggleSelectAll' /></span>
        </div>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:100%"><spring:message code="global.lbl.cont" /></span>
            <span style="width:50%"><spring:message code="global.lbl.carRegDt" /></span>
            <span style="width:50%; text-align: center;"><spring:message code='global.lbl.complete' /></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
<div class="checkitem bgNone" id="listContentRow" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="display:none;">#:rnum #</span>
    <span class="check">
        <input id="isSave_#:rnum #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rnum #"></label>
    </span>
    <span style="width:100%" class="spanNormal">#:todoDesc #</span>
    <span style="width:50%; clear:both;" class="spanNormal" >#:chgDate2DateTimeStr(regDt) #</span>
    <span style="width:50%; text-align: center;" class="spanNormal">#:changehndlYnCdMap(hndlYn) #</span>
    <input type="hidden" name="todoNo" class="todoNo" value="#:todoNo #" >
</div>
</script>

<script>
var viewRow=30;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/cmm/todo/selectTodo.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                //params["sOpenYn"] = $("#sOpenYn").val();
                params["sHndlYn"] =  $("#sHndlYn").val();
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
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});

changeCatCdMap = function(val){
    if(isFromBoardMain=="Y"){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = arrCatCdMap[val].cmmCdNm;
        }
        return returnVal;
    }
};
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
                mob.notification.none("");
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
                goWhere(viewUrl);
            }else{
            }

        }
    });
});

//상세페이지 보기
function listViewClick(obj) {
  /* $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_detail").css("display","block");
  $("#header_title span").removeAttr("class");

  $("#openYn").val(openYnCdMap[obj.openYn].cmmCdNm);
  $("#hndlYn").val(hndlYnCdMap[obj.hndlYn].cmmCdNm);
  $("#todoDesc").val(obj.todoDesc);

  $("#detailCloseBtn").show();
  if(obj.openYn == "N"){
      $.ajax({
          url:"<c:url value='/mob/cmm/todo/updateTodoInfoOpen.do'/>"
         ,data:JSON.stringify(obj.todoNo)
         ,type:'POST'
         ,dataType:'json'
         ,contentType:'application/json'
         ,async:false
         ,success:function(result) {
             console.log(result);
         }
         ,error:function(jqXHR,status,error) {
             return false;
         }
     });
  } */

}
changehndlYnCdMap = function(val){

    var returnVal = "";
    if(val != null && val != ""){
        returnVal = hndlYnCdMap[val].cmmCdNm;
    }
    return returnVal;
};
changeopenYnCdMap = function(val){

    var returnVal = "";
    if(val != null && val != ""){
        returnVal = openYnCdMap[val].cmmCdNm;
    }
    return returnVal;
};
</script>

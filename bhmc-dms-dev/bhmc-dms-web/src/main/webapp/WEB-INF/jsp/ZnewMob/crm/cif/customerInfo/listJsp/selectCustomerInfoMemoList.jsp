<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="crm.lbl.remark" /><!-- 비고 --></h2>
        <div class="title_btn">
            <dms:access viewId="VIEW-D-12763" hasPermission="${dms:getPermissionMask('READ')}">
            <span class="tbtn" id="btnAddMemo"><spring:message code="global.btn.add" /><!-- 추가 --></span>
            </dms:access>
            <span class="co_open co_close" id="btnMemoSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:30%"><spring:message code="global.lbl.no" /><!-- 번호 --></span>
                <span style="width:35%"><spring:message code="global.lbl.type" /><!-- 유형 --></span>
                <span style="width:35%"><spring:message code="global.lbl.shareYn" /><!-- 공개여부--></span>
                <span class="clboth" style="width:30%"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></span>
                <span style="width:65%"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></span>
                <span class="clboth" style="width:100%"><spring:message code="crm.lbl.remark" /><!-- 비고 --></span>
            </div>
            <div>
                <div id="subListView14" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate14">
<div class="deleteitem">
    <span style="width:30%">#:trimNull(rnum) #</span>
    <span style="width:35%">#:memoTpChg(memoTp) #</span>
    <span style="width:35%">#:trimNull(shareYn) #</span>
    <span class="clboth" style="width:30%">#:trimNull(usrNm) #</span>
    <span style="width:65%">#:chgDateFormat(regDt) #</span>
    <span class="clboth" style="width:100%">#:trimNull(memoCont) #</span>
    <span class="delete">
        <span class="btn_del" onclick="javascript:memoRemoveItem(this);" #:delVisi(this) #>삭제</span>
    </span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData14 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/mob/crm/cif/customerInfo/selectCustomerMemo.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {

              var params = {};
              params["sDlrCd"] = $("#dlrCd").val();
              params["sCustNo"] = $("#custNo").val();
              params["sMngScId"] = $("#mngScId").val();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"rnum"
              ,fields:{
                 rnum:{type:"number" , editable:false}
               , memoTp:{type:"string", validation:{required:true} , editable:true}
               , memoCont:{type:"string", validation:{required:true} , editable:true}
               , shareYn:{type:"string", editable:true}
               , regDt:{type:"date", editable:false}         // 등록일
               , custNo:{type:"string", editable:false}
               , dlrCd:{type:"string", editable:false}
               , updtDt:{type:"date", editable:false}         // 수정일
               , usrNm:{type:"string", editable:false}
               , regUsrId:{type:"string", editable:false}
           }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView14").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("memoList",2,rTotal);
      }else{
          setSubListHeightNew("memoList",2,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//유형
memoTpChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = memoTpMap[val];
    }
    return returnVal;
};

delVisi = function(obj){
};

//추가
function memoAddItemSubList1(data){
console.log(data);
    var subListView14 = $("#subListView14").data("kendoListView");

    subListView14.dataSource.insert({
        "memoTp"            :data.memoTp
        , "memoCont"        :data.memoCont
        , "shareYn"         :data.shareYn
        , "custNo"          :$("#custNo").val()            // 고객번호
        , "rnum"            :data.rnum
        ,"usrNm"            :""
        ,"regDt"            :chgDate(data.regDt)
    });
    //저장
    confirmOpen(confirmMsgSave,'saveMemoList',y,n);
}

//삭제
function memoRemoveItem(obj){
    var uid = $(obj).parent().parent().attr("data-uid");
    var idx = 0;
    $(obj).parent().parent().parent().find(".deleteitem").each(function(index, item){
        if($(item).attr("data-uid") == uid){
            return false;
        }
        idx++;
    });
    subListData14.remove(subListData14.data()[idx]);

    //저장
    confirmOpen(confirmMsgSave,'saveMemoList',y,n);
}

chgDateFormat = function(val){
    var returnVal;
    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm');
    }else{
        returnVal = '';
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView14").kendoListView({
        dataSource:subListData14
        ,template:kendo.template($("#subTemplate14").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView14").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView14").css({"background-image":"none"});
            }
        }
    });
});

</script>

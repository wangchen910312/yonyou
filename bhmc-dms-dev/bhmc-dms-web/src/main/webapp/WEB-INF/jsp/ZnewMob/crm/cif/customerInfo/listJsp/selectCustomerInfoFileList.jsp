<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.attachedFile' /><!-- 첨부파일 --></h2>
        <div class="title_btn">
            <span class="co_open" id="btnFileSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:70%"><spring:message code='global.lbl.fileNm' /><!-- 파일명 --></span>
                <span style="width:30%"><spring:message code='global.lbl.fileSize' /><!-- 크기 --></span>
            </div>
            <div>
                <div id="subListView16" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate16">
<div class="deleteitem">
    <span style="width:70%">#:fileNm #파일명</span>
    <span style="width:30%">#:fileSize #크기</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData16 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/mob/cmm/sci/fileUpload/selectFiles.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["sFileDocNo"] = $("#docId").val();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"fileDocNo"
          ,fields:{
              fileDocNo:{type:"string", editable:false}
              ,fileNo:{type:"number", editable:false}
              ,fileNm:{type:"string", editable:false}
              ,fileSize:{type:"number", editable:false}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView16").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("fileList",1,rTotal);
      }else{
          setSubListHeightNew("fileList",1,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});


$(document).ready(function(){
    $("#subListView16").kendoListView({
        dataSource:subListData16
        ,template:kendo.template($("#subTemplate16").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView16").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView16").css({"background-image":"none"});
            }
        }
    });
});

</script>

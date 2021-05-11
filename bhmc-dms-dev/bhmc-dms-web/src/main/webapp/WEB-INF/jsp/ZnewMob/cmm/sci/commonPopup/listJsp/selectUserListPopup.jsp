<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_pop_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_pop_list_title"><spring:message code='cmm.lbl.user.searchList' /></h2>
    </div>
    <div class="listarea01">
        <div class="dlistitem listhead">
            <span style="width:30%"><spring:message code="global.lbl.usrId" /></span>
            <span style="width:40%"><spring:message code="global.lbl.usrNm" /></span>
            <span style="width:30%"><spring:message code="global.lbl.empNo" /></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll;"></div>
    </div>
    <div class="con_btnarea">
        <span class="btnd1" id="btnSelect"><spring:message code="global.btn.select" /><!-- 선택 --></span>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" id="listContentRow" onclick="listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:30%">#:usrId #</span>
    <span style="width:40%">#:usrNm #</span>
    <span style="width:30%">#:trimNull(empNo) #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["sUsrId"] = $("#sUsrId").val();
              params["sUsrNm"] = $("#sUsrNm").val();
              params["sEmpNo"] = $("#sEmpNo").val();
              params["sDelYn"] = 'N';
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  //,pageSize:pageSize
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
      $("#content_pop_search").hide();
      $("#content_pop_list").show();
      $("#header_title span").attr("class","search_open");
  }
});


function listViewClick(dataItem)
{
    contentCommonDetail(dataItem);

    var curRow = dataItem.rnum - 1;
    $('#listView .dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

$(document).ready(function(){
    $("#listView").kendoListView({
        dataSource:listData
        ,template:kendo.template($("#template").html())
        ,autoBind:true
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $(this).css(
                    {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                        ,"background-repeat":"no-repeat"
                        ,"background-position":"center"});
            }else{
                $(this).css(
                        {"background-image":"none"});
            }
        }
    });

    /* $("#listView").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal>pageSize){
            pageSize+=viewRow;
            pageIndex+=viewRow;
            $(this).data('kendoListView').dataSource.read();
        }
    }); */

    $("#listView").height($(window).height()-($("#header").outerHeight()+$(".content_title").outerHeight()+$(".listhead").outerHeight()+$(".btnfixed").outerHeight()+$(".con_btnarea").outerHeight()));
});

</script>

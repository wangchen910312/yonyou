<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title" id="carHistTitle">
        <h2>
            <spring:message code="global.title.goal" />
            <!-- 목표 -->
        </h2>
        <div class="title_btn">
            <span class="co_open co_close"><span></span> </span>
        </div>
    </div>
    <div class="co_view" style="display: none;">
        <div class="subListarea">
            <div class="listhead dlistitem">
                <span style="width: 15%"><spring:message
                        code="global.lbl.no" /> <!-- 번호 --> </span> <span
                    style="width: 50%"><spring:message
                        code="global.lbl.targ" /> <!-- 목표 --> </span> <span
                    style="width: 35%"><spring:message
                        code="global.lbl.targCntVal" /> <!-- 목표수치 -->
                </span>
            </div>
            <div>
                <div id="subListView" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>



<script type="text/x-kendo-template" id="subTemplate">
<div class="dlistitem bgNone">
    <span style="width:15%">#:rnum #</span>
    <span style="width:50%">#:targNm #</span>
    <span style="width:35%">#:targCntVal #</span>
</div>
</script>

<script type="text/javascript">
var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/crm/mcm/marketingCampaign/selectGoals.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation){
            var params = {};
            params["sDlrCd"] = $("#sDlrCd").val();
            params["sMakCd"] = $("#sMakCd").val();
            return kendo.stringify(params);
        }
    }
    ,batch:true
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

$(document).ready(function(){
   $("#subListView").kendoListView({
      dataSource:subListData
      ,template:kendo.template($("#subTemplate").html())
      ,autoBind:false
      ,dataBinding: function(e) {
          if(e.items.length == 0){
              $("#subListView").css(
                      {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                          ,"background-repeat":"no-repeat"
                          ,"background-position":"center"});
          }else{
              $("#subListView").css({"background-image":"none"});
          }
      }
   });
});
</script>
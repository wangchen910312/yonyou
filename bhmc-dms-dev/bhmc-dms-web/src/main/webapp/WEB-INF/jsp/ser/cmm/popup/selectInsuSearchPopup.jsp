<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<style type="text/css"> 
.btn_mm{
    display: inline-block;
    height: 27px;
    margin-left: 1px;
    box-sizing: border-box;
    background-color: rgb(255, 255, 255);
    background-position-y: 0px;
    box-shadow: none;
    color: rgb(10, 111, 194);
    font-weight: bold;
    line-height: 25px;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: url(../img/ico_basic.png) !important;
    background-position-x: 12px !important;
    padding: 0px 10px 0px 10px;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(206, 220, 238);
    border-image: initial;
    border-radius: 14px;
    background-repeat: no-repeat;
    } 
</style> 
<!-- content -->
<section id="window" class="pop_wrap"  >
   <!-- pad端增加选择按钮 贾明 2018-11-14 -->
       <div class="header_area" >
        <div class="btn_right" id="btnSel" style="display:none">
            <button type="button" id="btnSelect" class="btn_mm" ><spring:message code="global.btn.select" /></button>
        </div>
    </div>
   
    <!-- 조회 조건 종료 -->
    <!-- 그리드 시작 table_grid mt10-->
    <div class="table_grid mt1">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">

 var isTablet = "false"
//공통코드:예약구분
var insuList = [];
var rnum = 1;
<c:forEach var="obj" items="${insuList}">
  <c:if test="${obj.useYn eq 'Y'}">
  insuList.push({"rnum":rnum , "incCmpCd":"${obj.cmmCd}", "incCmpNm":"${obj.cmmCdNm}" });
  rnum++;
  </c:if>
</c:forEach>


$(document).ready(function(){
  
    var parentJsonData = parent.insurancePopup.options.content.data;
   isTablet = parentJsonData.isTablet;
   if("true"==isTablet){
      $("#btnSel").attr("style","display:block;");//显示div
   }
   
  // console.log("ere",parentJsonData.isTablet);
  //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
           // $('#grid').data('kendoExtGrid').dataSource.page(1);
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });



  // Grid 더블클릭 이벤트
    $("#grid").on("dblclick","tr.k-state-selected", function(e){
       $("#btnSelect").click();
  });
  
  //
$("#btnSelect").kendoButton({
        click:function(e){
      //console.log("erewqss");
      var grid = $("#grid").data("kendoExtGrid");
      var rows = grid.select();
      var selectedVal = grid.dataItem(rows);
      if(rows.length == 0 ){
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
       }
   if(rows != null){
        var data = [];
         $.each( rows  , function(idx , obj){
          data.push(grid.dataItem(obj));
         });

        parentJsonData.callbackFunc(data);
        parent.insurancePopup.close();
     }
   
 }});
        
  //console.log("数据",insuList);
  //그리드 설정
    $("#grid").kendoExtGrid({
      gridId:"G-SER-1101-00001"
      /*
      ,dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/ser/ins/insurance/selectInsuPopup.do' />"
              }
              ,parameterMap:function(options , operation){
                  if(operation == "read"){

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"]          = options.page;
                      params["firstIndex"]         = options.skip;
                      params["lastIndex"]          = options.skip + options.take;
                      params["sort"]               = options.sort;

                      params["sIncCmpNm"]          = $("#sIncCmpNm").val();
                      params["sIncUsrNm"]          = $("#sIncUsrNm").val();

                      return kendo.stringify(params);

                  }else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
         ,schema:{
             model:{
                 id:"rnum"
                ,fields:{
                    incCmpNm    :{type:"string" ,editable:false , validation:{required:true}}
                   ,incCmpCd    :{type:"string" ,editable:false , validation:{required:true}}

                 }
             }
         }
      }
     */
     ,dataSource: insuList
     ,selectable:"row"
     ,height:260
     ,editable : false
     ,navigatable:false
     ,pageable:false
     ,filterable:false                 // 필터링 기능 사용안함
     ,columns:[
          {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
         ,{field:"incCmpNm", title:"<spring:message code='ser.lbl.incCmpNm' />", width:170, sortable:false, attributes:{"class":"al"}}
         ,{field:"incCmpCd", title:"<spring:message code='ser.lbl.incCmpCd' />", width:100, sortable:false, attributes:{"class":"ac"}, hidden:true}
         ]
    });

});


</script>



<!-- //content -->
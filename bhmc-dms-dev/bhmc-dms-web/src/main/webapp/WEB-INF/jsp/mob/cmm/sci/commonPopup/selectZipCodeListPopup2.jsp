<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem bgNone" id="listContentRow">
    <span style="width:100%">#:cityNm #</span>
    <span style="width:50%; display:none;">#:cityCd #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var sungCd="${sungCd}";
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
                    
          params["sungCd"] = "${sungCd}";
          
          console.log("params ::",params);
          $.ajax({
              url:"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
              ,data:JSON.stringify(params)
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR, status, error) {
                  app.hideLoading();
              }
              ,success:function(result) {
                  checklistCnt("listarea_noData",result.total,noDatamsg);
                  if(result.data!=null && result.data != ""){
                      var data = [];

                      rowTotal = result.data.length;
                      $.each(result.data , function(i , row){
                          rowIndex++;
                          data.push({
                              cityCd:row.cityCd,
                              cityNm:row.cityNm,
                            });
                      });

                      options.success(data);
                      app.hideLoading();
                  }else{
                      app.hideLoading();
                  }
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


/* var listData = new kendo.data.DataSource({
    transport:{
        read:function(options) {

          if (rowIndex >= rowTotal){
              return;
          }
          app.showLoading();
          pageIndex++;

          var params = {};
                    
          params["sSungNm"] = parent.sSungNm;
          params["sCityNm"] = parent.sCityNm;
          params["sDistNm"] = parent.sDistNm;
          
          console.log("params ::",params);
          
          $.ajax({
              url:"<c:url value='/cmm/sci/zipCode/selectZipCodes.do' />"
              ,data:JSON.stringify(params)
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR, status, error) {
                  app.hideLoading();
              }
              ,success:function(result) {
                  checklistCnt("listarea_noData",result.total,noDatamsg);
                  if(result.data!=null && result.data != ""){
                      var data = [];

                      rowTotal = result.total;
                      $.each(result.data , function(i , row){
                          rowIndex++;
                          data.push({
                              sungCd:row.sungCd,
                              sungNm:row.sungNm,
                              cityCd:row.cityCd,
                              cityNm:row.cityNm,
                              distCd:row.distCd,
                              distNm:row.distNm,
                              zipCd:row.zipCd,
                              extZipCd:row.extZipCd
                            });
                      });

                      options.success(data);
                      app.hideLoading();
                  }else{
                      app.hideLoading();
                  }
              }
          });
        }
    },
    pageSize:pageSize,
    serverPaging:true,
    schema:{
      total:function(){ return rowTotal; }
    }
}); */

// datasource below is customized for demo purposes.
/* var listData = new kendo.data.DataSource({

    transport:{
        read:{
            url:"<c:url value='/cmm/sci/zipCode/selectZipCodes.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {

                var params = {};

                // <c:url value='/cmm/sci/zipCode/selectZipCodes.do' />
                // 위 컨트롤러를 따라가 최종적으로 어떤 SQL 문이 실행되는 지 파악한다.
                // 그리고 각 경우의 수를 나누어 적용할 수 있는지를 파악한다.
                // EX) 1. sung만 선택, 2. sung, city 선택, 3. sung, city, dist 모두 선택

                params["recordCountPerPage"] = options.pageSize;
                params["pageIndex"] = options.page;
                params["firstIndex"] = options.skip;
                params["lastIndex"] = options.skip + options.take;
                params["sort"] = options.sort;

                // 기존 코드(방식 변경에 따른 주석 처리: 정주영)
                

                // 변경 필요 내용 03.03 11:02 정주영
                // 1. sung, city, dist 각각의 Nm 을 params 에 담아 던진다.
                // 2. controller 변경
                // 3. services impl, dao, mapper 변경(추가된 위의 params을 검색 조건으로 이용할 수 있도록 유도한다. )

                // 작성한 코드 03.04 14:09 정주영
                params["sSungNm"] = parent.sSungNm;
                params["sCityNm"] = parent.sCityNm;
                params["sDistNm"] = parent.sDistNm;

                // 값 제대로 들어 오는지 확인해야 한다.
                return kendo.stringify(params);

            }
        }
        
    }
    ,batch:true
    ,pageSize:pageSize
    ,serverPaging:true
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"zipCd"
            ,fields:{
                rnum:{type:"string", editable:false}
                ,sungCd:{type:"string", validation:{required:true}, editable:false}
                ,sungNm:{type:"string", validation:{required:true}, editable:false}
                ,cityCd:{type:"string", validation:{required:true}, editable:false}
                ,cityNm:{type:"string", validation:{required:true}, editable:false}
                ,distCd:{type:"string", validation:{required:true}, editable:false}
                ,distNm:{type:"string", validation:{required:true}, editable:false}
                ,zipCd:{type:"string", validation:{required:true}, editable:false}
                ,extZipCd:{type:"string", editable:true, editable:false}
            }
        }
    }
    ,dataBound:function(e) {
        console.log(e);
        console.log("dataBound------------------------");
    }


}); */

function listViewClick(e)
{
    var dataItem = e.dataItem; 
    //changeSetCity( dataItem.sungCd );
    $(e.item[0]).siblings().children(".dlistitem").attr('style', 'background-color: white !important');
    $(e.item[0]).children(".dlistitem").attr('style', 'background-color: #1b8deb !important');
    parent.$("#comonPopupList3").attr("src", "<c:url value='/mob/cmm/sci/commonPopup/selectZipCodeListPopup3.do?cityCd="+dataItem.cityCd+"&sungCd="+sungCd+"' />");
    parent.contentCommonDetail(2,e.dataItem);

    var curRow = e.dataItem.rowIdx - 1;
    $('.dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

//changeSet city
/* function changeSetCity( sungCd ){

  var arrCity = dms.ajax.getJson({
      url:"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
      ,data :JSON.stringify({"sungCd":sungCd})
      ,async :false
  });
  return arrCity;
}
 */
var app = setKendoMobApp();

</script>

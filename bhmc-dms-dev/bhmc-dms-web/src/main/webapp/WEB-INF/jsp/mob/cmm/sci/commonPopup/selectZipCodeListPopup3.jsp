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
    <span style="width:100%">#:distNm #</span>
    <span style="width:50%; display:none;">#:distCd #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var sungCd="${sungCd}";
var cityCd="${cityCd}";
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
                    
          params["sungCd"] = sungCd;
          params["cityCd"] = cityCd;
          
          console.log("params ::",params);
          $.ajax({
              url:"<c:url value='/sal/cnt/contractMnt/selectDist.do' />"
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
                              distCd:row.distCd,
                              distNm:row.distNm,
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

function listViewClick(e)
{
    var dataItem = e.dataItem; 
    $(e.item[0]).siblings().children(".dlistitem").attr('style', 'background-color: white !important');
    $(e.item[0]).children(".dlistitem").attr('style', 'background-color: #1b8deb !important');
    parent.contentCommonDetail(3,e.dataItem);
    
    var _params ={};
    _params["sSungNm"] = parent.sungNmGet.replace("/","");
    _params["sCityNm"] = parent.cityNmGet.replace("/","");
    _params["sDistNm"] = dataItem.distNm.replace("/","");
    
    $.ajax({
        url:"<c:url value='/cmm/sci/zipCode/selectZipCodes.do' />"
        ,data:JSON.stringify(_params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            app.hideLoading();
        }
        ,success:function(result) {
            checklistCnt("listarea_noData",result.total,noDatamsg);
            if(result.data!=null && result.data != ""){
                parent.setDataItem=result.data[0];//한건밖에 없다.
            }else{
            }
        }
    });
    
    /* $('.dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    }); */
}


var app = setKendoMobApp();

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem">
            <span style="width:35%">#:trimNull(itemCd) #</span>
            <span style="width:65%">#:trimNull(itemNm)  #</span>
            <span class="clboth" style="width:35%" id="pre_userdb">#:trimNull(giTp)  #</span>
            <span style="width:35%">#:trimNull(itemQty) #/#:trimNull(calcUnitCd)  #</span>
            <span style="width:30%">#:chgInt(itemPrc) #/#:chgInt(expcParAmt) #</span>
        </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

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
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;
      params["sRoDocNo"] = parent.$("#roDocNo").val();

      $.ajax({
          url:"<c:url value='/mob/ser/ro/workHistory/selectRepairOrderParts.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;

                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          roDocNo:row.roDocNo,
                          roTp:row.roTp,
                          giTp:row.giTp,
                          itemCd:row.itemCd,
                          itemNm:row.itemNm,
                          itemQty:row.itemQty,
                          calcUnitCd:row.calcUnitCd,
                          itemPrc:row.itemPrc,
                          expcParAmt:row.expcParAmt
                      });
                  });
                  options.success(data);

                  if(result.total > 0){
                      //alert(roTpCdChange(result.data[0].roTp));
                      parent.$("#roTp").val(roTpCdChange(result.data[0].roTp));
                  }
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  parent.setSubListHeight("itemList",rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("itemList",0);
              }


              //$("#listview").kendoTouch({ enableSwipe:true, swipe:function(e){console.log(e);}});


              $("#listview").kendoTouch({
                 //enableSwipe:true,
                 //enableDrag:true,
                 //swipe:function(e){
                 //tap:function(e){
                 drag:function(e){
                    //getEventInfo;

                    console.log(e);
                    //var touch = e.touch;
                    /*
                    var x = touch.x;
                    var y = touch.y;

                    console.log(x.location);
                    console.log(y.location);

                    console.log(y.startLocation);
                    console.log(y.delta);

                    console.log(y.client);
                    */


                    //$('html, body', window.parent.document).animate({scrollTop:scrollTop-10}, 'slow');
                    //$('html, body', window.parent.document).animate({scrollBottom:yAxis.location}, 'slow');

                 }
              });


/*
$("#test").swipe( {
            //Generic swipe handler for all directions
            swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
                $(this).children("#text").text("You swiped " + direction + distance );
            },
            //Default is 75px, set to 0 for demo so any distance triggers swipe
           threshold:0,
           allowPageScroll:"vertical"
        });
        */





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
    //parent.contentDetail(e.dataItem.itemCd);
    //var position = $("#itemList", parent.document).offset();

    //$('html, body', window.parent.document).animate({scrollTop:position.top}, 'slow');
}


roTpCdChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
}








//var app = setKendoMobApp();
//var app = new kendo.mobile.Application($(document.body),{platform:"android-light", useNativeScrolling:true});
var app = setKendoMobAppForNativeScroll();




</script>

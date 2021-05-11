<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.addr' /><!-- 주소 --></h2>
        <div class="title_btn">
        <!--  주석 해제 03.02 08:58 정주영 -->
        <dms:access viewId="VIEW-D-13110" hasPermission="${dms:getPermissionMask('READ')}">
            <span class="tbtn" id="btnAddAddress" ><spring:message code="global.btn.add" /><!-- 추가 --></span>
        </dms:access>
            <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:35%"><spring:message code='global.lbl.selectAddr' /><!-- 우편주소 --></span>
                <span style="width:35%"><spring:message code='global.lbl.type' /><!-- 유형 --></span>
                <span style="width:100%"><spring:message code='crm.lbl.addr1' /><!-- 소재지 주소 --></span>
                <span class="clboth" style="width:100%"><spring:message code='global.lbl.detlAddr' /><!-- 상세주소 --></span>
            </div>
            <div>
                <div id="subListView" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
<div class="deleteitem" onclick="javascript:subListViewClick(subListData._view[#:rnum-1 #],this, #:rnum-1 #);">
    <span style="width:35%" class="checkImg"></span>
    <span style="width:35%">#:addrTpchg(addrTp)#</span>
    <span style="width:100%">#:trimNull(sungNm) # / #:trimNull(cityNm) # / #:trimNull(distNm)#</span>
    <span class="clboth" style="width:100%">#:trimNull(addrDetlCont)#</span>
    <span class="delete">
        <span class="btn_del" onclick="javascript:addrRemoveItem(this);" ><spring:message code='global.lbl.del' /></span>
    </span>
</div>
</script>
<script>
//시스템 날짜 정보 가져오기.
var _rowTotal=0;

var subListData = new kendo.data.DataSource({
      transport:{
          read:{
              url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
              ,dataType:"json"
              ,type:"POST"
              ,contentType:"application/json"
          }
          ,parameterMap:function(options, operation) {
              if (operation === "read") {
                  var params = {};
                  var refTableNm  = "";
                  var refKeyNm = "";
                  if(document.location.href.indexOf("ShowRoom") > -1){
                      //전시장흐름
                      refTableNm = "CR_0214T";
                      refKeyNm = $("#seq").val();
                  }else if (document.location.href.indexOf("selectStep04PrevSalesOpptShowRoomPopup.jsp") > -1 ){
                      //전시장흐름 데이터가 실패일 경우
                      refTableNm = "CR_0211T";
                      refKeyNm = $("#seq").val();
                  }else{
                      refTableNm = "CR_0101T";
                      refKeyNm = $("#custNo").val();
                  }
                  params["sRefTableNm"] = refTableNm;
                  params["sRefKeyNm"] = refKeyNm;

                  return kendo.stringify(params);
              }
          }
      }
      ,batch:true
      ,schema:{
          data:"data"
          ,total:"total"
          ,model:{
              id:"seq"
              ,fields:{
                  seq:{type:"string", editable:false}
                  ,rnum:{type:"number"}
                  ,useYn:{type:"string", editable:true}
                  ,addrTp:{type:"string", editable:true}
                  ,zipCd:{type:"string", editable:false}
                  ,sungCd:{type:"string", editable:false}
                  ,cityCd:{type:"string", editable:false}
                  ,distCd:{type:"string", editable:false}
                  ,sungNm:{type:"string", editable:false}
                  ,cityNm:{type:"string", editable:false}
                  ,distNm:{type:"string", editable:false}
                  ,addrNm:{type:"string", editable:true}
                  ,addrDetlCont:{type:"string", editable:true}
                  ,flagYn:{type:"string", editable:true}
                  ,refTableNm:{type:"string", editable:false}
                  ,refKeyNm:{type:"string", editable:true}
              }
          }
      },
      change:function(e) {
          if(e.action != "remove"){
              var rTotal = 0;
              rTotal = e.items.length;
              if(_rowTotal==0)_rowTotal=rTotal;//처음 주소 갯수
              setTimeout(function(){
                  if(rTotal > 0){
                    $("body").contents().find(".checkImg").each(function(cnt){
                        $("body").contents().find(".checkImg:eq(0)").html("<img src='<c:url value='/resources/img/mob/ico_check.png' />' width='20px;'>");
                        $("#addrNm").text(trimNull(e.items[0].sungNm)+ " / "+trimNull(e.items[0].cityNm)+ " / "+trimNull(e.items[0].distNm));
                        $("#addrNmDetail").text(trimNull(e.items[0].addrDetlCont));
                    });
                  }else{
                      $("#addrNm").text("");
                      $("#addrNmDetail").text("");
                  }
                }, 200);
          }

          if(e.action == "remove" || e.action == "add"){
              for(var i=0; i<subListData._data.length; i++){
                  subListData._view[i].rnum=i+1;
              }
          }
        }
        ,error:function(e){
          mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
});


chgBuyYnMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = chgBuyYnMap[val];
    }
    return returnVal;
};
addrTpchg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = addrTpMap[val];
    }
    return returnVal;
};


//추가
function addrAddItemSubList1(data){
    _rowTotal++;

    var refTableNm  = "";
    var refKeyNm = "";

    if(document.location.href.indexOf("ShowRoom") > -1){
        //전시장흐름
        refTableNm = "CR_0214T";
        refKeyNm = $("#seq").val();
    }else{
        refTableNm = "CR_0101T";
        refKeyNm = $("#custNo").val();
    }

    for(var i=0; i<subListData._data.length; i++){
        subListData._data[i].flagYn="N";
    }

    subListData.insert({
        "flagYn"            :"Y"
        , "rnum"            :data.rnum
        , "addrTp"          :data.addrTp
        , "zipCd"           :data.zipCd
        , "sungNm"          :data.sungNm
        , "cityNm"          :data.cityNm
        , "distNm"          :data.distNm
        , "addrNm"          :""
        , "addrDetlCont"    :data.addrDetlCont
        , "useYn"           :"Y"
        , "sungCd"          :data.sungCd
        , "cityCd"          :data.cityCd
        , "distCd"          :data.distCd
        , "refTableNm"      :refTableNm                  //참조테이블
        , "refKeyNm"        :refKeyNm                     // 참조 키
    });
    //subListView1.refresh();
    $("#subListView").css({"background-image":"none"});
    setSubListHeightNew("addressList",3,_rowTotal);
}

//삭제
var testFlag = false;
function addrRemoveItem(obj){
    _rowTotal--;
    var uid = $(obj).parent().parent().attr("data-uid");
    var idx = 0;
    $(obj).parent().parent().parent().find(".deleteitem").each(function(index, item){
        if($(item).attr("data-uid") == uid){
            return false;
        }
        idx++;
    });
    subListData.remove(subListData._data[idx]);

    if(subListData._data.length>0){
        subListData._data[0].flagYn="Y";
        subListData._data[0].dirty=true;
        var firstRow = $("#subListView .deleteitem").eq(0);
        $(firstRow).children(".checkImg").html("<img src='<c:url value='/resources/img/mob/ico_check.png' />' width='20px;'>");
        $("#addrNm").text(trimNull(subListData._data[0].sungNm)+ " / "+trimNull(subListData._data[0].cityNm)+ " / "+trimNull(subListData._data[0].distNm));
        $("#addrNmDetail").text(trimNull(subListData._data[0].addrDetlCont));
        //setSubListHeightNew("addressList",3,_rowTotal);
    }else{
        $("#subListView").css(
                {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                    ,"background-repeat":"no-repeat"
                    ,"background-position":"center"});
        $("#addrNm").text("");
        $("#addrNmDetail").text("");
    }

    testFlag = true;
}
function subListViewClick(dataItem, _this, idx)
{
    if(testFlag){
        testFlag = false;
        return false;
    }
    $("body").contents().find(".checkImg").each(function(cnt){
        $("body").contents().find(".checkImg").html("");
    });

    var listView = $("#subListView").data("kendoListView");
    for(var i=0; i<listView.dataSource._data.length; i++){
        if(listView.dataSource._data[i].uid==dataItem.uid){
            listView.dataSource._data[i].flagYn="Y";
            listView.dataSource._data[i].dirty=true;
        }else{
            listView.dataSource._data[i].flagYn="N";
            listView.dataSource._data[i].dirty=true;
        }
    }
    $(_this).find(".checkImg").html("<img src='<c:url value='/resources/img/mob/ico_check.png' />' width='20px;'>");
    $("#addrNm").text(trimNull(dataItem.sungNm)+ " / "+trimNull(dataItem.cityNm)+ " / "+trimNull(dataItem.distNm));
    $("#addrNmDetail").text(trimNull(dataItem.addrDetlCont));
}

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

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:50%">#:trimNull(flagYn) #</span>
    <span style="width:50%">#:pconChgTp(pconTp) #</span>
    <span class="clboth" style="width:50%" name="_itemCd">#:trimNull(relNm) #</span>
    <span style="width:50%">#:trimNull(telNo) #</span>
    <span class="clboth" style="width:50%">#:trimNull(hpNo) #</span>
    <span style="width:50%">#:trimNull(wechatId) #</span>
    <span class="clboth" style="width:100%">#:chgServerDate2Str(regDt) #</span>
    <span class="delete">
        <span class="btn_del" onclick="javascript:removeItem(this);" ><spring:message code='global.lbl.del' /></span>
    </span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var data = [];
// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/mob/crm/cif/customerInfo/customerRelSearch.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {

              var params = {};

              params["recordCountPerPage"] = options.pageSize;
              params["pageIndex"] = options.page;
              params["firstIndex"] = options.skip;
              params["lastIndex"] = options.skip + options.take;
              params["sort"] = options.sort;

              params["sUpperCustNo"] = parent.$("#custNo").val();

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
        id:"seq"
        ,fields:{
            seq                   :{type:"number", editable:false}
            , pconCustNo          :{type:"string", editable:false}
            //, rnum              :{type:"number", editable:false}
            , upperCustNo         :{type:"string", editable:false}
            , custNo              :{type:"string", editable:false}
            , relNm               :{type:"string", editable:false}       // 연계인명
            , wechatId            :{type:"string", editable:false}       // 위챗 ID
            , pconTp              :{type:"string"}
            , flagYn              :{type:"string"}                       // 주요연계인
            , custNm              :{type:"string", editable:false}
            , mathDocTp           :{type:"string", editable:false}       // 신분증유형
            , certiNum            :{type:"string", editable:false}       // 신분증 번호
            , telNo               :{type:"string", editable:false}       // 전화
            , hpNo                :{type:"string", editable:false}       // 휴대전화
            , emailNm             :{type:"string", editable:false}       // E-MAIL
            , prefCommMthCd       :{type:"string", editable:false}       // 선호연락방식
            , prefCommNo          :{type:"string", editable:false}       // 선호 연락처
            , prefContactMthCd    :{type:"string", editable:false}       // 우선 연락방식
            , prefContactTimeCd   :{type:"string", editable:false}       // 우선 연락시간
            , regDt               :{type:"date", editable:false}         // 등록일
        }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("relList", rTotal,"Y");
          parent.setSubListHeightNew("relList",4,rTotal);
      }else{
          //parent.setSubListHeight2("relList", 0,"Y");
          parent.setSubListHeightNew("relList",4,0);
      }
      }, 200);

      checklistCnt("relList_noData",this.total(),noDatamsg);
    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//유형
pconChgTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.pconTpMap[val];
    }
    return returnVal;
}

//선호연락방식
prefCommMthChgCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.prefCommMthCdMap[val];
    }
    return returnVal;
}

//우선연락방식
prefContactMthChgCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.prefContactMthCdMap[val];
    }
    return returnVal;
}

//우선연락시간
prefContactTimeChgCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.prefContactTimeCdMap[val];
    }
    return returnVal;
}
chgBuyYnMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.chgBuyYnMap[val];
    }
    return returnVal;
}
addrTpchg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.addrTpMap[val];
    }
    return returnVal;
}


//추가
function addItemSubList1(data){
    var subListView1 = $("#subListView1").data("kendoMobileListView");

    subListView1.dataSource.insert({
        "pconCustNo"            :data.custNo
        , "pconTp"              :"01"
        , "mathDocTp"           :data.mathDocTp
        , "prefCommMthCd"       :data.prefCommMthCd
        , "prefContactMthCd"    :data.prefContactMthCd
        , "prefContactTimeCd"   :data.prefContactTimeCd
        , "upperCustNo"         :parent.$("#custNo").val()            // 상위 고객번호
        , "custNm"              :data.custNm
        , "certiNum"            :data.certiNum                  // 신분증 번호
        , "telNo"               :data.telNo                     // 전화
        , "hpNo"                :data.hpNo                      // 휴대전화
        , "emailNm"             :data.emailNm                   // E-MAIL
        , "regDt"               :chgDate(data.regDt)                     // 등록일
        , "prefCommNo"          :data.prefCommNo                // 선호 연락처
    });

    subListView1.refresh();

    //저장
    parent.confirmOpen(confirmMsgSave,'parent.saveRelList',y,n);

}

//삭제
function removeItem(obj){
/*    var itemCd = $(obj).parent().parent().find("span[name='_itemCd']").text();
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        //console.log($(item).find("span[name='_itemCd']").text());
        if($(item).find("span[name='_itemCd']").text() == itemCd){
             return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx]);
    listView.refresh();
*/

    var uid = $(obj).parent().parent().parent().attr("data-uid");

    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        //console.log(        item);
        //console.log(        $(item).attr("data-uid") == uid);

        if($(item).attr("data-uid") == uid){
            return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx]);
    listView.refresh();

    //저장
    parent.confirmOpen(confirmMsgSave,'parent.saveRelList',y,n);
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

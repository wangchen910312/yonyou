<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template" data-click="">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:35%">#:pconChgTp(pconTp) #</span>
    <span style="width:40%" name="_itemCd">#:custNm #</span>
    <span style="width:25%">#:hpNo #</span>
    <span class="clboth" style="width:35%">#:certiNum #</span>
    <span style="width:65%">#:emailNm #</span>
    <span class="clboth" style="width:35%">#:prefCommMthChgCd(prefCommMthCd) #</span>
    <span style="width:65%">#:prefCommNo #</span>
    <span class="clboth" style="width:35%">#:prefContactMthChgCd(prefContactMthCd) #</span>
    <span style="width:65%">#:prefContactTimeChgCd(prefContactTimeCd) #</span>
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

              params["upperCustNo"] = parent.$("#custNo").val();
console.log(params.upperCustNo);
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
              seq                   :{type:"number"}
              , pconCustNo          :{type:"string"}
              //, rnum              :{type:"number"}
              , upperCustNo         :{type:"string"}
              , custNo              :{type:"string"}
              , pconTp              :{type:"string", validation:{required:true}}
              , custNm              :{type:"string"}
              , mathDocTp           :{type:"string"}       // 신분증유형
              , certiNum            :{type:"string"}       // 신분증 번호
              , telNo               :{type:"string"}       // 전화
              , hpNo                :{type:"string"}       // 휴대전화
              , emailNm             :{type:"string"}       // E-MAIL
              , prefCommMthCd       :{type:"string"}       // 선호연락방식
              , prefCommNo          :{type:"string"}       // 선호 연락처
              , prefContactMthCd    :{type:"string"}       // 우선 연락방식
              , prefContactTimeCd   :{type:"string"}       // 우선 연락시간
              , regDt               :{type:"date"}         // 등록일
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("relList", rTotal,"Y");
      }else{
          parent.setSubListHeight2("relList", 0,"Y");
      }
      }, 200);

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
console.log(data);

    var subListView1 = $("#subListView1").data("kendoMobileListView");

    subListView1.dataSource.insert({
        "pconCustNo"            :data.custNo
        , "pconTp"              :"01"
        , "mathDocTp"           :data.mathDocTp
        , "prefCommMthCd"       :data.prefCommMthCd
        , "prefContactMthCd"    :data.prefContactMthCd
        , "prefContactTimeCd"   :data.prefContactTimeCd
        , "upperCustNo"         :$("#custNo").val()            // 상위 고객번호
        , "custNm"              :data.custNm
        , "certiNum"            :data.certiNum                  // 신분증 번호
        , "telNo"               :data.telNo                     // 전화
        , "hpNo"                :data.hpNo                      // 휴대전화
        , "emailNm"             :data.emailNm                   // E-MAIL
        //, "regDt"               :data.regDt                     // 등록일
        , "prefCommNo"          :data.prefCommNo                // 선호 연락처
    });

    subListView1.refresh();

}

//삭제
function removeItem(obj){
    var itemCd = $(obj).parent().parent().find("span[name='_itemCd']").text();
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        //console.log($(item).find("span[name='_itemCd']").text());
        if($(item).find("span[name='_itemCd']").text() == itemCd){
             return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx-1]);
    listView.refresh();
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

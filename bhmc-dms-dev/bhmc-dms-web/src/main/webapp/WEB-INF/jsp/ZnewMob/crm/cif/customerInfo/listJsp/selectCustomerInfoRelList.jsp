<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></h2>
        <div class="title_btn">
            <dms:access viewId="VIEW-D-12764" hasPermission="${dms:getPermissionMask('READ')}">
            <span class="tbtn" id="btnCustSearch"><spring:message code="global.btn.add" /><!-- 추가 --></span>
            </dms:access>
            <span class="co_open co_close" id="btnRelSearch"><span>상세내용 접기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:50%"><spring:message code='crm.lbl.majorCustRel' /><!-- 주요연계인 --></span>
                <span style="width:50%"><spring:message code='global.lbl.type' /><!-- 유형 --></span>
                <span class="clboth" style="width:50%"><spring:message code='crm.lbl.relCustNm' /><!-- 연계인명 --></span>
                <span style="width:50%"><spring:message code='global.lbl.homeTelNo' /><!-- 고정(유선)전화 --></span>
                <span class="clboth" style="width:50%"><spring:message code='global.lbl.hpNo' /><!-- 휴대폰번호 --></span>
                <span style="width:50%"><spring:message code='global.lbl.wechatId' /><!-- Wechat ID --></span>
                <span class="clboth" style="width:100%"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></span>
            </div>
            <div>
                <div id="subListView2" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate2">
<div class="deleteitem">
    <span style="width:50%">#:trimNull(flagYn) #</span>
    <span style="width:50%">#:pconChgTp(pconTp) #</span>
    <span class="clboth" style="width:50%" name="_itemCd">#:trimNull(relNm) #</span>
    <span style="width:50%">#:trimNull(telNo) #</span>
    <span class="clboth" style="width:50%">#:trimNull(hpNo) #</span>
    <span style="width:50%">#:trimNull(wechatId) #</span>
    <span class="clboth" style="width:100%">#:chgServerDate2Str(regDt) #</span>
    <span class="delete">
        <span class="btn_del" onclick="javascript:relRemoveItem(this);" ><spring:message code='global.lbl.del' /></span>
    </span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData2 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/mob/crm/cif/customerInfo/customerRelSearch.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          var params = {};
          params["sUpperCustNo"] = $("#custNo").val();
          return kendo.stringify(params);
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
        id:"seq"
        ,fields:{
            seq                   :{type:"number", editable:false}
            , pconCustNo          :{type:"string", editable:false}
            //, rnum                :{type:"number", editable:false}
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
      rTotal = $("#subListView2").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("relList",4,rTotal);
      }else{
          setSubListHeightNew("relList",4,0);
      }
      }, 200);
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//유형
pconChgTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = pconTpMap[val];
    }
    return returnVal;
};

//선호연락방식
prefCommMthChgCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = prefCommMthCdMap[val];
    }
    return returnVal;
};

//우선연락방식
prefContactMthChgCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = prefContactMthCdMap[val];
    }
    return returnVal;
};

//우선연락시간
prefContactTimeChgCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = prefContactTimeCdMap[val];
    }
    return returnVal;
};
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
function relAddItemSubList1(data){
    var subListView2 = $("#subListView2").data("kendoListView");

    subListView2.dataSource.insert({
        "pconCustNo"            :data.custNo
        //, "rnum"                :data.rnum
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
        , "regDt"               :chgDate(data.regDt)                     // 등록일
        , "prefCommNo"          :data.prefCommNo                // 선호 연락처AddItemSubList1
    });

    //저장
    confirmOpen(confirmMsgSave,'saveRelList',y,n);
}

//삭제
function relRemoveItem(obj){
    var uid = $(obj).parent().parent().attr("data-uid");
    var idx = 0;
    $(obj).parent().parent().parent().find(".deleteitem").each(function(index, item){
        if($(item).attr("data-uid") == uid){
            return false;
        }
        idx++;
    });
    subListData2.remove(subListData2.data()[idx]);

    //저장
    confirmOpen(confirmMsgSave,'saveRelList',y,n);
}

$("#subListView2").kendoListView({
    dataSource:subListData2
    ,template:kendo.template($("#subTemplate2").html())
    ,autoBind:false
    ,dataBinding: function(e) {
        if(e.items.length == 0){
            $("#subListView2").css(
                    {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                        ,"background-repeat":"no-repeat"
                        ,"background-position":"center"});
        }else{
            $("#subListView2").css({"background-image":"none"});
        }
    }
});

</script>

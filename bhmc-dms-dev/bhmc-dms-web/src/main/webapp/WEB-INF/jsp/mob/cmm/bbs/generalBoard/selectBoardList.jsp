<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:25%">#:rnum #</span>
    <span style="width:25%">#:changeCatCdMap(nttCatCd) #</span>
    <span style="width:50%">#:nttTitleNm #</span>
    <span style="clear:both; width:50%">#:usrNm #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(regDt) #</span>
    <span style="display:none">#:nttId #</span>
    <span style="display:none">#:bbsId #</span>
    <span style="display:none">#:fileDocNo #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var bardSal =[];
var bardSer =[];
var bardPar =[];
var bardCrm =[];
var bardCom =[];
var bardAdm =[];
var bardAll =[];

var isFromBoardMain = "${isFromBoardMain}";

var grant = "${hasRoleId}"; //테스트용 , 실제는 메인에서 받아오자 

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
      //params["sort"] = options.sort;
      
      params["sBbsId"] = "BBS201604-000011";
      params["sNttCatCd"] = parent.$("#sNttCatCd").val();
      params["sNttTitleNm"] = parent.$("#sNttTitleNm").val();
      params["sNttCont"] = parent.$("#sNttCont").val();

      $.ajax({
          url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoard.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData",result.total,noDatamsg);
              var data = [];
              rowTotal = result.total;
              var SerIndex=0, SalIndex=0, ParIndex=0, CrmIndex=0, ComIndex=0, AdmIndex=0;
              //alert("KBS Loading page Success ["+pageIndex+"]");
              if (rowTotal > 0) {
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, bbsId:row.bbsId,
                          fileDocNo:row.fileDocNo, flag:row.flag, nttCatCd:row.nttCatCd, nttCont:row.nttCont,
                          nttId:row.nttId, nttRefId:row.nttRefId, nttRootId:row.nttRootId, nttTitleNm:row.nttTitleNm, regDt:row.regDt,
                          regUsrId:row.regUsrId, repLvlVal:row.repLvlVal, repSortOrderVal:row.repSortOrderVal, rnum:row.rnum, updtDt:row.updtDt,
                          updtUsrId:row.updtUsrId, usrNm:row.usrNm, nttId:row.nttId, bbsId:row.bbsId});

                      if(row.nttCatCd=="01"){var YYYYMMDD=row.regDt.split(' ');bardSer[SerIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                      if(row.nttCatCd=="02"){var YYYYMMDD=row.regDt.split(' ');bardSal[SalIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                      if(row.nttCatCd=="03"){var YYYYMMDD=row.regDt.split(' ');bardPar[ParIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                      if(row.nttCatCd=="04"){var YYYYMMDD=row.regDt.split(' ');bardCrm[CrmIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                      if(row.nttCatCd=="05"){var YYYYMMDD=row.regDt.split(' ');bardCom[ComIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                      //if(row.nttCatCd=="06"){var YYYYMMDD=row.regDt.split(' ');bardAdm[AdmIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm;}
                      var YYYYMMDD=row.regDt.split(' ');
                      bardAll[AdmIndex++]=YYYYMMDD[0]+"-=;"+row.nttTitleNm+"-=;"+row.nttCatCd;
                      
                      /* if(row.nttCatCd=="01"){if(bardSer.length==0){bardSer[0]=YYYYMMDD[0]; bardSer[1]=row.nttTitleNm;}}
                      if(row.nttCatCd=="02"){if(bardSal.length==0){bardSal[0]=YYYYMMDD[0]; bardSal[1]=row.nttTitleNm;}}
                      if(row.nttCatCd=="03"){if(bardPar.length==0){bardPar[0]=YYYYMMDD[0]; bardPar[1]=row.nttTitleNm;}}
                      if(row.nttCatCd=="04"){if(bardCrm.length==0){bardCrm[0]=YYYYMMDD[0]; bardCrm[1]=row.nttTitleNm;}}
                      if(row.nttCatCd=="05"){if(bardCom.length==0){bardCom[0]=YYYYMMDD[0]; bardCom[1]=row.nttTitleNm;}}
                      if(row.nttCatCd=="06"){if(bardAdm.length==0){bardAdm[0]=YYYYMMDD[0]; bardAdm[1]=row.nttTitleNm;}} */
                  });
                  
                  console.log("bardSer"+bardSer);
                  console.log("bardSal"+bardSal);
              }

              options.success(data);
              app.hideLoading();
              
              
              if(isFromBoardMain!="Y"){
                  contentSetBoard();
                  contentSetBoardByGrant();
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

changeCatCdMap = function(val){
    if(isFromBoardMain=="Y"){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.arrCatCdMap[val].cmmCdNm;
        }
        return returnVal;
    }
};

function listViewClick(e)
{
    parent.contentDetail(e.dataItem.nttId, e.dataItem.bbsId, e.dataItem.fileDocNo);
}

function contentSetBoard(){
    
    if(bardSal.length>0){
        parent.$("#bardSal .date").text("["+bardSal[0]+"]");
        parent.$("#bardSal .tittleNm").text(bardSal[1]);
        parent.$("#bardSalNm").html("<spring:message code='crm.lbl.sale' />");
        parent.$("#bardSal").show();
    }
    if(bardSer.length>0){
        parent.$("#bardSer").show();
        parent.$("#bardSer .date").text("["+bardSer[0]+"]");
        parent.$("#bardSer .tittleNm").text(bardSer[1]);
        parent.$("#bardSerNm").html("<spring:message code='crm.lbl.lbr' />");
    }
    if(bardPar.length>0){
        parent.$("#bardPar").show();
        parent.$("#bardPar .date").text("["+bardPar[0]+"]");
        parent.$("#bardPar .tittleNm").text(bardPar[1]);
        parent.$("#bardParNm").html("<spring:message code='global.lbl.part' />");
    }
    if(bardCrm.length>0){
        parent.$("#bardCrm").show();
        parent.$("#bardCrm .date").text("["+bardCrm[0]+"]");
        parent.$("#bardCrm .tittleNm").text(bardCrm[1]);
        parent.$("#bardCrmNm").html("<spring:message code='crm.menu.crmMain' />");
    }
    if(bardCom.length>0){
        parent.$("#bardCom").show();
        parent.$("#bardCom .date").text("["+bardCom[0]+"]");
        parent.$("#bardCom .tittleNm").text(bardCom[1]);
        parent.$("#bardComNm").html("<spring:message code='cmm.menu.comMain' />");
    }
    if(bardAdm.length>0){
        parent.$("#bardAdm").show();
        parent.$("#bardAdm .date").text("["+bardAdm[0]+"]");
        parent.$("#bardAdm .tittleNm").text(bardAdm[1]);
        parent.$("#bardAdmNm").html("<spring:message code='mis.menu.misMain' />");
    }
    parent.$("#mainList").hide();
}
function contentSetBoardByGrant(){
    
    var i;
    var noticeHtml="";
    if(grant.indexOf("ROLE_ADMIN") > -1 ){
        var totalLine=0;
        console.log("bardAll.length : "+bardAll.length);
        for(i=0; i<bardAll.length; i++){
            if(totalLine==3)break;
            var _bardAll=bardAll[i].split('-=;'); totalLine++;
            var _nttCatCdNm="";
            if(_bardAll[2]=="01"){
                _nttCatCdNm="<spring:message code='crm.lbl.sale' />";
            }else if(_bardAll[2]=="02"){
                _nttCatCdNm="<spring:message code='crm.lbl.lbr' />";
            }else if(_bardAll[2]=="03"){
                _nttCatCdNm="<spring:message code='global.lbl.part' />";
            }else if(_bardAll[2]=="04"){
                _nttCatCdNm="<spring:message code='crm.menu.crmMain' />";
            }else if(_bardAll[2]=="05"){
                _nttCatCdNm="<spring:message code='cmm.menu.comMain' />";
            }
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'>"+_nttCatCdNm+"</span><span class='date' >["+_bardAll[0]+"]</span><span>"+_bardAll[1]+"</span></span></li>";
            if(i==3)break;
        }
        /*
        for(i=0; i<bardSer.length; i++){
            if(totalLine==3)break;
            var _bardSer=bardSer[i].split('-=;'); totalLine++;
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='crm.lbl.lbr' /></span><span class='date' >["+_bardSer[0]+"]</span><span>"+_bardSer[1]+"</span></span></li>";
            if(i==3)break;
        }
        for(i=0; i<bardPar.length; i++){
            if(totalLine==3)break;
            var _bardPar=bardPar[i].split('-=;'); totalLine++;
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='global.lbl.part' /></span><span class='date' >["+_bardPar[0]+"]</span><span>"+_bardPar[1]+"</span></span></li>";
            if(i==3)break;
        }
        for(i=0; i<bardCrm.length; i++){
            if(totalLine==3)break;
            var _bardCrm=bardCrm[i].split('-=;'); totalLine++;
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='crm.menu.crmMain' /></span><span class='date' >["+_bardCrm[0]+"]</span><span>"+_bardCrm[1]+"</span></span></li>";
            if(i==3)break;
        }
        for(i=0; i<bardCom.length; i++){
            if(totalLine==3)break;
            var _bardCom=bardCom[i].split('-=;'); totalLine++;
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='cmm.menu.comMain' /></span><span class='date' >["+_bardCom[0]+"]</span><span>"+_bardCom[1]+"</span></span></li>";
            if(i==3)break;
        }
        for(i=0; i<bardAdm.length; i++){
            if(totalLine==3)break;
            var _bardAdm=bardAdm[i].split('-=;'); totalLine++;
            noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='mis.menu.misMain' /></span><span class='date' >["+_bardAdm[0]+"]</span><span>"+_bardAdm[1]+"</span></span></li>";
            if(i==3)break;
        }*/
    }else{
        var totalLine2=0;
        if(grant.indexOf("ROLE_COMM") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardCom.length; i++){
                var _bardCom=bardCom[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='cmm.menu.comMain' /></span><span class='date' >["+_bardCom[0]+"]</span><span>"+_bardCom[1]+"</span></span></li>";
                if(i==3)break;
            }
        }else if(grant.indexOf("ROLE_CRM") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardCrm.length; i++){
                var _bardCrm=bardCrm[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='crm.menu.crmMain' /></span><span class='date' >["+_bardCrm[0]+"]</span><span>"+_bardCrm[1]+"</span></span></li>";
                if(i==3)break;
            }
        }else if(grant.indexOf("ROLE_MOB") > -1){
            
        }else if(grant.indexOf("ROLE_PAR") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardPar.length; i++){
                var _bardPar=bardPar[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='global.lbl.part' /></span><span class='date' >["+_bardPar[0]+"]</span><span>"+_bardPar[1]+"</span></span></li>";
                if(i==3)break;
            }
        }else if(grant.indexOf("ROLE_SAL") > -1){
            if(totalLine2>3)return;
            for(i=0; i<bardSal.length; i++){
                var _bardSal=bardSal[i].split('-=;'); totalLine2++;
                noticeHtml+="<li onclick='goBoard(1)'><span><span class='noti'><spring:message code='crm.lbl.sale' /></span><span class='date' >["+_bardSal[0]+"]</span><span>"+_bardSal[1]+"</span></span></li>";
                if(i==3)break;
            }
        }
    }
    parent.$(".notice > ul").html(noticeHtml);
    parent.$("#mainList").hide();
    parent.$("#mainloadingImg").hide();
}

//var app = new kendo.mobile.Application();
var app = setKendoMobApp();

</script>

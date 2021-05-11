<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="checkitem">
    <span class="check">
        <%--<input type="checkbox" id="check01" name="check01" class="f_check" /><label for="check01"></label>--%>
        <input id="isSave_#:rowIdx #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rowIdx #"></label>
    </span>
    <input type="hidden" name="custNm" value="#:custNm #"/>
    <input type="hidden" name="custNo" value="#:custNo #"/>
    <input type="hidden" name="custTp" value="#:custTp #"/>
    <input type="hidden" name="mngScId" value="#:mngScId #"/>
    <input type="hidden" name="officeTelNo" value="#:officeTelNo #"/>
    <input type="hidden" name="prefCommMthCd" value="#:prefCommMthCd #"/>
    <input type="hidden" name="prefCommNo" value="#:prefCommNo #"/>


    <span style="width:35%">#:trimNull(custNm) #</span>
    <span style="width:35%">#:trimNull(hpNo) #</span>
    <span style="width:30%">#:leadSrcArrVal(leadSrcCd) #</span>
    <span class="clboth" style="width:35%">#:trimNull(carlineNm) #</span>
    <span style="width:65%">#:trimNull(modelNm) #</span>
    <span class="clboth" style="width:35%">#:changeBhmcYn(bhmcYn) #</span>
    <span style="width:35%">#:statArrVal(statCd) #</span>
    <span style="width:30%">#:trimNull(regDt) #</span>
</div>
</script>


<script>
var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      params["sLeadTp"]               = "COMMON";
      params["sLeadSrcCd"]            = parent.$("#sLeadSrcCd").data("kendoExtDropDownList").value();
      params["sStatCd"]               = parent.$("#sStatCd").data("kendoExtDropDownList").value();
      params["sMngScId"]               = "00";

      if(parent.$("#sRegDtFrom").val() == "" || parent.$("#search4Area span[name='searchStr']").text() == ""){
          params["sRegDtFrom"] = null;
      }else{
          params["sRegDtFrom"] = chgDate(parent.$("#sRegDtFrom").val());
      }

      if(parent.$("#sRegDtTo").val() == "" || parent.$("#search4Area span[name='searchStr']").text() == ""){
          params["sRegDtTo"] = null;
      }else{
          params["sRegDtTo"] = chgDate(parent.$("#sRegDtTo").val());
      }

      $.ajax({
          url:"<c:url value='/mob/crm/ass/assign/selectLeadAssigns.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                        pageIdx:pageIndex,
                        rowIdx:rowIndex,

                        custNm:row.custNm,
                        custNo:row.custNo,
                        hpNo:row.hpNo,
                        leadSrcCd:row.leadSrcCd,
                        carlineNm:row.carlineNm,
                        modelNm:row.modelNm,
                        bhmcYn:row.bhmcYn,
                        statCd:row.statCd,
                        regDt:row.regDt,
                        allocDt:chgDate2Str(row.allocDt),

                        custTp:row.custTp,
                        mngScId:row.mngScId,
                        officeTelNo:row.officeTelNo,
                        prefCommMthCd:row.prefCommMthCd,
                        prefCommNo:row.prefCommNo
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

leadSrcArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.leadSrcArr[val];
    }
    return returnVal;
};

statArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.statArr[val];
    }
    return returnVal;
};


changeBhmcYn = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.yesMap[val];
    }
    return returnVal;
};

function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.itemCd);
    //alert(aa);
}

var app = setKendoMobApp();

</script>


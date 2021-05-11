<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:35%" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(rowData.contractNo)   #</span>
    <span style="width:30%" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(chgDate2Str(rowData.contractDt)) #</span>
    <span style="width:35%" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(rowData.custNm) #</span>
    <span style="width:35%" class="clboth" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(rowData.carlineNm) #</span>
    <span style="width:65%" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(rowData.modelNm) #</span>
    <span style="width:35%" class="clboth" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(rowData.extColorNm) #</span>
    <span style="width:65%" onclick="listViewClick('#:rowData.rnum #')">#:trimNull(rowData.intColorNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "yyyy-MM-dd HH:mm:ss";
var vDtyyyyMMdd = "yyyy-MM-dd";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.

var listData = new kendo.data.DataSource({
    transport:{
        read:function(options) {

          if (rowIndex >= rowTotal){
              return;
          }
          app.showLoading();
          pageIndex++;

          var params = {};

          params["recordCountPerPage"] = options.pageSize;
          params["pageIndex"] = options.page;
          params["firstIndex"] = options.skip;
          params["lastIndex"] = options.skip + options.take;
          params["sort"] = options.sort;


          // 딜러코드
          //params["sDlrCd"] = parent.$("#dlrCd").val();
          params["sDlrCd"] =  parent.dlrCd;
          // 판매사원
          params["sSaleEmpNo"] = parent.$("#sSaleEmpNo").data("kendoExtDropDownList").value();
          // 고객명
          params["sContractCustNm"] = parent.$("#sContractCustNm").val();
          //고객
          params["sContractCustNo"] = parent.$("#sContractCustNo").val();
          // 유형
          params["sCntTp"] = parent.$("#cntTp").val();
          // 계약번호
          params["sContractNo"] = parent.$("#savedContractNo").val();

          $.ajax({
              url:"<c:url value='/sal/cnt/contractMnt/selectContractMntSearch.do' />"
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
                          data.push({rowData:result.data[i]});
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
    var obj = listData._data[e-1];
    parent.contentDetail(obj);
    //parent.contentDetail(obj.dataItem);
}

var app = setKendoMobApp();
//var app = setKendoMobAppForNativeScroll();
</script>

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
    <span style="width:30%">#:custNm#</span>
    <span style="width:35%">#:hpNo #</span>
    <span style="width:35%">#:custCdNm#</span>
    <span class="clboth" style="width:65%">#:kendo.toString(resvDt, '<dms:configValue code='dateFormat' /> HH:mm') #</span>
    <span class="" style="width:35%">#:tdrvHmCdArrVal(tdrvHmCd) #</span>
    <span class="clboth" style="width:30%">#:custStsfCdArrVal(custStsfCd) #</span>
    <span style="width:70%">#:scNm    #</span>
</div>
</script>

<script>

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({

    transport:{
        read:{
            url:"<c:url value='/mob/crm/cso/testDrive/selectTestDriveMgmts.do' />"
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

                params["sCust"] = parent.$("#sCust").val();
                params["sScId"] = parent.$("#sScId").data("kendoExtDropDownList").value();
                params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();

                //params["sStartDt"] = new Date( parent.$("#sStartDt").val());
                //params["sEndDt"] = new Date(parent.$("#sEndDt").val());

                if(parent.$("#sStartDt").val() == "" /* || parent.$("#search3Area span[name='searchStr']").text() == "" */){
                    params["sStartDt"] = null;
                }else{
                    params["sStartDt"] = chgDate(parent.$("#sStartDt").val());
                }

                if(parent.$("#sEndRegDt").val() == "" /* || parent.$("#search3Area span[name='searchStr']").text() == "" */){
                    params["sEndDt"] = null;
                }else{
                    params["sEndDt"] = chgDate(parent.$("#sEndDt").val());
                }

                params["sTdrvVinNo"] = parent.$("#sVin").val();
                params["sCustStsfStatCd"] = parent.$("#sStatus").data("kendoExtDropDownList").value();

                parent.$("#content_list").css("display","block");

                console.log("mob params",params);

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
            id:"tdrvSeq"
            ,fields:{
                 tdrvSeq:{type:"number"}
                ,custNm:{type:"string"}
                ,hpNo:{type:"string"}
                ,resvDt:{type:"date"}
                ,tdrvHmCd:{type:"string"}
                ,custStsfCd:{type:"string"}
                ,scNm:{type:"string"}
                ,regDt:{type:"date"}
                ,carRegId:{type:"string"}
                ,custCdNm:{type:"string"}
            }
        }
    },
    change :function(e){
        checklistCnt("listarea_noData",this.total(),noDatamsg);
        //parent.setMainListHeight();
    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});

function emptyGrid(){

    //checklistCnt("listarea_noData",this.total());


}

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentDetail(e.dataItem);
}

tdrvHmCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.tdrvHmCdArr[val];
    }
    return returnVal;
};

custStsfCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.custStsfCdArr[val];
    }
    return returnVal;
};

custCdVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.custCdMap[val];
    }
    return returnVal;
};


var app = setKendoMobApp();

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView2" name="subListView2" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:50%">#:trimNull(mngScNm) #</span>
    <span style="width:50%">#:chgDateFormat(traceDtFormat) #</span>
    <span class="clboth" style="width:50%">#:trimNull(traceMthNm) #</span>
    <span style="width:50%">#:trimNull(traceGradeNm) #</span>
    <span class="clboth" style="width:50%">#:trimNull(traceCont) #</span>

</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({

    transport:{
        read:{
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmt.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            app.showLoading();
            if (operation === "read") {

                var params = {};

                params["recordCountPerPage"] = options.pageSize;
                params["pageIndex"] = options.page;
                params["firstIndex"] = options.skip;
                params["lastIndex"] = options.skip + options.take;
                params["sort"] = options.sort;

                var parentUrl = parent.document.location.href;
                var seq = "";
                if(parentUrl.indexOf("selectEditSalesOpptProcessPopup") > -1){
                    seq = parent.$("#seq").val();
                }else{
                    seq = parent.$("#seq").val();
                }
                //console.log(seq);

                // 고객번호
               if ( dms.string.isEmpty(seq) ) {
                    mob.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                params["sSaleOpptSeq"]           = seq;
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
                seq:{type:"string", editable:false}
                ,rnum  :{type:"number" , editable:false}
                ,mngScNm:{type:"string", editable:true}
                ,traceMthNm:{type:"string", editable:false}
                ,traceGradeNm:{type:"string", editable:false}
                ,traceCont:{type:"string", editable:false}
                ,nextTraceMthNm:{type:"string", editable:false}
                ,traceDt:{type:"date", editable:false}
                ,nextTraceDt:{type:"date", editable:false}
                ,traceDtFormat:{type:"date", editable:false}
                ,nextTraceDtFormat:{type:"date", editable:false}
            }
        },parse:function(d) {
            if(d.data){
                $.each(d.data, function(idx, elem) {
                    elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateTimeFormat' />");
                    elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                });
            }
            return d;
        }
    },
    change :function(e){
        var rTotal = 0;
        rTotal = e.items.length;
        setTimeout(function(){
        if(rTotal > 0){
            //parent.setSubListHeight2("activeHistoryList", rTotal,"Y");
            parent.setSubListHeightNew("activeHistoryList",3,rTotal);
        }else{
            //parent.setSubListHeight2("activeHistoryList", 0,"Y");
            parent.setSubListHeightNew("activeHistoryList",3,0);
        }
        }, 200);
        app.hideLoading();
        checklistCnt("activeHistoryList_noData",e.items.length,noDatamsg);

        //parent.setMainListHeight();
    }
    ,error:function(e){
        app.hideLoading();
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});

function listViewClick(e)
{
    //parent.contentDetail(e.dataItem);
}

chgDateFormat = function(val){
    console.log(val);
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm')
    }else{
        returnVal = '';
    }
    return returnVal;
}


var app = setKendoMobApp();
//var app = setKendoMobAppForNativeScroll();
</script>

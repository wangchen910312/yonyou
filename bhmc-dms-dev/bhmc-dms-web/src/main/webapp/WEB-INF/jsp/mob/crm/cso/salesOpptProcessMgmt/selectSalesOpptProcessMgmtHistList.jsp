<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView3" name="subListView3" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:50%">#:chgDateFormat(regDtFormat)#</span>
    <span style="width:50%">#:trimNull(leadStatCont)#</span>
    <span class="clboth" style="width:50%">#:trimNull(mngScNm)#</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span class="clboth" id="#:id #" style="width:100%">#:trimNull(sysMesgCont) #</span>
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
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHist.do' />"
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

                var seq = "";
                var parentUrl = parent.document.location.href;
                var seq = "";
                if(parentUrl.indexOf("selectEditSalesOpptProcessPopup") > -1){
                    seq = parent.$("#seq").val();
                }else{
                    seq = parent.$("#seq").val();
                }


               if ( dms.string.isEmpty(seq) ) {
                    mob.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                params["sSaleOpptSeq"]           = seq;

                //parent.$("#content_list").css("display","block");
                console.log(params);
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
                ,regUsrNm:{type:"string", editable:false}
                ,regDt:{type:"date", editable:false}
                ,regDtFormat:{type:"date", editable:false}
            }
        },parse:function(d) {
            if(d.data){
                $.each(d.data, function(idx, elem) {
                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateTimeFormat' />");
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
            //parent.setSubListHeight2("leadStatusExchangeList", rTotal,"Y");
            parent.setSubListHeight();
            for(var i=0; i<e.items.length; i++){
                $("#"+e.items[i].id).html($("#"+e.items[i].id).text());
            }

        }else{
            //parent.setSubListHeight2("leadStatusExchangeList", 0,"Y");
            parent.setSubListHeightNew("leadStatusExchangeList",3,0);
        }
        }, 200);
        app.hideLoading();

        checklistCnt("leadStatusExchangeList_noData",e.items.length,noDatamsg);
        //parent.setMainListHeight();
    }
    ,error:function(e){
        console.log(e);
        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        app.hideLoading();
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

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}" : "${obj.prtyVal}"});
</c:forEach>

//SPEC타입별 DEPLOY결과코드:COM044
var deployRsltCdBySpecTpList = [];
<c:forEach var="obj" items="${deployRsltCdBySpecTpDS}">
    deployRsltCdBySpecTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployRsltCdBySpecTpArray = [];
$.each(deployRsltCdBySpecTpList, function(idx, obj){
    deployRsltCdBySpecTpArray[obj.cmmCd] = obj.cmmCdNm;
});
deployRsltCdBySpecTpArray[null] = '';

//SPEC타입별 롤백결과코드:COM045
var rollbackRsltCdBySpecTpList = [];
<c:forEach var="obj" items="${rollbackRsltCdBySpecTpDS}">
    rollbackRsltCdBySpecTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var rollbackRsltCdBySpecTpArray = [];
$.each(rollbackRsltCdBySpecTpList, function(idx, obj){
    rollbackRsltCdBySpecTpArray[obj.cmmCd] = obj.cmmCdNm;
});
rollbackRsltCdBySpecTpArray[null] = '';


</script>


<section id="windows" class="pop_wrap">

    <div class="table_grid mt10">
        <div id="bundleGrid" class="grid"></div>
    </div>

    <div class="table_grid mt10">
        <div id="deployHistGrid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

var winOptions = null;

$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     winOptions = parent.searchDealerBundlePopupWin.options.content.data;
     if (winOptions.displayGrid) {
         displayGrid();
     }


    /************************************************************
                기능버튼 설정
    *************************************************************/

    /************************************************************
                조회조건 설정
    *************************************************************/

    /************************************************************
                그리드 설정
    *************************************************************/

    $("#bundleGrid").kendoGrid({
        dataSource:{
            data:[]
        }
//         ,multiSelectWithCheckbox:false
        ,height:208
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:true
//         ,filterable:false
        ,selectable:"single, row"
        ,columns:[
            {field:"id", title:"ID", width:50
            }
            ,{field:"symbolic_name", title:"<spring:message code='global.lbl.symbolicNm' />", width:250
            }
            ,{field:"version", title:"<spring:message code='global.lbl.bundleVerNo' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"modified", title:"<spring:message code='global.title.modifiedDate' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"state", title:"<spring:message code='global.lbl.statNm' />", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                $('#deployHistGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#deployHistGrid').data('kendoExtGrid').dataSource.read();

            } else {

            }
        }

    });

    $("#deployHistGrid").kendoExtGrid({
        dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/dply/dms/dmsProfile/selectBundleDeployHistoryByKey.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       var grid = $("#bundleGrid").data("kendoGrid");
                       dataItem = grid.dataItem(grid.select());

                       params["sSymbolicNm"] = dataItem.symbolic_name;
                       params["sBundleVerNo"] = dataItem.version;
                       params["sDlrCd"] = winOptions.dlrCd;

//                        params["sSymbolicNm"] = 'LogManager';
//                        params["sBundleVerNo"] = '1.0.0';
//                        params["sDlrCd"] = 'D1208';

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"specCd"
                   ,fields:{
                        specCd               :{type:"string"}
                       ,deployVerNo          :{type:"string"}
                       ,deployGrpId          :{type:"string"}
                       ,dlrCd                :{type:"string"}

                   }
               }
            }
        }
        ,multiSelectWithCheckbox:false
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"symbolicNm", title:"<spring:message code='global.lbl.symbolicNm' />", width:250
            }
            ,{field:"bundleVerNo", title:"<spring:message code='global.lbl.bundleVerNo' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm' />", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProcDt", title:"<spring:message code='global.lbl.deployProcDt' />", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=deployRsltCdBySpecTpArray[deployRsltCd]#"
            }
            ,{field:"deployRsltMesgCont", title:"<spring:message code='global.lbl.deployRsltMesgCont' />", width:150
            }
            ,{field:"rollbackOperCmdNm", title:"<spring:message code='global.lbl.rollbackOperCmdNm' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackRsltCd", title:"<spring:message code='global.lbl.rollbackRsltCd' />", width:120
                ,attributes:{"class":"ac"}
                ,template:"#=rollbackRsltCdBySpecTpArray[rollbackRsltCd]#"
            }
            ,{field:"bundleNm", title:"<spring:message code='global.lbl.bundleNm' />", width:300
            }

            ,{title:""}
        ]
        ,change:function(e) {


        }

    });


});

function displayGrid() {

    var params = {};

    params["mesgGrpCd"]           = 'E';           // SyncCommandSndr
    params["mesgCd"]              = '30002';
    params["dlrCd"]               = winOptions.dlrCd;
	params["targFilePathNm"] = cmmPrtyListObj['DMS_WAS_APP_HOME_DIR']
    $.ajax({
        url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            alert("error");
            alert(error);

        },
        success:function(jqXHR, textStatus) {
            processRsltOfSyncCmd(jqXHR, params);
        }
    });

}

function processRsltOfSyncCmd(jqXHR, params) {

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    var objTarget = $(objXML).find('bundle');
    objJson.total = objTarget.length;

    console.log(JSON.stringify(objJson));

//     $('#bundleGrid').data("kendoGrid").dataSource.data(objJson.bundle);

    if(objJson.result == 'OK') {
        $('#bundleGrid').data("kendoGrid").dataSource.data(objJson.bundle);
    } else if(objJson.result == 'NOK') {
        dms.notification.error(objJson.result_msg);
    }
}


</script>










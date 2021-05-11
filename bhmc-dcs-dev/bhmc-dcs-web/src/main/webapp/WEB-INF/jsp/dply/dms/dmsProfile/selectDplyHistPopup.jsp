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

/*
var deployTpArray = [];

$.each(deployTpList, function(idx, obj){
    deployTpArray[obj.cmmCd] = obj.cmmCdNm;
});
*/


//SPEC타입별 DEPLOY결과코드:COM044
var deployRsltCdBySpecTpList = [];
<c:forEach var="obj" items="${deployRsltCdBySpecTpDS}">
deployRsltCdBySpecTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployRsltCdBySpecTpArray = [];
$.each(deployRsltCdBySpecTpList, function(idx, obj){
    deployRsltCdBySpecTpArray[obj.cmmCd] = obj.cmmCdNm;
});
deployRsltCdBySpecTpArray[""] = "";

//SPEC타입별 롤백결과코드:COM045
var rollbackRsltCdBySpecTpList = [];
<c:forEach var="obj" items="${rollbackRsltCdBySpecTpDS}">
rollbackRsltCdBySpecTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var rollbackRsltCdBySpecTpArray = [];
$.each(rollbackRsltCdBySpecTpList, function(idx, obj){
    rollbackRsltCdBySpecTpArray[obj.cmmCd] = obj.cmmCdNm;
});
rollbackRsltCdBySpecTpArray[""] = "";

</script>


<section id="windows" class="pop_wrap">

    <div class="table_grid mt10">
        <div id="masterGrid" class="grid"></div>
    </div>

    <div class="table_grid mt10">
        <div id="detailGrid" class="grid"></div>
    </div>


</section>

<script type="text/javascript">


// DMS측 처리결과 조회
function searchDetail() {
    var grid = $("#masterGrid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    var params = {};

    params["mesgCd"]        = '30007';
    params["mesgGrpCd"]     = 'E';           // SyncCommandSndr

    params["dlrCd"]         = dataItem.dlrCd;
    params["specCd"]        = dataItem.specCd;
    params["deployVerNo"]   = dataItem.deployVerNo;
    params["deployReqSeq"]  = dataItem.deployReqSeq;

//     params["dlrCd"]         = 'D1208';
//     params["specCd"]        = 'TEST040001';
//     params["deployVerNo"]   = '001';
//     params["deployReqSeq"]  = '20160611124905000287';

    //  alert();
    //  return;

    $.ajax({
        url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);

        },
        success:function(jqXHR, textStatus) {
            processRsltOfSyncCmd(jqXHR, params);
        }
    });
}

function processRsltOfSyncCmd(jqXHR, params) {

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    if(params["mesgCd"] == '30007') {  //
        var objTarget = $(objXML).find('mesg_code');
        console.log(JSON.stringify(objJson));

        var grid = $("#detailGrid").data("kendoExtGrid");

        if(objJson.result == 'OK') {
            grid.dataSource.data(objJson.result_list);

        } else if(objJson.result == 'NOK') {
            dms.notification.info(objJson.result_msg);

        }


//         for(var j=0; j<objJson.result_list.length; j++) {
//             var row = objJson.result_list[j];
//             var model = {symbolicNm:row.symbolicname, bundleVerNo:row.version, bundleCont:row.presentationname};
//             grid.dataSource.insert(0, model);
//         }

    }

    //정상적으로 반영 되었습니다.
//     dms.notification.success("<spring:message code='global.info.success'/>");
//     var currentPage = grid.dataSource.page();
//     grid.dataSource.page(currentPage);

}




$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchDplyHistPopupWin.options.content.data;

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#masterGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/dms/dmsProfile/selectDeployReqHistByDlrCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
*/

//                         params["sSpecCd"]      = parentOptions.specCd;
//                         params["sDeployVerNo"] = parentOptions.deployVerNo;
//                         params["sDeployGrpId"] = parentOptions.deployGrpId;
                        params["sDlrCd"]       = parentOptions.dlrCd;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                         deployReqSeq            :{type:'string'}
                        ,deployReqTpCd           :{type:'string'}
                        ,specCd                  :{type:'string'}
                        ,deployVerNo             :{type:'string'}
                        ,deployGrpId             :{type:'string'}
                        ,dlrCd                   :{type:'string'}
                        ,deploySeq               :{type:'number'}
                        ,deployReqEndDt          :{type:'date'}
                        ,deployResTmoutYn        :{type:'string'}
                        ,deployResTmoutProcDt    :{type:'date'}
                        ,deployResReceiveYn      :{type:'string'}
                        ,deployResReceiveDt      :{type:'date'}
                        ,deployRsltCd            :{type:'string'}
                        ,deployResSendReceiveDt  :{type:'date'}
                        ,dbFlashbackYn           :{type:'string'}
                        ,flashbackDt             :{type:'date'}
                    }
                }
            }
        }
        ,dataBound:function(e) {
            var i = 0;
        }
        ,multiSelectWithCheckbox:false
//         ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,autoBind:false
        ,pageable:false
        ,height:150
        ,columns:[
            {field:"specCd", title:"<spring:message code='global.lbl.specCd' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployReqSeq", title:"<spring:message code='global.lbl.deployReqSeq' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"deploySeq", title:"<spring:message code='global.lbl.seq' />", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployRsltDisp", title:"<spring:message code='global.lbl.deployRsltCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployReqEndDt", title:"<spring:message code='global.lbl.deployReqEndDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployResReceiveDt", title:"<spring:message code='global.lbl.deployResReceiveDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

//             ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:80
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=deployRsltTpArray[deployRsltCd]#"
//             }
//             ,{field:"deployReqTpCd", title:"<spring:message code='global.lbl.deployReqTpCd' />", width:70
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=deployReqTpArray[deployReqTpCd]#"
//             }
//             ,{field:"deployResReceiveYn", title:"<spring:message code='global.lbl.deployResReceiveYn' />", width:85
//                 ,attributes:{"class":"ac"}
//             }


            ,{title:""}
         ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

//                 $('#detailGrid').data('kendoExtGrid').dataSource._destroyed = [];
//                 $('#detailGrid').data('kendoExtGrid').dataSource.read();
                searchDetail();
            } else {

            }

        }
         ,dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }
        }


    });

    if(parentOptions.autoBind){
        $("#masterGrid").data("kendoExtGrid").dataSource.read();

    }

    //그리드 설정
    $("#detailGrid").kendoExtGrid({
        dataSource:{
             navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
//                           specTpNm             :{type:'string'}
//                         , seq                  :{type:'number'}
//                         , deployProcYn         :{type:'string'}
//                         , deployProcDt         :{type:'string'}
//                         , deployRsltCd         :{type:'string'}
//                         , deployRsltMesgCont   :{type:'string'}
//                         , operCmdNm            :{type:'string'}
//                         , deployItem           :{type:'string'}
//                         , rollbackRsltCd       :{type:'string'}
//                         , rollbackRsltMesgCont :{type:'string'}
                    }
                }
            }
        }
        ,dataBound:function(e) {
            var i = 0;
        }
        ,multiSelectWithCheckbox:false
//         ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,autoBind:false
        ,pageable:false
        ,height:180
        ,columns:[
            {field:"spec_tp_nm", title:"<spring:message code='global.lbl.specTpNm' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"seq", title:"<spring:message code='global.lbl.seq' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"deploy_proc_yn", title:"<spring:message code='global.lbl.deployProcYn' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"deploy_proc_dt", title:"<spring:message code='global.lbl.deployProcDt' />", width:130
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dt = dataItem.deploy_proc_dt;
                    if(typeof dt == 'undefined' || dt == null || dt == 'null') {
                        return '';
                    } else {
                        return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8) + ' ' + dt.substring(8,10) + ':' + dt.substring(10,12) + ':' + dt.substring(12,14);
                    }
                }

            }
            ,{field:"deploy_rslt_cd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=deployRsltCdBySpecTpArray[deploy_rslt_cd]#"

            }
            ,{field:"deploy_rslt_mesg_cont", title:"<spring:message code='global.lbl.deployRsltMesgCont' />", width:190
            }
            ,{field:"rollback_rslt_cd", title:"<spring:message code='global.lbl.rollbackRsltCd' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=rollbackRsltCdBySpecTpArray[rollback_rslt_cd]#"
            }
//             ,{field:"rollbackRsltMesgCont", title:"<spring:message code='global.lbl.rollbackRsltMesgCont' />", width:200
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"deployItem", title:"<spring:message code='global.lbl.specTpNm' />", width:400
//             }

            ,{title:""}
         ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                var noteAreaText = 'Result Message :\n' + selectedVal.deployRsltMesgCont + '\n\nRollback Result Message :\n' + selectedVal.rollbackRsltMesgCont + '\n\nDeploy Item :\n' + selectedVal.deployItem;
                $("#noteArea").val(noteAreaText);

            } else {

            }


        },dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }
        }


    });



});
</script>










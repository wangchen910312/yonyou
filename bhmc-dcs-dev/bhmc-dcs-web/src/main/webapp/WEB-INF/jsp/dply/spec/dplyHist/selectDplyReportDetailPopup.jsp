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

// DEPLOY결과코드:COM041
var deployRsltTpList = [];
<c:forEach var="obj" items="${deployRsltTpDS}">
deployRsltTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployRsltTpArray = [];
$.each(deployRsltTpList, function(idx, obj){
    deployRsltTpArray[obj.cmmCd] = obj.cmmCdNm;
});


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


//Deploy요청유형코드:COM047
var deployReqTpList = [];
<c:forEach var="obj" items="${deployReqTpDS}">
deployReqTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployReqTpArray = [];
$.each(deployReqTpList, function(idx, obj){
    deployReqTpArray[obj.cmmCd] = obj.cmmCdNm;
});
deployReqTpArray[null] = '';



</script>


<section id="windows" class="pop_wrap">

    <div class="table_grid mt10">
        <div id="masterGrid" class="grid"></div>
    </div>

    <div class="table_grid mt10">
        <div id="detailGrid" class="grid"></div>
    </div>

    <div class="table_grid mt10">
       <textarea id="noteArea" name="noteArea" rows="15" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" ></textarea>
    </div>


</section>

<script type="text/javascript">
$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchDplyReportDetailPopupWin.options.content.data;

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#masterGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/dplyHist/selectDeployReportMasterByCondition.do' />"
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

                        params["sSpecCd"]      = parentOptions.specCd;
                        params["sDeployVerNo"] = parentOptions.deployVerNo;
                        params["sDeployGrpId"] = parentOptions.deployGrpId;
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
        ,height:90
        ,columns:[
            {field:"deployReqSeq", title:"<spring:message code='global.lbl.deployReqSeq' />", width:150
                ,attributes:{"class":"ac"}
            }

            ,{field:"deployReqTpCd", title:"<spring:message code='global.lbl.deployReqTpCd' />", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=deployReqTpArray[deployReqTpCd]#"
            }
            ,{field:"deploySeq", title:"<spring:message code='global.lbl.seq' />", width:50
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployReqEndDt", title:"<spring:message code='global.lbl.deployReqEndDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployResReceiveYn", title:"<spring:message code='global.lbl.deployResReceiveYn' />", width:85
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployResReceiveDt", title:"<spring:message code='global.lbl.deployResReceiveDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:80
                ,attributes:{"class":"ac"}
//                 ,template:"#=deployRsltTpArray[deployRsltCd]#"
            }
            ,{field:"deployResTmoutYn", title:"<spring:message code='global.lbl.deployResTmoutYn' />", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"dbFlashbackYn", title:"<spring:message code='global.lbl.dbFlashbackYn' />", width:100
                ,attributes:{"class":"ac"}
            }


            ,{title:""}
         ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                $('#detailGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#detailGrid').data('kendoExtGrid').dataSource.read();

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

    if(parentOptions.autoBind){
        $("#masterGrid").data("kendoExtGrid").dataSource.read();

    }

    //그리드 설정
    $("#detailGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/dplyHist/selectDeployReportDetailByCondition.do' />"
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
                        var grid = $("#masterGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());


                        params["sSpecCd"]       = dataItem.specCd;
                        params["sDeployReqSeq"] = dataItem.deployReqSeq;

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
                    id:"seq"
                    ,fields:{
                          specTpNm             :{type:'string'}
                        , seq                  :{type:'number'}
                        , deployProcYn         :{type:'string'}
                        , deployProcDt         :{type:'string'}
                        , deployRsltCd         :{type:'string'}
                        , deployRsltMesgCont   :{type:'string'}
                        , operCmdNm            :{type:'string'}
                        , deployItem           :{type:'string'}
                        , rollbackRsltCd       :{type:'string'}
                        , rollbackRsltMesgCont :{type:'string'}
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
            {field:"specTpNm", title:"<spring:message code='global.lbl.specTp' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"seq", title:"<spring:message code='global.lbl.seq' />", width:50
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProcYn", title:"<spring:message code='global.lbl.deployProcYn' />", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProcDt", title:"<spring:message code='global.lbl.deployProcDt' />", width:130
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dt = dataItem.deployProcDt;
                    if(dt == 'undefined' || dt == null) {
                        return '';
                    } else {
                        return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8) + ' ' + dt.substring(8,10) + ':' + dt.substring(10,12) + ':' + dt.substring(12,14);
                    }
                }

            }
            ,{field:"operCmdNm", title:"<spring:message code='global.lbl.operCmdNm' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployRsltCd", title:"<spring:message code='global.lbl.deployRsltCd' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=deployRsltCdBySpecTpArray[deployRsltCd]#"

            }
            ,{field:"deployRsltMesgCont", title:"<spring:message code='global.lbl.deployRsltMesgCont' />", width:200
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackRsltCd", title:"<spring:message code='global.lbl.rollbackRsltCd' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=rollbackRsltCdBySpecTpArray[rollbackRsltCd]#"
            }
            ,{field:"rollbackRsltMesgCont", title:"<spring:message code='global.lbl.rollbackRsltMesgCont' />", width:200
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployItem", title:"<spring:message code='global.lbl.specTpNm' />", width:400
            }

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










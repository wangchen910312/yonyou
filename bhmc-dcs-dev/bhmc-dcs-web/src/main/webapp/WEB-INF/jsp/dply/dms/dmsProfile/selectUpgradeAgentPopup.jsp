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
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>


</script>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnUpgrade" class="btn_m btn_Select">Upgrade</button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.repositorySelect' /></th>
                    <td>
                        <input id="repository" class="form_comboBox">
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>


    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
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
     var parentOptions = parent.searchUpgradeAgentPopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
//             $("#grid").data("kendoExtGrid").dataSource.read();
            displayGrid();
        }
    });

    // 추가 버튼
    $("#btnUpgrade").kendoButton({
        click:function(e) {
            upgradeAgent();
        }
    });

    //

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:true
        ,height:260
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"symbolicname", title:"<spring:message code='global.lbl.symbolicNm' />", width:220
            }
            ,{field:"presentationname", title:"<spring:message code='global.lbl.bundleNm' />", width:220
            }
            ,{field:"version", title:"<spring:message code='global.lbl.bundleVerNo' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"size", title:"<spring:message code='global.lbl.appSize' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"uri", title:"<spring:message code='global.lbl.appUrl' />", width:500
            }

            ,{title:""}
        ]
        ,dataBound:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }
        }
    });

    if(parentOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }


    var cmmPrtyDataSource = new kendo.data.DataSource({
        autoSync:false,
        transport:{
            read:{
                url:"<c:url value='/dply/cmm/mng/selectCmmPrtyList.do' />"
                ,async:false
                ,type:"POST"
                ,contentType:"application/json"
                ,dataType:"json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};
//                     params["sPrtyNm"] = 'LOCAL_DMS_BUNDLE_REPO_URL';

                    return kendo.stringify(params);

                } else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            model:{
                id:"prtyNm"
                ,fields:{
                    specCd:{type:"string"}
                }
            }
            ,data:"data"
        }

    });

    var LOCAL_DMS_AGENT_APP_REPO_URL = null;

    cmmPrtyDataSource.read().then(function() {
        var view = cmmPrtyDataSource.view();

        var filtered = $.grep(view, function(v) {
           if(v.prtyNm == 'LOCAL_DMS_AGENT_APP_REPO_URL') {
               return v;
           }
        });

//         alert(JSON.stringify(filtered));
        if(filtered.length == 1) {
            LOCAL_DMS_AGENT_APP_REPO_URL = filtered[0].prtyVal;

        }

    });

    var repositoryDataSource = new kendo.data.DataSource({
        autoSync:false,
        transport:{
            read:{
                url:"<c:url value='/dply/dms/dmsProfile/selectRepository.do' />"
                ,async:false
                ,type:"POST"
                ,contentType:"application/json"
                ,dataType:"json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};
                    return kendo.stringify(params);

                } else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            model:{
                id:"repoUrlNm"
                ,fields:{
                    repoUrlNm:{type:"string"}
                }
            }
            ,data:"data"
        }

    });

    repositoryDataSource.read().then(function() {
        var view = repositoryDataSource.view();

        var filtered = $.grep(view, function(v) {
            if(v.repoUrlNm == LOCAL_DMS_AGENT_APP_REPO_URL) {
                return v;
            }
        });

        $("#repository").kendoExtDropDownList({
            dataTextField :"repoUrlCont"
           ,dataValueField:"repoUrlNm"
           ,dataSource:filtered
        });

        $('#btnSearch').click();

    });


    function displayGrid() {
        var params = {};

        params["mesgCd"]      = '30015';       // OSGi Bundle Repository Resource Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
        params["dlrCd"]       = parentOptions.dlrCd;
        params["repository"]  = $('#repository').data('kendoExtDropDownList').value();


        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
//                 dms.notification.error(error);

            },
            success:function(jqXHR, textStatus) {
                processRsltOfSyncCmd(jqXHR, params);
            }
        });

    }

    function processRsltOfSyncCmd(jqXHR, params) {
        var view = cmmPrtyDataSource.view();

        var dmsDplySvrBundleNm = $.grep(view, function(v) {
           if(v.prtyNm == 'DMS_DPLY_SVR_BUNDLE_NM') {
               return v;
           }
        });

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('resource');
        objJson.total = objTarget.length;
/*
        var filtered = $.grep(objJson.resource, function(v) {
//             if(1 == 1) {
//             if(v.symbolicname == 'bhmc.dms.dplysvr.DmsDeploySvr') {
            if(v.symbolicname == dmsDplySvrBundleNm[0].prtyVal) {
                return v;
            }
        });

//         $('#grid').data("kendoExtGrid").dataSource.data(objJson.resource);

        filtered.sort(function(a,b) {
            if(a.version == b.version) return 0;
            return a.version < b.version ? 1:-1;
        });

        $('#grid').data("kendoExtGrid").dataSource.data(filtered);
//         $('#grid').data("kendoExtGrid").dataSource.sort({field:'version', dir:'desc'});
*/

        if(objJson.result == 'OK') {
            var filtered = $.grep(objJson.resource, function(v) {
                if(v.symbolicname == dmsDplySvrBundleNm[0].prtyVal) {
                    return v;
                }
            });

            filtered.sort(function(a,b) {
                if(a.version == b.version) return 0;
                return a.version < b.version ? 1:-1;
            });

            $('#grid').data("kendoExtGrid").dataSource.data(filtered);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }

    }

    // DMS Agent Upgrade
    function upgradeAgent() {

        var grid = $("#grid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());

        if(dataItem == null) {
            return;
        }

        // 진행하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }

        var params = {};

        params["mesgCd"]       = '30011';       //
        params["mesgGrpCd"]    = 'E';           //
        params["dlrCd"]        = parentOptions.dlrCd;

        params["symbolicName"] = dataItem.symbolicname;
        params["version"]      = dataItem.version;
        params["repository"]   = $('#repository').data('kendoExtDropDownList').value();

//         params["symbolicName"] = "bhmc.dms.dplysvr.DmsDeploySvr";
//         params["version"]      = "1.0.0";
//         params["repository"]   = "http://10.125.211.116:8081/nexus/content/repositories/bhmc-dms-dplysvr-releases/.meta/obr.xml";

//         alert(JSON.stringify(params));
        console.log(JSON.stringify(params));

//         return;

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert("error");
//                 alert(error);

            },
            success:function(jqXHR, textStatus) {
                processRsltOfUpgrade(jqXHR, params);
            }
        });

    }

    function processRsltOfUpgrade(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        console.log(JSON.stringify(objJson));

        if(objJson.result == 'OK') {
            dms.notification.success("<spring:message code='cmm.info.upgradeCompleted' />");     // Upgrade 되었습니다.
        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }


//         var objTarget = $(objXML).find('resource');
//         objJson.total = objTarget.length;

//         $('#grid').data("kendoExtGrid").dataSource.data(objJson.resource);

    }


});
</script>










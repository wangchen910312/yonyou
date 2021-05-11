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



</script>


<section id="windows" class="pop_wrap">

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="searchTab" class="k-state-active"><spring:message code='global.title.objectSearch' /></li>
            <li id="tableTab">Table</li>
            <li id="viewTab">View</li>
            <li id="procedureTab">Procedure</li>
            <li id="functionTab">Function</li>
            <li id="indexTab">Index</li>
        </ul>

        <div>
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:25%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">Object Name</th>
                            <td>
                                <input id="sObjectNm" type="text" class="form_input">
                            </td>
                            <th scope="row"></th>
                            <td class="ar">
                                <button class="btn_s" id="btnSearch" ><spring:message code='global.btn.search' /></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <div id="objectGrid"></div>
            </div>
        </div>

        <!--  Table Tab 시작 -->
        <div>
            <div class="table_grid">
                <div id="tableGrid"></div>
            </div>
        </div>
        <!--  Table Tab 끝 -->


        <!--  View Tab 시작 -->
        <div>
            <div id="tab03">
                <textarea id="viewCont" name="viewCont" rows="14" placeholder="" class="form_textarea" data-json-obj="true" style="height:330px;"></textarea>
            </div>
        </div>
        <!--  view Tab 끝 -->


        <!--  Procedure Tab 시작 -->
        <div>
            <div id="tab01">
                <textarea id="procedureCont" name="procedureCont" rows="14" placeholder="" class="form_textarea" data-json-obj="true" style="height:330px;"></textarea>
            </div>
        </div>
        <!--  Procedure Tab 끝 -->


        <!--  Function Tab 시작 -->
        <div>
            <div id="tab02">
                <textarea id="functionCont" name="functionCont" rows="14" placeholder="" class="form_textarea" data-json-obj="true" style="height:330px;"></textarea>
            </div>
        </div>
        <!--  Function Tab 끝 -->


        <!--  Index Tab 시작 -->
        <div>
            <div class="table_grid">
                <div id="indexGrid"></div>
            </div>
        </div>
        <!--  Index Tab 끝 -->

        <!--  끝 -->
    </div>

</section>

<script type="text/javascript">

var winOptions = null;

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var idx = $(e.item).index();
//             alert(idx);

            if(idx == 0) {  // 기본정보

            } else if(idx == 1){
                searchTable();

            } else if(idx == 2){
                searchView();

            } else if(idx == 3){
                searchProcedure();

            } else if(idx == 4){
                searchFunction();

            } else if(idx == 5){
                searchIndex();

            }
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            searchObject();
        }
    });


    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     winOptions = parent.searchDBObjectPopupWin.options.content.data;
     if (winOptions.displayGrid) {
//          displayGrid();
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
    $("#objectGrid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:true
        ,height:288
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"single, row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"object_name", title:"Object Name", width:220
            }
            ,{field:"object_type", title:"Object Type", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"last_ddl_time", title:"<spring:message code='global.lbl.lstUpdtDt' />", width:160
            }
            ,{field:"status", title:"Status", width:100
                ,attributes:{"class":"ac"}
            }
//             ,{field:"uri", title:"<spring:message code='global.lbl.appUrl' />", width:500
//             }

            ,{title:""}
        ]

    });

    $("#objectGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#objectGrid").data("kendoExtGrid");
        var rows = grid.select();

        if(rows !== null)
        {
            var data = [];
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });

            var tabIndex = [];
            tabIndex['TABLE']     = $('#tableTab').index();
            tabIndex['VIEW']      = $('#viewTab').index();
            tabIndex['PROCEDURE'] = $('#procedureTab').index();
            tabIndex['FUNCTION']  = $('#functionTab').index();
            tabIndex['INDEX']     = $('#indexTab').index();

//             alert(tabIndex[data[0].object_type]);

            if(typeof tabIndex[data[0].object_type] == 'undefined') {
                return false;
            }

            $("#tabstrip").data("kendoExtTabStrip").select(tabIndex[data[0].object_type]);

//             var activeTab = $("#" + tabIndex[data[0].object_type]);
//             $('#tabstrip').kendoExtTabStrip().data("kendoExtTabStrip").activateTab(activeTab);

//             $('#tabstrip').kendoExtTabStrip().data("kendoExtTabStrip").activateTab($(tabIndex[data[0].object_type]));

//             $('#tabstrip').data('kendoExtTabStrip').activateTab(tabIndex[data[0].object_type]);
//             $('#tabstrip').data('').index(tabIndex[data[0].object_type]);


        }

    });

    $("#tableGrid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:true
        ,height:330
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"single, row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"column_name", title:"Column Name", width:220
            }
            ,{field:"column_desc", title:"Description", width:120
            }
            ,{field:"type", title:"Type", width:100
            }
            ,{field:"length", title:"Length", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"nullable", title:"Nullable", width:100
            }
            ,{field:"uk", title:"Unique Key", width:100
            }
            ,{field:"pk", title:"Primary Key", width:100
            }
            ,{field:"fk", title:"Foreign Key", width:100
            }
            ,{title:""}
        ]

    });


    $("#indexGrid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:true
        ,height:330
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"single, row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"table_name", title:"Table Name", width:160
            }
            ,{field:"index_name", title:"Index Name", width:160
            }
            ,{field:"column_name", title:"Column Name", width:160
            }
            ,{field:"column_position", title:"Column Position", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"descend", title:"Descend", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]

    });



    function searchObject() {
        var params = {};

        params["mesgCd"]      = '30016';       // Sync DMS DB Object Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr

//         if(dms.string.isEmpty($('#sDlrCdSql').val())) {
//             dms.notification.info("<spring:message code='global.lbl.dlrCd' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
//             return false;
//         }

        params["dlrCd"]       = winOptions.dlrCd;
        params["objectNm"]    = $('#sObjectNm').val();

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                $('#objectGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#objectGrid').data('kendoExtGrid').dataSource.data([]);

                postSearchObject(jqXHR, params);
            }
        });

    }

    function postSearchObject(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));
/*
        if(objJson.total == 1) {
            var list = [];
            list[0] = objJson.result_list;
            $('#objectGrid').data("kendoExtGrid").dataSource.data(list);
        } else {
            $('#objectGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
        }
*/
        if(objJson.result == 'OK') {
            if(objJson.total == 1) {
                var list = [];
                list[0] = objJson.result_list;
                $('#objectGrid').data("kendoExtGrid").dataSource.data(list);
            } else {
                $('#objectGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
            }

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }

/*
        var requestXml = jqXHR.replace("<wholeMessage>\r\n", "");
        requestXml = requestXml.substring(0, requestXml.indexOf("</deploy>", 0)+9);
        $("#sqlRequestXml").val(requestXml);

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var reponseMessage = "";
        reponseMessage += "결과:" + objJson.deploy[1].result;
        reponseMessage += "\n\n";
        reponseMessage += "결과메시지:\n" + objJson.deploy[1].result_msg;

        $("#sqlResponseXml").val(reponseMessage);
        $('#syncCommandSendReceiveHistoryGrid').data('kendoExtGrid').dataSource.page(1);
*/
    }



    function searchTable() {
        var params = {};

        params["mesgCd"]      = '30017';       // Sync DMS Table Structure Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr

        var grid = $("#objectGrid").data("kendoExtGrid");
        var rows = grid.select();

        var data = [];
        if(rows !== null) {
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        if(data.length == 0) {
            return false;
        }

        if(data[0].object_type != 'TABLE') {
            return false;
        }

        params["dlrCd"]       = winOptions.dlrCd;
        params["objectNm"]    = data[0].object_name;

        $('#tableGrid').data('kendoExtGrid').dataSource._destroyed = [];
        $('#tableGrid').data('kendoExtGrid').dataSource.data([]);

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                postSearchTable(jqXHR, params);
            }
        });

    }


    function postSearchTable(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));
/*
        if(objJson.total == 1) {
            var list = [];
            list[0] = objJson.result_list;
            $('#tableGrid').data("kendoExtGrid").dataSource.data(list);
        } else {
            $('#tableGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
        }
*/
        if(objJson.result == 'OK') {
            if(objJson.total == 1) {
                var list = [];
                list[0] = objJson.result_list;
                $('#tableGrid').data("kendoExtGrid").dataSource.data(list);
            } else {
                $('#tableGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
            }

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }



//         $('#tableGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);

    }



    function searchView() {
        var params = {};

        params["mesgCd"]      = '30022';       // Sync DMS View Source Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr

        var grid = $("#objectGrid").data("kendoExtGrid");
        var rows = grid.select();

        var data = [];
        if(rows !== null) {
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        if(data.length == 0) {
            return false;
        }

        if(data[0].object_type != 'VIEW') {
            return false;
        }

        params["dlrCd"]       = winOptions.dlrCd;
        params["objectNm"]    = data[0].object_name;

        $('#viewCont').val("");

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                postSearchView(jqXHR, params);
            }
        });

    }


    function postSearchView(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));

//         $('#viewCont').val(objJson.text);

        if(objJson.result == 'OK') {
            $('#viewCont').val(objJson.text);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }


    }


    function searchProcedure() {
        var params = {};

        params["mesgCd"]      = '30018';       // Sync DMS Table Structure Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr

        var grid = $("#objectGrid").data("kendoExtGrid");
        var rows = grid.select();

        var data = [];
        if(rows !== null) {
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        if(data.length == 0) {
            return false;
        }

        if(data[0].object_type != 'PROCEDURE') {
            return false;
        }

        params["dlrCd"]       = winOptions.dlrCd;
        params["objectNm"]    = data[0].object_name;

        $('#procedureCont').val("");

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                postSearchProcedure(jqXHR, params);
            }
        });

    }


    function postSearchProcedure(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));

//         $('#procedureCont').val(objJson.text);

        if(objJson.result == 'OK') {
            $('#procedureCont').val(objJson.text);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }


    }




    function searchFunction() {
        var params = {};

        params["mesgCd"]      = '30018';       // Sync DMS Table Structure Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr

        var grid = $("#objectGrid").data("kendoExtGrid");
        var rows = grid.select();

        var data = [];
        if(rows !== null) {
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        if(data.length == 0) {
            return false;
        }

        if(data[0].object_type != 'FUNCTION') {
            return false;
        }

        params["dlrCd"]       = winOptions.dlrCd;
        params["objectNm"]    = data[0].object_name;

        $('#functionCont').val("");

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                postSearchFunction(jqXHR, params);
            }
        });

    }


    function postSearchFunction(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));

//         $('#functionCont').val(objJson.text);

        if(objJson.result == 'OK') {
            $('#functionCont').val(objJson.text);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }


    }



    function searchIndex() {
        var params = {};

        params["mesgCd"]      = '30021';       // Symc DMS Index Structure Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr

        var grid = $("#objectGrid").data("kendoExtGrid");
        var rows = grid.select();

        var data = [];
        if(rows !== null) {
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        if(data.length == 0) {
            return false;
        }

        if(data[0].object_type != 'INDEX') {
            return false;
        }

        params["dlrCd"]       = winOptions.dlrCd;
        params["objectNm"]    = data[0].object_name;

        $('#indexGrid').data('kendoExtGrid').dataSource._destroyed = [];
        $('#indexGrid').data('kendoExtGrid').dataSource.data([]);

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                alert(error);

            },
            success:function(jqXHR, textStatus) {
                postSearchIndex(jqXHR, params);
            }
        });

    }


    function postSearchIndex(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));
/*
        if(objJson.total == 1) {
            var list = [];
            list[0] = objJson.result_list;
            $('#indexGrid').data("kendoExtGrid").dataSource.data(list);
        } else {
            $('#indexGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
        }
*/
        if(objJson.result == 'OK') {
            if(objJson.total == 1) {
                var list = [];
                list[0] = objJson.result_list;
                $('#indexGrid').data("kendoExtGrid").dataSource.data(list);
            } else {
                $('#indexGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
            }
        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }



//         $('#indexGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);

    }


















});

















function displayGrid() {

    var params = {};

    params["mesgGrpCd"]           = 'E';           // SyncCommandSndr
    params["mesgCd"]              = '30002';
    params["dlrCd"]               = winOptions.dlrCd;

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

//     $('#bundleGrid').data("kendoExtGrid").dataSource.data(objJson.bundle);

    if(objJson.result == 'OK') {
        $('#bundleGrid').data("kendoExtGrid").dataSource.data(objJson.bundle);
    } else if(objJson.result == 'NOK') {
        dms.notification.error(objJson.result_msg);
    }
}


</script>










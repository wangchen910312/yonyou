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

<style>
    .node-link {

    }
</style>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnAdd" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="clfix">
        <!-- content_left -->
        <div class="content_left" style="width:400px">
            <section class="group">
                <div class="table_grid" style="overflow:auto; height:420px; padding:0 5px 10px; border:1px solid #e7e7e7;">
                    <div id="viewHierarchyTree" class="treeview"></div>
                </div>
            </section>
        </div>
        <!-- //content_left -->
        <!-- content_right -->
        <div class="content_right" style="margin-left:410px;">
            <div class="table_form" id="specInfoForm01">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:100%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="al">FILE URL</td>
                        </tr>
                        <tr>
                            <td>
                                <textarea id="fileurl" name="fileurl" readonly rows="4" cols="30" placeholder="" class="form_textarea form_readonly" data-json-obj="true"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="al">FILE PATH</td>
                        </tr>
                        <tr>
                            <td>
                                <textarea id="filepath" name="filepath" readonly rows="4" cols="30" placeholder="" class="form_textarea form_readonly" data-json-obj="true"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="al">FILE NAME</td>
                        </tr>
                        <tr>
                            <td>
                                <input id="filename" name="filename" readonly class="form_input form_readonly" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <td class="al">수정일</td>
                        </tr>
                        <tr>
                            <td>
                                <input id="moddt" name="moddt" readonly class="form_input form_readonly" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <td class="al">FILE SIZE</td>
                        </tr>
                        <tr>
                            <td>
                                <input id="filesize" name="filesize" readonly class="form_input form_readonly" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="targpath" name="targpath" readonly class="form_input form_readonly" data-json-obj="true" type="hidden">
                                <input id="symbolic_name" name="symbolic_name" readonly class="form_input form_readonly" data-json-obj="true" type="hidden">
                                <input id="version" name="version" readonly class="form_input form_readonly" data-json-obj="true" type="hidden">
                                <input id="app_name" name="app_name" readonly class="form_input form_readonly" data-json-obj="true" type="hidden">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


</section>

<script id="treeview-template" type="text/kendo-ui-template">
    <span class='node-link'>
    #:item.filename #
    </span>
</script>

<script type="text/javascript">

$(document).ready(function() {


    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchSrcAppPopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/

    // 버튼.
    $("#btnAdd").kendoButton({
        click:function(e){
            addFileUrl();
        }
    });

//     var rootFilepath = "C:\Servers\nexus\sonatype-work\nexus\storage\bhmc-dcs-dplysvr-releases\file_deploy";
//     var rootFilepath = "C:\\Servers\\nexus\\sonatype-work\\nexus\\storage\\bhmc-dcs-dplysvr-releases\\file_deploy";
//     var exp = new RegExp("\\", "g");
//     rootFilepath = rootFilepath.replace(exp, "\\\\");
//     rootFilepath = rootFilepath.replace(/\\/g, "\\\\");

//     var rootFilepath = "C:\\Servers\\nexus\\sonatype-work\\nexus\\storage\\bhmc-dcs-dplysvr-releases\\file_deploy";

    var viewHierarchyTree = $("#viewHierarchyTree").kendoTreeView({
//         template:kendo.template($("#treeview-template").html()),
        dataSource:{
            data:[
//                 { filename:"file_deploy", filetype:"D", filepath:rootFilepath, spriteCssClass:"folder"}
            ]
        },
        dataTextField:"filename",
        dataValueField:"filepath",
        loadOnDemand:false,
        select:function(e){
            if(e.node){
                dataItem = this.dataItem(e.node)

                if(dataItem.filetype == "F") {
                    displayItem(dataItem);
                }

                if(dataItem.filetype == "D" && dataItem.hasChildren == false) {
                    searchDirectoryPath(e.node, dataItem.filepath);
                }
            }
        }

    }).data("kendoTreeView");


    $(document).on("click", ".node-link", function(e) {
/*
        e.preventDefault();
        var treeview = $("#viewHierarchyTree").data("kendoTreeView");

        var node = $(this).closest(".k-item");
        var dataItem = treeview.dataItem(node);

        if(dataItem.filetype == "D" && dataItem.hasChildren == false) {
            searchDirectoryPath(node, dataItem.filepath);
        }
*/
    });

    function displayItem(dataItem) {
        $("#fileurl").val(dataItem.fileurl);
        $("#filepath").val(dataItem.filepath);
        $("#targpath").val(dataItem.targpath);
        $("#filename").val(dataItem.filename);
        $("#moddt").val(dataItem.moddt);
        $("#filesize").val(dataItem.filesize);
        $("#symbolic_name").val(dataItem.symbolic_name);
        $("#version").val(dataItem.version);
        $("#app_name").val(dataItem.app_name);
    }

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (parentOptions.specCd) {
//         $("#sSpecCd").val(parentOptions.specCd);
    }

    if (parentOptions.displayGrid) {

    }


    if(parentOptions.autoBind){
//         $("#grid").data("kendoExtGrid").dataSource.read();
    }


    function searchDirectoryPath(node, directoryPath) {
        var params = {};

        params["mesgCd"]      = '10017';       // DCS File List Query
        params["mesgGrpCd"]   = 'I';           // SyncCommandSndr
        params["directoryPath"]  = directoryPath;

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
                postProcSearchDirectoryPath(jqXHR, params, node);
            }
        });

    }

    function postProcSearchDirectoryPath(jqXHR, params, node) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('file_list');
        objJson.total = objTarget.length;

        var appendNodes = [];
        if(objJson.total == 0) {

        } if(objJson.total == 1) {
            if(objJson.file_list.filetype == "D") {
                objJson.file_list.spriteCssClass = 'folder';
            } else if(objJson.file_list.filetype == "F") {
                objJson.file_list.spriteCssClass = 'item';
            }
            appendNodes[0] = objJson.file_list;

        } else if(objJson.total > 1) {
            $.each(objJson.file_list, function(idx, row){
                if(row.filetype == "D") {
                    row.spriteCssClass = 'folder';
                } else if(row.filetype == "F") {
                    row.spriteCssClass = 'item';
                }
                appendNodes.push(row);
            });

        }

        if(objJson.total > 0) {
            viewHierarchyTree.append(appendNodes, viewHierarchyTree.select());
        }

    }

    function initTree() {

        var rootNode = viewHierarchyTree.findByText("DCS_APP_DEPLOY_HOME_DIR");
        viewHierarchyTree.select(rootNode);
        viewHierarchyTree.trigger("select");

        // temporay code
        searchDirectoryPath(null, viewHierarchyTree.dataItem(rootNode).filepath);
    }

    var cmmPrtyDataSource = new kendo.data.DataSource({
        autoSync:false,
        transport:{
            read:{
                url:"<c:url value='/dply/cmm/mng/selectCmmPrtyList.do' />"
                ,type:"POST"
                ,contentType:"application/json"
                ,dataType:"json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};
//                     params["sPrtyNm"] = 'DCS_FILE_DEPLOY_HOME_DIR';

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

    cmmPrtyDataSource.read().then(function() {
        var view = cmmPrtyDataSource.view();
        var filtered = $.grep(view, function(v) {
           if(v.prtyNm == 'DCS_APP_DEPLOY_HOME_DIR') {
               return v;
           }
        });

//         alert(JSON.stringify(filtered));

        if(filtered.length == 1) {
            var rootFilepath = null;

//             rootFilepath = cmmPrtyListObj['DCS_FILE_DEPLOY_HOME_DIR'];
//             rootFilepath = "C:\\Servers\\nexus\\sonatype-work\\nexus\\storage\\bhmc-dcs-dplysvr-releases\\file_deploy";
            rootFilepath = filtered[0].prtyVal;

            var rootNode = { filename:"DCS_APP_DEPLOY_HOME_DIR", filetype:"D", filepath:rootFilepath, spriteCssClass:"folder" };
            viewHierarchyTree.append(rootNode);

            initTree();
        }

    });

    // 추가
    function addFileUrl() {

//         var insertList = [];
        if($(symbolic_name).val() == ""){
            //입력값을 확인하여 주십시오.
               dms.notification.warning("<spring:message code='global.info.check.input'/>");
                return false;
            }

        var param = {

               "symbolicNm"   :$("#symbolic_name").val()
              ,"bundleVerNo" :$("#version").val()
              ,"bundleNm"    :$("#app_name").val()
              ,"size":$("#filesize").val(dataItem.filename)
              ,"targFilePathNm":$("#targpath").val()
              ,"srcFilePathNm":$("#fileurl").val()
        };

        parentOptions.callbackFunc(param);

    }

});

</script>

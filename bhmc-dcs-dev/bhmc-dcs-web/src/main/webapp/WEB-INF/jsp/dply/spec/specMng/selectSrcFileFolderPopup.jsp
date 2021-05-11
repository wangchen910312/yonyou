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
            <button id="btnCho" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>
    <form>
    <div class="table_form_width_100per">
    <table>
                <caption></caption>
                <colgroup style="width:50%;">
                        <col style="width:20%;">
                        <col style="width:77%;">
                  </colgroup>
                <tbody>
                    <tr>
                      <!-- 등록일 -->
                        <td class="al"><spring:message code='global.lbl.updtDt' /> </td>
                        <td>
                            <input id="updateDate" name="updateDate"  class="form_datetimepicker" data-json-obj="true">
                        </td>
                    </tr>


                </tbody>
            </table>
    </div>
</form>
    <div class="clfix" style="margin-top:5px;">
        <!-- content_left -->
        <div class="content_left" style="width:400px">
            <section class="group">
                <div class="table_grid" style="overflow:auto; height:300px; padding:0 5px 10px; border:1px solid #e7e7e7;">
                    <div id="viewHierarchyTree" class="treeview"></div>
                </div>
            </section>
        </div>
        <!-- //content_left -->
        <!-- content_right -->
        <div class="content_right" style="margin-left:410px;">
            <div class="table_form" id="specInfoForm01" style="height:300px;">
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
                                <textarea id="fileurl" name="fileurl" readonly rows="2" cols="30" placeholder="" class="form_textarea form_readonly" data-json-obj="true"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="al">FILE PATH</td>
                        </tr>
                        <tr>
                            <td>
                                <textarea id="filepath" name="filepath" readonly rows="2" cols="30" placeholder="" class="form_textarea form_readonly" data-json-obj="true"></textarea>
                            </td>
                        </tr>
                        <!-- <tr>
                            <td class="al">FILE NAME</td>
                        </tr>
                        <tr>
                            <td>
                                <input id="filename" name="filename" readonly class="form_input form_readonly" data-json-obj="true">
                            </td>
                        </tr> -->
                        <tr>
                            <td class="al"><spring:message code='global.lbl.updtDt' /></td>
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
                            <td>
                                <input id=targpath name="targpath" readonly class="form_input form_readonly" data-json-obj="true" type="hidden">
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="header_area">
        <div class="btn_right">

            <button id="btnDel" class="btn_m btn_Search"><spring:message code="global.btn.del" /></button>
            <button id="btnAdd" class="btn_m btn_Select"><spring:message code="global.btn.add" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>
 <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script id="treeview-template" type="text/kendo-ui-template">
    <span class='node-link'>
    #:item.filename #
    </span>
</script>

<script type="text/javascript">

$(document).ready(function() {
    var _yesterday = (function(){this.setDate(this.getDate()-1);return this})
    .call(new Date)
    $("#updateDate").kendoDateTimePicker({
        format:"yyyy/MM/dd HH:mm:ss"
        ,value:_yesterday
    });
//  $("#updateDate").kendoExtMaskedDatePicker({
//  format:"{0:"+vDtyyyyMMdd+"}"
// ,patternToMask:vDtyyyyMMdd
// ,value:processDate(toDay, cmmPrtyListObj['defaultDate.specList.updateDate'], vDtyyyyMMdd)
// });

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchSrcFileFolderPopupWin.options.content.data;

    var folderfilepath=null;



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
    ,filterable:false
    ,columns:[
     {field : "filename", title : "File Name", width : 400
     }
     ,{field : "fileurl", title : "<spring:message code='global.lbl.srcFilePathNm'/>", width : 250, hidden:true
     }
     ,{field : "targpath", title : "<spring:message code='global.lbl.targFilePathNm' />", width : 250, hidden:true
     }
     ,{field : "moddt", title : "<spring:message code='global.lbl.updtDt' /> ", width : 150
     ,attributes:{"class":"ac"}
     }
     ,{field : "filesize", title : "File Size", width : 150
     ,attributes:{"class":"ac"}
     }
     ,{title:""}
    ]

    });

    /************************************************************
                기능버튼 설정
    *************************************************************/

    // 버튼.
    $("#btnCho").kendoButton({
        click:function(e){
            callDirectoryPath(folderfilepath);
        }
    });

    $("#btnDel").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });
    $("#btnAdd").kendoButton({
        click:function(e) {
            addFolderFile();
        }
    });

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
                    displayItem(dataItem);
                    folderfilepath = dataItem.filepath;
                    searchDirectoryPath(e.node, dataItem.filepath);
                }
            }
        }

    }).data("kendoTreeView");


    $(document).on("click", ".node-link", function(e) {
     /*  alert($("#updateDate").val()); */

    });



    function displayItem(dataItem) {
        $("#fileurl").val(dataItem.fileurl);
        $("#filepath").val(dataItem.filepath);
//         $("#filename").val(dataItem.filename);
        $("#moddt").val(dataItem.moddt);
        $("#filesize").val(dataItem.filesize);
        $("#targpath").val(dataItem.targpath);
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

        params["mesgCd"]      = '10015';       // DCS File List Query
        params["mesgGrpCd"]   = 'I';           // SyncCommandSndr
        params["directoryPath"]  = directoryPath;
//         params["moddt"]  = moddt;

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

        var rootNode = viewHierarchyTree.findByText("DCS_WEB_DEPLOY_HOME_DIR");
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
           if(v.prtyNm == 'DCS_WEB_DEPLOY_HOME_DIR') {
               return v;
           }
        });

//         alert(JSON.stringify(filtered));

        if(filtered.length == 1) {
            var rootFilepath = null;

//             rootFilepath = cmmPrtyListObj['DCS_FILE_DEPLOY_HOME_DIR'];
//             rootFilepath = "C:\\Servers\\nexus\\sonatype-work\\nexus\\storage\\bhmc-dcs-dplysvr-releases\\file_deploy";
            rootFilepath = filtered[0].prtyVal;

            var rootNode = { filename:"DCS_WEB_DEPLOY_HOME_DIR", filetype:"D", filepath:rootFilepath, spriteCssClass:"folder" };
            viewHierarchyTree.append(rootNode);

            initTree();
        }

    });
    function callDirectoryPath(directoryPath) {
        var updateDate = $("#updateDate").data("kendoDateTimePicker");
        var datestring = kendo.toString(updateDate.value(), "yyyy/MM/dd HH:mm:ss");

        if($("#updateDate").val() == ""){
            //입력값을 확인하여 주십시오.
               dms.notification.warning("<spring:message code='global.info.check.input'/>");
                return false;
            }

        if(dataItem.filetype == "F"){
            //입력값을 확인하여 주십시오.
               dms.notification.warning("<spring:message code='global.info.check.onlyFolder'/>");
                return false;
            }

        var params = {};

        params["mesgCd"]      = '10016';       // DCS File List Query
        params["mesgGrpCd"]   = 'I';           // SyncCommandSndr
        params["directoryPath"]  = directoryPath;
         params["updateDate"]  = datestring;

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

                    addFileList(jqXHR, params);
            }
        });

    }

   function addFolderFile(){
       var grid = $("#grid").data("kendoExtGrid");
       var rows = grid.select();
       var insertList = [];

       if(rows !== null) {
           $.each(rows, function(idx, row){
//                insertList.push(grid.dataItem(row));
               var objRow = grid.dataItem(row);
               var obj = {specTpNm:'FILE'
                         ,dlrCdAutoAddYn:cmmPrtyListObj['specReg.file.dlrCdAutoAddYn']
                         ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.file.failAftCtnuPgssYn']
                         ,failAftRollbackYn:cmmPrtyListObj['specReg.file.failAftRollbackYn']
                         ,operTryCnt:cmmPrtyListObj['specReg.file.operTryCnt']
                         ,srcFilePathNm :objRow.fileurl
                         ,targFilePathNm : objRow.targpath

                         };
               insertList.push(obj);
           });
       }else{
           dms.notification.warning("<spring:message code='global.info.check.input'/>");
           return false;
       }

       var param = {
           "insertList":insertList
       }

       parentOptions.callbackFunc(param);
       parent.searchSrcFileFolderPopupWin.close();

   }
});

function addFileList(jqXHR, params) {

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    var objTarget = $(objXML).find('file_list');
    objJson.total = objTarget.length;


    if(objJson.result == 'OK') {
        if(objJson.total == 1) {
            console.log(objJson.file_list);
            var list = [];
            list[0] = objJson.file_list;
            $('#grid').data("kendoExtGrid").dataSource.data(list);
        } else if(objJson.total > 1) {
            $('#grid').data("kendoExtGrid").dataSource.data(objJson.file_list);
        } else {
            $('#grid').data("kendoExtGrid").dataSource.data();
        }
        dms.notification.info("<spring:message code='global.info.searchSuccess'/>");
    } else if(objJson.result == 'NOK') {
        dms.notification.error(objJson.result_msg);
    }

}
</script>
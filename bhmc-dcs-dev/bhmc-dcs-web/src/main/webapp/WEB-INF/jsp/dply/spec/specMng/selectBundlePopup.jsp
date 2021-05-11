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


// REPOSITORY
var repositoryList = [];
<c:forEach var="obj" items="${repositoryDS}">
repositoryList.push({cmmCdNm:"${obj.repoUrlCont}", cmmCd:"${obj.repoUrlNm}"});
</c:forEach>

var repositoryArray = [];
$.each(repositoryList, function(idx, obj){
    repositoryArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY서비스작업명령어코드:COM035
var operCmdTpList = [];
<c:forEach var="obj" items="${operCmdTpDS}">
    operCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var operCmdTpArray = [];
$.each(operCmdTpList, function(idx, obj){
    operCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

</script>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnCho" class="btn_m btn_Search">선택</button>
<%--             <button id="btnDel" class="btn_m btn_Search"><spring:message code="global.btn.del" /></button> --%>
<%--             <button id="btnAdd" class="btn_m btn_Select"><spring:message code="global.btn.add" /></button> --%>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <%-- <div class="table_form" role="search" data-btnid="btnSearch">
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
    </div> --%>
    <form id="appForm" name="appForm" method="POST" onsubmit="return false;">
    <div class="clfix">
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
            <div class="table_form" id="specInfoForm01"  style="height:300px;">
                <table >
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
                                <input id="symbolic_name" name="symbolic_name" readonly class="form_input form_readonly" data-json-obj="true" type="hidden" >
                                <input id="version" name="version" readonly class="form_input form_readonly" data-json-obj="true" type="hidden" >
                                <input id="app_name" name="app_name" readonly class="form_input form_readonly" data-json-obj="true" type="hidden" >
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </form>

    <div class="header_area">
        <div style="visibility:hidden" >
            <tr>
                <td>
                <input id="service_operCmdNm" name="service_operCmdNm" data-json-obj="true" class="form_comboBox" readonly>
                <input id="service_rollbackOperCmdNm" name="service_rollbackOperCmdNm" data-json-obj="true" class="form_comboBox" readonly>
                </td>
            </tr>
        </div>
        <div class="btn_right">
            <button id="btnDel" class="btn_m btn_Search"><spring:message code="global.btn.del" /></button>
            <button id="btnAdd" class="btn_m btn_Select"><spring:message code="global.btn.add" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col style="width:14%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>                         <!-- 실패이후계속진행여부 -->
                    <td>
                        <input id="service_failAftCtnuPgssYn" name="service_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>                         <!-- 실패이후롤백여부 -->
                    <td>
                        <input id="service_failAftRollbackYn" name="service_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>                       <!-- 작업시도횟수 -->
                    <td>
                        <input id="service_operTryCnt" name="service_operTryCnt" class="form_input" data-json-obj="true" >
                    </td>
                </tr>

            </tbody>
        </table>
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

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchBundlePopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
//             $("#grid").data("kendoExtGrid").dataSource.read();
//             searchSrcAppPopup();
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.searchBundlePopupWin.close();
        }
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e) {
            addBundle();
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

    $("#btnCho").kendoButton({
        click:function(e){
            addFileUrl();
        }
    });

    //
    $("#repository").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:repositoryList
    });

    // 작업명령어명
    $("#service_operCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:operCmdTpList
    });

    // 롤백작업명령어명
    $("#service_rollbackOperCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:operCmdTpList
    });


    // SERVICE 실패이후계속진행여부
    $("#service_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["Y", "N"]
    });

    // SERVICE 실패이후롤백여부
    $("#service_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["Y", "N"]
    });



    /************************************************************
                조회조건 설정
    *************************************************************/



    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        /* dataSource:{
            data:[]
        } */
        dataSource : {
            transport : {
                read : {
//                    url : "<c:url value='/dply/cmm/mng/selectAppInfo.do' />"
               }
               ,parameterMap : function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema : {
               model : {
                   id : "symbolicNm"
                   ,fields : {
                       symbolicNm    : {type : "string"}
                       ,bundleNm  : {type : "string"}
                       ,bundleVerNo  : {type : "string"}
                       ,size  : {type : "string"}
                       ,targFilePathNm  : {type : "string"}
                       ,srcFilePathNm  : {type : "string"}
                   }
               }
           }
       }
        ,multiSelectWithCheckbox:true
        ,height:260
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,filterable:false
        ,columns:[
            {field : "symbolicNm", title : "<spring:message code='global.lbl.symbolicNm' />", width : 220
            }
            ,{field : "bundleNm", title : "<spring:message code='global.lbl.bundleNm' />", width : 220
            }
            ,{field : "bundleVerNo", title : "<spring:message code='global.lbl.bundleVerNo' />", width : 100
                ,attributes : {"class" : "ac"}
            }
            ,{field:"size", title:"Size(Bytes)", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"targFilePathNm", width:80, hidden:true
            }
            ,{field:"srcFilePathNm", width:80, hidden:true
            }
            ,{title:""}
        ]

    });

    if(parentOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }


    initDefaultValue();


    // Bundle 추가
    function addBundle() {

        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();
        var insertList = [];

        if(rows !== null) {
            $.each(rows, function(idx, row){
//                 insertList.push(grid.dataItem(row));
                var objRow = grid.dataItem(row);
                var obj = {symbolicNm : objRow.symbolicNm
                         , bundleVerNo : objRow.bundleVerNo
                         , bundleNm : objRow.bundleNm
                         , targFilePathNm : objRow.targFilePathNm
                         , srcFilePathNm  : objRow.srcFilePathNm
//                          , targFilePathNm : cmmPrtyListObj['DMS_WAS_APP_HOME_DIR'] + objRow.symbolicNm
//                          , srcFilePathNm : cmmPrtyListObj['DCS_APP_DEPLOY_HOME_URL'] + objRow.symbolicNm
                         , operCmdNm : $('#service_operCmdNm').data('kendoExtDropDownList').value()
                         , rollbackOperCmdNm : $('#service_rollbackOperCmdNm').data('kendoExtDropDownList').value()
                         , operTryCnt : $('#service_operTryCnt').val()
                         , failAftCtnuPgssYn : $('#service_failAftCtnuPgssYn').data('kendoExtDropDownList').value()
                         , failAftRollbackYn : $('#service_failAftRollbackYn').data('kendoExtDropDownList').value()
                          };
                insertList.push(obj);
            });
        }

/*         operCmdNm           = 'INSTALL';
        operTryCnt          = '1';
        failAftCtnuPgssYn   = 'Y';
        failAftRollbackYn   = 'N';
        rollbackOperCmdNm   = 'UNINSTALL';
 */

        var param = {
            "insertList":insertList
        }

        parentOptions.callbackFunc(param);
        parent.searchBundlePopupWin.close();
    }


    function displayGrid() {
        var params = {};

//         params["ipAddr"]      = '127.0.0.1';   // Temporary Code !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        params["mesgCd"]      = '30015';       // OSGi Bundle Repository Resource Query
//        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
//        params["dlrCd"]       = parentOptions.dlrCd;
//        params["repository"]  = $('#repository').data('kendoExtDropDownList').value();


//         params["repository"]  = '<![CDATA[file:///D:\\develop\\ControlServer\\repository\\repository.xml]]>';

/*         $.ajax({
            url:"<c:url value='/dply/cmm/mng/selectAppInfo.do'/>",
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
        }); */

    }

    function processRsltOfSyncCmd(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('resource');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));

//         $('#grid').data("kendoExtGrid").dataSource.data(objJson.resource);

        if(objJson.result == 'OK') {
            $('#grid').data("kendoExtGrid").dataSource.data(objJson.resource);
        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }

    }

    function initDefaultValue() {
        $('#service_operCmdNm').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.service.operCmdNm']);
        $('#service_rollbackOperCmdNm').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.service.rollbackOperCmdNm']);
        $('#service_operTryCnt').val(cmmPrtyListObj['specReg.service.operTryCnt']);
        $('#service_failAftCtnuPgssYn').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.service.failAftCtnuPgssYn']);
        $('#service_failAftRollbackYn').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.service.failAftRollbackYn']);

    }


    var viewHierarchyTree = $("#viewHierarchyTree").kendoTreeView({
//      template:kendo.template($("#treeview-template").html()),
     dataSource:{
         data:[
//              { filename:"file_deploy", filetype:"D", filepath:rootFilepath, spriteCssClass:"folder"}
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

//              rootFilepath = cmmPrtyListObj['DCS_APP_DEPLOY_HOME_URL'];  //주석
//             rootFilepath = "C:\\Servers\\nexus\\sonatype-work\\nexus\\storage\\bhmc-dcs-dplysvr-releases\\file_deploy";
             rootFilepath = filtered[0].prtyVal;

            var rootNode = { filename:"DCS_APP_DEPLOY_HOME_DIR", filetype:"D", filepath:rootFilepath, spriteCssClass:"folder" };
            viewHierarchyTree.append(rootNode);

            initTree();
        }

    });

    function addFileUrl() {
   var grid = $("#grid").data("kendoExtGrid");
   var row = grid.tbody.find("tr");
   /* var insertList = [];
  var dataItem ={
          "symbolicNm"   :$("#symbolic_name").val()
          ,"bundleVerNo" :$("#version").val()
          ,"bundleNm"    :$("#app_name").val()
          ,"size":$("#filesize").val()
          ,"targFilePathNm":$("#targpath").val()
          ,"srcFilePathNm":$("#fileurl").val()

  };
  insertList.push(dataItem); */

        if($("#symbolic_name").val() == ""){
        //입력값을 확인하여 주십시오.
           dms.notification.warning("<spring:message code='global.info.check.input'/>");
            return false;
        }

      grid.dataSource.insert(0, {
          "symbolicNm"   :$("#symbolic_name").val()
          ,"bundleVerNo" :$("#version").val()
          ,"bundleNm"    :$("#app_name").val()
          ,"size":$("#filesize").val()
          ,"targFilePathNm":$("#targpath").val()
          ,"srcFilePathNm":$("#fileurl").val()
      });




//   var row = grid.tbody.find("tr:eq(0)");
//       if(row.length > 0) {
//           grid.select(row);
//       }


    }



});
</script>










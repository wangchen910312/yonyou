<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="group" style="margin:5px 10px;">

    <div class="header_area">
        <h1 class="title_basic">DMS Update</h1>

        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch">Search</button>
            <button type="button" class="btn_m btn_save" id="btnUpdateDownload">Download</button>
            <button type="button" class="btn_m btn_cancel" id="btnUpdateExecute">Install</button>
            <!-- <button type="button" class="btn_m btn_cancel" id="btnDeploy">Deploy</button> -->
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">Repository URL</th>
                    <td>
                        <input id="repositoryUrl" type="text" value="http://10.125.211.116:8081/nexus/content/repositories/bhmc-dms-patch" class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row">Patch Info File</th>
                    <td>
                        <input id="patchFileName" type="text" value="patchInfo.xml" class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row">Webapps Folder</th>
                    <td>
                        <input id="webappsFolder" type="text" value="D:/apps" class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row">Patch Folder</th>
                    <td>
                        <input id="patchTempFolder" type="text" value="D:/apps/bhmc-dms-patch" class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row">Patch Script File</th>
                    <td>
                        <input id="patchScript" type="text" value="D:/apps/bhmc-dms-patch/patch-bhmc-dms-web.cmd" class="form_input form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
<script type="text/javascript">
var maxExecCnt = 0;
var concurrentExecCnt = 2;
var downloadTimer;
var updateTimer;
var grid;

$(document).ready(function() {

    //버튼 - 업데이트 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            grid.dataSource.read();
        }
    });

    //버튼 - 업데이트 다운로드
    $("#btnUpdateDownload").kendoButton({
        click:function(e) {

            //업데이트 목록 체크
            if(grid.dataSource.data().length == 0){
                return;
            }

            downloadTimer = setInterval(function(){

                if(maxExecCnt < concurrentExecCnt){

                    var moreDownload = false;
                    var patchList = grid.dataSource.data();

                    $.each(patchList, function(idx, dataItem){
                       if(dataItem.downloadStatus == "1"){
                           moreDownload = true;
                           $.ajax({
                               url:"<c:url value='/cmm/mig/selectPatchFileDownload.do' />"
                               ,data:JSON.stringify({
                                   "repositoryUrl":$("#repositoryUrl").val()
                                   ,"patchTempFolder":$("#patchTempFolder").val()
                                   ,"srcFilePath":dataItem.srcFilePath
                                   ,"destFilePath":dataItem.destFilePath
                               })
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,error:function(jqXHR, status, error) {
                                   dataItem.set("resultMessage", error);
                                   dataItem.set("downloadStatus", "3");
                               }
                               ,success:function(data, textStatus, jqXHR) {
                                   dataItem.set("resultMessage", "Success");
                                   dataItem.set("downloadStatus", "4");
                               }
                               ,beforeSend:function(xhr){
                                   dataItem.set("resultMessage", "");
                                   dataItem.set("downloadStatus", "2");
                                   maxExecCnt++;
                                   $("#"+dataItem.id).show();
                               }
                               ,complete:function(xhr,status){
                                   maxExecCnt--;
                                   //$("#"+dataItem.id).hide();
                               }
                           });
                       }
                    });

                    if(!moreDownload){
                        downloadCompleted = true;
                        clearInterval(downloadTimer);
                    }
                }

            }, 1000);
        }
    });

    //버튼 - 업데이트 실행
    $("#btnUpdateExecute").kendoButton({
        click:function(e) {

            var downloadCompleted = true;

            //업데이트 목록 체크
            if(grid.dataSource.data().length == 0){
                return;
            }

            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dataItem.downloadStatus == "1"){
                    downloadCompleted = false;
                    //alert("The download has not bean completed!");
                    //return false;
                }
            });

            updateTimer = setInterval(function(){

                if(maxExecCnt < concurrentExecCnt){

                    var morePatch = false;
                    var patchList = grid.dataSource.data();

                    $.each(patchList, function(idx, dataItem){

                        //패치상태 체크
                        if(dataItem.patchStatus == "1"){
                            morePatch = true;
                            $.ajax({
                               url:"<c:url value='/cmm/mig/updatePatchExecute.do' />"
                               ,data:JSON.stringify({
                                   "id":dataItem.id
                                   ,"type":dataItem.type
                                   ,"patchTempFolder":$("#patchTempFolder").val()
                                   ,"destFilePath":dataItem.destFilePath
                               })
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,beforeSend:function(xhr){
                                   dataItem.set("resultMessage", "");
                                   dataItem.set("patchStatus", "2");
                                   maxExecCnt++;
                                   $("#"+dataItem.id).show();
                               }
                               ,complete:function(xhr,status){
                                   console.log(xhr);
                                   var resultData = xhr.responseJSON;

                                   //성공
                                   if(resultData.resultCode == "S"){
                                       dataItem.set("resultMessage", "Success");
                                       dataItem.set("patchStatus", "4");

                                   //실패
                                   }else{
                                       dataItem.set("resultMessage", resultData.resultMessage);
                                       dataItem.set("patchStatus", "3");
                                   }

                                   maxExecCnt--;
                                   $("#"+dataItem.id).hide();
                               }
                           });
                       }
                    });

                    if(!morePatch){
                        clearInterval(updateTimer);
                    }
                }

            }, 1000);
        }
    });

    //버튼 - 디플로이
    /*$("#btnDeploy").kendoButton({
        click:function(e) {

            var patchCompleted = true;

            //업데이트 목록 체크
            if(grid.dataSource.data().length == 0){
                return;
            }

            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dataItem.patchStatus == "1"){
                    patchCompleted = false;
                }
            });

            //업데이트 완료 체크
            if(!patchCompleted){
                alert("The install has not bean completed!");
                return false;
            }

            $.ajax({
                url:"<c:url value='/cmm/mig/updatePatchDeploy.do' />"
                ,data:JSON.stringify({
                    "webappsFolder":$("#webappsFolder").val()
                    ,"patchTempFolder":$("#patchTempFolder").val()
                    ,"patchScript":$("#patchScript").val()
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,complete:function(xhr,status){
                    alert("Completed deploy!");
                    console.log(xhr);
                }
            });

        }
    });*/

    //그리드 설정
    grid = $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-CMM-1214-173500"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/mig/selectPatchInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["repositoryUrl"] = $("#repositoryUrl").val();
                        params["patchFileName"] = $("#patchFileName").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                data:"patchItems"
                ,total:"total"
                ,model:{
                    id:"id"
                    ,fields:{
                        id:{type:"string"}
                        ,desc:{type:"string"}
                        ,type:{type:"string"}
                        ,srcFilePath:{type:"string"}
                        ,destFilePath:{type:"string"}
                        ,updateDate:{type:"string"}
                        ,downloadStatus:{type:"string"}
                        ,patchStatus:{type:"string"}
                        ,resultMessage:{type:"string"}
                    }
                }
            }

        }
        ,filterable:false
        ,indvColumnVisible:false             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false         //컬럼순서 변경 개인화 적용. default:true
        ,pageable:false
        ,selectable:false
        ,autoBind:false
        ,editable:false
        ,sortable:false
        ,columns:[
            {field:"id", title:"Id", width:120}
            ,{field:"type", title:"Type", width:60, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.type == "sql"){
                        return "<span class='txt_label bg_orange'\>SQL</span>";
                    }else if(dataItem.type == "source"){
                        return "<span class='txt_label bg_blue'\>SRC</span>";
                    }

                    return "";
                }
            }
            ,{field:"desc", title:"Description", width:500
                ,template:function(dataItem){
                    return dataItem.desc + "<span id='"+dataItem.id+"' style='display:none;'><img src='<c:url value='/resources/img/loading.gif'/>'></span>";
                }
            }
            ,{field:"downloadStatus", title:"Download", width:150, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.downloadStatus == "1"){
                        return "<span class='txt_label bg_gray'\>Ready</span>";
                    }else if(dataItem.downloadStatus == "2"){
                        return "<span class='txt_label bg_orange'\>Downloading</span>";
                    }else if(dataItem.downloadStatus == "3"){
                        return "<span class='txt_label bg_red'\>Download Fail</span>";
                    }else if(dataItem.downloadStatus == "4"){
                        return "<span class='txt_label bg_blue'\>Download Success</span>";
                    }
                }
            }
            ,{field:"patchStatus", title:"Patch", width:150, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.patchStatus == "1"){
                        return "<span class='txt_label bg_gray'\>Ready</span>";
                    }else if(dataItem.patchStatus == "2"){
                        return "<span class='txt_label bg_orange'\>Patching</span>";
                    }else if(dataItem.patchStatus == "3"){
                        return "<span class='txt_label bg_red'\>Patch Fail</span>";
                    }else if(dataItem.patchStatus == "4"){
                        return "<span class='txt_label bg_blue'\>Patch Success</span>";
                    }
                }
            }
            ,{field:"resultMessage", title:" "}
        ]
    }).data("kendoExtGrid");

    grid.dataSource.read();

    repositoryUrl.enable
});
</script>
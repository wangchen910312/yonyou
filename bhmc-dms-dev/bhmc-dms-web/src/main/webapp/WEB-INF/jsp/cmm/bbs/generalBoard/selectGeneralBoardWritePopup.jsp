<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnReply" class="btn_m btn_save"><spring:message code="global.btn.reply" /></button>
            <button id="btnCancel" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /></button>
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button>
            <button id="btnClose" class="btn_m btn_close"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <input type="hidden" id="hidNttCont" name="hidNttCont" value="" />

    <div  class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <form id="searchForm">
            <input type="hidden" id="sBbsId" name="sBbsId" value="" />
            <input type="hidden" id="sNttId" name="sNttId" value="" />
        </form>

        <form id="saveForm">
            <table>
                <tbody>
                    <tr id="trUpdtUsrId">
                        <th scope="row" style="width:10%;"><spring:message code="global.lbl.wrtrNm" /><!-- 작성자 --></th>
                        <td style="width:24%;">
                            <input type="text" id="updtUsrId" name="updtUsrId" class="form_input">
                        </td>
                        <th scope="row" style="width:10%;"><spring:message code="global.lbl.wrtrDt" /><!-- 작성 일자 --></th>
                        <td style="width:23%;">
                            <input type="text" id="updtDt" name="updtDt" class="form_input">
                        </td>
                        <th scope="row" style="width:10%;"></th>
                        <td style="width:23%;"></td>
                    </tr>
                    <tr>
                        <th scope="row" style="width:10%;"><spring:message code="global.lbl.title" /><!-- 제목 --></th>
                        <td colspan="5" style="width:90%;">
                            <input type="hidden" id="flag" name="flag" value="" />

                            <input type="hidden" id="bbsId" name="bbsId" value="" />
                            <input type="hidden" id="nttId" name="nttId" value="" />
                            <input type="hidden" id="nttRootId" name="nttRootId" value="" />
                            <input type="hidden" id="nttRefId" name="nttRefId" value="" />
                            <input type="hidden" id="repLvlVal" name="repLvlVal" value="" />
                            <input type="hidden" id="repSortOrderVal" name="repSortOrderVal" value="" />
                            <input type="hidden" id="fileDocNo" name="fileDocNo" value="" />

                            <input type="text" id="nttTitleNm" name="nttTitleNm" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th id="thNttCont" scope="row" style="width:10%;"><spring:message code="global.lbl.cont" /><!-- 내용 --></th>
                        <td colspan="5" style="width:90%;">
                            <textarea id="nttCont" name="nttCont" class="form_textarea" style="height:160px;"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
        <div class="btn_right">
            <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
            <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="fileGrid"></div>
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
         var options = parent.generalBoardPopupWin.options.content.data;

         $("#sBbsId").val(options.bbsId);
         $("#sNttId").val(options.nttId);

         $("#btnCancel").hide();
         $("#updtUsrId").prop("disabled", true);
         $("#updtDt").prop("disabled", true);

         fnPopupInit = function() {
             var searchData = "";

             searchData = $("#searchForm").serializeObject();

             $.ajax({
                 url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoardByKey.do' />"
               , data:JSON.stringify(searchData)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                   if ((options.flag == "U")) {
                       if (options.repTp == "2") {
                           $("#btnReply").show();
                       }

                       $("#flag").val("U");
                       $("#trUpdtUsrId").show();

                       if("${sessionScope.loginVO.id}" == jqXHR.updtUsrId) {
                           $("#btnSave").show();
                       }else {
                           $("#btnSave").hide();
                       }
                   }
                   else {
                       $("#flag").val("I");
                       $("#btnReply").hide();
                       $("#trUpdtUsrId").hide();
                   }

                   $("#bbsId").val(jqXHR.bbsId);
                   $("#nttId").val(jqXHR.nttId);
                   $("#nttRootId").val(jqXHR.nttRootId);
                   $("#nttRefId").val(jqXHR.nttRefId);
                   $("#repLvlVal").val(jqXHR.repLvlVal);
                   $("#repSortOrderVal").val(jqXHR.repSortOrderVal);
                   $("#nttTitleNm").val(jqXHR.nttTitleNm);
                   $("#nttCont").val(jqXHR.nttCont);
                   $("#updtUsrId").val(jqXHR.updtUsrId);
                   $("#updtDt").val(jqXHR.updtDt);
                   $("#fileDocNo").val(jqXHR.fileDocNo);
                 }
             });
         }

         fnPopupInit();

         /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 답글 버튼.
        $("#btnReply").kendoButton({
            click:function(e){
                if (confirm("<spring:message code='global.info.reply' />")) {
                    $("#flag").val("R");

                    $("#hidNttCont").val($("#nttCont").val());

                    $("#thNttCont").text("<spring:message code='global.lbl.reply' />");
                    $("#nttCont").val("");
                    $("#fileDocNo").val("");

                     var grid = $("#fileGrid").data("kendoExtGrid");
                     grid.dataSource._destroyed = [];
                     grid.dataSource.read();

                    $("#nttCont").focus();
                    $("#btnSave").show();
                    $("#btnReply").hide();
                    $("#btnCancel").show();
                }
            }
        });

         $("#btnCancel").kendoButton({
             click:function(e){
                 if (confirm("<spring:message code='global.info.cancel' />")) {
                     $("#flag").val("U");

                     $("#nttCont").val($("#hidNttCont").val());

                     $("#thNttCont").text("<spring:message code='global.lbl.cont' />");
                     $("#nttCont").focus();

                     if ("${sessionScope.loginVO.id}" == $("#updtUsrId").val()) {
                         $("#btnSave").show();
                     }
                     else {
                         $("#btnSave").hide();
                     }

                     $("#btnReply").show();
                     $("#btnCancel").hide();

                     // $('#fileGrid').data('kendoExtGrid').dataSource.page(1);
                 }
             }
         });

        // 닫기 버튼.
        $("#btnClose").kendoButton({
            click:function(e){
                parent.generalBoardPopupWin.close();
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {
                var tempUrl     = "";
                var saveData    = "";

                if ($("#flag").val() != "U") {
                    if ($("#flag").val() == "R") {
                        $("#repLvlVal").val(parseInt($("#repLvlVal").val()) + 1);
                        $("#repSortOrderVal").val(parseInt($("#repSortOrderVal").val()) + 1);
                    }

                    tempUrl = "<c:url value='/cmm/bbs/generalBoard/inertGeneralBoard.do' />";
                }
                else {
                    tempUrl = "<c:url value='/cmm/bbs/generalBoard/updateGeneralBoard.do' />";
                }

                saveData = $("#saveForm").serializeObject();

                $.ajax({
                    url:tempUrl
                  , data:JSON.stringify(saveData)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        //dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        var data = [];
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        options.callbackFunc(data);
                        parent.generalBoardPopupWin.close();
                    }
                });
            }
        });


        // 파일 그리드 시작 //
        $("#fileGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    }
                  , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["sFileDocNo"] = $("#fileDocNo").val();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        fields:{
                            fileDocNo:{type:"string"}
                            ,fileNo:{type:"number"}
                            ,fileNm:{type:"string"}
                            ,fileSize:{type:"number"}
                        }
                    }
                }
            }
           ,change:function(e){
               var dataItem = this.dataItem(this.select());

               if(dms.string.isNotEmpty(dataItem)){
                   dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
               }
           }
           ,autoBind:false
           ,editable:false
           ,height:120
           ,navigatable:false
           ,pageable:false
           ,resizable:false
           ,sortable:false
           ,columns:[
               {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
              ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
              ,{title:""}

           ]
       });
       // 파일 그리드 종료 //



        //================================ 파일 업무로 관련 스크립트
        var r = new Resumable({
            target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
            ,chunkSize:1 * 1024 * 1024
            ,simultaneousUploads:4
            ,testChunks:true
            ,throttleProgressCallbacks:1
            ,method:"octet"
        });
        r.assignBrowse($('#fileSelect')[0]);

        //파일추가 이벤트
        r.on('fileAdded', function(file) {

            $("#progressWindow").kendoWindow({
                width:"600px"
                ,height:"300px"
                ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
                ,animation:false
                ,draggable:false
                ,visible:false
                ,resizable:false
                ,modal:true
            }).data("kendoWindow").center().open();


            $('.resumable-progress, .resumable-list').show();
            $('.resumable-progress .progress-resume-link').hide();
            $('.resumable-progress .progress-pause-link').show();

            //파일목록 출력
            $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

            //업로드 시작
            r.upload();

        });
        r.on('pause', function() {
            $('.resumable-progress .progress-resume-link').show();
            $('.resumable-progress .progress-pause-link').hide();
        });
        r.on('uploadStart', function() {

            var _that = this;

            if (_that.opt["query"] == null) {
                 _that.opt["query"] = {};
            }

            if (dms.string.isEmpty($("#fileDocNo").val())) {
                $.ajax({
                    url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                    dataType:"json",
                    type:"get",
                    async:false,
                    cache:false,
                    success:function(id) {
                        _that.opt["query"]["resumableSessionId"] = id;
                        $("#fileDocNo").val(id);
                    }
                });
            } else {
                _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();
            }

            $('.resumable-progress .progress-resume-link').hide();
            $('.resumable-progress .progress-pause-link').show();
        });
        r.on('complete', function() {

            var _that = this;

            $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

            $("#progressWindow").data("kendoWindow").close();
            r.files = [];
            $(".resumable-list").html("");
        });
        r.on('fileSuccess', function(file, message) {

            var result = JSON.parse(message);
            if(result.status === "finished") {
                $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                    fileDocNo:result.fileDocNo
                    ,fileNo:result.fileNo
                    ,fileNm:result.fileNm
                    ,fileSize:dms.string.formatFileSize(result.fileSize)
                });
                //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
            }


        });
        r.on('fileError', function(file, message) {
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
        });
        r.on('fileProgress', function(file) {
            var fileProgress = 0;

            if (file instanceof ResumableChunk) {
                fileProgress = file.fileObj.progress();
            } else {
                fileProgress = file.progress();
            }

            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
            $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
        });
        //================================


         if($("#flag").val()=="U") {
             var grid = $("#fileGrid").data("kendoExtGrid");
             grid.dataSource._destroyed = [];
             grid.dataSource.read();

         }
    });
</script>
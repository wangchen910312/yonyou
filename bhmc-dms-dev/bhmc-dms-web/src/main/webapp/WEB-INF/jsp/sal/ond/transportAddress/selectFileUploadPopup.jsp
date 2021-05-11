<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
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

<section class="pop_wrap">
    <div class="header_area">
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
    //팝업옵션
    var popupWindow = parent.$("#fileUploadPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //버튼 - 파일삭제
    $("#fileDelete").kendoButton({
        click:function(e) {

            var deleteFiles = [];
            var fileGrid = $('#fileGrid').data('kendoExtGrid');
            var rows = fileGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                deleteFiles.push(fileGrid.dataItem(row));
            });

            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                ,data:JSON.stringify(deleteFiles)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(result) {
                    fileGrid.dataSource.read();
                }
            });
        }
    });

    //그리드 설정
    $("#fileGrid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-SAL-0309-181501"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sFileDocNo"] = popupOptions.fileDocNo;

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"fileNo"
                    ,fields:{
                        fileDocNo:{type:"string"}
                        ,fileNo:{type:"number"}
                        ,fileNm:{type:"string"}
                        ,fileSize:{type:"number"}
                    }
                }
            }
        }
        ,height:155
        ,pageable:false
        ,editable:false
        ,multiSelectWithCheckbox:true
        ,sortable:false
        ,columns:[
            {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"}
            ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150
                ,template:"#=dms.string.formatFileSize(fileSize)#"
            }
            ,{_field:"fileDownload", title:"", width:100                                            // 다운로드
                ,attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_yellow' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")'><spring:message code='global.btn.download' /></span>"
            }
        ]
    });


    var r = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:4
        ,testChunks:true
        ,throttleProgressCallbacks:1
        ,method:"octet"
        ,maxFiles:1
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

        if (dms.string.isEmpty(popupOptions.fileDocNo)) {
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                dataType:"json",
                type:"get",
                async:false,
                cache:false,
                success:function(id) {
                    _that.opt["query"]["resumableSessionId"] = id;
                    popupOptions.fileDocNo = id;
                }
            });
        } else {
            _that.opt["query"]["resumableSessionId"] = popupOptions.fileDocNo;
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
                ,fileSize:result.fileSize
            });

            popupOptions.callbackFunc(result.fileDocNo, result.fileNo);
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
});
</script>